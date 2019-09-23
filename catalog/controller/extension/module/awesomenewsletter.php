<?php
class ControllerExtensionModuleawesomenewsletter extends Controller {
	public function index() {
		static $module = 0;
		
		$this->load->language('extension/module/awesomenewsletter');

		$awesomenewslettersettings = $this->config->get('awesomenewsletter_modules_description');
		
		
		///Label And Placeholder
		$data['heading_title'] = (!empty($awesomenewslettersettings[$this->config->get('config_language_id')]['title']) ?  $awesomenewslettersettings[$this->config->get('config_language_id')]['title'] : $this->language->get('heading_title'));
		
		
		
		$data['entry_name'] = (!empty($awesomenewslettersettings[$this->config->get('config_language_id')]['name_title']) ?  $awesomenewslettersettings[$this->config->get('config_language_id')]['name_title'] : $this->language->get('entry_name'));
		
		$data['entry_name_placeholder'] = (!empty($awesomenewslettersettings[$this->config->get('config_language_id')]['name_placeholder']) ?  $awesomenewslettersettings[$this->config->get('config_language_id')]['name_placeholder'] : $this->language->get('entry_name'));
		
		$data['entry_email'] = (isset($awesomenewslettersettings[$this->config->get('config_language_id')]['email_title']) ?  $awesomenewslettersettings[$this->config->get('config_language_id')]['email_title'] : $this->language->get('entry_email'));
		
		$data['entry_email_placeholder'] = (!empty($awesomenewslettersettings[$this->config->get('config_language_id')]['email_placeholder']) ?  $awesomenewslettersettings[$this->config->get('config_language_id')]['email_placeholder'] : $this->language->get('entry_email'));
		
		$data['text_description'] = (!empty($awesomenewslettersettings[$this->config->get('config_language_id')]['description']) ?  html_entity_decode($awesomenewslettersettings[$this->config->get('config_language_id')]['description'], ENT_QUOTES, 'UTF-8') : '');
		
		
		$data['button_subscribe'] = (!empty($awesomenewslettersettings[$this->config->get('config_language_id')]['button']) ? $awesomenewslettersettings[$this->config->get('config_language_id')]['button'] : $this->language->get('button_subscribe'));
		
		if($this->config->get('awesomenewsletter_name_status')) {
		 $data['namestatus'] = $this->config->get('awesomenewsletter_name_status');
		}else{
		 $data['namestatus'] = 0;
		}
		
		if($this->config->get('awesomenewsletter_name_required')) {
		 $data['namerequired'] = $this->config->get('awesomenewsletter_name_required');
		}else{
		 $data['namerequired'] = 0;
		}
		
		
		if($this->config->get('awesomenewsletter_css')) {
			$data['awesomenewsletter_css'] = $this->config->get('awesomenewsletter_css');
		}else{
			$data['awesomenewsletter_css'] = '';
		}
		
		$data['module'] = $module++;
		
		return $this->load->view('extension/module/awesomenewsletter', $data);
		
	}
	
	public function footer() {
		static $module = 0;
		
		$this->load->language('extension/module/awesomenewsletter');

		$awesomenewslettersettings = $this->config->get('awesomenewsletter_modules_description');
		
		
		///Label And Placeholder
		$data['heading_title'] = (!empty($awesomenewslettersettings[$this->config->get('config_language_id')]['title']) ?  $awesomenewslettersettings[$this->config->get('config_language_id')]['title'] : $this->language->get('heading_title'));
		
		
		
		$data['entry_name'] = (!empty($awesomenewslettersettings[$this->config->get('config_language_id')]['name_title']) ?  $awesomenewslettersettings[$this->config->get('config_language_id')]['name_title'] : $this->language->get('entry_name'));
		
		$data['entry_name_placeholder'] = (!empty($awesomenewslettersettings[$this->config->get('config_language_id')]['name_placeholder']) ?  $awesomenewslettersettings[$this->config->get('config_language_id')]['name_placeholder'] : $this->language->get('entry_name'));
		
		$data['entry_email'] = (isset($awesomenewslettersettings[$this->config->get('config_language_id')]['email_title']) ?  $awesomenewslettersettings[$this->config->get('config_language_id')]['email_title'] : $this->language->get('entry_email'));
		
		$data['entry_email_placeholder'] = (!empty($awesomenewslettersettings[$this->config->get('config_language_id')]['email_placeholder']) ?  $awesomenewslettersettings[$this->config->get('config_language_id')]['email_placeholder'] : $this->language->get('entry_email'));
		
		$data['text_description'] = (!empty($awesomenewslettersettings[$this->config->get('config_language_id')]['description']) ?  html_entity_decode($awesomenewslettersettings[$this->config->get('config_language_id')]['description'], ENT_QUOTES, 'UTF-8') : '');
		
		
		$data['button_subscribe'] = (!empty($awesomenewslettersettings[$this->config->get('config_language_id')]['button']) ? $awesomenewslettersettings[$this->config->get('config_language_id')]['button'] : $this->language->get('button_subscribe'));
		
		if($this->config->get('awesomenewsletter_name_status')) {
		 $data['namestatus'] = $this->config->get('awesomenewsletter_name_status');
		}else{
		 $data['namestatus'] = 0;
		}
		
		if($this->config->get('awesomenewsletter_name_required')) {
		 $data['namerequired'] = $this->config->get('awesomenewsletter_name_required');
		}else{
		 $data['namerequired'] = 0;
		}
		
		
		if($this->config->get('awesomenewsletter_css')) {
			$data['awesomenewsletter_css'] = $this->config->get('awesomenewsletter_css');
		}else{
			$data['awesomenewsletter_css'] = '';
		}
		
		$data['module'] = $module++;
		
		
		return $this->load->view('extension/module/awesomenewsletter_footer', $data);
	}
	
	public function addsubscribe() {
		$json=array();
		$this->load->language('extension/module/awesomenewsletter');
		$this->load->model('account/awesomenewsletter');
		
		$awesomenewslettersettings = $this->config->get('awesomenewsletter_modules_description');
		
		
		if($this->config->get('awesomenewsletter_name_status') && $this->config->get('awesomenewsletter_name_required')) {
			if ((utf8_strlen(trim($this->request->post['name'])) < 1) || (utf8_strlen(trim($this->request->post['name'])) > 64)) {
				$json['error']['name'] = (!empty($awesomenewslettersettings[$this->config->get('config_language_id')]['name_error']) ? $awesomenewslettersettings[$this->config->get('config_language_id')]['name_error'] : $this->language->get('error_name'));
			}
		}
		
		if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $this->request->post['email'])) {
			$json['error']['email'] = (!empty($awesomenewslettersettings[$this->config->get('config_language_id')]['email_error']) ? $awesomenewslettersettings[$this->config->get('config_language_id')]['email_error'] : $this->language->get('error_email'));
		}
		
		if ($this->model_account_awesomenewsletter->getTotalByEmail($this->request->post['email'])) {
			$json['error']['email'] = (!empty($awesomenewslettersettings[$this->config->get('config_language_id')]['exists_error']) ? $awesomenewslettersettings[$this->config->get('config_language_id')]['exists_error'] : $this->language->get('error_exists'));
		}
		
		if(!$json){
			$this->model_account_awesomenewsletter->addawesomenewsletter($this->request->post);
			$json['success'] = (!empty($awesomenewslettersettings[$this->config->get('config_language_id')]['success']) ? $awesomenewslettersettings[$this->config->get('config_language_id')]['success'] : $this->language->get('text_success'));
			
			$cookie_value = "awesomenewsletter";
			setcookie("awesomenewsletter_popup", $cookie_value, time() + 86400);
			$this->session->data['awesomenewsletter_popup_stop'] = true;
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}