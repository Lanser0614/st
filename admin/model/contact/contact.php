<?php 
Class ModelContactContact extends Model{
	public function getContactinfo($data = array()) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "contact");
		
		return $query->rows;
		
	}
	public function getSingledata($id='') {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "contact where contact_id='$id' ");
		
		return $query->rows;
		
	}
	
	public function csvdata(){
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "contact");
		return $query->rows;
	}
	
	
	public function insertvalue($view_id) {
		$this->db->query("UPDATE " . DB_PREFIX . "contact SET is_read='$view_id' where contact_id ='$view_id'");	
	}
	
	public function deletecontact($contact_id) {
		$query = $this->db->query("DELETE  FROM " . DB_PREFIX . "contact where contact_id = '".$contact_id."' ");
		
		return $query;	
	}
	
	public function getTotalContactinfo($data = array()){
		$sql = "SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "contact`";
		if (!empty($data['filter_name'])) {
			$sql .= " AND name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}
		$query = $this->db->query($sql);

		return $query->row['total'];
	}
		
}