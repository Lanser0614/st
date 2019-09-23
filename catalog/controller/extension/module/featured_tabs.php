<?php
class ControllerExtensionModuleFeaturedtabs extends Controller {
public function index() {

	$this->load->model('catalog/product');
	$this->load->model('tool/image');


	$data['button_cart'] = $this->language->get('button_cart');
	$data['button_wishlist'] = $this->language->get('button_wishlist');
	$data['button_compare'] = $this->language->get('button_compare');
	$data['button_more'] = $this->language->get('button_more');
	$data['button_quickview'] = $this->language->get('button_quickview');


	$data['products'] = array();


	$my_modules = $this->getModules();
   
	foreach ($my_modules as $setting) { if (!empty($setting['product'])) {

        $products = array();
		
		if (!$setting['limit']) $setting['limit'] = 4;
		
		$products_id = array_slice($setting['product'], 0, (int)$setting['limit']);

		foreach ($products_id as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);

			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

				
				$products[] = array(
					'product_id'  => $product_info['product_id'],
					'thumb'       => $image,
					'name'        => $product_info['name'],
					//'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					//'stock'       => ($result['quantity'] <= 0 ? '<span class="nostock">'.$result['stock_status'].'</span>' : '<span class="instock">'.$this->language->get('text_instock').'</span>'),
					'stock' => '<span class="'.($product_info['stock_status_id'] == 7 ? 'instock' : 'nostock').'">'.$product_info['stock_status'].'</span>',
					'minimum'     => ($product_info['minimum'] > 0) ? $product_info['minimum'] : 1,
					'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
				);
			}
		}
			
			
		$data['products'][] = array(
		   'title' => $setting['name'],
		   'products' => $products
		);
			
	}}
	 
	 
	if ($data['products']) {
		return $this->load->view('extension/module/featured_tabs', $data);
	}
}
	
	
	
	
public function getModules() {
		
	$my_modules = array();
		
	$modules_id = $this->db->query("SELECT setting FROM " . DB_PREFIX . "module WHERE code = 'featured_tabs'");

	foreach ($modules_id->rows as $m) {
		$my_modules[] = json_decode($m['setting'], true);
	}

	return $my_modules;	
}		
	
	
}