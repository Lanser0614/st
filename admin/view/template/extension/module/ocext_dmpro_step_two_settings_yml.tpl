<?php if(!$errors){ ?>

<?php if($format_data=='yml'){ ?>
<h2><?php echo $text_step_2_synchronization ?></h2>

<p class="alert alert-success"><?php echo $text_count_categories ?>: <b><?php echo $count_categories ?></b>, <?php echo $text_count_offers ?>: <b><?php echo $count_offers ?></b></p>

<table class="table table-bordered table-hover">
    
        <tbody>
            
            <tr>
                <td class="text-left" >
                    <?php echo $text_type_data_yml_setting_category_matching ?> 
                </td>
                <td class="text-left" >
                    
                    <div class="input-group">
                        
                        <div class="well" style="max-height: 200px; overflow-y: auto">
                            
                            
                            
                            <?php foreach($yml_categories as $yml_category_data_row){ ?>

                                <?php if( isset($tamplate_data_selected['category']['category_matching'][$yml_category_data_row['yml_category_id']]['select']) && count($tamplate_data_selected['category']['category_matching'][$yml_category_data_row['yml_category_id']])>1 ){ ?>

                                    <input class="setCategoryMatching" onchange="setCategoryMatching('<?php echo $yml_category_data_row['yml_category_id'] ?>',this.value,true)" name="odmproyml_tamplate_data_yml[category][category_matching][<?php echo $yml_category_data_row['yml_category_id'] ?>][select]" type="checkbox" id="yml_category_category_matching_<?php echo $yml_category_data_row['yml_category_id'] ?>" value="<?php echo $yml_category_data_row['yml_category_id'] ?>" checked="" />

                                <?php }else{ ?>

                                    <input class="setCategoryMatching" onchange="setCategoryMatching('<?php echo $yml_category_data_row['yml_category_id'] ?>',this.value,true)" name="odmproyml_tamplate_data_yml[category][category_matching][<?php echo $yml_category_data_row['yml_category_id'] ?>][select]" type="checkbox" id="yml_category_category_matching_<?php echo $yml_category_data_row['yml_category_id'] ?>" value="<?php echo $yml_category_data_row['yml_category_id'] ?>" />

                                <?php } ?>

                                <label for="yml_category_category_matching_<?php echo $yml_category_data_row['yml_category_id'] ?>" >&nbsp;&nbsp;&nbsp;<?php echo $yml_category_data_row['name'] ?></label><br>

                                <div id="yml_category_category_matching_select<?php echo $yml_category_data_row['yml_category_id'] ?>" class="well" style="max-height: 200px; overflow-y: auto">    

                                    <a onclick="setCategoryMatching('<?php echo $yml_category_data_row['yml_category_id'] ?>',this.value,true)">Редактировать список</a><br><br>
                                    
                                    <?php
                                    
                                    $categories_matching_selected = array();
                                    
                                    $yml_category_id = $yml_category_data_row['yml_category_id'];
                                    
                                    if(isset($tamplate_data_selected['category']['category_matching'][ $yml_category_id ]['select']) && $yml_categories && $categories){
                                    
                                        unset($tamplate_data_selected['category']['category_matching'][ $yml_category_id ]['select']);
                                        
                                        if($tamplate_data_selected['category']['category_matching'][ $yml_category_id ]){
                                        
                                            $categories_matching_selected = $tamplate_data_selected['category']['category_matching'][ $yml_category_id ];
                                        
                                        }
                                    
                                    }
                                    
                                    foreach($categories_matching_selected as $category_id){
                                    
                                        if(isset($categories[$category_id])){

                                        ?>

                                            <div id="setCategoryMatchingRow_<?php echo $yml_category_id ?>_<?php echo $category_id ?>__">

                                            <input checked="" onclick="removeSel(<?php echo $yml_category_id ?>,<?php echo $category_id ?>,'_')" name="odmproyml_tamplate_data_yml[category][category_matching][<?php echo $yml_category_id ?>][<?php echo $category_id ?>]" type="checkbox" value="<?php echo $category_id ?>"  />

                                            <label >&nbsp;&nbsp;&nbsp;<?php echo $categories[$category_id]['name'] ?></label><br>

                                            </div>
                                    
                                    <?php } ?>
                                    
                                <?php } ?>

                                </div>
                                
                                <script type="text/javascript"><!--

                                    $(document).ready(function() {
                                        
                                        setCategoryMatching('<?php echo $yml_category_data_row['yml_category_id'] ?>',this.value,false);
                                        
                                    });

                            //--></script>

                            <?php } ?>
                            
                        </div>
                        
                    </div>
                    
                </td>
            </tr>
            
            <tr>
                <td class="text-left" >
                    <?php echo $text_type_data_yml_setting_product_import_status ?> 
                </td>
                <td class="text-left" >
                    
                    <div class="input-group">
                        <select onchange="openSettingBox('.product_import_status',this.value)" name="odmproyml_tamplate_data_yml[product][import_status]"  class="form-control">
                                <?php if(isset($tamplate_data_selected['product']['import_status']) && $tamplate_data_selected['product']['import_status'] ){ ?>
                                    <option value="1" selected="" ><?php echo $text_enabled; ?></option>
                                    <option value="0" ><?php echo $text_disabled; ?></option> 
                                <?php }else{ ?>
                                    <option value="0" selected="" ><?php echo $text_disabled; ?></option> 
                                    <option value="1" ><?php echo $text_enabled; ?></option> 
                                <?php } ?>
                          </select>
                    </div>
                    <script type="text/javascript"><!--

                        $(document).ready(function() {
                            $("select[name='odmproyml_tamplate_data_yml[product][import_status]']").change();
                        });

                //--></script> 
                </td>
            </tr>
            
            
            <tr class="product_import_status">
                <td class="text-left" >
                    <?php echo $text_type_data_yml_setting_category_skip ?> 
                </td>
                <td class="text-left" >
                    
                    <div class="input-group">
                        <div class="well" style="max-height: 200px; overflow-y: auto">    
                        
                        <a onclick="if($('.odmproyml_tamplate_data_yml_product_category_skip').is(':checked')){ $('.odmproyml_tamplate_data_yml_product_category_skip').prop('checked',false); }else{ $('.odmproyml_tamplate_data_yml_product_category_skip').prop('checked',true); }">Выделение</a><br><br>
                            
                        <?php foreach($yml_categories as $yml_category_data_row){ ?>
                        
                            <?php if( isset($tamplate_data_selected['product']['category_skip'][$yml_category_data_row['yml_category_id']]) ){ ?>

                                <input class='odmproyml_tamplate_data_yml_product_category_skip' name="odmproyml_tamplate_data_yml[product][category_skip][<?php echo $yml_category_data_row['yml_category_id'] ?>]" type="checkbox" id="yml_category_skip_<?php echo $yml_category_data_row['yml_category_id'] ?>" value="<?php echo $yml_category_data_row['yml_category_id'] ?>" checked="" />

                            <?php }else{ ?>

                                <input class='odmproyml_tamplate_data_yml_product_category_skip' name="odmproyml_tamplate_data_yml[product][category_skip][<?php echo $yml_category_data_row['yml_category_id'] ?>]" type="checkbox" id="yml_category_skip_<?php echo $yml_category_data_row['yml_category_id'] ?>" value="<?php echo $yml_category_data_row['yml_category_id'] ?>" />

                            <?php } ?>
                            
                            <label for="yml_category_skip_<?php echo $yml_category_data_row['yml_category_id'] ?>" >&nbsp;&nbsp;&nbsp;<?php echo $yml_category_data_row['name'] ?></label><br>
                        
                        <?php } ?>
                        
                        </div>
                    </div>
                    
                </td>
            </tr>
            
            
            
            
            
            
            <tr class="product_import_status">
                <td class="text-left" >
                    Импорт группы товаров, как один под одинаковому атрибуту или по одинаковому значения поля
                </td>
                <td class="text-left" >
                    
                    <div class="input-group">
                        
                        <select onchange="openSettingBox('.product_group_import',this.value)"  style="margin-bottom: 5px;" name="odmproyml_tamplate_data_yml[product][group_import]"  class="form-control">
                            <?php if(isset($tamplate_data_selected['product']['group_import']) && $tamplate_data_selected['product']['group_import'] ){ ?>
                                <option value="1" selected="" ><?php echo $text_enabled; ?></option>
                                <option value="0" ><?php echo $text_disabled; ?></option> 
                            <?php }else{ ?>
                                <option value="0" selected="" ><?php echo $text_disabled; ?></option> 
                                <option value="1" ><?php echo $text_enabled; ?></option> 
                            <?php } ?>
                        </select>
                        
                        <div class="product_group_import">
                                <hr>
                                <br>
                                <label style="margin-top: 10px;">&nbsp;&nbsp;Товары с одинаковым значением выбранного атрибута будут добавлены, как один товар</label>
                                <select style="margin-bottom: 5px; max-width:150px;" id="group_import_attribute" name="odmproyml_tamplate_data_yml[product][group_import_attribute]"  class="form-control">
                                            <option value="0" ><?php echo $text_type_data_yml_setting_no_import; ?></option>
                                    <?php foreach($offer_attributes as $offer_attribute_element =>  $offer_attribute_element_name){ ?>
                                        <?php if(isset($tamplate_data_selected['product']['group_import_attribute']) && $tamplate_data_selected['product']['group_import_attribute'] && $tamplate_data_selected['product']['group_import_attribute'] == $offer_attribute_element ){ ?>
                                            <option value="<?php echo $offer_attribute_element ?>" selected="" ><?php echo $offer_attribute_element_name; ?></option>
                                        <?php }else{ ?>
                                            <option value="<?php echo $offer_attribute_element ?>" ><?php echo $offer_attribute_element_name; ?></option> 
                                        <?php } ?>
                                    <?php } ?>
                                </select>
                                <br>
                                <hr>
                                <label style="margin-top: 10px;">&nbsp;&nbsp;Товары с одинаковым значением выбранного поля YML будут добавлены, как один товар</label>
                                <select style="margin-bottom: 5px; max-width:150px;" id="group_import_element" name="odmproyml_tamplate_data_yml[product][group_import_element]"  class="form-control">
                                            <option value="0" ><?php echo $text_type_data_yml_setting_no_import; ?></option>
                                    <?php foreach($offer_elements as $offer_element => $tmp){ ?>
                                        <?php if(isset($tamplate_data_selected['product']['group_import_element']) && $tamplate_data_selected['product']['group_import_element'] && $tamplate_data_selected['product']['group_import_element'] == $offer_element ){ ?>
                                            <option value="<?php echo $offer_element ?>" selected="" ><?php echo $offer_element; ?></option>
                                        <?php }else{ ?>
                                            <option value="<?php echo $offer_element ?>" ><?php echo $offer_element; ?></option> 
                                        <?php } ?>
                                    <?php } ?>
                                </select>
                                
                                <hr>
                                <label style="margin-top: 10px;">&nbsp;&nbsp;Как создавать единый идентификатор</label>
                                <select style="margin-bottom: 5px; max-width:150px;" id="group_import_identificator" name="odmproyml_tamplate_data_yml[product][group_import_identificator]"  class="form-control">
                                    <?php if(isset($tamplate_data_selected['product']['group_import_identificator']) && $tamplate_data_selected['product']['group_import_identificator'] && $tamplate_data_selected['product']['group_import_identificator'] == 'attribute' ){ ?>
                                        <option value="0" >Выбрать</option>
                                        <option selected=""  value="attribute" >Делать product_id из указанного атрибута</option>
                                        <option value="element" >Делать product_id из указанного поля YML</option>
                                        <option value="attribute_element" >Делать product_id из указанного атрибута и из указанного поля YML</option>
                                    <?php }elseif(isset($tamplate_data_selected['product']['group_import_identificator']) && $tamplate_data_selected['product']['group_import_identificator'] && $tamplate_data_selected['product']['group_import_identificator'] == 'element' ){ ?>
                                        <option value="0" >Выбрать</option>
                                        <option value="attribute" >Делать product_id из указанного атрибута</option>
                                        <option selected=""  value="element" >Делать product_id из указанного поля YML</option>
                                        <option value="attribute_element" >Делать product_id из указанного атрибута и из указанного поля YML</option>
                                    <?php }elseif(isset($tamplate_data_selected['product']['group_import_identificator']) && $tamplate_data_selected['product']['group_import_identificator'] && $tamplate_data_selected['product']['group_import_identificator'] == 'attribute_element' ){ ?>
                                        <option value="0" >Выбрать</option>
                                        <option value="attribute" >Делать product_id из указанного атрибута</option>
                                        <option value="element" >Делать product_id из указанного поля YML</option>
                                        <option selected=""  value="attribute_element" >Делать product_id из указанного атрибута и из указанного поля YML</option>
                                    <?php }else{ ?>
                                        <option value="0" >Выбрать</option>
                                        <option value="attribute" >Делать product_id из указанного атрибута</option>
                                        <option value="element" >Делать product_id из указанного поля YML</option>
                                        <option value="attribute_element" >Делать product_id из указанного атрибута и из указанного поля YML</option>
                                    <?php } ?>
                                </select>
                                
                                <hr>
                                <label>Создавать префикс для товара из группы товаров (рекомендуется, во избежания замены уже существующих товаров. Например 00000</label>
                                <?php if(isset($tamplate_data_selected['product']['group_import_prefix'])){ ?>

                                    <input name="odmproyml_tamplate_data_yml[product][group_import_prefix]" value="<?php echo $tamplate_data_selected['product']['group_import_prefix'] ?>"  class="form-control" />

                                <?php }else{ ?>

                                    <input name="odmproyml_tamplate_data_yml[product][group_import_prefix]" value="00000"  class="form-control" />

                                <?php } ?>
                                <hr>
                                
                                
                        </div>
                        <script type="text/javascript"><!--


                        $(document).ready(function() {
                            $("select[name='odmproyml_tamplate_data_yml[product][group_import]']").change();
                        });

                //--></script> 
                        
                    </div>
                    
                </td>
            </tr>
            
            
            
            
            
            
            
            
            <tr class="product_import_status">
                <td class="text-left" >
                    <?php echo $text_type_data_yml_setting_product_id_column ?> 
                </td>
                <td class="text-left" >
                    
                    <div class="input-group">
                        <select name="odmproyml_tamplate_data_yml[product][id_column]"  class="form-control">
                        <option value="0" ><?php echo $entry_select; ?></option>
                            <?php foreach($unique_types_data['product'] as $id_column => $id_column_title){ ?>
                                <?php if(isset($tamplate_data_selected['product']['id_column']) && $tamplate_data_selected['product']['id_column'] == $id_column ){ ?>
                        <option value="<?php echo $id_column ?>" selected="" ><?php echo $id_column_title; ?></option>
                                <?php }else{ ?>
                        <option value="<?php echo $id_column ?>" ><?php echo $id_column_title; ?></option> 
                                <?php } ?>
                            <?php } ?>
                        </select>
                    </div>
                    
                </td>
            </tr>
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            <tr class="product_import_status">
                <td class="text-left" >
                    <?php echo $text_type_data_yml_setting_product_status_default ?> 
                </td>
                <td class="text-left" >
                    
                    <div class="input-group">
                        <select style="margin-bottom: 5px;" name="odmproyml_tamplate_data_yml[product][status_default]"  class="form-control">
                            <?php if(isset($tamplate_data_selected['product']['status_default']) && $tamplate_data_selected['product']['status_default'] ){ ?>
                                <option value="1" selected="" ><?php echo $text_enabled; ?></option>
                                <option value="0" ><?php echo $text_disabled; ?></option> 
                            <?php }else{ ?>
                                <option value="0" selected="" ><?php echo $text_disabled; ?></option> 
                                <option value="1" ><?php echo $text_enabled; ?></option> 
                            <?php } ?>
                        </select>
                    </div>
                    
                </td>
            </tr>
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            <tr class="product_import_status">
                <td class="text-left" >
                    <?php echo $text_type_data_yml_setting_product_price ?> 
                </td>
                <td class="text-left" >
                    
                    <div class="input-group">
                        
                        <select onchange="openSettingBox('.product_price_delta',this.value)" style="margin-bottom: 5px;" name="odmproyml_tamplate_data_yml[product][price]"  class="form-control">
                            <?php if(isset($tamplate_data_selected['product']['price']) && $tamplate_data_selected['product']['price'] ){ ?>
                                <option value="1" selected="" ><?php echo $text_enabled; ?></option>
                                <option value="0" ><?php echo $text_disabled; ?></option> 
                            <?php }else{ ?>
                                <option value="0" selected="" ><?php echo $text_disabled; ?></option> 
                                <option value="1" ><?php echo $text_enabled; ?></option> 
                            <?php } ?>
                        </select>
                        <div class="product_price_delta">
                            <label style="margin-top: 10px;"><?php echo $text_type_data_yml_setting_product_price_delta; ?></label>
                            <?php if(isset($tamplate_data_selected['product']['price_delta'])){ ?>

                                <input placeholder="<?php echo $text_type_data_yml_setting_product_price_delta ?>" name="odmproyml_tamplate_data_yml[product][price_delta]" value="<?php echo $tamplate_data_selected['product']['price_delta'] ?>"  class="form-control" />

                            <?php }else{ ?>

                                <input placeholder="<?php echo $text_type_data_yml_setting_product_price_delta ?>" name="odmproyml_tamplate_data_yml[product][price_delta]" value=""  class="form-control" />

                            <?php } ?>
                            
                            <br>
                            <label style="margin-top: 10px;"><?php echo $text_type_data_yml_setting_product_price_param; ?></label>
                            <table>
                            <?php for($i=0;$i<8;$i++){ ?>
                            <tr >
                                <td class="text-left">
                                    <?php echo $text_type_data_yml_setting_product_price_param_limit ?> 
                                </td>
                                <td class="text-left" >

                                    <div  style="margin-left: 5px;"  class="input-group">

                                        <?php if(isset($tamplate_data_selected['product']['price_param'][$i]['limit'])){ ?>

                                            <input placeholder="<?php echo $text_type_data_yml_setting_product_price_param_limit ?>" name="odmproyml_tamplate_data_yml[product][price_param][<?php echo $i ?>][limit]" value="<?php echo $tamplate_data_selected['product']['price_param'][$i]['limit'] ?>"  class="form-control" />

                                        <?php }else{ ?>

                                            <input placeholder="<?php echo $text_type_data_yml_setting_product_price_param_limit ?>" name="odmproyml_tamplate_data_yml[product][price_param][<?php echo $i ?>][limit]" value=""  class="form-control" />

                                        <?php } ?>

                                    </div>

                                </td>
                                <td class="text-left" style="padding-left: 5px;">
                                    <?php echo $text_type_data_yml_setting_product_price_param_delta ?> 
                                </td>
                                <td class="text-left" >

                                    <div  style="margin-left: 5px;"  class="input-group">
                                        <div  style="margin-left: 5px;"  class="input-group">

                                        <?php if(isset($tamplate_data_selected['product']['price_param'][$i]['delta'])){ ?>

                                            <input placeholder="<?php echo $text_type_data_yml_setting_product_price_param_delta ?>" name="odmproyml_tamplate_data_yml[product][price_param][<?php echo $i ?>][delta]" value="<?php echo $tamplate_data_selected['product']['price_param'][$i]['delta'] ?>"  class="form-control" />

                                        <?php }else{ ?>

                                            <input placeholder="<?php echo $text_type_data_yml_setting_product_price_param_delta ?>" name="odmproyml_tamplate_data_yml[product][price_param][<?php echo $i ?>][delta]" value=""  class="form-control" />

                                        <?php } ?>

                                        </div>
                                    </div>

                                </td>
                                <td class="text-left" >

                                    <select name="odmproyml_tamplate_data_yml[product][price_param][<?php echo $i ?>][delta_type]"  class="form-control">
                                        <?php if(isset($tamplate_data_selected['product']['price_param'][$i]['delta_type']) && $tamplate_data_selected['product']['price_param'][$i]['delta_type']=='currency' ){ ?>
                                            <option value="currency" selected="" >у.е. (в валюте магазина)</option>
                                            <option value="percent" >%</option> 
                                        <?php }else{ ?>
                                            <option value="currency" >у.е. (в валюте магазина)</option>
                                            <option value="percent" selected="" >%</option> 
                                        <?php } ?>
                                    </select>

                                </td>
                                
                                
                                
                                
                            </tr>
                            <?php } ?>
                        </table>
                            
                            <br>
                            <label style="margin-top: 10px;"><?php echo $text_type_data_yml_setting_product_price_special; ?></label>
                            <select onchange="openSettingBox('.product_price_special_delta',this.value)" name="odmproyml_tamplate_data_yml[product][price_special]"  class="form-control">
                                <?php if(isset($tamplate_data_selected['product']['price_special']) && $tamplate_data_selected['product']['price_special'] ){ ?>
                                    <option value="1" selected="" ><?php echo $text_type_data_yml_setting_product_price_special; ?></option>
                                    <option value="0" ><?php echo $text_type_data_yml_setting_no_import; ?></option> 
                                <?php }else{ ?>
                                    <option value="0" selected="" ><?php echo $text_type_data_yml_setting_no_import; ?></option> 
                                    <option value="1" ><?php echo $text_type_data_yml_setting_product_price_special; ?></option> 
                                <?php } ?>
                            </select>
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                        </div>
                        
                        <script type="text/javascript"><!--

                        $(document).ready(function() {
                            $("select[name='odmproyml_tamplate_data_yml[product][price]']").change();
                            $("select[name='odmproyml_tamplate_data_yml[product][price_special]']").change();
                        });

                //--></script> 
                        
                    </div>
                    
                </td>
            </tr>
            <tr class="product_import_status">
                <td class="text-left" >
                    <?php echo $text_type_data_yml_setting_product_quantity ?> 
                </td>
                <td class="text-left" >
                    
                    <div class="input-group">
                        
                        <select onchange="openSettingBox('.product_quantity_param',this.value)"  style="margin-bottom: 5px;" name="odmproyml_tamplate_data_yml[product][quantity]"  class="form-control">
                            <?php if(isset($tamplate_data_selected['product']['quantity']) && $tamplate_data_selected['product']['quantity'] ){ ?>
                                <option value="1" selected="" ><?php echo $text_enabled; ?></option>
                                <option value="0" ><?php echo $text_disabled; ?></option> 
                            <?php }else{ ?>
                                <option value="0" selected="" ><?php echo $text_disabled; ?></option> 
                                <option value="1" ><?php echo $text_enabled; ?></option> 
                            <?php } ?>
                        </select>
                        
                        <div class="product_quantity_param">
                                <label style="margin-top: 10px;"><?php echo $text_type_data_yml_setting_product_quantity_false_0 ?></label>
                                <?php if(isset($tamplate_data_selected['product']['quantity_false_0'])){ ?>

                                    <input placeholder="<?php echo $text_type_data_yml_setting_product_quantity_false_0 ?>" name="odmproyml_tamplate_data_yml[product][quantity_false_0]" value="<?php echo $tamplate_data_selected['product']['quantity_false_0'] ?>"  class="form-control" />

                                <?php }else{ ?>

                                    <input placeholder="<?php echo $text_type_data_yml_setting_product_quantity_false_0 ?>" name="odmproyml_tamplate_data_yml[product][quantity_false_0]" value="0"  class="form-control" />

                                <?php } ?>
                                <hr>
                                <label style="margin-top: 10px;"><?php echo $text_type_data_yml_setting_product_quantity_true_100 ?></label>
                                <?php if(isset($tamplate_data_selected['product']['quantity_true_100'])){ ?>

                                    <input placeholder="<?php echo $text_type_data_yml_setting_product_quantity_true_100 ?>" name="odmproyml_tamplate_data_yml[product][quantity_true_100]" value="<?php echo $tamplate_data_selected['product']['quantity_true_100'] ?>"  class="form-control" />

                                <?php }else{ ?>

                                    <input placeholder="<?php echo $text_type_data_yml_setting_product_quantity_true_100 ?>" name="odmproyml_tamplate_data_yml[product][quantity_true_100]" value="100"  class="form-control" />

                                <?php } ?>
                                
                                <br><label style="margin-top: 10px;"><?php echo $text_type_data_yml_setting_product_quantity_false_status ?></label>
                                <select style="margin-bottom: 5px;" name="odmproyml_tamplate_data_yml[product][quantity_false_status]"  class="form-control">
                                    <?php if(isset($tamplate_data_selected['product']['quantity_false_status']) && $tamplate_data_selected['product']['quantity_false_status'] ){ ?>
                                        <option value="1" selected="" ><?php echo $text_enabled; ?></option>
                                        <option value="0" ><?php echo $text_disabled; ?></option> 
                                    <?php }else{ ?>
                                        <option value="0" selected="" ><?php echo $text_disabled; ?></option> 
                                        <option value="1" ><?php echo $text_enabled; ?></option> 
                                    <?php } ?>
                                </select>
                                
                                
                        </div>
                        <script type="text/javascript"><!--

                        $(document).ready(function() {
                            $("select[name='odmproyml_tamplate_data_yml[product][quantity]']").change();
                        });

                //--></script> 
                        
                    </div>
                    
                </td>
            </tr>
            
            
            <tr class="product_import_status">
                <td class="text-left" >
                    <?php echo $text_type_data_yml_setting_product_image ?> 
                </td>
                <td class="text-left" >
                    
                    <div class="input-group">
                        
                        <select onchange="openSettingBox('.product_image_upload',this.value)"   style="margin-bottom: 5px;" name="odmproyml_tamplate_data_yml[product][image]"  class="form-control">
                            <?php if(isset($tamplate_data_selected['product']['image']) && $tamplate_data_selected['product']['image'] ){ ?>
                                <option value="1" selected="" ><?php echo $text_enabled; ?></option>
                                <option value="0" ><?php echo $text_disabled; ?></option> 
                            <?php }else{ ?>
                                <option value="0" selected="" ><?php echo $text_disabled; ?></option> 
                                <option value="1" ><?php echo $text_enabled; ?></option> 
                            <?php } ?>
                        </select>
                        
                        <div class="product_image_upload">
                            <select style="margin-bottom: 5px;" name="odmproyml_tamplate_data_yml[product][image_upload]"  class="form-control">
                                <?php if(isset($tamplate_data_selected['product']['image_upload']) && $tamplate_data_selected['product']['image_upload'] ){ ?>
                                    <option value="1" selected="" ><?php echo $text_type_data_yml_setting_product_image_upload_1; ?></option>
                                    <option value="0" ><?php echo $text_disabled; ?></option> 
                                <?php }else{ ?>
                                    <option value="0" selected="" ><?php echo $text_type_data_yml_setting_product_image_upload_0; ?></option> 
                                    <option value="1" ><?php echo $text_type_data_yml_setting_product_image_upload_1; ?></option> 
                                <?php } ?>
                            </select>
                        </div>
                        
                        <div class="product_image_upload">
                            <select style="margin-bottom: 5px;" name="odmproyml_tamplate_data_yml[product][image_new_name]"  class="form-control">
                                <?php if(isset($tamplate_data_selected['product']['image_new_name']) && $tamplate_data_selected['product']['image_new_name'] ){ ?>
                                    <option value="1" selected="" >Оставлять название картинок</option>
                                    <option value="0" >Создавать новое название картинкам</option> 
                                <?php }else{ ?>
                                    <option value="0" selected="" >Создавать новое название картинкам</option> 
                                    <option value="1" >Оставлять название картинок</option> 
                                <?php } ?>
                            </select>
                        </div>
                        
                        <div class="product_image_upload">
                            <label style="margin-top: 10px;">Путь размещения картинок</label><br>
                            
                            <?php if(isset($tamplate_data_selected['product']['image_new_path'])){ ?>

                                <div style="float: left; padding-top: 10px;" ><?php echo HTTP_CATALOG; ?>image/</div><input placeholder="Путь к картинкам" name="odmproyml_tamplate_data_yml[product][image_new_path]" value="<?php echo $tamplate_data_selected['product']['image_new_path']; ?>"  class="form-control" style="width: auto !important" />

                            <?php }else{ ?>

                                <div style="float: left; padding-top: 10px;" ><?php echo HTTP_CATALOG; ?>image/</div><input placeholder="Путь к картинкам" name="odmproyml_tamplate_data_yml[product][image_new_path]" value="catalog/"  class="form-control" style="width: auto !important"  />

                            <?php } ?>
                        </div>
                        
                        
                        
                        <script type="text/javascript"><!--

                        $(document).ready(function() {
                            $("select[name='odmproyml_tamplate_data_yml[product][image]']").change();
                        });

                //--></script> 
                    </div>
                    
                </td>
            </tr>
            
            <tr class="product_import_status" style="display: none">
                <td class="text-left" >
                    <?php echo $text_type_data_yml_setting_product_rec ?> 
                </td>
                <td class="text-left" >
                    
                    <div class="input-group">
                        
                        <select style="margin-bottom: 5px;" name="odmproyml_tamplate_data_yml[product][rec]"  class="form-control">
                            <?php if(isset($tamplate_data_selected['product']['rec']) && $tamplate_data_selected['product']['rec'] ){ ?>
                                <option value="1" selected="" ><?php echo $text_enabled; ?></option>
                                <option value="0" ><?php echo $text_disabled; ?></option> 
                            <?php }else{ ?>
                                <option value="0" selected="" ><?php echo $text_disabled; ?></option> 
                                <option value="1" ><?php echo $text_enabled; ?></option> 
                            <?php } ?>
                        </select>
                        
                    </div>
                    
                </td>
            </tr>
            
            <tr class="product_import_status" >
                <td class="text-left" >
                    <?php echo $text_type_data_yml_setting_product_description ?> 
                </td>
                <td class="text-left" >
                    
                    <div class="input-group">
                        
                        <select style="margin-bottom: 5px;" name="odmproyml_tamplate_data_yml[product][description]"  class="form-control">
                            <?php if(isset($tamplate_data_selected['product']['description']) && $tamplate_data_selected['product']['description'] ){ ?>
                                <option value="1" selected="" ><?php echo $text_enabled; ?></option>
                                <option value="0" ><?php echo $text_disabled; ?></option> 
                            <?php }else{ ?>
                                <option value="0" selected="" ><?php echo $text_disabled; ?></option> 
                                <option value="1" ><?php echo $text_enabled; ?></option> 
                            <?php } ?>
                        </select>
                        
                        
                        <div>
                            <select style="margin-bottom: 5px;" name="odmproyml_tamplate_data_yml[product][description_cdata]"  class="form-control">
                                <?php if( isset($tamplate_data_selected['product']['description_cdata']) && $tamplate_data_selected['product']['description_cdata'] ){ ?>
                                    <option value="1" selected="" >Описания в формате HTML (CDATA)</option>
                                    <option value="0" >Описание текстом</option> 
                                <?php }else{ ?>
                                    <option value="0" selected="" >Описание текстом</option> 
                                    <option value="1" >Описания в формате HTML (CDATA)</option> 
                                <?php } ?>
                            </select>
                        </div>
                        
                    </div>
                    
                </td>
            </tr>
            
            
            
            
            <tr class="product_import_status" >
                <td class="text-left" >
                    <?php echo $text_type_data_yml_setting_product_typePrefix ?> 
                </td>
                <td class="text-left" >
                    
                    <div class="input-group">
                        
                        <select name="odmproyml_tamplate_data_yml[product][typePrefix]"  class="form-control" style="margin-top: 5px;">
                            <option value="0" ><?php echo $text_type_data_yml_setting_no_import; ?></option>
                                <?php foreach($types_data['product']['product'] as $db_column_name => $column_title){ ?>
                                    <?php if(isset($tamplate_data_selected['product']['typePrefix']) && $tamplate_data_selected['product']['typePrefix'] == $db_column_name ){ ?>
                            <option value="<?php echo $db_column_name ?>" selected="" ><?php echo $column_title; ?></option>
                                    <?php }else{ ?>
                            <option value="<?php echo $db_column_name ?>" ><?php echo $column_title; ?></option> 
                                    <?php } ?>
                                <?php } ?>
                        </select>
                        
                    </div>
                    
                </td>
            </tr>
            
            
            <tr class="product_import_status" >
                <td class="text-left" >
                    <?php echo $text_type_data_yml_setting_product_model ?> 
                </td>
                <td class="text-left" >
                    
                    <div class="input-group">
                        
                        <select name="odmproyml_tamplate_data_yml[product][model]"  class="form-control" style="margin-top: 5px;">
                            <option value="0" ><?php echo $text_type_data_yml_setting_no_import; ?></option>
                                <?php foreach($types_data['product']['product'] as $db_column_name => $column_title){ ?>
                                    <?php if(isset($tamplate_data_selected['product']['model']) && $tamplate_data_selected['product']['model'] == $db_column_name ){ ?>
                            <option value="<?php echo $db_column_name ?>" selected="" ><?php echo $column_title; ?></option>
                                    <?php }elseif(!isset($tamplate_data_selected['product']['model']) && $db_column_name == 'model' ){ ?>
                            <option value="<?php echo $db_column_name ?>" selected="" ><?php echo $column_title; ?></option>
                                    <?php }else{ ?>
                            <option value="<?php echo $db_column_name ?>" ><?php echo $column_title; ?></option> 
                                    <?php } ?>
                                <?php } ?>
                        </select>
                        
                    </div>
                    
                </td>
            </tr>
            
            <tr class="product_import_status" >
                <td class="text-left" >
                    <?php echo $text_type_data_yml_setting_product_barcode ?> 
                </td>
                <td class="text-left" >
                    
                    <div class="input-group">
                        
                        <select name="odmproyml_tamplate_data_yml[product][barcode]"  class="form-control" style="margin-top: 5px;">
                            <option value="0" ><?php echo $text_type_data_yml_setting_no_import; ?></option>
                                <?php foreach($types_data['product']['product'] as $db_column_name => $column_title){ ?>
                                    <?php if(isset($tamplate_data_selected['product']['barcode']) && $tamplate_data_selected['product']['barcode'] == $db_column_name ){ ?>
                            <option value="<?php echo $db_column_name ?>" selected="" ><?php echo $column_title; ?></option>
                                    <?php }elseif(!isset($tamplate_data_selected['product']['barcode']) && $db_column_name == 'barcode' ){ ?>
                            <option value="<?php echo $db_column_name ?>" selected="" ><?php echo $column_title; ?></option>
                                    <?php }else{ ?>
                            <option value="<?php echo $db_column_name ?>" ><?php echo $column_title; ?></option> 
                                    <?php } ?>
                                <?php } ?>
                        </select>
                        
                    </div>
                    
                </td>
            </tr>
            
            
            <tr class="product_import_status">
                <td class="text-left" >
                    <?php echo $text_type_data_yml_setting_product_name ?> 
                </td>
                <td class="text-left" >
                    
                    <div class="input-group">
                        
                        <select onchange="openSettingBox('.product_seo_title',this.value)" style="margin-bottom: 5px;" name="odmproyml_tamplate_data_yml[product][name]"  class="form-control">
                            <?php if(isset($tamplate_data_selected['product']['name']) && $tamplate_data_selected['product']['name'] ){ ?>
                                <option value="1" selected="" ><?php echo $text_enabled; ?></option>
                                <option value="0" ><?php echo $text_disabled; ?></option> 
                            <?php }else{ ?>
                                <option value="0" selected="" ><?php echo $text_disabled; ?></option> 
                                <option value="1" ><?php echo $text_enabled; ?></option> 
                            <?php } ?>
                        </select>
                        <div class="product_seo_title">
                        <label style="margin-top: 10px;"><?php echo $text_type_data_yml_setting_product_seo_title; ?></label>
                        <select style="margin-bottom: 5px;" name="odmproyml_tamplate_data_yml[product][seo_title]"  class="form-control">
                            <?php if(isset($tamplate_data_selected['product']['seo_title']) && $tamplate_data_selected['product']['seo_title'] ){ ?>
                                <option value="1" selected="" ><?php echo $text_type_data_yml_setting_product_seo_title; ?></option>
                                <option value="0" ><?php echo $text_type_data_yml_setting_no_import; ?></option> 
                            <?php }else{ ?>
                                <option value="0" selected="" ><?php echo $text_type_data_yml_setting_no_import ?></option> 
                                <option value="1" ><?php echo $text_type_data_yml_setting_product_seo_title; ?></option> 
                            <?php } ?>
                        </select>
                        <br><label style="margin-top: 10px;"><?php echo $text_type_data_yml_setting_product_name_self; ?></label>
                        <select style="margin-bottom: 5px;" name="odmproyml_tamplate_data_yml[product][name_self]"  class="form-control">
                            <option value="0" ><?php echo $text_type_data_yml_setting_no_import; ?></option>
                            <?php foreach($offer_elements as $offer_element => $tmp){ ?>
                                <?php if(isset($tamplate_data_selected['product']['name_self']) && $tamplate_data_selected['product']['name_self'] && $tamplate_data_selected['product']['name_self'] == $offer_element ){ ?>
                        <option value="<?php echo $offer_element ?>" selected="" ><?php echo $offer_element; ?></option>
                                <?php }elseif(!isset($tamplate_data_selected['product']['name_self']) && $offer_element=='name'){ ?>
                        <option value="<?php echo $offer_element ?>" ><?php echo $offer_element; ?></option> 
                                <?php }else{ ?>
                        <option value="<?php echo $offer_element ?>" ><?php echo $offer_element; ?></option> 
                                <?php } ?>
                            <?php } ?>
                        </select>
                        
                        </div>
                        <script type="text/javascript"><!--

                        $(document).ready(function() {
                            $("select[name='odmproyml_tamplate_data_yml[product][name]']").change();
                        });

                //--></script> 
                    </div>
                    
                </td>
            </tr>
            
            
            <tr class="product_import_status" >
                <td class="text-left" >
                    <?php echo $text_type_data_yml_setting_product_custom_field_import ?> 
                </td>
                <td class="text-left" >
                    
                    <div class="input-group">
                        
                        <table>
                            <?php for($i=0;$i<5;$i++){ ?>
                            <tr >
                                <td class="text-left">
                                    <?php echo $text_type_data_yml_setting_product_custom_field_import_from ?> 
                                </td>
                                <td class="text-left" >

                                    <div  style="margin-left: 5px;"  class="input-group">

                                        <select style="margin-bottom: 5px; max-width:150px;" name="odmproyml_tamplate_data_yml[product][custom_field][<?php echo $i ?>][from]"  class="form-control">
                                                    <option value="0" ><?php echo $text_type_data_yml_setting_no_import; ?></option>
                                            <?php foreach($offer_elements as $offer_element => $tmp){ ?>
                                                <?php if(isset($tamplate_data_selected['product']['custom_field'][$i]['from']) && $tamplate_data_selected['product']['custom_field'][$i]['from'] && $tamplate_data_selected['product']['custom_field'][$i]['from'] == $offer_element ){ ?>
                                                    <option value="<?php echo $offer_element ?>" selected="" ><?php echo $offer_element; ?></option>
                                                <?php }else{ ?>
                                                    <option value="<?php echo $offer_element ?>" ><?php echo $offer_element; ?></option> 
                                                <?php } ?>
                                            <?php } ?>
                                        </select>

                                    </div>

                                </td>
                                <td class="text-left" style="padding-left: 5px;">
                                    <?php echo $text_type_data_yml_setting_product_custom_field_import_to ?> 
                                </td>
                                <td class="text-left" >

                                    <div  style="margin-left: 5px;"  class="input-group">

                                        
                                        <select name="odmproyml_tamplate_data_yml[product][custom_field][<?php echo $i ?>][to]"  class="form-control" style="max-width:150px; ">
                                                        <option value="0" ><?php echo $text_type_data_yml_setting_no_import; ?></option>
                                                <?php foreach($types_data['product']['product'] as $db_column_name => $column_title){ ?>
                                                    <?php if(isset($tamplate_data_selected['product']['custom_field'][$i]['to']) && $tamplate_data_selected['product']['custom_field'][$i]['to'] && $tamplate_data_selected['product']['custom_field'][$i]['to'] == $db_column_name ){ ?>
                                                        <option value="<?php echo $db_column_name ?>" selected="" ><?php echo $column_title; ?></option>
                                                    <?php }else{ ?>
                                                        <option value="<?php echo $db_column_name ?>" ><?php echo $column_title; ?></option> 
                                                    <?php } ?>
                                                <?php } ?>
                                        </select>
                                    </div>

                                </td>
                                <td class="text-left" >
                                    <?php if(isset($tamplate_data_selected['product']['custom_field'][$i]['prefix_left'])){ ?>

                                        <input placeholder="Текстовый префикс слева" name="odmproyml_tamplate_data_yml[product][custom_field][<?php echo $i ?>][prefix_left]" value="<?php echo $tamplate_data_selected['product']['custom_field'][$i]['prefix_left'] ?>"  class="form-control" />

                                    <?php }else{ ?>

                                        <input placeholder="Текстовый префикс слева" name="odmproyml_tamplate_data_yml[product][custom_field][<?php echo $i ?>][prefix_left]" value=""  class="form-control" />

                                    <?php } ?>
                                </td>
                                <td class="text-left" >
                                    <?php if(isset($tamplate_data_selected['product']['custom_field'][$i]['prefix_right'])){ ?>

                                        <input placeholder="Текстовый префикс справа" name="odmproyml_tamplate_data_yml[product][custom_field][<?php echo $i ?>][prefix_right]" value="<?php echo $tamplate_data_selected['product']['custom_field'][$i]['prefix_right'] ?>"  class="form-control" />

                                    <?php }else{ ?>

                                        <input placeholder="Текстовый префикс справа" name="odmproyml_tamplate_data_yml[product][custom_field][<?php echo $i ?>][prefix_right]" value=""  class="form-control" />

                                    <?php } ?>
                                </td>
                            </tr>
                            <?php } ?>
                        </table>
                        
                    </div>
                    
                </td>
            </tr>
            <?php if($offer_attributes){ ?>
            <tr class="product_import_status" >
                <td class="text-left" >
                    Импортировать атрибут поля YML файла в поле товара 
                </td>
                <td class="text-left" >
                    
                    <div class="input-group">
                        
                        <table>
                            <?php for($i=0;$i<5;$i++){ ?>
                            <tr >
                                <td class="text-left">
                                    Атрибут поля YML файла
                                </td>
                                <td class="text-left" >

                                    <div  style="margin-left: 5px;"  class="input-group">

                                        <select style="margin-bottom: 5px; max-width:150px;" name="odmproyml_tamplate_data_yml[product][custom_field_attribute][<?php echo $i ?>][from]"  class="form-control">
                                                    <option value="0" ><?php echo $text_type_data_yml_setting_no_import; ?></option>
                                            <?php foreach($offer_attributes as $offer_attribute_element =>  $offer_attribute_element_name){ ?>
                                                <?php if(isset($tamplate_data_selected['product']['custom_field_attribute'][$i]['from']) && $tamplate_data_selected['product']['custom_field_attribute'][$i]['from'] && $tamplate_data_selected['product']['custom_field_attribute'][$i]['from'] == $offer_attribute_element ){ ?>
                                                    <option value="<?php echo $offer_attribute_element ?>" selected="" ><?php echo $offer_attribute_element_name; ?></option>
                                                <?php }else{ ?>
                                                    <option value="<?php echo $offer_attribute_element ?>" ><?php echo $offer_attribute_element_name; ?></option> 
                                                <?php } ?>
                                            <?php } ?>
                                        </select>

                                    </div>

                                </td>
                                <td class="text-left" style="padding-left: 5px;">
                                    <?php echo $text_type_data_yml_setting_product_custom_field_import_to ?> 
                                </td>
                                <td class="text-left" >

                                    <div  style="margin-left: 5px;"  class="input-group">

                                        
                                        <select name="odmproyml_tamplate_data_yml[product][custom_field_attribute][<?php echo $i ?>][to]"  class="form-control" style="max-width:150px; ">
                                                        <option value="0" ><?php echo $text_type_data_yml_setting_no_import; ?></option>
                                                <?php foreach($types_data['product']['product'] as $db_column_name => $column_title){ ?>
                                                    <?php if(isset($tamplate_data_selected['product']['custom_field_attribute'][$i]['to']) && $tamplate_data_selected['product']['custom_field_attribute'][$i]['to'] && $tamplate_data_selected['product']['custom_field_attribute'][$i]['to'] == $db_column_name ){ ?>
                                                        <option value="<?php echo $db_column_name ?>" selected="" ><?php echo $column_title; ?></option>
                                                    <?php }else{ ?>
                                                        <option value="<?php echo $db_column_name ?>" ><?php echo $column_title; ?></option> 
                                                    <?php } ?>
                                                <?php } ?>
                                        </select>
                                    </div>

                                </td>
                                <td class="text-left" >
                                    <?php if(isset($tamplate_data_selected['product']['custom_field_attribute'][$i]['prefix_left'])){ ?>

                                        <input placeholder="Текстовый префикс слева" name="odmproyml_tamplate_data_yml[product][custom_field_attribute][<?php echo $i ?>][prefix_left]" value="<?php echo $tamplate_data_selected['product']['custom_field_attribute'][$i]['prefix_left'] ?>"  class="form-control" />

                                    <?php }else{ ?>

                                        <input placeholder="Текстовый префикс слева" name="odmproyml_tamplate_data_yml[product][custom_field_attribute][<?php echo $i ?>][prefix_left]" value=""  class="form-control" />

                                    <?php } ?>
                                </td>
                                <td class="text-left" >
                                    <?php if(isset($tamplate_data_selected['product']['custom_field_attribute'][$i]['prefix_right'])){ ?>

                                        <input placeholder="Текстовый префикс справа" name="odmproyml_tamplate_data_yml[product][custom_field_attribute][<?php echo $i ?>][prefix_right]" value="<?php echo $tamplate_data_selected['product']['custom_field_attribute'][$i]['prefix_right'] ?>"  class="form-control" />

                                    <?php }else{ ?>

                                        <input placeholder="Текстовый префикс справа" name="odmproyml_tamplate_data_yml[product][custom_field_attribute][<?php echo $i ?>][prefix_right]" value=""  class="form-control" />

                                    <?php } ?>
                                </td>
                            </tr>
                            <?php } ?>
                        </table>
                        
                    </div>
                    
                </td>
            </tr>
            <?php } ?>
            <tr>
                <td class="text-left" >
                    <?php echo $text_type_data_yml_setting_category_import_status ?> 
                </td>
                <td class="text-left" >
                    <div class="input-group">
                        <select onchange="openSettingBox('.product_category_param',this.value)"  name="odmproyml_tamplate_data_yml[category][import_status]"  class="form-control">
                                <?php if(isset($tamplate_data_selected['category']['import_status']) && $tamplate_data_selected['category']['import_status'] ){ ?>
                                    <option value="1" selected="" ><?php echo $text_enabled; ?></option>
                                    <option value="0" ><?php echo $text_disabled; ?></option> 
                                <?php }else{ ?>
                                    <option value="0" selected="" ><?php echo $text_disabled; ?></option> 
                                    <option value="1" ><?php echo $text_enabled; ?></option> 
                                <?php } ?>
                        </select>
                        
                    <div class="product_category_param">
                        
                        <label style="margin-top: 10px;"><?php echo $text_type_data_yml_setting_category_seo_title; ?></label>
                        <select style="margin-bottom: 5px;" name="odmproyml_tamplate_data_yml[category][seo_title]"  class="form-control">
                            <?php if(isset($tamplate_data_selected['category']['seo_title']) && $tamplate_data_selected['category']['seo_title'] ){ ?>
                                <option value="1" selected="" ><?php echo $text_type_data_yml_setting_category_seo_title; ?></option>
                                <option value="0" ><?php echo $text_type_data_yml_setting_no_import; ?></option> 
                            <?php }else{ ?>
                                <option value="0" selected="" ><?php echo $text_type_data_yml_setting_no_import ?></option> 
                                <option value="1" ><?php echo $text_type_data_yml_setting_category_seo_title; ?></option> 
                            <?php } ?>
                        </select>
                        
                    </div>
                    <script type="text/javascript"><!--

                            $(document).ready(function() {
                                $("select[name='odmproyml_tamplate_data_yml[category][import_status]']").change();
                            });

                    //--></script> 
                        
                        
                    </div>
                </td>
            </tr>
            
            <tr>
                <td class="text-left" >
                    <?php echo $text_type_data_yml_setting_manufacturer_import_status ?> 
                </td>
                <td class="text-left" >
                    
                    <div class="input-group">
                        <select onchange="openSettingBox('.manufacturer_import_status',this.value)" name="odmproyml_tamplate_data_yml[manufacturer][import_status]"  class="form-control">
                                <?php if(isset($tamplate_data_selected['manufacturer']['import_status']) && $tamplate_data_selected['manufacturer']['import_status'] ){ ?>
                                    <option value="1" selected="" ><?php echo $text_enabled; ?></option>
                                    <option value="0" ><?php echo $text_disabled; ?></option> 
                                <?php }else{ ?>
                                    <option value="0" selected="" ><?php echo $text_disabled; ?></option> 
                                    <option value="1" ><?php echo $text_enabled; ?></option> 
                                <?php } ?>
                          </select>
                    </div>
                    <script type="text/javascript"><!--

                        $(document).ready(function() {
                            $("select[name='odmproyml_tamplate_data_yml[manufacturer][import_status]']").change();
                        });

                //--></script> 
                </td>
            </tr>
            <tr class="manufacturer_import_status">
                <td class="text-left" >
                    <?php echo $text_type_data_yml_setting_manufacturer_vendor_code ?> 
                </td>
                <td class="text-left" >
                    
                    <div class="input-group">
                        <select onchange="openSettingBox('.manufacturer_vendor_code_field',this.value)" name="odmproyml_tamplate_data_yml[manufacturer][vendor_code]"  class="form-control">
                                <?php if(isset($tamplate_data_selected['manufacturer']['vendor_code']) && $tamplate_data_selected['manufacturer']['vendor_code'] ){ ?>
                                    <option value="1" selected="" ><?php echo $text_type_data_yml_setting_manufacturer_vendor_code; ?></option>
                                    <option value="0" ><?php echo $text_disabled; ?></option> 
                                <?php }else{ ?>
                                    <option value="0" selected="" ><?php echo $text_disabled; ?></option> 
                                    <option value="1" ><?php echo $text_type_data_yml_setting_manufacturer_vendor_code; ?></option> 
                                <?php } ?>
                          </select>
                        
                        <div class="manufacturer_vendor_code_field" >
                        
                        <select name="odmproyml_tamplate_data_yml[manufacturer][vendor_code_field]"  class="form-control" style="margin-top: 5px;">
                            <option value="0" ><?php echo $entry_select; ?></option>
                                <?php foreach($types_data['product']['product'] as $db_column_name => $column_title){ ?>
                                    <?php if(isset($tamplate_data_selected['manufacturer']['vendor_code_field']) && $tamplate_data_selected['manufacturer']['vendor_code_field'] == $db_column_name ){ ?>
                            <option value="<?php echo $db_column_name ?>" selected="" ><?php echo $column_title; ?></option>
                                    <?php }else{ ?>
                            <option value="<?php echo $db_column_name ?>" ><?php echo $column_title; ?></option> 
                                    <?php } ?>
                                <?php } ?>
                        </select>
                            
                        </div>
                        
                        
                        <script type="text/javascript"><!--

                        $(document).ready(function() {
                            $("select[name='odmproyml_tamplate_data_yml[manufacturer][vendor_code]']").change();
                        });

                //--></script>
                        
                    </div>
                    
                </td>
            </tr>
            
            
            
            
            
            <?php if($offer_params){ ?>
            <tr>
                <td class="text-left" >
                    Импорт опций 
                </td>
                <td class="text-left" >
                    
                    <div class="input-group">
                        <select onchange="openSettingBox('.option_import_status',this.value)" name="odmproyml_tamplate_data_yml[option][import_status]"  class="form-control">
                                <?php if(isset($tamplate_data_selected['option']['import_status']) && $tamplate_data_selected['option']['import_status'] ){ ?>
                                    <option value="1" selected="" ><?php echo $text_enabled; ?></option>
                                    <option value="0" ><?php echo $text_disabled; ?></option> 
                                <?php }else{ ?>
                                    <option value="0" selected="" ><?php echo $text_disabled; ?></option> 
                                    <option value="1" ><?php echo $text_enabled; ?></option> 
                                <?php } ?>
                          </select>
                    </div>
                    <script type="text/javascript"><!--

                        $(document).ready(function() {
                            $("select[name='odmproyml_tamplate_data_yml[option][import_status]']").change();
                        });

                //--></script> 
                </td>
            </tr>
            <tr class="option_import_status">
                <td class="text-left" >
                    Выбор опций для импорта
                </td>
                <td class="text-left" >
                    
                    
                    <div><a onclick="selectUnselect('.option_params_import')">Выделение</a><br><br></div>
                    <table  class="table table-bordered table-hover">
                            <?php foreach($offer_params  as $offer_param_name){ ?>
                            <tr >
                                <td class="text-left">
                                    <?php echo $offer_param_name; ?> 
                                </td>
                                
                                <td>
                                    
                                    
                                    <select name="odmproyml_tamplate_data_yml[option][params][<?php echo $offer_param_name ?>][status]"  class="form-control option_params_import">
                                        <?php if(isset($tamplate_data_selected['option']['params'][$offer_param_name]['status']) && $tamplate_data_selected['option']['params'][$offer_param_name]['status'] ){ ?>
                                            <option value="1" selected="" ><?php echo $text_enabled; ?></option>
                                            <option value="0" ><?php echo $text_disabled; ?></option> 
                                        <?php }else{ ?>
                                            <option value="0" selected="" ><?php echo $text_disabled; ?></option> 
                                            <option value="1" ><?php echo $text_enabled; ?></option> 
                                        <?php } ?>
                                  </select>
                                </td>
                            </tr>
                            <?php } ?>
                    </table>
                    
                    
                </td>
            </tr>
            <?php } ?>
            
            
            
            
            <tr>
                <td class="text-left" >
                    <?php echo $text_type_data_yml_setting_attribute_import_status ?> 
                </td>
                <td class="text-left" >
                    
                    <div class="input-group">
                        <select onchange="openSettingBox('.attribute_import_status',this.value)" name="odmproyml_tamplate_data_yml[attribute][import_status]"  class="form-control">
                                <?php if(isset($tamplate_data_selected['attribute']['import_status']) && $tamplate_data_selected['attribute']['import_status'] ){ ?>
                                    <option value="1" selected="" ><?php echo $text_enabled; ?></option>
                                    <option value="0" ><?php echo $text_disabled; ?></option> 
                                <?php }else{ ?>
                                    <option value="0" selected="" ><?php echo $text_disabled; ?></option> 
                                    <option value="1" ><?php echo $text_enabled; ?></option> 
                                <?php } ?>
                          </select>
                    </div>
                    <script type="text/javascript"><!--

                        $(document).ready(function() {
                            $("select[name='odmproyml_tamplate_data_yml[attribute][import_status]']").change();
                        });

                //--></script> 
                </td>
            </tr>
            <tr class="attribute_import_status">
                <td class="text-left" >
                    <?php echo $text_type_data_yml_setting_attribute_groupe_id ?> 
                </td>
                <td class="text-left" >
                    
                    <div class="input-group">
                        <select name="odmproyml_tamplate_data_yml[attribute][attribute_group_id]"  class="form-control">
                            <option value="0" ><?php echo $entry_select; ?></option>
                                <?php foreach($attribute_groups as $attribute_group){ ?>
                                    <?php if(isset($tamplate_data_selected['attribute']['attribute_group_id']) && $tamplate_data_selected['attribute']['attribute_group_id'] == $attribute_group['attribute_group_id'] ){ ?>
                            <option value="<?php echo $attribute_group['attribute_group_id'] ?>" selected="" ><?php echo $attribute_group['name']; ?></option>
                                    <?php }else{ ?>
                            <option value="<?php echo $attribute_group['attribute_group_id'] ?>" ><?php echo $attribute_group['name']; ?></option> 
                                    <?php } ?>
                                <?php } ?>
                        </select>
                        
                    </div>
                    
                </td>
            </tr>
            
            
        </tbody>
          
</table>

<table class="table table-bordered table-hover">
    <tr>
          <td class="text-left" width="20%">
              <?php echo $entry_type_change; ?>
          </td>
          <td class="text-left">
              <div class="input-group">
                  <select name="odmproyml_tamplate_data_yml[type_change]"  class="form-control">
                        <option value="0" ><?php echo $entry_select; ?></option>
                            <?php foreach($types_change as $type_change => $type_change_title){ ?>
                                <?php if(isset($tamplate_data_selected['type_change']) && $tamplate_data_selected['type_change'] == $type_change ){ ?>
                        <option value="<?php echo $type_change ?>" selected="" ><?php echo $type_change_title; ?></option>
                                <?php }else{ ?>
                        <option value="<?php echo $type_change ?>" ><?php echo $type_change_title; ?></option> 
                                <?php } ?>
                            <?php } ?>
                    </select>
              </div>
          </td>
      </tr>
</table>

<table class="table table-bordered table-hover">
        <tbody>
              <tr>
                      <td class="text-left" width="20%">
                          <?php echo $entry_odmproyml_tamplate_data ?>
                      </td>
                      <td class="text-left" width="20%">
                          <?php if($tamplate_data_selected['id']){ ?>
                            <input placeholder="<?php echo $entry_odmproyml_tamplate_data_name ?>" name="odmproyml_tamplate_data_yml[name]" value="<?php echo $tamplate_data_selected['name'] ?>"  class="form-control" />
                          <?php }else{ ?>
                            <input placeholder="<?php echo $entry_odmproyml_tamplate_data_name ?>" name="odmproyml_tamplate_data_yml[name]" value="<?php echo $tamplate_data_name_new; ?>"  class="form-control" />
                          <?php } ?>
                      </td>
                      <td class="text-left">
                          <div class="input-group">
                              <select class="form-control" id="setTemplateDataTypeAction">
                                    
                                  <?php if($tamplate_data_selected['id']){ ?>
                                    <option value="save" ><?php echo $entry_odmproyml_tamplate_data_save; ?></option>
                                    <option value="update" selected=""><?php echo $entry_odmproyml_tamplate_data_update; ?></option>
                                    <option value="delete" ><?php echo $entry_odmproyml_tamplate_data_delete; ?></option>
                                  <?php }else{ ?>
                                    <option value="save" ><?php echo $entry_odmproyml_tamplate_data_save; ?></option>
                                    <option style="color: #ccc " value="update" ><?php echo $entry_odmproyml_tamplate_data_update; ?></option>
                                    <option style="color: #ccc " value="delete" ><?php echo $entry_odmproyml_tamplate_data_delete; ?></option>
                                  <?php } ?>
                                  
                              </select>
                          </div>
                      </td>
                      <td class="text-left">
                          <a id="setTemplateDataBtn" onclick="setTemplateData($('#setTemplateDataTypeAction').val())" class="btn btn-primary setTemplateDataBtn"><?php echo $entry_odmproyml_tamplate_data_save_tamplate_data ?></a>
                          <span id="setTemplateData" class="alert alert-info" style="display: none"></span>
                      </td>
                </tr>
          </tbody>
          
</table>
                      
<h2><?php echo $text_step_3_ending ?></h2>

<table class="table table-bordered table-hover">
        <tbody>
              <tr>
                      <td class="text-center" width="20%">
                          <a id="startImport" onclick="startImport($('input[name=\'odmproyml_tamplate_data_yml[start]\']').val());" class="btn btn-primary" style="width: 100%"><?php echo $text_step_3_start_import; ?></a>
                      </td>
                      <td class="text-left">
                          <input placeholder="<?php echo $text_step_3_start ?>" name="odmproyml_tamplate_data_yml[start]" value="<?php echo $tamplate_data_selected['start'] ?>"  class="form-control" />
                      </td>
                      <td class="text-left">
                          <input placeholder="<?php echo $text_step_3_limit ?>" name="odmproyml_tamplate_data_yml[limit]" value="<?php echo $tamplate_data_selected['limit'] ?>"  class="form-control" />
                      </td>
              </tr>
              <tr >
                  <td colspan="3" id="importStartMessages">
                      
                  </td>
              </tr>
        </tbody>
</table>

<?php }else{ ?>

    <?php echo $entry_odmproyml_format_data_empty; ?>

<?php } ?>


<script type="text/javascript"><!--
    function selectUnselect(class_css){
    
    if($(class_css).val()=="1"){
        $(class_css).val(0);
    }else{
        $(class_css).val(1);
    }
    
    return;

}
    
    var column_name_num = 0;

function addTypeDataColumnTableRow(type_process,template_id){

    var id_td = new Date().getTime();
    
    var column_name = 'column_'+column_name_num;
    
    column_name_num += 1;
    
    var html = '';
        html += '<tr id="type_data_column_'+id_td+'_table_row">';
        html +=  '<td class="text-left" width="20%">';
        html +=    '<input onchange="setNewTypesDataColumns(\''+column_name+'\',\''+id_td+'\',this.value,\''+type_process+'\',this.name,\''+template_id+'\');" value="'+column_name+'" class="form-control" name="odmproyml_tamplate_data_yml[export_field_name]['+template_id+']['+column_name+']">';
        html +=  '</td>';
        html +=  '<td class="text-left" width="20%">';
	html += 	  '<div class="input-group">';
        html += '<select onchange="getTypesDataColumns(this.value,\'#type_data_column_'+id_td+'\',\''+column_name+'\',\''+type_process+'\');" name="odmproyml_tamplate_data_yml[type_data]['+column_name+']"  class="form-control select-type-data">';
        html += '<option value="0" ><?php echo $text_type_data_ignor; ?></option>';
                
        <?php foreach($types_data as $type => $columns){ ?>
            html += '<option value="<?php echo $type ?>" ><?php echo ${'text_type_data_'.$type}; ?></option>';
        <?php } ?>
        
        html +=          '</select>';
        html += 	  '</div>';
        html +=  '</td>';
        html +=  '<td class="text-left" id="type_data_column_'+id_td+'">';
        html +=  '</td>';
	html += '<td class="text-left"><button type="button" onclick="$(\'#type_data_column_'+id_td+'_table_row\').remove();" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
        html += '</tr>';
        
        $('#addTypeDataColumnTableRow_'+type_process).before(html);
        
}
    
//--></script> 


<script type="text/javascript"><!--
    
    $(document).ready(function() {
        updateSaveButton();
    });
    
//--></script> 
<?php }else{ ?>
    <h3><?php echo $errors_odmproyml_title ?></h3>
    <?php foreach($errors as $error){ ?>
        <div class="alert alert-danger"><?php echo $error ?></div>
    <?php } ?>
<?php } ?>