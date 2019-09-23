<?php
class ModelAccountAwesomenewsletter extends Model {
	
	public function	addawesomenewsletter($data) {
		$sql = "INSERT INTO ".DB_PREFIX."awesomenewsletter SET email = '". $this->db->escape($data['email']) ."',	date_added = NOW(), date_modified = NOW(), ip = '". $this->db->escape($this->request->server['REMOTE_ADDR']) ."'";
		
		if(isset($data['name'])) {
			$sql .=", name = '".$this->db->escape($data['name'])."'";	
		}
		
		$this->db->query($sql);
		
		$awesomenewsletter_id = $this->db->getLastId();
		
		/* Send For Verify Email Starts */
		if($this->config->get('awesomenewsletter_verify_template_id')) {
			$email_template_id = $this->config->get('awesomenewsletter_verify_template_id');
		}else{
			$email_template_id = '';
		}
		
		$email_template_info = $this->getEmailTemplateData($email_template_id);
		if($email_template_info) {
			$this->load->model('catalog/product');
			
			$this->load->model('tool/image');
			
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
			$products = array_slice($featured_products, 0, $featured_product_limit);
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
				'{verify_link}',						
				'{unsubscribe_link}',						
				'{logo}',						
				'{store}',
				'{bestsellers_products}',
				'{latest_products}',
				'{featured_products}',
				'{special_products}',
				'{selected_products}',
			);
				
			$base64_awesomenewsletter_id = base64_encode(serialize($awesomenewsletter_id));
				
			$replace 	= array(
				'name' 		=> isset($data['name']) ? $data['name'] : '',
				'email' 	=> $data['email'],
				'verify_link'	=> $this->url->link('information/verifynewsletter/subscribe', 'newsletter_id='. $base64_awesomenewsletter_id, 'SSL'),
				'unsubscribe_link'	=> $this->url->link('information/verifynewsletter/unsubscribe', 'newsletter_id='. $base64_awesomenewsletter_id, 'SSL'),
				'logo'		=> '<img src="' . HTTP_SERVER . 'image/'. $this->config->get('config_logo') .'" title="'. $this->config->get('config_name') .'" alt="'. $this->config->get('config_name') .'" />',
				'store'		=> $this->config->get('config_name'),
				'bestsellers_products'		=> $bestsellers_products_html,
				'latest_products'					=> $latest_products_html,
				'featured_products'				=> $featured_products_html,
				'special_products'				=> $special_products_html,
				'selected_products'				=> $selected_products_html,
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
				
			$mail->setTo($data['email']);
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject($subject);
			$mail->setHtml($message);
			$mail->send();
		}
		/* Send For Verify Email Ends */
	}
	
	public function getTotalByEmail($email){
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "awesomenewsletter WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row['total'];
	}
	
	public function getEmailTemplateData($email_template_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "email_template et LEFT JOIN " . DB_PREFIX . "email_template_description etd ON (et.email_template_id = etd.email_template_id) WHERE et.email_template_id = '" . (int)$email_template_id . "' AND etd.language_id = '". (int)$this->config->get('config_language_id') ."' AND et.status = '1'");

		return $query->row;
	}
	
	public function getAwesomeNewsletter($awesomenewsletter_id){
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "awesomenewsletter WHERE awesomenewsletter_id = '" . (int)$awesomenewsletter_id . "'");

		return $query->row;
	}
	
	public function updateAwesomeNewsletter($awesomenewsletter_id, $status = 0) {
		$this->db->query("UPDATE " . DB_PREFIX . "awesomenewsletter SET status = '". (int)$status ."', approved = '". (int)$status ."', date_modified = NOW() WHERE awesomenewsletter_id = '" . (int)$awesomenewsletter_id . "'");
	}
}