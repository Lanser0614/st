<?php
/**
 * Created by PhpStorm.
 * User: User
 * Date: 05.10.2019
 * Time: 20:31
 */
require_once 'functions.php';

class AutoPiterComponent
{
    /**
     * @var $client SoapClient
     */
    protected $client;

    public $article_id;
    public $brands_price;
    protected $class_price = 'sort-by';

    protected $class_delivery = 'sort-by';

    protected $_url;

    protected $results;

    protected $my_price;
    public $manufacturer;
    public $manufacturer_id = '';
    public $counts;

    public function __construct($article_id)
    {
        $this->article_id = $article_id;
        $this->client = new SoapClient('http://service.autopiter.ru/v2/price?WSDL', array('soap_version' => SOAP_1_2, 'encoding' => 'UTF-8'));
        if (!($this->client->IsAuthorization()->IsAuthorizationResult)) {
            //http://service.autopiter.ru/price.asmx?op=Authorization
            //UserID - ваш клиентский id, Password - ваш пароль
            $this->client->Authorization(array("UserID" => AUTOPITER_LOGIN, "Password" => AUTOPITER_PASSWORD, "Save" => "true"));
        }
       // var_dump($this->client);
    }

    public function findCatalog()
    {
        // Получаем каталоги из сервиса
        // http://service.autopiter.ru/price.asmx?op=FindCatalog
        $result = $this->client->FindCatalog(array("Number" => $this->article_id));
        if (count((array)$result->FindCatalogResult) < 1) {
            return [];
        }
        $items = $result->FindCatalogResult->SearchCatalogModel;
        if (count((array)$items) < 1) {
            return [];
        }
        if (count((array)$items) == 1 || isset($items->ArticleId)) {
            $this->one($items);
        } else {
            $this->many($items);
        }
        return $this->results;
      // return json_encode($this->results);
     // var_dump($this->results);
    }

    public function many($items)
    {
        foreach ($items as $brand_number => $item) {
            $this->one($item);
        }
    }

    public function groups($results)
    {
        try {
            $results_vars = (array)$results;
            if (!isset($results_vars[1])) {
                $this->results[$results->CatalogName][] = $results;
            } else {
                foreach ($results as $key => $item) {
                    $this->results[$item->CatalogName][] = $item;
                    
                }
            }
        } catch (Exception $message) {
            self::dd($results);
        }
    }

    public function one($item)
    {
        $result2 = $this->client->GetPriceId(array("ArticleId" => $item->ArticleId, "Currency" => 'РУБ', "SearchCross" => 2, "DetailUid" => null));
        $count_result2 = count((array)$result2);
        if ($count_result2 > 0) {
            $count_Response = $result2->GetPriceIdResult->PriceSearchModel;
            $this->groups($count_Response);
        }
    }
    
    public function getItems()
    {
       
        $this->results = $this->findCatalog();
        if (empty($this->results)) {
            return '';
        }elseif(!empty($this->results)){
         

       return $this->results;
       
        }
        //var_dump($this->results);
      // return $this->results;
       // return json_encode($this->results, JSON_UNESCAPED_UNICODE);
    //    $this->response->addHeader('Content-Type: application/json');
    //    $this->response->setOutput(json_encode($this->results, JSON_UNESCAPED_UNICODE));
        // $this->sort();
        // return $this->getHtml();
    }

    protected function thead()
    {
                    //       <th>Номер</th>

        return '
            <thead>
                <tr>
                    <th>Производитель</th>
                    <th style="text-align: left">Наименование запчасти</th>
                    <th>Наличие</th>
                    <th><a class="' . $this->class_price . ' price-sort">Цена</th>
                    <th class="td-condensed"><a class="' . $this->class_delivery . ' delivery-sort">Срок поставки</th>
                    <th>Заказ</th>
                </tr>
            </thead>
        ';
       
    }

    public function sort()
    {
        if ($this->validateSort()) {
            $sort = $this->getSort();
            $array = (array)$this->results;
            foreach ($array as $brand_name => $result) {
                $this->results[$brand_name] = $this->{$sort['method']}($result, $sort['attribute']);
            }
        } else {
            $array = (array)$this->results;
            foreach ($array as $brand_name => $result) {
                $this->results[$brand_name] = $this->asc($result, 'SalePrice');
            }
        }
        return true;
    }

    public function _usort_object_by_time_ms($a, $b)
    {
        // поля по которым сортировать
        $array = array('laps' => 'asc', 'time_ms' => 'asc');
        $res = 0;
        foreach ($array as $k => $v) {
            if ($a->$k == $b->$k) continue;

            $res = ($a->$k < $b->$k) ? -1 : 1;
            if ($v == 'desc') $res = -$res;
            break;
        }

        return $res;
    }

    public function getSort()
    {
        $sort = $this->getUrl()['sort'];
        if ($sort == 'price') {
            $this->class_price = 'sort-asc';
            return [
                'method' => 'asc',
                'attribute' => 'SalePrice'
            ];
        } elseif ($sort == '-price') {
            $this->class_price = 'sort-desc';
            return [
                'method' => 'desc',
                'attribute' => 'SalePrice'
            ];
        } elseif ($sort == 'delivery') {
            $this->class_delivery = 'sort-asc';
            return [
                'method' => 'asc',
                'attribute' => 'NumberOfDaysSupply',
            ];
        } else {
            $this->class_delivery = 'sort-desc';
            return [
                'method' => 'desc',
                'attribute' => 'NumberOfDaysSupply',
            ];
        }
    }

    public function asc($array, $attribute_name)
    {

        usort($array, function ($a, $b) use ($attribute_name) {
            $t1 = $a->{$attribute_name};
            $t2 = $b->{$attribute_name};
            return $t1 - $t2;
        });
        return $array;
    }

    public function desc($array, $attribute_name)
    {
        usort($array, function ($a, $b) use ($attribute_name) {
            $t1 = $a->{$attribute_name};
            $t2 = $b->{$attribute_name};
            if ($t2 > $t1) {
                return 1;
            } else {
                return -1;
            }
        });
        return $array;
    }

    public function compare($array, $attribute_name, $attribute_two_name)
    {
        usort($array, function ($a, $b) use ($attribute_name, $attribute_two_name) {
            $t1 = $a->{$attribute_name};
            $t2 = $b->{$attribute_name};
            $t3 = $a->{$attribute_two_name};
            $t4 = $b->{$attribute_two_name};
            if ($t2 == $t1) {
                if ($t3 == $t4) return 0;
                return ($t4 > $t3) ? -1 : 1;
            }
            return 0;
        });
        return $array;
    }

    public function validateSort()
    {
        $url = $this->getUrl();
        if (isset($url['sort']) && !empty($url['sort'])) {
            return true;
        }
        return false;
    }

    /**
     * @param mixed $url
     * @return AutoPiterComponent
     */
    public function setUrl($url)
    {
        $this->_url = $url;
        return $this;
    }

    /**
     * @return mixed
     */
    public function getUrl()
    {
        return $this->_url;
    }

    protected function getHtml()
    {
        return '<table class="table table-bordered table-hover" style="width: auto;">
                    ' . $this->thead() . '
                    <tbody>
                    ' . $this->tbody() . '
                    </tbody>
                  </table>';
    }


    public static function dd($object)
    {
        echo '<pre>';
        print_r($object);
        die();
    }

    protected function tbody()
    {
        $html = '';
        foreach ($this->results as $brand_name => $brands) {
            $brand_counts = count($brands);
            $html .= $this->brandsViewOpen($brand_name, $brand_counts);
            foreach ($brands as $index => $item) {
                $html .= $this->detailsTblRowCreate($item, $index);
            }
            $html .= $this->all_counts($brand_name, $brand_counts);
        }
        return $html;
    }

    protected function detailsTblRowCreate($item, $index)
    {
        
       // $catalogName = str_replace(" ", '-', $item->CatalogName);
        // if ($index > 2) {
        //     $class = "hidden toggleclass child childs-parent-" . $catalogName;
        // } else {
        //     $class = "child childs-parent-" . $catalogName;
        // }
       return $price = $this->getPrice($item->SalePrice);
        // $html = '';
        // $html .= "<tr id='" . $price . "' data-article='" . $this->article_id . "' class='" . $class . "' data-id='" . $item->DetailUid . "' data-price='" . $price . "'  data-days='" . $item->NumberOfDaysSupply . "'  data-brand='" . $item->CatalogName . "' data-name='" . $item->Name . "'>";
    //     $html .= "<td>" . $item->CatalogName . "</td>";
    //   // $html.="<td>" . $item->ShotNumber . "</td>";
    //     $html .= "<td>" . $item->Name . "</td>";
    //     $html .= "<td class='ofAval'>" . (($item->NumberOfAvailable) ? $item->NumberOfAvailable : '<span class="glyphicon glyphicon-ok"></span>') . "</td>";
    //     $html .= "<td>" . $price . " ₽</td>";
    //     $html .= "<td>" . $item->NumberOfDaysSupply . " дн.</td>";
    //     $html .= "<td class='td-order nowrap'>";
    //     $html .= "<form method='POST' class='analog-form' action=''>";
    //     $html .= "<input type='text' class='form-control col-xs-2' value='" . (($item->MinNumberOfSales) ? $item->MinNumberOfSales : '1') . "' name='quantity' />";
    //     $html .= "<a class='analog-icon button-cart-analog'></a>";
    //     $html .= "</form>";
    //     $html .= "</td>";
    //     $html .= "</tr>";
    //     return $html;
    }

    public function getPrice($price)
    {
        if ($this->manufacturer_id == 9) {
            return $this->manufacturerFusoPrice($price);
        } else {
            return $this->manufacturerPrice($price);
        }

    }

    public function manufacturerFusoPrice($price)
    {
        if ($price > 0 && $price < 500) {
            return round(($price * 35 / 100 + $price), 0);
        } elseif ($price > 501 && $price < 1000) {
            return round(($price * 30 / 100 + $price), 0);
        } elseif ($price > 1001 && $price < 3000) {
            return round(($price * 20 / 100 + $price), 0);
        } elseif ($price > 3001 && $price < 10000) {
            return round(($price * 15 / 100 + $price), 0);
        } elseif ($price > 10001 && $price < 30000) {
            return round(($price * 10 / 100 + $price), 0);
        } else {
            return round(($price * 7 / 100 + $price), 0);
        }
    }

    public function manufacturerPrice($price)
    {
        if ($price > 0 && $price < 500) {
            return round(($price * 50 / 100 + $price), 0);
        } elseif ($price > 501 && $price < 1000) {
            return round(($price * 40 / 100 + $price), 0);
        } elseif ($price > 1001 && $price < 3000) {
            return round(($price * 35 / 100 + $price), 0);
        } elseif ($price > 3001 && $price < 10000) {
            return round(($price * 30 / 100 + $price), 0);
        } elseif ($price > 10001 && $price < 30000) {
            return round(($price * 25 / 100 + $price), 0);
        } else {
            return round(($price * 20 / 100 + $price), 0);
        }
    }

    protected function brandsViewOpen($item, $count)
    {
        $catalogname = str_replace(' ', '-', $item);
        $html = '';
        $html .= "<tr class='parent parent-{$catalogname}'>";
        $html .= "<td>" . $item . "</td>";
        $html .= "<td></td>";
        $html .= "<td></td>";
        $html .= "<td></td>";
        $html .= "<td></td>";
        $html .= "<td class='td-order nowrap'>" . $count . " предложений</td>";
        $html .= "</tr>";
        return $html;

        
    }

    protected function all_counts($item, $count)
    {
        if ($count <= 3) {
            return '';
        }
        $catalogname = str_replace(' ', '-', $item);
        $counts = ($count - 3);
        $html = '';
        $html .= "<tr class='counts child-count-{$catalogname}' data-count='{$counts}' data-parent='{$catalogname}'>";
        $html .= "<td></td>";
        $html .= "<td><span class='pointer open-data'>Показать еще " . ($count - 3) . "<span></td>";
        $html .= "<td></td>";
        $html .= "<td></td>";
        $html .= "<td></td>";
        $html .= "<td class='td-order nowrap'></td>";
        $html .= "</tr>";
        return $html;
      
    }

    protected function brandsCheckbox(&$html, $brand, $price)
    {
        $html .= '<div class="Checkbox__root___2wndK Checkbox__hasTitle___3-WIM Checkbox__checkboxType___21yDu Checkbox__blockMode___1jz5X">
                    <label class="Checkbox__label___3xh9F"><input type="checkbox" data-brand="' . str_replace(" ", '-', $brand) . '"class="Checkbox__checkbox___3XTjs brand-check">
                        <span class="Checkbox__checkboxReplacerWrap___16zNX"><span class="Checkbox__checkboxReplacer___1qlXc"></span>
                        </span>
                        <span class="Checkbox__title___25CEp">
                            <span class="AppraiseFilter__brandLabel___1KHzm">
                                <span>' . $brand . '</span>
                                <span class="AppraiseFilter__brandMinPrice___-Pcz6">
                                ' . $price . ' ₽</span>
                            </span>
                        </span>
                    </label>
                </div>';
        return $html;
    }

    public function my_absolute_price()
    {
        if (!$this->validateManufacturer()) {
            return false;
        }
        if (empty($this->results)) {
            return [];
        }
        return $this->getBrandsPrice();

    }

    public function getBrandsPrice()
    {
        foreach ($this->results as $brandName => $items) {
            $brand = mb_strtolower($brandName);
            $manugfacturer = mb_strtolower($this->manufacturer);
            // if (preg_match('/\b(?<!-)' . $brand . '\b(?!-)/',$manugfacturer )) {
            if (preg_match('(' . $brand . ')', $manugfacturer)) {
                $values = [];
                foreach ($items as $item) {
                    $price = $item->SalePrice;
                    $delivery = $item->NumberOfDaysSupply;
                    $values[] =
                        [
                            'price' => $price,
                            'delivery' => $delivery
                        ];
                }
                usort($values, function ($a, $b) {
                    if ($a['price'] > $b['price']) {
                        return 1;
                    }

                    if ($a['price'] < $b['price']) {
                        return -1;
                    }

                    if ($a['price'] == $b['price']) {
                        if ($a['delivery'] == $b['delivery']) return 0;
                        return ($a['delivery'] > $b['delivery']) ? 1 : -1;
                    }
                });
                $values[0] = $values[0]['price'];
                return $values;
            }
        }
        return [];
    }

    public function getBrands()
    {
        foreach ($this->results as $brandName => $items) {
            $brand = mb_strtolower($brandName);
            $manugfacturer = mb_strtolower($this->manufacturer);
            // if (preg_match('/\b(?<!-)' . $brand . '\b(?!-)/',$manugfacturer )) {
            if (preg_match('(' . $brand . ')', $manugfacturer)) {
                $values = [];
                foreach ($items as $item) {
                    $price = $item->SalePrice;
                    $delivery = $item->NumberOfDaysSupply;
                    $values[] =
                        [
                            'price' => $price,
                            'delivery' => $delivery
                        ];
                }
                usort($values, function ($a, $b) {
                    if ($a['delivery'] > $b['delivery']) {
                        return 1;
                    }

                    if ($a['delivery'] < $b['delivery']) {
                        return -1;
                    }

                    if ($a['delivery'] == $b['delivery']) {
                        if ($a['price'] == $b['price']) return 0;
                        return ($a['price'] > $b['price']) ? 1 : -1;
                    }
                });
                $values[0] = $values[0]['price'];
                return $values;
            }
        }
        return [];
    }

    protected function my_sort($items)
    {
        for ($i = 0; $i <= count((array)$items); $i++) {
            for ($j = 0; $j <= $i; $j++) {
                if ($items[$j]->SalePrice > $items[$i]->SalePrice) {
                    $new_array = $items[$i];
                    $items[$i] = $items[$j];
                    $items[$j] = $new_array;
                }
                if (($items[$j]->SalePrice == $items[$i]->SalePrice) && $items[$j]->NumberOfDaysSupply > $items[$i]->NumberOfDaysSupply) {

                    $new_array = $items[$i];
                    $items[$i] = $items[$j];
                    $items[$j] = $new_array;
                }
            }
        }
        return $items;
    }

    protected function sort_delivery_price($array, $attribute_name, $attribute_two_name)
    {
        usort($array, function ($a, $b) use ($attribute_name, $attribute_two_name) {
            $t1 = $a[$attribute_name];
            $t2 = $b[$attribute_name];
            $t3 = $a[$attribute_two_name];
            $t4 = $b[$attribute_two_name];
            if ($t2 == $t1) {
                if ($t3 == $t4) return 0;
                return ($t4 > $t3) ? -1 : 1;
            }
            return 0;
        });
        return $array;
    }

    protected function validateManufacturer()
    {
        if ($this->counts != 'В наличии склад №2') {
            return false;
        }
        $no_manufacturer = $this->noManufacturer();
        foreach ($no_manufacturer as $item => $manufacturer) {
            if ($manufacturer == $this->manufacturer) {
                return false;
                break;
            }
        }
        return true;
    }

    public function minPrice()
    {
        if (empty($this->results)) {
            return 0;
        }
        foreach ($this->results as $brandName => $items) {
            foreach ($items as $item) {
                $price = $this->getPrice($item->SalePrice);
                $values[] = $price;
            }
            $min_price = $values;
            sort($min_price);
            $min_price = $min_price[0];
            $this->brandsCheckbox($this->brands_price, $brandName, $min_price);
        }
        sort($values);
        return $values[0];
    }

    public function searchPrice()
    {
        if (empty($this->results)) {
            return 0;
        }
        foreach ($this->results as $brandName => $items) {
            $values = [];
            foreach ($items as $item) {
                $price = $this->getPrice($item->SalePrice);
                $values[] = $price;
            }
            $min_price = sort($values);
            $min_price = $values[0];
            $this->brandsCheckbox($this->brands_price, $brandName, $min_price);

        }
        return $this->brands_price;
    }

    protected function noManufacturer()
    {
        return [
            'ТАТА 613',
            'FUSO CANTER'
        ];
    }
}