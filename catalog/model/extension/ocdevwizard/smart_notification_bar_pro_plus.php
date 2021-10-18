<?php
##=====================================================================##
## @author    : OCdevWizard                                            ##
## @contact   : ocdevwizard@gmail.com                                  ##
## @support   : http://help.ocdevwizard.com                            ##
## @license   : http://license.ocdevwizard.com/Licensing_Policy.pdf    ##
## @copyright : (c) OCdevWizard. Smart Notification Bar Pro Plus, 2017 ##
##=====================================================================##
class ModelExtensionOcdevwizardSmartNotificationBarProPlus extends Model {
  private $_name = 'smart_notification_bar_pro_plus';
  private $_code = 'smnbpp';
  private $_version = '1.0.1';
  
  public function getForms($data = array()) {
    if ($data) {
      $customer_group_id = $this->customer->isLogged() ? (int)$this->customer->getGroupId() : (int)$this->config->get('config_customer_group_id');
      
      if (isset($data['layout_id'])) {
        return $this->db->query("
          SELECT
            DISTINCT f.*,
            fd.module_content
          FROM ".DB_PREFIX.$this->_code."_form f
          LEFT JOIN ".DB_PREFIX.$this->_code."_form_description fd ON (f.form_id = fd.form_id)
          LEFT JOIN ".DB_PREFIX.$this->_code."_form_to_store f2s ON (f.form_id = f2s.form_id)
          LEFT JOIN ".DB_PREFIX.$this->_code."_form_to_customer_group f2c ON (f.form_id = f2c.form_id)
          LEFT JOIN ".DB_PREFIX.$this->_code."_form_to_layout f2l ON (f.form_id = f2l.form_id)
          WHERE
            fd.language_id = '".(int)$this->config->get('config_language_id')."'
          AND
            f2s.store_id = '".(int)$this->config->get('config_store_id')."'
          AND
            f2c.customer_group_id = '".(int)$customer_group_id."'
          AND
            f2l.layout_id = '".(int)$data['layout_id']."'
          AND
            f.status = '1'
          ORDER BY
            f.sort_order DESC,
            LCASE(f.heading) ASC
        ")->rows;
      }
    }
  }
  
  public function getFormMixedData($form_id, $type = 0) {
    $query = $this->db->query("SELECT mixed_data FROM ".DB_PREFIX.$this->_code."_form_mixed_data WHERE form_id = '".(int)$form_id."' AND `type` = '".(int)$type."'")->row['mixed_data'];
    
    return unserialize($query);
  }
  
  public function getCoupon($coupon_id) {
    return $this->db->query("SELECT DISTINCT * FROM ".DB_PREFIX."coupon WHERE coupon_id = '".(int)$coupon_id."'")->row;
  }
  
  public function getLanguageByCode($code) {
    return $this->db->query("SELECT language_id FROM ".DB_PREFIX."language WHERE code = '".(string)$code."'")->row['language_id'];
  }
}
?>