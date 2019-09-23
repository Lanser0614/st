<?php

class ControllerExtensionModuleBuy extends Controller {

    private $error = array();

    public function index() {

        $this->language->load('extension/module/buy');
        $data = array();
        $data = array_merge($data, $this->language->load('extension/module/buy'));

        $this->document->setTitle($this->language->get('heading_title_bread'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $data['settings'] = $this->model_setting_setting->getSetting('buy');
            if($data['settings']['buy_shipping_select'] == 1 && $this->request->post['buy_shipping_select'] == 0){
                $this->db->query("UPDATE `" . DB_PREFIX . "setting` SET value = '0' WHERE store_id = '0' AND `code` = 'shipping' AND `key` = 'shipping_status'");
            }else{
                $this->db->query("UPDATE `" . DB_PREFIX . "setting` SET value = '1' WHERE store_id = '0' AND `code` = 'shipping' AND `key` = 'shipping_status'");
            }
            $this->model_setting_setting->editSetting('buy', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/module/buy', 'token=' . $this->session->data['token'], true));
        }

        if(isset($this->session->data['success'])){
            $data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        }

        $data['token'] = $this->session->data['token'];
        $data['settings'] = $this->model_setting_setting->getSetting('buy');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], true),
            'separator' => false
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true),
            'separator' => ' :: '
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title_bread'),
            'href' => $this->url->link('extension/module/buy', 'token=' . $this->session->data['token'], true),
            'separator' => ' :: '
        );

        $data['action'] = $this->url->link('extension/module/buy', 'token=' . $this->session->data['token'], true);

        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);


        if (isset($this->request->post['buy_status'])) {
                $data['buy_status'] = $this->request->post['buy_status'];
        } else {
                $data['buy_status'] = $this->config->get('buy_status');
        }

        $this->load->model('localisation/language');
        $data['languages'] = $this->model_localisation_language->getLanguages();
        
        $fields_arr = array('firstname', 'lastname', 'email', 'telephone', 'fax', 'company', 'address_1', 'address_2', 'zone', 'city', 'postcode', 'country', 'comment', 'register', 'password1', 'password2', 'oneclick_name', 'oneclick_telephone');
        $data['fields'] = array();
        foreach ($fields_arr as $field){
            $data['fields'][$field] = array(
                'entry' => $this->language->get('entry_'.$field)
            );
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/module/buy', $data));
    }

    private function validate() {
        if (!$this->user->hasPermission('modify', 'extension/module/buy')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }
    
    public function install() {
        $this->load->model('setting/setting');
        $this->load->model('extension/extension');
        $this->load->model('user/user_group');
        

        $this->model_user_user_group->addPermission($this->user->getId(), 'access', 'extension/module/buy');
        $this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'extension/module/buy');

        $this->model_setting_setting->editSetting('buy', array(
            'buy_oneclick_telephone_required' => 1,
            'buy_oneclick_telephone_status' => 1,
            'buy_oneclick_name_required' => 1,
            'buy_oneclick_name_status' => 1,
            'buy_password2_required' => 0,
            'buy_password2_status' => 1,
            'buy_password1_required' => 0,
            'buy_password1_status' => 1,
            'buy_register_required' => 1,
            'buy_register_status' => 1,
            'buy_comment_required' => 0,
            'buy_comment_status' => 1,
            'buy_country_required' => 0,
            'buy_country_status' => 0,
            'buy_postcode_required' => 0,
            'buy_postcode_status' => 0,
            'buy_city_required' => 0,
            'buy_city_status' => 1,
            'buy_zone_required' => 1,
            'buy_zone_status' => 1,
            'buy_address_2_required' => 0,
            'buy_address_2_status' => 0,
            'buy_address_1_required' => 0,
            'buy_address_1_status' => 1,
            'buy_company_required' => 0,
            'buy_company_status' => 0,
            'buy_fax_required' => 0,
            'buy_fax_status' => 0,
            'buy_telephone_required' => 1,
            'buy_telephone_status' => 1,
            'buy_email_required' => 0,
            'buy_email_status' => 1,
            'buy_lastname_status' => 0,
            'buy_lastname_required' => 0,
            'buy_firstname_required' => 1,
            'buy_firstname_status' => 1,
            'buy_min_order_sum' => '',
            'buy_telephone_mask' => '',
            'buy_form_design' => 0,
            'buy_page_design' => 1,
            'buy_bootstrap' => 0,
            'buy_voucher' => 0,
            'buy_coupon' => 1,
            'buy_login' => 1,
            'buy_oneclick_only' => 0,
            'buy_oneclick' => 1,
            'buy_clear_show' => 1,
            'buy_payment_select' => 1,
            'buy_shipping_select' => 1,
            'buy_status' => 1,
            'buy_form_headings' => 1,
            'buy_lang' => array(
                'russian' => array(
                    'meta_title' => 'Корзина / Оформление заказа',
                    'h1' => 'Корзина / Оформление заказа',
                    'h2' => 'Оформить заказ ↓',
                    'heading_1' => 'Информация',
                    'heading_2' => 'Адрес',
                    'heading_3' => 'Доставка и оплата',
                    'success_title' => 'Ваш заказ принят! № заказа: {order_id}',
                    'success_text' => '&lt;p&gt;{firstname}, благодарим Вас за проявление интереса к нашей продукции!&lt;br&gt;&lt;/p&gt;&lt;p&gt;В ближайшее время с Вами свяжется менеджер нашего интернет-магазина для подтверждения заказа.&lt;/p&gt;',
                    'success_text_logged' => '&lt;p&gt;Ваш заказ принят!&lt;/p&gt;&lt;p&gt;История заказа находится в &lt;a href=&quot;{account_link}&quot;&gt;Личном кабинете&lt;/a&gt;. Для просмотра истории, перейдите по ссылке &lt;a href=&quot;{order_history_link}&quot;&gt;История заказов&lt;/a&gt;.&lt;/p&gt;&lt;p&gt;Если Ваша покупка связана с цифровыми товарами, перейдите на страницу &lt;a href=&quot;{downloads_link}&quot;&gt;Файлы для скачивания&lt;/a&gt; для просмотра или скачивания.&lt;/p&gt;&lt;p&gt;Если у Вас возникли вопросы, пожалуйста &lt;a href=&quot;{contact_link}&quot;&gt;свяжитесь с нами&lt;/a&gt;.&lt;/p&gt;&lt;p&gt;Спасибо за покупки в нашем интернет-магазине!&lt;/p&gt;',
                    'oneclick_text' => '&lt;div class=&quot;h3&quot;&gt;Вы можете оформить заказ по телефону!&lt;/div&gt;&lt;p&gt;Просто заполните форму - наши менеджеры перезвонят Вам в течении 15 минут.&lt;/p&gt;',
                    'checkout_button' => 'Оформить заказ',
                    'oneclick_button' => 'Отправить',
                    'agree_text' => 'Нажимая на кнопку, вы соглашаетесь на обработку персональных данных в соответствии c: ',
                    'table_image' => 'Изображение',
                    'table_name' => 'Название',
                    'table_model' => 'Модель',
                    'table_qty' => 'Кол-во',
                    'table_price' => 'Цена',
                    'table_total' => 'Сумма',
                    'table_coupon' => 'Ввести код купона',
                    'table_coupon_another' => 'Ввести другой код купона',
                    'table_voucher' => 'Ввести код сертификата',
                    'table_voucher_another' => 'Ввести другой код купона',
                    'new_customer' => 'Я новый покупатель',
                    'old_customer' => 'Я постоянный клиент',
                    'shipping_methods' => 'Выберите способ доставки',
                    'payment_methods' => 'Выберите способ оплаты',
                ),
                'ru-ru' => array(
                    'meta_title' => 'Корзина / Оформление заказа',
                    'h1' => 'Корзина / Оформление заказа',
                    'h2' => 'Оформить заказ ↓',
                    'heading_1' => 'Информация',
                    'heading_2' => 'Адрес',
                    'heading_3' => 'Доставка и оплата',
                    'success_title' => 'Ваш заказ принят! № заказа: {order_id}',
                    'success_text' => '&lt;p&gt;{firstname}, благодарим Вас за проявление интереса к нашей продукции!&lt;br&gt;&lt;/p&gt;&lt;p&gt;В ближайшее время с Вами свяжется менеджер нашего интернет-магазина для подтверждения заказа.&lt;/p&gt;',
                    'success_text_logged' => '&lt;p&gt;Ваш заказ принят!&lt;/p&gt;&lt;p&gt;История заказа находится в &lt;a href=&quot;{account_link}&quot;&gt;Личном кабинете&lt;/a&gt;. Для просмотра истории, перейдите по ссылке &lt;a href=&quot;{order_history_link}&quot;&gt;История заказов&lt;/a&gt;.&lt;/p&gt;&lt;p&gt;Если Ваша покупка связана с цифровыми товарами, перейдите на страницу &lt;a href=&quot;{downloads_link}&quot;&gt;Файлы для скачивания&lt;/a&gt; для просмотра или скачивания.&lt;/p&gt;&lt;p&gt;Если у Вас возникли вопросы, пожалуйста &lt;a href=&quot;{contact_link}&quot;&gt;свяжитесь с нами&lt;/a&gt;.&lt;/p&gt;&lt;p&gt;Спасибо за покупки в нашем интернет-магазине!&lt;/p&gt;',
                    'oneclick_text' => '&lt;div class=&quot;h3&quot;&gt;Вы можете оформить заказ по телефону!&lt;/div&gt;&lt;p&gt;Просто заполните форму - наши менеджеры перезвонят Вам в течении 15 минут.&lt;/p&gt;',
                    'checkout_button' => 'Оформить заказ',
                    'oneclick_button' => 'Отправить',
                    'agree_text' => 'Нажимая на кнопку, вы соглашаетесь на обработку персональных данных в соответствии c: ',
                    'table_image' => 'Изображение',
                    'table_name' => 'Название',
                    'table_model' => 'Модель',
                    'table_qty' => 'Кол-во',
                    'table_price' => 'Цена',
                    'table_total' => 'Сумма',
                    'table_coupon' => 'Ввести код купона',
                    'table_coupon_another' => 'Ввести другой код купона',
                    'table_voucher' => 'Ввести код сертификата',
                    'table_voucher_another' => 'Ввести другой код купона',
                    'new_customer' => 'Я новый покупатель',
                    'old_customer' => 'Я постоянный клиент',
                    'shipping_methods' => 'Выберите способ доставки',
                    'payment_methods' => 'Выберите способ оплаты',
                ),
                'english' => array(
                    'meta_title' => 'Shopping Cart / Checkout',
                    'h1' => 'Shopping Cart / Checkout',
                    'h2' => 'Checkout ↓',
                    'heading_1' => 'Information',
                    'heading_2' => 'Address',
                    'heading_3' => 'Delivery and billing',
                    'success_title' => 'Your order has been placed! Order number: #{order_id}',
                    'success_text' => '&lt;p&gt;&lt;b&gt;{firstname}&lt;/b&gt;, your order has been successfully processed!&lt;/p&gt;&lt;p&gt;Please direct any questions you have to the &lt;a href=&quot;{contact_link}&quot;&gt;store owner&lt;/a&gt;.&lt;/p&gt;&lt;p&gt;Thanks for shopping with us online!&lt;/p&gt;',
                    'success_text_logged' => '&lt;p&gt;&lt;b&gt;{firstname}&lt;/b&gt;, your order has been successfully processed!&lt;/p&gt;&lt;p&gt;You can view your order history by going to the &lt;a href=&quot;{account_link}&quot;&gt;my account&lt;/a&gt; page and by clicking on &lt;a href=&quot;{order_history_link}&quot;&gt;history&lt;/a&gt;.&lt;/p&gt;&lt;p&gt;If your purchase has an associated download, you can go to the account &lt;a href=&quot;{downloads_link}&quot;&gt;downloads&lt;/a&gt; page to view them.&lt;/p&gt;&lt;p&gt;Please direct any questions you have to the &lt;a href=&quot;{contact_link}&quot;&gt;store owner&lt;/a&gt;.&lt;/p&gt;&lt;p&gt;Thanks for shopping with us online!&lt;/p&gt;',
                    'oneclick_text' => '&lt;div class=&quot;h3&quot;&gt;You can place an order by phone!&lt;/div&gt;&lt;p&gt;Just fill out the form - our managers will call you back within 15 minutes.&lt;/p&gt;',
                    'checkout_button' => 'Checkout',
                    'oneclick_button' => 'Checkout',
                    'agree_text' => 'By clicking on the button, you agree to the processing of personal data in accordance with:',
                    'table_image' => 'Image',
                    'table_name' => 'Product Name',
                    'table_model' => 'Model',
                    'table_qty' => 'Quantity',
                    'table_price' => 'Unit Price',
                    'table_total' => 'Total',
                    'table_coupon' => 'Enter coupon code',
                    'table_coupon_another' => 'Enter another coupon code',
                    'table_voucher' => 'Enter voucher code',
                    'table_voucher_another' => 'Enter another voucher code',
                    'new_customer' => 'I\'m a new customer',
                    'old_customer' => 'I\'m a regular customer',
                    'shipping_methods' => 'Please select the preferred shipping method',
                    'payment_methods' => 'Please select the preferred payment method',
                ),
                'en-gb' => array(
                    'meta_title' => 'Shopping Cart / Checkout',
                    'h1' => 'Shopping Cart / Checkout',
                    'h2' => 'Checkout ↓',
                    'heading_1' => 'Information',
                    'heading_2' => 'Address',
                    'heading_3' => 'Delivery and billing',
                    'success_title' => 'Your order has been placed! Order number: #{order_id}',
                    'success_text' => '&lt;p&gt;&lt;b&gt;{firstname}&lt;/b&gt;, your order has been successfully processed!&lt;/p&gt;&lt;p&gt;Please direct any questions you have to the &lt;a href=&quot;{contact_link}&quot;&gt;store owner&lt;/a&gt;.&lt;/p&gt;&lt;p&gt;Thanks for shopping with us online!&lt;/p&gt;',
                    'success_text_logged' => '&lt;p&gt;&lt;b&gt;{firstname}&lt;/b&gt;, your order has been successfully processed!&lt;/p&gt;&lt;p&gt;You can view your order history by going to the &lt;a href=&quot;{account_link}&quot;&gt;my account&lt;/a&gt; page and by clicking on &lt;a href=&quot;{order_history_link}&quot;&gt;history&lt;/a&gt;.&lt;/p&gt;&lt;p&gt;If your purchase has an associated download, you can go to the account &lt;a href=&quot;{downloads_link}&quot;&gt;downloads&lt;/a&gt; page to view them.&lt;/p&gt;&lt;p&gt;Please direct any questions you have to the &lt;a href=&quot;{contact_link}&quot;&gt;store owner&lt;/a&gt;.&lt;/p&gt;&lt;p&gt;Thanks for shopping with us online!&lt;/p&gt;',
                    'oneclick_text' => '&lt;div class=&quot;h3&quot;&gt;You can place an order by phone!&lt;/div&gt;&lt;p&gt;Just fill out the form - our managers will call you back within 15 minutes.&lt;/p&gt;',
                    'checkout_button' => 'Checkout',
                    'oneclick_button' => 'Checkout',
                    'agree_text' => 'By clicking on the button, you agree to the processing of personal data in accordance with:',
                    'table_image' => 'Image',
                    'table_name' => 'Product Name',
                    'table_model' => 'Model',
                    'table_qty' => 'Quantity',
                    'table_price' => 'Unit Price',
                    'table_total' => 'Total',
                    'table_coupon' => 'Enter coupon code',
                    'table_coupon_another' => 'Enter another coupon code',
                    'table_voucher' => 'Enter voucher code',
                    'table_voucher_another' => 'Enter another voucher code',
                    'new_customer' => 'I\'m a new customer',
                    'old_customer' => 'I\'m a regular customer',
                    'shipping_methods' => 'Please select the preferred shipping method',
                    'payment_methods' => 'Please select the preferred payment method',
                ),
            ),
            'buy_field_lang' => array(
                'russian' => array(
                    'firstname' => array('text' => 'Имя, Отчество', 'placeholder' => 'Имя, Отчество',),
                    'lastname' => array('text' => 'Фамилия', 'placeholder' => 'Фамилия',),
                    'email' => array('text' => 'E-Mail', 'placeholder' => 'E-Mail',),
                    'telephone' => array('text' => 'Телефон', 'placeholder' => 'Телефон',),
                    'fax' => array('text' => 'Факс', 'placeholder' => 'Факс',),
                    'company' => array('text' => 'Компания', 'placeholder' => 'Компания',),
                    'address_1' => array('text' => 'Адрес', 'placeholder' => 'Адрес',),
                    'address_2' => array('text' => 'Адрес (продолжение)', 'placeholder' => 'Адрес (продолжение)',),
                    'zone' => array('text' => 'Регион / Область', 'placeholder' => 'Регион / Область',),
                    'city' => array('text' => 'Город', 'placeholder' => 'Город',),
                    'postcode' => array('text' => 'Почтовый индекс', 'placeholder' => 'Почтовый индекс',),
                    'country' => array('text' => 'Страна', 'placeholder' => 'Страна',),
                    'comment' => array('text' => 'Комментарии', 'placeholder' => 'Комментарии',),
                    'register' => array('text' => 'Зарегистрироваться', 'placeholder' => 'Зарегистрироваться',),
                    'password1' => array('text' => 'Придумайте пароль', 'placeholder' => 'Придумайте пароль',),
                    'password2' => array('text' => 'Повторите пароль', 'placeholder' => 'Повторите пароль',),
                    'oneclick_name' => array('text' => 'Ваше имя', 'placeholder' => 'Ваше имя',),
                    'oneclick_telephone' => array('text' => 'Номер телефона', 'placeholder' => 'Номер телефона',),
                ),
                'ru-ru' => array(
                    'firstname' => array('text' => 'Имя, Отчество', 'placeholder' => 'Имя, Отчество',),
                    'lastname' => array('text' => 'Фамилия', 'placeholder' => 'Фамилия',),
                    'email' => array('text' => 'E-Mail', 'placeholder' => 'E-Mail',),
                    'telephone' => array('text' => 'Телефон', 'placeholder' => 'Телефон',),
                    'fax' => array('text' => 'Факс', 'placeholder' => 'Факс',),
                    'company' => array('text' => 'Компания', 'placeholder' => 'Компания',),
                    'address_1' => array('text' => 'Адрес', 'placeholder' => 'Адрес',),
                    'address_2' => array('text' => 'Адрес (продолжение)', 'placeholder' => 'Адрес (продолжение)',),
                    'zone' => array('text' => 'Регион / Область', 'placeholder' => 'Регион / Область',),
                    'city' => array('text' => 'Город', 'placeholder' => 'Город',),
                    'postcode' => array('text' => 'Почтовый индекс', 'placeholder' => 'Почтовый индекс',),
                    'country' => array('text' => 'Страна', 'placeholder' => 'Страна',),
                    'comment' => array('text' => 'Комментарии', 'placeholder' => 'Комментарии',),
                    'register' => array('text' => 'Зарегистрироваться', 'placeholder' => 'Зарегистрироваться',),
                    'password1' => array('text' => 'Придумайте пароль', 'placeholder' => 'Придумайте пароль',),
                    'password2' => array('text' => 'Повторите пароль', 'placeholder' => 'Повторите пароль',),
                    'oneclick_name' => array('text' => 'Ваше имя', 'placeholder' => 'Ваше имя',),
                    'oneclick_telephone' => array('text' => 'Номер телефона', 'placeholder' => 'Номер телефона',),
                ),
                'english' => array(
                    'firstname' => array('text' => 'Firstname', 'placeholder' => 'Firstname',),
                    'lastname' => array('text' => 'Lastname', 'placeholder' => 'Lastname',),
                    'email' => array('text' => 'E-Mail', 'placeholder' => 'E-Mail',),
                    'telephone' => array('text' => 'Telephone', 'placeholder' => 'Telephone',),
                    'fax' => array('text' => 'Fax', 'placeholder' => 'Fax',),
                    'company' => array('text' => 'Company', 'placeholder' => 'Company',),
                    'address_1' => array('text' => 'Address', 'placeholder' => 'Address',),
                    'address_2' => array('text' => 'Address 2', 'placeholder' => 'Address 2',),
                    'zone' => array('text' => 'Region / State', 'placeholder' => 'Region / State',),
                    'city' => array('text' => 'City', 'placeholder' => 'City',),
                    'postcode' => array('text' => 'Postcode', 'placeholder' => 'Postcode',),
                    'country' => array('text' => 'Country', 'placeholder' => 'Country',),
                    'comment' => array('text' => 'Add Comments About Your Order', 'placeholder' => 'Add Comments About Your Order',),
                    'register' => array('text' => 'Registration', 'placeholder' => 'Registration',),
                    'password1' => array('text' => 'Password', 'placeholder' => 'Password',),
                    'password2' => array('text' => 'Confirm password', 'placeholder' => 'Confirm password',),
                    'oneclick_name' => array('text' => 'Your name', 'placeholder' => 'Your name',),
                    'oneclick_telephone' => array('text' => 'Telephone', 'placeholder' => 'Telephone',
                    ),
                ),
                'en-gb' => array(
                    'firstname' => array('text' => 'Firstname', 'placeholder' => 'Firstname',),
                    'lastname' => array('text' => 'Lastname', 'placeholder' => 'Lastname',),
                    'email' => array('text' => 'E-Mail', 'placeholder' => 'E-Mail',),
                    'telephone' => array('text' => 'Telephone', 'placeholder' => 'Telephone',),
                    'fax' => array('text' => 'Fax', 'placeholder' => 'Fax',),
                    'company' => array('text' => 'Company', 'placeholder' => 'Company',),
                    'address_1' => array('text' => 'Address', 'placeholder' => 'Address',),
                    'address_2' => array('text' => 'Address 2', 'placeholder' => 'Address 2',),
                    'zone' => array('text' => 'Region / State', 'placeholder' => 'Region / State',),
                    'city' => array('text' => 'City', 'placeholder' => 'City',),
                    'postcode' => array('text' => 'Postcode', 'placeholder' => 'Postcode',),
                    'country' => array('text' => 'Country', 'placeholder' => 'Country',),
                    'comment' => array('text' => 'Add Comments About Your Order', 'placeholder' => 'Add Comments About Your Order',),
                    'register' => array('text' => 'Registration', 'placeholder' => 'Registration',),
                    'password1' => array('text' => 'Password', 'placeholder' => 'Password',),
                    'password2' => array('text' => 'Confirm password', 'placeholder' => 'Confirm password',),
                    'oneclick_name' => array('text' => 'Your name', 'placeholder' => 'Your name',),
                    'oneclick_telephone' => array('text' => 'Telephone', 'placeholder' => 'Telephone',
                    ),
                ),
            ),
        ));

        if (!in_array('buy', $this->model_extension_extension->getInstalled('module'))) {
            $this->model_extension_extension->install('module', 'buy');
        }
        
        $lang = $this->language->load('extension/module/buy');
        $this->session->data['success'] = $lang['text_success_install'];
    }

    public function uninstall() {
        $this->load->model('setting/setting');
        $this->load->model('extension/extension');

        $this->model_extension_extension->uninstall('module', 'buy');
        $this->model_setting_setting->deleteSetting('buy');
    }

}

?>