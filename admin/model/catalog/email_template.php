<?php
class ModelCatalogEmailTemplate extends Model {
	public function addEmailTemplate($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "email_template SET sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "'");

		$email_template_id = $this->db->getLastId();

		foreach ($data['email_template_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "email_template_description SET email_template_id = '" . (int)$email_template_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', subject = '" . $this->db->escape($value['subject']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}

		return $email_template_id;
	}

	public function editEmailTemplate($email_template_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "email_template SET sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "' WHERE email_template_id = '" . (int)$email_template_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "email_template_description WHERE email_template_id = '" . (int)$email_template_id . "'");

		foreach ($data['email_template_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "email_template_description SET email_template_id = '" . (int)$email_template_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', subject = '" . $this->db->escape($value['subject']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
	}

	public function deleteEmailTemplate($email_template_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "email_template WHERE email_template_id = '" . (int)$email_template_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "email_template_description WHERE email_template_id = '" . (int)$email_template_id . "'");
	}

	public function getEmailTemplate($email_template_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "email_template WHERE email_template_id = '" . (int)$email_template_id . "'");

		return $query->row;
	}
	
	public function getEmailTemplateData($email_template_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "email_template et LEFT JOIN " . DB_PREFIX . "email_template_description etd ON (et.email_template_id = etd.email_template_id) WHERE et.email_template_id = '" . (int)$email_template_id . "' AND etd.language_id = '". (int)$this->config->get('config_language_id') ."'");

		return $query->row;
	}

	public function getEmailTemplates($data = array()) {

		$sql = "SELECT * FROM " . DB_PREFIX . "email_template i LEFT JOIN " . DB_PREFIX . "email_template_description id ON (i.email_template_id = id.email_template_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'";
		
		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND i.status = '" . (int)$data['filter_status'] . "'";
		}

		$sort_data = array(
			'id.title',
			'i.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
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

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getEmailTemplateDescriptions($email_template_id) {
		$email_template_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "email_template_description WHERE email_template_id = '" . (int)$email_template_id . "'");

		foreach ($query->rows as $result) {
			$email_template_description_data[$result['language_id']] = array(
				'title'            => $result['title'],
				'subject'     		 => $result['subject'],
				'description'      => $result['description'],
			);
		}

		return $email_template_description_data;
	}

	public function getTotalEmailTemplates() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "email_template");

		return $query->row['total'];
	}
}