<?php
class ControllerExtensionModuleCategory2 extends Controller {
	public function index($setting) {
    
		if($setting['title']) $data['heading_title'] = $setting['title'];
		else $data['heading_title'] = false;


		$this->load->model('catalog/category');
		$this->load->model('tool/image');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getTopCategories(0);
		foreach ($categories as $category) {
			$children_data = array();
            $children = $this->model_catalog_category->getTopCategories($category['category_id']);
            foreach($children as $child) {
                $children_data[] = array(
                    'category_id' => $child['category_id'],
                    'name' => $child['name'],
                    'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
                );
            }

			$data['categories'][] = array(
				'category_id' => $category['category_id'],
				'name'        => $category['name'],
				'thumb'        => $this->model_tool_image->resize(($category['image'] ? $category['image'] : 'placeholder.png'), $setting['width'], $setting['height']),
				'children'    => $children_data,
				'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
			);
		}
		return $this->load->view('extension/module/category2', $data);
	}
}