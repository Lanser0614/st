<?php
class ModelExtensionPaymentQiwiwcard extends Model { 
	private $pname = 'qiwiw_card';

	public function getMethod($address, $total) {
		$this->load->model('extension/payment/qiwiw');
		$method_data = $this->model_extension_payment_qiwiw->secondmodel($address, $total, 'qiwiw_card');
		return $method_data;
	}
		
}
?>