<?php
class ControllerExtensionModuleSlaLiveSearch extends Controller {
	private $error = array();

	public function index() {
		$this->language->load('extension/module/sla_live_search');
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('sla_live_search', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');
			if (isset($this->request->post['apply'])) {
				$this->response->redirect($this->url->link('extension/module/sla_live_search', 'token=' . $this->session->data['token'], true));
			}

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}
		$errors = array(
			'error_warning',
			'error_name',
//			'error_all_results',
			'error_empty',
			'error_limit',
			'error_width',
			'error_height',
			'error_name_length',
			'error_description_length',
			'error_min_length',
			'error_heading_information',
			'error_heading_manufacturer',
			'error_heading_category',
			'error_heading_product',
		);
		foreach ($errors as $error) {
			$data[$error] = $this->setError($error);
		}
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		    unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['action'] = $this->url->link('extension/module/sla_live_search', 'token=' . $this->session->data['token'], true);
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		// Languages
		$langs = array(
		'heading_title',

		'text_edit',
		'text_success',
		'text_enabled',
		'text_disabled',
		'text_name',
		'text_information',
		'text_manufacturer',
		'text_category',
		'text_product',
		'text_all_results',
		
		'error_check_settings',

		'entry_search_category',
		'entry_search_information',
		'entry_search_manufacturer',
		'entry_heading_category',
		'entry_heading_information',
		'entry_heading_manufacturer',
		'entry_heading_product',
		'entry_limit',
		'entry_width',
		'entry_height',
		'entry_name_length',
		'entry_description_length',
		'entry_min_length',
		'entry_show_image',
		'entry_show_price',
		'entry_show_description',
		'entry_status',
		'entry_name',
		'entry_all_results',
		'entry_search_include_description',
		'entry_empty',
		'entry_first',
		'entry_show_sku',
		'entry_show_search_sku',
		'entry_search_sku',
		'entry_show_model',
		'entry_search_model',
		'entry_show_search_model',
		'entry_high_light',
		'entry_selector',
		'entry_show_count_products',

		'button_save',
		'button_cancel',
		'button_apply',

		'help_first',
		'help_length',
		'help_name',
		'help_all_results',
		'help_heading_product',
		'help_heading_category',
		'help_heading_manufacturer',
		'help_heading_information',
		'help_header_product'
		);
		foreach ($langs as $lang) {
			$data[$lang] = $this->language->get($lang);
		}
		
		$data['breadcrumbs'] = array();
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/sla_live_search', 'token=' . $this->session->data['token'], true)
		);

		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();
		foreach ($data['languages'] as $key => $language) {
			$img_flag = 'view/image/flags/' . $language['image'];
			if (version_compare(VERSION, '2.2', '>=')) {
				$img_flag = 'language/' . $language['code'] . '/' . $language['code'] . '.png';
			}
			$data['languages'][$key]['image'] = $img_flag;
		}

		if (isset($this->request->post['sla_live_search_all_results'])) {
			$data['sla_live_search_all_results'] = $this->request->post['sla_live_search_all_results'];
		} elseif( (array)$this->config->get('sla_live_search_all_results') ) {
			$data['sla_live_search_all_results'] = (array)$this->config->get('sla_live_search_all_results');
		} else {
			$data['sla_live_search_all_results'] = array();
		}

		if (isset($this->request->post['sla_live_search_all_results'])) {
			$data['sla_live_search_all_results'] = $this->request->post['sla_live_search_all_results'];
		} elseif( (array)$this->config->get('sla_live_search_all_results') ) {
			$data['sla_live_search_all_results'] = $this->config->get('sla_live_search_all_results');
		} else {
			$data['sla_live_search_all_results'] = array();
		}

		if (isset($this->request->post['sla_live_search_empty'])) {
			$data['sla_live_search_empty'] = $this->request->post['sla_live_search_empty'];
		} elseif( (array)$this->config->get('sla_live_search_empty') ) {
			$data['sla_live_search_empty'] = $this->config->get('sla_live_search_empty');
		} else {
			$data['sla_live_search_empty'] = array();
		}

		if (isset($this->request->post['sla_live_search_heading_product'])) {
			$data['sla_live_search_heading_product'] = $this->request->post['sla_live_search_heading_product'];
		} elseif( (array)$this->config->get('sla_live_search_heading_product') ) {
			$data['sla_live_search_heading_product'] = $this->config->get('sla_live_search_heading_product');
		} else {
			$data['sla_live_search_heading_product'] = array();
		}

		if (isset($this->request->post['sla_live_search_heading_category'])) {
			$data['sla_live_search_heading_category'] = $this->request->post['sla_live_search_heading_category'];
		} elseif( (array)$this->config->get('sla_live_search_heading_category') ) {
			$data['sla_live_search_heading_category'] = $this->config->get('sla_live_search_heading_category');
		} else {
			$data['sla_live_search_heading_category'] = array();
		}

		if (isset($this->request->post['sla_live_search_heading_manufacturer'])) {
			$data['sla_live_search_heading_manufacturer'] = $this->request->post['sla_live_search_heading_manufacturer'];
		} elseif( (array)$this->config->get('sla_live_search_heading_manufacturer') ) {
			$data['sla_live_search_heading_manufacturer'] = $this->config->get('sla_live_search_heading_manufacturer');
		} else {
			$data['sla_live_search_heading_manufacturer'] = array();
		}

		if (isset($this->request->post['sla_live_search_heading_information'])) {
			$data['sla_live_search_heading_information'] = $this->request->post['sla_live_search_heading_information'];
		} elseif( (array)$this->config->get('sla_live_search_heading_information') ) {
			$data['sla_live_search_heading_information'] = $this->config->get('sla_live_search_heading_information');
		} else {
			$data['sla_live_search_heading_information'] = array();
		}

		if (isset($this->request->post['sla_live_search_description'])) {
			$data['sla_live_search_description'] = $this->request->post['sla_live_search_description'];
		} else {
			$data['sla_live_search_description'] = $this->config->get('sla_live_search_description');
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
			'sla_live_search_selector',
			'sla_live_search_show_count_category',
			'sla_live_search_show_count_manufacturer',
		);
		foreach ($values as $value) {
			$data[$value] = $this->setValue($value);
		}
		if (!$data['sla_live_search_selector']) {
			$data['sla_live_search_selector'] = '#search input[name=\'search\']';
		}
		
		$data['sla_live_search_manufacturer_type'] = $this->checkManufactutrer();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
        $data['current_lang_id'] = $this->config->get('config_language_id');

		$this->response->setOutput($this->load->view('extension/module/sla_live_search.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/sla_live_search')) {
			$this->error['error_warning'] = $this->language->get('error_permission');
		} else {
/*		
			foreach ($this->request->post['sla_live_search_all_results'] as $language_id => $result) {
				if (!$result['name']) {
					$this->error['error_all_results'][$language_id] = $this->language->get('error_all_results');
				}
			}
*/		
			foreach ($this->request->post['sla_live_search_empty'] as $language_id => $result) {
				if (!$result['name']) {
					$this->error['error_empty'][$language_id] = $this->language->get('error_empty');
					$this->error['error_warning'] = $this->language->get('error_check_settings');
				}
			}
		
			foreach ($this->request->post['sla_live_search_heading_category'] as $language_id => $result) {
				if (!$result['name']) {
					$this->error['error_heading_category'][$language_id] = $this->language->get('error_heading_category');
					$this->error['error_warning'] = $this->language->get('error_check_settings');
				}
			}
			foreach ($this->request->post['sla_live_search_heading_product'] as $language_id => $result) {
				if (!$result['name']) {
					$this->error['error_heading_product'][$language_id] = $this->language->get('error_heading_product');
					$this->error['error_warning'] = $this->language->get('error_check_settings');
				}
			}
			foreach ($this->request->post['sla_live_search_heading_manufacturer'] as $language_id => $result) {
				if (!$result['name']) {
					$this->error['error_heading_manufacturer'][$language_id] = $this->language->get('error_heading_manufacturer');
					$this->error['error_warning'] = $this->language->get('error_check_settings');
				}
			}
			foreach ($this->request->post['sla_live_search_heading_information'] as $language_id => $result) {
				if (!$result['name']) {
					$this->error['error_heading_information'][$language_id] = $this->language->get('error_heading_information');
					$this->error['error_warning'] = $this->language->get('error_check_settings');
				}
			}
		
			if (!$this->request->post['sla_live_search_limit']) {
				$this->error['limit'] = $this->language->get('error_limit');
				$this->error['error_warning'] = $this->language->get('error_check_settings');
			}
		
			if (!$this->request->post['sla_live_search_image_width']) {
				$this->error['width'] = $this->language->get('error_width');
				$this->error['error_warning'] = $this->language->get('error_check_settings');
			}
		
			if (!$this->request->post['sla_live_search_image_height']) {
				$this->error['height'] = $this->language->get('error_height');
				$this->error['error_warning'] = $this->language->get('error_check_settings');
			}
		
			if (!$this->request->post['sla_live_search_name_length']) {
				$this->error['name_length'] = $this->language->get('error_name_length');
				$this->error['error_warning'] = $this->language->get('error_check_settings');
			}
		
			if (!$this->request->post['sla_live_search_description_length']) {
				$this->error['description_length'] = $this->language->get('error_description_length');
				$this->error['error_warning'] = $this->language->get('error_check_settings');
			}
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
	private function checkManufactutrer() {
		$results = array();
		
		$sql = "SHOW TABLES LIKE '" . DB_PREFIX . "manufacturer_description'";
		$query = $this->db->query($sql);
		if ($query->num_rows) {
			$sql = "SHOW COLUMNS FROM " . DB_PREFIX . "manufacturer_description LIKE 'description'";
			$query = $this->db->query($sql);
			if (!$query->num_rows) {
				$results[] = 'description';
			}
			
			$sql = "SHOW COLUMNS FROM " . DB_PREFIX . "manufacturer_description LIKE 'name'";
			$this->db->query($sql);
			if (!$query->num_rows) {
				$results[] = 'name';
			}
		}
		return implode('+', $results);
	}
	private function setValue($value, $type='') {
		if ($type == 'array') {
			
		} else {
			if (isset($this->request->post[$value])) {
				return $this->request->post[$value];
			} else {
				return $this->config->get($value);
			}
		}

	}
	
	private function setError($value) {
		if (isset($this->error[$value])) {
			return $this->error[$value];
		} else {
			return '';
		}
	}
}
