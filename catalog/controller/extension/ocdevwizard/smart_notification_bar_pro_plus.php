<?php
##=====================================================================##
## @author    : OCdevWizard                                            ##
## @contact   : ocdevwizard@gmail.com                                  ##
## @support   : http://help.ocdevwizard.com                            ##
## @license   : http://license.ocdevwizard.com/Licensing_Policy.pdf    ##
## @copyright : (c) OCdevWizard. Smart Notification Bar Pro Plus, 2017 ##
##=====================================================================##
class ControllerExtensionOcdevwizardSmartNotificationBarProPlus extends Controller {
  private $_name = 'smart_notification_bar_pro_plus';
  private $_code = 'smnbpp';
  private $_version = '1.0.1';
  
  public function index() {
    $data = array();
    
    $models = array(
      'design/layout',
      'catalog/product',
      'catalog/category',
      'catalog/manufacturer',
      'catalog/information',
      'extension/ocdevwizard/'.$this->_name
    );
    
    foreach ($models as $model) {
      $this->load->model($model);
    }
    
    $data['_name'] = $this->_name;
    $data['_code'] = $this->_code;
    
    if (isset($this->request->get['route'])) {
      $route = (string)$this->request->get['route'];
    } else {
      $route = 'common/home';
    }
    
    $layout_id = 0;
    
    if ($route == 'product/category' && isset($this->request->get['path'])) {
      $path = explode('_', (string)$this->request->get['path']);
      
      $layout_id = $this->model_catalog_category->getCategoryLayoutId(end($path));
    }
    
    if ($route == 'product/product' && isset($this->request->get['product_id'])) {
      $layout_id = $this->model_catalog_product->getProductLayoutId($this->request->get['product_id']);
    }
    
    if ($route == 'information/information' && isset($this->request->get['information_id'])) {
      $layout_id = $this->model_catalog_information->getInformationLayoutId($this->request->get['information_id']);
    }
    
    if (!$layout_id) {
      $layout_id = $this->model_design_layout->getLayout($route);
    }
    
    if (!$layout_id) {
      $layout_id = $this->config->get('config_layout_id');
    }
    
    $data['forms'] = array();
    
    $filter_data = array(
      'layout_id' => $layout_id
    );
    
    if (isset($this->request->get['product_id'])) {
      $product_info = $this->model_catalog_product->getProduct($this->request->get['product_id']);
    }
    
    if (isset($this->request->get['path'])) {
      $path = explode('_', (string)$this->request->get['path']);
      
      $category_info = $this->model_catalog_category->getCategory(end($path));
    }
    
    if (isset($this->request->get['manufacturer_id'])) {
      $manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);
    }
    
    if (isset($this->request->get['information_id'])) {
      $information_info = $this->model_catalog_information->getInformation($this->request->get['information_id']);
    }
    
    $results = $this->{'model_extension_ocdevwizard_'.$this->_name}->getForms($filter_data);
    
    $stop = 0;
    
    foreach ($results as $result) {
      if ($result['date_status']) {
        $today = strtotime(date("Y-m-d h:i:s"));
        $start = strtotime($result['date_period_start']);
        $expire = strtotime($result['date_period_end']);

        if ($today > $start && $today < $expire) {
          $stop = 0;
        } else {
          $stop = 1;
        }
      }
      
      if ($result['mixed_data_type']) {
        if ($result['mixed_data_type'] == 1) {
          if (!isset($this->request->get['product_id'])) {
            $stop = 1;
          }
          
          if (isset($this->request->get['product_id'])) {
            if (in_array($this->request->get['product_id'], $this->{'model_extension_ocdevwizard_'.$this->_name}->getFormMixedData($result['form_id'], 1))) {
              $stop = 0;
            }

            if (!in_array($this->request->get['product_id'], $this->{'model_extension_ocdevwizard_'.$this->_name}->getFormMixedData($result['form_id'], 1))) {
              $stop = 1;
            }
          }
        } else if ($result['mixed_data_type'] == 2) {
          if (!isset($this->request->get['path'])) {
            $stop = 1;
          }

          if (isset($this->request->get['path'])) {
            $path = explode('_', (string)$this->request->get['path']);

            if (in_array(end($path), $this->{'model_extension_ocdevwizard_'.$this->_name}->getFormMixedData($result['form_id'], 2))) {
              $stop = 0;
            }

            if (!in_array(end($path), $this->{'model_extension_ocdevwizard_'.$this->_name}->getFormMixedData($result['form_id'], 2))) {
              $stop = 1;
            }
          }
        } else if ($result['mixed_data_type'] == 3) {
          if (!isset($this->request->get['manufacturer_id'])) {
            $stop = 1;
          }

          if (isset($this->request->get['manufacturer_id'])) {
            if (in_array($this->request->get['manufacturer_id'], $this->{'model_extension_ocdevwizard_'.$this->_name}->getFormMixedData($result['form_id'], 3))) {
              $stop = 0;
            }

            if (!in_array($this->request->get['manufacturer_id'], $this->{'model_extension_ocdevwizard_'.$this->_name}->getFormMixedData($result['form_id'], 3))) {
              $stop = 1;
            }
          }
        } else if ($result['mixed_data_type'] == 4) {
          if (!isset($this->request->get['information_id'])) {
            $stop = 1;
          }

          if (isset($this->request->get['information_id'])) {
            if (in_array($this->request->get['information_id'], $this->{'model_extension_ocdevwizard_'.$this->_name}->getFormMixedData($result['form_id'], 4))) {
              $stop = 0;
            }

            if (!in_array($this->request->get['information_id'], $this->{'model_extension_ocdevwizard_'.$this->_name}->getFormMixedData($result['form_id'], 4))) {
              $stop = 1;
            }
          }
        }
      }
      
      $coupon_info = $this->{'model_extension_ocdevwizard_'.$this->_name}->getCoupon($result['gift_coupon']);
      
      if ($stop != 1) {
        $tag_codes = array(
          '{firstname}',
          '{lastname}',
          '{email}',
          '{telephone}',
          '{store_name}',
          '{store_address}',
          '{store_email}',
          '{store_telephone}',
          '{store_fax}',
          '{coupon_code}',
          '{product_name}',
          '{category_name}',
          '{manufacturer_name}',
          '{information_name}',
          '{date_period_start}',
          '{date_period_end}'
        );
        
        $tag_codes_replace = array(
          $this->customer->isLogged() ? $this->customer->getFirstName() : '',
          $this->customer->isLogged() ? $this->customer->getLastName() : '',
          $this->customer->isLogged() ? $this->customer->getEmail() : '',
          $this->customer->isLogged() ? $this->customer->getTelephone() : '',
          $this->config->get('config_name'),
          $this->config->get('config_address'),
          $this->config->get('config_email'),
          $this->config->get('config_telephone'),
          ($this->config->get('config_fax') != '') ? $this->config->get('config_fax') : '',
          ($coupon_info) ? $coupon_info['code'] : '',
          (isset($product_info) && $product_info) ? $product_info['name'] : '',
          (isset($category_info) && $category_info) ? $category_info['name'] : '',
          (isset($manufacturer_info) && $manufacturer_info) ? $manufacturer_info['name'] : '',
          (isset($information_info) && $information_info) ? $information_info['title'] : '',
          $result['date_period_start'],
          $result['date_period_end']
        );
        
        $module_content = html_entity_decode(str_replace($tag_codes, $tag_codes_replace, $result['module_content']), ENT_QUOTES, 'UTF-8');
        
        $data['forms'][] = array(
          'form_id'                     => $result['form_id'],
          'display_frequency'           => $result['display_frequency'],
          'display_frequency_days'      => $result['display_frequency_days'],
          'display_position'            => $result['display_position'],
          'display_position_type'       => $result['display_position_type'],
          'animation_type'              => $result['animation_type'],
          'animation_duration'          => $result['animation_duration'],
          'close_button_status'         => $result['close_button_status'],
          'module_trigger'              => $result['module_trigger'],
          'module_trigger_target'       => $result['module_trigger_target'],
          'module_trigger_scroll_value' => $result['module_trigger_scroll_value'],
          'module_content'              => $module_content,
          'insert_module'               => $result['insert_module'],
          'module_class'                => $result['module_class'],
          'module_id_selector'          => $result['module_id_selector'],
          'show_delay'                  => $result['show_delay'],
          'background_color'            => $result['background_color'],
          'text_color'                  => $result['text_color'],
          'font_size'                   => $result['font_size'],
          'border_radius'               => $result['border_radius'],
          'border_width'                => $result['border_width'],
          'border_color'                => $result['border_color'],
          'text_align'                  => $result['text_align'],
          'custom_js'                   => $result['custom_js'],
          'custom_js_code'              => html_entity_decode($result['custom_js_code'], ENT_QUOTES, 'UTF-8')
        );
      }
    }
    
    if (version_compare(VERSION, '2.1.0.2.1', '<=')) {
      if (file_exists(DIR_TEMPLATE.$this->config->get('config_template').'/template/extension/ocdevwizard/'.$this->_name.'/index.tpl')) {
        return $this->load->view($this->config->get('config_template').'/template/extension/ocdevwizard/'.$this->_name.'/index.tpl', $data);
      } else {
        return $this->load->view('default/template/extension/ocdevwizard/'.$this->_name.'/index.tpl', $data);
      }
    } else if (version_compare(VERSION, '3.0.0.0', '>=')) {
      return $this->load->view('extension/ocdevwizard/'.$this->_name.'/index', $data);
    } else {
      return $this->load->view('extension/ocdevwizard/'.$this->_name.'/index.tpl', $data);
    }
  }
  
  public function validate() {
    $json = array();
    
    if ((isset($this->request->get['form']) && $this->request->get['form']) && (isset($this->request->get['type']) && $this->request->get['type'])) {
      if ($this->request->get['type'] == 'session') {
        if (isset($this->session->data[$this->request->get['form']])) {
          $json['status'] = 1;
        } else {
          $this->session->data[$this->request->get['form']] = 1;
          $json['status']                                   = 0;
        }
      }
      
      if ($this->request->get['type'] == 'cookie' && (isset($this->request->get['days']) && $this->request->get['days'])) {
        if (isset($this->request->cookie[$this->request->get['form']])) {
          $json['status'] = 1;
        } else {
          setcookie($this->request->get['form'], 1, time() + (60 * 60 * 24 * $this->request->get['days']), "/");
          $json['status'] = 0;
        }
      }
    }
    
    $this->response->addHeader('Content-Type: application/json');
    $this->response->setOutput(json_encode($json));
  }
}
?>