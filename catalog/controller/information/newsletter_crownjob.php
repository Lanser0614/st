<?php
class ControllerInformationNewsletterCrownjob extends Controller {
	public function index() {
		$this->load->language('account/awesomenewsletter');
		
		$this->load->model('account/awesomenewsletter');
		
		$this->load->model('catalog/product');
		
		$this->load->model('tool/image');
		
		if($this->config->get('awesomenewsletter_crownjob_status') && $this->config->get('awesomenewsletter_crownjob_tempalte_id') && $this->config->get('awesomenewsletter_crownjob_recipient')) {
			
			$email_template_info = $this->model_account_awesomenewsletter->getEmailTemplateData($this->config->get('awesomenewsletter_crownjob_tempalte_id'));
			
			
			if(!empty($email_template_info['status'])) {
					$subscribers = array();
				if($this->config->get('awesomenewsletter_crownjob_recipient') == 'all_subcribe') {
					$subscribers = $this->getAllNewsletterSubscribers();
				}else if($this->config->get('awesomenewsletter_crownjob_recipient') == 'all_enabled_subcribe') {
					$filter_data = array(
						'filter_status'		=> '1',
					);
					$subscribers = $this->getAllNewsletterSubscribers($filter_data);
				}else if($this->config->get('awesomenewsletter_crownjob_recipient') == 'all_disabled_subcribe') {
					$filter_data = array(
						'filter_status'		=> '0',
					);
					$subscribers = $this->getAllNewsletterSubscribers($filter_data);
				}else if($this->config->get('awesomenewsletter_crownjob_recipient') == 'all_approved_subcribe') {
					$filter_data = array(
						'filter_approved'		=> '1',
					);
					$subscribers = $this->getAllNewsletterSubscribers($filter_data);
				}else if($this->config->get('awesomenewsletter_crownjob_recipient') == 'all_unapproved_subcribe') {
					$filter_data = array(
						'filter_approved'		=> '0',
					);
					$subscribers = $this->getAllNewsletterSubscribers($filter_data);
				}
				
				/*** mail starts ***/
				if(!empty($subscribers)) {
					foreach($subscribers as $subscriber) {
						/* bestsellers starts */
						$data['heading_title_products'] = $this->language->get('text_bestseller_products');
						
						$product_limit = ($this->config->get('awesomenewsletter_product_limit')) ? $this->config->get('awesomenewsletter_product_limit') : 5;
						
						$productdatas = $this->model_catalog_product->getBestSellerProducts($product_limit);
						
						$data['products'] = array();
						
						foreach ($productdatas as $product) {
							$product_info = $this->model_catalog_product->getProduct($product['product_id']);
							
							if ($product_info['image']) {
								$image = $this->model_tool_image->resize($product_info['image'], $this->config->get('awesomenewsletter_image_thumb_width'), $this->config->get('awesomenewsletter_image_thumb_height'));
							} else {
								$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('awesomenewsletter_image_thumb_width'), $this->config->get('awesomenewsletter_image_thumb_height'));
							}
							
							if (!$this->config->get('config_customer_price')) {
								$price = $this->currency->format($product_info['price'], $this->session->data['currency']);
							} else {
								$price = false;
							}

							if ((float)$product_info['special']) {
								$special = $this->currency->format($product_info['special'], $this->session->data['currency']);
							} else {
								$special = false;
							}
							
							$data['products'][] = array(
								'thumb'       => str_replace (' ', '%20', $image),
								'name'        => $product_info['name'],
								'price'       => $price,
								'special'     => $special,
								'href'        => $this->url->link('product/product', 'product_id='. $product_info['product_id']),
							);
						}
						
						if(VERSION >= '2.2.0.0') {
							$bestsellers_products_html = $this->load->view('mail/products_html', $data);
						}else{
							if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/mail/products_html.tpl')) {
								$bestsellers_products_html = $this->load->view($this->config->get('config_template') . '/template/mail/products_html.tpl', $data);
							} else {
								$bestsellers_products_html = $this->load->view('default/template/mail/products_html.tpl', $data);
							}
						}
						/* bestsellers ends */
						
						/* latest starts */
						$data['heading_title_products'] = $this->language->get('text_latest_products');
						$filter_data = array(
							'sort'  => 'p.date_added',
							'order' => 'DESC',
							'start' => 0,
							'limit' => ($this->config->get('awesomenewsletter_product_limit')) ? $this->config->get('awesomenewsletter_product_limit') : 5,
						);	
						
						$productdatas = $this->model_catalog_product->getProducts($filter_data);
						
						$data['products'] = array();
						foreach ($productdatas as $product) {
							$product_info = $this->model_catalog_product->getProduct($product['product_id']);
							if ($product_info['image']) {
								$image = $this->model_tool_image->resize($product_info['image'], $this->config->get('awesomenewsletter_image_thumb_width'), $this->config->get('awesomenewsletter_image_thumb_height'));
							} else {
								$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('awesomenewsletter_image_thumb_width'), $this->config->get('awesomenewsletter_image_thumb_height'));
							}
							
							if (!$this->config->get('config_customer_price')) {
								$price = $this->currency->format($product_info['price'], $this->session->data['currency']);
							} else {
								$price = false;
							}

							if ((float)$product_info['special']) {
								$special = $this->currency->format($product_info['special'], $this->session->data['currency']);
							} else {
								$special = false;
							}
							
							$data['products'][] = array(
								'thumb'       => str_replace (' ', '%20', $image),
								'name'        => $product_info['name'],
								'price'       => $price,
								'special'     => $special,
								'href'        => $this->url->link('product/product', 'product_id='. $product_info['product_id']),
							);
						}
						
						if(VERSION >= '2.2.0.0') {
							$latest_products_html = $this->load->view('mail/products_html', $data);
						}else{
							if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/mail/products_html.tpl')) {
								$latest_products_html = $this->load->view($this->config->get('config_template') . '/template/mail/products_html.tpl', $data);
							} else {
								$latest_products_html = $this->load->view('default/template/mail/products_html.tpl', $data);
							}
						}
						/* latest ends */
						
						/* featured starts */
						$data['heading_title_products'] = $this->language->get('text_featured_products');
						
						if(VERSION > '2.0.0.0') {
							$featuredinfos = $this->db->query("SELECT * FROM " . DB_PREFIX . "module WHERE `code` = '" . $this->db->escape('featured') . "'")->rows;
							
							$featured_products=array();
							$this->load->model('extension/module');
							
							foreach($featuredinfos as $infox){
								$setting_info = $this->model_extension_module->getModule($infox['module_id']);
								$featured_products[] = (!empty($setting_info['product']) ? $setting_info['product'] : array());
							}
							
							foreach($featured_products as $id){
								foreach($id as $id){
									$featured_product[] = $id;	
								}
							}
						}else{
							if($this->config->get('featured_product')) {
								$featured_product = explode(',', $this->config->get('featured_product'));
							}else{
								$featured_product = array();
							}
						}
						
						$featured_product_limit = ($this->config->get('awesomenewsletter_product_limit')) ? $this->config->get('awesomenewsletter_product_limit') : 5;
			
						$featured_products = array_unique($featured_product);
						$products = array_slice($featured_products, 0, 4);
						$data['products'] = array();
						foreach ($products as $product_id) {
							$product_info = $this->model_catalog_product->getProduct($product_id);
							if ($product_info['image']) {
								$image = $this->model_tool_image->resize($product_info['image'], $this->config->get('awesomenewsletter_image_thumb_width'), $this->config->get('awesomenewsletter_image_thumb_height'));
							} else {
								$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('awesomenewsletter_image_thumb_width'), $this->config->get('awesomenewsletter_image_thumb_height'));
							}
							
							if (!$this->config->get('config_customer_price')) {
								$price = $this->currency->format($product_info['price'], $this->session->data['currency']);
							} else {
								$price = false;
							}

							if ((float)$product_info['special']) {
								$special = $this->currency->format($product_info['special'], $this->session->data['currency']);
							} else {
								$special = false;
							}
							
							$data['products'][] = array(
								'thumb'       => str_replace (' ', '%20', $image),
								'name'        => $product_info['name'],
								'price'       => $price,
								'special'     => $special,
								'href'        => $this->url->link('product/product', 'product_id='. $product_info['product_id']),
							);
						}
						
						if(VERSION >= '2.2.0.0') {
							$featured_products_html = $this->load->view('mail/products_html', $data);
						}else{
							if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/mail/products_html.tpl')) {
								$featured_products_html = $this->load->view($this->config->get('config_template') . '/template/mail/products_html.tpl', $data);
							} else {
								$featured_products_html = $this->load->view('default/template/mail/products_html.tpl', $data);
							}
						}
						/* featured ends */
						
						/* special products starts */
						$data['heading_title_products'] = $this->language->get('text_special_products');
						
						$product_limit = ($this->config->get('awesomenewsletter_product_limit')) ? $this->config->get('awesomenewsletter_product_limit') : 5;
						
						$productdatas = $this->model_catalog_product->getProductSpecials($product_limit);
						$data['products'] = array();
						foreach ($productdatas as $product) {
							$product_info = $this->model_catalog_product->getProduct($product['product_id']);
							if ($product_info['image']) {
								$image = $this->model_tool_image->resize($product_info['image'], $this->config->get('awesomenewsletter_image_thumb_width'), $this->config->get('awesomenewsletter_image_thumb_height'));
							} else {
								$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('awesomenewsletter_image_thumb_width'), $this->config->get('awesomenewsletter_image_thumb_height'));
							}
							
							if (!$this->config->get('config_customer_price')) {
								$price = $this->currency->format($product_info['price'], $this->session->data['currency']);
							} else {
								$price = false;
							}

							if ((float)$product_info['special']) {
								$special = $this->currency->format($product_info['special'], $this->session->data['currency']);
							} else {
								$special = false;
							}
							
							$data['products'][] = array(
								'thumb'       => str_replace (' ', '%20', $image),
								'name'        => $product_info['name'],
								'price'       => $price,
								'special'     => $special,
								'href'        => $this->url->link('product/product', 'product_id='. $product_info['product_id']),
							);
						}
						
						if(VERSION >= '2.2.0.0') {
							$special_products_html = $this->load->view('mail/products_html', $data);
						}else{
							if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/mail/products_html.tpl')) {
								$special_products_html = $this->load->view($this->config->get('config_template') . '/template/mail/products_html.tpl', $data);
							} else {
								$special_products_html = $this->load->view('default/template/mail/products_html.tpl', $data);
							}
						}
						/* special products ends */
						
						/* selected products starts */
						$data['heading_title_products'] = $this->language->get('text_selected_products');
						if($this->config->get('awesomenewsletter_product')) {
							$productdatas = $this->config->get('awesomenewsletter_product');
							$data['products'] = array();
							foreach ($productdatas as $product) {
								$product_info = $this->model_catalog_product->getProduct($product);
								
								if ($product_info['image']) {
									$image = $this->model_tool_image->resize($product_info['image'], $this->config->get('awesomenewsletter_image_thumb_width'), $this->config->get('awesomenewsletter_image_thumb_height'));
								} else {
									$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('awesomenewsletter_image_thumb_width'), $this->config->get('awesomenewsletter_image_thumb_height'));
								}
								
								if (!$this->config->get('config_customer_price')) {
									$price = $this->currency->format($product_info['price'], $this->session->data['currency']);
								} else {
									$price = false;
								}

								if ((float)$product_info['special']) {
									$special = $this->currency->format($product_info['special'], $this->session->data['currency']);
								} else {
									$special = false;
								}
								
								$data['products'][] = array(
									'thumb'       => str_replace (' ', '%20', $image),
									'name'        => $product_info['name'],
									'price'       => $price,
									'special'     => $special,
									'href'        => $this->url->link('product/product', 'product_id='. $product_info['product_id']),
								);
							}
						}
						
						if(VERSION >= '2.2.0.0') {
							$selected_products_html = $this->load->view('mail/products_html', $data);
						}else{
							if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/mail/products_html.tpl')) {
								$selected_products_html = $this->load->view($this->config->get('config_template') . '/template/mail/products_html.tpl', $data);
							} else {
								$selected_products_html = $this->load->view('default/template/mail/products_html.tpl', $data);
							}
						}
						/* selected products ends */
						
						$find = array(
							'{name}',
							'{email}',						
							'{logo}',						
							'{store}',						
							'{bestsellers_products}',						
							'{latest_products}',						
							'{featured_products}',						
							'{special_products}',
							'{selected_products}',						
							'{unsubscribe_link}',						
							'{verify_link}',						
						);
						
						$base64_awesomenewsletter_id = base64_encode(serialize($subscriber['awesomenewsletter_id']));
						
						$replace 	= array(
							'name' 		=> $subscriber['name'],
							'email' 	=> $subscriber['email'],
							'logo'		=> '<img src="' . HTTP_SERVER . 'image/'. $this->config->get('config_logo') .'" title="'. $this->config->get('config_name') .'" alt="'. $this->config->get('config_name') .'" />',
							'store'		=> $this->config->get('config_name'),
							'bestsellers_products'		=> $bestsellers_products_html,
							'latest_products'					=> $latest_products_html,
							'featured_products'				=> $featured_products_html,
							'special_products'				=> $special_products_html,
							'selected_products'				=> $selected_products_html,
							'unsubscribe_link'				=> $this->url->link('information/verifynewsletter/unsubscribe', 'newsletter_id='. $base64_awesomenewsletter_id, 'SSL'),
							'verify_link'							=> $this->url->link('information/verifynewsletter/subscribe', 'newsletter_id='. $base64_awesomenewsletter_id, 'SSL'),
						);
						

						$subject = str_replace(array("\r\n", "\r", "\n"), '', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '', trim(str_replace($find, $replace, $email_template_info['subject']))));
						
						$message = str_replace(array("\r\n", "\r", "\n"), '', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '', trim(str_replace($find, $replace, $email_template_info['description']))));
						
						$message = html_entity_decode($message, ENT_QUOTES, 'UTF-8');
						
						$mail = new Mail();
						$mail->protocol = $this->config->get('config_mail_protocol');
						$mail->parameter = $this->config->get('config_mail_parameter');
						$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
						$mail->smtp_username = $this->config->get('config_mail_smtp_username');
						$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
						$mail->smtp_port = $this->config->get('config_mail_smtp_port');
						$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
							
						$mail->setTo($subscriber['email']);
						$mail->setFrom($this->config->get('config_email'));
						$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
						$mail->setSubject($subject);
						$mail->setHtml($message);
						$mail->send();
					}
				}
				/*** mail ends ***/
				
			}
		}
	}
	
	public function getAllNewsletterSubscribers($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "awesomenewsletter WHERE awesomenewsletter_id > 0";
		
		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND status = '" . (int)$data['filter_status'] . "'";
		}
		
		if (isset($data['filter_approved']) && !is_null($data['filter_approved'])) {
			$sql .= " AND approved = '" . (int)$data['filter_approved'] . "'";
		}
		
		$sql .= " ORDER BY date_added DESC";
		
		$query = $this->db->query($sql);
		
		return $query->rows;
	}
}