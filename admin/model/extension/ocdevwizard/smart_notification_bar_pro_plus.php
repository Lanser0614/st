<?php
##=====================================================================##
## @author    : OCdevWizard                                            ##
## @contact   : ocdevwizard@gmail.com                                  ##
## @support   : http://help.ocdevwizard.com                            ##
## @license   : http://license.ocdevwizard.com/Licensing_Policy.pdf    ##
## @copyright : (с) OCdevWizard. Smart Notification Bar Pro Plus, 2017 ##
##=====================================================================##
libxml_use_internal_errors(true);

class ModelExtensionOcdevwizardSmartNotificationBarProPlus extends Model {
  private $_name = 'smart_notification_bar_pro_plus';
  private $_code = 'smnbpp';
  private $_version = '1.0.1';
  
  public function createDBTables() {
    $sql1 = "CREATE TABLE IF NOT EXISTS ".DB_PREFIX."ocdevwizard_setting ( ";
    $sql1 .= "`setting_id` int(11) NOT NULL AUTO_INCREMENT,";
    $sql1 .= "`store_id` int(11) NOT NULL DEFAULT '0',";
    $sql1 .= "`code` varchar(32) NOT NULL,";
    $sql1 .= "`key` varchar(64) NOT NULL,";
    $sql1 .= "`value` text NOT NULL,";
    $sql1 .= "`serialized` tinyint(1) NOT NULL,";
    $sql1 .= "PRIMARY KEY (`setting_id`)";
    $sql1 .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;";
    
    $this->db->query($sql1);
    
    $sql2 = "CREATE TABLE IF NOT EXISTS ".DB_PREFIX.$this->_code."_form (";
    $sql2 .= "`form_id` int(11) NOT NULL AUTO_INCREMENT, ";
    $sql2 .= "`status` tinyint(1) NOT NULL, ";
    $sql2 .= "`heading` varchar(64) COLLATE utf8_general_ci NOT NULL, ";
    $sql2 .= "`mixed_data_type` int(1) NOT NULL, ";
    $sql2 .= "`display_frequency` int(1) NOT NULL, ";
    $sql2 .= "`display_frequency_days` int(11) NOT NULL, ";
    $sql2 .= "`display_position` int(1) NOT NULL, ";
    $sql2 .= "`display_position_type` int(1) NOT NULL, ";
    $sql2 .= "`animation_type` int(1) NOT NULL, ";
    $sql2 .= "`animation_duration` int(11) NOT NULL, ";
    $sql2 .= "`close_button_status` int(1) NOT NULL, ";
    $sql2 .= "`module_trigger` int(1) NOT NULL, ";
    $sql2 .= "`module_trigger_target` text NOT NULL,";
    $sql2 .= "`module_trigger_scroll_value` int(3) NOT NULL, ";
    $sql2 .= "`insert_module` text NOT NULL, ";
    $sql2 .= "`module_class` varchar(128) COLLATE utf8_general_ci NOT NULL, ";
    $sql2 .= "`module_id_selector` varchar(128) COLLATE utf8_general_ci NOT NULL, ";
    $sql2 .= "`show_delay` int(11) NOT NULL, ";
    $sql2 .= "`custom_js` int(1) NOT NULL, ";
    $sql2 .= "`custom_js_code` text NOT NULL, ";
    $sql2 .= "`sort_order` int(3) NOT NULL, ";
    $sql2 .= "`date_status` int(1) NOT NULL, ";
    $sql2 .= "`date_period_start` datetime NOT NULL, ";
    $sql2 .= "`date_period_end` datetime NOT NULL, ";
    $sql2 .= "`background_color` varchar(64) COLLATE utf8_general_ci NOT NULL, ";
    $sql2 .= "`text_color` varchar(64) COLLATE utf8_general_ci NOT NULL, ";
    $sql2 .= "`font_size` int(3) NOT NULL, ";
    $sql2 .= "`border_radius` int(1) NOT NULL, ";
    $sql2 .= "`border_width` int(1) NOT NULL, ";
    $sql2 .= "`border_color` varchar(64) COLLATE utf8_general_ci NOT NULL, ";
    $sql2 .= "`text_align` varchar(64) COLLATE utf8_general_ci NOT NULL, ";
    $sql2 .= "`gift_coupon` text NOT NULL, ";
    $sql2 .= "`date_added` datetime NOT NULL, ";
    $sql2 .= "`date_modified` datetime NOT NULL, ";
    $sql2 .= "PRIMARY KEY (`form_id`) ";
    $sql2 .= ") ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE utf8_general_ci AUTO_INCREMENT=1;";
    
    $this->db->query($sql2);
    
    $sql3 = "CREATE TABLE IF NOT EXISTS ".DB_PREFIX.$this->_code."_form_description (";
    $sql3 .= "`form_id` int(11) NOT NULL, ";
    $sql3 .= "`language_id` int(11) NOT NULL, ";
    $sql3 .= "`module_content` text COLLATE utf8_general_ci NOT NULL ";
    $sql3 .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;";
    
    $this->db->query($sql3);
    
    $sql4 = "CREATE TABLE IF NOT EXISTS ".DB_PREFIX.$this->_code."_form_to_customer_group (";
    $sql4 .= "`form_id` int(11) NOT NULL, ";
    $sql4 .= "`customer_group_id` int(11) NOT NULL ";
    $sql4 .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;";
    
    $this->db->query($sql4);
    
    $sql5 = "CREATE TABLE IF NOT EXISTS ".DB_PREFIX.$this->_code."_form_to_store (";
    $sql5 .= "`form_id` int(11) NOT NULL, ";
    $sql5 .= "`store_id` int(11) NOT NULL ";
    $sql5 .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;";
    
    $this->db->query($sql5);
    
    $sql6 = "CREATE TABLE IF NOT EXISTS ".DB_PREFIX.$this->_code."_form_to_layout (";
    $sql6 .= "`form_id` int(11) NOT NULL, ";
    $sql6 .= "`layout_id` int(11) NOT NULL ";
    $sql6 .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;";
    
    $this->db->query($sql6);
    
    $sql7 = "CREATE TABLE IF NOT EXISTS ".DB_PREFIX.$this->_code."_form_mixed_data (";
    $sql7 .= "`form_id` int(11) NOT NULL, ";
    $sql7 .= "`type` int(1) NOT NULL, ";
    $sql7 .= "`mixed_data` longtext NOT NULL ";
    $sql7 .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;";
    
    $this->db->query($sql7);
  }
  
  public function deleteDBTables() {
    $this->db->query("DROP TABLE IF EXISTS ".DB_PREFIX.$this->_code."_form;");
    $this->db->query("DROP TABLE IF EXISTS ".DB_PREFIX.$this->_code."_form_description;");
    $this->db->query("DROP TABLE IF EXISTS ".DB_PREFIX.$this->_code."_form_to_customer_group;");
    $this->db->query("DROP TABLE IF EXISTS ".DB_PREFIX.$this->_code."_form_to_store;");
    $this->db->query("DROP TABLE IF EXISTS ".DB_PREFIX.$this->_code."_form_to_layout;");
    $this->db->query("DROP TABLE IF EXISTS ".DB_PREFIX.$this->_code."_form_mixed_data;");
  }
  
  public function getOCdevCatalog() {
    $catalog = array();
    
    $curl = curl_init();
    
    curl_setopt($curl, CURLOPT_URL, 'http://ocdevwizard.com/products/share/share.xml');
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl, CURLOPT_HEADER, 0);
    
    $response_data = curl_exec($curl);
    $httpcode_data = curl_getinfo($curl, CURLINFO_HTTP_CODE);
    
    curl_close($curl);
    
    $results = simplexml_load_string($response_data);
    
    if ($httpcode_data == 200 && !empty($response_data) && $results !== false) {
      foreach ($results->product as $product) {
        $language = substr($this->request->server['HTTP_ACCEPT_LANGUAGE'], 0, 2);
        
        $catalog[] = array(
          'extension_id'     => (int)$product->extension_id,
          'title'            => (string)$product->title,
          'img'              => (string)$product->img,
          'price'            => (string)$product->price,
          'url'              => (string)str_replace("&amp;", "&", $product->url),
          'date_added'       => (string)$product->date_added,
          'opencart_version' => (string)$product->opencart_version,
          'latest_version'   => (string)$product->latest_version,
          'version_compare'  => version_compare($this->_version, (string)$product->latest_version),
          'features'         => (in_array($language, array(
              'ru',
              'uk'
            )) && $product->{'features_'.$language}) ? (string)$product->{'features_'.$language} : (string)$product->features
        );
      }
      
      $sort_order = array();
      
      foreach ($catalog as $key => $value) {
        $sort_order[$key] = strtotime($value['date_added']);
      }
      
      array_multisort($sort_order, SORT_DESC, $catalog);
    }
    
    return $catalog;
  }
  
  public function getOCdevSupportInfo() {
    $catalog = array();
    
    $curl = curl_init();
    
    curl_setopt($curl, CURLOPT_URL, 'http://ocdevwizard.com/support/support.xml');
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl, CURLOPT_HEADER, 0);
    
    $response_data = curl_exec($curl);
    $httpcode_data = curl_getinfo($curl, CURLINFO_HTTP_CODE);
    
    curl_close($curl);
    
    $results = simplexml_load_string($response_data);
    
    if ($httpcode_data == 200 && !empty($response_data) && $results !== false) {
      $language = substr($this->request->server['HTTP_ACCEPT_LANGUAGE'], 0, 2);
      
      $catalog = array(
        'general'       => (in_array($language, array(
            'ru',
            'uk'
          )) && $results->{'general_'.$language}) ? (string)$results->{'general_'.$language} : (string)$results->general,
        'terms'         => (in_array($language, array(
            'ru',
            'uk'
          )) && $results->{'terms_'.$language}) ? (string)$results->{'terms_'.$language} : (string)$results->terms,
        'faq'           => (in_array($language, array(
            'ru',
            'uk'
          )) && $results->{'faq_'.$language}) ? (string)$results->{'faq_'.$language} : (string)$results->faq,
        'license'       => (string)$results->license,
        'license_error' => (string)$results->license_error
      );
    }
    
    return $catalog;
  }
  
  public function addForm($data) {
    $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form SET status = '".(int)$data['status']."', heading = '".$this->db->escape($data['heading'])."', mixed_data_type = '".(int)$data['mixed_data_type']."', display_position = '".(int)$data['display_position']."', display_position_type = '".(int)$data['display_position_type']."', display_frequency = '".(int)$data['display_frequency']."', display_frequency_days = '".(int)$data['display_frequency_days']."', animation_type = '".(int)$data['animation_type']."', animation_duration = '".(int)$data['animation_duration']."', close_button_status = '".(int)$data['close_button_status']."', module_trigger = '".(int)$data['module_trigger']."', module_trigger_target = '".$this->db->escape($data['module_trigger_target'])."', module_trigger_scroll_value = '".(int)$data['module_trigger_scroll_value']."', insert_module = '".$this->db->escape($data['insert_module'])."', module_class = '".$this->db->escape($data['module_class'])."', date_status = '".(int)$data['date_status']."', date_period_start = '".$this->db->escape($data['date_period_start'])."', date_period_end = '".$this->db->escape($data['date_period_end'])."', show_delay = '".(int)$data['show_delay']."', custom_js = '".(int)$data['custom_js']."', custom_js_code = '".$this->db->escape($data['custom_js_code'])."', sort_order = '".(int)$data['sort_order']."', background_color = '".$this->db->escape($data['background_color'])."', text_color = '".$this->db->escape($data['text_color'])."', font_size = '".(int)$data['font_size']."', border_radius = '".(int)$data['border_radius']."', border_width = '".(int)$data['border_width']."', border_color = '".$this->db->escape($data['border_color'])."', text_align = '".$this->db->escape($data['text_align'])."', gift_coupon = '".$this->db->escape($data['gift_coupon'])."', date_added = NOW()");
    
    $form_id = $this->db->getLastId();
    
    foreach ($data['form_description'] as $language_id => $value) {
      $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_description SET form_id = '".(int)$form_id."', language_id = '".(int)$language_id."', module_content = '".$this->db->escape($value['module_content'])."'");
    }
    
    if (isset($data['stores'])) {
      foreach ($data['stores'] as $store_id) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_to_store SET form_id = '".(int)$form_id."', store_id = '".(int)$store_id."'");
      }
    }
    
    if (isset($data['customer_groups'])) {
      foreach ($data['customer_groups'] as $customer_group_id) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_to_customer_group SET form_id = '".(int)$form_id."', customer_group_id = '".(int)$customer_group_id."'");
      }
    }
    
    if (isset($data['layouts'])) {
      foreach ($data['layouts'] as $layout_id) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_to_layout SET form_id = '".(int)$form_id."', layout_id = '".(int)$layout_id."'");
      }
    }
    
    if (isset($data['mixed_data_type']) && !empty($data['mixed_data_type'])) {
      if ($data['mixed_data_type'] == 1) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_mixed_data SET form_id = '".(int)$form_id."', `type` = '".(int)$data['mixed_data_type']."', mixed_data = '".$this->db->escape(isset($data['mixed_data_products']) ? serialize($data['mixed_data_products']) : '')."'");
      }
      
      if ($data['mixed_data_type'] == 2) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_mixed_data SET form_id = '".(int)$form_id."', `type` = '".(int)$data['mixed_data_type']."', mixed_data = '".$this->db->escape(isset($data['mixed_data_categories']) ? serialize($data['mixed_data_categories']) : '')."'");
      }
      
      if ($data['mixed_data_type'] == 3) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_mixed_data SET form_id = '".(int)$form_id."', `type` = '".(int)$data['mixed_data_type']."', mixed_data = '".$this->db->escape(isset($data['mixed_data_manufacturers']) ? serialize($data['mixed_data_manufacturers']) : '')."'");
      }
      
      if ($data['mixed_data_type'] == 4) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_mixed_data SET form_id = '".(int)$form_id."', `type` = '".(int)$data['mixed_data_type']."', mixed_data = '".$this->db->escape(isset($data['mixed_data_informations']) ? serialize($data['mixed_data_informations']) : '')."'");
      }
    }
    
    $this->db->query("UPDATE ".DB_PREFIX.$this->_code."_form SET module_id_selector = '".$this->db->escape($this->_code.'-notification-bar-'.$form_id)."' WHERE form_id = '".(int)$form_id."'");
    
    return $form_id;
  }
  
  public function editForm($form_id, $data) {
    $this->db->query("UPDATE ".DB_PREFIX.$this->_code."_form SET status = '".(int)$data['status']."', heading = '".$this->db->escape($data['heading'])."', mixed_data_type = '".(int)$data['mixed_data_type']."', display_position = '".(int)$data['display_position']."', display_position_type = '".(int)$data['display_position_type']."', display_frequency = '".(int)$data['display_frequency']."', display_frequency_days = '".(int)$data['display_frequency_days']."', animation_type = '".(int)$data['animation_type']."', animation_duration = '".(int)$data['animation_duration']."', close_button_status = '".(int)$data['close_button_status']."', module_trigger = '".(int)$data['module_trigger']."', module_trigger_target = '".$this->db->escape($data['module_trigger_target'])."', module_trigger_scroll_value = '".(int)$data['module_trigger_scroll_value']."', insert_module = '".$this->db->escape($data['insert_module'])."', module_class = '".$this->db->escape($data['module_class'])."', module_id_selector = '".$this->db->escape($data['module_id_selector'])."', date_status = '".(int)$data['date_status']."', date_period_start = '".$this->db->escape($data['date_period_start'])."', date_period_end = '".$this->db->escape($data['date_period_end'])."', show_delay = '".(int)$data['show_delay']."', custom_js = '".(int)$data['custom_js']."', custom_js_code = '".$this->db->escape($data['custom_js_code'])."', sort_order = '".(int)$data['sort_order']."', background_color = '".$this->db->escape($data['background_color'])."', text_color = '".$this->db->escape($data['text_color'])."', font_size = '".(int)$data['font_size']."', border_radius = '".(int)$data['border_radius']."', border_width = '".(int)$data['border_width']."', border_color = '".$this->db->escape($data['border_color'])."', text_align = '".$this->db->escape($data['text_align'])."', gift_coupon = '".$this->db->escape($data['gift_coupon'])."', date_modified = NOW() WHERE form_id = '".(int)$form_id."'");
    
    $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form_description WHERE form_id = '".(int)$form_id."'");
    
    foreach ($data['form_description'] as $language_id => $value) {
      $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_description SET form_id = '".(int)$form_id."', language_id = '".(int)$language_id."', module_content = '".$this->db->escape($value['module_content'])."'");
    }
    
    $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form_to_store WHERE form_id = '".(int)$form_id."'");
    
    if (isset($data['stores'])) {
      foreach ($data['stores'] as $store_id) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_to_store SET form_id = '".(int)$form_id."', store_id = '".(int)$store_id."'");
      }
    }
    
    $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form_to_customer_group WHERE form_id = '".(int)$form_id."'");
    
    if (isset($data['customer_groups'])) {
      foreach ($data['customer_groups'] as $customer_group_id) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_to_customer_group SET form_id = '".(int)$form_id."', customer_group_id = '".(int)$customer_group_id."'");
      }
    }
    
    $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form_to_layout WHERE form_id = '".(int)$form_id."'");
    
    if (isset($data['layouts'])) {
      foreach ($data['layouts'] as $layout_id) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_to_layout SET form_id = '".(int)$form_id."', layout_id = '".(int)$layout_id."'");
      }
    }
    
    if (isset($data['mixed_data_type']) && !empty($data['mixed_data_type'])) {
      $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form_mixed_data WHERE form_id = '".(int)$form_id."' AND `type` = '".(int)$data['mixed_data_type']."'");
      
      if ($data['mixed_data_type'] == 1) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_mixed_data SET form_id = '".(int)$form_id."', `type` = '".(int)$data['mixed_data_type']."', mixed_data = '".$this->db->escape(isset($data['mixed_data_products']) ? serialize($data['mixed_data_products']) : '')."'");
      }
      
      if ($data['mixed_data_type'] == 2) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_mixed_data SET form_id = '".(int)$form_id."', `type` = '".(int)$data['mixed_data_type']."', mixed_data = '".$this->db->escape(isset($data['mixed_data_categories']) ? serialize($data['mixed_data_categories']) : '')."'");
      }
      
      if ($data['mixed_data_type'] == 3) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_mixed_data SET form_id = '".(int)$form_id."', `type` = '".(int)$data['mixed_data_type']."', mixed_data = '".$this->db->escape(isset($data['mixed_data_manufacturers']) ? serialize($data['mixed_data_manufacturers']) : '')."'");
      }
      
      if ($data['mixed_data_type'] == 4) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_mixed_data SET form_id = '".(int)$form_id."', `type` = '".(int)$data['mixed_data_type']."', mixed_data = '".$this->db->escape(isset($data['mixed_data_informations']) ? serialize($data['mixed_data_informations']) : '')."'");
      }
    }
  }
  
  public function getForm($form_id) {
    return $this->db->query("SELECT * FROM ".DB_PREFIX.$this->_code."_form WHERE form_id = '".(int)$form_id."'")->row;
  }
  
  public function getForms($data = array()) {
    $sql = "SELECT DISTINCT * FROM ".DB_PREFIX.$this->_code."_form f LEFT JOIN ".DB_PREFIX.$this->_code."_form_description fd ON (f.form_id = fd.form_id) WHERE fd.language_id = '".(int)$this->config->get('config_language_id')."'";
    
    if (isset($data['filter_form']) && !empty($data['filter_form'])) {
      $sql .= " AND f.heading LIKE '".$this->db->escape($data['filter_form'])."%'";
    }
    
    if (isset($data['filter_display_type']) && !empty($data['filter_display_type'])) {
      $sql .= " AND f.display_type = '".(int)$data['filter_display_type']."'";
    }
    
    if (isset($data['filter_group_form']) && !empty($data['filter_group_form'])) {
      $sql .= " GROUP BY f.heading";
    }
    
    $sort_data = array(
      'f.heading',
      'f.date_added',
      'f.date_modified'
    );
    
    if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
      $sql .= " ORDER BY ".$data['sort'];
    } else {
      $sql .= " ORDER BY f.date_added";
    }
    
    if (isset($data['order']) && ($data['order'] == 'DESC')) {
      $sql .= " DESC";
    } else {
      $sql .= " ASC";
    }
    
    if (isset($data['start']) || isset($data['limit'])) {
      if ($data['start'] < 0) {
        $data['start'] = 0;
      }
      
      if ($data['limit'] < 1) {
        $data['limit'] = 20;
      }
      
      $sql .= " LIMIT ".(int)$data['start'].",".(int)$data['limit'];
    }
    
    return $this->db->query($sql)->rows;
  }
  
  public function getExportForms() {
    $query = $this->db->query("SELECT DISTINCT * FROM ".DB_PREFIX.$this->_code."_form")->rows;
    
    $form_data = array();
    
    if ($query) {
      foreach ($query as $form) {
        $data = array();
        
        $data = $form;
        
        $data = array_merge($data, array('stores' => $this->getFormStores($form['form_id'])));
        $data = array_merge($data, array('customer_groups' => $this->getFormCustomerGroups($form['form_id'])));
        $data = array_merge($data, array('layouts' => $this->getFormLayouts($form['form_id'])));
        $data = array_merge($data, array('form_description' => $this->getFormDescription($form['form_id'])));
        
        switch ($form['mixed_data_type']) {
          case 1:
            $data = array_merge($data, array('mixed_data_products' => $this->getFormMixedDataValue($form['form_id'], 1)));
            break;
          case 2:
            $data = array_merge($data, array('mixed_data_categories' => $this->getFormMixedDataValue($form['form_id'], 2)));
            break;
          case 3:
            $data = array_merge($data, array('mixed_data_manufacturers' => $this->getFormMixedDataValue($form['form_id'], 3)));
            break;
          case 4:
            $data = array_merge($data, array('mixed_data_informations' => $this->getFormMixedDataValue($form['form_id'], 4)));
            break;
        }
        
        $form_data[] = $data;
      }
    }
    
    return $form_data;
  }
  
  public function prepareFormForImport() {
    $this->db->query("TRUNCATE ".DB_PREFIX.$this->_code."_form");
    $this->db->query("TRUNCATE ".DB_PREFIX.$this->_code."_form_description");
    $this->db->query("TRUNCATE ".DB_PREFIX.$this->_code."_form_to_store");
    $this->db->query("TRUNCATE ".DB_PREFIX.$this->_code."_form_to_customer_group");
    $this->db->query("TRUNCATE ".DB_PREFIX.$this->_code."_form_to_layout");
    $this->db->query("TRUNCATE ".DB_PREFIX.$this->_code."_form_mixed_data");
  }
  
  public function importForm($data) {
    $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form SET form_id = '".(int)$data['form_id']."', status = '".(int)$data['status']."', heading = '".$this->db->escape($data['heading'])."', mixed_data_type = '".(int)$data['mixed_data_type']."', display_position = '".(int)$data['display_position']."', display_position_type = '".(int)$data['display_position_type']."', display_frequency = '".(int)$data['display_frequency']."', display_frequency_days = '".(int)$data['display_frequency_days']."', animation_type = '".(int)$data['animation_type']."', animation_duration = '".(int)$data['animation_duration']."', close_button_status = '".(int)$data['close_button_status']."', module_trigger = '".(int)$data['module_trigger']."', module_trigger_target = '".$this->db->escape($data['module_trigger_target'])."', module_trigger_scroll_value = '".(int)$data['module_trigger_scroll_value']."', insert_module = '".$this->db->escape($data['insert_module'])."', module_class = '".$this->db->escape($data['module_class'])."', module_id_selector = '".$this->db->escape($data['module_id_selector'])."', date_status = '".(int)$data['date_status']."', date_period_start = '".$this->db->escape($data['date_period_start'])."', date_period_end = '".$this->db->escape($data['date_period_end'])."', show_delay = '".(int)$data['show_delay']."', custom_js = '".(int)$data['custom_js']."', custom_js_code = '".$this->db->escape($data['custom_js_code'])."', sort_order = '".(int)$data['sort_order']."', background_color = '".$this->db->escape($data['background_color'])."', text_color = '".$this->db->escape($data['text_color'])."', font_size = '".(int)$data['font_size']."', border_radius = '".(int)$data['border_radius']."', border_width = '".(int)$data['border_width']."', border_color = '".$this->db->escape($data['border_color'])."', text_align = '".$this->db->escape($data['text_align'])."', gift_coupon = '".$this->db->escape($data['gift_coupon'])."', date_added = '".$this->db->escape($data['date_added'])."', date_modified = '".$this->db->escape($data['date_modified'])."'");
    
    foreach ($data['form_description'] as $language_id => $value) {
      $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_description SET form_id = '".(int)$data['form_id']."', language_id = '".(int)$language_id."', module_content = '".$this->db->escape($value['module_content'])."'");
    }
    
    if (isset($data['stores'])) {
      foreach ($data['stores'] as $store_id) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_to_store SET form_id = '".(int)$data['form_id']."', store_id = '".(int)$store_id."'");
      }
    }
    
    if (isset($data['customer_groups'])) {
      foreach ($data['customer_groups'] as $customer_group_id) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_to_customer_group SET form_id = '".(int)$data['form_id']."', customer_group_id = '".(int)$customer_group_id."'");
      }
    }
    
    if (isset($data['layouts'])) {
      foreach ($data['layouts'] as $layout_id) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_to_layout SET form_id = '".(int)$data['form_id']."', layout_id = '".(int)$layout_id."'");
      }
    }
    
    if (isset($data['mixed_data_type']) && !empty($data['mixed_data_type'])) {
      if ($data['mixed_data_type'] == 1) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_mixed_data SET form_id = '".(int)$data['form_id']."', `type` = '".(int)$data['mixed_data_type']."', mixed_data = '".$this->db->escape(isset($data['mixed_data_products']) ? serialize($data['mixed_data_products']) : '')."'");
      }
      
      if ($data['mixed_data_type'] == 2) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_mixed_data SET form_id = '".(int)$data['form_id']."', `type` = '".(int)$data['mixed_data_type']."', mixed_data = '".$this->db->escape(isset($data['mixed_data_categories']) ? serialize($data['mixed_data_categories']) : '')."'");
      }
      
      if ($data['mixed_data_type'] == 3) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_mixed_data SET form_id = '".(int)$data['form_id']."', `type` = '".(int)$data['mixed_data_type']."', mixed_data = '".$this->db->escape(isset($data['mixed_data_manufacturers']) ? serialize($data['mixed_data_manufacturers']) : '')."'");
      }
      
      if ($data['mixed_data_type'] == 4) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_mixed_data SET form_id = '".(int)$data['form_id']."', `type` = '".(int)$data['mixed_data_type']."', mixed_data = '".$this->db->escape(isset($data['mixed_data_informations']) ? serialize($data['mixed_data_informations']) : '')."'");
      }
    }
  }
  
  public function getTotalForms($data = array()) {
    $sql = "SELECT COUNT(*) AS total FROM ".DB_PREFIX.$this->_code."_form f LEFT JOIN ".DB_PREFIX.$this->_code."_form_description fd ON (f.form_id = fd.form_id) WHERE fd.language_id = '".(int)$this->config->get('config_language_id')."'";
    
    if (isset($data['filter_form']) && !empty($data['filter_form'])) {
      $sql .= " AND f.heading LIKE '".$this->db->escape($data['filter_form'])."%'";
    }
    
    return $this->db->query($sql)->row['total'];
  }
  
  public function deleteForm($form_id) {
    $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form WHERE form_id = '".(int)$form_id."'");
    $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form_description WHERE form_id = '".(int)$form_id."'");
    $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form_to_store WHERE form_id = '".(int)$form_id."'");
    $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form_to_customer_group WHERE form_id = '".(int)$form_id."'");
    $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form_to_layout WHERE form_id = '".(int)$form_id."'");
    $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form_mixed_data WHERE form_id = '".(int)$form_id."'");
    
    return true;
  }
  
  public function deleteForms() {
    $query = $this->db->query("SELECT form_id FROM ".DB_PREFIX.$this->_code."_form")->rows;
    
    if ($query) {
      foreach ($query as $form) {
        $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form WHERE form_id = '".(int)$form['form_id']."'");
        $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form_description WHERE form_id = '".(int)$form['form_id']."'");
        $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form_to_store WHERE form_id = '".(int)$form['form_id']."'");
        $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form_to_customer_group WHERE form_id = '".(int)$form['form_id']."'");
        $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form_to_layout WHERE form_id = '".(int)$form['form_id']."'");
        $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form_mixed_data WHERE form_id = '".(int)$form['form_id']."'");
      }
      
      return true;
    } else {
      return false;
    }
  }
  
  public function copyForm($form_id) {
    $query = $this->db->query("SELECT * FROM ".DB_PREFIX.$this->_code."_form WHERE form_id = '".(int)$form_id."'")->row;
    
    if ($query) {
      $data = array();
      
      $data = $query;
      
      $data['status'] = '0';
      
      $data = array_merge($data, array('stores' => $this->getFormStores($form_id)));
      $data = array_merge($data, array('customer_groups' => $this->getFormCustomerGroups($form_id)));
      $data = array_merge($data, array('layouts' => $this->getFormLayouts($form_id)));
      $data = array_merge($data, array('form_description' => $this->getFormDescription($form_id)));
  
      switch ($query['mixed_data_type']) {
        case 1:
          $data = array_merge($data, array('mixed_data_products' => $this->getFormMixedDataValue($form_id, 1)));
          break;
        case 2:
          $data = array_merge($data, array('mixed_data_categories' => $this->getFormMixedDataValue($form_id, 2)));
          break;
        case 3:
          $data = array_merge($data, array('mixed_data_manufacturers' => $this->getFormMixedDataValue($form_id, 3)));
          break;
        case 4:
          $data = array_merge($data, array('mixed_data_informations' => $this->getFormMixedDataValue($form_id, 4)));
          break;
      }
      
      $this->addForm($data);
      
      return true;
    } else {
      return false;
    }
  }
  
  public function getFormDescription($form_id) {
    $description_data = array();
    
    $query = $this->db->query("SELECT * FROM ".DB_PREFIX.$this->_code."_form_description WHERE form_id = '".(int)$form_id."'")->rows;
    
    if ($query) {
      foreach ($query as $result) {
        $description_data[$result['language_id']] = array(
          'module_content' => $result['module_content']
        );
      }
    }
    
    return $description_data;
  }
  
  public function getFormStores($form_id) {
    $form_store_data = array();
    
    $query = $this->db->query("SELECT * FROM ".DB_PREFIX.$this->_code."_form_to_store WHERE form_id = '".(int)$form_id."'")->rows;
    
    if ($query) {
      foreach ($query as $result) {
        $form_store_data[] = $result['store_id'];
      }
    }
    
    return $form_store_data;
  }
  
  public function getFormCustomerGroups($form_id) {
    $form_customer_group_data = array();
    
    $query = $this->db->query("SELECT * FROM ".DB_PREFIX.$this->_code."_form_to_customer_group WHERE form_id = '".(int)$form_id."'")->rows;
    
    if ($query) {
      foreach ($query as $result) {
        $form_customer_group_data[] = $result['customer_group_id'];
      }
    }
    
    return $form_customer_group_data;
  }
  
  public function getFormLayouts($form_id) {
    $form_layout_data = array();
    
    $query = $this->db->query("SELECT * FROM ".DB_PREFIX.$this->_code."_form_to_layout WHERE form_id = '".(int)$form_id."'")->rows;
    
    if ($query) {
      foreach ($query as $result) {
        $form_layout_data[] = $result['layout_id'];
      }
    }
    
    return $form_layout_data;
  }
  
  public function getFormMixedData($form_id, $type = 0) {
    $form_mixed_data = array();
    
    $query = $this->db->query("SELECT * FROM ".DB_PREFIX.$this->_code."_form_mixed_data WHERE form_id = '".(int)$form_id."' AND `type` = '".(int)$type."'")->rows;
    
    if ($query) {
      $form_mixed_data[] = array(
        'form_id'    => $query['form_id'],
        'type'       => $query['type'],
        'mixed_data' => unserialize($query['mixed_data'])
      );
    }
    
    return $form_mixed_data;
  }
  
  public function getFormMixedDataValue($form_id, $type = 0) {
    $query = $this->db->query("SELECT mixed_data FROM ".DB_PREFIX.$this->_code."_form_mixed_data WHERE form_id = '".(int)$form_id."' AND `type` = '".(int)$type."'");
    
    if ($query->num_rows) {
      return unserialize($query->row['mixed_data']);
    } else {
      return array();
    }
  }
  
  public function getInformation($information_id) {
    return $this->db->query("SELECT DISTINCT * FROM ".DB_PREFIX."information i LEFT JOIN ".DB_PREFIX."information_description id ON (i.information_id = id.information_id) WHERE id.language_id = '".(int)$this->config->get('config_language_id')."' AND i.information_id = '".(int)$information_id."'")->row;
  }
  
  public function getInformations($data = array()) {
    $sql = "SELECT * FROM ".DB_PREFIX."information i LEFT JOIN ".DB_PREFIX."information_description id ON (i.information_id = id.information_id) WHERE id.language_id = '".(int)$this->config->get('config_language_id')."'";
    
    if (!empty($data['filter_title'])) {
      $sql .= " AND id.title LIKE '".$this->db->escape($data['filter_title'])."%'";
    }
    
    $sort_data = array(
      'id.title',
      'i.sort_order'
    );
    
    if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
      $sql .= " ORDER BY ".$data['sort'];
    } else {
      $sql .= " ORDER BY id.title";
    }
    
    if (isset($data['order']) && ($data['order'] == 'DESC')) {
      $sql .= " DESC";
    } else {
      $sql .= " ASC";
    }
    
    if (isset($data['start']) || isset($data['limit'])) {
      if ($data['start'] < 0) {
        $data['start'] = 0;
      }
      
      if ($data['limit'] < 1) {
        $data['limit'] = 20;
      }
      
      $sql .= " LIMIT ".(int)$data['start'].",".(int)$data['limit'];
    }
    
    return $this->db->query($sql)->rows;
  }
}