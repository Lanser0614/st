<?php
class ControllerExtensionPaymentQiwiwcard extends Controller {
	private $error = array();
	private $pname = 'qiwiw_card';
	public function index() {
    
		$this->load->controller('extension/payment/qiwiw', array('name' => $this->pname));

	}
}
?>