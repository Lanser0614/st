<?php
include(DIR_COMPONENTS . 'AutoPiterComponent.php');

class ControllerProductSearch extends Controller
{
    public function index()
    {

        $this->load->language('product/search');

        $this->load->model('catalog/category');

        $this->load->model('catalog/product');

        $this->load->model('tool/image');

        if (isset($this->request->get['search'])) {
            $search = $this->request->get['search'];
        } else {
            $search = '';
        }


        if (isset($this->request->get['tag'])) {
            $tag = $this->request->get['tag'];
        } elseif (isset($this->request->get['search'])) {
            $tag = $this->request->get['search'];
        } else {
            $tag = '';
        }

        if (isset($this->request->get['description'])) {
            $description = $this->request->get['description'];
        } else {
            $description = '';
        }
        if (isset($this->request->get['path'])) {
            $category_id = $this->request->get['path'];
        } else {
            $category_id = 0;
        }

        if (isset($this->request->get['sub_category'])) {
            $sub_category = $this->request->get['sub_category'];
        } else {
            $sub_category = '';
        }

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'p.sort_order';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        if (isset($this->request->get['limit'])) {
            $limit = (int)$this->request->get['limit'];
        } else {
            $limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
        }

        if (isset($this->request->get['search'])) {
            $this->document->setTitle($this->language->get('heading_title') . ' - ' . $this->request->get['search']);
        } elseif (isset($this->request->get['tag'])) {
            $this->document->setTitle($this->language->get('heading_title') . ' - ' . $this->language->get('heading_tag') . $this->request->get['tag']);
        } else {
            $this->document->setTitle($this->language->get('heading_title'));
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $url = '';

        if (isset($this->request->get['search'])) {
            $url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));

        }

        if (isset($this->request->get['tag'])) {
            $url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['description'])) {
            $url .= '&description=' . $this->request->get['description'];
        }

        if (isset($this->request->get['path'])) {
            $url .= '&category_id=' . $this->request->get['path'];
        }

        if (isset($this->request->get['sub_category'])) {
            $url .= '&sub_category=' . $this->request->get['sub_category'];
        }

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        if (isset($this->request->get['limit'])) {
            $url .= '&limit=' . $this->request->get['limit'];
        }

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('product/search', $url)
        );

        if (isset($this->request->get['search'])) {
            $data['heading_title'] = $this->language->get('heading_title') . ' - ' . $this->request->get['search'];
        } else {
            $data['heading_title'] = $this->language->get('heading_title');
        }

        $data['text_empty'] = $this->language->get('text_empty');
        $data['text_search'] = $this->language->get('text_search');
        $data['text_keyword'] = $this->language->get('text_keyword');
        $data['text_category'] = $this->language->get('text_category');
        $data['text_sub_category'] = $this->language->get('text_sub_category');
        $data['text_quantity'] = $this->language->get('text_quantity');
        $data['text_manufacturer'] = $this->language->get('text_manufacturer');
        $data['text_model'] = $this->language->get('text_model');
        $data['text_price'] = $this->language->get('text_price');
        $data['text_points'] = $this->language->get('text_points');
        $data['text_sort'] = $this->language->get('text_sort');
        $data['text_limit'] = $this->language->get('text_limit');

        $data['entry_search'] = $this->language->get('entry_search');
        $data['entry_description'] = $this->language->get('entry_description');

        $data['button_search'] = $this->language->get('button_search');
        $data['button_cart'] = $this->language->get('button_cart');
        $data['button_wishlist'] = $this->language->get('button_wishlist');
        $data['button_compare'] = $this->language->get('button_compare');
        $data['button_list'] = $this->language->get('button_list');
        $data['button_grid'] = $this->language->get('button_grid');
        $data['button_more'] = $this->language->get('button_more');
        $data['button_quickview'] = $this->language->get('button_quickview');

        $this->load->model('catalog/category');

        // 3 Level Category Search
        $data['categories'] = array();

        $categories_1 = $this->model_catalog_category->getCategories(0);

        foreach ($categories_1 as $category_1) {
//			$level_2_data = array();
//
//			$categories_2 = $this->model_catalog_category->getCategories($category_1['category_id']);
//
//			foreach ($categories_2 as $category_2) {
//				$level_3_data = array();
//
//				$categories_3 = $this->model_catalog_category->getCategories($category_2['category_id']);
//
//				foreach ($categories_3 as $category_3) {
//					$level_3_data[] = array(
//						'category_id' => $category_3['category_id'],
//						'name'        => $category_3['name'],
//					);
//				}
//
//				$level_2_data[] = array(
//					'category_id' => $category_2['category_id'],
//					'name'        => $category_2['name'],
//					'children'    => $level_3_data
//				);
//			}

            $data['categories'][] = array(
                'category_id' => $category_1['category_id'],
                'name' => $category_1['name'],
//				'children'    => $level_2_data
            );
        }

        $data['products'] = array();


        if (isset($this->request->get['search']) || isset($this->request->get['tag']) || isset($this->request->get['path'])) {
            $filter_data = array(
                'filter_name' => $search,
                'filter_tag' => $tag,
                'filter_description' => $description,
                'filter_category_id' => $category_id,
                'filter_sub_category' => true,
                'sort' => $sort,
                'order' => $order,
                'start' => ($page - 1) * $limit,
                'limit' => $limit
            );


            $product_total = $this->model_catalog_product->getTotalProducts($filter_data);

            $results = $this->model_catalog_product->getProducts($filter_data);

            foreach ($results as $result) {
                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                }

                if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                    $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                } else {
                    $price = false;
                }

                if ((float)$result['special']) {
                    $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                } else {
                    $special = false;
                }

                if (utf8_strlen($result['description']) > $this->config->get($this->config->get('config_theme') . '_product_description_length')) $description = utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '...';
                else $description = strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'));

                $data['products'][] = array(
                    'product_id' => $result['product_id'],
                    'thumb' => $image,
                    'name' => $result['name'],
                    'description' => $description,
                    'price' => $price,
                    'special' => $special,
                    //'stock'       => ($result['quantity'] <= 0 ? '<span class="nostock">'.$result['stock_status'].'</span>' : '<span class="instock">'.$this->language->get('text_instock').'</span>'),
                    'stock' => '<span class="' . ($result['stock_status_id'] == 7 ? 'instock' : 'nostock') . '">' . $result['stock_status'] . '</span>',
                    'minimum' => ($result['minimum'] > 0) ? $result['minimum'] : 1,
                    'href' => $this->url->link('product/product', 'product_id=' . $result['product_id'] . $url)
                );
            }

            $url = '';

            if (isset($this->request->get['search'])) {
                $url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['tag'])) {
                $url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['description'])) {
                $url .= '&description=' . $this->request->get['description'];
            }

            if (isset($this->request->get['path'])) {
                $url .= '&category_id=' . $this->request->get['path'];
            }

            if (isset($this->request->get['sub_category'])) {
                $url .= '&sub_category=' . $this->request->get['sub_category'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $data['sorts'] = array();

            $data['sorts'][] = array(
                'text' => $this->language->get('text_default'),
                'value' => 'p.sort_order-ASC',
                'href' => $this->url->link('product/search', 'sort=p.sort_order&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_price_asc'),
                'value' => 'p.price-ASC',
                'href' => $this->url->link('product/search', 'sort=p.price&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_price_desc'),
                'value' => 'p.price-DESC',
                'href' => $this->url->link('product/search', 'sort=p.price&order=DESC' . $url)
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_name_asc'),
                'value' => 'pd.name-ASC',
                'href' => $this->url->link('product/search', 'sort=pd.name&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_name_desc'),
                'value' => 'pd.name-DESC',
                'href' => $this->url->link('product/search', 'sort=pd.name&order=DESC' . $url)
            );


            /*
                        $url = '';

                        if (isset($this->request->get['search'])) {
                            $url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
                        }

                        if (isset($this->request->get['tag'])) {
                            $url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
                        }

                        if (isset($this->request->get['description'])) {
                            $url .= '&description=' . $this->request->get['description'];
                        }

                        if (isset($this->request->get['category_id'])) {
                            $url .= '&category_id=' . $this->request->get['category_id'];
                        }

                        if (isset($this->request->get['sub_category'])) {
                            $url .= '&sub_category=' . $this->request->get['sub_category'];
                        }

                        if (isset($this->request->get['sort'])) {
                            $url .= '&sort=' . $this->request->get['sort'];
                        }

                        if (isset($this->request->get['order'])) {
                            $url .= '&order=' . $this->request->get['order'];
                        }

                        $data['limits'] = array();

                        $limits = array_unique(array($this->config->get($this->config->get('config_theme') . '_product_limit'), 12, 24, 36, 72));

                        sort($limits);

                        foreach($limits as $value) {
                            $data['limits'][] = array(
                                'text'  => $value,
                                'value' => $value,
                                'href'  => $this->url->link('product/search', $url . '&limit=' . $value)
                            );
                        }
            */
            $url = '';

            if (isset($this->request->get['search'])) {
                $url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['tag'])) {
                $url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['description'])) {
                $url .= '&description=' . $this->request->get['description'];
            }

            if (isset($this->request->get['path'])) {
                $url .= '&category_id=' . $this->request->get['path'];
            }

            if (isset($this->request->get['sub_category'])) {
                $url .= '&sub_category=' . $this->request->get['sub_category'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $pagination = new Pagination();
            $pagination->total = $product_total;
            $pagination->page = $page;
            $pagination->limit = $limit;
            $pagination->url = $this->url->link('product/search', $url . '&page={page}');

            $data['pagination'] = $pagination->render();

            //$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

            // http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
            if ($page == 1) {
                $this->document->addLink($this->url->link('product/search', '', true), 'canonical');
            } elseif ($page == 2) {
                $this->document->addLink($this->url->link('product/search', '', true), 'prev');
            } else {
                $this->document->addLink($this->url->link('product/search', $url . '&page=' . ($page - 1), true), 'prev');
            }

            if ($limit && ceil($product_total / $limit) > $page) {
                $this->document->addLink($this->url->link('product/search', $url . '&page=' . ($page + 1), true), 'next');
            }

            if (isset($this->request->get['search']) && $this->config->get('config_customer_search')) {
                $this->load->model('account/search');

                if ($this->customer->isLogged()) {
                    $customer_id = $this->customer->getId();
                } else {
                    $customer_id = 0;
                }

                if (isset($this->request->server['REMOTE_ADDR'])) {
                    $ip = $this->request->server['REMOTE_ADDR'];
                } else {
                    $ip = '';
                }

                $search_data = array(
                    'keyword' => $search,
                    'category_id' => $category_id,
                    'sub_category' => $sub_category,
                    'description' => $description,
                    'products' => $product_total,
                    'customer_id' => $customer_id,
                    'ip' => $ip
                );

                $this->model_account_search->addSearch($search_data);
            }
        }
        if (!isset($data['products']) || empty($data['products'])) {
//            if ($this->cache->get('autopiter.' . $this->request->get['search'])) { //проверяем, если ли закешированные данные
//                $data['articles'] = $this->cache->get('autopiter.' . $this->request->get['search']); //забираем в массив уже готовые данные и не делаем запросов
//                $data['brands_analog'] = $this->cache->get('autopiter.123.' . $this->request->get['search']); //забираем в массив уже готовые данные и не делаем запросов
//            } else {
            $autopiter = new AutoPiterComponent($this->request->get['search']);
            $autopiter->setUrl($this->request->get);
            $cache = new Cache('file', 259200);
            $data['articles'] = $autopiter->getItems();
            $brands_price = $autopiter->searchPrice();
            $data['brands_analog'] = $brands_price;
            $cache->set('autopiter.' . $this->request->get['search'], $data['articles']);
            $cache->set('autopiter.123.' . $this->request->get['search'], $data['brands_analog']);
//            }
        }
        $data['search'] = $search;
        $data['description'] = $description;
        $data['category_id'] = $category_id;
        $data['sub_category'] = $sub_category;

        $data['sort'] = $sort;
        $data['order'] = $order;
        $data['limit'] = $limit;

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view('product/search', $data));
    }
}
