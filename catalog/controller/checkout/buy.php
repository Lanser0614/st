<?php

class ControllerCheckoutBuy extends Controller
{

    public function index()
    {

        $data = array();
        $data = array_merge($data, $this->load->language('checkout/buy'));

        $this->load->model('setting/setting');
        $data['settings'] = $this->model_setting_setting->getSetting('buy');

        /* Language */
        $lang = $this->session->data['language'];
        $lang_postfix = '_' . $lang;
        $data['lang'] = $lang_postfix;
        $data['buy_field_lang'] = isset($data['settings']['buy_field_lang'][$lang]) ? $data['settings']['buy_field_lang'][$lang] : $data['settings']['buy_field_lang'][key($data['settings']['buy_field_lang'])];
        $data['buy_lang'] = isset($data['settings']['buy_lang'][$lang]) ? $data['settings']['buy_lang'][$lang] : $data['settings']['buy_lang'][key($data['settings']['buy_lang'])];
        $this->document->setTitle($data['buy_lang']['meta_title']);
        /* END Language */

        /* Scripts & styles */
        if ($data['settings']['buy_telephone_mask']) {
            $this->document->addScript('catalog/view/javascript/jquery/ocp_buy/jquery.maskedinput.min.js');
        }
        $this->document->addScript('catalog/view/javascript/jquery/ocp_buy/script.js');
        if ($data['settings']['buy_bootstrap']) {
            $this->document->addStyle('catalog/view/javascript/jquery/ocp_buy/bootstrap.css');
        }
        $this->document->addStyle('catalog/view/javascript/jquery/ocp_buy/style.css');
        /* END Scripts & styles */

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'href' => $this->url->link('common/home'),
            'text' => $this->language->get('text_home')
        );

        $data['breadcrumbs'][] = array(
            'href' => $this->url->link('checkout/buy'),
            'text' => $data['buy_lang']['h1']
        );

        if ($this->cart->hasProducts() || !empty($this->session->data['vouchers'])) {
            $data['heading_title'] = $data['buy_lang']['h1'];

            if (!$this->cart->hasStock() && (!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning'))) {
                $data['error_warning'] = $this->language->get('error_stock');
            } elseif (isset($this->session->data['error'])) {
                $data['error_warning'] = $this->session->data['error'];

                unset($this->session->data['error']);
            } else {
                $data['error_warning'] = '';
            }

            if ($this->config->get('config_customer_price') && !$this->customer->isLogged()) {
                $data['attention'] = sprintf($this->language->get('text_login'), $this->url->link('account/login'), $this->url->link('account/register'));
            } else {
                $data['attention'] = '';
            }

            if (isset($this->session->data['success'])) {
                $data['success'] = $this->session->data['success'];

                unset($this->session->data['success']);
            } else {
                $data['success'] = '';
            }

            $data['action'] = $this->url->link('checkout/buy/edit');

            if ($this->config->get('config_cart_weight')) {
                $data['weight'] = $this->weight->format($this->cart->getWeight(), $this->config->get('config_weight_class_id'), $this->language->get('decimal_point'), $this->language->get('thousand_point'));
            } else {
                $data['weight'] = '';
            }

            $this->load->model('tool/image');
            $this->load->model('tool/upload');

            $data['products'] = array();
            $data['analogs'] = array();
            $analogs = $this->cart->getAnalogProducts();
            $product_total = 0;
            $analog_total = 0;
            foreach ($analogs as $product) {
                $analog_total = 0;

                foreach ($analogs as $product_2) {
                    if ($product_2['product_id'] == $product['product_id']) {
                        $analog_total += $product_2['quantity'];
                    }
                }


                if ($product['image']) {
                    $image = $this->model_tool_image->resize($product['image'], $this->config->get($this->config->get('config_theme') . '_image_cart_width'), $this->config->get($this->config->get('config_theme') . '_image_cart_height'));
                } else {
                    $image = '';
                }

                $option_data = array();

                foreach ($product['option'] as $option) {
                    if ($option['type'] != 'file') {
                        $value = $option['value'];
                    } else {
                        $upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

                        if ($upload_info) {
                            $value = $upload_info['name'];
                        } else {
                            $value = '';
                        }
                    }

                    $option_data[] = array(
                        'name' => $option['name'],
                        'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
                    );
                }

                // Display prices
                if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                    $price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                } else {
                    $price = false;
                }

                // Display prices
                if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                    $total = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity'], $this->session->data['currency']);
                } else {
                    $total = false;
                }

                $recurring = '';

                if ($product['recurring']) {
                    $frequencies = array(
                        'day' => $this->language->get('text_day'),
                        'week' => $this->language->get('text_week'),
                        'semi_month' => $this->language->get('text_semi_month'),
                        'month' => $this->language->get('text_month'),
                        'year' => $this->language->get('text_year'),
                    );

                    if ($product['recurring']['trial']) {
                        $recurring = sprintf($this->language->get('text_trial_description'), $this->currency->format($this->tax->calculate($product['recurring']['trial_price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['trial_cycle'], $frequencies[$product['recurring']['trial_frequency']], $product['recurring']['trial_duration']) . ' ';
                    }

                    if ($product['recurring']['duration']) {
                        $recurring .= sprintf($this->language->get('text_payment_description'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
                    } else {
                        $recurring .= sprintf($this->language->get('text_payment_until_canceled_description'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
                    }
                }

                $data['analogs'][] = array(
                    'cart_id' => $product['cart_id'],
                    'thumb' => $image,
                    'name' => $product['name'],
                    'model' => $product['model'],
                    'option' => $option_data,
                    'recurring' => $recurring,
                    'quantity' => $product['quantity'],
                    'stock' => $product['stock'] ? true : !(!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning')),
                    'reward' => ($product['reward'] ? sprintf($this->language->get('text_points'), $product['reward']) : ''),
                    'price' => $price,
                    'total' => $total,
                    'href' => $this->url->link('product/product', 'product_id=' . $product['product_id'])
                );
            }
            $products = $this->cart->getProducts();
            foreach ($products as $product) {
                $product_total = 0;

                foreach ($products as $product_2) {
                    if ($product_2['product_id'] == $product['product_id']) {
                        $product_total += $product_2['quantity'];
                    }
                }

                if ($product['minimum'] > $product_total) {
                    $data['error_warning'] = sprintf($this->language->get('error_minimum'), $product['name'], $product['minimum']);
                }

                if ($product['image']) {
                    $image = $this->model_tool_image->resize($product['image'], $this->config->get($this->config->get('config_theme') . '_image_cart_width'), $this->config->get($this->config->get('config_theme') . '_image_cart_height'));
                } else {
                    $image = '';
                }

                $option_data = array();

                foreach ($product['option'] as $option) {
                    if ($option['type'] != 'file') {
                        $value = $option['value'];
                    } else {
                        $upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

                        if ($upload_info) {
                            $value = $upload_info['name'];
                        } else {
                            $value = '';
                        }
                    }

                    $option_data[] = array(
                        'name' => $option['name'],
                        'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
                    );
                }

                // Display prices
                if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                    $price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                } else {
                    $price = false;
                }

                // Display prices
                if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                    $total = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity'], $this->session->data['currency']);
                } else {
                    $total = false;
                }

                $recurring = '';

                if ($product['recurring']) {
                    $frequencies = array(
                        'day' => $this->language->get('text_day'),
                        'week' => $this->language->get('text_week'),
                        'semi_month' => $this->language->get('text_semi_month'),
                        'month' => $this->language->get('text_month'),
                        'year' => $this->language->get('text_year'),
                    );

                    if ($product['recurring']['trial']) {
                        $recurring = sprintf($this->language->get('text_trial_description'), $this->currency->format($this->tax->calculate($product['recurring']['trial_price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['trial_cycle'], $frequencies[$product['recurring']['trial_frequency']], $product['recurring']['trial_duration']) . ' ';
                    }

                    if ($product['recurring']['duration']) {
                        $recurring .= sprintf($this->language->get('text_payment_description'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
                    } else {
                        $recurring .= sprintf($this->language->get('text_payment_until_canceled_description'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
                    }
                }

                $data['products'][] = array(
                    'cart_id' => $product['cart_id'],
                    'thumb' => $image,
                    'name' => $product['name'],
                    'model' => $product['model'],
                    'option' => $option_data,
                    'recurring' => $recurring,
                    'quantity' => $product['quantity'],
                    'stock' => $product['stock'] ? true : !(!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning')),
                    'reward' => ($product['reward'] ? sprintf($this->language->get('text_points'), $product['reward']) : ''),
                    'price' => $price,
                    'total' => $total,
                    'href' => $this->url->link('product/product', 'product_id=' . $product['product_id'])
                );
            }


            //
            $data['producttotal'] = $product_total + $analog_total;
            //

            // Gift Voucher
            $data['vouchers'] = array();

            if (!empty($this->session->data['vouchers'])) {
                foreach ($this->session->data['vouchers'] as $key => $voucher) {
                    $data['vouchers'][] = array(
                        'key' => $key,
                        'description' => $voucher['description'],
                        'amount' => $this->currency->format($voucher['amount'], $this->session->data['currency']),
                        'remove' => $this->url->link('checkout/cart', 'remove=' . $key)
                    );
                }
            }

            $data['totals'] = $this->totals();

            $data['continue'] = $this->url->link('common/home');

            $data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');

            $this->load->model('extension/extension');

            $data['checkout_buttons'] = array();

            /* Guest information */
            $data['customer_groups'] = array();

            if (is_array($this->config->get('config_customer_group_display'))) {
                $this->load->model('account/customer_group');

                $customer_groups = $this->model_account_customer_group->getCustomerGroups();

                foreach ($customer_groups as $customer_group) {
                    if (in_array($customer_group['customer_group_id'], $this->config->get('config_customer_group_display'))) {
                        $data['customer_groups'][] = $customer_group;
                    }
                }
            }


            if (isset($this->session->data['guest']['customer_group_id'])) {
                $data['customer_group_id'] = $this->session->data['guest']['customer_group_id'];
            } else if ($this->customer->isLogged()) {
                $data['customer_group_id'] = $this->customer->getGroupId();
            } else {
                $data['customer_group_id'] = $this->config->get('config_customer_group_id');
            }
            if (isset($this->session->data['guest']['firstname'])) {
                $data['firstname'] = $this->session->data['guest']['firstname'];
            } else if ($this->customer->isLogged()) {
                $data['firstname'] = $this->customer->getFirstname();
            } else {
                $data['firstname'] = '';
            }

            if (isset($this->session->data['guest']['lastname'])) {
                $data['lastname'] = $this->session->data['guest']['lastname'];
            } else if ($this->customer->isLogged()) {
                $data['lastname'] = $this->customer->getLastname();
            } else {
                $data['lastname'] = '';
            }

            if (isset($this->session->data['guest']['email'])) {
                $data['email'] = $this->session->data['guest']['email'];
            } else if ($this->customer->isLogged()) {
                $data['email'] = $this->customer->getEmail();
            } else {
                $data['email'] = '';
            }


            if (isset($this->session->data['guest']['telephone'])) {
                $data['telephone'] = $this->session->data['guest']['telephone'];
            } else if ($this->customer->isLogged()) {
                $data['telephone'] = $this->customer->getTelephone();
            } else {
                $data['telephone'] = '';
            }

            if (isset($this->session->data['guest']['fax'])) {
                $data['fax'] = $this->session->data['guest']['fax'];
            } else if ($this->customer->isLogged()) {
                $data['fax'] = $this->customer->getFax();
            } else {
                $data['fax'] = '';
            }

            $address = array();
            if ($this->customer->isLogged()) {
                $this->load->model('account/address');
                $address = $this->model_account_address->getAddress($this->customer->getAddressId());
            }

            if (isset($this->session->data['payment_address']['company'])) {
                $data['company'] = $this->session->data['payment_address']['company'];
            } else if ($address) {
                $data['company'] = $address['company'];
            } else {
                $data['company'] = '';
            }

            if (isset($this->session->data['payment_address']['address_1'])) {
                $data['address_1'] = $this->session->data['payment_address']['address_1'];
            } else if ($address) {
                $data['address_1'] = $address['address_1'];
            } else {
                $data['address_1'] = '';
            }

            if (isset($this->session->data['payment_address']['address_2'])) {
                $data['address_2'] = $this->session->data['payment_address']['address_2'];
            } else if ($address) {
                $data['address_2'] = $address['address_2'];
            } else {
                $data['address_2'] = '';
            }

            if (isset($this->session->data['payment_address']['postcode'])) {
                $data['postcode'] = $this->session->data['payment_address']['postcode'];
            } elseif (isset($this->session->data['shipping_address']['postcode'])) {
                $data['postcode'] = $this->session->data['shipping_address']['postcode'];
            } else if ($address) {
                $data['postcode'] = $address['postcode'];
            } else {
                $data['postcode'] = '';
            }

            if (isset($this->session->data['payment_address']['city'])) {
                $data['city'] = $this->session->data['payment_address']['city'];
            } else if ($address) {
                $data['city'] = $address['city'];
            } else {
                $data['city'] = '';
            }

            if (isset($this->session->data['payment_address']['country_id'])) {
                $data['country_id'] = $this->session->data['payment_address']['country_id'];
            } elseif (isset($this->session->data['shipping_address']['country_id'])) {
                $data['country_id'] = $this->session->data['shipping_address']['country_id'];
            } else if ($address) {
                $data['country_id'] = $address['country_id'];
            } else {
                $data['country_id'] = $this->config->get('config_country_id');
            }

            if (isset($this->session->data['payment_address']['zone_id'])) {
                $data['zone_id'] = $this->session->data['payment_address']['zone_id'];
            } elseif (isset($this->session->data['shipping_address']['zone_id'])) {
                $data['zone_id'] = $this->session->data['shipping_address']['zone_id'];
            } else if ($address) {
                $data['zone_id'] = $address['zone_id'];
            } else {
                $data['zone_id'] = $this->config->get('config_zone_id');
            }

            $this->load->model('localisation/country');

            $data['countries'] = $this->model_localisation_country->getCountries();

            // Custom Fields
            $this->load->model('account/custom_field');

            $data['custom_fields'] = $this->model_account_custom_field->getCustomFields($this->config->get('config_customer_group_id'));
            $required_custom_fields = array();
            if ($data['custom_fields']) {
                foreach ($data['custom_fields'] as $cf) {
                    if ($cf['required']) {
                        $required_custom_fields[] = $cf['custom_field_id'];
                    }
                }
            }
            $data['required_custom_fields'] = implode(',', $required_custom_fields);

            $custom_fields = array();
            if ($this->customer->isLogged()) {
                $this->load->model('account/customer');
                $this->load->model('account/address');
                $customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
                $address_info = $this->model_account_address->getAddress($this->customer->getAddressId());
                $custom_fields = (array)($customer_info['custom_field'] ? json_decode($customer_info['custom_field'], true) : array()) + (array)$address_info['custom_field'];
            }

            if (isset($this->session->data['guest']['custom_field'])) {
                $data['guest_custom_field'] = $this->session->data['guest']['custom_field'] + $this->session->data['payment_address']['custom_field'];
            } else if ($this->customer->isLogged()) {
                $data['guest_custom_field'] = $custom_fields;
            } else {
                $data['guest_custom_field'] = array();
            }

            $data['shipping_required'] = $this->cart->hasShipping();

            if (isset($this->session->data['guest']['shipping_address'])) {
                $data['shipping_address'] = $this->session->data['guest']['shipping_address'];
            } else {
                $data['shipping_address'] = true;
            }

            if (isset($this->session->data['comment'])) {
                $data['comment'] = $this->session->data['comment'];
            } else {
                $data['comment'] = '';
            }

            if (isset($this->session->data['guest']['register'])) {
                $data['register'] = true;
            } else {
                $data['register'] = false;
            }

            if (!isset($this->session->data['payment_methods'])) {
                if (isset($this->session->data['payment_address'])) {
                    $payment_address = $this->session->data['payment_address'];
                } else {
                    $payment_address = array();
                    $payment_address['country_id'] = $this->config->get('config_country_id');
                    $payment_address['zone_id'] = '';
                }

                $this->updatePaymentMethods($payment_address);
            }

            if (!isset($this->session->data['shipping_methods'])) {
                if (isset($this->session->data['shipping_address'])) {
                    $shipping_address = $this->session->data['shipping_address'];
                } else {
                    $shipping_address = array();
                    $shipping_address['country_id'] = $this->config->get('config_country_id');
                    $shipping_address['zone_id'] = '';
                }

                $this->updateShippingMethods($shipping_address);
            }


            if ($this->config->get('config_checkout_id')) {
                $this->load->model('catalog/information');

                $information_info = $this->model_catalog_information->getInformation($this->config->get('config_checkout_id'));

                if ($information_info) {
                    $data['text_agree'] = $data['buy_lang']['agree_text'] . ' <a href="' . $this->url->link('information/information', 'information_id=' . $this->config->get('config_checkout_id'), 'SSL') . '" target="_blank">' . $information_info['title'] . '</a>';
                } else {
                    $data['text_agree'] = '';
                }
            } else {
                $data['text_agree'] = '';
            }
            /* END Guest information */

            //Coupon
            $data['coupon'] = isset($this->session->data['coupon']) ? $this->session->data['coupon'] : '';

            //Voucher
            $data['voucher'] = isset($this->session->data['voucher']) ? $this->session->data['voucher'] : '';

            $data['customer_logged'] = $this->customer->isLogged();
            $data['login_action'] = $this->url->link('account/login');
            $data['login_redirect'] = $this->url->link('checkout/buy') . '#checkout-f';
            $data['forgotten_link'] = $this->url->link('account/forgotten');

            $data['product_image_width'] = $this->config->get($this->config->get('config_theme') . '_image_cart_width');

            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('checkout/buy', $data));
        } else {
            $data['heading_title'] = $this->language->get('heading_title');

            $data['text_error'] = $this->language->get('text_empty');

            $data['button_continue'] = $this->language->get('button_continue');

            $data['continue'] = $this->url->link('common/home');

            unset($this->session->data['success']);

            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('error/not_found', $data));
        }
    }

    public function edit()
    {
        $this->load->language('checkout/buy');

        $json = array();

        // Update
        if (!empty($this->request->post['quantity'])) {
            foreach ($this->request->post['quantity'] as $key => $value) {
                $this->cart->update($key, $value);
            }

            unset($this->session->data['shipping_method']);
            unset($this->session->data['shipping_methods']);
            unset($this->session->data['payment_method']);
            unset($this->session->data['payment_methods']);
            unset($this->session->data['reward']);

            $totals = $this->totals();

            if (!isset($this->session->data['payment_methods'])) {
                if (isset($this->session->data['payment_address'])) {
                    $payment_address = $this->session->data['payment_address'];
                } else {
                    $payment_address = array();
                    $payment_address['country_id'] = $this->config->get('config_country_id');
                    $payment_address['zone_id'] = '';
                }

                $this->updatePaymentMethods($payment_address);
            }

            if (!isset($this->session->data['shipping_methods'])) {
                if (isset($this->session->data['shipping_address'])) {
                    $shipping_address = $this->session->data['shipping_address'];
                } else {
                    $shipping_address = array();
                    $shipping_address['country_id'] = $this->config->get('config_country_id');
                    $shipping_address['zone_id'] = '';
                }

                $this->updateShippingMethods($shipping_address);
            }

            $stock = true;
            $cart_products = $this->cart->getProducts();
            $json['products'] = array();
            foreach ($cart_products as $product) {
                $json['products'][$product['cart_id']] = array(
                    'price' => $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']),
                    'total' => $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity'], $this->session->data['currency']),
                    'stock' => $product['stock'] ? 1 : !(!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning'))
                );
                if (!$json['products'][$product['cart_id']]['stock']) {
                    $stock = false;
                }
            }

            foreach ($cart_products as $product) {
                $product_total = 0;

                foreach ($cart_products as $product_2) {
                    if ($product_2['product_id'] == $product['product_id']) {
                        $product_total += $product_2['quantity'];
                    }
                }

                if ($product['minimum'] > $product_total) {
                    $json['warning'] = sprintf($this->language->get('error_minimum'), $product['name'], $product['minimum']);

                    break;
                }
            }

            if (!$stock) {
                $json['warning'] = $this->language->get('error_stock');
            }

            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($json));
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function remove()
    {
        $this->load->language('checkout/buy');

        $json = array();

        // Remove
        if (isset($this->request->post['key'])) {
            $this->cart->remove($this->request->post['key']);

            unset($this->session->data['vouchers'][$this->request->post['key']]);

            $this->session->data['success'] = $this->language->get('text_remove');

            unset($this->session->data['shipping_method']);
            unset($this->session->data['shipping_methods']);
            unset($this->session->data['payment_method']);
            unset($this->session->data['payment_methods']);
            unset($this->session->data['reward']);

            // Totals
            $this->load->model('extension/extension');

            $totals = array();
            $taxes = $this->cart->getTaxes();
            $total = 0;

            // Because __call can not keep var references so we put them into an array.
            $total_data = array(
                'totals' => &$totals,
                'taxes' => &$taxes,
                'total' => &$total
            );

            // Display prices
            if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                $sort_order = array();

                $results = $this->model_extension_extension->getExtensions('total');

                foreach ($results as $key => $value) {
                    $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
                }

                array_multisort($sort_order, SORT_ASC, $results);

                foreach ($results as $result) {
                    if ($this->config->get($result['code'] . '_status')) {
                        $this->load->model('extension/total/' . $result['code']);

                        // We have to put the totals in an array so that they pass by reference.
                        $this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
                    }
                }

                $sort_order = array();

                foreach ($totals as $key => $value) {
                    $sort_order[$key] = $value['sort_order'];
                }

                array_multisort($sort_order, SORT_ASC, $totals);
            }

            $data['totals'] = array();

            foreach ($totals as $total) {
                $data['totals'][] = array(
                    'title' => $total['title'],
                    'text' => $this->currency->format($total['value'], $this->session->data['currency'])
                );
            }

            $json['total'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total, $this->session->data['currency']));
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function save()
    {
        $this->load->language('checkout/buy');
        $this->load->model('setting/setting');
        $settings = $this->model_setting_setting->getSetting('buy');

        $json = array();

        // Validate minimum quantity requirements.
        $products = $this->cart->getProducts();

        foreach ($products as $product) {
            $product_total = 0;

            foreach ($products as $product_2) {
                if ($product_2['product_id'] == $product['product_id']) {
                    $product_total += $product_2['quantity'];
                }
            }

            if ($product['minimum'] > $product_total) {
                $json['error']['warning_top'] = sprintf($this->language->get('error_minimum'), $product['name'], $product['minimum']);

                break;
            }
        }

        // Validate cart has products and has stock.
        if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
            $json['error']['warning_top'] = $this->language->get('error_stock');
        }

        // Save temp data
        $allowed_fields = array('firstname', 'lastname', 'email', 'telephone', 'fax', 'company', 'country_id', 'zone_id', 'city', 'address_1', 'address_2', 'postcode', 'comment', 'register');
        foreach ($this->request->post as $field_name => $value) {
            if (in_array($field_name, $allowed_fields)) {
                $this->session->data['guest'][$field_name] = htmlentities(strip_tags($value), ENT_QUOTES, 'UTF-8');
                $this->session->data['payment_address'][$field_name] = htmlentities(strip_tags($value), ENT_QUOTES, 'UTF-8');
            }
        }
        if (!isset($this->request->post['register']) && isset($this->session->data['guest']['register'])) {
            unset($this->session->data['guest']['register']);
        }

        if (!$json) {
            if ($settings['buy_firstname_status'] && $settings['buy_firstname_required'] && (!isset($this->request->post['firstname']) || utf8_strlen(trim($this->request->post['firstname'])) < 1 || utf8_strlen(trim($this->request->post['firstname'])) > 32)) {
                $json['error']['firstname'] = $this->language->get('error_firstname');
            }

            if ($settings['buy_lastname_status'] && $settings['buy_lastname_required'] && (!isset($this->request->post['lastname']) || utf8_strlen(trim($this->request->post['lastname'])) < 1 || utf8_strlen(trim($this->request->post['lastname'])) > 32)) {
                $json['error']['lastname'] = $this->language->get('error_lastname');
            }

            if (!$this->customer->isLogged() && $settings['buy_register_status'] && $settings['buy_register_required']) {
                $settings['buy_email_required'] = true;

                if (!isset($this->request->post['password1']) || empty($this->request->post['password1'])) {
                    $json['error']['password_empty'] = $this->language->get('error_password1');
                }
                if (!isset($this->request->post['password2']) || empty($this->request->post['password2'])) {
                    $json['error']['password_empty'] = $this->language->get('error_password2');
                }
                if (isset($this->request->post['password1']) && isset($this->request->post['password2']) && $this->request->post['password1'] !== $this->request->post['password2']) {
                    $json['error']['password_equal'] = $this->language->get('error_password_equal');
                }
                if ((utf8_strlen($this->request->post['password1']) < 4) || (utf8_strlen($this->request->post['password1']) > 20)) {
                    $json['error']['password_empty'] = $this->language->get('error_password');
                }
            } else if ($settings['buy_register_status'] && isset($this->request->post['register'])) {
                $settings['buy_email_required'] = true;
                if (!isset($this->request->post['password1']) || !isset($this->request->post['password2']) || empty($this->request->post['password1']) || empty($this->request->post['password2'])) {
                    $json['error']['password_empty'] = $this->language->get('error_password_empty');
                } else if ($this->request->post['password1'] !== $this->request->post['password2']) {
                    $json['error']['password_equal'] = $this->language->get('error_password_equal');
                } else if ((utf8_strlen($this->request->post['password1']) < 4) || (utf8_strlen($this->request->post['password1']) > 20)) {
                    $json['error']['password_empty'] = $this->language->get('error_password');
                }
            }

            $this->load->model('account/customer');
            if (isset($this->request->post['register']) && $this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
                $json['error']['warning'] = $this->language->get('error_email_exists');
            }

            if ($settings['buy_email_status'] && $settings['buy_email_required'] && (!isset($this->request->post['email']) || utf8_strlen($this->request->post['email']) > 96 || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email']))) {
                $json['error']['email'] = $this->language->get('error_email');
            }


            if ($settings['buy_telephone_status'] && $settings['buy_telephone_required'] && (!isset($this->request->post['telephone']) || utf8_strlen($this->request->post['telephone']) < 3 || utf8_strlen($this->request->post['telephone']) > 32)) {
                $json['error']['telephone'] = $this->language->get('error_telephone');
            }

            if ($settings['buy_fax_status'] && $settings['buy_fax_required'] && (!isset($this->request->post['fax']) || utf8_strlen($this->request->post['fax']) < 3 || utf8_strlen($this->request->post['fax']) > 32)) {
                $json['error']['fax'] = $this->language->get('error_fax');
            }

            if ($settings['buy_address_1_status'] && $settings['buy_address_1_required'] && (!isset($this->request->post['address_1']) || utf8_strlen(trim($this->request->post['address_1'])) < 3 || utf8_strlen(trim($this->request->post['address_1'])) > 128)) {
                $json['error']['address_1'] = $this->language->get('error_address_1');
            }
            if ($settings['buy_address_2_status'] && $settings['buy_address_2_required'] && (!isset($this->request->post['address_2']) || utf8_strlen(trim($this->request->post['address_2'])) < 3 || utf8_strlen(trim($this->request->post['address_2'])) > 128)) {
                $json['error']['address_2'] = $this->language->get('error_address_2');
            }

            if ($settings['buy_city_status'] && $settings['buy_city_required'] && (!isset($this->request->post['city']) || utf8_strlen(trim($this->request->post['city'])) < 2 || utf8_strlen(trim($this->request->post['city'])) > 128)) {
                $json['error']['city'] = $this->language->get('error_city');
            }

            $this->load->model('localisation/country');

            $country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

            if ($settings['buy_postcode_status'] && $settings['buy_postcode_required'] && $country_info && $country_info['postcode_required'] && (!isset($this->request->post['postcode']) || utf8_strlen(trim($this->request->post['postcode'])) < 2 || utf8_strlen(trim($this->request->post['postcode'])) > 10)) {
                $json['error']['postcode'] = $this->language->get('error_postcode');
            }

            if ($settings['buy_country_status'] && $settings['buy_country_required'] && $this->request->post['country_id'] == '') {
                $json['error']['country'] = $this->language->get('error_country');
            }

            if ($settings['buy_zone_status'] && $settings['buy_zone_required'] && (!isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '')) {
                $json['error']['zone'] = $this->language->get('error_zone');
            }
            if ($settings['buy_comment_status'] && $settings['buy_comment_required'] && (!isset($this->request->post['comment']) || $this->request->post['comment'] == '')) {
                $json['error']['comment'] = $this->language->get('error_comment');
            }
            if ($settings['buy_company_status'] && $settings['buy_company_required'] && (!isset($this->request->post['company']) || $this->request->post['company'] == '')) {
                $json['error']['company'] = $this->language->get('error_company');
            }

            // Customer Group
            if (isset($this->request->post['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->post['customer_group_id'], $this->config->get('config_customer_group_display'))) {
                $customer_group_id = $this->request->post['customer_group_id'];
            } else {
                $customer_group_id = $this->config->get('config_customer_group_id');
            }

            // Custom field validation
            $this->load->model('account/custom_field');

            $custom_fields = $this->model_account_custom_field->getCustomFields($customer_group_id);

            foreach ($custom_fields as $custom_field) {
                if ($custom_field['required'] && empty($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']])) {
                    $json['error']['custom_field' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
                }
            }

            if (!isset($this->request->post['shipping_method'])) {
                $json['error']['warning'] = $this->language->get('error_shipping');
            } else {
                $shipping = explode('.', $this->request->post['shipping_method']);

                if (!isset($shipping[0]) || !isset($shipping[1]) || !isset($this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]])) {
                    $json['error']['warning'] = $this->language->get('error_shipping');
                }
            }

            if (!isset($this->request->post['payment_method'])) {
                $json['error']['warning'] = $this->language->get('error_payment');
            } elseif (!isset($this->session->data['payment_methods'][$this->request->post['payment_method']])) {
                $json['error']['warning'] = $this->language->get('error_payment');
            }

            if ($settings['buy_min_order_sum'] && $settings['buy_min_order_sum'] && $this->cart->getTotal() < $settings['buy_min_order_sum']) {
                $json['error']['warning'] = sprintf($this->language->get('error_min_order_sum'), $this->currency->format($settings['buy_min_order_sum']), $this->session->data['currency']);
            }
        }

        if (!$json) {
            $this->session->data['account'] = 'guest';

            $empty = '';

            $this->session->data['guest']['customer_group_id'] = $customer_group_id;
            $this->session->data['guest']['firstname'] = isset($this->request->post['firstname']) ? $this->request->post['firstname'] : $empty;
            $this->session->data['guest']['lastname'] = isset($this->request->post['lastname']) ? $this->request->post['lastname'] : $empty;
            $this->session->data['guest']['email'] = isset($this->request->post['email']) ? $this->request->post['email'] : $empty;
            $this->session->data['guest']['telephone'] = isset($this->request->post['telephone']) ? $this->request->post['telephone'] : $empty;
            $this->session->data['guest']['fax'] = isset($this->request->post['fax']) ? $this->request->post['fax'] : $empty;
            $this->session->data['guest']['register'] = isset($this->request->post['register']) ? $this->request->post['register'] : $empty;
            $this->session->data['guest']['password'] = isset($this->request->post['password1']) ? $this->request->post['password1'] : $empty;

            if (isset($this->request->post['custom_field']['account'])) {
                $this->session->data['guest']['custom_field'] = $this->request->post['custom_field']['account'];
            } else {
                $this->session->data['guest']['custom_field'] = array();
            }

            $this->session->data['payment_address']['firstname'] = isset($this->request->post['firstname']) ? $this->request->post['firstname'] : $empty;
            $this->session->data['payment_address']['lastname'] = isset($this->request->post['lastname']) ? $this->request->post['lastname'] : $empty;
            $this->session->data['payment_address']['company'] = isset($this->request->post['company']) ? $this->request->post['company'] : $empty;
            $this->session->data['payment_address']['address_1'] = isset($this->request->post['address_1']) ? $this->request->post['address_1'] : $empty;
            $this->session->data['payment_address']['address_2'] = isset($this->request->post['address_2']) ? $this->request->post['address_2'] : $empty;
            $this->session->data['payment_address']['postcode'] = isset($this->request->post['postcode']) ? $this->request->post['postcode'] : $empty;
            $this->session->data['payment_address']['city'] = isset($this->request->post['city']) ? $this->request->post['city'] : $empty;
            $this->session->data['payment_address']['country_id'] = isset($this->request->post['country_id']) ? $this->request->post['country_id'] : $empty;
            $this->session->data['payment_address']['zone_id'] = isset($this->request->post['zone_id']) ? $this->request->post['zone_id'] : $empty;

            $this->load->model('localisation/country');

            $country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

            if ($country_info) {
                $this->session->data['payment_address']['country'] = $country_info['name'];
                $this->session->data['payment_address']['iso_code_2'] = $country_info['iso_code_2'];
                $this->session->data['payment_address']['iso_code_3'] = $country_info['iso_code_3'];
                $this->session->data['payment_address']['address_format'] = $country_info['address_format'];
            } else {
                $this->session->data['payment_address']['country'] = '';
                $this->session->data['payment_address']['iso_code_2'] = '';
                $this->session->data['payment_address']['iso_code_3'] = '';
                $this->session->data['payment_address']['address_format'] = '';
            }

            if (isset($this->request->post['custom_field']['address'])) {
                $this->session->data['payment_address']['custom_field'] = $this->request->post['custom_field']['address'];
            } else {
                $this->session->data['payment_address']['custom_field'] = array();
            }

            $this->load->model('localisation/zone');

            $zone_info = $this->model_localisation_zone->getZone($this->request->post['zone_id']);

            if ($zone_info) {
                $this->session->data['payment_address']['zone'] = $zone_info['name'];
                $this->session->data['payment_address']['zone_code'] = $zone_info['code'];
            } else {
                $this->session->data['payment_address']['zone'] = '';
                $this->session->data['payment_address']['zone_code'] = '';
            }

            $this->session->data['guest']['shipping_address'] = $this->session->data['payment_address'];

            // Default Payment Address
            if ($this->session->data['guest']['shipping_address']) {
                $this->session->data['shipping_address']['firstname'] = isset($this->request->post['firstname']) ? $this->request->post['firstname'] : $empty;
                $this->session->data['shipping_address']['lastname'] = isset($this->request->post['lastname']) ? $this->request->post['lastname'] : $empty;
                $this->session->data['shipping_address']['company'] = isset($this->request->post['company']) ? $this->request->post['company'] : $empty;
                $this->session->data['shipping_address']['address_1'] = isset($this->request->post['address_1']) ? $this->request->post['address_1'] : $empty;
                $this->session->data['shipping_address']['address_2'] = isset($this->request->post['address_2']) ? $this->request->post['address_2'] : $empty;
                $this->session->data['shipping_address']['postcode'] = isset($this->request->post['postcode']) ? $this->request->post['postcode'] : $empty;
                $this->session->data['shipping_address']['city'] = isset($this->request->post['city']) ? $this->request->post['city'] : $empty;
                $this->session->data['shipping_address']['country_id'] = isset($this->request->post['country_id']) ? $this->request->post['country_id'] : $empty;
                $this->session->data['shipping_address']['zone_id'] = isset($this->request->post['zone_id']) ? $this->request->post['zone_id'] : $empty;

                if ($country_info) {
                    $this->session->data['shipping_address']['country'] = $country_info['name'];
                    $this->session->data['shipping_address']['iso_code_2'] = $country_info['iso_code_2'];
                    $this->session->data['shipping_address']['iso_code_3'] = $country_info['iso_code_3'];
                    $this->session->data['shipping_address']['address_format'] = $country_info['address_format'];
                } else {
                    $this->session->data['shipping_address']['country'] = '';
                    $this->session->data['shipping_address']['iso_code_2'] = '';
                    $this->session->data['shipping_address']['iso_code_3'] = '';
                    $this->session->data['shipping_address']['address_format'] = '';
                }

                if ($zone_info) {
                    $this->session->data['shipping_address']['zone'] = $zone_info['name'];
                    $this->session->data['shipping_address']['zone_code'] = $zone_info['code'];
                } else {
                    $this->session->data['shipping_address']['zone'] = '';
                    $this->session->data['shipping_address']['zone_code'] = '';
                }

                if (isset($this->request->post['custom_field']['address'])) {
                    $this->session->data['shipping_address']['custom_field'] = $this->request->post['custom_field']['address'];
                } else {
                    $this->session->data['shipping_address']['custom_field'] = array();
                }
            }

            $this->session->data['shipping_method'] = $this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]];
            $this->session->data['payment_method'] = $this->session->data['payment_methods'][$this->request->post['payment_method']];
            $this->session->data['comment'] = isset($this->request->post['comment']) ? $this->request->post['comment'] : '';

        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function getShippingMethods()
    {
        $this->load->language('checkout/buy');

        $lang = $this->session->data['language'];
        $this->load->model('setting/setting');
        $settings = $this->model_setting_setting->getSetting('buy');
        $data['buy_lang'] = isset($settings['buy_lang'][$lang]) ? $settings['buy_lang'][$lang] : $settings['buy_lang'][key($settings['buy_lang'])];

        if (isset($this->session->data['shipping_address'])) {
            $shipping_address = $this->session->data['shipping_address'];
            if (!isset($shipping_address['country_id']) || empty($shipping_address['country_id'])) {
                $shipping_address['country_id'] = isset($this->request->post['country_id']) ? $this->request->post['country_id'] : $this->config->get('config_country_id');
            }
            if (!isset($shipping_address['zone_id']) || empty($shipping_address['zone_id'])) {
                $shipping_address['zone_id'] = isset($this->request->post['zone_id']) ? $this->request->post['zone_id'] : $this->config->get('zone_id');
            }
            if (!isset($shipping_address['city']) || empty($shipping_address['city'])) {
                $shipping_address['city'] = isset($this->request->post['city']) ? $this->request->post['city'] : '';
            }
            if (!isset($shipping_address['postcode']) || empty($shipping_address['postcode'])) {
                $shipping_address['postcode'] = isset($this->request->post['postcode']) ? $this->request->post['postcode'] : '';
            }
        } else {
            $shipping_address = array();
            $shipping_address['country_id'] = isset($this->request->post['country_id']) ? $this->request->post['country_id'] : $this->config->get('config_country_id');
            $shipping_address['zone_id'] = isset($this->request->post['zone_id']) ? $this->request->post['zone_id'] : '';
            $shipping_address['city'] = isset($this->request->post['city']) ? $this->request->post['city'] : '';
            $shipping_address['postcode'] = isset($this->request->post['postcode']) ? $this->request->post['postcode'] : '';
        }

        $this->updateShippingMethods($shipping_address);

        $data['text_shipping_method'] = $this->language->get('text_shipping_method');
        $data['text_loading'] = $this->language->get('text_loading');

        if (empty($this->session->data['shipping_methods'])) {
            $data['error_warning'] = sprintf($this->language->get('error_no_shipping'), $this->url->link('information/contact'));
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['shipping_methods'])) {
            $data['shipping_methods'] = $this->session->data['shipping_methods'];
        } else {
            $data['shipping_methods'] = array();
        }

        if (isset($this->session->data['shipping_method']['code'])) {
            $data['code'] = $this->session->data['shipping_method']['code'];
        } else {
            $data['code'] = '';
        }

        $this->response->setOutput($this->load->view('checkout/buy_shipping_method', $data));
    }

    public function getPaymentMethods()
    {
        $this->load->language('checkout/buy');

        $lang = $this->session->data['language'];
        $this->load->model('setting/setting');
        $settings = $this->model_setting_setting->getSetting('buy');
        $data['buy_lang'] = isset($settings['buy_lang'][$lang]) ? $settings['buy_lang'][$lang] : $settings['buy_lang'][key($settings['buy_lang'])];

        if (isset($this->session->data['shipping_address'])) {
            $payment_address = $this->session->data['shipping_address'];
            if (!isset($payment_address['country_id']) || empty($payment_address['country_id'])) {
                $payment_address['country_id'] = isset($this->request->post['country_id']) ? $this->request->post['country_id'] : $this->config->get('config_country_id');
            }
            if (!isset($payment_address['zone_id']) || empty($payment_address['zone_id'])) {
                $payment_address['zone_id'] = isset($this->request->post['zone_id']) ? $this->request->post['zone_id'] : $this->config->get('zone_id');
            }
            if (!isset($payment_address['city']) || empty($payment_address['city'])) {
                $payment_address['city'] = isset($this->request->post['city']) ? $this->request->post['city'] : '';
            }
            if (!isset($payment_address['postcode']) || empty($payment_address['postcode'])) {
                $payment_address['postcode'] = isset($this->request->post['postcode']) ? $this->request->post['postcode'] : '';
            }
        } else {
            $payment_address = array();
            $payment_address['country_id'] = isset($this->request->post['country_id']) ? $this->request->post['country_id'] : $this->config->get('config_country_id');
            $payment_address['zone_id'] = isset($this->request->post['zone_id']) ? $this->request->post['zone_id'] : '';
            $payment_address['city'] = isset($this->request->post['city']) ? $this->request->post['city'] : '';
            $payment_address['postcode'] = isset($this->request->post['postcode']) ? $this->request->post['postcode'] : '';
        }

        $this->updatePaymentMethods($payment_address);

        $data['text_payment_method'] = $this->language->get('text_payment_method');
        $data['text_loading'] = $this->language->get('text_loading');

        $data['button_continue'] = $this->language->get('button_continue');

        if (empty($this->session->data['payment_methods'])) {
            $data['error_warning'] = sprintf($this->language->get('error_no_payment'), $this->url->link('information/contact'));
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['payment_methods'])) {
            $data['payment_methods'] = $this->session->data['payment_methods'];
        } else {
            $data['payment_methods'] = array();
        }

        if (isset($this->session->data['payment_method']['code'])) {
            $data['code'] = $this->session->data['payment_method']['code'];
        } else {
            $data['code'] = '';
        }

        $data['scripts'] = $this->document->getScripts();

        if ($this->config->get('config_checkout_id')) {
            $this->load->model('catalog/information');

            $information_info = $this->model_catalog_information->getInformation($this->config->get('config_checkout_id'));

            if ($information_info) {
                $data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/agree', 'information_id=' . $this->config->get('config_checkout_id'), 'SSL'), $information_info['title'], $information_info['title']);
            } else {
                $data['text_agree'] = '';
            }
        } else {
            $data['text_agree'] = '';
        }

        if (isset($this->session->data['agree'])) {
            $data['agree'] = $this->session->data['agree'];
        } else {
            $data['agree'] = '';
        }

        $this->response->setOutput($this->load->view('checkout/buy_payment_method', $data));
    }

    function getPaymentForm()
    {
        if (isset($this->session->data['payment_methods'])) {
            $this->session->data['payment_method'] = $this->session->data['payment_methods'][$this->request->post['payment_method']];
            if (isset($this->request->post['code'])) {
                $json = array();
                $json['output'] = $this->load->controller('extension/payment/' . $this->session->data['payment_method']['code']);
                $this->response->addHeader('Content-Type: application/json');
                $this->response->setOutput(json_encode($json));
            }
        }
    }

    public function confirm()
    {
        $redirect = '';
        $reason = '';

        if ($this->cart->hasShipping()) {
            // Validate if shipping address has been set.
            if (!isset($this->session->data['shipping_address'])) {
                $redirect = $this->url->link('checkout/buy', '', 'SSL');
                $reason = 'shipping_address';
            }

            // Validate if shipping method has been set.
            if (!isset($this->session->data['shipping_method'])) {
                $redirect = $this->url->link('checkout/buy', '', 'SSL');
                $reason = 'shipping_method';
            }
        } else {
            unset($this->session->data['shipping_address']);
            unset($this->session->data['shipping_method']);
            unset($this->session->data['shipping_methods']);
        }

        // Validate if payment address has been set.
        if (!isset($this->session->data['payment_address'])) {
            $redirect = $this->url->link('checkout/buy', '', 'SSL');
            $reason = 'payment_address';
        }

        // Validate if payment method has been set.
        if (!isset($this->session->data['payment_method'])) {
            $redirect = $this->url->link('checkout/buy', '', 'SSL');
            $reason = 'payment_method';
        }

        // Validate cart has products and has stock.
        if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
            $redirect = $this->url->link('checkout/buy');
            $reason = 'Validate cart has products and has stock';
        }

        // Validate minimum quantity requirements.
        $products = $this->cart->getProducts();
        foreach ($products as $product) {
            $product_total = 0;

            foreach ($products as $product_2) {
                if ($product_2['product_id'] == $product['product_id']) {
                    $product_total += $product_2['quantity'];
                }
            }

            if ($product['minimum'] > $product_total) {
                $redirect = $this->url->link('checkout/buy');
                $reason = 'minimum';

                break;
            }
        }

        if (!$redirect) {
            $order_data = array();

            $order_data['totals'] = $this->totals();

            $this->load->language('checkout/checkout');

            $order_data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
            $order_data['store_id'] = $this->config->get('config_store_id');
            $order_data['store_name'] = $this->config->get('config_name');

            if ($order_data['store_id']) {
                $order_data['store_url'] = $this->config->get('config_url');
            } else {
                $order_data['store_url'] = HTTP_SERVER;
            }

            if ($this->customer->isLogged()) {
                $this->load->model('account/customer');

                $customer_info = $this->model_account_customer->getCustomer($this->customer->getId());

                $order_data['customer_id'] = $this->customer->getId();
                $order_data['customer_group_id'] = $customer_info['customer_group_id'];
                $order_data['firstname'] = $customer_info['firstname'];
                $order_data['lastname'] = $customer_info['lastname'];
                $order_data['email'] = $customer_info['email'];
                $order_data['telephone'] = $customer_info['telephone'];
                $order_data['fax'] = $customer_info['fax'];
                $order_data['custom_field'] = json_decode($customer_info['custom_field'], true);
            } elseif (isset($this->session->data['guest'])) {
                $order_data['customer_id'] = 0;
                $order_data['customer_group_id'] = $this->session->data['guest']['customer_group_id'];
                $order_data['firstname'] = $this->session->data['guest']['firstname'];
                $order_data['lastname'] = $this->session->data['guest']['lastname'];
                $order_data['email'] = $this->session->data['guest']['email'];
                $order_data['password'] = $this->session->data['guest']['password'];
                $order_data['telephone'] = $this->session->data['guest']['telephone'];
                $order_data['fax'] = $this->session->data['guest']['fax'];
                $order_data['custom_field'] = $this->session->data['guest']['custom_field'];
            }

            $order_data['payment_firstname'] = $this->session->data['payment_address']['firstname'];
            $order_data['payment_lastname'] = $this->session->data['payment_address']['lastname'];
            $order_data['payment_company'] = $this->session->data['payment_address']['company'];
            $order_data['payment_address_1'] = $this->session->data['payment_address']['address_1'];
            $order_data['payment_address_2'] = $this->session->data['payment_address']['address_2'];
            $order_data['payment_city'] = $this->session->data['payment_address']['city'];
            $order_data['payment_postcode'] = $this->session->data['payment_address']['postcode'];
            $order_data['payment_zone'] = $this->session->data['payment_address']['zone'];
            $order_data['payment_zone_id'] = $this->session->data['payment_address']['zone_id'];
            $order_data['payment_country'] = $this->session->data['payment_address']['country'];
            $order_data['payment_country_id'] = $this->session->data['payment_address']['country_id'];
            $order_data['payment_address_format'] = $this->session->data['payment_address']['address_format'];
            $order_data['payment_custom_field'] = $this->session->data['payment_address']['custom_field'];

            if (isset($this->session->data['payment_method']['title'])) {
                $order_data['payment_method'] = $this->session->data['payment_method']['title'];
            } else {
                $order_data['payment_method'] = '';
            }

            if (isset($this->session->data['payment_method']['code'])) {
                $order_data['payment_code'] = $this->session->data['payment_method']['code'];
            } else {
                $order_data['payment_code'] = '';
            }

            if ($this->cart->hasShipping()) {
                $order_data['shipping_firstname'] = $this->session->data['shipping_address']['firstname'];
                $order_data['shipping_lastname'] = $this->session->data['shipping_address']['lastname'];
                $order_data['shipping_company'] = $this->session->data['shipping_address']['company'];
                $order_data['shipping_address_1'] = $this->session->data['shipping_address']['address_1'];
                $order_data['shipping_address_2'] = $this->session->data['shipping_address']['address_2'];
                $order_data['shipping_city'] = $this->session->data['shipping_address']['city'];
                $order_data['shipping_postcode'] = $this->session->data['shipping_address']['postcode'];
                $order_data['shipping_zone'] = $this->session->data['shipping_address']['zone'];
                $order_data['shipping_zone_id'] = $this->session->data['shipping_address']['zone_id'];
                $order_data['shipping_country'] = $this->session->data['shipping_address']['country'];
                $order_data['shipping_country_id'] = $this->session->data['shipping_address']['country_id'];
                $order_data['shipping_address_format'] = $this->session->data['shipping_address']['address_format'];
                $order_data['shipping_custom_field'] = $this->session->data['shipping_address']['custom_field'];

                if (isset($this->session->data['shipping_method']['title'])) {
                    $order_data['shipping_method'] = $this->session->data['shipping_method']['title'];
                } else {
                    $order_data['shipping_method'] = '';
                }

                if (isset($this->session->data['shipping_method']['code'])) {
                    $order_data['shipping_code'] = $this->session->data['shipping_method']['code'];
                } else {
                    $order_data['shipping_code'] = '';
                }
            } else {
                $order_data['shipping_firstname'] = '';
                $order_data['shipping_lastname'] = '';
                $order_data['shipping_company'] = '';
                $order_data['shipping_address_1'] = '';
                $order_data['shipping_address_2'] = '';
                $order_data['shipping_city'] = '';
                $order_data['shipping_postcode'] = '';
                $order_data['shipping_zone'] = '';
                $order_data['shipping_zone_id'] = '';
                $order_data['shipping_country'] = '';
                $order_data['shipping_country_id'] = '';
                $order_data['shipping_address_format'] = '';
                $order_data['shipping_custom_field'] = array();
                $order_data['shipping_method'] = '';
                $order_data['shipping_code'] = '';
            }

            $order_data['products'] = array();

            foreach ($this->cart->getProducts() as $product) {
                $option_data = array();

                foreach ($product['option'] as $option) {
                    $option_data[] = array(
                        'product_option_id' => $option['product_option_id'],
                        'product_option_value_id' => $option['product_option_value_id'],
                        'option_id' => $option['option_id'],
                        'option_value_id' => $option['option_value_id'],
                        'name' => $option['name'],
                        'value' => $option['value'],
                        'type' => $option['type']
                    );
                }

                $order_data['products'][] = array(
                    'product_id' => $product['product_id'],
                    'name' => $product['name'],
                    'model' => $product['model'],
                    'option' => $option_data,
                    'download' => $product['download'],
                    'quantity' => $product['quantity'],
                    'subtract' => $product['subtract'],
                    'price' => $product['price'],
                    'total' => $product['total'],
                    'tax' => $this->tax->getTax($product['price'], $product['tax_class_id']),
                    'reward' => $product['reward']
                );
            }
            foreach ($this->cart->getAnalogProducts() as $product) {
                $option_data = array();

                foreach ($product['option'] as $option) {
                    $option_data[] = array(
                        'product_option_id' => $option['product_option_id'],
                        'product_option_value_id' => $option['product_option_value_id'],
                        'option_id' => $option['option_id'],
                        'option_value_id' => $option['option_value_id'],
                        'name' => $option['name'],
                        'value' => $option['value'],
                        'type' => $option['type']
                    );
                }

                $order_data['products'][] = array(
                    'product_id' => $product['product_id'],
                    'name' => $product['name'],
                    'model' => $product['model'],
                    'article_id' => $product['article_id'],
                    'article' => $product['article'],
                    'option' => $option_data,
                    'download' => $product['download'],
                    'quantity' => $product['quantity'],
                    'subtract' => $product['subtract'],
                    'price' => $product['price'],
                    'total' => $product['total'],
                    'tax' => $this->tax->getTax($product['price'], $product['tax_class_id']),
                    'reward' => $product['reward']
                );
            }
            // Gift Voucher
            $order_data['vouchers'] = array();

            if (!empty($this->session->data['vouchers'])) {
                foreach ($this->session->data['vouchers'] as $voucher) {
                    $order_data['vouchers'][] = array(
                        'description' => $voucher['description'],
                        'code' => substr(md5(mt_rand()), 0, 10),
                        'to_name' => $voucher['to_name'],
                        'to_email' => $voucher['to_email'],
                        'from_name' => $voucher['from_name'],
                        'from_email' => $voucher['from_email'],
                        'voucher_theme_id' => $voucher['voucher_theme_id'],
                        'message' => $voucher['message'],
                        'amount' => $voucher['amount']
                    );
                }
            }

            $order_data['comment'] = $this->session->data['comment'];
            $total = end($order_data['totals']);
            $order_data['total'] = $total['value'];

            if (isset($this->request->cookie['tracking'])) {
                $order_data['tracking'] = $this->request->cookie['tracking'];

                $subtotal = $this->cart->getSubTotal();

                // Affiliate
                $this->load->model('affiliate/affiliate');

                $affiliate_info = $this->model_affiliate_affiliate->getAffiliateByCode($this->request->cookie['tracking']);

                if ($affiliate_info) {
                    $order_data['affiliate_id'] = $affiliate_info['affiliate_id'];
                    $order_data['commission'] = ($subtotal / 100) * $affiliate_info['commission'];
                } else {
                    $order_data['affiliate_id'] = 0;
                    $order_data['commission'] = 0;
                }

                // Marketing
                $this->load->model('checkout/marketing');

                $marketing_info = $this->model_checkout_marketing->getMarketingByCode($this->request->cookie['tracking']);

                if ($marketing_info) {
                    $order_data['marketing_id'] = $marketing_info['marketing_id'];
                } else {
                    $order_data['marketing_id'] = 0;
                }
            } else {
                $order_data['affiliate_id'] = 0;
                $order_data['commission'] = 0;
                $order_data['marketing_id'] = 0;
                $order_data['tracking'] = '';
            }

            $order_data['language_id'] = $this->config->get('config_language_id');
            $order_data['currency_id'] = $this->currency->getId($this->session->data['currency']);
            $order_data['currency_code'] = $this->session->data['currency'];
            $order_data['currency_value'] = $this->currency->getValue($this->session->data['currency']);
            $order_data['ip'] = $this->request->server['REMOTE_ADDR'];

            if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
                $order_data['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR'];
            } elseif (!empty($this->request->server['HTTP_CLIENT_IP'])) {
                $order_data['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];
            } else {
                $order_data['forwarded_ip'] = '';
            }

            if (isset($this->request->server['HTTP_USER_AGENT'])) {
                $order_data['user_agent'] = $this->request->server['HTTP_USER_AGENT'];
            } else {
                $order_data['user_agent'] = '';
            }

            if (isset($this->request->server['HTTP_ACCEPT_LANGUAGE'])) {
                $order_data['accept_language'] = $this->request->server['HTTP_ACCEPT_LANGUAGE'];
            } else {
                $order_data['accept_language'] = '';
            }

            if (!$this->customer->isLogged() && isset($this->session->data['guest']['register']) && $this->session->data['guest']['register'] == '1' && isset($order_data['password']) && !empty($order_data['password'])) {
                $this->load->model('account/customer');
                $custom_field = array();
                $custom_field['account'] = isset($order_data['custom_field']) ? $order_data['custom_field'] : array();
                $custom_field['address'] = isset($this->session->data['payment_address']['custom_field']) ? $this->session->data['payment_address']['custom_field'] : array();

                $customer_data = array(
                    'firstname' => $order_data['firstname'],
                    'lastname' => $order_data['lastname'],
                    'email' => $order_data['email'],
                    'telephone' => $order_data['telephone'],
                    'fax' => $order_data['fax'],
                    'password' => $order_data['password'],
                    'company' => $order_data['shipping_company'],
                    'address_1' => $order_data['shipping_address_1'],
                    'address_2' => $order_data['shipping_address_2'],
                    'city' => $order_data['shipping_city'],
                    'postcode' => $order_data['shipping_postcode'],
                    'country_id' => $order_data['shipping_country_id'],
                    'zone_id' => $order_data['shipping_zone_id'],
                    'custom_field' => $custom_field,
                );
                $customer_id = $this->model_account_customer->addCustomer($customer_data);
                $order_data['customer_id'] = $customer_id;

                // Clear any previous login attempts for unregistered accounts.
                $this->model_account_customer->deleteLoginAttempts($order_data['email']);

                $this->customer->login($order_data['email'], $order_data['password']);

                unset($this->session->data['guest']);

                // Add to activity log
                if ($this->config->get('config_customer_activity')) {
                    $this->load->model('account/activity');

                    $activity_data = array(
                        'customer_id' => $customer_id,
                        'name' => $order_data['firstname'] . ' ' . $order_data['lastname']
                    );

                    $this->model_account_activity->addActivity('register', $activity_data);
                }
            }

            $this->load->model('checkout/order');

            $this->session->data['order_id'] = $this->model_checkout_order->addOrder($order_data);
        }
        $json = array();
        $json['success'] = 1;
        $json['redirect'] = $redirect;
        $json['reason'] = $reason;
        $json['session_data'] = $this->session->data;
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function selectShipping()
    {

        if (isset($this->request->post['code']) && isset($this->session->data['shipping_methods'])) {
            $code = explode('.', $this->request->post['code']);

            if (isset($code[1]) && isset($this->session->data['shipping_methods'][$code[0]]['quote'][$code[1]])) {
                $this->session->data['shipping_method'] = $this->session->data['shipping_methods'][$code[0]]['quote'][$code[1]];

                $totals = $this->totals();

                $this->language->load('checkout/buy');
                $json = array();
                $json['totals'] = array();
                $i = 0;
                $clear_show = $this->config->get('buy_clear_show');
                foreach ($totals as $total) {
                    $json['totals'][] = array(
                        'title' => $total['title'],
                        'code' => $total['code'],
                        'total' => $this->currency->format($total['value'], $this->session->data['currency']),
                    );
                    $i++;
                }

                $this->response->addHeader('Content-Type: application/json');
                $this->response->setOutput(json_encode($json));
            }
        }
    }

    public function clear()
    {
        $this->cart->clear();
    }

    public function getTotals()
    {
        $json = array();

        $json['totals'] = $this->totals();

        $this->response->setOutput(json_encode($json));
    }

    private function totals()
    {
        $totals = array();
        $taxes = $this->cart->getTaxes();
        $total = 0;

        // Because __call can not keep var references so we put them into an array.
        $total_data = array(
            'totals' => &$totals,
            'taxes' => &$taxes,
            'total' => &$total
        );

        $this->load->model('extension/extension');

        // Display prices
        if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
            $sort_order = array();

            $results = $this->model_extension_extension->getExtensions('total');

            foreach ($results as $key => $value) {
                $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
            }

            array_multisort($sort_order, SORT_ASC, $results);

            foreach ($results as $result) {
                if ($this->config->get($result['code'] . '_status')) {
                    $this->load->model('extension/total/' . $result['code']);

                    $this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
                }
            }

            $sort_order = array();

            foreach ($totals as $key => $value) {
                $sort_order[$key] = $value['sort_order'];
            }

            array_multisort($sort_order, SORT_ASC, $totals);
        }

        $this->language->load('checkout/buy');
        $totals_arr = array();
        foreach ($totals as $total) {
            $totals_arr[] = array(
                'title' => $total['title'],
                'value' => $total['value'],
                'code' => $total['code'],
                'sort_order' => $total['sort_order'],
                'total' => $this->currency->format($total['value'], $this->session->data['currency']),
                'text' => $this->currency->format($total['value'], $this->session->data['currency']),
            );
        }

        return $totals_arr;
    }

    private function updatePaymentMethods($payment_address)
    {
        // Selected payment methods should be from cart sub total not total!
        $total = $this->cart->getSubTotal();

        // Payment Methods
        $method_data = array();

        $this->load->model('extension/extension');

        $results = $this->model_extension_extension->getExtensions('payment');

        $recurring = $this->cart->hasRecurringProducts();

        foreach ($results as $result) {
            if ($this->config->get($result['code'] . '_status')) {

                $this->load->model('extension/payment/' . $result['code']);

                $method = $this->{'model_extension_payment_' . $result['code']}->getMethod($payment_address, $total);

                if ($method) {
                    if ($recurring) {
                        if (method_exists($this->{'model_extension_payment_' . $result['code']}, 'recurringPayments') && $this->{'model_extension_payment_' . $result['code']}->recurringPayments()) {
                            $method_data[$result['code']] = $method;
                        }
                    } else {
                        $method_data[$result['code']] = $method;
                    }
                }
            }
        }

        $sort_order = array();

        foreach ($method_data as $key => $value) {
            $sort_order[$key] = $value['sort_order'];
        }

        array_multisort($sort_order, SORT_ASC, $method_data);

        $this->session->data['payment_methods'] = $method_data;
    }

    private function updateShippingMethods($shipping_address)
    {
        // Shipping Methods
        $method_data = array();

        $this->load->model('extension/extension');

        $results = $this->model_extension_extension->getExtensions('shipping');

        foreach ($results as $result) {
            if ($this->config->get($result['code'] . '_status')) {
                $this->load->model('extension/shipping/' . $result['code']);

                $quote = $this->{'model_extension_shipping_' . $result['code']}->getQuote($shipping_address);

                if ($quote) {
                    $method_data[$result['code']] = array(
                        'title' => $quote['title'],
                        'quote' => $quote['quote'],
                        'sort_order' => $quote['sort_order'],
                        'error' => $quote['error']
                    );
                }
            }
        }

        $sort_order = array();

        foreach ($method_data as $key => $value) {
            $sort_order[$key] = $value['sort_order'];
        }

        array_multisort($sort_order, SORT_ASC, $method_data);

        $this->session->data['shipping_methods'] = $method_data;
    }

    public function oneclick()
    {
        $this->load->model('setting/setting');
        $settings = $this->model_setting_setting->getSetting('buy');
        if ($settings['buy_oneclick']) {
            $json = array();

            $this->load->model('catalog/product');
            $this->load->model('catalog/information');
            $this->load->model('extension/extension');
            $this->load->model('account/customer');
            $this->load->model('affiliate/affiliate');
            $this->load->model('checkout/order');
            $this->load->model('checkout/marketing');
            $this->load->model('tool/image');

            $this->load->language('checkout/buy');


            if (!isset($this->request->request['firstname']) || empty($this->request->request['firstname'])) {
                $json['error']['firstname'] = $this->language->get('error_firstname');
            }
            if (!isset($this->request->request['telephone']) || empty($this->request->request['telephone'])) {
                $json['error']['telephone'] = $this->language->get('error_telephone');
            }

            $order_data = array();

            if (!isset($json['error'])) {

                if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
                    $forwarded_ip = $this->request->server['HTTP_X_FORWARDED_FOR'];
                } elseif (!empty($this->request->server['HTTP_CLIENT_IP'])) {
                    $forwarded_ip = $this->request->server['HTTP_CLIENT_IP'];
                } else {
                    $forwarded_ip = '';
                }

                $user_agent = isset($this->request->server['HTTP_USER_AGENT']) ? $this->request->server['HTTP_USER_AGENT'] : '';
                $accept_language = isset($this->request->server['HTTP_ACCEPT_LANGUAGE']) ? $this->request->server['HTTP_ACCEPT_LANGUAGE'] : '';

                if (isset($this->request->cookie['tracking'])) {
                    $affiliate_info = $this->model_affiliate_affiliate->getAffiliateByCode($this->request->cookie['tracking']);
                    $tracking = $this->request->cookie['tracking'];
                    $subtotal = $this->cart->getSubTotal();

                    if ($affiliate_info) {
                        $affiliate_id = $affiliate_info['affiliate_id'];
                        $commission = ($subtotal / 100) * $affiliate_info['commission'];
                    } else {
                        $affiliate_id = 0;
                        $commission = 0;
                    }

                    $marketing_info = $this->model_checkout_marketing->getMarketingByCode($this->request->cookie['tracking']);

                    if ($marketing_info) {
                        $marketing_id = $marketing_info['marketing_id'];
                    } else {
                        $marketing_id = 0;
                    }
                } else {
                    $affiliate_id = 0;
                    $commission = 0;
                    $marketing_id = 0;
                    $tracking = '';
                }

                $product_to_order = array();

                foreach ($this->cart->getProducts() as $product) {
                    $option_data = array();

                    foreach ($product['option'] as $option) {
                        $option_data[] = array(
                            'product_option_id' => $option['product_option_id'],
                            'product_option_value_id' => $option['product_option_value_id'],
                            'option_id' => $option['option_id'],
                            'option_value_id' => $option['option_value_id'],
                            'name' => $option['name'],
                            'value' => $option['value'],
                            'type' => $option['type']
                        );
                    }

                    $product_to_order[] = array(
                        'product_id' => $product['product_id'],
                        'name' => $product['name'],
                        'model' => $product['model'],
                        'option' => $option_data,
                        'download' => $product['download'],
                        'quantity' => $product['quantity'],
                        'subtract' => $product['subtract'],
                        'price' => $product['price'],
                        'total' => $product['total'],
                        'tax' => $this->tax->getTax($product['price'], $product['tax_class_id']),
                        'reward' => $product['reward']
                    );
                }


                $totals = array();
                $taxes = $this->cart->getTaxes();
                $total = 0;

                // Because __call can not keep var references so we put them into an array.
                $total_data = array(
                    'totals' => &$totals,
                    'taxes' => &$taxes,
                    'total' => &$total
                );

                $sort_order = array();

                $results = $this->model_extension_extension->getExtensions('total');

                foreach ($results as $key => $value) {
                    $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
                }

                array_multisort($sort_order, SORT_ASC, $results);

                foreach ($results as $result) {
                    if ($this->config->get($result['code'] . '_status')) {
                        $this->load->model('extension/total/' . $result['code']);

                        // We have to put the totals in an array so that they pass by reference.
                        $this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
                    }
                }

                $sort_order = array();

                foreach ($totals as $key => $value) {
                    $sort_order[$key] = $value['sort_order'];
                }

                array_multisort($sort_order, SORT_ASC, $totals);

                $currency_id = $this->currency->getId($this->session->data['currency']);
                $currency_code = $this->session->data['currency'];
                $currency_value = $this->currency->getValue($this->session->data['currency']);

                $order_data = array(
                    'invoice_prefix' => (string)$this->config->get('config_invoice_prefix'),
                    'store_id' => $store_id = (int)$this->config->get('config_store_id'),
                    'store_name' => (string)$this->config->get('config_name'),
                    'store_url' => $store_id ? (string)$this->config->get('config_url') : HTTP_SERVER,
                    'customer_id' => $this->customer->isLogged() ? $this->customer->getId() : 0,
                    'customer_group_id' => $this->customer->isLogged() ? $this->customer->getGroupId() : $this->config->get('config_customer_group_id'),
                    'firstname' => '',
                    'lastname' => '',
                    'email' => '',
                    'telephone' => '',
                    'fax' => '',
                    'shipping_city' => '',
                    'shipping_postcode' => '',
                    'shipping_country' => '',
                    'shipping_country_id' => '',
                    'shipping_zone_id' => '',
                    'shipping_zone' => '',
                    'shipping_address_format' => '',
                    'shipping_firstname' => '',
                    'shipping_lastname' => '',
                    'shipping_company' => '',
                    'shipping_address_1' => '',
                    'shipping_address_2' => '',
                    'shipping_code' => '',
                    'shipping_method' => '',
                    'payment_city' => '',
                    'payment_postcode' => '',
                    'payment_country' => '',
                    'payment_country_id' => '',
                    'payment_zone' => '',
                    'payment_zone_id' => '',
                    'payment_address_format' => '',
                    'payment_firstname' => '',
                    'payment_lastname' => '',
                    'payment_company' => '',
                    'payment_address_1' => '',
                    'payment_address_2' => '',
                    'payment_company_id' => '',
                    'payment_tax_id' => '',
                    'payment_code' => 'cod',
                    'payment_method' => '',
                    'forwarded_ip' => $forwarded_ip,
                    'user_agent' => $user_agent,
                    'accept_language' => $accept_language,
                    'vouchers' => array(),
                    'comment' => '',
                    'total' => $total,
                    'reward' => '',
                    'affiliate_id' => $affiliate_id,
                    'tracking' => $tracking,
                    'commission' => $commission,
                    'marketing_id' => $marketing_id,
                    'language_id' => $this->config->get('config_language_id'),
                    'currency_id' => $currency_id,
                    'currency_code' => $currency_code,
                    'currency_value' => $currency_value,
                    'ip' => $this->request->server['REMOTE_ADDR'],
                    'products' => $product_to_order,
                    'totals' => isset($totals) ? $totals : $total_data
                );

                if (isset($this->request->request['firstname'])) {
                    $order_data['shipping_firstname'] = $this->request->request['firstname'];
                    $order_data['payment_firstname'] = $this->request->request['firstname'];
                    $order_data['firstname'] = $this->request->request['firstname'];
                }
                if (isset($this->request->request['telephone'])) {
                    $order_data['telephone'] = $this->request->request['telephone'];
                }

                $this->session->data['order_id'] = $this->model_checkout_order->addOrder($order_data);

                $order_id = $this->session->data['order_id'];

                $this->db->query("UPDATE `" . DB_PREFIX . "order` SET order_status_id = '" . (int)$this->config->get('config_order_status_id') . "', date_modified = NOW() WHERE order_id = '" . $order_id . "'");

                $json['success'] = 1;

                $this->send_email($order_id, $this->config->get('config_order_status_id'));
            }

            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($json));
        }
    }

    private function send_email($order_id, $order_status_id)
    {


        $this->load->model('checkout/order');
        $order_info = $this->model_checkout_order->getOrder($order_id);

        // Check for any downloadable products
        $download_status = false;

        $order_product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");

        foreach ($order_product_query->rows as $order_product) {
            // Check if there are any linked downloads
            $product_download_query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "product_to_download` WHERE product_id = '" . (int)$order_product['product_id'] . "'");

            if ($product_download_query->row['total']) {
                $download_status = true;
            }
        }

        // Load the language for any mails that might be required to be sent out
        $language = new Language($order_info['language_code']);
        $language->load($order_info['language_code']);
        $language->load('mail/order');

        $order_status_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_status WHERE order_status_id = '" . (int)$order_status_id . "' AND language_id = '" . (int)$order_info['language_id'] . "'");

        if ($order_status_query->num_rows) {
            $order_status = $order_status_query->row['name'];
        } else {
            $order_status = '';
        }

        $subject = sprintf($language->get('text_new_subject'), $order_info['store_name'], $order_id);

        // HTML Mail
        $data = array();


        $data['title'] = sprintf($language->get('text_new_subject'), html_entity_decode($order_info['store_name'], ENT_QUOTES, 'UTF-8'), $order_id);

        $data['text_greeting'] = sprintf($language->get('text_new_greeting'), html_entity_decode($order_info['store_name'], ENT_QUOTES, 'UTF-8'));
        $data['text_link'] = $language->get('text_new_link');
        $data['text_download'] = $language->get('text_new_download');
        $data['text_order_detail'] = $language->get('text_new_order_detail');
        $data['text_instruction'] = $language->get('text_new_instruction');
        $data['text_order_id'] = $language->get('text_new_order_id');
        $data['text_date_added'] = $language->get('text_new_date_added');
        $data['text_payment_method'] = $language->get('text_new_payment_method');
        $data['text_shipping_method'] = $language->get('text_new_shipping_method');
        $data['text_email'] = $language->get('text_new_email');
        $data['text_telephone'] = $language->get('text_new_telephone');
        $data['text_ip'] = $language->get('text_new_ip');
        $data['text_order_status'] = $language->get('text_new_order_status');
        $data['text_payment_address'] = $language->get('text_new_payment_address');
        $data['text_shipping_address'] = $language->get('text_new_shipping_address');
        $data['text_product'] = $language->get('text_new_product');
        $data['text_model'] = $language->get('text_new_model');
        $data['text_quantity'] = $language->get('text_new_quantity');
        $data['text_price'] = $language->get('text_new_price');
        $data['text_total'] = $language->get('text_new_total');
        $data['text_footer'] = $language->get('text_new_footer');

        $data['logo'] = $this->config->get('config_url') . 'image/' . $this->config->get('config_logo');
        $data['store_name'] = $order_info['store_name'];
        $data['store_url'] = $order_info['store_url'];
        $data['customer_id'] = $order_info['customer_id'];
        $data['link'] = $order_info['store_url'] . 'index.php?route=account/order/info&order_id=' . $order_id;

        if ($download_status) {
            $data['download'] = $order_info['store_url'] . 'index.php?route=account/download';
        } else {
            $data['download'] = '';
        }

        $data['order_id'] = $order_id;
        $data['date_added'] = date($language->get('date_format_short'), strtotime($order_info['date_added']));
        $data['payment_method'] = $order_info['payment_method'];
        $data['shipping_method'] = $order_info['shipping_method'];
        $data['email'] = $order_info['email'];
        $data['telephone'] = $order_info['telephone'];
        $data['ip'] = $order_info['ip'];
        $data['order_status'] = $order_status;
        $data['comment'] = '';

        if ($order_info['payment_address_format']) {
            $format = $order_info['payment_address_format'];
        } else {
            $format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
        }

        $find = array(
            '{firstname}',
            '{lastname}',
            '{company}',
            '{address_1}',
            '{address_2}',
            '{city}',
            '{postcode}',
            '{zone}',
            '{zone_code}',
            '{country}'
        );

        $replace = array(
            'firstname' => $order_info['payment_firstname'],
            'lastname' => $order_info['payment_lastname'],
            'company' => $order_info['payment_company'],
            'address_1' => $order_info['payment_address_1'],
            'address_2' => $order_info['payment_address_2'],
            'city' => $order_info['payment_city'],
            'postcode' => $order_info['payment_postcode'],
            'zone' => $order_info['payment_zone'],
            'zone_code' => $order_info['payment_zone_code'],
            'country' => $order_info['payment_country']
        );

        $data['payment_address'] = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));

        if ($order_info['shipping_address_format']) {
            $format = $order_info['shipping_address_format'];
        } else {
            $format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
        }

        $find = array(
            '{firstname}',
            '{lastname}',
            '{company}',
            '{address_1}',
            '{address_2}',
            '{city}',
            '{postcode}',
            '{zone}',
            '{zone_code}',
            '{country}'
        );

        $replace = array(
            'firstname' => $order_info['shipping_firstname'],
            'lastname' => $order_info['shipping_lastname'],
            'company' => $order_info['shipping_company'],
            'address_1' => $order_info['shipping_address_1'],
            'address_2' => $order_info['shipping_address_2'],
            'city' => $order_info['shipping_city'],
            'postcode' => $order_info['shipping_postcode'],
            'zone' => $order_info['shipping_zone'],
            'zone_code' => $order_info['shipping_zone_code'],
            'country' => $order_info['shipping_country']
        );

        $data['shipping_address'] = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));

        $this->load->model('tool/upload');

        // Products
        $data['products'] = array();

        foreach ($order_product_query->rows as $product) {
            $option_data = array();

            $order_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . (int)$product['order_product_id'] . "'");

            foreach ($order_option_query->rows as $option) {
                if ($option['type'] != 'file') {
                    $value = $option['value'];
                } else {
                    $upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

                    if ($upload_info) {
                        $value = $upload_info['name'];
                    } else {
                        $value = '';
                    }
                }

                $option_data[] = array(
                    'name' => $option['name'],
                    'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
                );
            }

            $data['products'][] = array(
                'name' => $product['name'],
                'model' => $product['model'],
                'option' => $option_data,
                'quantity' => $product['quantity'],
                'price' => $this->currency->format($product['price'] + ($this->config->get('config_tax') ? $product['tax'] : 0), $order_info['currency_code'], $order_info['currency_value']),
                'total' => $this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value'])
            );
        }

        // Vouchers
        $data['vouchers'] = array();

        $order_voucher_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_voucher WHERE order_id = '" . (int)$order_id . "'");

        foreach ($order_voucher_query->rows as $voucher) {
            $data['vouchers'][] = array(
                'description' => $voucher['description'],
                'amount' => $this->currency->format($voucher['amount'], $order_info['currency_code'], $order_info['currency_value']),
            );
        }


        // Order Totals
        $order_total_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_total` WHERE order_id = '" . (int)$order_id . "' ORDER BY sort_order ASC");

        foreach ($order_total_query->rows as $total) {
            $data['totals'][] = array(
                'title' => $total['title'],
                'text' => $this->currency->format($total['value'], $order_info['currency_code'], $order_info['currency_value']),
            );
        }


        $html = $this->load->view('mail/order', $data);

        // Text Mail
        $text = sprintf($language->get('text_new_greeting'), html_entity_decode($order_info['store_name'], ENT_QUOTES, 'UTF-8')) . "\n\n";
        $text .= $language->get('text_new_order_id') . ' ' . $order_id . "\n";
        $text .= $language->get('text_new_date_added') . ' ' . date($language->get('date_format_short'), strtotime($order_info['date_added'])) . "\n";
        $text .= $language->get('text_new_order_status') . ' ' . $order_status . "\n\n";

        // Products
        $text .= $language->get('text_new_products') . "\n";

        foreach ($order_product_query->rows as $product) {
            $text .= $product['quantity'] . 'x ' . $product['name'] . ' (' . $product['model'] . ') ' . html_entity_decode($this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value']), ENT_NOQUOTES, 'UTF-8') . "\n";

            $order_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . $product['order_product_id'] . "'");

            foreach ($order_option_query->rows as $option) {
                if ($option['type'] != 'file') {
                    $value = $option['value'];
                } else {
                    $upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

                    if ($upload_info) {
                        $value = $upload_info['name'];
                    } else {
                        $value = '';
                    }
                }

                $text .= chr(9) . '-' . $option['name'] . ' ' . (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value) . "\n";
            }
        }


        foreach ($order_voucher_query->rows as $voucher) {
            $text .= '1x ' . $voucher['description'] . ' ' . $this->currency->format($voucher['amount'], $order_info['currency_code'], $order_info['currency_value']);
        }

        $text .= "\n";

        $text .= $language->get('text_new_order_total') . "\n";

        foreach ($order_total_query->rows as $total) {
            $text .= $total['title'] . ': ' . html_entity_decode($this->currency->format($total['value'], $order_info['currency_code'], $order_info['currency_value']), ENT_NOQUOTES, 'UTF-8') . "\n";
        }

        $text .= "\n";

        if ($order_info['customer_id']) {
            $text .= $language->get('text_new_link') . "\n";
            $text .= $order_info['store_url'] . 'index.php?route=account/order/info&order_id=' . $order_id . "\n\n";
        }

        if ($download_status) {
            $text .= $language->get('text_new_download') . "\n";
            $text .= $order_info['store_url'] . 'index.php?route=account/download' . "\n\n";
        }

        // Comment
        if ($order_info['comment']) {
            $text .= $language->get('text_new_comment') . "\n\n";
            $text .= $order_info['comment'] . "\n\n";
        }

        $text .= $language->get('text_new_footer') . "\n\n";

        if (!empty($order_info['email'])) {
            $mail = new Mail();
            $mail->protocol = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');
            $mail->smtp_hostname = $this->config->get('config_mail_smtp_host');
            $mail->smtp_username = $this->config->get('config_mail_smtp_username');
            $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
            $mail->smtp_port = $this->config->get('config_mail_smtp_port');
            $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

            $mail->setTo($order_info['email']);
            $mail->setFrom($this->config->get('config_email'));
            $mail->setSender($order_info['store_name']);
            $mail->setSubject($subject);
            $mail->setHtml($html);
            $mail->setText($text);
            $mail->send();
        }

        // Admin Alert Mail
        if ($this->config->get('config_order_mail') || ($this->config->get('config_mail_alert') && in_array('order', (array)$this->config->get('config_mail_alert')))) {
            $subject = sprintf($language->get('text_new_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'), $order_id);

            // HTML Mail
            $data['text_greeting'] = $language->get('text_new_received');

            if ($order_info['comment']) {
                $data['comment'] = $order_info['comment'];
            } else {
                $data['comment'] = '';
            }

            $data['text_download'] = '';

            $data['text_footer'] = '';

            $data['text_link'] = '';
            $data['link'] = '';
            $data['download'] = '';


            $html = $this->load->view('mail/order', $data);

            // Text
            $text = $language->get('text_new_received') . "\n\n";
            $text .= $language->get('text_new_order_id') . ' ' . $order_id . "\n";
            $text .= $language->get('text_new_date_added') . ' ' . date($language->get('date_format_short'), strtotime($order_info['date_added'])) . "\n";
            $text .= $language->get('text_new_order_status') . ' ' . $order_status . "\n\n";
            $text .= $language->get('text_new_products') . "\n";

            foreach ($order_product_query->rows as $product) {
                $text .= $product['quantity'] . 'x ' . $product['name'] . ' (' . $product['model'] . ') ' . html_entity_decode($this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value']), ENT_NOQUOTES, 'UTF-8') . "\n";

                $order_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . $product['order_product_id'] . "'");

                foreach ($order_option_query->rows as $option) {
                    if ($option['type'] != 'file') {
                        $value = $option['value'];
                    } else {
                        $value = utf8_substr($option['value'], 0, utf8_strrpos($option['value'], '.'));
                    }

                    $text .= chr(9) . '-' . $option['name'] . ' ' . (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value) . "\n";
                }
            }

            foreach ($order_voucher_query->rows as $voucher) {
                $text .= '1x ' . $voucher['description'] . ' ' . $this->currency->format($voucher['amount'], $order_info['currency_code'], $order_info['currency_value']);
            }

            $text .= "\n";

            $text .= $language->get('text_new_order_total') . "\n";

            foreach ($order_total_query->rows as $total) {
                $text .= $total['title'] . ': ' . html_entity_decode($this->currency->format($total['value'], $order_info['currency_code'], $order_info['currency_value']), ENT_NOQUOTES, 'UTF-8') . "\n";
            }

            $text .= "\n";

            if ($order_info['comment']) {
                $text .= $language->get('text_new_comment') . "\n\n";
                $text .= $order_info['comment'] . "\n\n";
            }


            $mail = new Mail();
            $mail->protocol = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');
            $mail->smtp_hostname = $this->config->get('config_mail_smtp_host');
            $mail->smtp_username = $this->config->get('config_mail_smtp_username');
            $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
            $mail->smtp_port = $this->config->get('config_mail_smtp_port');
            $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

            $mail->setTo($this->config->get('config_email'));
            $mail->setFrom($this->config->get('config_email'));
            $mail->setReplyTo($order_info['email']);
            $mail->setSender($order_info['store_name']);
            $mail->setSubject($subject);
            $mail->setHtml($html);
            $mail->setText($text);
            $mail->send();

            // Send to additional alert emails
            if (version_compare(preg_replace("/[^\d.]/", "", VERSION), '2.3.0.0', '<')) {
                $emails = explode(',', $this->config->get('config_mail_alert'));
            } else {
                $emails = explode(',', $this->config->get('config_mail_alert_email'));
            }

            foreach ($emails as $email) {
                if ($email && preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $email)) {
                    $mail->setTo($email);
                    $mail->send();
                }
            }
        }

    }
}