<?php
class ControllerProductSlaLiveSearch extends Controller {
	public function index() {
		$json = array();
		if (isset($this->request->get['search'])) {
			$search = $this->request->get['search'];
		} else {
			$search = '';
		}
		
		$error_ver     = false;
		
		if (version_compare(VERSION, '2.2.0.0', '<')) {
			$currency_code = null;
		} elseif (version_compare(VERSION, '2.2.0.0', '>=')) {
			$currency_code = $this->session->data['currency'];
		} else {
			$error_ver = true;
			$json[] = array(
				'product_id' => 0,
				'image'      => null,
				'name'       => 'Version Error: '.VERSION,
				'description'=> null,
				'price'      => 0,
				'special'    => 0,
				'url'        => '#'
			);
		}
		$values = array(
			'sla_live_search_ajax_enable',
			'sla_live_search_information',
			'sla_live_search_category',
			'sla_live_search_manufacturer',
			'sla_live_search_show_description',
			'sla_live_search_show_price',
			'sla_live_search_show_image',
			'sla_live_search_min_length',
			'sla_live_search_description_length',
			'sla_live_search_name_length',
			'sla_live_search_image_height',
			'sla_live_search_image_width',
			'sla_live_search_limit',
			'sla_live_search_description',
			'sla_live_search_first',
			'sla_live_search_show_price',
			'sla_live_search_show_model',
			'sla_live_search_model',
			'sla_live_search_show_sku',
			'sla_live_search_sku',
			'sla_live_search_high_light',
			'config_language_id',
			'sla_live_search_heading_product',
			'sla_live_search_heading_category',
			'sla_live_search_heading_manufacturer',
			'sla_live_search_heading_information',
			'sla_live_search_empty',
			'sla_live_search_selector',
			'sla_live_search_show_count_manufacturer',
			'sla_live_search_show_count_category',
		);	
		foreach ($values as $value) {
			$data[$value] = $this->getConfig($value);
		}

		$image_width        = $data['sla_live_search_image_width'];
		$image_height       = $data['sla_live_search_image_height'];
		$name_length        = $data['sla_live_search_name_length'];
		$description_length = $data['sla_live_search_description_length'];

		$divider = 1;
		if ($data['sla_live_search_category'])     $divider++;
		if ($data['sla_live_search_manufacturer']) $divider++;
		if ($data['sla_live_search_information'])  $divider++;
		
		$limit   = $data['sla_live_search_limit'];
		$limit_p = $data['sla_live_search_limit'];

		if (!$error_ver) {
			if ($search) {
				$this->load->model('tool/image');
				$this->load->model('catalog/sla_livesearch');
				$this->load->model('catalog/product');
				
				if ($data['sla_live_search_category']) {
					$filter_data = array(
						'filter_name'         => $search,
						'filter_description'  => $data['sla_live_search_description'],
						'order'               => 'ASC',
						'start'               => 0,
						'limit'               => ceil($limit / $divider)
					);
					$data['category']['total'] = $this->model_catalog_sla_livesearch->getTotalCategories($filter_data);
					if ($data['category']['total']) {
						$results = $this->model_catalog_sla_livesearch->getCategories($filter_data);
						foreach ($results as $result) {
							if ($result['image']) {
								$image = $this->model_tool_image->resize($result['image'], $image_width, $image_height);
							} else {
								$image = $this->model_tool_image->resize('placeholder.png', $image_width, $image_height);
							}
							$name = strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'));
							if (utf8_strlen($name) > $name_length) $name =  utf8_substr($name,0,$name_length) . '&hellip;';
							if ($data['sla_live_search_show_count_category']) {
								$filter_total_all = array(
									'filter_category_id'  => $result['category_id'],
									'filter_sub_category' => true
								);
								$count_product = $this->model_catalog_product->getTotalProducts($filter_total_all);
								$name = $name . ' (' . $count_product . ')';
							}
							
							$description = strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'));
							if (utf8_strlen($description) > $description_length) $description =  utf8_substr($description,0,$description_length) . '&hellip;';
							if ($data['sla_live_search_high_light']) {
								$description = preg_replace('#(' . $search . ')#iu', '<span style="color:red">$1</span>', $description);
							}
							
							$data['category']['categories'][] = array(
								'name'        => $name,
								'image'       => $image,
								'description' => $description,
								'href' => $this->url->link('product/category','path=' . $result['path']),
							);
						}
					} else {
						$data['category']['categories'] = array();
					}
					$limit_p = $limit - $data['category']['total'];
				};

				if ($this->config->get('sla_live_search_manufacturer')) {
					$filter_data = array(
						'filter_name'         => $search,
						'filter_description'  => $data['sla_live_search_description'],
						'limit'               => ceil($limit / $divider)
					);
					$data['manufacturer']['total'] = $this->model_catalog_sla_livesearch->getTotalManufacturers($filter_data);
					if ($data['manufacturer']['total']) {
						$results = $this->model_catalog_sla_livesearch->getManufacturers($filter_data);
						foreach ($results as $result) {
							if ($result['image']) {
								$image = $this->model_tool_image->resize($result['image'], $image_width, $image_height);
							} else {
								$image = $this->model_tool_image->resize('placeholder.png', $image_width, $image_height);
							}
							$name = strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'));
							if (utf8_strlen($name) > $name_length) $name =  utf8_substr($name,0,$name_length) . '&hellip;';
							if ($data['sla_live_search_show_count_manufacturer']) {
								$filter_total_all = array(
									'filter_manufacturer_id'  => $result['manufacturer_id'],
								);
								$count_product = $this->model_catalog_product->getTotalProducts($filter_total_all);
								$name = $name . ' (' . $count_product . ')';
							}
	
							$description = strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'));
							if (utf8_strlen($description) > $description_length) $description =  utf8_substr($description,0,$description_length) . '&hellip;';
							if ($data['sla_live_search_high_light']) {
								$description = preg_replace('#(' . $search . ')#iu', '<span style="color:red">$1</span>', $description);
							}
							
							$data['manufacturer']['manufacturers'][] = array(
								'name'        => $name,
								'image'       => $image,
								'description' => $description,
								'href' => $this->url->link('product/manufacturer/info','manufacturer_id=' . $result['manufacturer_id']),
							);						
						}
						
					} else {
						$data['manufacturer']['manufacturers'] = array();
					}
					$limit_p = $limit - $data['manufacturer']['total'];
				};

				if ($this->config->get('sla_live_search_information')) {
					$filter_data = array(
						'filter_name'         => $search,
						'filter_description'  => $data['sla_live_search_description'],
						'order'               => 'ASC',
						'start'               => 0,
						'limit'               => ceil($limit / $divider)
					);
					$data['information']['total'] = $this->model_catalog_sla_livesearch->getTotalInformations($filter_data);
					if ($data['information']['total']) {
						$results = $this->model_catalog_sla_livesearch->getInformations($filter_data);
						foreach ($results as $result) {
							$name = strip_tags(html_entity_decode($result['title'], ENT_QUOTES, 'UTF-8'));
							if (utf8_strlen($name) > $name_length) $name =  utf8_substr($name,0,$name_length) . '&hellip;';

							$description = strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'));
							if (utf8_strlen($description) > $description_length) $description =  utf8_substr($description,0,$description_length) . '&hellip;';
							if ($data['sla_live_search_high_light']) {
								$description = preg_replace('#(' . $search . ')#iu', '<span style="color:red">$1</span>', $description);
							}
							
							$data['information']['informations'][] = array(
								'name' => $name,
								'description' => $description,
								'href' => $this->url->link('information/information','information_id=' . $result['information_id']),
							);						
						}
					} else {
						$data['information']['informations'] = array();
					}
					$limit_p = $limit - $data['information']['total'];
				};
				
				//$this->load->model('catalog/product');
				$filter_data = array(
					'filter_name'         => $search,
					'filter_tag'          => $search,
					'filter_description'  => $this->config->get('sla_live_search_description'),
					'filter_category_id'  => null,
					'filter_sub_category' => null,
					'sort'                => 'p.name',
					'order'               => 'ASC',
					'start'               => 0,
					'limit'               => ($limit_p<5)?5:$limit_p
				);
			
				$data['products']['total'] = $this->model_catalog_sla_livesearch->getTotalProducts($filter_data);
				if ($data['products']['total']) {
					$results            = $this->model_catalog_sla_livesearch->getProducts($filter_data);
				} else {
					$results = array();
				}
				if ($results) {
					foreach ($results as $result) {
						if ($result['image']) {
							$image = $this->model_tool_image->resize($result['image'], $image_width, $image_height);
						} else {
							$image = $this->model_tool_image->resize('placeholder.png', $image_width, $image_height);
						}
	
						if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
							$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $currency_code);
						} else {
							$price = false;
						}
	
						if ((float)$result['special']) {
							$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $currency_code);
						} else {
							$special = false;
						}
						
						$name = strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'));
						if (utf8_strlen($name) > $name_length) $name =  utf8_substr($name,0,$name_length) . '&hellip;';
						if ($data['sla_live_search_high_light']) {
							$words = explode(' ', trim(preg_replace('/\s+/', ' ', $search)));
							$name_hl = $name;
							foreach ($words as $word) {
								$name_hl = preg_replace('#(' . $word . ')#iu', '<span style="color:red">$1</span>', $name_hl);
							}
						} else {
							$name_hl = $name;
						}
	
						$description = strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'));
						$pos = utf8_strpos($description, $search);

						if ($pos !== false  && $pos > $description_length ) {
								$parts = explode ($search, $description);
								$parts[0] =  utf8_substr($parts[0],0, $description_length - (utf8_strlen($search)+2 +10));
								$parts1 = explode(' ', $parts[0]);
								array_pop($parts1);
								$new_descr = implode(' ', $parts1);
								$length2 = $description_length - utf8_strlen($new_descr);
								$description = $new_descr . '&hellip;' .
												$search . (isset($parts[1])?utf8_substr($parts[1],0, $length2):'') . '&hellip;';
						} else {
							if (utf8_strlen($description) > $description_length) 
								$description =  utf8_substr($description,0,$description_length) . '&hellip;';
						}
						
						if ($data['sla_live_search_high_light']) {
							foreach ($words as $word) {
								$description = preg_replace('#(' . $word . ')#iu', '<span style="color:red">$1</span>', $description);
							}
							$description = preg_replace('#(' . $search . ')#iu', '<span style="color:red">$1</span>', $description);
						}
	
						$data['products']['products'][] = array(
							'product_id'  => $result['product_id'],
							'image'       => $image,
							'sku'         => $result['sku'],
							'model'       => $result['model'],
							'name'        => $name,
							'name_hl'        => $name_hl,
							'description' => $description,
							'price'       => $price,
							'special'     => $special,
							'href'         => $this->url->link('product/product', 'product_id=' . $result['product_id'])
						);
					}
				} else {
					$data['products']['products'] = array();
				}
				$data['heading_product'] = isset($data['sla_live_search_heading_product'][$data['config_language_id']]['name'])?
					$data['sla_live_search_heading_product'][$data['config_language_id']]['name']:
					$this->language->get('heading_product');
				$sla_live_search_href = $this->url->link('product/search', 'search=' . $search);				
				$data['heading_product'] = sprintf(html_entity_decode($data['heading_product'], ENT_QUOTES, 'UTF-8'), $sla_live_search_href);
				
				$data['heading_category'] = isset($data['sla_live_search_heading_category'][$data['config_language_id']]['name'])?$data['sla_live_search_heading_category'][$data['config_language_id']]['name']:$this->language->get('heading_category');

				$data['heading_manufacturer'] = isset($data['sla_live_search_heading_manufacturer'][$data['config_language_id']]['name'])?$data['sla_live_search_heading_manufacturer'][$data['config_language_id']]['name']:$this->language->get('heading_manufacturer');
				
				$data['heading_information'] = isset($data['sla_live_search_heading_information'][$data['config_language_id']]['name'])?$data['sla_live_search_heading_information'][$data['config_language_id']]['name']:$this->language->get('heading_information');

				$data['text_empty'] = isset($data['sla_live_search_empty'][$data['config_language_id']]['name'])?$data['sla_live_search_empty'][$data['config_language_id']]['name']:$this->language->get('text_empty');
				
				$render_result = $this->load->view('product/sla_livesearch_result.tpl', $data);
				$this->response->setOutput($render_result);
			}
		}
	}

	public function view() {
		$data_ls['sla_live_search_ajax_enable'] = $this->config->get('sla_live_search_ajax_enable');
		$data_ls['sla_live_search_min_length']  = $this->config->get('sla_live_search_min_length');
		$data_ls['sla_live_search_selector']    = $this->config->get('sla_live_search_selector');
		if (!$data_ls['sla_live_search_selector']) {
			$data_ls['sla_live_search_selector'] = '#search input[name="search"]';
		}

		$data_ls['sla_live_search_selector'] = str_replace("\'", "'", $data_ls['sla_live_search_selector']);
		$data_ls['sla_live_search_selector'] = str_replace("'", "\'", $data_ls['sla_live_search_selector']);
		
		return $this->load->view('product/sla_livesearch', $data_ls);
	}
	
	private function getConfig($value){
		return $this->config->get($value);
	}
}
