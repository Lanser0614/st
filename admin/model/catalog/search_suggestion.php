<?php

class ModelCatalogSearchSuggestion extends Model {
	
	public function install () {
		
		$this->load->model('design/layout');

        $results = $this->model_design_layout->getLayouts();
		
		foreach ($results as $result) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "layout_module SET layout_id = '" . (int)$result['layout_id'] . "', code = 'search_suggestion', position = 'content_top', sort_order = '0'");
		}
	}

	/**
	 * @return array
	 */
	public function getDefaultOptions() {
		return array(
			'key' => '',
			'search_order' => 'name',
			'search_order_dir' => 'asc',
			'search_logic' => 'and',
			'search_limit' => 7,
			'search_cache' => 1,
			'search_css' => 
'.ui-autocomplete .ui-menu-item, 
.ui-autocomplete .ui-menu-item div,
.ui-autocomplete .ui-menu-item span {
  margin: 0;	
  padding: 0;
  border: 0;
  text-align:left;
  overflow: hidden;
}
.ui-autocomplete .ui-menu-item span {
  margin-right: 5px;	
}
.ui-autocomplete .ui-menu-item .label {
  font-weight: bold;	
  color: black;
}
.ui-autocomplete  .image img {
  border: 1px solid #E7E7E7;
}
.ui-autocomplete  .price-old {
  margin-right: 2px;
  color: #F00;
  text-decoration: line-through;
}
.ui-autocomplete  .price-new {
  font-weight: bold;
}
.ui-autocomplete {
  z-index: 99 !important;
}',
			'search_where' => array(
				'name' => 1,
				'tags' => 1,
				'description' => 1
			),
			'search_field' => array(
				'image' => array(
					'sort' => 0,
					'show' => 1,
					'width' => 40,
					'height' => 40,
					'location' => 'inline',
					'css' => 
'float: left;
margin: 0 5px 0 0;'
				),
				'name' => array(
					'sort' => 1,
					'show' => 1,
					'location' => 'newline',
					'css' => 
'color: #38B0E3;
font-weight: bold;
text-decoration: none;
height: 20px;'
				),
				'price' => array(
					'sort' => 2,
					'show' => 1,
					'show_field_name' => 1,
					'location' => 'newline'
				),
				'manufacturer' => array(
					'sort' => 3,
					'show_field_name' => 1,
					'location' => 'inline'
				),
				'model' => array(
					'sort' => 4,
					'show_field_name' => 1,
					'location' => 'inline'
				),
				'sku' => array(
					'sort' => 5,
					'show_field_name' => 1,
					'location' => 'inline'
				),				
				'upc' => array(
					'sort' => 6,
					'show_field_name' => 1,
					'location' => 'inline'
				),				
				'ean' => array(
					'sort' => 7,
					'show_field_name' => 1,
					'location' => 'inline'
				),				
				'jan' => array(
					'sort' => 8,
					'show_field_name' => 1,
					'location' => 'inline'
				),				
				'isbn' => array(
					'sort' => 9,
					'show_field_name' => 1,
					'location' => 'inline'
				),				
				'mpn' => array(
					'sort' => 10,
					'show_field_name' => 1,
					'location' => 'inline'
				),				
				'quantity' => array(
					'sort' => 11,
					'show_field_name' => 1,
					'location' => 'inline'
				),				
				'description' => array(
					'sort' => 12,
					'cut' => 50,
					'location' => 'newline',
				),
				'attributes' => array(
					'sort' => 13,
					'cut' => 50,
					'separator' => ' / ',
					'show_field_name' => 1,
					'location' => 'newline',
				),
				'rating' => array(
					'sort' => 14,
					'show_field_name' => 1,
					'location' => 'newline',
				)
			)
		);
	}
}