<?php

use YandexMoneyModule\YandexMarket\Object;

class analog
{

   public function getMinPrice($data)
   {
    
      $price = array_column($data, 'price');
         $minPrice = min($price);
         return $minPrice;
     
   }

   public function getAnaligApi($sku, $mono)
   {

      $curlSession = curl_init();
      curl_setopt($curlSession, CURLOPT_URL, "https://id25394.public.api.abcp.ru/search/articles/?userlogin=sybaritetrade@gmail.com&userpsw=d272d4ec79ed408d275e65db3fcb1314&number=$sku&brand=$mono&useOnlineStocks=1");
      curl_setopt($curlSession, CURLOPT_BINARYTRANSFER, true);
      curl_setopt($curlSession, CURLOPT_RETURNTRANSFER, true);
      $jsonData = json_decode(curl_exec($curlSession));
      curl_close($curlSession);


      if (!empty($jsonData->errorCode)) {
         return (object)[];
      }else{
         return $jsonData;
      }
   }



   public function getSortData($json)
   {

      if (!empty($json)) {
         $data = json_decode(json_encode($json), true);

         function sortByOrder($a, $b)
         {
            return $a['price'] - $b['price'];
         }
   
         usort($data, 'sortByOrder');
   
         $sorted = [];
         foreach ($data as $key) {
            unset($key['code']);
            unset($key['distributorId']);
            unset($key['grp']);
            unset($key['volume']);
            unset($key['weight']);
            unset($key['lastUpdateTime']);
            unset($key['noReturn']);
            unset($key['itemKey']);
            unset($key['distributorCode']);
            unset($key['packing']);
            unset($key['deliveryPeriodMax']);
            unset($key['deadlineReplace']);
            unset($key['supplierCode']);
            unset($key['supplierColor']);
            unset($key['supplierDescription']);
               //$key['price'] = $key['price'] + ($key['price'] * (20 / 100)); if Owner want change price use this code
            array_push($sorted, $key);
         }
       
         return $sorted;
      }else {
         return '';
      }
     
   }


   function sortArrayByBrand($data)
   {
      $brands = [];
      for ($i = 0; $i < count($data); $i++) {
         $brands = array_merge($brands, [$data[$i]['brand'] => []]);
      }

      foreach ($brands as $k => $v) {
         for ($b = 0; $b < count($data); $b++) {
            if ($data[$b]['brand'] === $k) {
               $brands[$k] = array_merge($brands[$k], [$data[$b]]);
            }
         }
      }
      return $brands;
   }
}
