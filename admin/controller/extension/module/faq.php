<?php

class ControllerExtensionModuleFaq extends Controller {

    private $error = array();

    public function install() {
        $this->load->model('setting/setting');
        $this->load->model('user/user_group');
        $this->load->model('design/layout');
        $this->load->model('extension/faq');

        $this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'extension/module/faq');
        $this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'extension/module/faq');

        $faq_layout = array(
            'name' => 'FAQ',
            'layout_route' => array(
                'first_route' => array(
                    'store_id' => '0',
                    'route' => 'faq'
                )
            )
        );
        $this->model_design_layout->addLayout($faq_layout);

        $this->model_extension_faq->createTable();

        $this->model_extension_faq->addRoute();
    }

    public function index() {
        $this->load->language('extension/module/faq');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('extension/faq');

        $this->getList();
    }

    protected function getList() {
        if (isset($this->request->get['filter_status'])) {
            $filter_status = $this->request->get['filter_status'];
        } else {
            $filter_status = null;
        }

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'f.create';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . $this->request->get['filter_status'];
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

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/module/faq', 'token=' . $this->session->data['token'] . $url, true)
        );

        $data['add'] = $this->url->link('extension/module/faq/add', 'token=' . $this->session->data['token'] . $url, true);
        $data['delete'] = $this->url->link('extension/module/faq/delete', 'token=' . $this->session->data['token'] . $url, true);

        $data['questions'] = array();

        $filter_data = array(
            'filter_status'   => $filter_status,
            'sort'            => $sort,
            'order'           => $order,
            'start'           => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit'           => $this->config->get('config_limit_admin')
        );

        $questions_total = $this->model_extension_faq->getTotalQuestions($filter_data);

        $results = $this->model_extension_faq->getQuestions($filter_data);

        foreach ($results as $result) {
            $data['questions'][] = array(
                'id' => $result['id'],
                'title'       => $result['title'],
                'category'   => ($result['category']) ? $result['category'] : '-',
                'status'     => ($result['status']) ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),
                'info'      => $this->getInfo($result),
                'edit'       => $this->url->link('extension/module/faq/edit', 'token=' . $this->session->data['token'] . '&question_id=' . $result['id'] . $url, true)
            );
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_list'] = $this->language->get('text_list');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');

        $data['column_title'] = $this->language->get('column_title');
        $data['column_cat_title'] = $this->language->get('column_cat_title');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_action'] = $this->language->get('column_action');

        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_quantity'] = $this->language->get('entry_quantity');
        $data['entry_status'] = $this->language->get('entry_status');

        $data['button_add'] = $this->language->get('button_add');
        $data['button_edit'] = $this->language->get('button_edit');
        $data['button_delete'] = $this->language->get('button_delete');
        $data['button_filter'] = $this->language->get('button_filter');

        $data['token'] = $this->session->data['token'];

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

        if (isset($this->request->post['selected'])) {
            $data['selected'] = (array)$this->request->post['selected'];
        } else {
            $data['selected'] = array();
        }

        $url = '';

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . $this->request->get['filter_status'];
        }

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['sort_status'] = $this->url->link('extension/module/faq', 'token=' . $this->session->data['token'] . '&sort=f.status' . $url, true);
        $data['sort_order'] = $this->url->link('extension/module/faq', 'token=' . $this->session->data['token'] . '&sort=f.sort_order' . $url, true);

        $url = '';

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . $this->request->get['filter_status'];
        }

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $questions_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('extension/module/faq', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($questions_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($questions_total - $this->config->get('config_limit_admin'))) ? $questions_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $questions_total, ceil($questions_total / $this->config->get('config_limit_admin')));

        $data['filter_status'] = $filter_status;

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/module/faq_list', $data));
    }
    protected function getInfo($result){
        if(empty($result['username'])){
            return '';
        }
        $txt = '';
        $txt .= '??????:'.$result['username'].'</br>';
        $txt .= '??????????:'.$result['email'].'</br>';
        $txt .= '?????????? ????????????????:'.$result['phone'].'</br>';
        return $txt;
    }

    public function add() {
        $this->load->language('extension/module/faq');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('extension/faq');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_extension_faq->addFaq($this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_status'])) {
                $url .= '&filter_status=' . $this->request->get['filter_status'];
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

            $this->response->redirect($this->url->link('extension/module/faq', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getForm();
    }

    public function edit() {
        $this->load->language('extension/module/faq');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('extension/faq');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_extension_faq->editFaq($this->request->get['question_id'], $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_status'])) {
                $url .= '&filter_status=' . $this->request->get['filter_status'];
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

            $this->response->redirect($this->url->link('extension/module/faq', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getForm();
    }

    public function delete() {
        $this->load->language('extension/module/faq');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('extension/faq');

        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $question_id) {
                $this->model_extension_faq->deleteFaq($question_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_status'])) {
                $url .= '&filter_status=' . $this->request->get['filter_status'];
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

            $this->response->redirect($this->url->link('extension/module/faq', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getList();
    }

    protected function validateDelete() {
        if (!$this->user->hasPermission('modify', 'extension/module/faq')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }

    protected function getForm() {
        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_form'] = !isset($this->request->get['question_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_none'] = $this->language->get('text_none');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');
        $data['text_plus'] = $this->language->get('text_plus');
        $data['text_minus'] = $this->language->get('text_minus');
        $data['text_default'] = $this->language->get('text_default');
        $data['text_nocat'] = $this->language->get('text_nocat');

        $data['entry_create'] = $this->language->get('entry_create');
        $data['entry_title'] = $this->language->get('entry_title');
        $data['entry_answer'] = $this->language->get('entry_answer');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $data['entry_faq_cat'] = $this->language->get('entry_faq_cat');

        $data['help_category'] = $this->language->get('help_category');
        $data['help_intro_text'] = $this->language->get('help_intro_text');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['button_remove'] = $this->language->get('button_remove');

        $data['tab_general'] = $this->language->get('tab_general');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['name'])) {
            $data['error_title'] = $this->error['title'];
        } else {
            $data['error_title'] = array();
        }

        $url = '';

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . $this->request->get['filter_status'];
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

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/module/faq', 'token=' . $this->session->data['token'] . $url, true)
        );

        if (!isset($this->request->get['question_id'])) {
            $data['action'] = $this->url->link('extension/module/faq/add', 'token=' . $this->session->data['token'] . $url, true);
        } else {
            $data['action'] = $this->url->link('extension/module/faq/edit', 'token=' . $this->session->data['token'] . '&question_id=' . $this->request->get['question_id'] . $url, true);
        }

        $data['cancel'] = $this->url->link('extension/module/faq', 'token=' . $this->session->data['token'] . $url, true);

        if (isset($this->request->get['question_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $question_info = $this->model_extension_faq->getQuestion($this->request->get['question_id']);
        }

        // Get categories
        $data['categories'] = $this->model_extension_faq->getCategories();

        $data['token'] = $this->session->data['token'];

        $this->load->model('localisation/language');

        $data['languages'] = $this->model_localisation_language->getLanguages();

        if (isset($this->request->post['faq_question'])) {
            $data['faq_question'] = $this->request->post['faq_question'];
        } elseif (isset($this->request->get['question_id'])) {
            $data['faq_question'] = $this->model_extension_faq->getFaqDescriptions($this->request->get['question_id']);
            $data['faq_question']['cat_id'] = $question_info['cat_id'];
        } else {
            $data['faq_question'] = array();
            $data['faq_question']['cat_id'] = null;
        }

        if (isset($this->request->post['sort_order'])) {
            $data['sort_order'] = $this->request->post['sort_order'];
        } elseif (!empty($question_info)) {
            $data['sort_order'] = $question_info['sort_order'];
        } else {
            $data['sort_order'] = 1;
        }

        if (isset($this->request->post['status'])) {
            $data['status'] = $this->request->post['status'];
        } elseif (!empty($question_info)) {
            $data['status'] = $question_info['status'];
        } else {
            $data['status'] = true;
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/module/faq_form', $data));
    }

    protected function validateForm() {
        if (!$this->user->hasPermission('modify', 'extension/module/faq')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        foreach ($this->request->post['faq_question'] as $language_id => $value) {
            if ((utf8_strlen($value['title']) < 3) || (utf8_strlen($value['title']) > 255)) {
                $this->error['title'][$language_id] = $this->language->get('error_title');
            }
        }

        if ($this->error && !isset($this->error['warning'])) {
            $this->error['warning'] = $this->language->get('error_warning');
        }

        return !$this->error;
    }

    public function uninstall() {
        $this->load->model('setting/setting');
        $this->load->model('user/user_group');
        $this->load->model('design/layout');
        $this->load->model('extension/faq');

        $this->model_user_user_group->removePermission($this->user->getGroupId(), 'access', 'extension/module/faq');
        $this->model_user_user_group->removePermission($this->user->getGroupId(), 'modify', 'extension/module/faq');

        $this->model_extension_faq->removeLayout();

        $this->model_extension_faq->removeTable();

        $this->model_extension_faq->removeRoute();
    }
}