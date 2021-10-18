<?php
class ModelCatalogUrlAlias extends Model {
	public function getUrlAlias($keyword) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($keyword) . "'");

		return $query->row;
	}
	public function setUrlAlias($model_name,$model_id,$alias){
        $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = ''.$model_name.'=" . (int)$model_id . "', keyword = '" . $this->db->escape($alias) . "'");
    }
}