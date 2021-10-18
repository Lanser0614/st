<?php
class ControllerExtensionFeedYandexTurbo extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/feed/yandex_turbo');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('yandex_turbo', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=feed', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_yandex_category'] = $this->language->get('entry_yandex_category');
		$data['entry_category'] = $this->language->get('entry_category');
		$data['entry_data_feed'] = $this->language->get('entry_data_feed');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_category_add'] = $this->language->get('button_category_add');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=feed', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/feed/yandex_turbo', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/feed/yandex_turbo', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=feed', true);

		$data['token'] = $this->session->data['token'];

		$data['data_feed'] = HTTP_CATALOG . 'index.php?route=extension/feed/yandex_turbo';

		if (isset($this->request->post['yandex_turbo_status'])) {
			$data['yandex_turbo_status'] = $this->request->post['yandex_turbo_status'];
		} else {
			$data['yandex_turbo_status'] = $this->config->get('yandex_turbo_status');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/feed/yandex_turbo', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/feed/yandex_turbo')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	public function install() {
		$this->load->model('extension/feed/yandex_turbo');

		$this->model_extension_feed_yandex_turbo->install();
	}

	public function uninstall() {
		$this->load->model('extension/feed/yandex_turbo');

		$this->model_extension_feed_yandex_turbo->uninstall();
	}


	public function category() {
		$this->load->language('extension/feed/yandex_turbo');

		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_loading'] = $this->language->get('text_loading');
		
		$data['column_category'] = $this->language->get('column_category');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_remove'] = $this->language->get('button_remove');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['yandex_turbo_categories'] = array();

		$filter_data = array(
			'start'           => ($page - 1) * 10,
			'limit'           => 10
		);
		
		$this->load->model('extension/feed/yandex_turbo');

		$results = $this->model_extension_feed_yandex_turbo->getCategories($filter_data);

		foreach ($results as $result) {
			$data['yandex_turbo_categories'][] = array(
				'category_id'             => $result['category_id'],
				'category'                => $result['category']
			);
		}
		$category_total = $this->model_extension_feed_yandex_turbo->getTotalCategories();


		$pagination = new Pagination();
		$pagination->total = $category_total;
		$pagination->page = $page;
		$pagination->limit = 10;
		$pagination->url = $this->url->link('extension/feed/yandex_turbo/category', 'token=' . $this->session->data['token'] . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($category_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($category_total - 10)) ? $category_total : ((($page - 1) * 10) + 10), $category_total, ceil($category_total / 10));

		$this->response->setOutput($this->load->view('extension/feed/yandex_turbo_category', $data));
	}

	public function addCategory() {
		$this->load->language('extension/feed/yandex_turbo');

		$json = array();

		if (!$this->user->hasPermission('modify', 'sale/order')) {
			$json['error'] = $this->language->get('error_permission');
		} elseif (!empty($this->request->post['category_id'])) {
			$this->load->model('extension/feed/yandex_turbo');

			$this->model_extension_feed_yandex_turbo->addCategory($this->request->post);

			$json['success'] = $this->language->get('text_success');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function removeCategory() {
		$this->load->language('extension/feed/yandex_turbo');

		$json = array();

		if (!$this->user->hasPermission('modify', 'sale/order')) {
			$json['error'] = $this->language->get('error_permission');
		} else {
			$this->load->model('extension/feed/yandex_turbo');

			$this->model_extension_feed_yandex_turbo->deleteCategory($this->request->post['category_id']);

			$json['success'] = $this->language->get('text_success');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
