<?php
class ModelExtensionModuleContact extends Model {
	
	public function get_client_ip(){
		$ipaddress = '';
		if (getenv('HTTP_CLIENT_IP'))
		$ipaddress = getenv('HTTP_CLIENT_IP');
		else if(getenv('HTTP_X_FORWARDED_FOR'))
		$ipaddress = getenv('HTTP_X_FORWARDED_FOR');
		else if(getenv('HTTP_X_FORWARDED'))
		$ipaddress = getenv('HTTP_X_FORWARDED');
		else if(getenv('HTTP_FORWARDED_FOR'))
		$ipaddress = getenv('HTTP_FORWARDED_FOR');
		else if(getenv('HTTP_FORWARDED'))
		$ipaddress = getenv('HTTP_FORWARDED');
		else if(getenv('REMOTE_ADDR'))
		$ipaddress = getenv('REMOTE_ADDR');
		else
		$ipaddress = 'UNKNOWN';
		
		return $ipaddress;
	}
	
	public function addContact($data) {
	    if(!isset($data['enquiry'])){
	        $data['enquiry'] = '';
	    }
		$ip = $this->get_client_ip();
		$this->db->query("INSERT INTO " . DB_PREFIX . "contact SET firstname = '" . $this->db->escape($data['name']) . "', brand = '" . $this->db->escape($data['brand']) . "', article = '" . $this->db->escape($data['article']) . "',vin = '" . $this->db->escape($data['vin']) . "',year_product = '" . $this->db->escape($data['year']) . "',analog = '" . (int)$data['analog'] . "',origin = '" . (int)$data['origin'] . "', product = '" . $this->db->escape($data['product']) . "', phone = '" . $this->db->escape($data['phone']) . "',date_added = NOW(), email = '".$this->db->escape($data['email'])."', enquiry = '".$this->db->escape($data['enquiry'])."', ipaddress = '$ip'");
	}
    public function validate($data){

        $attributes = $this->attributes();
        foreach($attributes as $attribute){
            if(!isset($data[$attribute]) || empty($data[$attribute])){
                return false;
            }
        }
        return true;
    }

    protected function attributes(){
        return [
            'name',
            'vin',
            'phone',
            'email',
        ];
    }
}	