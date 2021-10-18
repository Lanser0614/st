<?php
class ControllerExtensionPaymentQiwiw extends Controller {
	private $pname = 'qiwiw';

	public function index ($payname = array('name' => 'qiwiw')) {
		$pname = isset($payname['name']) ? $payname['name'] : $this->pname;
		
		$this->load->model('checkout/order');
		$this->load->model('extension/payment/qiwiw');
		$this->language->load('extension/payment/qiwiwpro');
		$this->language->load('extension/payment/'.$pname);
		$data['instructionat'] = $this->config->get($pname.'_instruction_attach');
		$data['btnlater'] = $this->config->get($pname.'_button_later');
		$data['text_loading'] = $this->language->get('text_loading');
		$data['pname'] = $pname;
		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
        if ($this->config->get($order_info['payment_code'].'_komis')) {
            $outs_kom =  $this->model_extension_payment_qiwiw->getCustomFields($order_info, 'plus-komis');
        }
        else{
            $outs_kom =  $this->model_extension_payment_qiwiw->getCustomFields($order_info, 'itogobez');
        }
        if ($this->config->get($order_info['payment_code'] . '_morepay') && $outs_kom > $this->config->get($order_info['payment_code'] . '_morepay')) { 
            $paymentredir = $this->model_extension_payment_qiwiw->getCustomFields($order_info, '~statushref~').'&first=1';
        }
        else {
    		$paymentredir = $this->model_extension_payment_qiwiw->getCustomFields($order_info, '~payhref~').'&first=1';
        }

	  	$data['continue'] = $this->url->link('checkout/success', '', true);

		if ($this->config->get($pname.'_createorder_or_notcreate')){
			if ($this->config->get($pname.'_otlog') == 'stock'){
				if ($this->cart->hasStock()) {
					$data['notcreate'] = 'notcreate';
				}
			}
			else{
				$data['notcreate'] = 'notcreate';
			}
		}

		if ($this->config->get($pname.'_otlog') == 'stock'){
			if ($this->cart->hasStock()) {
				$data['pay_url'] = $paymentredir;
			}
			else{
				$data['pay_url'] = $this->url->link('checkout/success', '', true);
			}

		}

		else if ($this->config->get($pname.'_otlog') == 'pay'){
			$data['pay_url'] = $this->url->link('checkout/success', '', true);
		}

		else{
			$data['pay_url'] = $paymentredir;
		}

		$data['button_confirm'] = $this->language->get('button_confirm');
		$data['payment_url'] = $this->url->link('checkout/success', '', true);
		$data['button_later'] = $this->language->get('button_pay_later');

		if ($this->config->get($pname.'_instruction_attach')){
			$data['text_instruction'] = $this->language->get('text_instruction');
			$data['qiwiwi'] = htmlspecialchars_decode($this->model_extension_payment_qiwiw->getCustomFields($order_info, $this->config->get($pname.'_instruction_' . $this->config->get('config_language_id'))));
		}

        return $this->load->view('extension/payment/qiwiw', $data);
	}
	
	public function confirm($payname = array('name' => 'qiwiw')) {
		
		if (strpos($this->session->data['payment_method']['code'], 'iwiw')) {
			$pname = isset($payname['name']) ? $payname['name'] : $this->pname;
			$comment = '';	
		  	$this->language->load('extension/payment/qiwiwpro');
		  	$this->language->load('extension/payment/'.$pname);
			$this->load->model('checkout/order');
			$this->load->model('extension/payment/qiwiw');

			$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

			if ($this->config->get($pname.'_otlog') == 'stock'){
				if ($this->cart->hasStock()) {
					$ostatus = $this->config->get($pname.'_on_status_id');
					$comment = sprintf($this->language->get('stock'), $this->model_extension_payment_qiwiw->getCustomFields($order_info, '~href~'));
				}
				else{
					$ostatus = $this->config->get($pname.'_start_status_id');
					$comment = $this->language->get('no_stock');
				}

			}

			else if ($this->config->get($pname.'_otlog') == 'pay'){
				$ostatus = $this->config->get($pname.'_start_status_id');
			}

			else{
				$ostatus = $this->config->get($pname.'_on_status_id');
			}

			if ($this->config->get($pname.'_mail_instruction_attach')){
				$comment .= htmlspecialchars_decode($this->model_extension_payment_qiwiw->getCustomFields($order_info, $this->config->get($pname.'_mail_instruction_' . $this->config->get('config_language_id'))));
		    }

			$this->model_checkout_order->addOrderHistory($this->session->data['order_id'], $ostatus, $comment, true);
		}
	}

	public function go() {

        $this->load->model('extension/payment/qiwiw');

        if (isset($this->request->get['code']) & isset($this->request->get['order']) || isset($this->request->get['code']) & isset($this->request->get['order_id'])) {

            if (isset($this->request->get['order'])) {
                $inv_id = $this->request->get['order'];
            }

            if (isset($this->request->get['order_id'])) {
                $inv_id = $this->request->get['order_id'];
            }

            $this->load->model('checkout/order');
            $order_info = $this->model_checkout_order->getOrder($inv_id);
            $platp      = substr(md5($order_info['order_id'] . $this->config->get('config_encryption')), 0, 12);
            if ($this->request->get['code'] != $platp) {
                $this->response->redirect($this->url->link('error/not_found', '', true));
            }
            if ($order_info['order_id'] == 0) {$this->response->redirect($this->url->link('error/not_found', '', true));}
            if (!$this->customer->isLogged()) {
                $data['back'] = $this->url->link('common/home', '', true);
            } else {
                $data['back'] = $this->url->link('account/order', '', true);
            }

            $data['merchant_url'] = $this->model_extension_payment_qiwiw->getCustomFields($order_info, '~payhref~');

            $this->load->model('extension/payment/qiwiw');
            $out_summ = $this->model_extension_payment_qiwiw->getCustomFields($order_info, 'outs');
            $out_summ2 = $this->model_extension_payment_qiwiw->getPayStatus($order_info, $out_summ);

            if ($out_summ2 > 0) {$paystat['status'] = 0;} else {$paystat['status'] = 1;}

            $data['paystat'] = $paystat['status'];
            $this->load->language('extension/payment/qiwiwpro');
            $this->load->language('extension/payment/' . $order_info['payment_code']);
            $data['button_pay']    = $this->language->get('button_pay');
            $data['button_back']   = $this->language->get('button_back');
            $data['heading_title'] = $this->language->get('heading_title');
            $this->document->setTitle($this->language->get('heading_title'));
            $data['send_order_split'] = '';

            if ($paystat['status'] != 1) {

                $data['send_order_split'] = '';
                $data['send_text'] = '';

                if (isset($this->request->get['first']) && $order_info['order_status_id'] == $this->config->get($order_info['payment_code'] . '_on_status_id')) {
                    $data['send_text'] .= $this->language->get('success_text_first');
                }

                if ($this->config->get($order_info['payment_code'] . '_hrefpage_text_attach')) {
                    $data['send_text'] .= $this->model_extension_payment_qiwiw->getCustomFields($order_info, $this->config->get($order_info['payment_code'] . '_hrefpage_text_' . $this->config->get('config_language_id')));

                } else {
                    $data['send_text']  .= sprintf($this->language->get('send_text'), $inv_id, $this->model_extension_payment_qiwiw->getCur($out_summ, $order_info));
                    if ($this->config->get($order_info['payment_code'].'_komis')) {
                        $data['send_text']  .= sprintf($this->language->get('send_text_comis'),$this->model_extension_payment_qiwiw->getCustomFields($order_info, 'total-komis'));
                    }
                    
                }
                if ($this->config->get($order_info['payment_code'].'_komis')) {
                    $outs_kom =  $this->model_extension_payment_qiwiw->getCustomFields($order_info, 'plus-komis');
                }
                else{
                    $outs_kom =  $this->model_extension_payment_qiwiw->getCustomFields($order_info, 'itogobez');
                }
                if ($this->config->get($order_info['payment_code'] . '_morepay') && $outs_kom > $this->config->get($order_info['payment_code'] . '_morepay')) { 
                    $data['send_order_split']  .= sprintf($this->language->get('send_order_split'), $this->config->get($order_info['payment_code'] . '_morepay'), $this->model_extension_payment_qiwiw->getCustomFields($order_info, 'koplate'));
                    if ($this->config->get($order_info['payment_code'].'_komis')) {
                        $data['send_order_split']  .= sprintf($this->language->get('send_order_split_comis'), $this->model_extension_payment_qiwiw->getCustomFields($order_info, 'koplate-comis'));
                    }
                    $data['send_order_split']  .= sprintf($this->language->get('send_order_split2'), $this->model_extension_payment_qiwiw->getCustomFields($order_info, 'ostatok'));
                }
            } else {
                $data['send_text'] = $this->language->get('oplachen');
            }

            $data['column_left']    = $this->load->controller('common/column_left');
            $data['column_right']   = $this->load->controller('common/column_right');
            $data['content_top']    = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer']         = $this->load->controller('common/footer');
            $data['header']         = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('extension/payment/qiwiw_go', $data));

        } else {
            echo "No data";
        }
    }

    public function pay() {

        if (isset($this->session->data['order_id'])) {
            $sesionord = $this->session->data['order_id'];
        } else {
            $sesionord = '';
        }

        if (isset($this->request->get['first'])) {$first = '&first=1';} else { $first = '';}

        if ($this->request->get['order_id'] != $sesionord) {
            if (!isset($this->request->post['nesyandexa'])) {
                if (isset($this->request->get['paymentType'])) {
                    
                    $platp = substr(md5($this->request->get['order_id'] . $this->config->get('config_encryption')), 0, 12);
                    if ($this->request->get['code'] != $platp) {
                        $this->response->redirect($this->url->link('error/not_found', '', true));
                    }
                    $this->response->redirect($this->url->link('extension/payment/qiwiw/status&code='.$this->request->get['code'].'&order_id=' . $this->request->get['order_id'] . $first, '', true));

                } else {
                    $this->response->redirect($this->url->link('common/home', '', true));
                }
            }
        }

        if (isset($this->request->get['paymentType']) && isset($this->request->get['order_id']) && isset($this->request->get['code'])) {

            $this->load->model('checkout/order');
            $this->load->model('extension/payment/qiwiw');
            $order_info = $this->model_checkout_order->getOrder((int) $this->request->get['order_id']);

            $platp = substr(md5($order_info['order_id'] . $this->config->get('config_encryption')), 0, 12);
            if ($this->request->get['code'] != $platp) {
                $this->response->redirect($this->url->link('error/not_found', '', true));
            }

            $paymentcode = $order_info['payment_code'];


            $this->language->load('extension/payment/qiwiwpro');
            $this->language->load('extension/payment/' . $paymentcode);

            $paymentType = $this->config->get($paymentcode . '_methodcode');
            $purse = $this->model_extension_payment_qiwiw->getPurse($this->config->get($paymentcode . '_login'));
            $query = $this->db->query("SELECT `label9` FROM " . DB_PREFIX . "qiwiwpro WHERE num_order = '" . (int) $order_info['order_id'] . "'  ORDER BY `status_id` DESC ");

            if (isset($query->row['label9'])) {
                $storetransnum = $query->row['label9']+1;
            }
            else{
                $storetransnum = 1;
            }
            $label = $storetransnum.';z;'.$order_info['order_id'];

            $out_summ = $this->model_extension_payment_qiwiw->getCustomFields($order_info, 'outs');

            if (is_numeric($out_summ)) {
                if ($this->currency->has('RUB')) {
                    
                    $out_summ = $this->model_extension_payment_qiwiw->getPayStatus($order_info, $out_summ);
                    $proc = $this->model_extension_payment_qiwiw->getProc($out_summ, $order_info);
                    $total = explode('.' , $proc['sum']);
                    $kops = 00;
                    if (isset($total[1])){
                        $kops = $total[1];
                    }
                    
                } else {
                    echo 'No currency RUB';
                    exit();
                }

            } else {
                echo 'error: no total sum';
                exit();
            }

            $dataurl = array(
                'extra[\'account\']' => $purse,
                'amountInteger' => $total[0],
                'amountFraction' => $kops,
                'extra[\'comment\']' => $label,
                'currency' => '643',
                'blocked[0]' => 'sum',
                'blocked[1]' => 'account',
                'blocked[2]' => 'comment',

            );

            $forredirect = 'https://qiwi.com/payment/form/' . $paymentType . '?' . http_build_query ($dataurl);

            if ($this->config->get($order_info['payment_code'] . '_debug')) {

                print_r($dataurl);
                echo '<br>ID = '.$paymentType.'<br>OrderAmount = '.$order_info['total'].'<br>OrderCurrency = '.$order_info['currency_code'].'<br><a href="'.$forredirect.'">Перейти на оплату</a>';
                exit();

            }

            if (!$this->config->get($paymentcode . '_createorder_or_notcreate')) {
                if (isset($this->session->data['order_id'])) {
                    if ($this->request->get['order_id'] == $this->session->data['order_id']) {
                        $this->cart->clear();

                        unset($this->session->data['shipping_method']);
                        unset($this->session->data['shipping_methods']);
                        unset($this->session->data['payment_method']);
                        unset($this->session->data['payment_methods']);
                        unset($this->session->data['guest']);
                        unset($this->session->data['comment']);
                        unset($this->session->data['order_id']);
                        unset($this->session->data['coupon']);
                        unset($this->session->data['reward']);
                        unset($this->session->data['voucher']);
                        unset($this->session->data['vouchers']);
                    }
                }
            }

        } else {
            echo 'error: no payment method';
            exit();
        }
        

        if (is_numeric($this->request->get['order_id'])) {
            $data['order_id'] = $this->request->get['order_id'];
        } else {
            echo 'error: no order id';
            exit();
        }

        if (isset($this->session->data['order_id'])) {
            if ($this->request->get['order_id'] == $this->session->data['order_id']) {
                unset($this->session->data['order_id']);
            }
        }

        $frame = $this->config->get($paymentcode . '_pagepay');

        if ($frame == 'redir'){
            $data['frame'] = false;
        }
        else{
            if ($frame == 'frame') {
                $data['frame'] = 'frame';
            }
            else{
                $data['frame'] = 'new';
                $data['waiting_payment_new_text'] = $this->language->get('waiting_payment_new_text');
                $data['waiting_payment_new_button'] = $this->language->get('waiting_payment_new_button');
            }
            $data['column_left']    = $this->load->controller('common/column_left');
            $data['column_right']   = $this->load->controller('common/column_right');
            $data['content_top']    = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer']         = $this->load->controller('common/footer');
            $data['header']         = $this->load->controller('common/header');
            $data['wait'] = $this->language->get('waiting_payment');
            $data['checkstate'] = htmlspecialchars_decode ($this->url->link('extension/payment/qiwiw/checkstate', 'ordernum='.$this->request->get['order_id'].'&numtrans='.$storetransnum, true));
            $data['redir'] = htmlspecialchars_decode ($this->url->link('extension/payment/qiwiw/status', 'code='.$this->request->get['code'].'&order_id=' . $this->request->get['order_id'] . $first, true) );

        }

        $data['action'] = $forredirect;
        $this->response->setOutput($this->load->view('extension/payment/qiwiw_pay', $data));
    }

    private function calresoponce ($message) {
        header('Content-Type: application/json');
        echo json_encode(array('response' => $message));
    }

    public function checkstate() {

        $json = array();
        $this->load->model('extension/payment/qiwiw');
        if (isset($this->request->get['customer'])){
            $json['call'] = $this->model_extension_payment_qiwiw->getPaymentRedirC($this->request->get['ordernum'],  $this->request->get['numtrans'], $this->request->get['customer']);
        }
        else if (isset($this->request->get['email'])){
            $json['call'] = $this->model_extension_payment_qiwiw->getPaymentRedirF($this->request->get['ordernum'],  $this->request->get['numtrans'], $this->request->get['email']);
        }
        else{
            $json['call'] = $this->model_extension_payment_qiwiw->getPaymentRedir($this->request->get['ordernum'],  $this->request->get['numtrans']);
        }
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json)); 

    }

    public function callback() {

        $content = trim(file_get_contents("php://input"));
        $decoded = json_decode($content, true);
        

        if (isset($decoded['payment']['txnId']) && isset($decoded['payment']['sum']['amount']) ) {

            if ($decoded['test'] == 'true') {
                $this->calresoponce('OK');
                exit();
            }

            $this->load->model('extension/payment/qiwiw');
            $this->language->load('extension/payment/qiwiwpro');
            $label = explode(";", str_replace(" ","", $decoded['payment']['comment']));
            $purse = $this->db->escape($decoded['payment']['personId']);


            if ($label[1] == 'z') {

                $this->load->model('checkout/order');
                $order_info = $this->model_checkout_order->getOrder((int)$label[2]);
                $paymentcode = $order_info['payment_code'];

                if ($this->config->get($paymentcode . '_debug')) {
                    $this->log->write($decoded);
                }

                $this->language->load('extension/payment/'.$paymentcode);

                $out_summ = $this->model_extension_payment_qiwiw->getCustomFields($order_info, 'outs');
                $out_summ = $this->model_extension_payment_qiwiw->getPayStatus($order_info, $out_summ);
                
                $payinorder = $this->model_extension_payment_qiwiw->getProc($out_summ, $order_info);

                $payments   = number_format($decoded['payment']['sum']['amount'], 2, '.', '');
                $youpayment = number_format($payinorder['sum'], 2, '.', '');
                $operation_id = $this->model_extension_payment_qiwiw->getPaymentTransOStatus($order_info['order_id']);
                if ($youpayment == $payments && $payments > 0 && $operation_id != $decoded['payment']['txnId']) {
                    $secret = $this->model_extension_payment_qiwiw->getSecret($this->config->get($paymentcode . '_login'), $this->config->get($paymentcode . '_password'), $purse);
                    $yahash = $decoded['hash'];
                    $myhash = $decoded['payment']['sum']['currency'] . '|' . $decoded['payment']['sum']['amount'] . '|'. $decoded['payment']['type'] . '|' . $decoded['payment']['account'] . '|' . $decoded['payment']['txnId'];

                    $myhash = hash_hmac("sha256", $myhash, base64_decode($secret));

                    if ($yahash == $myhash) {

                        if ($out_summ > 0) {$paystat['status'] = 0;} else {$paystat['status'] = 1;}
                        if ($paystat['status'] != 1) {
                            $this->calresoponce('OK');
                        } else {
                            exit();
                        }


                        //$this->model_extension_payment_qiwiw->savePayment($num_order, $sum, $date_enroled, $date_created = false, $user, $email, $status, $label, $sender, $label7, $label8);
                        $query = $this->db->query("INSERT INTO `" . DB_PREFIX . "qiwiwpro` SET `num_order` = '" . (int) $order_info['order_id'] . "' , `sum` = '" . $this->db->escape($payments) . "' , `date_enroled` = '" . $this->db->escape($decoded['payment']['date']) . "', `date_created` = '" . $this->db->escape($order_info['date_added']) . "', `user` = '" . $this->db->escape($order_info['payment_firstname']) . " " . $this->db->escape($order_info['payment_lastname']) . "', `email` = '" . $this->db->escape($order_info['email']) . "', `status` = '1', `label` = '".$this->db->escape(number_format($payinorder['comis'], 2, '.', ''))."', `sender` = '" . $this->db->escape($decoded['payment']['txnId']) . "', `label7` = '" . $this->db->escape($order_info['customer_id']) . "', `label8` = '1', `label9` = '".$label[0]."' ");

                        $this->language->load('extension/payment/' . $paymentcode);

                        
                        $out_summ = $this->model_extension_payment_qiwiw->getCustomFields($order_info, 'outs');
                        $out_summ = $this->model_extension_payment_qiwiw->getPayStatus($order_info, $out_summ);


                        if ($out_summ == 0 || $out_summ == 0.00) {
                            if ($this->config->get($paymentcode . '_createorder_or_notcreate') && $order_info['order_status_id'] != $this->config->get($paymentcode . '_on_status_id')) {

                                if ($this->config->get($paymentcode . '_mail_instruction_attach')) {
                                    $inv_id = $order_info['order_id'];
                                    $out_summ = $this->model_extension_payment_qiwiw->getCustomFields($order_info, 'outs');
                                    $action     = $order_info['store_url'] . 'index.php?route=extension/payment/qiwiw';
                                    $online_url = $action .

                                        '&order_id=' . $order_info['order_id'];

                                    $comment = $this->language->get('text_instruction') . "\n\n";
                                    $comment .= $this->model_extension_payment_qiwiw->getCustomFields($order_info, $this->config->get($paymentcode . '_mail_instruction_' . $order_info['language_id']));
                                    $comment = htmlspecialchars_decode($comment);
                                    $this->model_checkout_order->addOrderHistory($order_info['order_id'], $this->config->get($paymentcode . '_order_status_id'), $comment, true);
                                } else {
                                    $this->model_checkout_order->addOrderHistory($order_info['order_id'], $this->config->get($paymentcode . '_order_status_id'), true);
                                }

                                if ($this->config->get($paymentcode . '_success_alert_customer')) {
                                    if ($this->config->get($paymentcode . '_success_comment_attach')) {
                                        $message = $this->model_extension_payment_qiwiw->getCustomFields($order_info, $this->config->get($paymentcode . '_success_comment_' . $order_info['language_id']));
                                        $this->model_checkout_order->addOrderHistory($order_info['order_id'], $this->config->get($paymentcode . '_order_status_id'), $message, true);
                                    } else {
                                        $message = '';
                                        $this->model_checkout_order->addOrderHistory($order_info['order_id'], $this->config->get($paymentcode . '_order_status_id'), $message, true);
                                    }
                                }

                            } else {

                                $yandexpay_status_id = $this->config->get($paymentcode . '_order_status_id');
                                if ($this->config->get($paymentcode . '_success_alert_customer')) {
                                    if ($this->config->get($paymentcode . '_success_comment_attach')) {
                                        $message = $this->model_extension_payment_qiwiw->getCustomFields($order_info, $this->config->get($paymentcode . '_success_comment_' . $order_info['language_id']));
                                        $this->model_checkout_order->addOrderHistory($order_info['order_id'], $this->config->get($paymentcode . '_order_status_id'), $message, true);
                                    } else {
                                        $message = '';
                                        $this->model_checkout_order->addOrderHistory($order_info['order_id'], $this->config->get($paymentcode . '_order_status_id'), $message, true);
                                    }
                                } else {
                                    $this->model_checkout_order->addOrderHistory($order_info['order_id'], $this->config->get($paymentcode . '_order_status_id'), false);

                                }

                            }

                            if ($this->config->get($paymentcode . '_success_alert_admin')) {

                                $subject = sprintf(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'), $order_info['order_id']);
                                $text = sprintf($this->language->get('success_admin_alert'), $order_info['order_id']) . "\n";

                                $this->mailAlert($subject, $text, $this->config->get('config_email'), $order_info['store_name'], true);
                                
                            }
                        }
                        else {
                            $subject = sprintf(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'), $order_info['order_id']);
                            $ocomis = '';
                            if ($this->config->get($order_info['payment_code'].'_komis')) {
                                $ocomis = sprintf($this->language->get('success_morepay_alert_comis'), number_format($payinorder['comis'], 2, '.', ''));
                            }

                            if ($this->config->get($paymentcode . '_morepay_alert_admin')){
                                $text = sprintf($this->language->get('success_morepay_alert_admin'), $order_info['order_id'], $this->config->get($order_info['payment_code'] . '_morepay'), $this->model_extension_payment_qiwiw->getCustomFields($order_info, 'oplacheno'), $this->model_extension_payment_qiwiw->getCustomFields($order_info, 'ostatok'), $payments, $ocomis);
                                $this->mailAlert($subject, $text, $this->config->get('config_email'), $order_info['store_name'], true);
                            }
                            if ($this->config->get($paymentcode . '_morepay_alert_customer')){
                                $text = sprintf($this->language->get('success_morepay_alert_customer'), $order_info['order_id'], $this->config->get($order_info['payment_code'] . '_morepay'), $this->model_extension_payment_qiwiw->getCustomFields($order_info, 'oplacheno'), $this->model_extension_payment_qiwiw->getCustomFields($order_info, 'ostatok'), $payments, $ocomis, $this->model_extension_payment_qiwiw->getCustomFields($order_info, 'href'));
                                $this->mailAlert($subject, $text, $order_info['email'], $order_info['store_name'], false);
                            }
                        }

                    } else {
                        echo "bad sign\n";
                        $this->log->write('qiwiw Error: Hash not equal');
                        exit();
                    }
                } else {
                    echo "Order sum false or Order alredy payed (double callback')\n";
                    $this->log->write('qiwiw Error: Amount of payment not equal or Order alredy payed (double callback');
                    exit();
                }

                exit();

            }

            if (isset($label[3])){
                $paymentcode = $this->db->escape($label[3]);
                if ($this->config->get($paymentcode . '_debug')) {
                    $this->log->write($decoded);
                }
                $this->language->load('extension/payment/'.$paymentcode);
                $secret = $this->model_extension_payment_qiwiw->getSecret($this->config->get($paymentcode . '_login'), $this->config->get($paymentcode . '_password'), $purse);
                $yahash = $decoded['hash'];
                    $myhash = $decoded['payment']['sum']['currency'] . '|' . $decoded['payment']['sum']['amount'] . '|'. $decoded['payment']['type'] . '|' . $decoded['payment']['account'] . '|' . $decoded['payment']['txnId'];

                    $myhash = hash_hmac("sha256", $myhash, base64_decode($secret));
            }
            else{
                $this->log->write('qiwiw Error: No payment code (label[3])');
                echo "No data";
                exit();
            }

            if ($label[1] == 'f') {

                $customer = $label[2];

                if ($customer != 'none') {
                    $check = $customer;
                    $checkmethod = 'email';
                }
                else{
                    if (isset($label[4])){
                        $check = $label[4];
                        $checkmethod = 'user';
                    }
                    else {
                        $check = $decoded['payment']['txnId'];
                        $checkmethod = 'operation';
                    }
                }

                $operation_id = $this->model_extension_payment_qiwiw->getPaymentTransFStatus($this->db->escape($check), $checkmethod);

                if ($yahash == $myhash && $operation_id != $decoded['payment']['txnId']) {
                    $this->calresoponce('OK');

                    
                    if (isset($label[4])){
                        $ncustomer = $label[4];
                    }
                    else{
                        $ncustomer = '';
                    }

                    $this->model_extension_payment_qiwiw->savePayment(0, $decoded['payment']['sum']['amount'], $decoded['payment']['date'], '', $ncustomer, $customer, 1, 0, $decoded['payment']['txnId'], $label[2], 3, $label[0]);


                    if ($customer != 'none') {
                        $subject = html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8');
                        $text = sprintf($this->language->get('addfpay_mail_customer'), $decoded['payment']['txnId'], number_format($decoded['payment']['sum']['amount'], 2, '.', ''));

                        $this->mailAlert($subject, $text, $customer, $this->config->get('config_name'), false);
                    }

                    $subject = html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8');
                    $text = sprintf($this->language->get('addfpay_mail_admin'), $this->db->escape($decoded['payment']['txnId']), $customer . ' '. $ncustomer, number_format($decoded['payment']['sum']['amount'], 2, '.', ''));

                    $this->mailAlert($subject, $text, $this->config->get('config_email'), $this->config->get('config_name'), true);



                }
                else {
                    echo "bad sign\n";
                    $this->log->write('qiwiw Balance Error: Hash not equal');
                }

                exit();
            }

            if ($label[1] == 'b') {
                
                $operation_id = $this->model_extension_payment_qiwiw->getPaymentTransBStatus($this->db->escape($label[2]));

                if ($yahash == $myhash && $operation_id != $decoded['payment']['txnId']) {
                    $this->calresoponce('OK');

                    $this->load->model('account/customer');
                    $customer = $this->model_account_customer->getCustomer($label[2]);

                    $this->model_extension_payment_qiwiw->savePayment(0, $decoded['payment']['sum']['amount'], $decoded['payment']['date'], '', $customer['firstname'] . ' ' . $customer['lastname'], $customer['email'], 1, 0, $decoded['payment']['txnId'], $label[2], 2,$label[0]);

                    $transsum = $this->model_extension_payment_qiwiw->convertTransSum($decoded['payment']['sum']['amount']);

                    $this->model_extension_payment_qiwiw->saveTrans($label[2], sprintf($this->language->get('addbalance_text_transaction'), $this->db->escape($decoded['payment']['txnId'])), $transsum);

                    $subject = html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8');
                    $balance = $this->model_extension_payment_qiwiw->getBalance($label[2]);
                    $balance = $this->currency->format($balance, $this->config->get('config_currency'), '', true);
                    $text = sprintf($this->language->get('addbalance_mail_customer'), $balance);

                    $this->mailAlert($subject, $text, $customer['email'], $this->config->get('config_name'), false);


                }
                else {
                    echo "bad sign\n";
                    $this->log->write('qiwiw Balance Error: Hash not equal');
                }

                exit();
            }

        } else {
            echo "No data";
        }
        
    }

    private function mailAlert($subject, $text, $email, $sender, $additional = false) {

        $mail                = new Mail();
        $mail->protocol      = $this->config->get('config_mail_protocol');
        $mail->parameter     = $this->config->get('config_mail_parameter');
        $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
        $mail->smtp_username = $this->config->get('config_mail_smtp_username');
        $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
        $mail->smtp_port     = $this->config->get('config_mail_smtp_port');
        $mail->smtp_timeout  = $this->config->get('config_mail_smtp_timeout');
        $mail->setTo($email);
        $mail->setFrom($this->config->get('config_email'));
        $mail->setSender($sender);
        $mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
        $mail->setText(html_entity_decode($text, ENT_QUOTES, 'UTF-8'));
        $mail->send();

        if ($additional) {
            $emails = explode(',', $this->config->get('config_alert_email'));

            foreach ($emails as $email) {
                if ($email && preg_match($this->config->get('config_mail_regexp'), $email)) {
                    $mail->setTo($email);
                    $mail->send();
                }
            }
        }
    }

    public function status() {
    	
        if (isset($this->request->get['order_id'])) {
            $this->load->model('checkout/order');
            $order_info = $this->model_checkout_order->getOrder($this->request->get['order_id']);
        } else {
            echo 'No order';
            exit();
        }

        if ($this->request->get['order_id'] == $order_info['order_id']) {
            $inv_id = $order_info['order_id'];
            $this->load->language('extension/payment/qiwiwpro');
            $data['heading_title'] = $this->language->get('heading_title');
            $this->document->setTitle($this->language->get('heading_title'));
            $data['button_continue'] = $this->language->get('button_ok');
            $data['inv_id']          = $order_info['order_id'];

            $this->load->model('extension/payment/qiwiw');

            $online_url = $this->model_extension_payment_qiwiw->getCustomFields($order_info, '~href~');

            $data['text_message'] = '';

            $paymentcode = $order_info['payment_code'];

            $this->load->language('extension/payment/' . $paymentcode);

            $platp      = substr(md5($order_info['order_id'] . $this->config->get('config_encryption')), 0, 12);
            if ($this->request->get['code'] != $platp) {
                $this->response->redirect($this->url->link('error/not_found', '', true));
            }
            if ($order_info['payment_code'] == $paymentcode) {
                $firstal = '';

                if (isset($this->request->get['first']) && $order_info['order_status_id'] == $this->config->get($paymentcode . '_on_status_id')) {
                    $data['text_message'] .= $this->language->get('success_text_first');
                    $firstal = '&first=1';
                }
                
                if ($order_info['order_status_id'] == $this->config->get($paymentcode . '_order_status_id')) {

                    if ($this->config->get($paymentcode . '_createorder_or_notcreate') && isset($this->request->get['first'])) {

                        $this->cart->clear();

                        unset($this->session->data['shipping_method']);
                        unset($this->session->data['shipping_methods']);
                        unset($this->session->data['payment_method']);
                        unset($this->session->data['payment_methods']);
                        unset($this->session->data['guest']);
                        unset($this->session->data['comment']);
                        unset($this->session->data['order_id']);
                        unset($this->session->data['coupon']);
                        unset($this->session->data['reward']);
                        unset($this->session->data['voucher']);
                        unset($this->session->data['vouchers']);
                    }

                    if ($this->config->get($paymentcode . '_returnpage')) {
                        $this->session->data['order_id'] = $order_info['order_id'];
                        $this->response->redirect($this->url->link('checkout/success', 'order_id='.$order_info['order_id'], true));
                    }

                    if ($this->config->get($paymentcode . '_success_page_text_attach')) {

                        $data['text_message'] .= $this->model_extension_payment_qiwiw->getCustomFields($order_info, $this->config->get($paymentcode . '_success_page_text_' . $this->config->get('config_language_id')));
                    } else {
                        $data['text_message'] .= sprintf($this->language->get('success_text'), $inv_id);
                    }
                } else {

                    $out_summ = $this->model_extension_payment_qiwiw->getCustomFields($order_info, 'outs');

                    if ($this->config->get($order_info['payment_code'].'_komis')) {
                        $outs_kom =  $this->model_extension_payment_qiwiw->getCustomFields($order_info, 'plus-komis');
                    }
                    else{
                        $outs_kom =  $this->model_extension_payment_qiwiw->getCustomFields($order_info, 'itogobez');
                    }
                    if ($this->config->get($order_info['payment_code'] . '_morepay') && $outs_kom > $this->config->get($order_info['payment_code'] . '_morepay')) { 
                        $data['text_message']  .= sprintf($this->language->get('send_order_split'), $this->config->get($order_info['payment_code'] . '_morepay'), $this->model_extension_payment_qiwiw->getCustomFields($order_info, 'koplate'));
                        if ($this->config->get($order_info['payment_code'].'_komis')) {
                            $data['text_message']  .= sprintf($this->language->get('send_order_split_comis'), $this->model_extension_payment_qiwiw->getCustomFields($order_info, 'koplate-comis'));
                        }
                        $data['text_message']  .= sprintf($this->language->get('send_order_split2'), $this->model_extension_payment_qiwiw->getCustomFields($order_info, 'ostatok'));
                        $data['text_message']  .= sprintf($this->language->get('send_order_split_button'), $this->model_extension_payment_qiwiw->getCustomFields($order_info, '~payhref~'));
                        if ($this->config->get($paymentcode . '_morepay_redirect')) {
                            $this->response->redirect($this->model_extension_payment_qiwiw->getCustomFields($order_info, '~href~').$firstal);
                        }
                    }

                    if ($this->config->get($paymentcode . '_waiting_page_text_attach')) {
                        $data['text_message'] .= $this->model_extension_payment_qiwiw->getCustomFields($order_info, $this->config->get($paymentcode . '_waiting_page_text_' . $this->config->get('config_language_id')));
                    } else {
                        if ($order_info['order_status_id'] == $this->config->get($paymentcode . '_on_status_id')) {
                            $data['text_message'] .= sprintf($this->language->get('success_text_wait'), $inv_id, $online_url);
                        } else {
                            $data['text_message'] .= sprintf($this->language->get('success_text_wait_noorder'), $online_url);
                        }
                    }
                }
            }

            if ($this->customer->isLogged()) {

                if (!$this->config->get($paymentcode . '_createorder_or_notcreate')) {
                    $data['text_message'] .= sprintf($this->language->get('success_text_loged'), $this->url->link('account/order', '', true), $this->url->link('account/order/info&order_id=' . $inv_id, '', true));
                } else {
                    if ($order_info['order_status_id'] == $this->config->get($paymentcode . '_order_status_id')) {
                        $data['text_message'] .= sprintf($this->language->get('success_text_loged'), $this->url->link('account/order', '', true), $this->url->link('account/order/info&order_id=' . $inv_id, '', true));
                    }
                }
                if ($order_info['order_status_id'] != $this->config->get($paymentcode . '_order_status_id')) {
                    if ($order_info['order_status_id'] == $this->config->get($paymentcode . '_on_status_id')) {
                        $data['text_message'] .= sprintf($this->language->get('waiting_text_loged'), $this->url->link('account/order', '', true));
                    }
                }

            }

            $data['breadcrumbs'] = array();

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_home'),
                'href' => $this->url->link('common/home', '', true),
            );

            if (isset($this->request->get['first'])) {
                $this->language->load('checkout/success');
                $data['breadcrumbs'][] = array(
                    'href' => $this->url->link('checkout/cart', '', true),
                    'text' => $this->language->get('text_basket'),
                );

                $data['breadcrumbs'][] = array(
                    'href' => $this->url->link('checkout/checkout', '', true),
                    'text' => $this->language->get('text_checkout'),
                );
                $data['continue'] = $this->url->link('common/home', '', true);
            } else {
                if ($this->customer->isLogged()) {
                    $data['breadcrumbs'][] = array(
                        'text' => $this->language->get('lich'),
                        'href' => $this->url->link('account/account', '', true),
                    );

                    $data['breadcrumbs'][] = array(
                        'text' => $this->language->get('history'),
                        'href' => $this->url->link('account/order', '', true),
                    );
                    $data['continue'] = $this->url->link('account/order', '', true);
                } else {
                    $data['continue'] = $this->url->link('common/home', '', true);
                }
            }

            $data['column_left']    = $this->load->controller('common/column_left');
            $data['column_right']   = $this->load->controller('common/column_right');
            $data['content_top']    = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer']         = $this->load->controller('common/footer');
            $data['header']         = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('common/success', $data));
        } else {
            echo "No data";
        }
    }

    public function balance() {

        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('extension/payment/qiwiw/balance', '', true);

            $this->response->redirect($this->url->link('account/login', '', true));
        }

        $this->load->language('account/transaction');
        $this->load->language('extension/payment/qiwiwpro');
        $this->document->setTitle($this->language->get('balance_heading_title'));
        $data['heading_title'] = $this->language->get('balance_heading_title');
        $data['button_continue'] = $this->language->get('balance_button_continue');

        $this->load->model('localisation/currency');
        $currency = $this->model_localisation_currency->getCurrencyByCode($this->session->data['currency']);
        $data['balance_currency_code'] = $currency['code'];
        $data['text_balance_sum'] = sprintf($this->language->get('text_balance_sum'), $currency['title']);
        $data['entry_balance_sum'] = $this->language->get('entry_balance_sum');
        $data['text_balance_method'] = $this->language->get('text_balance_method');
        $this->load->model('extension/payment/qiwiw');
        $methods = $this->model_extension_payment_qiwiw->getBalanceMethods();
        $data['payment_methods'] = $methods;
        $data['text_loading'] = $this->language->get('text_loading');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', '', true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_account'),
            'href' => $this->url->link('account/account', '', true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_transaction'),
            'href' => $this->url->link('account/transaction', '', true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_balance'),
            'href' => $this->url->link('extension/payment/qiwiw/balance', '', true)
        );

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view('extension/payment/qiwiw_balance', $data));
    }

    public function addbalance() {

        if (isset($this->request->post['payment_code']) && isset($this->request->post['payment_sum']) && isset($this->request->post['payment_method']) ) {

            $payment_code = $this->request->post['payment_code'];
            $payment_sum = $this->request->post['payment_sum'];
            $payment_method = $this->request->post['payment_method'];

        }

        if (isset($this->request->get['payment_code']) && isset($this->request->get['payment_sum']) && isset($this->request->get['payment_method']) ) {

            $payment_code = $this->request->get['payment_code'];
            $payment_sum = $this->request->get['payment_sum'];
            $payment_method = $this->request->get['payment_method'];

        }

        if (isset($payment_code) && isset($payment_sum) && isset($payment_method) ) {

            if (!$this->customer->isLogged()) {
                $this->session->data['redirect'] = $this->url->link('extension/payment/qiwiw/addbalance', 'payment_code='.$payment_code.'&payment_sum='.$payment_sum.'&payment_method='.$payment_method, true);

                $this->response->redirect($this->url->link('account/login', '', true));
            }

            $data['debug'] = 0;
            $this->load->model('extension/payment/qiwiw');
            $this->language->load('extension/payment/qiwiwpro');
            $this->language->load('extension/payment/'.$payment_method);
            $customer_id = $this->customer->getId();

            $purse = $this->model_extension_payment_qiwiw->getPurse($this->config->get($payment_method . '_login'));

            $paysum = $this->model_extension_payment_qiwiw->rubConverter($payment_sum, $payment_code);

            $total = explode('.' , $paysum);
            $kops = 00;
            if (isset($total[1])){
                $kops = $total[1];
            }

            $query = $this->db->query("SELECT `label9` FROM " . DB_PREFIX . "qiwiwpro WHERE label7 = '" . (int) $customer_id . "' AND label8 = '2'  ORDER BY `status_id` DESC ");

            if (isset($query->row['label9'])) {
                $storetransnum = $query->row['label9']+1;
            }
            else{
                $storetransnum = 1;
            }

            $label = $storetransnum.';b;'.$customer_id.';'.$payment_method;

            $dataurl = array(
                'extra[\'account\']' => $purse,
                'amountInteger' => $total[0],
                'amountFraction' => $kops,
                'extra[\'comment\']' => $label,
                'currency' => '643',
                'blocked[0]' => 'sum',
                'blocked[1]' => 'account',
                'blocked[2]' => 'comment',

            );

            $paymentType = $this->config->get($payment_method . '_methodcode');

            $forredirect = 'https://qiwi.com/payment/form/' . $paymentType . '?' . http_build_query ($dataurl);

            $frame = $this->config->get($payment_method . '_pagepay');

            if ($frame == 'redir'){
                $data['frame'] = false;
            }
            else{
                if ($frame == 'frame') {
                    $data['frame'] = 'frame';
                }
                else{
                    $data['frame'] = 'new';
                    $data['waiting_payment_new_text'] = $this->language->get('waiting_payment_new_text');
                    $data['waiting_payment_new_button'] = $this->language->get('waiting_payment_new_button');
                }
                $data['column_left']    = $this->load->controller('common/column_left');
                $data['column_right']   = $this->load->controller('common/column_right');
                $data['content_top']    = $this->load->controller('common/content_top');
                $data['content_bottom'] = $this->load->controller('common/content_bottom');
                $data['footer']         = $this->load->controller('common/footer');
                $data['header']         = $this->load->controller('common/header');
                $data['wait'] = $this->language->get('waiting_payment');
                $data['checkstate'] = htmlspecialchars_decode ($this->url->link('extension/payment/qiwiw/checkstate', 'ordernum=0&numtrans='.$storetransnum.'&customer='.$customer_id, true));
                $data['redir'] = htmlspecialchars_decode ($this->url->link('extension/payment/qiwiw/bsuccess', '', true) );

            }

            $data['action'] = $forredirect;

            $this->response->setOutput($this->load->view('extension/payment/qiwiw_pay', $data));

        }
    }

    public function bsuccess() {

        $this->load->language('extension/payment/qiwiwpro');
        $this->document->setTitle($this->language->get('balance_heading_title'));
        $data['heading_title'] = $this->language->get('balance_heading_title');
        $data['button_continue'] = $this->language->get('button_ok');
        $data['text_message'] = $this->language->get('addbalance_success_text_message');
        $data['continue'] = $this->url->link('account/transaction', '', true);

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view('extension/payment/qiwiw_balance_success', $data));
    }

    public function fpay() {

        $this->load->language('extension/payment/qiwiwpro');
        $this->document->setTitle($this->language->get('fpay_heading_title'));
        $data['heading_title'] = $this->language->get('fpay_heading_title');
        $data['button_continue'] = $this->language->get('fpay_button_continue');

        $this->load->model('localisation/currency');
        $currency = $this->model_localisation_currency->getCurrencyByCode($this->session->data['currency']);
        $data['fpay_currency_code'] = $currency['code'];
        $data['text_fpay_sum'] = sprintf($this->language->get('text_fpay_sum'), $currency['title']);
        $data['entry_fpay_sum'] = $this->language->get('entry_fpay_sum');
        $data['text_fpay_method'] = $this->language->get('text_fpay_method');
        $data['text_fpay_comment'] = $this->language->get('text_fpay_comment');
        $data['text_fpay_email'] = $this->language->get('text_fpay_email');
        $data['text_fpay_phone'] = $this->language->get('text_fpay_phone');
        $this->load->model('extension/payment/qiwiw');
        $methods = $this->model_extension_payment_qiwiw->getFpayMethods();
        $data['payment_methods'] = $methods;
        $data['text_loading'] = $this->language->get('text_loading');

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view('extension/payment/qiwiw_fpay', $data));
    }

    public function addfpay() {

        if (isset($this->request->post['payment_code']) && isset($this->request->post['payment_sum']) && isset($this->request->post['payment_method']) ) {

            $payment_code = $this->request->post['payment_code'];
            $payment_sum = $this->request->post['payment_sum'];
            $payment_method = $this->request->post['payment_method'];

        }

        if (isset($this->request->get['payment_code']) && isset($this->request->get['payment_sum']) && isset($this->request->get['payment_method']) ) {

            $payment_code = $this->request->get['payment_code'];
            $payment_sum = $this->request->get['payment_sum'];
            $payment_method = $this->request->get['payment_method'];

        }

        if (isset($payment_code) && isset($payment_sum) && isset($payment_method) ) {


            $this->load->model('extension/payment/qiwiw');
            $this->language->load('extension/payment/qiwiwpro');
            $this->language->load('extension/payment/'.$payment_method);

            if (isset($this->request->post['email']) && $this->request->post['email'] != '') {
                $email = $this->request->post['email'];
            }

            if (isset($this->request->get['email']) && $this->request->get['email'] != '') {
                $email = $this->request->get['email'];
            }

            $phone = '';

            if (isset($this->request->post['phone']) && $this->request->post['phone'] != '') {
                $phone = $this->request->post['phone'];
            }

            if (isset($this->request->get['phone']) && $this->request->get['phone'] != '') {
                $phone = $this->request->get['phone'];
            }

            if (isset($email)) {
                $customer = $email;
            }
            else {
                if (isset($phone) && $phone != '') {
                    $customer = ' '.$phone; 
                }
                else{
                    $customer = '';  
                }
                $customer = 'none';
            }


            $purse = $this->model_extension_payment_qiwiw->getPurse($this->config->get($payment_method . '_login'));

            $data['debug'] = 0;

            $paysum = $this->model_extension_payment_qiwiw->rubConverter($payment_sum, $payment_code);

            $total = explode('.' , $paysum);
            $kops = 00;
            if (isset($total[1])){
                $kops = $total[1];
            }

            $query = $this->db->query("SELECT `label9` FROM " . DB_PREFIX . "qiwiwpro WHERE email = '" . $this->db->escape($customer) . "' AND label8 = '3'  ORDER BY `status_id` DESC ");

            if (isset($query->row['label9'])) {
                $storetransnum = $query->row['label9']+1;
            }
            else{
                $storetransnum = 1;
            }

            $label = $storetransnum.';f;'.$customer.';'.$payment_method.';'.$phone;

            $dataurl = array(
                'extra[\'account\']' => $purse,
                'amountInteger' => $total[0],
                'amountFraction' => $kops,
                'extra[\'comment\']' => $label,
                'currency' => '643',
                'blocked[0]' => 'sum',
                'blocked[1]' => 'account',
                'blocked[2]' => 'comment',

            );

            $paymentType = $this->config->get($payment_method . '_methodcode');

            $forredirect = 'https://qiwi.com/payment/form/' . $paymentType . '?' . http_build_query ($dataurl);

            $frame = $this->config->get($payment_method . '_pagepay');

            if ($frame == 'redir'){
                $data['frame'] = false;
            }
            else{
                if ($frame == 'frame') {
                    $data['frame'] = 'frame';
                }
                else{
                    $data['frame'] = 'new';
                    $data['waiting_payment_new_text'] = $this->language->get('waiting_payment_new_text');
                    $data['waiting_payment_new_button'] = $this->language->get('waiting_payment_new_button');
                }
                $data['column_left']    = $this->load->controller('common/column_left');
                $data['column_right']   = $this->load->controller('common/column_right');
                $data['content_top']    = $this->load->controller('common/content_top');
                $data['content_bottom'] = $this->load->controller('common/content_bottom');
                $data['footer']         = $this->load->controller('common/footer');
                $data['header']         = $this->load->controller('common/header');
                $data['wait'] = $this->language->get('waiting_payment');
                $data['checkstate'] = htmlspecialchars_decode ($this->url->link('extension/payment/qiwiw/checkstate', 'ordernum=0&numtrans='.$storetransnum.'&email='.$customer, true));
                $data['redir'] = htmlspecialchars_decode ($this->url->link('extension/payment/qiwiw/fsuccess', '', true) );

            }

            $data['action'] = $forredirect;

            $this->response->setOutput($this->load->view('extension/payment/qiwiw_pay', $data));

        }
    }

    public function fsuccess() {

        $this->load->language('extension/payment/qiwiwpro');
        $this->document->setTitle($this->language->get('fpay_heading_title'));
        $data['heading_title'] = $this->language->get('fpay_heading_title');
        $data['button_continue'] = $this->language->get('button_ok');
        $data['text_message'] = $this->language->get('addfpay_success_text_message');
        $data['continue'] = $this->url->link('common/home', '', true);

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view('extension/payment/qiwiw_fpay_success', $data));
    }
}
?>