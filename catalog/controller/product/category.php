<?php

class ControllerProductCategory extends Controller
{
    public function index()
    {
         
        $this->load->language('product/category');

        $this->load->model('catalog/category');

        $this->load->model('catalog/product');

        $this->load->model('tool/image');

     
        if (isset($this->request->get['filter'])) {
            $filter = $this->request->get['filter'];
        } else {
            $filter = '';
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
        $limit = 25;
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        if (isset($this->request->get['path'])) {
            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $path = '';

            $parts = explode('_', (string)$this->request->get['path']);

            $category_id = (int)array_pop($parts);

            foreach ($parts as $path_id) {
                if (!$path) {
                    $path = (int)$path_id;
                } else {
                    $path .= '_' . (int)$path_id;
                }

                $category_info = $this->model_catalog_category->getCategory($path_id);

                if ($category_info) {
                    
                    $data['breadcrumbs'][] = array(
                        'text' => $category_info['name'],
                        'href' => $this->url->link('product/category', 'path=' . $path . $url)
                    );
                }
            }
        } else {
            $category_id = 0;
        }

        $category_info = $this->model_catalog_category->getCategory($category_id);
       
        if ($category_info) {
        
        if(isset($this->request->get['page']) && $this->request->get['page'] == 1){
              header('Location: ' . $this->url->link('product/category', 'path=' . $category_info['category_id'], true), true, 301);
              exit();
            }
      
            if(isset($this->request->get['page']) && $this->request->get['page'] < 0){
            
                   header ("HTTP/1.1 404 Not Found");
            exit();
    
          }
           $category_parent = $this->model_catalog_category->getCategory($category_info['parent_id']);
             if($category_parent){
                $name = ' '.$category_parent['name'];
            }else{
                $name = '';
            }

            #region Setting h1, title, meta-description
            $randomValue = rand(0,1);
            $randomText = ($randomValue == 1) ? ' большой выбор ' : ' широкий ассортимент ';

            $data['h1'] = $category_info['meta_h1'];
            $data['heading_title'] = $category_info['name'];
            if ($category_info['meta_title']) {
//                $this->document->setTitle($category_info['meta_title']);
                $this->document->setTitle('Запчасти '.$data['heading_title'].' – купить в Москве по выгодным ценам  в интернет магазине ST-Spares');
            } else {
//                $title = $category_info['name'].$name.' – купить в Москве по выгодным ценам  в интернет магазине ST-Spares';
                $title = 'Запчасти '.$data['heading_title'].' – купить в Москве по выгодным ценам  в интернет магазине ST-Spares';
                $this->document->setTitle($title);
            }
            if(empty($category_info['meta_description'])){
//                $description = $category_info['name'].$name.' по выгодным ценам в онлайн-каталоге производителя. Большой выбор, официальная гарантия, доставка по Москве и России.';
                $description = 'Запчасти '.$data['heading_title'].': 💰 выгодные цены,'. $randomText .'запчастей! 🚚 Доставляем по Москве и Московской области! Звоните ☎ +7 (495) 989-43-31 +7 (800) 775-70-72 +7 (985) 310-95-50';
                $this->document->setDescription($description);
            }else{
//                $this->document->setDescription($category_info['meta_description']);
                $description = 'Запчасти '.$data['heading_title'].': 💰 выгодные цены,'. $randomText .'запчастей! 🚚 Доставляем по Москве и Московской области! Звоните ☎ +7 (495) 989-43-31 +7 (800) 775-70-72 +7 (985) 310-95-50';
                $this->document->setDescription($description);
            }
            #endregion

            $this->document->setKeywords($category_info['meta_keyword']);

            $data['text_empty'] = $this->language->get('text_empty');
            $data['text_quantity'] = $this->language->get('text_quantity');
            $data['text_manufacturer'] = $this->language->get('text_manufacturer');
            $data['text_model'] = $this->language->get('text_model');
            $data['text_price'] = $this->language->get('text_price');
            $data['text_points'] = $this->language->get('text_points');
            $data['text_sort'] = $this->language->get('text_sort');
            $data['text_limit'] = $this->language->get('text_limit');

            $data['button_cart'] = $this->language->get('button_cart');
            $data['button_wishlist'] = $this->language->get('button_wishlist');
            $data['button_compare'] = $this->language->get('button_compare');
            $data['button_list'] = $this->language->get('button_list');
            $data['button_grid'] = $this->language->get('button_grid');
            $data['button_more'] = $this->language->get('button_more');
            $data['button_quickview'] = $this->language->get('button_quickview');


            // Set the last category breadcrumb
            $data['breadcrumbs'][] = array(
                'text' => $category_info['name'],
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'])
            );

            if ($category_info['image']) {
                $data['thumb'] = $this->model_tool_image->resize($category_info['image'], $this->config->get($this->config->get('config_theme') . '_image_category_width'), $this->config->get($this->config->get('config_theme') . '_image_category_height'));
                $this->document->setOgImage($data['thumb']);
            } else {
                $data['thumb'] = '';
            }

            $data['description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');
            if ($page > 1) $data['description'] = '';


            $url = '';

            if (isset($this->request->get['filter'])) {
                $url .= '&filter=' . $this->request->get['filter'];
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

            $data['categories'] = array();
            //получаем список категорий второго уровня для навигационного списка
            $data['category_id'] = $category_id;
            $data['parent_id'] = $parent_id = $category_info['parent_id'];

            if ($category_info['image2']) {
                $image2 = $this->model_tool_image->resize($category_info['image2'],765, 360);
            } else {
                $image2 = $this->model_tool_image->resize('placeholder.png', 765, 360);
            }
            $data['image'] = $image2;
            if($category_info['top']){
                $category_childs = $this->model_catalog_category->getCatalogCategoriesTops($category_id);
                if(empty($category_childs)){
                    $results = $this->model_catalog_category->getCatalogCategoriesTops($parent_id);
                    foreach ($results as $result) {
                        if ($result['image2']) {
                            $image2 = $this->model_tool_image->resize($result['image2'],765, 360);
                        } else {
                            $image2 = $this->model_tool_image->resize('placeholder.png', 765, 360);
                        }
                        $data['categories'][] = array(
                            'image'=>$image2,
                            'category_id' => $result['category_id'],
                            'name' => $result['name'],
                            'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '_' . $result['category_id'] . $url)
                        );
                    }
                    $data['categories_map'] = $data['categories'];
                }else{
                    $data['categories_map'] = array();
                    $results = $category_childs;
                    foreach ($results as $result) {
                        if ($result['image2']) {
                            $image2 = $this->model_tool_image->resize($result['image2'],765, 360);
                        } else {
                            $image2 = $this->model_tool_image->resize('placeholder.png', 765, 360);
                        }
                        $data['categories_map'][$result['category_id']] = array(
                            'image'=>$image2,
                            'category_id' => $result['category_id'],
                            'name' => $result['name'],
                            'href' => $this->url->link('product/category', 'path=' . $parent_id . '_' . $result['category_id'] . $url)
                        );
                    }
                }
            }else{
                $results = $this->model_catalog_category->getCatalogCategoriesTops($parent_id);
                foreach ($results as $result) {
                    if ($result['image2']) {
                        $image2 = $this->model_tool_image->resize($result['image2'],765, 360);
                    } else {
                        $image2 = $this->model_tool_image->resize('placeholder.png', 765, 360);
                    }
                    $data['categories'][] = array(
                        'image'=>$image2,
                        'category_id' => $result['category_id'],
                        'name' => $result['name'],
                        'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '_' . $result['category_id'] . $url)
                    );
                }
                $data['categories_map'] = $data['categories'];
            }

            $data['products'] = array();
            $filter_data = array(
                'filter_category_id' => $category_id,
                'filter_sub_category' => true,
                'filter_filter' => $filter,
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
                $price2 = $this->currency->format($result['min_price_analog'], $this->session->data['currency']);
                if ((float)$result['special']) {
                    $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                } else {
                    $special = false;
                }

                if (utf8_strlen($result['description']) > $this->config->get($this->config->get('config_theme') . '_product_description_length')) $description = utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '...';
                else $description = strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'));
                     if($result['stock_status_id'] == 7){
                        $stock = '<span class="instock">' . $result['stock_status'] . '</span>';
                    }elseif($result['stock_status_id'] == 9){
                        $stock = '<span class="instock">' . $result['stock_status'] . '</span>';
                    }else{
                        $stock = '<span class="nostock">' . $result['stock_status'] . '</span>';
                    }

                $data['products'][] = array(
                    'product_id' => $result['product_id'],
                    'thumb' => $image,
                    'min_price_analog' => $price2,
                    'name' => $result['name'],
                    'description' => $description,
                    'price' => $price,
                    'special' => $special,
                    //'stock'       => ($result['quantity'] <= 0 ? '<span class="nostock">'.$result['stock_status'].'</span>' : '<span class="instock">'.$this->language->get('text_instock').'</span>'),
                    'stock' => $stock,
                    'minimum' => ($result['minimum'] > 0) ? $result['minimum'] : 1,
                    'href' => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result['product_id'] . $url)
                );
            }
            if(empty($data['products'])){
                header ("HTTP/1.1 404 Not Found");
                exit();
            }
            $url = '';

            if (isset($this->request->get['filter'])) {
                $url .= '&filter=' . $this->request->get['filter'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $data['sorts'] = array();

            $data['sorts'][] = array(
                'text' => $this->language->get('text_default'),
                'value' => 'p.sort_order-ASC',
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.sort_order&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_price_asc'),
                'value' => 'p.price-ASC',
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_price_desc'),
                'value' => 'p.price-DESC',
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=DESC' . $url)
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_name_asc'),
                'value' => 'pd.name-ASC',
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_name_desc'),
                'value' => 'pd.name-DESC',
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=DESC' . $url)
            );

            /*
                        $url = '';

                        if (isset($this->request->get['filter'])) {
                            $url .= '&filter=' . $this->request->get['filter'];
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
                                'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=' . $value)
                            );
                        }
            */
            $url = '';

            if (isset($this->request->get['filter'])) {
                $url .= '&filter=' . $this->request->get['filter'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }
            $url2 = $url;
            if (isset($this->request->get['limit'])) {
                $url2 .= '&limit=' . ($this->request->get['limit'] + 25);
                $url .= '&limit=' . $this->request->get['limit'];
            }else{
                  $url2 .='&limit=50';
            }
            if (isset($this->request->get['page'])) {
                $url2 .='&page=' . $this->request->get['page'];
            }
   
           if($page > ceil($product_total/(50*1000))*1000){
                header ("HTTP/1.1 404 Not Found");
                exit();
            }
            $pagination = new Pagination();
            $pagination->total = $product_total;
            $pagination->page = $page;
            $pagination->limit = $limit;
            $pagination->url = $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&page={page}');

            $data['pagination'] = $pagination->render();
            $data['current_url'] = $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url2 );
          
            
            //$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

            // http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
            if ($page == 1) {
                $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'], true), 'canonical');
            } elseif ($page == 2) {
                $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'], true), 'prev');
            } else {
                $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'] . '&page=' . abs(($page - 1)), true), 'prev');
            }

            if ($limit && ceil($product_total / $limit) > $page) {
                $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'] . '&page=' . ($page + 1), true), 'next');
            }

            $data['sort'] = $sort;
            $data['order'] = $order;
            $data['limit'] = $limit;

            $data['continue'] = $this->url->link('common/home');

            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('product/category', $data));
        } else {
            $url = '';

            if (isset($this->request->get['path'])) {
                $url .= '&path=' . $this->request->get['path'];
            }

            if (isset($this->request->get['filter'])) {
                $url .= '&filter=' . $this->request->get['filter'];
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
                'text' => $this->language->get('text_error'),
                'href' => $this->url->link('product/category', $url)
            );

            $this->document->setTitle($this->language->get('text_error'));

            $data['heading_title'] = $this->language->get('text_error');

            $data['text_error'] = $this->language->get('text_error');

            $data['button_continue'] = $this->language->get('button_continue');

            $data['continue'] = $this->url->link('common/home');

            $this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('error/not_found', $data));
        }
    }
}
