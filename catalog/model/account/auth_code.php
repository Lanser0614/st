<?php
class ModelAuthCode extends Model{


    public function saveDataAuth(){
        $this->db->query("INSERT INTO " . DB_PREFIX . "auth_code SET phone='".$this->db->escape('phone')."'");
    }
  //  $this->db->query("INSERT INTO " . DB_PREFIX . "myforms SET first_value='".$this->db->escape($data_array['first_value'])."' ,second_value='".$this->db->escape($data_array['second_value'])."',third_value='".$this->db->escape($data_array['third_value'])."',forth_value='".$this->db->escape($data_array['forth_value'])."',date_added=NOW() ");
        
}
?>