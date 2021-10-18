<?php
class ControllerCommonFooter extends Controller {
	public function index() {

        // start: OCdevWizard SMNBPP
        $this->load->model('extension/ocdevwizard/ocdevwizard_setting');

        $smnbpp_form_data = $this->model_extension_ocdevwizard_ocdevwizard_setting->getSettingData('smart_notification_bar_pro_plus_form_data', (int)$this->config->get('config_store_id'));

        if (isset($smnbpp_form_data['activate']) && $smnbpp_form_data['activate']) {
          $this->load->model('extension/ocdevwizard/smart_notification_bar_pro_plus');

          $this->document->addStyle("catalog/view/theme/default/stylesheet/ocdevwizard/smart_notification_bar_pro_plus/stylesheet.css?v=".$smnbpp_form_data['front_module_version']);

          $language_id = $this->model_extension_ocdevwizard_smart_notification_bar_pro_plus->getLanguageByCode($this->session->data['language']);
          
          if (isset($smnbpp_form_data['direction_type'][$language_id]) && $smnbpp_form_data['direction_type'][$language_id] == '2') {
            $this->document->addStyle("catalog/view/theme/default/stylesheet/ocdevwizard/smart_notification_bar_pro_plus/stylesheet_rtl.css?v=".$smnbpp_form_data['front_module_version']);
          }

          $data['smart_notification_bar_pro_plus'] = $this->load->controller('extension/ocdevwizard/smart_notification_bar_pro_plus');
        } else {
          $data['smart_notification_bar_pro_plus'] = '';
        }
        // end: OCdevWizard SMNBPP
      
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');


		$this->load->model('catalog/information');
		$data['informations1'] = array();
		$data['informations2'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations1'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			} else {
			  $data['informations2'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
		}
		}
		


		$this->load->model('blog/blog_category');
		$categories_1 = $this->model_blog_blog_category->getBlogCategories(0);
		
		$data['categories_blog'] = array();
		
		foreach ($categories_1 as $category_1) {
			$data['categories_blog'][] = array(
				'name'     => $category_1['name'],				
				'href'     => $this->url->link('blog/category', 'blogpath=' . $category_1['blog_category_id'])
			);
		}



		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);
    
		$data['phone'] = html_entity_decode(nl2br($this->config->get('config_telephone')));
		$data['open'] = $this->config->get('config_open');
		$data['email'] = $this->config->get('config_fax');
		$data['address'] = $this->config->get('config_address');
		$data['comment'] = html_entity_decode($this->config->get('config_comment'));
		$data['powered'] =  date('Y').' '. $this->config->get('config_name');
    
		
		
		if($this->config->get('awesomenewsletter_status') && $this->config->get('awesomenewsletter_footer_status')) {
			$data['newsletters'] = $this->load->controller('extension/module/awesomenewsletter/footer');
		}else{
			$data['newsletters']  = ''; 
		}
		
		
		$data['sla_live_search'] = $this->load->controller('product/sla_live_search/view');
		
		
		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}

		return $this->load->view('common/footer', $data);
	}
}
