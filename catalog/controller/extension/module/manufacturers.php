<?php
class ControllerExtensionModuleManufacturers extends Controller {
	public function index() {
	
	if ((float)VERSION > 1.9){ 
		$this->load->language('module/manufacturers');
	}else{
		$this->language->load('module/manufacturers');	
	}
		$data['heading_title'] = $this->language->get('heading_title');

		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
			$category_id = array_pop ($parts);
		} else {
			$parts = array();
		}


		$this->load->model('module/manufacturers');

		$data['manufacturer_id'] = 0;
		if (isset($this->request->get['manufacturer_id'])) {
			$data['manufacturer_id'] = (int)$this->request->get['manufacturer_id'];
		}
		
		$data['manufacturers'] = array();

		$manufacturers = array_unique($this->model_module_manufacturers->getManufacturersOnCategory((int)$category_id), SORT_REGULAR);
		
		//print_r(array_unique($manufacturers, SORT_REGULAR));

		foreach ($manufacturers as $manufacturer) {
		
			if ($manufacturer['manufacturer_id'] != ''){		
				$data['manufacturers'][] = array(
					'manufacturer_id' => $manufacturer['manufacturer_id'],
					'name'        => $manufacturer['name'],
					'href'        => $this->url->link('product/category', 'path=' . $category_id . '&manufacturer_id=' . $manufacturer['manufacturer_id'])
				);
			}
		}

		if ((float)VERSION < 2) { 
			$this->data = $data;
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/manufacturers15.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/module/manufacturers15.tpl';
			} else {
				$this->template = 'default/template/module/manufacturers15.tpl';
			}
			$this->render();
		} else if ((float)VERSION < 2.2) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/manufacturers.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/manufacturers.tpl', $data);
			} else {
				return $this->load->view('default/template/module/manufacturers.tpl', $data);
			}
		} else {		
			return $this->load->view('module/manufacturers', $data);
		}
	}
}