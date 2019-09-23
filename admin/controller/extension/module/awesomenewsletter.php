<?php
class ControllerExtensionModuleAwesomenewsletter extends Controller {
	private $error = array();
	
	public function index() {
		$this->load->language('extension/module/awesomenewsletter');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		
		$this->load->model('catalog/awesomenewsletter');
		
		$this->model_catalog_awesomenewsletter->CreateTables();

		if(($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()){
			
			$this->model_setting_setting->editSetting('awesomenewsletter', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'].'&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['entry_module_status'] = $this->language->get('entry_module_status');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');

		$data['entry_approved'] = $this->language->get('entry_approved');
		$data['entry_required'] = $this->language->get('entry_required');
		$data['entry_cronjob_status'] = $this->language->get('entry_cronjob_status');
		$data['entry_sortorder'] = $this->language->get('entry_sortorder');
		$data['entry_label'] = $this->language->get('entry_label');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_subscribe'] = $this->language->get('entry_subscribe');
		$data['entry_subscribe_email'] = $this->language->get('entry_subscribe_email');
		$data['entry_placeholder'] = $this->language->get('entry_placeholder');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_product'] = $this->language->get('entry_product');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_success_description'] = $this->language->get('entry_success_description');
		$data['entry_unsubscribe_success_description'] = $this->language->get('entry_unsubscribe_success_description');
		$data['entry_unsubscribe_already_description'] = $this->language->get('entry_unsubscribe_already_description');
		$data['entry_unsubscribe_notfound_description'] = $this->language->get('entry_unsubscribe_notfound_description');
		$data['entry_already_description'] = $this->language->get('entry_already_description');
		$data['entry_notfound_description'] = $this->language->get('entry_notfound_description');
		$data['entry_button'] = $this->language->get('entry_button');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_placeholder_name'] = $this->language->get('entry_placeholder_name');
		$data['entry_placeholder_email'] = $this->language->get('entry_placeholder_email');
		$data['entry_error'] = $this->language->get('entry_error');
		$data['entry_name_required'] = $this->language->get('entry_name_required');
		$data['entry_exists_error'] = $this->language->get('entry_exists_error');
		$data['entry_success'] = $this->language->get('entry_success');
		$data['entry_popup'] = $this->language->get('entry_popup');
		$data['entry_popup_again'] = $this->language->get('entry_popup_again');
		$data['entry_footer'] = $this->language->get('entry_footer');
		$data['entry_css'] = $this->language->get('entry_css');
		$data['entry_product_limit'] = $this->language->get('entry_product_limit');
		$data['entry_image_thumb'] = $this->language->get('entry_image_thumb');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		
		
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_email_templates'] = $this->language->get('text_email_templates');
		
		
		$data['tab_control_panel'] = $this->language->get('tab_control_panel');
		$data['tab_general_setting'] = $this->language->get('tab_general_setting');
		$data['tab_email_setting'] = $this->language->get('tab_email_setting');
		$data['tab_popup_setting'] = $this->language->get('tab_popup_setting');
		$data['tab_footer_setting'] = $this->language->get('tab_footer_setting');
		$data['tab_cronjob_setting'] = $this->language->get('tab_cronjob_setting');
		$data['tab_css_setting'] = $this->language->get('tab_css_setting');
		
		$data['tab_newsletter_list'] = $this->language->get('tab_newsletter_list');
		$data['tab_mail'] = $this->language->get('tab_mail');
		$data['tab_language_setting'] = $this->language->get('tab_language_setting');
		$data['tab_page_setting'] = $this->language->get('tab_page_setting');
		$data['tab_popup_setting'] = $this->language->get('tab_popup_setting');
		$data['tab_module_setting'] = $this->language->get('tab_module_setting');
		$data['tab_unsubscribe_page_setting'] = $this->language->get('tab_unsubscribe_page_setting');
		
		$data['entry_help'] = $this->language->get('entry_help');
		$data['help_product'] = $this->language->get('help_product');
		
		$data['entry_recipient_email'] = $this->language->get('entry_recipient_email');
		$data['help_recipient_email'] = $this->language->get('help_recipient_email');
		
		$data['button_visitor_ip'] = $this->language->get('button_visitor_ip');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_filter'] = $this->language->get('button_filter');
		$data['button_delete'] = $this->language->get('button_delete');
		
		
		$data['email_templates_link'] = $this->url->link('catalog/email_template', 'token=' . $this->session->data['token'], 'SSL');
		
		//21-10-2016
		$data['xlsimport'] = $this->url->link('extension/module/awesomenewsletter/import', 'token=' . $this->session->data['token'], 'SSL');
		$data['importdeafultsubscriber'] = $this->url->link('extension/module/awesomenewsletter/importdeafultsubscriber', 'token=' . $this->session->data['token'], 'SSL');
		$data['button_import'] = $this->language->get('button_import');
		//21-10-2016

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		
		if (isset($this->error['verify_template'])) {
			$data['error_verify_template'] = $this->error['verify_template'];
		} else {
			$data['error_verify_template'] = '';
		}
		
		if (isset($this->error['image_thumb'])) {
			$data['error_image_thumb'] = $this->error['image_thumb'];
		} else {
			$data['error_image_thumb'] = '';
		}
		
		if (isset($this->error['product_limit'])) {
			$data['error_product_limit'] = $this->error['product_limit'];
		} else {
			$data['error_product_limit'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/awesomenewsletter', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('extension/module/awesomenewsletter', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->post['awesomenewsletter_status'])) {
			$data['awesomenewsletter_status'] = $this->request->post['awesomenewsletter_status'];
		} else {
			$data['awesomenewsletter_status'] = $this->config->get('awesomenewsletter_status');
		}
		
		if (isset($this->request->post['awesomenewsletter_name_status'])) {
			$data['awesomenewsletter_name_status'] = $this->request->post['awesomenewsletter_name_status'];
		} else {
			$data['awesomenewsletter_name_status'] = $this->config->get('awesomenewsletter_name_status');
		}
		
		if (isset($this->request->post['awesomenewsletter_name_required'])) {
			$data['awesomenewsletter_name_required'] = $this->request->post['awesomenewsletter_name_required'];
		} else {
			$data['awesomenewsletter_name_required'] = $this->config->get('awesomenewsletter_name_required');
		}
		
		
		if (isset($this->request->post['awesomenewsletter_setting'])) {
			$data['awesomenewsletter_setting'] = $this->request->post['awesomenewsletter_setting'];
		} else {
			$data['awesomenewsletter_setting'] = $this->config->get('awesomenewsletter_setting');
		}
		
		if (isset($this->request->post['awesomenewsletter_verify_template_id'])) {
			$data['awesomenewsletter_verify_template_id'] = $this->request->post['awesomenewsletter_verify_template_id'];
		} else {
			$data['awesomenewsletter_verify_template_id'] = $this->config->get('awesomenewsletter_verify_template_id');
		}
		
		if (isset($this->request->post['awesomenewsletter_modules_description'])) {
			$data['awesomenewsletter_modules_description'] = $this->request->post['awesomenewsletter_modules_description'];
		} else {
			$data['awesomenewsletter_modules_description'] = $this->config->get('awesomenewsletter_modules_description');
		}
		
		if (isset($this->request->post['awesomenewsletter_popups_description'])) {
			$data['awesomenewsletter_popups_description'] = $this->request->post['awesomenewsletter_popups_description'];
		} else {
			$data['awesomenewsletter_popups_description'] = $this->config->get('awesomenewsletter_popups_description');
		}
		
		if (isset($this->request->post['awesomenewsletter_verify_description'])) {
			$data['awesomenewsletter_verify_description'] = $this->request->post['awesomenewsletter_verify_description'];
		} else {
			$data['awesomenewsletter_verify_description'] = $this->config->get('awesomenewsletter_verify_description');
		}
		
		if (isset($this->request->post['awesomenewsletter_unsubscribe_description'])) {
			$data['awesomenewsletter_unsubscribe_description'] = $this->request->post['awesomenewsletter_unsubscribe_description'];
		} else {
			$data['awesomenewsletter_unsubscribe_description'] = $this->config->get('awesomenewsletter_unsubscribe_description');
		}
		
		if (isset($this->request->post['awesomenewsletter_footer_status'])) {
			$data['awesomenewsletter_footer_status'] = $this->request->post['awesomenewsletter_footer_status'];
		} else {
			$data['awesomenewsletter_footer_status'] = $this->config->get('awesomenewsletter_footer_status');
		}
		
		if (isset($this->request->post['awesomenewsletter_popup_seconds'])) {
			$data['awesomenewsletter_popup_seconds'] = $this->request->post['awesomenewsletter_popup_seconds'];
		} else {
			$data['awesomenewsletter_popup_seconds'] = $this->config->get('awesomenewsletter_popup_seconds');
		}
		
		if (isset($this->request->post['awesomenewsletter_popup_again'])) {
			$data['awesomenewsletter_popup_again'] = $this->request->post['awesomenewsletter_popup_again'];
		} else {
			$data['awesomenewsletter_popup_again'] = $this->config->get('awesomenewsletter_popup_again');
		}
		
		if (isset($this->request->post['awesomenewsletter_popup_status'])) {
			$data['awesomenewsletter_popup_status'] = $this->request->post['awesomenewsletter_popup_status'];
		} else {
			$data['awesomenewsletter_popup_status'] = $this->config->get('awesomenewsletter_popup_status');
		}
		
		if (isset($this->request->post['awesomenewsletter_crownjob_status'])) {
			$data['awesomenewsletter_crownjob_status'] = $this->request->post['awesomenewsletter_crownjob_status'];
		} else {
			$data['awesomenewsletter_crownjob_status'] = $this->config->get('awesomenewsletter_crownjob_status');
		}		
		
		if (isset($this->request->post['awesomenewsletter_crownjob_tempalte_id'])) {
			$data['awesomenewsletter_crownjob_tempalte_id'] = $this->request->post['awesomenewsletter_crownjob_tempalte_id'];
		} else {
			$data['awesomenewsletter_crownjob_tempalte_id'] = $this->config->get('awesomenewsletter_crownjob_tempalte_id');
		}		
		
		if (isset($this->request->post['awesomenewsletter_crownjob_recipient'])) {
			$data['awesomenewsletter_crownjob_recipient'] = $this->request->post['awesomenewsletter_crownjob_recipient'];
		} else {
			$data['awesomenewsletter_crownjob_recipient'] = $this->config->get('awesomenewsletter_crownjob_recipient');
		}
		
		if (isset($this->request->post['awesomenewsletter_image_thumb_width'])) {
			$data['awesomenewsletter_image_thumb_width'] = $this->request->post['awesomenewsletter_image_thumb_width'];
		} else {
			$data['awesomenewsletter_image_thumb_width'] = $this->config->get('awesomenewsletter_image_thumb_width');
		}
		
		if (isset($this->request->post['awesomenewsletter_image_thumb_height'])) {
			$data['awesomenewsletter_image_thumb_height'] = $this->request->post['awesomenewsletter_image_thumb_height'];
		} else {
			$data['awesomenewsletter_image_thumb_height'] = $this->config->get('awesomenewsletter_image_thumb_height');
		}
		
		if (isset($this->request->post['awesomenewsletter_product_limit'])) {
			$data['awesomenewsletter_product_limit'] = $this->request->post['awesomenewsletter_product_limit'];
		} else {
			$data['awesomenewsletter_product_limit'] = $this->config->get('awesomenewsletter_product_limit');
		}
		
		if (isset($this->request->post['awesomenewsletter_css'])) {
			$data['awesomenewsletter_css'] = $this->request->post['awesomenewsletter_css'];
		} else {
			$data['awesomenewsletter_css'] = $this->config->get('awesomenewsletter_css');
		}
		
		if (isset($this->request->post['awesomenewsletter_popup_logo'])) {
			$data['awesomenewsletter_popup_logo'] = $this->request->post['awesomenewsletter_popup_logo'];
		} else {
			$data['awesomenewsletter_popup_logo'] = $this->config->get('awesomenewsletter_popup_logo');
		}

		
		$this->load->model('tool/image');
		
		if (isset($this->request->post['awesomenewsletter_popup_logo']) && is_file(DIR_IMAGE . $this->request->post['awesomenewsletter_popup_logo'])) {
			$data['logo'] = $this->model_tool_image->resize($this->request->post['awesomenewsletter_popup_logo'], 100, 100);
		} elseif ($this->config->get('awesomenewsletter_popup_logo') && is_file(DIR_IMAGE . $this->config->get('awesomenewsletter_popup_logo'))) {
			$data['logo'] = $this->model_tool_image->resize($this->config->get('awesomenewsletter_popup_logo'), 100, 100);
		} else {
			$data['logo'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}
		
		
		if (isset($this->request->post['awesomenewsletter_popup_background'])) {
			$data['awesomenewsletter_popup_background'] = $this->request->post['awesomenewsletter_popup_background'];
		} else {
			$data['awesomenewsletter_popup_background'] = $this->config->get('awesomenewsletter_popup_background');
		}
		
		if (isset($this->request->post['awesomenewsletter_popup_background']) && is_file(DIR_IMAGE . $this->request->post['awesomenewsletter_popup_background'])) {
			$data['background_thumb'] = $this->model_tool_image->resize($this->request->post['awesomenewsletter_popup_background'], 100, 100);
		} elseif ($this->config->get('awesomenewsletter_popup_background') && is_file(DIR_IMAGE . $this->config->get('awesomenewsletter_popup_background'))) {
			$data['background_thumb'] = $this->model_tool_image->resize($this->config->get('awesomenewsletter_popup_background'), 100, 100);
		} else {
			$data['background_thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}
		
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		
		$this->load->model('localisation/language');

		$languages = $this->model_localisation_language->getLanguages();
		
		$data['languages'] = $languages;
		
		$data['token'] = $this->session->data['token'];

		$this->load->model('catalog/product');
		
		$data['products'] = array();

		if (isset($this->request->post['awesomenewsletter_product'])) {
			$products = (!empty($this->request->post['awesomenewsletter_product']) ? $this->request->post['awesomenewsletter_product'] : array());
		} else {
			$products = ($this->config->get('awesomenewsletter_product')) ? $this->config->get('awesomenewsletter_product') : array();
		}

		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);

			if ($product_info) {
				$data['products'][] = array(
					'product_id' => $product_info['product_id'],
					'name'       => $product_info['name']
				);
			}
		}

		$this->load->model('catalog/email_template');
				
		$data['email_templates'] = $this->model_catalog_email_template->getEmailTemplates();
		
		$data['awesomenewsletter_crownjob_url'] = HTTP_CATALOG .'index.php?route=information/newsletter_crownjob';
		
		$data['button_export'] = $this->language->get('button_export');
		$data['button_send'] = $this->language->get('button_send');
		$data['entry_email_template'] = $this->language->get('entry_email_template');
		$data['entry_crown_url'] = $this->language->get('entry_crown_url');
		$data['entry_recipient'] = $this->language->get('entry_recipient');
		$data['entry_verify_email'] = $this->language->get('entry_verify_email');
		$data['entry_logo'] = $this->language->get('entry_logo');
		$data['entry_background'] = $this->language->get('entry_background');
		$data['entry_seconds'] = $this->language->get('entry_seconds');
		
		$data['text_all_subcribe'] = $this->language->get('text_all_subcribe');
		$data['text_all_approved_subcribe'] = $this->language->get('text_all_approved_subcribe');
		$data['text_all_unapproved_subcribe'] = $this->language->get('text_all_unapproved_subcribe');
		$data['text_all_disabled_subcribe'] = $this->language->get('text_all_disabled_subcribe');
		$data['text_all_enabled_subcribe'] = $this->language->get('text_all_enabled_subcribe');
		$data['text_selected_subcribe'] = $this->language->get('text_selected_subcribe');
		$data['text_select'] = $this->language->get('text_select');
		
		$data['export'] = $this->url->link('extension/module/awesomenewsletter/exportsubscribers', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/awesomenewsletter.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/awesomenewsletter')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if(empty($this->request->post['awesomenewsletter_verify_template_id'])) {
			$this->error['verify_template'] = $this->language->get('error_verify_template');
		}
		
		if (!$this->request->post['awesomenewsletter_image_thumb_width'] || !$this->request->post['awesomenewsletter_image_thumb_height']) {
			$this->error['image_thumb'] = $this->language->get('error_image_thumb');
		}
		
		if (!$this->request->post['awesomenewsletter_product_limit']) {
			$this->error['product_limit'] = $this->language->get('error_product_limit');
		}
		
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}
	
	public function getSubscribers(){
		$this->load->language('extension/module/awesomenewsletter');

		$this->load->model('catalog/awesomenewsletter');
		
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'date_added';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		
		if (isset($this->request->get['filter_email'])) {
			$filter_email = $this->request->get['filter_email'];
		} else {
			$filter_email = null;
		}

		if (isset($this->request->get['filter_status'])) {
			$filter_status = $this->request->get['filter_status'];
		} else {
			$filter_status = null;
		}
		
		if (isset($this->request->get['filter_approved'])) {
			$filter_approved = $this->request->get['filter_approved'];
		} else {
			$filter_approved = null;
		}

		$data['text_no_results'] = $this->language->get('text_no_results');
		
		$data['column_email'] = $this->language->get('column_email');
		$data['column_name'] = $this->language->get('column_name');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_approved'] = $this->language->get('column_approved');
		$data['column_ip'] = $this->language->get('column_ip');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_action'] = $this->language->get('column_action');
		
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_visitor_ip'] = $this->language->get('button_visitor_ip');
		$data['button_approve'] = $this->language->get('button_approve');
		
		$filter_data = array(
			'filter_email' 		=> $filter_email,
			'filter_status' 	=> $filter_status,
			'filter_approved' => $filter_approved,
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);
		
		$total_subscribers = $this->model_catalog_awesomenewsletter->getTotalNewsletterSubscribers($filter_data);
		
		$subscribers = $this->model_catalog_awesomenewsletter->getNewsletterSubscribers($filter_data);
				
		$data['subscribers'] = array();
		foreach($subscribers as $subscriber){
			$customerinfo = $this->model_catalog_awesomenewsletter->getCustomerTotalByEmail($subscriber['email']);
			$data['subscribers'][] = array(
				'awesomenewsletter_id'	=> $subscriber['awesomenewsletter_id'],
				'name'					=> $subscriber['name'],
				'email'					=> $subscriber['email'],
				'type'					=> ($customerinfo ? '<span class="label label-success">'.$this->language->get('text_yes').'</span>' : '<span class="label label-danger">'.$this->language->get('text_no').'</span>'),
				'status'				=> ($subscriber['status']) ? '<span class="label label-success">'.$this->language->get('text_enabled').'</span>' : '<span class="label label-danger">'.$this->language->get('text_disabled').'</span>',
				'approved'			=> ($subscriber['approved']) ? '<span class="label label-success">'.$this->language->get('text_yes').'</span>': '<span class="label label-danger">'.$this->language->get('text_no').'</span>',
				'approve'       => (!$subscriber['approved']) ? true : '',
				'ip'						=> $subscriber['ip'],
				'ip_href'				=> 'http://www.checkip.com/ip/'. $subscriber['ip'],
				'date_added'		=> date('d/m/Y', strtotime($subscriber['date_added'])),
			);
		}
		
		$url = '';

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . $this->request->get['filter_email'];
		}
		
		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}
		
		if (isset($this->request->get['filter_approved'])) {
			$url .= '&filter_approved=' . $this->request->get['filter_approved'];
		}
		
		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$data['sort_email'] = $this->url->link('extension/module/awesomenewsletter/getSubscribers', 'token=' . $this->session->data['token'] . '&sort=email' . $url, 'SSL');
		$data['sort_name'] = $this->url->link('extension/module/awesomenewsletter/getSubscribers', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');
		$data['sort_status'] = $this->url->link('extension/module/awesomenewsletter/getSubscribers', 'token=' . $this->session->data['token'] . '&sort=status' . $url, 'SSL');
		$data['sort_approved'] = $this->url->link('extension/module/awesomenewsletter/getSubscribers', 'token=' . $this->session->data['token'] . '&sort=approved' . $url, 'SSL');
		$data['sort_ip'] = $this->url->link('extension/module/awesomenewsletter/getSubscribers', 'token=' . $this->session->data['token'] . '&sort=ip' . $url, 'SSL');
		$data['sort_date_added'] = $this->url->link('extension/module/awesomenewsletter/getSubscribers', 'token=' . $this->session->data['token'] . '&sort=date_added' . $url, 'SSL');
		
		$url = '';

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . $this->request->get['filter_email'];
		}
		
		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}
		
		if (isset($this->request->get['filter_approved'])) {
			$url .= '&filter_approved=' . $this->request->get['filter_approved'];
		}
		
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		$pagination = new Pagination();
		$pagination->total = $total_subscribers;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('extension/module/awesomenewsletter/getSubscribers', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($total_subscribers) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($total_subscribers - $this->config->get('config_limit_admin'))) ? $total_subscribers : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $total_subscribers, ceil($total_subscribers / $this->config->get('config_limit_admin')));

		$url = '';

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . $this->request->get['filter_email'];
		}
		
		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}
		
		if (isset($this->request->get['filter_approved'])) {
			$url .= '&filter_approved=' . $this->request->get['filter_approved'];
		}
		
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$data['getsubscribers_action'] = str_replace('&amp;', '&', $this->url->link('extension/module/awesomenewsletter/getSubscribers', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		
		$data['editsubscribersopen_action'] = str_replace('&amp;', '&', $this->url->link('extension/module/awesomenewsletter/editSubscribersOpen', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		
		$data['deletesubscribers_action'] = str_replace('&amp;', '&', $this->url->link('extension/module/awesomenewsletter/deleteSubscribers', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		
		$data['filter_email'] = $filter_email;
		$data['filter_status'] = $filter_status;
		$data['filter_approved'] = $filter_approved;
		$data['sort'] = $sort;
		$data['order'] = $order;
		
		$data['token'] = $this->session->data['token'];
		
		$this->response->setOutput($this->load->view('extension/module/awesomenewsletter_list.tpl', $data));
	}
	
	public function deleteSubscribers() {
		$json = array();
		$this->load->language('extension/module/awesomenewsletter');

		$this->load->model('catalog/awesomenewsletter');

		if (isset($this->request->post['selected'])) {
			foreach ($this->request->post['selected'] as $awesomenewsletter_id) {
				$this->model_catalog_awesomenewsletter->deleteSubscribers($awesomenewsletter_id);
			}

			$json['success'] = $this->language->get('text_success');
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	public function editSubscribersOpen() {
		$this->load->language('extension/module/awesomenewsletter');

		$this->load->model('catalog/awesomenewsletter');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_approved'] = $this->language->get('entry_approved');
		
		$data['button_save'] = $this->language->get('button_save');
		
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_edit_status'] = $this->language->get('text_edit_status');
		
		$data['token'] = $this->session->data['token'];
		
		if (isset($this->request->get['awesomenewsletter_id'])) {
			$awesomenewsletter_id = $this->request->get['awesomenewsletter_id'];
		}else{
			$awesomenewsletter_id = '';
		}
		
		$data['awesomenewsletter_id'] = $awesomenewsletter_id;
		
		$info = $this->model_catalog_awesomenewsletter->getAwesomenewsletter($awesomenewsletter_id);
		if($info) {
			
			$data['name']  = $info['name'];
			$data['email']  = $info['email'];
			$data['status']  = $info['status'];
			$data['approved']  = $info['approved'];
			
			$url = '';

			if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . $this->request->get['filter_email'];
			}
			
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
			
			if (isset($this->request->get['filter_approved'])) {
				$url .= '&filter_approved=' . $this->request->get['filter_approved'];
			}
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$data['editsubscribers_action'] = str_replace('&amp;', '&', $this->url->link('extension/module/awesomenewsletter/editSubscribers', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			
			$data['getsubscribers_action'] = str_replace('&amp;', '&', $this->url->link('extension/module/awesomenewsletter/getSubscribers', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			
			$this->response->setOutput($this->load->view('extension/module/awesomenewsletter_edit.tpl', $data));
		}
	}
	
	public function editSubscribers() {
		$json = array();
		
		$this->load->language('extension/module/awesomenewsletter');

		$this->load->model('catalog/awesomenewsletter');
		
		
		if(!$json) {
			if(isset($this->request->get['awesomenewsletter_id'])) {
				$this->model_catalog_awesomenewsletter->editSubscribers($this->request->post, $this->request->get['awesomenewsletter_id']);
				
				$json['success'] = $this->language->get('text_success');
			}
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	public function approve() {
		$json = array();
		
		$this->load->language('extension/module/awesomenewsletter');

		$this->load->model('catalog/awesomenewsletter');
		
		if(!$json) {
			if(isset($this->request->get['awesomenewsletter_id'])) {
				$this->model_catalog_awesomenewsletter->editSubscribersApprove($this->request->get['awesomenewsletter_id']);
				
				$json['success'] = $this->language->get('text_success');
			}
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_email'])) {
			$this->load->language('extension/module/awesomenewsletter');

			$this->load->model('catalog/awesomenewsletter');

			if (isset($this->request->get['filter_email'])) {
				$filter_email = $this->request->get['filter_email'];
			} else {
				$filter_email = '';
			}

			$filter_data = array(
				'filter_email'  => $filter_email,
			);

			$results = $this->model_catalog_awesomenewsletter->getNewsletterSubscribers($filter_data);
			
			foreach ($results as $result) {
				$json[] = array(
					'awesomenewsletter_id' => $result['awesomenewsletter_id'],
					'name'      					 => $result['name'],
					'email'      					 => $result['email'],
				);
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	public function SendEmail() {
		$json = array();
		
		$this->load->language('module/awesomenewsletter');

		$this->load->model('catalog/awesomenewsletter');
	
		if(empty($this->request->post['email_template_id'])) {
			$json['warning'] = $this->language->get('error_email_template_id');
		}
		
		if(empty($this->request->post['recipient_type'])) {
			$json['warning'] = $this->language->get('error_recipient_type');
		}
		
		if(!empty($this->request->post['recipient_type']) && $this->request->post['recipient_type'] == 'selected_subcribe') {
			if(empty($this->request->post['recipient_email'])) {
				$json['warning'] = $this->language->get('error_recipient_email');
			}
			
		}
		
		if(!$json) {
			$this->model_catalog_awesomenewsletter->SendEmail($this->request->post);
			$json['success'] = $this->language->get('text_success_mail');
		}
	
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	public function exportsubscribers() {
		header('Cache-Control: no-cache, no-store');
		ini_set('memory_limit', '1024M');
		ini_set('max_execution_time', 900);
		ini_set('error_reporting', E_ALL);
		include DIR_SYSTEM.'library/PHPExcel.php';
		
		$this->load->language('extension/module/awesomenewsletter');
		
		$this->load->model('catalog/awesomenewsletter');
		
		$objPHPExcel = new PHPExcel();
		$objPHPExcel->setActiveSheetIndex(0);
		$objPHPExcel->getActiveSheet()->setTitle($this->language->get('heading_title'));
		$i=1;
		$objPHPExcel->getActiveSheet()->setCellValue('A'.$i, $this->language->get('column_subscribe_id'))->getColumnDimension('A')->setAutoSize(true);
		$objPHPExcel->getActiveSheet()->setCellValue('B'.$i, $this->language->get('column_name'))->getColumnDimension('B')->setAutoSize(true);
		$objPHPExcel->getActiveSheet()->setCellValue('C'.$i, $this->language->get('column_email'))->getColumnDimension('C')->setAutoSize(true);
		$objPHPExcel->getActiveSheet()->setCellValue('D'.$i, $this->language->get('column_status'))->getColumnDimension('D')->setAutoSize(true);
		$objPHPExcel->getActiveSheet()->setCellValue('E'.$i, $this->language->get('column_approved'))->getColumnDimension('E')->setAutoSize(true);
		$objPHPExcel->getActiveSheet()->setCellValue('F'.$i, $this->language->get('column_ip'))->getColumnDimension('F')->setAutoSize(true);
		$objPHPExcel->getActiveSheet()->setCellValue('G'.$i, $this->language->get('column_date_added'))->getColumnDimension('G')->setAutoSize(true);
		
		
		$subscribers = $this->model_catalog_awesomenewsletter->getNewsletterSubscribers();
		
		foreach($subscribers as $subscriber){
			$i++;
			$objPHPExcel->getActiveSheet()->setCellValue('A'.$i, $subscriber['awesomenewsletter_id']);
			$objPHPExcel->getActiveSheet()->setCellValue('B'.$i, $subscriber['name']);
			$objPHPExcel->getActiveSheet()->setCellValue('C'.$i, $subscriber['email']);
			$objPHPExcel->getActiveSheet()->setCellValue('D'.$i, $subscriber['status']);
			$objPHPExcel->getActiveSheet()->setCellValue('E'.$i, $subscriber['approved']);
			$objPHPExcel->getActiveSheet()->setCellValue('F'.$i, $subscriber['ip']);
			$objPHPExcel->getActiveSheet()->setCellValue('G'.$i, $subscriber['date_added']);
		}
		
		$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
		
		$filename = 'newsletter_subscriber'.time().'.xls';
		
		header('Content-Type: application/vnd.ms-excel'); 
		header('Content-Disposition: attachment;filename='.$filename); 
		header('Cache-Control: max-age=0'); 
		
		$objWriter->save('php://output'); 
		
		exit();
	}
	//21-10-2016
	public function validateimport(){
		if (!$this->user->hasPermission('modify', 'extension/module/awesomenewsletter')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}
	
	public function import(){
		include DIR_SYSTEM.'library/PHPExcel.php';
		$this->load->language('extension/module/awesomenewsletter');
		$this->load->model('catalog/awesomenewsletter');
		if(($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateimport()){
			if($this->request->files){
			$file = basename($this->request->files['import']['name']);
			move_uploaded_file($this->request->files['import']['tmp_name'], $file);
			$inputFileName = $file;
			$extension = pathinfo($inputFileName);
			if($extension['basename']){
				if($extension['extension']=='xlsx' || $extension['extension']=='xls'){
					try{
						$objPHPExcel = PHPExcel_IOFactory::load($inputFileName);
					}catch(Exception $e){
						die('Error loading file "'.pathinfo($inputFileName,PATHINFO_BASENAME).'": '.$e->getMessage());
					}
					$allDataInSheet = $objPHPExcel->getActiveSheet()->toArray(null,true,true,true);
					$i=0;
					foreach($allDataInSheet as $value){
						if($i!=0 && $value['C']){
							$filter_data=array(
								'name' 				=> (isset($value['B']) ? $value['B'] : ''),
								'email' 			=> (isset($value['C']) ? $value['C'] : ''),
								'status' 			=> (isset($value['D']) ? $value['D'] : 0),
								'approved' 		=> (isset($value['E']) ? $value['E'] : 0),
								'ip' 					=> (isset($value['F']) ? $value['F'] : ''),
								'date_added' 	=> (isset($value['G']) ? $value['G'] : date('Y-m-d')),
							);
							$info = $this->model_catalog_awesomenewsletter->getTotalByEmail($value['C']);
						   if(!$info){
							  $this->model_catalog_awesomenewsletter->addawesomenewsletter($filter_data);
							 }
						}
						$i++;
					}
					$this->session->data['success'] = $this->language->get('text_success');
				} else{
					$this->session->data['error_warning'] = $this->language->get('error_warning');
				}
			}else{
				$this->session->data['error_warning'] = $this->language->get('error_warning');
			}
			if($inputFileName){
				unlink($inputFileName);
			}
		  }else{
			$this->session->data['error_warning'] = $this->language->get('error_warning');
		  }
	  }
		$this->response->redirect($this->url->link('extension/module/awesomenewsletter', 'token=' . $this->session->data['token'], 'SSL'));
	}
	
	public function importdeafultsubscriber(){
		$this->load->language('extension/module/awesomenewsletter');
		$this->load->model('catalog/awesomenewsletter');
		$customers = $this->model_catalog_awesomenewsletter->getCustomers($filter_data=array());
		foreach($customers as $customer){
			$filter_data=array(
				'name' 				=> $customer['name'],
				'email' 			=> $customer['email'],
				'status' 			=> $customer['status'],
				'approved' 		=> $customer['approved'],
				'ip' 					=> $customer['ip'],
				'date_added' 	=> $customer['date_added'],
			);
			$info = $this->model_catalog_awesomenewsletter->getTotalByEmail($customer['email']);
			if(!$info){
				$this->model_catalog_awesomenewsletter->addawesomenewsletter($filter_data);
			}
		}
		$this->session->data['success'] = $this->language->get('text_success');
		$this->response->redirect($this->url->link('extension/module/awesomenewsletter', 'token=' . $this->session->data['token'], 'SSL'));
	}
	//21-10-2016
}