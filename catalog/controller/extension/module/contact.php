<?php
class ControllerExtensionModuleContact extends Controller
{
    public function index()
    {

        $this->load->model('extension/module/contact');
        $this->load->language('extension/module/contact');
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );
        $this->document->setTitle($this->language->get('meta_title'));
        $this->document->setDescription($this->language->get('meta_desc'));
        $this->document->setKeywords($this->language->get('meta_keyw'));
        $data['heading_title'] = $this->language->get('heading_title');
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/module/contact')
        );
        $data['enquiry'] = '';
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');
        if(isset($this->request->post['analog'])){
            $this->request->post['analog'] = true;
            $this->request->post['origin'] = false;
        }else{
            $this->request->post['origin'] = true;
            $this->request->post['analog'] = false;
        }
        if($this->model_extension_module_contact->validate($this->request->post)){
            $data['success_text'] = $this->language->get('success_text');
        
            $this->model_extension_module_contact->addContact($this->request->post);
            $this->request->post= [];
        }else{
            $data['success_text'] = '';
        }
        $this->response->setOutput($this->load->view('extension/module/contact', $data));
    }


}