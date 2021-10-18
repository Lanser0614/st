<?php
class ModelModuleManufacturers extends Model {

	public function getManufacturersOnCategory($category_id) {
		$query = $this->db->query("SELECT m.manufacturer_id, m.name FROM " . DB_PREFIX . "product_to_category AS pc LEFT JOIN " . DB_PREFIX . "product AS p ON p.product_id = pc.product_id LEFT JOIN " . DB_PREFIX . "manufacturer AS m ON m.manufacturer_id = p.manufacturer_id WHERE pc.category_id = " . $this->db->escape($category_id) . " AND p.status = 1");
		return $query->rows;
	}
	
}
