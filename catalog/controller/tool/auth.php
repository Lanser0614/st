<?php
class ControllerToolAuth extends Controller {
	
	public function index() {}
	
	private function send($phone,$sms) {
		$ch = curl_init("http://sms.ru/sms/send");
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 
		curl_setopt($ch, CURLOPT_TIMEOUT, 30);
		curl_setopt($ch, CURLOPT_POSTFIELDS, array(
			"api_id"		=>	'D0E13900-A03C-38AC-D6C9-E1D4C34EE107',
			"to"			=>	$phone,
			"partner_id"	=>	"6583",
			"text"			=>	$sms
		));
		$body = curl_exec($ch);
		
		curl_close($ch); 
		return false;
	}
	
	public function phone() {
		
		$result = '';
		if( $phone = $this->request->get['phone'] ) {
			//$this->db->query("INSERT INTO auth_code SET phone = '123'");
			$phone = preg_replace('/[^\d]/', '', $phone);
			$phone = '8' . substr($phone, -10, 10);
			if(!empty($_COOKIE['stime'])){
				$last_time = base64_decode($_COOKIE['stime']);
				if((time()-$last_time)<60){
					$result = 'wait';
				} else {					
					$result = 'ok';					
				}
			} else {			
				$result = 'ok';			
			}
			
			if($result=='ok'){
			
				$code = mt_rand(1000, 9999);

				//$code = 3535;
			//	var_dump($phone);
				$_SESSION['auth']['phone'] = $phone;
			//	$this->db->query("INSERT INTO auth_code SET phone = ".$_SESSION['auth']['phone']);
			//	$this->db->query("INSERT INTO auth_code (phone) VALUES('$phone')");
				$_SESSION['auth']['code'] = (string)$code;
				$_SESSION['auth']['tries'] = 2;
				$this->send($phone, "Ваш код авторизации: ".$code);
				setcookie('stime', base64_encode(time()), time()+60*60*24*365,'/');
			}
			
		}
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode(['result'=>$result]));
	}
	
	public function code() {
		
		if( $code = $this->request->get['code'] ) {
			
			$_SESSION['auth']['tries'] -= 1;
			
			if( (int)$code == $_SESSION['auth']['code'] ) {
				
				$this->load->model('account/customer');
				
				if( !empty($_SESSION['auth']['phone']) ) {
					$customer_info = $this->model_account_customer->getCustomerByPhone($_SESSION['auth']['phone']);
					
					if( empty($customer_info) ) {
						$customer_id = $this->model_account_customer->addCustomer(['telephone' => $_SESSION['auth']['phone'], 'firstname'=>'', 'lastname'=>'', 'email'=>'', 'fax'=>'', 'password'=>'', 'company'=>'', 'address_1'=>'', 'address_2'=>'', 'city'=>'', 'postcode'=>'', 'country_id'=>0, 'zone_id'=>0]);
					} else {
						$customer_id = $customer_info['customer_id'];
					}
					
				} elseif( !empty($_SESSION['auth']['email']) ) {
					$customer_info = $this->model_account_customer->getCustomerByEmail($_SESSION['auth']['email']);
					
					if( empty($customer_info) ) {
						$customer_id = $this->model_account_customer->addCustomer(['email' => $_SESSION['auth']['email'], 'telephone'=> '', 'firstname'=>'', 'lastname'=>'', 'fax'=>'', 'password'=>'', 'company'=>'', 'address_1'=>'', 'address_2'=>'', 'city'=>'', 'postcode'=>'', 'country_id'=>0, 'zone_id'=>0]);
					} else {
						$customer_id = $customer_info['customer_id'];
					}
				}
				
				$this->session->data['customer_id'] = $customer_id;
				
				unset($_SESSION['auth']);
				$result = 'ok';
				
			} else {
				
				if( $_SESSION['auth']['tries'] > 0 ) {
					$result = 'fail';
				} else {
					unset($_SESSION['auth']);
					$result = 'reset';
				}
			}
			
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode(['result'=>$result]));
	}
	
	
	
	private function send_email($email, $subject, $message) {
		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

		$mail->setTo($email);
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
		$mail->setSubject($subject);
		$mail->setText($message);
		$mail->send();
	}

	public function email() {
		if( $email = $this->request->get['email'] ) {
			//var_dump($email);
		//	echo $email;
			if(!empty($_COOKIE['stime'])){
				$last_time = base64_decode($_COOKIE['stime']);
				if((time()-$last_time)<60){
					$result = 'wait';
				} else {					
					$result = 'ok';					
				}
			} else {			
				$result = 'ok';			
			}
			
			if($result=='ok'){
				$code = mt_rand(1000, 9999);
				//$code = 3535;
				$_SESSION['auth']['email'] = $email;
				$_SESSION['auth']['code'] = (string)$code;
				$_SESSION['auth']['tries'] = 2;
				$this->send_email($email, "Авторизация на сайте ST Автозапчасти", "<p>Это письмо пришло, потому что кто-то запросил код авторизации на Ваш почтовый адрес.</p><p>Если это были не вы, то просто игнорируйте это сообщение.</p><p>Код для авторизации: ".$code."</p>");
				setcookie('stime', base64_encode(time()), time()+60*60*24*365,'/');
			}
			
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode(['result'=>$result]));
	}
}