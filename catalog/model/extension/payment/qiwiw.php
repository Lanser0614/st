<?php
class ModelExtensionPaymentQiwiw extends Model {
    private $pname = 'qiwiw';

    public function getMethod($address, $total) {

        $method_data = $this->secondmodel($address, $total, 'qiwiw');
        return $method_data;

    }

    public function secondmodel($address, $total, $pname) {

        $method_data = array();

        if ($this->config->get($pname . '_showadmin') == 'none') {
                return $method_data;
        }

        $this->load->language('extension/payment/qiwiwpro');
        $this->load->language('extension/payment/' . $pname);

        if ($total > 0) {
            $status = true;

            if ($this->config->get($pname . '_status')) {
                $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int) $this->config->get($pname . '_geo_zone_id') . "' AND country_id = '" . (int) $address['country_id'] . "' AND (zone_id = '" . (int) $address['zone_id'] . "' OR zone_id = '0')");

                if (!$this->config->get($pname . '_geo_zone_id')) {
                    $status = true;
                    if ($this->config->get($pname . '_minpay')) {
                        if ($this->currency->format($total, 'RUB', $this->currency->getValue('RUB'), false) <= $this->config->get($pname . '_minpay')) {
                            $status = false;
                        }
                    }
                    if ($this->config->get($pname . '_maxpay')) {
                        if ($this->currency->format($total, 'RUB', $this->currency->getValue('RUB'), false) >= $this->config->get($pname . '_maxpay')) {
                            $status = false;
                        }
                    }
                } elseif ($query->num_rows) {
                    $status = true;

                    if ($this->config->get($pname . '_minpay')) {
                        if ($this->currency->format($total, 'RUB', $this->currency->getValue('RUB'), false) <= $this->config->get($pname . '_minpay')) {
                            $status = false;
                        }
                    }

                    if ($this->config->get($pname . '_maxpay')) {
                        if ($this->currency->format($total, 'RUB', $this->currency->getValue('RUB'), false) >= $this->config->get($pname . '_maxpay')) {
                            $status = false;
                        }
                    }
                } else {
                    $status = false;
                }
            } else {
                $status = false;
            }

        } else {
            $status = false;
        }


        if($this->config->get($pname . '_store') && !in_array($this->config->get('config_store_id'), $this->config->get($pname . '_store')) || !$this->config->get($pname . '_store')){
            $status = false;
        }

        if (!in_array('all', $this->config->get($pname . '_gruppa')) ){
            if (!in_array($this->cart->customer->getGroupId(), $this->config->get($pname . '_gruppa')) ) {
                $status = false;
            }
        }

        if (!in_array('all', $this->config->get($pname . '_shippings')) ){
            if (isset($this->session->data["shipping_method"]['code'])) {
                if (!in_array(substr($this->session->data["shipping_method"]['code'],0,strpos($this->session->data['shipping_method']['code'],'.',2)), $this->config->get($pname . '_shippings'))) {
                    $status = false;
                }
            }
        }

        if ($this->config->get($pname . '_name_attach')) {
            $metname = htmlspecialchars_decode($this->config->get($pname . '_name_' . $this->config->get('config_language_id')));
        } else {
            $metname = htmlspecialchars_decode($this->language->get('text_title'));
        }

        if ($this->config->get($pname . '_showadmin')) {
            if ($this->config->get($pname . '_showadmin') == 'only') {
                $status = false;
            }
            
            $showadmin = true;

            if (isset($this->session->data['api_id'])){
                    $status = true;
            }
            
        }

        

        if (isset($this->session->data['token']) && isset($this->session->data['user_id']) && isset($showadmin)) {

            $this->user = new Cart\User($this->registry);

            if ($this->user->isLogged()) {
                    $status = true;
            }

        }


        if ($status) {
            
            $method_data = array(
                'code'       => $pname,
                'title'      => $metname,
                'terms'      => '',
                'sort_order' => $this->config->get($pname . '_sort_order'),
            );
        }

        return $method_data;
    }

    public function getOrderStatus($order_status_id) {

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_status WHERE order_status_id = '" . (int) $order_status_id . "' AND language_id = '" . (int) $this->config->get('config_language_id') . "'");

        return $query->row;
    }

    public function getPaymentStatus($order_id) {

        $query = $this->db->query("SELECT `status` FROM " . DB_PREFIX . "qiwiwpro WHERE num_order = '" . (int) $order_id . "' ");
        return $query->row;

    }

    public function getPaymentRedir($order_id,  $numtrans) {

        $query = $this->db->query("SELECT `status` FROM " . DB_PREFIX . "qiwiwpro WHERE num_order = '" . (int) $order_id . "' AND  label9 = ' ".(int) $numtrans." ' ");
        if (isset($query->row['status'])) {

            return true;
        }
        else{
            return false;
        }

    }

    public function getPaymentRedirC ($order_id,  $numtrans, $customer) {

        $query = $this->db->query("SELECT `status` FROM " . DB_PREFIX . "qiwiwpro WHERE `num_order` = '" . (int) $order_id . "' AND  `label9` = '".(int) $numtrans."' AND  `label7` = '".(int)$customer."'  AND `label8` = '2' ");
        if (isset($query->row['status'])) {

            return true;
        }
        else{
            return false;
        }

    }

    public function getPaymentRedirF ($order_id,  $numtrans, $customer) {
        $query = $this->db->query("SELECT `status` FROM " . DB_PREFIX . "qiwiwpro WHERE `num_order` = '" . (int) $order_id . "' AND  `label9` = ' ".(int) $numtrans."' AND `email` = '".$this->db->escape($customer)."' AND `label8` = '3' ");
        if (isset($query->row['status'])) {

            return true;
        }
        else{
            return false;
        }

    }

    public function getPaymentTransOStatus($order_id) {

        $query = $this->db->query("SELECT `sender` FROM " . DB_PREFIX . "qiwiwpro WHERE num_order = '" . (int) $order_id . "' ORDER BY `status_id` DESC ");
        if ($query->row) {
            return $query->row['sender'];
        }
        else{
            return false;
        }

    }

    public function getPaymentTransBStatus($customer_id) {

        $query = $this->db->query("SELECT `sender` FROM " . DB_PREFIX . "qiwiwpro WHERE label7 = '" . (int) $customer_id . "' AND `num_order` = 0 ORDER BY `status_id` DESC ");
        if ($query->row) {
            return $query->row['sender'];
        }
        else{
            return false;
        }

    }

    public function getPaymentTransFStatus($data, $checkmethod) {

        if ($checkmethod == 'email') {

            $query = $this->db->query("SELECT `sender` FROM " . DB_PREFIX . "qiwiwpro WHERE email = '" . $this->db->escape($data) . "' AND `num_order` = 0 ORDER BY `status_id` DESC ");
            if ($query->row) {
                return $query->row['sender'];
            }
            else{
                return false;
            }
        }

        if ($checkmethod == 'user') {

            $query = $this->db->query("SELECT `sender` FROM " . DB_PREFIX . "qiwiwpro WHERE user = '" . $this->db->escape($data) . "' AND `num_order` = 0 ORDER BY `status_id` DESC ");
            if ($query->row) {
                return $query->row['sender'];
            }
            else{
                return false;
            }
        }

        if ($checkmethod == 'operation') {

            $query = $this->db->query("SELECT `sender` FROM " . DB_PREFIX . "qiwiwpro WHERE sender = '" . $this->db->escape($data) . "' AND `num_order` = 0 ORDER BY `status_id` DESC ");
            if ($query->row) {
                return $query->row['sender'];
            }
            else{
                return false;
            }
        }
        

    }

    public function getPaymentAcc($order_id) {

        $query = $this->db->query("SELECT `payment_code`, `order_status_id` FROM " . DB_PREFIX . "order WHERE order_id = '" . (int) $order_id . "' ");

        return $query->row;
    }

    public function getShipSum($order_id) {

        $query = $this->db->query ("SELECT `value` FROM `" . DB_PREFIX . "order_total` WHERE `order_id` = '" . (int) $order_id . "' and `code` = 'shipping' " );

        if (isset($query->row['value'])){

            return $query->row['value'];
        }
        else{
            return 0;
        }
    }

    public function getSubTotalSum($order_id) {

        $query = $this->db->query ("SELECT `value` FROM `" . DB_PREFIX . "order_total` WHERE `order_id` = '" . (int) $order_id . "' and `code` = 'sub_total' " );

        return $query->row['value'];
    }

    public function getCur($out_summ, $order_info) {

        if ($order_info['currency_code'] == 'RUB') {
                $currency_code = $order_info['currency_code'];
                $currency_value = $order_info['currency_value'];
        }
        else{
               $currency_code = 'RUB';
               $currency_value = $this->currency->getValue('RUB');
        }

        return $this->currency->format($out_summ, $currency_code, $currency_value, false);

    }

    public function getPayments($order_id) {
        $ost = 0;
        $query = $this->db->query("SELECT `sum`, `label` FROM " . DB_PREFIX . "qiwiwpro WHERE num_order = '" . (int) $order_id . "' ");
        if ($query->rows) {
            foreach ($query->rows as $row) {
                $ost += $row['sum'] - $row['label'];
            }

            $ost = number_format($ost, 2, '.', '');
        }

        return $ost;

    }    

    public function getPayStatus($order_info, $out_summ = 0, $ostatok = false) {
        $more = $this->config->get($order_info['payment_code'] . '_morepay');
        $out_summ = $this->getCur($out_summ, $order_info);
        $query = $this->db->query("SELECT `sum`, `label` FROM " . DB_PREFIX . "qiwiwpro WHERE num_order = '" . (int) $order_info['order_id'] . "' ");
        
        if ($more && $out_summ > $more) {
                if ($query->rows) {
                    $ost = 0;
                    foreach ($query->rows as $row) {
                        $ost += $row['sum'] - $row['label'];
                    }

                    $ost = number_format($out_summ, 2, '.', '') - number_format($ost, 2, '.', '');
                }
                else{
                  $ost = $more;
                  if ($ostatok) {
                    $ost = $out_summ;
                  }
                }
        }
        else{
            if ($query->rows) {
                    $ost2 = 0;
                    foreach ($query->rows as $row) {
                        $ost2 += $row['sum']  - $row['label'];
                    }
                    $ost = number_format($out_summ, 2, '.', '') - number_format($ost2, 2, '.', '');
                    
            }
            else{
                $ost = $out_summ;
            }
         }
        
        return $ost;
    }

    public function getProc($out_summ, $order_info) {

        $more = $this->config->get($order_info['payment_code'] . '_morepay');

        if ($this->config->get($order_info['payment_code'] . '_komis')) {
            if ($this->config->get($order_info['payment_code'] . '_komis_brain')) {

                $totalrub['sum'] = number_format($out_summ / (1 - $this->config->get($order_info['payment_code'] . '_komis') / 100), 2, '.', '');

                if ($more && $totalrub['sum'] > $more) {

                    $totalrub['comis'] = $more - number_format($more * (1 - $this->config->get($order_info['payment_code'] . '_komis') / 100), 2, '.', '');

                }
                else {
                    $totalrub['comis'] = $totalrub['sum'] - number_format($out_summ, 2, '.', '');
                }

            }
            else {


                $totalrub['sum'] = number_format($out_summ * ($this->config->get($order_info['payment_code'] . '_komis') / 100) + $out_summ, 2, '.', '');

                if ($more && $totalrub['sum'] > $more) {
                    $totalrub['comis'] = $more - number_format(($more / (1 + $this->config->get($order_info['payment_code'] . '_komis') / 100)), 2, '.', '');

                }
                else {
                    $totalrub['comis'] = $totalrub['sum'] - number_format($out_summ, 2, '.', '');
                }

            }


        } else { 
            $totalrub['sum'] = $out_summ;
            $totalrub['comis'] = 0;
        }

        
        if ($more && $totalrub['sum'] > $more) {
            $totalrub['sum'] = $more;
        }

        return $totalrub;
    }

    public function getPurse($purse) {

        $pursear = explode(";", str_replace(" ","", $purse));
        $purse = array_rand($pursear, 1);

        return $pursear[$purse];

    }

    public function getSecret($purse, $secret, $find) {

        $pursear = explode(";", str_replace(" ","", $purse));
        $secretar = explode(";", str_replace(" ","", $secret));
        $newArray = array_combine($pursear, $secretar);
        return $newArray[$find];

    }

    public function getBalanceMethods() {

        $query = $this->db->query("SELECT `code` FROM " . DB_PREFIX . "setting WHERE `key` LIKE '%artprbalance' AND `value` = 1 ");
        $methods = array();
        $sort_order = array();
        if ($query->rows) {
            $col = 0;
            foreach ($query->rows as $key => $row) {
                if ($this->config->get($row['code'].'_balance_name_' . $this->config->get('config_language_id'))) {
                    $methods[$col]['name'] = htmlspecialchars_decode($this->config->get($row['code'].'_balance_name_' . $this->config->get('config_language_id')));
                }
                else{
                    $this->language->load('extension/payment/'.$row['code']);
                    $methods[$col]['name'] = htmlspecialchars_decode($this->language->get('text_title'));
                }
                $methods[$col]['href'] = $this->url->link($this->config->get($row['code'].'_balance_href'), '', 'SSL');
                $methods[$col]['code'] = $row['code'];
                $sort_order[$key] = $this->config->get($row['code'].'_balance_sort');
                $col +=1;
            }
        }


        array_multisort($sort_order, SORT_ASC, $methods);
        return $methods;
    }

    public function rubConverter($payment_sum, $payment_code) {

        if ($payment_code == 'RUB') {
            $paysum = $payment_sum;
        }
        else{
            $paysum = $this->currency->format($this->currency->convert($payment_sum, $payment_code, 'RUB'), 'RUB', '', false); 
        }

        return $paysum;

    }

    public function getFpayMethods() {

        $query = $this->db->query("SELECT `code` FROM " . DB_PREFIX . "setting WHERE `key` LIKE '%artprfpay' AND `value` = 1 ");
        $methods = array();
        $sort_order = array();
        if ($query->rows) {
            $col = 0;
            foreach ($query->rows as $key => $row) {
                if ($this->config->get($row['code'].'_fpay_name_' . $this->config->get('config_language_id'))) {
                    $methods[$col]['name'] = htmlspecialchars_decode($this->config->get($row['code'].'_fpay_name_' . $this->config->get('config_language_id')));
                }
                else{
                    $this->language->load('extension/payment/'.$row['code']);
                    $methods[$col]['name'] = htmlspecialchars_decode($this->language->get('text_title'));
                }
                $methods[$col]['href'] = $this->url->link($this->config->get($row['code'].'_fpay_href'), '', 'SSL');
                $methods[$col]['code'] = $row['code'];
                $sort_order[$key] = $this->config->get($row['code'].'_fpay_sort');
                $col +=1;
            }
        }


        array_multisort($sort_order, SORT_ASC, $methods);
        return $methods;
    }

    public function getCustomFields($order_info, $varabliesd) {

        $instros = explode('~', $varabliesd);
        $instroz = "";

        if ($this->config->get($order_info['payment_code'].'_fixen')) {
            if ($this->config->get($order_info['payment_code'].'_fixen') == 'fix') {
                $out_summ = $this->config->get($order_info['payment_code'].'_fixen_amount');
            } else if ($this->config->get($order_info['payment_code'].'_fixen') == 'proc'){
                $out_summ = $order_info['total'] * $this->config->get($order_info['payment_code'].'_fixen_amount') / 100;
            } else if ($this->config->get($order_info['payment_code'].'_fixen') == 'ship'){
                $out_summ = $this->getShipSum($order_info['order_id']);
            } else if ($this->config->get($order_info['payment_code'].'_fixen') == 'proc_ship'){
                $out_summ = $this->getShipSum($order_info['order_id']) * $this->config->get($order_info['payment_code'].'_fixen_amount') / 100;
            } else if ($this->config->get($order_info['payment_code'].'_fixen') == 'order_noship'){
                $out_summ = $order_info['total'] - $this->getShipSum($order_info['order_id']);
            } else if ($this->config->get($order_info['payment_code'].'_fixen') == 'proc_noship'){
                $out_summ = ($order_info['total'] * $this->config->get($order_info['payment_code'].'_fixen_amount') / 100) - $this->getShipSum($order_info['order_id']);
            } else if ($this->config->get($order_info['payment_code'].'_fixen') == 'proc_sum'){
                $out_summ = $this->getSubTotalSum($order_info['order_id']) * $this->config->get($order_info['payment_code'].'_fixen_amount') / 100;
            } else if ($this->config->get($order_info['payment_code'].'_fixen') == 'sum'){
                $out_summ = $this->getSubTotalSum($order_info['order_id']);
            }

        } else {
            $out_summ = $order_info['total'];
        }

        if ($order_info['currency_code'] == 'RUB') {
                $currency_code = $order_info['currency_code'];
                $currency_value = $order_info['currency_value'];
        }
        else{
               $currency_code = 'RUB';
               $currency_value = $this->currency->getValue('RUB');
        }

        foreach ($instros as $instro) {
            if ($instro == 'checkouthref' || $instro == 'href' || $instro == 'payhref' || $instro == 'statushref' || $instro == 'koplate' || $instro == 'koplate-comis' || $instro == 'ostatok' || $instro == 'oplacheno' || $instro == 'orderid' || $instro == 'itogo' || $instro == 'outs' || $instro == 'itogobez' || $instro == 'itogozakaz' || $instro == 'komis' || $instro == 'total-komis' || $instro == 'plus-komis' || $instro == 'totals' || $instro == 'nds' || $instro == 'bvnds' || $instro == 'orderlist'  || isset($order_info[$instro]) || substr_count($instro, "ordercustom_") || substr_count($instro, "shippingAddresscustom_") || substr_count($instro, "paymentAddresscustom_") || substr_count($instro, "customercustom_") || substr_count($instro, "paymentsimple4_") || substr_count($instro, "shippingsimple4_") || substr_count($instro, "simple4_")) {

                if ($instro == 'checkouthref') {

                    $instro_other = $order_info['store_url'] . 'index.php?route=checkout/success_qiwiw&code=' . $this->getSecureCode($order_info['order_id']) . '&order_id=' . $order_info['order_id'];

                }
                if ($instro == 'statushref') {

                    $instro_other = $order_info['store_url'] . 'index.php?route=extension/payment/qiwiw/status&code=' . $this->getSecureCode($order_info['order_id']) . '&order_id=' . $order_info['order_id'];

                }

                if ($instro == 'href') {

                    $instro_other = $order_info['store_url'] . 'index.php?route=extension/payment/qiwiw/go&code=' . $this->getSecureCode($order_info['order_id']) . '&order_id=' . $order_info['order_id'];

                }
                if ($instro == 'payhref') {

                    $instro_other = $order_info['store_url'] . 'index.php?route=extension/payment/qiwiw/pay&paymentType=' . $order_info['payment_code'] . '&code=' . $this->getSecureCode($order_info['order_id']) . '&order_id=' . $order_info['order_id'];

                }
                if ($instro == 'koplate') {
                    $out_summs = $this->model_extension_payment_qiwiw->getPayStatus($order_info, $out_summ);
                    $proc = $this->model_extension_payment_qiwiw->getProc($out_summs, $order_info);
                    $instro_other = $proc['sum'];
                }
                if ($instro == 'koplate-comis') {
                    $out_summs = $this->model_extension_payment_qiwiw->getPayStatus($order_info, $out_summ);
                    $proc = $this->model_extension_payment_qiwiw->getProc($out_summs, $order_info);
                    $instro_other = $proc['comis'];
                }
                if ($instro == 'ostatok') {
                    $out_summs = $this->model_extension_payment_qiwiw->getPayStatus($order_info, $out_summ, true);
                    $instro_other = $out_summs;
                }
                if ($instro == 'oplacheno') {
                    $out_summs = $this->model_extension_payment_qiwiw->getPayments($order_info['order_id']);
                    $instro_other = $out_summs;
                }
                if ($instro == 'orderid') {
                    $instro_other = $order_info['order_id'];
                }
                if ($instro == 'outs') {
                    $instro_other = $out_summ;
                }
                if ($instro == 'itogo') {
                    $instro_other = $this->currency->format($out_summ, $currency_code, $currency_value, true);
                }
                if ($instro == 'itogobez') {
                    $instro_other = $this->currency->format($out_summ, $currency_code, $currency_value, false);
                }
                if ($instro == 'itogozakaz') {
                    $instro_other = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false);
                }
                if ($instro == 'komis') {
                    if ($this->config->get($order_info['payment_code'].'_komis')) {
                        $instro_other = $this->config->get($order_info['payment_code'].'_komis') . '%';
                    } else { $instro_other = '';}
                }
                if ($instro == 'total-komis') {
                    if ($this->config->get($order_info['payment_code'].'_komis')) {
                        if ($this->config->get($order_info['payment_code'] . '_komis_brain')) {

                            $bkom = number_format($this->currency->format($out_summ, $currency_code, $currency_value, false) / (1 - $this->config->get($order_info['payment_code'] . '_komis') / 100), 2, '.', '');
                            $instro_other = $bkom - $this->currency->format($out_summ, $currency_code, $currency_value, false);
                        }
                        else {
                            $instro_other = number_format($this->currency->format($out_summ, $currency_code, $currency_value, false) * ($this->config->get($order_info['payment_code'].'_komis') / 100), 2, '.', '');
                        }
                    } else { $instro_other = '';}
                }
                if ($instro == 'plus-komis') {
                    if ($this->config->get($order_info['payment_code'].'_komis')) {
                        if ($this->config->get($order_info['payment_code'] . '_komis_brain')) {
                            $instro_other = number_format($this->currency->format($out_summ, $currency_code, $currency_value, false) / (1 - $this->config->get($order_info['payment_code'] . '_komis') / 100), 2, '.', '');
                        }
                        else {   
                            $instro_other = number_format($this->currency->format($out_summ, $currency_code, $currency_value, false) + $this->currency->format($out_summ, $currency_code, $currency_value, false) * ($this->config->get($order_info['payment_code'].'_komis') / 100), 2, '.', '');
                        }
                    } else { $instro_other = '';}
                }
                if ($instro == 'totals') {
                    $instro_other = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], true);
                }

                if (isset($order_info[$instro])) {
                    $instro_other = $order_info[$instro];
                }

                if (substr_count($instro, "ordercustom_")) {
                    $this->load->model('tool/simplecustom');
                    $instro  = ltrim($instro, 'order');
                    $customx = $this->model_tool_simplecustom->getOrderField($order_info['order_id'], $instro);
                    if ($customx) {
                        $instro_other = $customx;
                    }

                }
                if (substr_count($instro, "shippingAddresscustom_")) {
                    $this->load->model('tool/simplecustom');
                    $instro  = ltrim($instro, 'shippingAddress');
                    $customx = $this->model_tool_simplecustom->getShippingAddressField($order_info['order_id'], $instro);
                    if ($customx) {
                        $instro_other = $customx;
                    }
                }
                if (substr_count($instro, "paymentAddresscustom_")) {
                    $this->load->model('tool/simplecustom');
                    $instro  = ltrim($instro, 'shippingAddress');
                    $customx = $this->model_tool_simplecustom->getPaymentAddressField($order_info['order_id'], $instro);
                    if ($customx) {
                        $instro_other = $customx;
                    }
                }
                if (substr_count($instro, "customercustom_")) {
                    $this->load->model('tool/simplecustom');
                    $instro  = ltrim($instro, 'customer');
                    $customx = $this->model_tool_simplecustom->getCustomerField($order_info['customer_id'], $instro);
                    if ($customx) {
                        $instro_other = $customx;
                    }
                }

                if (substr_count($instro, "paymentsimple4_")) {
                    $this->load->model('tool/simplecustom');
                    $customx = $this->model_tool_simplecustom->getCustomFields('order', $order_info['order_id']);
                    $pole    = ltrim($instro, 'paymentsimple4');
                    $pole    = substr($pole, 1);
                    if (array_key_exists($pole, $customx) == true) {
                        $instro_other = $customx[$pole];
                    }
                    if (array_key_exists('payment_' . $pole, $customx) == true) {
                        $instro_other = $customx['payment_' . $pole];
                    }
                }
                if (substr_count($instro, "shippingsimple4_")) {
                    $this->load->model('tool/simplecustom');
                    $customx = $this->model_tool_simplecustom->getCustomFields('order', $order_info['order_id']);
                    $pole    = ltrim($instro, 'shippingsimple4');
                    $pole    = substr($pole, 1);
                    if (array_key_exists($pole, $customx) == true) {
                        $instro_other = $customx[$pole];
                    }
                    if (array_key_exists('shipping_' . $pole, $customx) == true) {
                        $instro_other = $customx['shipping_' . $pole];
                    }
                }
                if (substr_count($instro, "simple4_")) {
                    $this->load->model('tool/simplecustom');
                    $customx = $this->model_tool_simplecustom->getCustomFields('order', $order_info['order_id']);
                    $pole    = ltrim($instro, 'simple4');
                    $pole    = substr($pole, 1);
                    if (array_key_exists($pole, $customx) == true) {
                        $instro_other = $customx[$pole];
                    }
                }

                if ($instro == 'orderlist'){

                            $orderlist_products = array();

                            $this->load->model('account/order');
                            
                            $products = $this->model_account_order->getOrderProducts($order_info['order_id']);

                            foreach ($products as $product) {
                                $option_data = array();
                                
                                $options = $this->model_account_order->getOrderOptions($order_info['order_id'], $product['order_product_id']);

                                foreach ($options as $option) {
                                    if ($option['type'] != 'file') {
                                        $value = $option['value'];
                                    } else {
                                        $value = utf8_substr($option['value'], 0, utf8_strrpos($option['value'], '.'));
                                    }
                                    
                                    $option_data[] = array(
                                        'name'  => $option['name'],
                                        'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
                                    );                  
                                }

                                $orderlist_products[] = array(
                                    'name'     => $product['name'],
                                    'model'    => $product['model'],
                                    'option'   => $option_data,
                                    'quantity' => $product['quantity'],
                                    'price'    => $this->currency->format($product['price'] + ($this->config->get('config_tax') ? $product['tax'] : 0), $order_info['currency_code'], $order_info['currency_value']),
                                    'total'    => $this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value']),
                                    'return'   => $this->url->link('account/return/insert', 'order_id=' . $order_info['order_id'] . '&product_id=' . $product['product_id'], 'SSL')
                                );
                            }

                            // Voucher
                            $orderlist_vouchers = array();
                            
                            $vouchers = $this->model_account_order->getOrderVouchers($order_info['order_id']);
                            
                            foreach ($vouchers as $voucher) {
                                $orderlist_vouchers[] = array(
                                    'description' => $voucher['description'],
                                    'amount'      => $this->currency->format($voucher['amount'], $order_info['currency_code'], $order_info['currency_value'])
                                );
                            }
                            
                            $orderlist_totals = $this->model_account_order->getOrderTotals($order_info['order_id']);

                            $orderlist = '
                                <style>
                                    table.list {
                                    border-collapse: collapse;
                                    width: 100%;
                                    border-top: 1px solid #DDDDDD;
                                    border-left: 1px solid #DDDDDD;
                                    margin-bottom: 20px;
                                }
                                table.list td {
                                    border-right: 1px solid #DDDDDD;
                                    border-bottom: 1px solid #DDDDDD;
                                }
                                table.list thead td {
                                    background-color: #EFEFEF;
                                    padding: 0px 5px;
                                }
                                table.list thead td a, .list thead td {
                                    text-decoration: none;
                                    color: #222222;
                                    font-weight: bold;
                                }
                                table.list tbody td {
                                    padding: 0px 5px;
                                }
                                table.list .left {
                                    text-align: left;
                                    padding: 7px;
                                }
                                table.list .right {
                                    text-align: right;
                                    padding: 7px;
                                }
                                table.list .center {
                                    text-align: center;
                                    padding: 7px;
                                }
                                </style>
                                <table class="list">
                                    <thead>
                                      <tr>
                                        <td class="left">№</td>
                                        <td class="left">Наименование</td>
                                        <td class="left">Модель</td>
                                        <td class="right">Количество</td>
                                        <td class="right">Цена</td>
                                        <td class="right">Итого</td>';
                            $orderlistpnum = 0;

                            $orderlist .= '
                                      </tr>
                                    </thead>
                                    <tbody>';
                                    foreach ($orderlist_products as $product) {
                                        $orderlistpnum += 1;
                                        $orderlist .= '
                                      <tr>
                                        <td class="left">'.$orderlistpnum.'
                                        <td class="left">'.$product['name'];

                                        foreach ($product['option'] as $option) {
                                            $orderlist .= '<br />
                                            &nbsp;<small> - '.$option['name'].': '.$option['value'].'</small>';
                                        }

                            $orderlist .= '
                                        </td>
                                        <td class="left">'.$product['model'].'</td>
                                        <td class="right">'.$product['quantity'].'</td>
                                        <td class="right">'.$product['price'].'</td>
                                        <td class="right">'.$product['total'].'</td>
                                      </tr>';
                                    }
                                    foreach ($orderlist_vouchers as $voucher) {
                            $orderlist .= '
                                      <tr>
                                        <td class="left">'.$voucher['description'].'</td>
                                        <td class="left"></td>
                                        <td class="left"></td>
                                        <td class="right">1</td>
                                        <td class="right">'.$voucher['amount'].'</td>
                                        <td class="right">'.$voucher['amount'].'</td>
                                      </tr>';
                                    }
                            $orderlist .= '
                                    </tbody>
                                    <tfoot>';
                                    foreach ($orderlist_totals as $total) {
                            $orderlist .= '
                                      <tr>
                                        <td colspan="4"></td>
                                        <td class="right"><b>'.$total['title'].':</b></td>
                                        <td class="right">'.$this->currency->format($total['value'], $order_info['currency_code'], $order_info['currency_value']).'</td>
                                      </tr>';
                                    }
                            $orderlist .= '
                                    </tfoot>
                                </table>';

                        $instro_other = $orderlist;

                    }

            } else {
                $instro_other = htmlspecialchars_decode($instro);
            }
            $instroz .= $instro_other;
        }
        return $instroz;
    }

    public function getSecureCode($order_id) {

        $code = substr(md5($order_id . $this->config->get('config_encryption')), 0, 12);
        return $code;
    }

    public function saveTrans($customer_id, $description, $amount) {

        $this->db->query("INSERT INTO " . DB_PREFIX . "customer_transaction SET customer_id = '" . $this->db->escape($customer_id) . "', order_id = '" . 0 . "', description = '" . $this->db->escape($description) . "', amount = '" . $this->db->escape($amount) . "', date_added = NOW()");

    }

    public function savePayment($num_order, $sum, $date_enroled, $date_created = false, $user, $email, $status, $label, $sender, $label7, $label8, $label9 = 1) {
        if ($date_created ) {
            $this->db->query("INSERT INTO `" . DB_PREFIX . "qiwiwpro` SET `num_order` = '".(int)$num_order."' , `sum` = '" . $this->db->escape($sum) . "' , `date_enroled` = '" . $this->db->escape($date_enroled) . "', `date_created` = '".$this->db->escape($date_created)."', `user` = '" . $this->db->escape($user) . "', `email` = '" . $this->db->escape($email) . "', `status` = '".(int)$status."', `label` = '".$this->db->escape($label)."', `sender` = '" . $this->db->escape($sender) . "', `label9` = '" . (int)$label9 . "', `label7` = '" . (int)$label7 . "', `label8` = '".(int)$label8."' ");
        }
        else{
            $this->db->query("INSERT INTO `" . DB_PREFIX . "qiwiwpro` SET `num_order` = '".(int)$num_order."' , `sum` = '" . $this->db->escape($sum) . "' , `date_enroled` = '" . $this->db->escape($date_enroled) . "', `date_created` = NOW(), `user` = '" . $this->db->escape($user) . "', `email` = '" . $this->db->escape($email) . "', `status` = '".(int)$status."', `label` = '".$this->db->escape($label)."', `sender` = '" . $this->db->escape($sender) . "', `label9` = '" . (int)$label9 . "', `label7` = '" . (int)$label7 . "', `label8` = '".(int)$label8."' ");
        }

    }

    public function convertTransSum($sum) {
        $payment_code = $this->config->get('config_currency');
        if ($payment_code == 'RUB') {
            return $sum;
        }
        else{
            return $this->currency->format($this->currency->convert($sum, 'RUB', $payment_code), $payment_code, '', false); 
        }
    }

    public function getBalance($customer_id) {
            $query = $this->db->query("SELECT SUM(amount) AS total FROM " . DB_PREFIX . "customer_transaction WHERE customer_id = '" . (int)$customer_id . "'");
        
            return $query->row['total'];
    }
}
