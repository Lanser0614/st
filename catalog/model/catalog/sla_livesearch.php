<?php
class ModelCatalogSlaLiveSearch extends Model {

	public function getCategories($data=array()) {
		if (!empty($data)) {
	$sql = "		
SELECT c.category_id, c.image, cd.name, cd.description, 
GROUP_CONCAT(c2.category_id ORDER BY cp.level SEPARATOR '_') AS path 
FROM oc_category_path cp 
LEFT JOIN oc_category c ON (cp.category_id = c.category_id) 
LEFT JOIN oc_category c2 ON (cp.path_id = c2.category_id) 
LEFT JOIN oc_category_description cd ON (c.category_id = cd.category_id) 
LEFT JOIN oc_category_to_store c2s ON (c.category_id = c2s.category_id) 
WHERE cd.language_id = '" . (int)$this->config->get('config_language_id') . "' 
AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'
AND c.status = '1' "; 
if (!empty($data['filter_name'])) {
	$sql .= " AND (
		cd.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
	if (utf8_strlen($data['filter_name']) > 4 && $this->config->get('sla_live_search_description')) {
		$sql .= " OR cd.description LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
	}
		$sql .= ")";
}
$sql .= " 
GROUP BY cp.category_id 
ORDER BY LCASE(cd.name) ";
			if (!empty($data['limit'])) {
				$sql .= " LIMIT " . (int)$data['limit']; 
			}
			$query = $this->db->query($sql);
			$results =$query->rows;
		} else {
			$results =array();
		}
		return $results;
	}

	public function getTotalCategories($data) {
		if (!empty($data)) {
		
			$sql = "SELECT count(*) as total FROM " . DB_PREFIX . "category c 
			LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) 
			LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) 
			WHERE cd.language_id = '" . (int)$this->config->get('config_language_id') . "' 
			AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  
			AND c.status = '1' ";
			if (!empty($data['filter_name'])) {
				$sql .= " AND (cd.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
				if (utf8_strlen($data['filter_name']) > 4  && $this->config->get('sla_live_search_description')) {
					$sql .= " OR cd.description LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
				}
				$sql .= ")";
			}

			$query = $this->db->query($sql);
			$results =$query->row['total'];
		} else {
			$results = 0;
		}
		return $results;
	}

	public function getInformations($data=array()) {
		if (!empty($data)) {
			$sql = "SELECT i.information_id, id.title, id.description FROM " . DB_PREFIX . "information i 
			LEFT JOIN " . DB_PREFIX . "information_description id ON (i.information_id = id.information_id) 
			LEFT JOIN " . DB_PREFIX . "information_to_store i2s ON (i.information_id = i2s.information_id) 
			WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' 
			AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  
			AND i.status = '1' ";
			if (!empty($data['filter_name'])) {
				$sql .= " AND (id.title LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
				if (utf8_strlen($data['filter_name']) > 4) {
					$sql .= " OR id.description LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
				}
				$sql .= ")";
			}
			
			$sql .= " ORDER BY LCASE(id.title)";
			
			if (!empty($data['limit'])) {
				$sql .= " LIMIT " . (int)$data['limit']; 
			}
	
			$query = $this->db->query($sql);
			$results =$query->rows;
		} else {
			$results =array();
		}
		return $results;
	}

	public function getTotalInformations($data) {
		if (!empty($data)) {
		
			$sql = "SELECT count(*) as total FROM " . DB_PREFIX . "information i 
			LEFT JOIN " . DB_PREFIX . "information_description id ON (i.information_id = id.information_id) 
			LEFT JOIN " . DB_PREFIX . "information_to_store i2s ON (i.information_id = i2s.information_id) 
			WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' 
			AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  
			AND i.status = '1' ";
			if (!empty($data['filter_name'])) {
				$sql .= " AND (id.title LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
				if (utf8_strlen($data['filter_name']) > 4) {
					$sql .= " OR id.description LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
				}
				$sql .= ")";
			}

			$query = $this->db->query($sql);
			$results =$query->row['total'];
		} else {
			$results = 0;
		}
		return $results;
	}

	public function getManufacturers($data=array()) {
		$type = $this->config->get('sla_live_search_manufacturer_type');
		$sql1 = "m.name, '' as description";
		if ($type == 'description') 
			$sql1 = "m.name, md.desctiption";
		if ($type == 'description+name') 
			$sql1 = "md.name, md.desctiption";
		if (!empty($data)) {
			$sql = "SELECT m.manufacturer_id, image, " . $sql1 . " FROM " . DB_PREFIX . "manufacturer m ";
			if ($type) {
				$sql .= " LEFT JOIN " . DB_PREFIX . "manufacturer_description md ON (m.manufacturer_id = md.manufacturer_id)"; 
				
			}
			$sql .= " LEFT JOIN " . DB_PREFIX . "manufacturer_to_store m2s ON (m.manufacturer_id = m2s.manufacturer_id) 
			WHERE m2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";
			if ( ($type == 'description+name') || ($type == 'description')) {
				$sql .= " AND md.language_id = '" . (int)$this->config->get('config_language_id') . "'";
			}
			if (!empty($data['filter_name'])) {
				if ($type == 'description+name') {
					$sql .= " AND (md.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
				} else {
					$sql .= " AND (m.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
				}
				
				if (utf8_strlen($data['filter_name']) > 4) {
					if ( ($type == 'description+name') || ($type == 'description')) {
						$sql .= " OR md.description LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
					}
				}
				$sql .= ")";
			}
			if ( ($type == 'description+name') || ($type == 'description')) {
				$sql .= " ORDER BY LCASE(md.name)";
			} else {
				$sql .= " ORDER BY LCASE(m.name)";
			}
			
			if (!empty($data['limit'])) {
				$sql .= " LIMIT " . (int)$data['limit']; 
			}
	
			$query = $this->db->query($sql);
			$results =$query->rows;
		} else {
			$results =array();
		}
		return $results;
	}

	public function getTotalManufacturers($data) {
		$type = $this->config->get('sla_live_search_manufacturer_type');
		$sql1 = "m.name, '' as description";
		if ($type == 'description') 
			$sql1 = "m.name, md.desctiption";
		if ($type == 'description+name') 
			$sql1 = "md.name, md.desctiption";
		if (!empty($data)) {
			$sql = "SELECT COUNT(*) as total FROM " . DB_PREFIX . "manufacturer m ";
			if ($type) {
				$sql .= " LEFT JOIN " . DB_PREFIX . "manufacturer_description md ON (m.manufacturer_id = md.manufacturer_id)"; 
				
			}
			$sql .= " LEFT JOIN " . DB_PREFIX . "manufacturer_to_store m2s ON (m.manufacturer_id = m2s.manufacturer_id) 
			WHERE m2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";
			if ( ($type == 'description+name') || ($type == 'description')) {
				$sql .= " AND md.language_id = '" . (int)$this->config->get('config_language_id') . "'";
			}
			if (!empty($data['filter_name'])) {
				if ($type == 'description+name') {
					$sql .= " AND (md.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
				} else {
					$sql .= " AND (m.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
				}
				
				if (utf8_strlen($data['filter_name']) > 4) {
					if ( ($type == 'description+name') || ($type == 'description')) {
						$sql .= " OR md.description LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
					}
				}
				$sql .= ")";
			}
			
			$query = $this->db->query($sql);
			$results =$query->row['total'];
		} else {
			$results = 0;
		}
		return $results;
	}

	public function getProducts($data = array()) {
		$sql = "SELECT p.*, pd.name, pd.description, 
		(SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special";
		$sql .= " FROM " . DB_PREFIX . "product p";
		$sql .= " LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) 
		LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) 
		WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' 
		AND p.status = '1' 
		AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";

		if (!empty($data['filter_name']) || !empty($data['filter_tag'])) {
			$sql .= " AND (";

			if (!empty($data['filter_name'])) {
				$implode = array();

				$words = explode(' ', trim(preg_replace('/\s+/', ' ', $data['filter_name'])));

				if ($this->config->get('sla_live_search_first')) {
						$implode[] = "pd.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
				} else {
					foreach ($words as $word) {
						$implode[] = "pd.name LIKE '%" . $this->db->escape($word) . "%'";
					}
				}

				if ($implode) {
					$sql .= " " . implode(" AND ", $implode) . "";
				}

				if (!empty($data['filter_description'])) {
					$sql .= " OR pd.description LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
				}
			}

			if (!empty($data['filter_name'])) {
				if ($this->config->get('sla_live_search_sku')) {
					$sql .= " OR LCASE(p.sku) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				}
				if ($this->config->get('sla_live_search_model')) {
					$sql .= " OR LCASE(p.model) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				}
				/*
				$sql .= " OR p.product_id = '" . (int)$data['filter_name'] . "'";
				$sql .= " OR LCASE(p.upc) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				$sql .= " OR LCASE(p.ean) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				$sql .= " OR LCASE(p.jan) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				$sql .= " OR LCASE(p.isbn) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				$sql .= " OR LCASE(p.mpn) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				*/
			}

			$sql .= ")";
		}
//		$sql .= " GROUP BY p.product_id";

		$sort_data = array(
			'pd.name',
		);

		$sql .= " ORDER BY LCASE(pd.name) ASC";

		$sql .= " LIMIT " . (int)$data['limit'];

		$product_data = array();

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getTotalProducts($data = array()) {
		$sql = "SELECT COUNT(*) as total";
		$sql .= " FROM " . DB_PREFIX . "product p";
		$sql .= " LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) 
		LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) 
		WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' 
		AND p.status = '1' 
		AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";

		if (!empty($data['filter_name']) || !empty($data['filter_tag'])) {
			$sql .= " AND (";

			if (!empty($data['filter_name'])) {
				$implode = array();

				$words = explode(' ', trim(preg_replace('/\s+/', ' ', $data['filter_name'])));

				if ($this->config->get('sla_live_search_first')) {
						$implode[] = "pd.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
				} else {
					foreach ($words as $word) {
						$implode[] = "pd.name LIKE '%" . $this->db->escape($word) . "%'";
					}
				}

				if ($implode) {
					$sql .= " " . implode(" AND ", $implode) . "";
				}

				if (!empty($data['filter_description'])) {
					$sql .= " OR pd.description LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
				}
			}

			if (!empty($data['filter_name'])) {
				if ($this->config->get('sla_live_search_sku')) {
					$sql .= " OR LCASE(p.sku) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				}
				if ($this->config->get('sla_live_search_model')) {
					$sql .= " OR LCASE(p.model) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				}
				/*
				$sql .= " OR p.product_id = '" . (int)$data['filter_name'] . "'";
				$sql .= " OR LCASE(p.upc) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				$sql .= " OR LCASE(p.ean) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				$sql .= " OR LCASE(p.jan) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				$sql .= " OR LCASE(p.isbn) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				$sql .= " OR LCASE(p.mpn) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				*/
			}

			$sql .= ")";
		}

		$product_data = array();

		$query = $this->db->query($sql);

		return $query->rows;
	}
}