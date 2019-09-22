<?php
class ControllerInformationVerifynewsletter extends Controller {
	public function subscribe() {
		$this->load->language('account/awesomenewsletter');

		$this->load->model('account/awesomenewsletter');

		
		$awesomenewslettersettings = $this->config->get('awesomenewsletter_verify_description');
		
		
		$data['heading_title'] = (!empty($awesomenewslettersettings[$this->config->get('config_language_id')]['verify_title']) ? $awesomenewslettersettings[$this->config->get('config_language_id')]['verify_title'] : $this->language->get('heading_title'));
		
		$this->document->setTitle($data['heading_title']);

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_success'),
			'href' => $this->url->link('information/awesomenewsletter')
		);

		if(isset($this->request->get['newsletter_id'])) {
			$newsletter_id = unserialize(base64_decode($this->request->get['newsletter_id']));
		}else{
			$newsletter_id = 0;
		}
		
		$newsletter_info = $this->model_account_awesomenewsletter->getAwesomeNewsletter($newsletter_id);
		if($newsletter_info) {
			$cookie_value = "awesomenewsletter";
			setcookie("awesomenewsletter_popup", $cookie_value, time() + 86400);
			$this->session->data['awesomenewsletter_popup_stop'] = true;
			
			if(empty($newsletter_info['status'])) {
				$assign_status = 1;
				$this->model_account_awesomenewsletter->updateAwesomeNewsletter($newsletter_id, $assign_status);	
				$data['text_message'] = (!empty($awesomenewslettersettings[$this->config->get('config_language_id')]['verify_success_description']) ? 
				html_entity_decode($awesomenewslettersettings[$this->config->get('config_language_id')]['verify_success_description'], ENT_QUOTES, 'UTF-8') : $this->language->get('text_verify_success'));
			}else{
				$data['text_message'] = (!empty($awesomenewslettersettings[$this->config->get('config_language_id')]['verify_already_description']) ? html_entity_decode($awesomenewslettersettings[$this->config->get('config_language_id')]['verify_already_description'], ENT_QUOTES, 'UTF-8') : $this->language->get('text_verify_already'));
			}
		}else{ 
			$data['text_message'] = (!empty($awesomenewslettersettings[$this->config->get('config_language_id')]['verify_notfound_description']) ? html_entity_decode($awesomenewslettersettings[$this->config->get('config_language_id')]['verify_notfound_description'], ENT_QUOTES, 'UTF-8') : $this->language->get('text_not_found_email'));
		}

		$data['button_continue'] = (!empty($awesomenewslettersettings[$this->config->get('config_language_id')]['verify_button']) ? $awesomenewslettersettings[$this->config->get('config_language_id')]['verify_button'] : $this->language->get('heading_title'));
		

		$data['continue'] = $this->url->link('common/home', '', 'SSL');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if(VERSION >= '2.2.0.0') {
			$this->response->setOutput($this->load->view('information/verifynewsletter', $data));
		}else{
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/verifynewsletter.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/information/verifynewsletter.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/information/verifynewsletter.tpl', $data));
			}
		}
	}
	
	public function unsubscribe() {
		$this->load->language('account/awesomenewsletter');

		$this->load->model('account/awesomenewsletter');

		
		$awesomenewslettersettings = $this->config->get('awesomenewsletter_unsubscribe_description');
		
		
		$data['heading_title'] = (!empty($awesomenewslettersettings[$this->config->get('config_language_id')]['unsubscribe_title']) ? $awesomenewslettersettings[$this->config->get('config_language_id')]['unsubscribe_title'] : $this->language->get('heading_title'));
		
		$this->document->setTitle($data['heading_title']);

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_success'),
			'href' => $this->url->link('information/awesomenewsletter')
		);

		if(isset($this->request->get['newsletter_id'])) {
			$newsletter_id = unserialize(base64_decode($this->request->get['newsletter_id']));
		}else{
			$newsletter_id = 0;
		}
		
		$newsletter_info = $this->model_account_awesomenewsletter->getAwesomeNewsletter($newsletter_id);
		if($newsletter_info) {
			$cookie_value = "awesomenewsletter";
			setcookie("awesomenewsletter_popup", $cookie_value, time() + 86400);
			$this->session->data['awesomenewsletter_popup_stop'] = true;
			
			if(!empty($newsletter_info['status'])) {
				$assign_status = 0;
				$this->model_account_awesomenewsletter->updateAwesomeNewsletter($newsletter_id, $assign_status);	
				$data['text_message'] = (!empty($awesomenewslettersettings[$this->config->get('config_language_id')]['unsubscribe_success_description']) ? 
				html_entity_decode($awesomenewslettersettings[$this->config->get('config_language_id')]['unsubscribe_success_description'], ENT_QUOTES, 'UTF-8') : $this->language->get('text_unsubscribe_success'));
			}else{
				$data['text_message'] = (!empty($awesomenewslettersettings[$this->config->get('config_language_id')]['unsubscribe_already_description']) ? html_entity_decode($awesomenewslettersettings[$this->config->get('config_language_id')]['unsubscribe_already_description'], ENT_QUOTES, 'UTF-8') : $this->language->get('text_unsubscribe_already'));
			}
		}else{ 
			$data['text_message'] = (!empty($awesomenewslettersettings[$this->config->get('config_language_id')]['unsubscribe_notfound_description']) ? html_entity_decode($awesomenewslettersettings[$this->config->get('config_language_id')]['unsubscribe_notfound_description'], ENT_QUOTES, 'UTF-8') : $this->language->get('text_not_found_email'));
		}

		$data['button_continue'] = (!empty($awesomenewslettersettings[$this->config->get('config_language_id')]['unsubscribe_button']) ? $awesomenewslettersettings[$this->config->get('config_language_id')]['unsubscribe_button'] : $this->language->get('heading_title'));
		

		$data['continue'] = $this->url->link('common/home', '', 'SSL');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if(VERSION >= '2.2.0.0') {
			$this->response->setOutput($this->load->view('information/verifynewsletter', $data));
		}else{
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/verifynewsletter.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/information/verifynewsletter.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/information/verifynewsletter.tpl', $data));
			}
		}
	}
}