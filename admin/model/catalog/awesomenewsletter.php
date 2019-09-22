<?php
class ModelCatalogAwesomenewsletter extends Model {
	public function CreateTables() {
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "awesomenewsletter` ( `awesomenewsletter_id` int(11) NOT NULL AUTO_INCREMENT, `name` varchar(32) NOT NULL, `email` varchar(96) NOT NULL, `status` tinyint(4) NOT NULL, `approved` tinyint(4) NOT NULL, `ip` varchar(40) NOT NULL, `date_added` datetime NOT NULL, `date_modified` datetime NOT NULL, PRIMARY KEY (`awesomenewsletter_id`) ) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24");

		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "email_template` ( `email_template_id` int(11) NOT NULL AUTO_INCREMENT, `sort_order` int(3) NOT NULL DEFAULT '0', `status` tinyint(1) NOT NULL DEFAULT '1', PRIMARY KEY (`email_template_id`) ) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7");

		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "email_template_description` ( `email_template_id` int(11) NOT NULL, `language_id` int(11) NOT NULL, `title` varchar(64) NOT NULL, `subject` varchar(255) NOT NULL, `description` text NOT NULL, PRIMARY KEY (`email_template_id`,`language_id`) ) ENGINE=MyISAM DEFAULT CHARSET=utf8");
	}
	
	
	public function getNewsletterSubscribers($data = array()){
		$sql = "SELECT * FROM " . DB_PREFIX . "awesomenewsletter a WHERE awesomenewsletter_id > 0";
		
		if (!empty($data['filter_email'])) {
			$sql .= " AND email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
		}
		
		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND status = '" . (int)$data['filter_status'] . "'";
		}
		
		if (isset($data['filter_approved']) && !is_null($data['filter_approved'])) {
			$sql .= " AND approved = '" . (int)$data['filter_approved'] . "'";
		}
		
		$sort_data = array(
			'name',
			'email',
			'status',
			'approved',
			'ip',
			'date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY date_added";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
		
		$query = $this->db->query($sql);
		
		return $query->rows;
	}
	
	public function getTotalNewsletterSubscribers($data = array()) {
		$sql = "SELECT COUNT(*) as total FROM " . DB_PREFIX . "awesomenewsletter WHERE awesomenewsletter_id > 0";
		
		if (!empty($data['filter_email'])) {
			$sql .= " AND email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
		}
		
		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND status = '" . (int)$data['filter_status'] . "'";
		}
		
		if (isset($data['filter_approved']) && !is_null($data['filter_approved'])) {
			$sql .= " AND approved = '" . (int)$data['filter_approved'] . "'";
		}
		
		$query = $this->db->query($sql);
		
		return $query->row['total'];
	}
	
	public function deleteSubscribers($awesomenewsletter_id) {
		$sql = "DELETE FROM " . DB_PREFIX . "awesomenewsletter WHERE awesomenewsletter_id = '". (int)$awesomenewsletter_id ."'";
		
		$query = $this->db->query($sql);
		
	}
	
	public function getAwesomenewsletter($awesomenewsletter_id) {
		$sql = "SELECT * FROM " . DB_PREFIX . "awesomenewsletter WHERE awesomenewsletter_id = '". (int)$awesomenewsletter_id ."'";
		
		$query = $this->db->query($sql);
		
		return $query->row;
	}
	
	public function editSubscribers($data, $awesomenewsletter_id) {
		$this->db->query("UPDATE " . DB_PREFIX . "awesomenewsletter SET status = '". (int)$data['status'] ."', approved = '". (int)$data['approved'] ."' WHERE awesomenewsletter_id = '". (int)$awesomenewsletter_id ."'");
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
	
	public function SendEmail($data) {
		$this->load->language('module/awesomenewsletter');
		
		$this->load->model('catalog/email_template');
		
		$this->load->model('catalog/product');
		
		$this->load->model('tool/image');
		
		$email_template_info = $this->model_catalog_email_template->getEmailTemplateData($data['email_template_id']);
		
		if(!empty($email_template_info['status']) && !empty($data['recipient_type'])) {
			$subscribers = array();
			if($data['recipient_type'] == 'all_subcribe') {
				$subscribers = $this->getAllNewsletterSubscribers();
			}else if($data['recipient_type'] == 'all_enabled_subcribe') {
				$filter_data = array(
					'filter_status'		=> '1',
				);
				$subscribers = $this->getAllNewsletterSubscribers($filter_data);
			}else if($data['recipient_type'] == 'all_disabled_subcribe') {
				$filter_data = array(
					'filter_status'		=> '0',
				);
				$subscribers = $this->getAllNewsletterSubscribers($filter_data);
			}else if($data['recipient_type'] == 'all_approved_subcribe') {
				$filter_data = array(
					'filter_approved'		=> '1',
				);
				$subscribers = $this->getAllNewsletterSubscribers($filter_data);
			}else if($data['recipient_type'] == 'all_unapproved_subcribe') {
				$filter_data = array(
					'filter_approved'		=> '0',
				);
				$subscribers = $this->getAllNewsletterSubscribers($filter_data);
			}else if($data['recipient_type'] == 'selected_subcribe') {
				$subscribers = array();
				
				if(!empty($data['recipient_email'])) {
					foreach($data['recipient_email'] as $awesomenewsletter_id) {
						$subscriber_info = $this->getAwesomenewsletter($awesomenewsletter_id);
						if($subscriber_info) {
							$subscribers[] = $subscriber_info;
						}
					}
				}
			}
			
			
			/*** mail starts ***/
			if(!empty($subscribers)) {
				foreach($subscribers as $subscriber) {
					/* bestsellers starts */
					$data['heading_title_products'] = $this->language->get('text_bestseller_products');
					
					$product_limit = ($this->config->get('awesomenewsletter_product_limit')) ? $this->config->get('awesomenewsletter_product_limit') : 5;
					
					$productdatas = $this->getBestSellerProducts($product_limit);
					
					$data['products'] = array();
					
					foreach ($productdatas as $product) {
						$product_info = $this->getProduct($product['product_id']);
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
							'href'        => HTTP_CATALOG . 'index.php?route=product/product&product_id=' . $product_info['product_id'],
						);
					}
					
					$bestsellers_products_html = $this->load->view('mail/products_html.tpl', $data);
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
						$product_info = $this->getProduct($product['product_id']);
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
							'href'        => HTTP_CATALOG . 'index.php?route=product/product&product_id=' . $product_info['product_id'],
						);
					}
					
					$latest_products_html = $this->load->view('mail/products_html.tpl', $data);
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
					
					$product_limit = ($this->config->get('awesomenewsletter_product_limit')) ? $this->config->get('awesomenewsletter_product_limit') : 5;
					$products = array_slice($featured_products, 0, $product_limit);
					
					$data['products'] = array();
					foreach ($products as $product_id) {
						$product_info = $this->getProduct($product_id);
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
							'href'        => HTTP_CATALOG . 'index.php?route=product/product&product_id=' . $product_info['product_id'],
						);
					}
					
					$featured_products_html = $this->load->view('mail/products_html.tpl', $data);
					/* featured ends */
					
					/* special products starts */
					$data['heading_title_products'] = $this->language->get('text_special_products');
					
					$product_limit = ($this->config->get('awesomenewsletter_product_limit')) ? $this->config->get('awesomenewsletter_product_limit') : 5;
					
					$productdatas = $this->getProductSpecials($product_limit);
					$data['products'] = array();
					foreach ($productdatas as $product) {
						$product_info = $this->getProduct($product['product_id']);
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
							'href'        => HTTP_CATALOG . 'index.php?route=product/product&product_id=' . $product_info['product_id'],
						);
					}
					
					$special_products_html = $this->load->view('mail/products_html.tpl', $data);
					/* special products ends */
					
					/* selected products starts */
					$data['heading_title_products'] = $this->language->get('text_selected_products');
					if($this->config->get('awesomenewsletter_product')) {
						$productdatas = $this->config->get('awesomenewsletter_product');
						$data['products'] = array();
						foreach ($productdatas as $product) {
							$product_info = $this->getProduct($product);
							
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
								'href'        => HTTP_CATALOG . 'index.php?route=product/product&product_id=' . $product_info['product_id'],
							);
						}
					}
					
					$selected_products_html = $this->load->view('mail/products_html.tpl', $data);
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
						'logo'		=> '<img src="' . HTTP_CATALOG . 'image/'. $this->config->get('config_logo') .'" title="'. $this->config->get('config_name') .'" alt="'. $this->config->get('config_name') .'" />',
						'store'		=> $this->config->get('config_name'),
						'bestsellers_products'		=> $bestsellers_products_html,
						'latest_products'					=> $latest_products_html,
						'featured_products'				=> $featured_products_html,
						'special_products'				=> $special_products_html,
						'selected_products'				=> $selected_products_html,
						'unsubscribe_link'				=> HTTP_CATALOG .'index.php?route=information/verifynewsletter/unsubscribe&newsletter_id='. $base64_awesomenewsletter_id,
						'verify_link'							=> HTTP_CATALOG .'index.php?route=information/verifynewsletter/subscribe&newsletter_id='. $base64_awesomenewsletter_id,
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
	
	public function getProductSpecials($data = array()) {
		$sql = "SELECT DISTINCT ps.product_id, (SELECT AVG(rating) FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = ps.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating FROM " . DB_PREFIX . "product_special ps LEFT JOIN " . DB_PREFIX . "product p ON (ps.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND ps.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) GROUP BY ps.product_id";

		$sort_data = array(
			'pd.name',
			'p.model',
			'ps.price',
			'rating',
			'p.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			if ($data['sort'] == 'pd.name' || $data['sort'] == 'p.model') {
				$sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
			} else {
				$sql .= " ORDER BY " . $data['sort'];
			}
		} else {
			$sql .= " ORDER BY p.sort_order";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC, LCASE(pd.name) DESC";
		} else {
			$sql .= " ASC, LCASE(pd.name) ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$product_data = array();

		$query = $this->db->query($sql);

		foreach ($query->rows as $result) {
			$product_data[$result['product_id']] = $this->getProduct($result['product_id']);
		}

		return $product_data;
	}
	
	public function getBestSellerProducts($limit) {

		$product_data = array();

		$query = $this->db->query("SELECT op.product_id, SUM(op.quantity) AS total FROM " . DB_PREFIX . "order_product op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id) LEFT JOIN `" . DB_PREFIX . "product` p ON (op.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE o.order_status_id > '0' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' GROUP BY op.product_id ORDER BY total DESC LIMIT " . (int)$limit);

		foreach ($query->rows as $result) {
			$product_data[$result['product_id']] = $this->getProduct($result['product_id']);
		}

		return $product_data;
	}
	
	public function getProduct($product_id) {
		$query = $this->db->query("SELECT DISTINCT *, pd.name AS name, p.image, m.name AS manufacturer, (SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, (SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special, (SELECT points FROM " . DB_PREFIX . "product_reward pr WHERE pr.product_id = p.product_id AND customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "') AS reward, (SELECT ss.name FROM " . DB_PREFIX . "stock_status ss WHERE ss.stock_status_id = p.stock_status_id AND ss.language_id = '" . (int)$this->config->get('config_language_id') . "') AS stock_status, (SELECT wcd.unit FROM " . DB_PREFIX . "weight_class_description wcd WHERE p.weight_class_id = wcd.weight_class_id AND wcd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS weight_class, (SELECT lcd.unit FROM " . DB_PREFIX . "length_class_description lcd WHERE p.length_class_id = lcd.length_class_id AND lcd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS length_class, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating, (SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review r2 WHERE r2.product_id = p.product_id AND r2.status = '1' GROUP BY r2.product_id) AS reviews, p.sort_order FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) LEFT JOIN " . DB_PREFIX . "manufacturer m ON (p.manufacturer_id = m.manufacturer_id) WHERE p.product_id = '" . (int)$product_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");

		if ($query->num_rows) {
			return array(
				'product_id'       => $query->row['product_id'],
				'name'             => $query->row['name'],
				'description'      => $query->row['description'],
				'meta_title'       => $query->row['meta_title'],
				'meta_description' => $query->row['meta_description'],
				'meta_keyword'     => $query->row['meta_keyword'],
				'tag'              => $query->row['tag'],
				'model'            => $query->row['model'],
				'sku'              => $query->row['sku'],
				'upc'              => $query->row['upc'],
				'ean'              => $query->row['ean'],
				'jan'              => $query->row['jan'],
				'isbn'             => $query->row['isbn'],
				'mpn'              => $query->row['mpn'],
				'location'         => $query->row['location'],
				'quantity'         => $query->row['quantity'],
				'stock_status'     => $query->row['stock_status'],
				'image'            => $query->row['image'],
				'manufacturer_id'  => $query->row['manufacturer_id'],
				'manufacturer'     => $query->row['manufacturer'],
				'price'            => ($query->row['discount'] ? $query->row['discount'] : $query->row['price']),
				'special'          => $query->row['special'],
				'reward'           => $query->row['reward'],
				'points'           => $query->row['points'],
				'tax_class_id'     => $query->row['tax_class_id'],
				'date_available'   => $query->row['date_available'],
				'weight'           => $query->row['weight'],
				'weight_class_id'  => $query->row['weight_class_id'],
				'length'           => $query->row['length'],
				'width'            => $query->row['width'],
				'height'           => $query->row['height'],
				'length_class_id'  => $query->row['length_class_id'],
				'subtract'         => $query->row['subtract'],
				'rating'           => round($query->row['rating']),
				'reviews'          => $query->row['reviews'] ? $query->row['reviews'] : 0,
				'minimum'          => $query->row['minimum'],
				'sort_order'       => $query->row['sort_order'],
				'status'           => $query->row['status'],
				'date_added'       => $query->row['date_added'],
				'date_modified'    => $query->row['date_modified'],
				'viewed'           => $query->row['viewed']
			);
		} else {
			return false;
		}
	}
	
	public function editSubscribersApprove($awesomenewsletter_id) {
		$this->db->query("UPDATE " . DB_PREFIX . "awesomenewsletter SET approved = '1' WHERE awesomenewsletter_id = '". (int)$awesomenewsletter_id ."'");
	}
	
	//21-10-2016
	public function getTotalByEmail($email){
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "awesomenewsletter WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row['total'];
	}
	
	public function getCustomerTotalByEmail($email){
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row['total'];
	}
	
	public function addawesomenewsletter($data){
		$sql = "INSERT INTO ".DB_PREFIX."awesomenewsletter SET email = '". $this->db->escape($data['email']) ."',	date_added = '".$this->db->escape($data['date_added'])."', date_modified = '".$this->db->escape($data['date_added'])."', ip = '". $this->db->escape($data['ip']) ."'";
		
		if(isset($data['name'])) {
			$sql .=",name = '".$this->db->escape($data['name'])."'";	
		}
		
		if(isset($data['status'])) {
			$sql .=",status = '".$this->db->escape($data['status'])."'";	
		}
		
		if(isset($data['approved'])) {
			$sql .=",approved = '".$this->db->escape($data['approved'])."'";	
		}
		
		$this->db->query($sql);
	}
	
	public function getCustomers($data = array()) {
		$sql = "SELECT *, CONCAT(c.firstname, ' ', c.lastname) AS name, cgd.name AS customer_group FROM " . DB_PREFIX . "customer c LEFT JOIN " . DB_PREFIX . "customer_group_description cgd ON (c.customer_group_id = cgd.customer_group_id) WHERE cgd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		$implode = array();

		if (!empty($data['filter_name'])) {
			$implode[] = "CONCAT(c.firstname, ' ', c.lastname) LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_email'])) {
			$implode[] = "c.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
		}

		$implode[] = "c.newsletter = 1";
		
		if (!empty($data['filter_customer_group_id'])) {
			$implode[] = "c.customer_group_id = '" . (int)$data['filter_customer_group_id'] . "'";
		}

		if (!empty($data['filter_ip'])) {
			$implode[] = "c.customer_id IN (SELECT customer_id FROM " . DB_PREFIX . "customer_ip WHERE ip = '" . $this->db->escape($data['filter_ip']) . "')";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$implode[] = "c.status = '" . (int)$data['filter_status'] . "'";
		}

		if (isset($data['filter_approved']) && !is_null($data['filter_approved'])) {
			$implode[] = "c.approved = '" . (int)$data['filter_approved'] . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(c.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if ($implode) {
			$sql .= " AND " . implode(" AND ", $implode);
		}

		$sort_data = array(
			'name',
			'c.email',
			'customer_group',
			'c.status',
			'c.approved',
			'c.ip',
			'c.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}
}