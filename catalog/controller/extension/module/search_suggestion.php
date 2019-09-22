<?php

class ControllerExtensionModuleSearchSuggestion extends Controller {

	public function index() {

		$this->id = 'search_suggestion';

		$this->document->addScript('catalog/view/javascript/search_suggestion.js');
		
		$this->document->addStyle('catalog/view/javascript/jquery/ui/jquery-ui.css');
		$this->document->addScript('catalog/view/javascript/jquery/ui/jquery-ui.js');

		$options = $this->config->get('search_suggestion_options');
		$css = $options['search_css'];
		foreach ($options['search_field'] as $field_name => $field_options ) {
			if (isset($field_options['css']) && $field_options['css']) {
				$css .= '.ui-autocomplete .' . $field_name . ' {' . PHP_EOL . $field_options['css'] . PHP_EOL .  '} ' . PHP_EOL;
			}
		}
		$data['css'] = $css;

    return $this->load->view('extension/module/search_suggestion', $data);		
	}
	
	public function ajax() {

		$this->language->load('extension/module/search_suggestion');

		$json = array();
		$data['products'] = array();

		if (isset($this->request->get['keyword'])) {

			$options = $this->config->get('search_suggestion_options');

			$this->load->model('catalog/search_suggestion');
			$this->load->model('catalog/attributes_to_text');

			if (isset($options['search_where']['name'])) {
				$data_search['filter_name'] = $this->request->get['keyword'];
			}
			if (isset($options['search_where']['tags'])) {
				$data_search['filter_tag'] = $this->request->get['keyword'];
			}
			if (isset($options['search_where']['description'])) {
				$data_search['filter_description'] = $this->request->get['keyword'];
			}
			if (isset($options['search_where']['model'])) {
				$data_search['filter_model'] = $this->request->get['keyword'];
			}
			if (isset($options['search_where']['sku'])) {
				$data_search['filter_sku'] = $this->request->get['keyword'];
			}
			if (isset($options['search_order'])) {
				if ($options['search_order'] == 'rating') {
					$data_search['sort'] = 'rating';
				} else if ($options['search_order'] == 'name') {
					$data_search['sort'] = 'pd.name';
				} else if ($options['search_order'] == 'relevance') {
					$data_search['sort'] = 'relevance';
				}
			}
			if (isset($options['search_order_dir'])) {
				if ($options['search_order_dir'] == 'asc') {
					$data_search['order'] = 'ASC';
				} else if ($options['search_order_dir'] == 'desc') {
					$data_search['order'] = 'DESC';
				}
			}
			if (isset($options['search_limit'])) {
				$data_search['limit'] = $options['search_limit'];
			}
			$data_search['start'] = 0;

			$search_model = 'model_catalog_search_suggestion';

			// if sort is by relevance and module "search with morphology and relevance" exists 
			if ($data_search['sort'] == 'relevance' && $this->config->get('search_mr_options')) {
				$this->load->model('catalog/search_mr');
				$data_search['search_mr_options'] = $this->config->get('search_mr_options');
				// for relevance use DESC order
				$data_search['order'] = 'DESC';
				$search_model = 'model_catalog_search_mr';
			}

			$results = $this->$search_model->getProducts($data_search);

			$product_total = $this->$search_model->getTotalProducts($data_search);

			if ($product_total) {
				$this->load->model('tool/image');
				
				foreach ($results as $result) {
					
					$fields = array();
					foreach ($options['search_field'] as $field_name => $field_options ) {
						
						$fields[$field_name] = '';
						if (isset($field_options['show'])) {
							$fields[$field_name] = array( 
								'location' => $field_options['location'],
								'sort' => $field_options['sort'],
								'label' => array (
									'show' => isset($field_options['show_field_name']) ? $field_options['show_field_name'] : 0,
									'label' => $this->language->get($field_name)
								)	
							);

							if ($field_name == 'image') {
								if ($field_options['width'] && $field_options['height']) {
									$width = $field_options['width'];
									$height = $field_options['height'];
								} else {
									$width = $this->config->get('config_image_product_width');
									$height = $this->config->get('config_image_product_height');
								}
								$text =  $this->model_tool_image->resize($result['image'], $width, $height);
							} elseif ($field_name == 'price') {
								$text = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
								if ((float) $result['special']) {
									$fields[$field_name]['special'] = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
								}
							} elseif ($field_name == 'description') {
								$text = trim(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')));
								$cut = isset($field_options['cut']) ? $field_options['cut'] : 100;
								$dots = strlen($text) > $cut ? '..' : '';
								$text = utf8_substr($text, 0, $cut) . $dots;
							} elseif ($field_name == 'attributes') {
								$text = $this->model_catalog_attributes_to_text->getText($result['product_id'], $field_options);
							} elseif ($field_name == 'rating') {
								$text = 'catalog/view/theme/default/image/stars-' . (int)$result[$field_name] . '.png';
							} else {
								$text = htmlspecialchars_decode($result[$field_name]);
							}
							
							$fields[$field_name][$field_name] = $text;
						}
					}
					
					$data['products'][] = array(
						'fields' => $fields,
						'href' => str_replace('&amp;', '&', $this->url->link('product/product', 'product_id=' . $result['product_id']))
					);
				}
			}
		}

		if (empty($data['products'])) {
			$data['products'][] = array(
				'fields' => array( 
					'no_results' => array( 
						'no_results' => $this->language->get('text_no_result')
					),
				),
				'href' => ''
			);
		} else if ($product_total > count($data['products'])) {
			$remainder_cnt = $product_total - count($data['products']);
			if ($remainder_cnt > 0) {
				$data['products'][] = array(
					'fields' => array( 
						'more' => array( 
							'more' => $remainder_cnt . $this->language->get('more_results')
						),
					),
					'href' => str_replace('&amp;', '&', $this->url->link('product/search', 'search=' . $this->request->get['keyword']))
				);
			}
		}

		$this->response->setOutput(json_encode($data['products']));
	}	
}