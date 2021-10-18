<?php
/**
 * Created by PhpStorm.
 * User: User
 * Date: 13.10.2019
 * Time: 17:28
 */

class AutopiterUIDComponents
{
    /**
     * @var $client SoapClient
     */
    protected $client;

    public $article_id;

    protected $results;

    public function __construct($uid)
    {
        $this->article_id = $uid;
        $this->client = new SoapClient('http://service.autopiter.ru/v2/price?WSDL',array('soap_version'=>SOAP_1_2,'encoding'=>'UTF-8'));
        if (!($this->client->IsAuthorization()->IsAuthorizationResult)) {
            //http://service.autopiter.ru/price.asmx?op=Authorization
            //UserID - ваш клиентский id, Password - ваш пароль
            $this->client->Authorization(array("UserID"=>AUTOPITER_LOGIN, "Password"=>AUTOPITER_PASSWORD, "Save"=> "true"));
        }
    }

    public function getInfoPrice(){
        try{
            $result = $this->client->GetPriceId(array("DetailUid"=>$this->article_id));
            $this->results = $result->GetPriceIdResult->PriceSearchModel;
            return [
                'price'=>$this->getPrice(),
                'name'=>$this->getName(),
            ];
        }catch(ErrorException $message){
            return [
                'price'=>'',
                'name'=>''
            ];
        }
    }
    public function getPrice(){
        if(isset($this->results->SalePrice)&&!empty($this->results->SalePrice)){
            return $this->validatePrice($this->results->SalePrice);
        }else{
            return '';
        }
    }
    public function validatePrice($price){
        return $price;
    }
    public function getName(){
        if(isset($this->results->Name)&&!empty($this->results->Name)){
            return $this->results->Name;
        }else{
            return '';
        }
    }

}