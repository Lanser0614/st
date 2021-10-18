<?php
class ModelExtensionPaymentQiwiw extends Model {
	private $key;

    public function getTotalStatus() {

        $sql = "SELECT COUNT(status_id) AS total FROM " . DB_PREFIX . "qiwiwpro WHERE `status` = 1 OR `status` = 2 OR `status` = 3";

        $query = $this->db->query($sql);

        return $query->row['total'];

    }

    public function getStatus($data) {

        $sql = "SELECT * FROM `" . DB_PREFIX . "qiwiwpro` WHERE `status` = 1 OR `status` = 2 OR `status` = 3 ORDER BY `status_id` DESC";
        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getPaymentType($paymentType) {
        if ($paymentType == 'qiwiw'){
            $pt = '99';
        }

        if (strpos($paymentType, 'iwiwqpclone')){
            $pt = '99';
        }

        if (strpos($paymentType, '_card')){
            $pt = '99';
        }

        if (strpos($paymentType, '_tocard')){
            $pt = '1963';
        }
        

        return $pt;
    }


    public function getProSettings() {
        $setpro = array('debug', 'returnpage', 'otlog', 'showadmin', 'artprbalance', 'balance_sort', 'artprfpay', 'fpay_sort', 'qtoken', 'morepay', 'morepay_redirect', 'morepay_alert_admin', 'morepay_alert_customer', 'komis_brain', 'pagepay');
        return $setpro;
    }

	public function getCustomFields($order_info, $varabliesd) {
            $instros = explode('~', $varabliesd);
            $instroz = "";

            if ($this->config->get('qiwiw_fixen')) {
                if ($this->config->get('qiwiw_fixen') == 'fix'){
                    $out_summ = $this->config->get('qiwiw_fixen_amount');
                }
                else{
                    $out_summ = $order_info['total'] * $this->config->get('qiwiw_fixen_amount') / 100;
                }
            }
            else{
                $out_summ = $order_info['total'];
            }

            foreach ($instros as $instro) {
                if ($instro == 'checkouthref' || $instro == 'href' || $instro == 'orderid' || $instro == 'itogo' ||  $instro == 'itogobez' ||  $instro == 'itogozakaz' || $instro == 'komis' || $instro == 'total-komis' || $instro == 'plus-komis' || $instro == 'totals' || $instro == 'nds' || $instro == 'bvnds' || isset($order_info[$instro]) || substr_count($instro, "ordercustom_") || substr_count($instro, "shippingAddresscustom_") || substr_count($instro, "paymentAddresscustom_") || substr_count($instro, "customercustom_") || substr_count($instro, "paymentsimple4_") || substr_count($instro, "shippingsimple4_") || substr_count($instro, "simple4_")){
                    if ($instro == 'checkouthref'){
                        
                        $instro_other = $order_info['store_url'] . 'index.php?route=checkout/success_qiwiw&code=' . $this->getSecureCode($order_info['order_id']) . '&order_id='.$order_info['order_id'];
                       
                    }
                    if ($instro == 'href'){
                        
                        $instro_other = $order_info['store_url'] . 'index.php?route=extension/payment/qiwiw/go&code=' . $this->getSecureCode($order_info['order_id']) . '&order_id='.$order_info['order_id'];
                        
                    }
                    if ($instro == 'orderid'){
                        $instro_other = $order_info['order_id'];
                    }
                    if ($instro == 'itogo'){
                        $instro_other = $this->currency->format($out_summ, 'RUB', $this->currency->getValue('RUB'), true);
                    }
                    if ($instro == 'itogobez'){
                        $instro_other = $this->currency->format($out_summ, 'RUB', $this->currency->getValue('RUB'), false);
                    }
                    if ($instro == 'itogozakaz'){
                        $instro_other = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false);
                    }
                    if ($instro == 'komis'){
                        if($this->config->get('qiwiw_komis')){
                            $instro_other = $this->config->get('qiwiw_komis') . '%';
                        }
                        else{$instro_other = '';}
                    }
                    if ($instro == 'total-komis'){
                        if($this->config->get('qiwiw_komis')){
                            $instro_other = $this->currency->format($out_summ * $this->config->get('qiwiw_komis')/100,  'RUB', $this->currency->getValue('RUB'), true);
                        }
                        else{$instro_other = '';}
                    }
                    if ($instro == 'plus-komis'){
                        if($this->config->get('qiwiw_komis')){
                            $instro_other = $this->currency->format($out_summ + ($out_summ * $this->config->get('qiwiw_komis')/100),  'RUB', $this->currency->getValue('RUB'), true);
                        }
                        else{$instro_other = '';}
                    }
                    if ($instro == 'totals'){
                        $instro_other = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], true);
                    }
                    
                    if(isset($order_info[$instro])){
                        $instro_other = $order_info[$instro];
                    }

                    if (substr_count($instro, "ordercustom_")){
                        $this->load->model('tool/simplecustom');
                        $instro = ltrim($instro, 'order');
                        $customx = $this->model_tool_simplecustom->getOrderField($order_info['order_id'], $instro);
                        if ($customx){
                             $instro_other = $customx;
                        }
                        
                    }
                    if (substr_count($instro, "shippingAddresscustom_")){
                        $this->load->model('tool/simplecustom');
                        $instro = ltrim($instro, 'shippingAddress');
                        $customx = $this->model_tool_simplecustom->getShippingAddressField($order_info['order_id'], $instro);
                        if ($customx){
                            $instro_other = $customx;
                        }
                    }
                    if (substr_count($instro, "paymentAddresscustom_")){
                        $this->load->model('tool/simplecustom');
                        $instro = ltrim($instro, 'shippingAddress');
                        $customx = $this->model_tool_simplecustom->getPaymentAddressField($order_info['order_id'], $instro);
                        if ($customx){
                            $instro_other = $customx;
                        }
                    }
                    if (substr_count($instro, "customercustom_")){
                        $this->load->model('tool/simplecustom');
                        $instro = ltrim($instro, 'customer');
                        $customx = $this->model_tool_simplecustom->getCustomerField($order_info['customer_id'], $instro);
                        if ($customx){
                            $instro_other = $customx;
                        }
                    }

                    if (substr_count($instro, "paymentsimple4_") ){
                        $this->load->model('tool/simplecustom');
                        $customx = $this->model_tool_simplecustom->getCustomFields('order', $order_info['order_id']);
                        $pole = ltrim($instro, 'paymentsimple4');
                        $pole = substr($pole, 1);
                        if (array_key_exists($pole , $customx) == true){
                        $instro_other = $customx[$pole];
                        }
                        if (array_key_exists('payment_' . $pole , $customx) == true){
                          $instro_other = $customx['payment_' . $pole];
                        }
                    }
                    if (substr_count($instro, "shippingsimple4_") ){
                        $this->load->model('tool/simplecustom');
                        $customx = $this->model_tool_simplecustom->getCustomFields('order', $order_info['order_id']);
                        $pole = ltrim($instro, 'shippingsimple4');
                        $pole = substr($pole, 1);
                        if (array_key_exists($pole , $customx) == true){
                        $instro_other = $customx[$pole];
                        }
                        if (array_key_exists('shipping_' . $pole , $customx) == true){
                          $instro_other = $customx['shipping_' . $pole];
                        }
                    }
                    if (substr_count($instro, "simple4_") ){
                        $this->load->model('tool/simplecustom');
                        $customx = $this->model_tool_simplecustom->getCustomFields('order', $order_info['order_id']);
                        $pole = ltrim($instro, 'simple4');
                        $pole = substr($pole, 1);
                        if (array_key_exists($pole , $customx) == true){
                        $instro_other = $customx[$pole];
                        }
                    }
                    
                }
                else {
                    $instro_other = nl2br(htmlspecialchars_decode($instro));
                }
                    $instroz .=  $instro_other;
            }
            return $instroz;
    }

    public function getSecureCode($order_id) {
        $code = substr(md5($order_id . $this->config->get('config_encryption')), 0, 12);
        return $code;
    }
}