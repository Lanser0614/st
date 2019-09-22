<?php
class ControllerExtensionModuleBlogLatest extends Controller {
	public function index($setting) {
		
		static $module = 0;
		
		$this->load->language('blog/blog');
		$this->load->model('blog/blog');
		$this->load->model('blog/blog_category');
		$this->load->model('tool/image');

		$data['heading_title'] = $setting['name'];
		
		$data['characters'] = $setting['characters'];
		$data['carousel'] = $setting['carousel'];
		$data['columns'] = $setting['columns'];
		$data['thumb'] = $setting['thumb'];
		
		if (isset($setting['this_blog_category'])&&!empty($setting['this_blog_category'])) {
			$setting_cats = $setting['this_blog_category'];
		} else {
			$setting_cats = array();
		}
		
		if ($data['carousel']) {
		  $this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
		  $this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');
		}
		

		$data['blog_show_all'] = $this->url->link('blog/home');
		
		$data['text_show_all'] = $this->language->get('text_show_all');
		$data['text_posted_on'] = $this->language->get('text_posted_on');
		$data['text_posted_by'] = $this->language->get('text_posted_by');
		$data['text_read'] = $this->language->get('text_read');
		$data['text_not_found'] = $this->language->get('text_not_found');
		$data['text_read_more'] = $this->language->get('text_read_more');
		
		$data['date_added_status'] = $this->config->get('blogsetting_date_added');
		$data['page_view_status'] = $this->config->get('blogsetting_page_view');
		
    
		
		$data['categories'] = array();
		
		foreach ($setting_cats as $category_id) {
			
			
			//
			$posts = array();
			$results = $this->model_blog_blog->getBlogsByBlogCategoryId($category_id, 0, $setting['limit']);
						
			foreach ($results as $result) {
      		
			$posts[] = array(
        		'title' => $result['title'],
				//'author' => $result['author'],
        		'date_added_full' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
        		'description' => html_entity_decode($result['description']),
        		'short_description' => html_entity_decode($result['short_description'], ENT_QUOTES, 'UTF-8'),
        		'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']),
				'href'  => $this->url->link('blog/blog', 'blog_id=' . $result['blog_id'])
				
      		);
    		}
			//
				
			$blog_category_info = $this->model_blog_blog_category->getBlogCategory($category_id);
			
			$data['categories'][] = array(
				'name' => $blog_category_info['name'],
				'category_sort_order' => $blog_category_info['sort_order'],
				'posts' => $posts,
				'href' => $this->url->link('blog/category', 'blogpath=' . $category_id)
			);
		}
		
		
		usort($data['categories'], function($a, $b){
       return ($a['category_sort_order'] - $b['category_sort_order']);
    });

		
		
		$data['module'] = $module++;

		return $this->load->view('extension/module/blog_latest', $data);

	}
}