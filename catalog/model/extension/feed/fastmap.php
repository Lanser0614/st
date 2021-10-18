<?php
class ModelExtensionFeedFastmap extends Model {

	public function getProductsGoogle() {
		
		$product_data = $this->cache->get('product_sitemap_google');

		if (!$product_data) {
			$sql = "SELECT p.product_id, p.image, p.date_modified, pd.name  FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'"; 
			
			$product_data = array();
					
			$query = $this->db->query($sql);
		
			$product_data = $query->rows;

			$this->cache->set('product_sitemap_google', $product_data);
		}
		
		return $product_data;
	}

	public function getProductsYandex() {
		
		$product_data = $this->cache->get('product_sitemap_yandex');

		if (!$product_data) {
			$sql = "SELECT p.product_id, p.date_modified, pd.name  FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'"; 
			
			$product_data = array();
					
			$query = $this->db->query($sql);
		
			$product_data = $query->rows;

			$this->cache->set('product_sitemap_yandex', $product_data);
		}
		
		return $product_data;
	}

}
?>