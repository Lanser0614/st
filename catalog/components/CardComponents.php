<?php
/**
 * Created by PhpStorm.
 * User: User
 * Date: 12.10.2019
 * Time: 19:10
 */

class CardComponents
{
    public $analog_id;
    public $product_id;
    public $quantity;

    public function getTotalPrice(){

    }

    public function add($id,$count){

    }

    public function remove($id){

    }

    public function has($id){

    }

    public function edit($id,$count){

    }

    public function load($request){
       $vars =  get_class_vars(self::class);
       foreach($vars as $key => $value){
           if(!$this->validate($key,$request)){
               $attribute[$key] = $request[$key];
               $this->{$key} = $request[$key];
           }else{
               $attribute[$key] = 0;
               $this->{$key} = 0;
           }
       }
       return $attribute;
    }

    public function validate($attribute,$request){
        if(isset($request[$attribute])){
            return false;
        }else{
            return true;
        }
    }

    /**
     * @return mixed
     */
    public function getAnalogId()
    {
        return $this->analog_id;
    }

    /**
     * @param mixed $analog_id
     */
    public function setAnalogId($analog_id)
    {
        $this->analog_id = $analog_id;
    }

}