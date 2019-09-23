<?php
class ControllerCheckoutSuccess extends Controller {
	public function index() {
		$this->load->language('checkout/success');

		if (isset($this->session->data['order_id'])) {
		//
		  $this->session->data['order_id_tmp'] = $this->session->data['order_id'];
		//
			$this->cart->clear();

			// Add to activity log
			if ($this->config->get('config_customer_activity')) {
				$this->load->model('account/activity');

				if ($this->customer->isLogged()) {
					$activity_data = array(
						'customer_id' => $this->customer->getId(),
						'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName(),
						'order_id'    => $this->session->data['order_id']
					);

					$this->model_account_activity->addActivity('order_account', $activity_data);
				} else {
					$activity_data = array(
						'name'     => $this->session->data['guest']['firstname'] . ' ' . $this->session->data['guest']['lastname'],
						'order_id' => $this->session->data['order_id']
					);

					$this->model_account_activity->addActivity('order_guest', $activity_data);
				}
			}

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
			unset($this->session->data['totals']);
		}

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_basket'),
			'href' => $this->url->link('checkout/cart')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_checkout'),
			'href' => $this->url->link('checkout/checkout', '', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_success'),
			'href' => $this->url->link('checkout/success')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		if ($this->customer->isLogged()) {
			$data['text_message'] = sprintf($this->language->get('text_customer'), $this->url->link('account/account', '', true), $this->url->link('account/order', '', true), $this->url->link('information/contact'));
		} else {
			$data['text_message'] = sprintf($this->language->get('text_guest'), $this->url->link('information/contact'));
		}

		$data['button_continue'] = $this->language->get('button_continue');

		$data['continue'] = $this->url->link('common/home');

//

if(isset($this->session->data['order_id_tmp'])){
                $this->load->model('checkout/order');
                $this->load->model('setting/setting');
                $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id_tmp']);
                $lang = $this->session->data['language'];
                $settings = $this->model_setting_setting->getSetting('buy');
                $buy_lang = isset($settings['buy_lang'][$lang]) ? $settings['buy_lang'][$lang] : $settings['buy_lang'][key($settings['buy_lang'])];
                if($order_info){
                    $lang = '_'.$this->session->data['language'];
                    $heading_title = $buy_lang['success_title'];
                    $success_text = $buy_lang['success_text'];
                    $success_text_logged = $buy_lang['success_text_logged'];

                    $find = array('{firstname}', '{lastname}', '{email}', '{telephone}', '{fax}', '{company}', '{address}', '{address_2}', '{region}', '{city}', '{post_code}', '{country}', '{comment}', '{contact_link}', '{account_link}', '{order_history_link}', '{downloads_link}', '{order_id}', '{order_total}');
                    $replace = array($order_info['firstname'], $order_info['lastname'], $order_info['email'], $order_info['telephone'], $order_info['fax'], $order_info['shipping_company'], $order_info['shipping_address_1'], $order_info['shipping_address_2'], $order_info['shipping_zone'], $order_info['shipping_city'], $order_info['shipping_postcode'], $order_info['shipping_country'], $order_info['comment'], $this->url->link('information/contact'), $this->url->link('account/account'), $this->url->link('account/order'), $this->url->link('account/download'), $this->session->data['order_id_tmp'], $this->currency->format($order_info['total'], $this->session->data['currency']));

                    if(!empty($heading_title)){
                        $data['heading_title'] = str_replace($find, $replace, $heading_title);
                    }
                    if($this->customer->isLogged() && !empty($success_text_logged)){
                        $data['text_message'] = html_entity_decode(str_replace($find, $replace, $success_text_logged));
                    }else if(!empty($success_text)){
                        $data['text_message'] = html_entity_decode(str_replace($find, $replace, $success_text));
                    }
                }
            }
						
						
						//
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/success', $data));
	}
}