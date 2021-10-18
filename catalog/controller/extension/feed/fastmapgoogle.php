<?php
class ControllerExtensionFeedFastmapGoogle extends Controller {
	public function index() {
		if ($this->config->get('fastmap_status')) {
			$map  = '<?xml version="1.0" encoding="UTF-8"?>';
			$map .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:image="http://www.google.com/schemas/sitemap-image/1.1">';

			$this->load->model('extension/feed/fastmap');
			$this->load->model('tool/image');

			$products = $this->model_extension_feed_fastmap->getProductsGoogle();

			foreach ($products as $product) {
				if ($product['image']) {
					$map .= '<url>';
					$map .= '<loc>' . $this->url->link('product/product', 'product_id=' . $product['product_id']) . '</loc>';
					$map .= '<changefreq>weekly</changefreq>';
					$map .= '<lastmod>' . date('Y-m-d\TH:i:sP', strtotime($product['date_modified'])) . '</lastmod>';
					$map .= '<priority>1.0</priority>';
					$map .= '<image:image>';
					$map .= '<image:loc>' . $this->model_tool_image->resize($product['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')) . '</image:loc>';
					$map .= '<image:caption>' . $product['name'] . '</image:caption>';
					$map .= '<image:title>' . $product['name'] . '</image:title>';
					$map .= '</image:image>';
					$map .= '</url>';
				}
			}

			$this->load->model('catalog/category');

			$map .= $this->getCategories(0);

			$this->load->model('catalog/manufacturer');

			$manufacturers = $this->model_catalog_manufacturer->getManufacturers();

			foreach ($manufacturers as $manufacturer) {
				$map .= '<url>';
				$map .= '<loc>' . $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $manufacturer['manufacturer_id']) . '</loc>';
				$map .= '<changefreq>weekly</changefreq>';
				$map .= '<priority>0.7</priority>';
				$map .= '</url>';
			}

			$this->load->model('catalog/information');

			$informations = $this->model_catalog_information->getInformations();

			foreach ($informations as $information) {
				$map .= '<url>';
				$map .= '<loc>' . $this->url->link('information/information', 'information_id=' . $information['information_id']) . '</loc>';
				$map .= '<changefreq>weekly</changefreq>';
				$map .= '<priority>0.5</priority>';
				$map .= '</url>';
			}

			$map .= '</urlset>';

			$this->response->addHeader('Content-Type: application/xml');
			$this->response->setOutput($map);
		}
	}

	protected function getCategories($parent_id, $current_path = '') {
		$map = '';

		$results = $this->model_catalog_category->getCategories($parent_id);

		foreach ($results as $result) {
			if (!$current_path) {
				$new_path = $result['category_id'];
			} else {
				$new_path = $current_path . '_' . $result['category_id'];
			}

			$map .= '<url>';
			$map .= '<loc>' . $this->url->link('product/category', 'path=' . $new_path) . '</loc>';
			$map .= '<changefreq>weekly</changefreq>';
			$map .= '<priority>0.7</priority>';
			$map .= '</url>';

			$map .= $this->getCategories($result['category_id'], $new_path);
		}

		return $map;
	}
}
