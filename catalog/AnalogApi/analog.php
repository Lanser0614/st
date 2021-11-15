<?php



class analog  
{

   public function __construct($sku, $mono)
   {
      
      $curlSession = curl_init();
      curl_setopt($curlSession, CURLOPT_URL, "https://id25394.public.api.abcp.ru/search/articles/?userlogin=sybaritetrade@gmail.com&userpsw=d272d4ec79ed408d275e65db3fcb1314&number=$sku&brand=$mono&useOnlineStocks=1");
      curl_setopt($curlSession, CURLOPT_BINARYTRANSFER, true);
      curl_setopt($curlSession, CURLOPT_RETURNTRANSFER, true);
      
      
      $jsonData = json_decode(curl_exec($curlSession));
      curl_close($curlSession);
      return $jsonData;
      //$taskList = json_decode($jsonData,TRUE);
     // var_dump($taskList);
      
   }

   // public function getDataFromApi($sku, $mono)
   // {
   //  $curlSession = curl_init();
   //  curl_setopt($curlSession, CURLOPT_URL, "https://id25394.public.api.abcp.ru/search/articles/?userlogin=sybaritetrade@gmail.com&userpsw=d272d4ec79ed408d275e65db3fcb1314&number=$sku&brand=$mono&useOnlineStocks=1");
   //  curl_setopt($curlSession, CURLOPT_BINARYTRANSFER, true);
   //  curl_setopt($curlSession, CURLOPT_RETURNTRANSFER, true);
    
   //  $jsonData = json_decode(curl_exec($curlSession));
   //  curl_close($curlSession);

   //  return $jsonData;
   // }

   // public function getManufactureName($manufakture_id)
   // {
   //    var_dump($manufakture_id);
   //  $manufakture = $this->db->query("SELECT * FROM `manufacturer_description` WHERE manufacturer_id = " . $manufakture_id);

   //  return $manufakture->row;
   // }


}
