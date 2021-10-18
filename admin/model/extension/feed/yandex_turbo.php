<?php
class ModelExtensionFeedYandexTurbo extends Model {
	public function install() {
		$this->db->query("
			CREATE TABLE `" . DB_PREFIX . "yandex_turbo_category_to_category` (
				`yandex_turbo_category_id` INT(11) NOT NULL,
				`category_id` INT(11) NOT NULL,
				PRIMARY KEY (`yandex_turbo_category_id`, `category_id`)
			) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
		");
	}

	public function uninstall() {
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "yandex_turbo_category_to_category`");
	}


    public function getYandexTurboCategories($data = array()) {
        $sql = "SELECT * FROM `" . DB_PREFIX . "yandex_turbo_category` WHERE name LIKE '%" . $this->db->escape($data['filter_name']) . "%' ORDER BY name ASC";

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

	public function addCategory($data) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "yandex_turbo_category_to_category WHERE category_id = '" . (int)$data['category_id'] . "'");

		$this->db->query("INSERT INTO " . DB_PREFIX . "yandex_turbo_category_to_category SET category_id = '" . (int)$data['category_id'] . "'");
	}

	public function deleteCategory($category_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "yandex_turbo_category_to_category WHERE category_id = '" . (int)$category_id . "'");
	}

    public function getBlogCategories() {
        $blog_description_data = array();
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog_category_description");
        foreach ($query->rows as $result) {
            $blog_description_data[] =[
              'category'=>  $result['name'],
              'category_id'=>$result['blog_category_id']
            ];
        }
        return $blog_description_data;
    }

    public function getCategories($data = array()) {
        //$sql = "SELECT yandex_turbo_category_id, (SELECT name FROM `" . DB_PREFIX . "yandex_turbo_category` gbc WHERE gbc.yandex_turbo_category_id = gbc2c.yandex_turbo_category_id) AS yandex_turbo_category, category_id, (SELECT name FROM `" . DB_PREFIX . "category_description` cd WHERE cd.category_id = gbc2c.category_id AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS category FROM `" . DB_PREFIX . "yandex_turbo_category_to_category` gbc2c ORDER BY yandex_turbo_category ASC";

	    $sql = "SELECT category_id, (SELECT name FROM `" . DB_PREFIX . "blog_category_description` cd WHERE cd.blog_category_id = gbc2c.category_id AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS category FROM `" . DB_PREFIX . "yandex_turbo_category_to_category` gbc2c ORDER BY yandex_turbo_category_id ASC";

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

	public function getTotalCategories() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "yandex_turbo_category_to_category`");

		return $query->row['total'];
    }
}
