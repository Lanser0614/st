<?php
class ControllerExtensionPaymentQiwiwcard extends Controller {
	private $pname = 'qiwiw_card';
	
	public function index() {
    
		return $this->load->controller('extension/payment/qiwiw', array('name' => $this->pname));

	}

	public function confirm() {
    
		$this->load->controller('extension/payment/qiwiw/confirm', array('name' => $this->pname));

	}
	
}
?>