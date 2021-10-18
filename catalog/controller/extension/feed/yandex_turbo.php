<?php
class ControllerExtensionFeedYandexTurbo extends Controller {
	public function index() {
		if ($this->config->get('yandex_turbo_status')) {
			$output  = '<?xml version="1.0" encoding="UTF-8" ?>';
			$output .= '<rss xmlns:yandex="http://news.yandex.ru" xmlns:media="http://search.yahoo.com/mrss/" xmlns:turbo="http://turbo.yandex.ru" version="2.0">';
			$output .= '  <channel>';
			$output .= '  <title>' . $this->config->get('config_name') . '</title>';
			$output .= '  <turbo:content>' . $this->config->get('config_meta_description') . '</turbo:content>';			
			$output .= '  <link>' . $this->config->get('config_url') . '</link>';

			$this->load->model('extension/feed/yandex_turbo');
			$this->load->model('blog/blog_category');
			$this->load->model('blog/blog');

			$this->load->model('tool/image');

			$blog_data = array();

			$yandex_turbo_categories = $this->model_extension_feed_yandex_turbo->getCategories();
			foreach ($yandex_turbo_categories as $yandex_turbo_category) {
				$products = $this->model_blog_blog->getBlogsByBlogCategoryId($yandex_turbo_category['category_id']);
				foreach ($products as $product) {
                    if (!in_array($product['blog_id'], $blog_data) && $product['description']) {

                        array_push($blog_data, $product['blog_id']);

						$output .= '<item turbo="true">';
						$output .= '<title><![CDATA[' . $product['title'] . ']]></title>';
						$output .= '<link>' . $this->url->link('blog/blog', 'blog_id=' . $product['blog_id']) . '</link>';
						$output .= '<pubDate>' . $product['date_added'] . '</pubDate>';
						$output .= '<turbo:content><![CDATA[<header><h1>' . $product['title'] . '</h1><figure><img src="' . $this->model_tool_image->resize($product['image'], 600, 600) . '"/></figure></header>' . strip_tags(html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8')) . ']]>';
						$output .= '</turbo:content>';

					
						$categories = $this->model_blog_blog_category->getBlogCategoriesByBlogId($product['blog_id']);

						foreach (explode('_', $categories) as $path) {
							if ($path) {
								$string = '';
								foreach (explode('_', $path) as $path_id) {

									$category_info = $this->model_blog_blog_category->getBlogCategoryLayoutId($path_id);

									if ($category_info) {
										if (!$string) {
											$string = $category_info['name'];
										} else {
											$string .= ' &gt; ' . $category_info['name'];
										}
									}
								}								
							}
						}
						
						$output .= '</item>';
					}
				}
			}

			$output .= '  </channel>';
			$output .= '</rss>';

			$this->response->addHeader('Content-type: text/html; charset=utf-8');
			$this->response->setOutput($output);
		}
	}

	protected function getPath($parent_id, $current_path = '') {
		$category_info = $this->model_catalog_category->getCategory($parent_id);

		if ($category_info) {
			if (!$current_path) {
				$new_path = $category_info['category_id'];
			} else {
				$new_path = $category_info['category_id'] . '_' . $current_path;
			}

			$path = $this->getPath($category_info['parent_id'], $new_path);

			if ($path) {
				return $path;
			} else {
				return $new_path;
			}
		}
	}
}
