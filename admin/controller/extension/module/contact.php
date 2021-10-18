<?php
class ControllerExtensionModuleContact extends Controller {
	
	public function index(){
		$this->load->language('extension/module/contact');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('contact/contact');
		
		$data['heading_title']           = $this->language->get('heading_title');
		$data['text_contact']            = $this->language->get('text_contact');
		$data['text_module']             = $this->language->get('text_module');
		$data['text_confirm']            = $this->language->get('text_confirm');
		$data['button_delete']           = $this->language->get('button_delete');
		$data['text_no_results']         = $this->language->get('text_no_results');
		$data['button_cancel']           = $this->language->get('button_cancel');
		$data['button_read']             = $this->language->get('button_read');
		$data['column_name']             = $this->language->get('column_name');
		$data['column_email']            = $this->language->get('column_email');
		$data['column_ip']               = $this->language->get('column_ip');
		$data['button_csv']              = $this->language->get('button_csv');
		$data['text_read']               = $this->language->get('text_read');
		$data['text_not_read']           = $this->language->get('text_not_read');
		$data['column_date_added']       = $this->language->get('column_date_added');
		$data['text_copyright']          = $this->language->get('text_copyright');
		$data['column_action']           = $this->language->get('column_action');
		$data['text_view']               = $this->language->get('text_view');
		$data['button_view']             = $this->language->get('button_view');
		$data['button_reply']            = $this->language->get('button_reply');
		$data['column_description']      = $this->language->get('column_description');
		$data['heading_title_contact']   = $this->language->get('heading_title_contact');
		$data['heading_title_contact_list']     = $this->language->get('heading_title_contact_list');
		$data['heading_title_contact_reply']     = $this->language->get('heading_title_contact_reply');


		$data['breadcrumbs'] = array();
		
		$data['breadcrumbs'][] = array(
		'text' => $this->language->get('text_home'),
		'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);
		
		$data['breadcrumbs'][] = array(
		  'text' => $this->language->get('text_extension'),
		  'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);
		
		$data['breadcrumbs'][] = array(
		  'text' => $this->language->get('heading_title'),
		  'href' => $this->url->link('extension/module/contact', 'token=' . $this->session->data['token'], true)
		);
		
		$data['action'] = $this->url->link('extension/module/contact', 'token=' . $this->session->data['token'], true);
		
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		
		if (isset($this->request->post['contact_status'])) {
			   $data['contact_status'] = $this->request->post['contact_status'];
			} else {
			   $data['contact_status'] = $this->config->get('contact_status');
		}
		
		if (isset($this->error['warning'])) {
			   $data['error_warning'] = $this->error['warning'];
			} else {
			   $data['error_warning'] = '';
		}
		
		if(isset($this->session->data['error'])){
			   $data['error'] = $this->session->data['error'];
			   unset($this->session->data['error']);
		}else{
			   $data['error'] = '';
		}
		
		if(isset($this->session->data['success'])){
			   $data['success'] = $this->session->data['success'];
			   unset($this->session->data['success']);
		}else{
			   $data['success'] = '';
		}	
		
		$data['execute'] = $this->url->link('extension/module/contact/operation', 'token=' . $this->session->data['token'], 'SSL');
		$data['csvfile'] = $this->url->link('extension/module/contact/csvoutput', 'token=' . $this->session->data['token'], 'SSL');
		
		$contact_info = $this->model_contact_contact->getContactinfo();
		foreach($contact_info as $index=>$contactus){
			$id = $contactus['contact_id'];
			$contact_info[$index]['view'] = $this->url->link('extension/module/contact/contact_details', 'token=' . $this->session->data['token'] .'&id='.$id, 'SSL');
			$contact_info[$index]['reply'] = $this->url->link('extension/module/contact/contact_reply', 'token=' . $this->session->data['token'] .'&id='.$id, 'SSL');
			
		}
		
		$data['contact_info'] = $contact_info;
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('extension/module/contact', $data));
		
	}
	
	public function operation(){
		if(isset($this->request->post['execute'])){
			if($this->request->post['execute']=='delete'){
				$this->delete();
			}
			if($this->request->post['execute']=='markasread'){
				$this->markasread();
			}		
		}
		$this->response->redirect($this->url->link('extension/module/contact', 'token=' . $this->session->data['token'] . '&type=module', true));
	}
	
	private function delete(){
		$this->load->model('contact/contact');
		if(isset($this->request->post['execute'])){
			if(isset($this->request->post['selected'])){
				foreach($this->request->post['selected'] as $contact_id)
				   $this->model_contact_contact->deletecontact($contact_id);
				}else {
				   $contact_id = isset($this->request->get['id'])?$this->request->get['id']:'';
				if($contact_id){
					$this->model_contact_contact->deletecontact($contact_id);	
				}
			}
		}
	}
	
	private function markasread(){
		$this->load->model('contact/contact');
		if(isset($this->request->post['execute'])){
			if(isset($this->request->post['selected'])){
				foreach($this->request->post['selected'] as $view_id)
				$this->model_contact_contact->insertvalue($view_id);
			}
			$this->response->redirect($this->url->link('extension/module/contact', 'token=' . $this->session->data['token'] . '&type=module', true));
		}
	}
	
	
	public function csvoutput(){
		
		$this->load->model('contact/contact');
		$csv_output = $this->model_contact_contact->csvdata();
		$filename = 'file.csv';
		$output = "";
		
		$csv_terminated = "\n";
		$csv_separator = ",";
		$csv_enclosed = '"';
		$csv_escaped = "\\";
		
		foreach ($csv_output as $out) {
			$output .= $csv_enclosed .str_replace($csv_enclosed, $csv_escaped . $csv_enclosed, $out["firstname"]) . $csv_enclosed.$csv_separator;	
			$output .= $csv_enclosed .str_replace($csv_enclosed, $csv_escaped . $csv_enclosed, $out["email"]) . $csv_enclosed.$csv_separator;	
			
			
			$output .= $csv_terminated;
		}
		
		
		header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
		header("Content-Length: " . strlen($output));
		header("Content-type: text/x-csv");
		header("Content-Disposition: attachment; filename=$filename");
		echo $output;
		
	}
	
	
	public function contact_details(){
		
		$this->load->language('extension/module/contact');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('contact/contact');
		
		$data['heading_title']        = $this->language->get('heading_title');
		$data['text_contact']         = $this->language->get('text_contact');
		$data['button_save']          = $this->language->get('button_save');
		$data['button_delete']        = $this->language->get('button_delete');
		$data['text_no_results']      = $this->language->get('text_no_results');
		$data['button_cancel']        = $this->language->get('button_cancel');
		$data['heading_title_contact_reply']     = $this->language->get('heading_title_contact_reply');
		$data['heading_title_contact_details']     = $this->language->get('heading_title_contact_details');
		$data['text_subject']              = $this->language->get('text_subject');
		$data['column_select']             = $this->language->get('column_select');
		$data['column_name']               = $this->language->get('column_name');
		$data['column_email']              = $this->language->get('column_email');
		$data['column_ip']                 = $this->language->get('column_ip');
		$data['column_description']        = $this->language->get('column_description');
		$data['heading_title_contact']     = $this->language->get('heading_title_contact');
		$data['column_action']             = $this->language->get('column_action');
		$data['text_view']                 = $this->language->get('text_view');
		$data['column_action']             = $this->language->get('column_action');
		$data['button_view']               = $this->language->get('button_view');
		$data['button_cancel']             = $this->language->get('button_cancel');
		$data['button_reply']              = $this->language->get('button_reply');
		$data['text_copyright']            = $this->language->get('text_copyright');
		
		$data['breadcrumbs'] = array();
		
		$data['breadcrumbs'][] = array(
		  'text' => $this->language->get('text_home'),
		  'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);
		
		$data['breadcrumbs'][] = array(
		  'text' => $this->language->get('text_extension'),
		  'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);
		
		$data['breadcrumbs'][] = array(
		  'text'      => $this->language->get('heading_title_contact'),
		  'href' => $this->url->link('extension/module/contact', 'token=' . $this->session->data['token'], true)
		);
		
		$data['action'] = $this->url->link('extension/module/contact', 'token=' . $this->session->data['token'], true);
		
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		
		if (isset($this->request->post['contact_status'])) {
			$data['contact_status'] = $this->request->post['contact_status'];
		} else {
			$data['contact_status'] = $this->config->get('contact_status');
		} 
		
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if(isset($this->session->data['error'])){
		   $data['error'] = $this->session->data['error'];
		   unset($this->session->data['error']);
		}else{
			$data['error'] = '';
		}
		
		if(isset($this->session->data['success']))
		{
			   $data['success'] = $this->session->data['success'];
			   unset($this->session->data['success']);
			}else{
			   $data['success'] = '';
		}
		
		$data['cancel'] = $this->url->link('extension/module/contact', 'token=' . $this->session->data['token'], 'SSL');	
		
		$view_id = $this->request->get['id'];
		if($view_id){
			$this->model_contact_contact->insertvalue($view_id);
		}
		
		$single_data = $this->model_contact_contact->getSingledata($this->request->get['id']);
		
		foreach($single_data as $contact){
			$data['reply'] = $this->url->link('extension/module/contact/contact_reply', 'token=' . $this->session->data['token']. '&id='.$contact['contact_id'], 'SSL');
			$data['execute'] = $this->url->link('extension/module/contact/operation', 'token=' . $this->session->data['token']. '&id='.$contact['contact_id'], 'SSL');
		}
		
		$data['single_data'] = $single_data;
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('extension/module/contact_details', $data));
		
	}
	
	public function contact_reply(){
		$this->load->language('extension/module/contact');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('contact/contact');
		
		$data['token'] = $this->session->data['token'];
		$data['ckeditor'] = $this->config->get('config_editor_default');
		
		//CKEditor
		if ($this->config->get('config_editor_default')) {
			$this->document->addScript('view/javascript/ckeditor/ckeditor.js');
			$this->document->addScript('view/javascript/ckeditor/ckeditor_init.js');
		} else {
			$this->document->addScript('view/javascript/summernote/summernote.js');
			$this->document->addScript('view/javascript/summernote/lang/summernote-' . $this->language->get('lang') . '.js');
			$this->document->addScript('view/javascript/summernote/opencart.js');
			$this->document->addStyle('view/javascript/summernote/summernote.css');
		}
		
		$data['heading_title']             = $this->language->get('heading_title');
		$data['text_contact']              = $this->language->get('text_contact');
		$data['button_save']               = $this->language->get('button_save');
		$data['button_delete']             = $this->language->get('button_delete');
		$data['text_no_results']           = $this->language->get('text_no_results');
		$data['button_cancel']             = $this->language->get('button_cancel');
		$data['column_name']               = $this->language->get('column_name');
		$data['column_email']              = $this->language->get('column_email');
		$data['column_description']        = $this->language->get('column_description');
		$data['heading_title_contact']     = $this->language->get('heading_title_contact');
		$data['column_action']             = $this->language->get('column_action');
		$data['text_view']                 = $this->language->get('text_view');
		$data['column_action']             = $this->language->get('column_action');
		$data['button_view']               = $this->language->get('button_view');
		$data['button_cancel']             = $this->language->get('button_cancel');
		$data['button_reply']              = $this->language->get('button_reply');
		$data['button_send']               = $this->language->get('button_send');
		$data['text_copyright']            = $this->language->get('text_copyright');
		$data['heading_title_contact_reply']        = $this->language->get('heading_title_contact_reply');
		
		$data['breadcrumbs'] = array();
		
		$data['breadcrumbs'][] = array(
		'text' => $this->language->get('text_home'),
		'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);
		
		$data['breadcrumbs'][] = array(
		'text' => $this->language->get('text_extension'),
		'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);
		
		$data['breadcrumbs'][] = array(
		'text' => $this->language->get('heading_title_contact_reply'),
		'href' => $this->url->link('extension/module/contact', 'token=' . $this->session->data['token'], true)
		);
		
		$data['action'] = $this->url->link('extension/module/contact', 'token=' . $this->session->data['token'], true);
		
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		
		if (isset($this->request->post['contact_status'])) {
			$data['contact_status'] = $this->request->post['contact_status'];
	    } else {
			$data['contact_status'] = $this->config->get('contact_status');
		}
		
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if(isset($this->session->data['error'])){
			$data['error'] = $this->session->data['error'];
			unset($this->session->data['error']);
		}else{
			$data['error'] = '';
		}
		
		if(isset($this->session->data['success'])){
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		}else{
			$data['success'] = '';
		}
		
		$view_id = $this->request->get['id'];
		if($view_id){
			$this->model_contact_contact->insertvalue($view_id);
		}
		
		$data['send'] = $this->url->link('extension/module/contact/sendMail', 'token=' . $this->session->data['token'], 'SSL');
		$data['cancel'] = $this->url->link('extension/module/contact', 'token=' . $this->session->data['token'], 'SSL');		
		
		
		$single_data = $this->model_contact_contact->getSingledata($this->request->get['id']);
		
		$data['single_data'] = $single_data;
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('extension/module/contact_reply', $data));
		
	}		
	
	
	public function sendMail() {
		
		$this->load->language('extension/module/contact');
		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
            $mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($this->config->get('config_email'));
            $mail->setReplyTo($this->request->post['email']);
			$mail->setSender(html_entity_decode($this->request->post['name'], ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $this->request->post['name']), ENT_QUOTES, 'UTF-8'));
			$mail->setHtml(html_entity_decode($this->request->post['enquiry'], ENT_QUOTES, 'UTF-8'));
			$mail->send();
			$this->session->data['success']=$this->language->get('reply_message');

			$this->response->redirect($this->url->link('extension/module/contact', 'token=' . $this->session->data['token'], 'SSL'));
		}
	}
	
}	