<?php
class ControllerExtensionModuleFastblock extends Controller {
public function index(){
		

	if ($this->request->server['REQUEST_METHOD'] == 'POST') {
	
		$json = array();
		
		$body = "";
    
		if (isset($this->request->post['title']) && $this->request->post['title'] !== '') {
			$body .= "<h2>".$this->request->post['title']."</h2>";
			$title = $this->request->post['title'];
		} else {
		  $title = 'Письмо с сайта';
		}
		
		if (isset($this->request->post['name']) && $this->request->post['name'] !== '') {
			$body .= "<br><b>Имя: </b>".$this->request->post['name'];
			$from_name = $this->request->post['name'];
		} else {
		  $from_name = 'Клиент';
		}
		
		
		if (isset($this->request->post['phone']) && $this->request->post['phone'] !== '') {
			$body .= "<br><b>Телефон: </b>".$this->request->post['phone'];
			$from_phone = $this->request->post['phone'];
		} else {
		  $from_phone = '';
		}
		
		if (isset($this->request->post['email']) && $this->request->post['email'] !== '') {
			$body .= "<br><b>E-mail: </b>".$this->request->post['email'];
			//$from_email = $this->request->post['email'];
		} else {
		  //$from_email = 'client@'.$_SERVER['SERVER_NAME'];
		}
		
		$from_email = 'client@'.$_SERVER['SERVER_NAME'];
		
		if (isset($this->request->post['info']) && $this->request->post['info'] !== '') {
			$body .= "<br><b>Сообщение: </b>".$this->request->post['info'];
		}
		if (isset($this->request->post['product']) && $this->request->post['product'] !== '') {
			$body .= "<br><b>Товар: </b><a href='".$this->request->post['data_url']."'>".$this->request->post['product']."</a>";
		}
		
		if (isset($this->request->post['dopinfo']) && $this->request->post['dopinfo'] !== '') {
			$body .= "<br><br>".$this->request->post['dopinfo'];
		}



      $mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($from_email);
			$mail->setSender($from_name);
			$mail->setSubject($title.' '.$from_name.' '.$from_phone);
			//$mail->setText($body);
			$mail->setHtml($body);
			$mail->send();

      
			$json['success'] = 'trololo';
			
			
			$this->response->setOutput(json_encode($json));
  }


}
}
?>