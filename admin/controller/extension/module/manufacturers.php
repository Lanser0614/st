<?php
class ControllerExtensionModuleManufacturers extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/manufacturers');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		
		if ((float)VERSION > 1.9){ 
			$this->load->model('extension/module');			
			if (!isset($this->request->get['module_id']) && ($this->model_extension_module->getModulesByCode('manufacturers') == array())) {
				$this->model_extension_module->addModule('manufacturers', Array( 'name' => 'FX Brands on Category', 'status' => '1'));
			}		
		} else {
			$s = Array();
			$s['manufacturers_module'] = Array(Array('layout_id' => '3','position' => 'column_left','status' => '1','sort_order' => '1'));
			
			$this->model_setting_setting->editSetting('manufacturers', $s);	
		}
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {			
			$this->session->data['success'] = $this->language->get('text_success');

			if ((float)VERSION < 1.9){ 
				$this->redirect($this->url->link('extension/module/manufacturers', 'token=' . $this->session->data['token'], 'SSL'));
			} else if ((float)VERSION < 2.3){ 
				$this->response->redirect($this->url->link('extension/module/manufacturers', 'token=' . $this->session->data['token'], 'SSL'));
			} else {
				$this->response->redirect($this->url->link('extension/module/manufacturers', 'token=' . $this->session->data['token'], 'SSL'));
			}
		}
		
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		$data['layouts'] = $this->url->link('design/layout', 'token=' . $this->session->data['token'], true);

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/manufacturers', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/manufacturers', 'token=' . $this->session->data['token'], true);
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], true);
		
		if ((float)VERSION >= 2.3){ 
			$data['action'] = $this->url->link('extension/module/manufacturers', 'token=' . $this->session->data['token'], 'SSL');
			$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL');
		}

		if (isset($this->request->post['category_status'])) {
			$data['category_status'] = $this->request->post['category_status'];
		} else {
			$data['category_status'] = $this->config->get('category_status');
		}

		if ((float)VERSION < 2) { 
			$this->data = $this->data + $data;
			$this->load->model('design/layout');
			
			$this->data['layouts'] = $this->model_design_layout->getLayouts();

			$this->template = 'module/manufacturers.tpl';
			$this->children = array(
				'common/header',
				'common/footer'
			);
					
			$this->response->setOutput($this->render());
		} else {
			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');
			$this->response->setOutput($this->load->view('module/manufacturers.tpl', $data));
		}
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/manufacturers')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}