<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		// Analytics
		$this->load->model('extension/extension');
    
		$this->load->model('tool/image');
		
		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');
		$data['og_url'] = (isset($this->request->server['HTTPS']) ? HTTPS_SERVER : HTTP_SERVER) . substr($this->request->server['REQUEST_URI'], 1, (strlen($this->request->server['REQUEST_URI'])-1));
		$data['og_image'] = $this->document->getOgImage();
		
		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}
		
		//$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));


		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_search'] = $this->language->get('text_search');
		$data['text_page'] = $this->language->get('text_page');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_contact'] = $this->language->get('text_contact');
		

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		//$data['compare'] = $this->url->link('product/compare', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['contact'] = $this->url->link('information/contact');
		
		//$data['phone'] = html_entity_decode(nl2br($this->config->get('config_telephone')));
		$data['open'] = $this->config->get('config_open');
		$data['email'] = $this->config->get('config_fax');
		$data['address'] = $this->config->get('config_address');
		$data['comment'] = html_entity_decode($this->config->get('config_comment'));
    
		$data['phones'] = array();
    $data['phones'] = explode("\n", trim($this->config->get('config_telephone')));
		
		
		$this->load->model('catalog/information');
		$data['informations'] = array();
       
		foreach ($this->model_catalog_information->getInformations() as $result) {
	      
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}
		
		
		
		// Menu
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}
		
		$this->load->model('catalog/category');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getTopCategories(0);

		foreach ($categories as $category) {
				$children_data = array();
				$children = $this->model_catalog_category->getTopCategories($category['category_id']);

				foreach ($children as $child) {
					$children_data[] = array(
						'name'  => $child['name'],
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'thumb' => $this->model_tool_image->resize(($category['image'] ? $category['image'] : 'placeholder.png'), 180, 180),
					'children' => $children_data,
					//'column'   => $category['column'] ? $category['column'] : 1,
					'active'   => (in_array($category['category_id'], $parts) ? ' class="active"' : ''),
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
		}

		//$data['language'] = $this->load->controller('common/language');
		//$data['currency'] = $this->load->controller('common/currency');
		$data['cart'] = $this->load->controller('common/cart');



		return $this->load->view('common/header', $data);
	}
}
