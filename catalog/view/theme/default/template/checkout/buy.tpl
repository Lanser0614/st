<?php echo $header; ?>
<section class="container"><?php echo $column_left; ?><?php echo $column_right; ?>

<div id="content" class="ocpb-design-<?php echo $settings['buy_page_design']; ?>"><?php echo $content_top; ?>
  
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $i=>$breadcrumb){ if($i+1 < count($breadcrumbs)){ ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } else { echo $breadcrumb['text']; }} ?>
  </div>
  
  <div id="checkout-page">
  
  <?php if($settings['buy_page_design'] == 1) { ?>
      <h1><?php echo $heading_title; ?><?php if ($weight) echo '&nbsp;(' . $weight . ')'; ?></h1>
  <?php } ?>
  
        
    <style type="text/css">
                .ocpb-products td.image-td {width: <?php if($product_image_width > 100){ echo $product_image_width + 20; }else{ echo 100; }?>px;}
                .ocpb-products td.image-td {width: <?php if($product_image_width > 100){ echo $product_image_width + 20; }else{ echo 100; }?>px;}
                <?php if(!$settings['buy_oneclick']) { ?>
                .ocpb-design-2 #checkout-f {border-top: none;padding-top:0;}
                <?php } ?>
                <?php if(!$settings['buy_oneclick'] && $settings['buy_page_design'] == 3) { ?>
                .ocpb-design-3 #checkout-f {border-top: none;padding-top:0;}
                <?php } ?>
                <?php if($settings['buy_page_design'] == 1) { ?>
                .ocpb-products.with-coupon .total-item {display:table-row;}
                .ocpb-products .total-item.total-item-0 {font-size: 18px;font-weight: bold;display: table-row;}
                .ocpb-products.with-coupon .total-item.total-item-0 {font-size: inherit;font-weight: inherit;}
                <?php } ?>
    </style>
            
            
            
   <?php if ($attention) { ?><div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?></div><?php } ?>
   <?php if ($success) { ?><div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div><?php } ?>
   <?php if ($error_warning) { ?><div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div><?php } ?>


   

            
   <?php if($settings['buy_oneclick']){ ?>
            <div class="ocpb-oneclick">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3">
                        <?php echo html_entity_decode($buy_lang['oneclick_text'], ENT_QUOTES, 'UTF-8'); ?>
                        <div class="row">
                            <div class="col-sm-12 col-md-4 form-group">
                                <input type="text" name="firstname" value="" placeholder="<?php echo $buy_field_lang['oneclick_name']['text']; ?>" class="form-control">
                            </div>
                            <div class="col-sm-12 col-md-4 form-group">
                                <input type="text" name="telephone" value="" placeholder="<?php echo $buy_field_lang['oneclick_telephone']['text']; ?>" class="form-control">
                            </div>
                            <div class="col-sm-12 col-md-4 form-group">
                                <button id="button-oneclick" class="btn btn-block btn-success" data-loading-text="<?php echo $text_loading; ?>"><?php echo $buy_lang['oneclick_button']; ?></button>
                            </div>
                        </div>
                        <?php if ($settings['buy_oneclick_only'] && $text_agree) { ?>
                            <div class="ocpb-agree"><?php echo $text_agree; ?></div>
                        <?php } ?>
                    </div>
                </div>
            </div>
   <?php } ?>


   <?php if(!$settings['buy_oneclick_only']) { ?>
            <h2 id="checkout-f"><?php echo $buy_lang['h2']; ?></h2>
            <div id="checkout-form">
            <?php if($settings['buy_login'] && !$customer_logged){ ?>
            <div class="row customer-type">
                <div class="col-xs-12 text-center">
                    <ul>
                        <li>
                            <label class="checked"><input type="radio" name="new_customer" value="1" style="display: none;" /> <?php echo $buy_lang['new_customer']; ?></label>
                            <label><input type="radio" name="new_customer" value="0" style="display: none;" /> <?php echo $buy_lang['old_customer']; ?></label>
                        </li>
                    </ul>
                </div>
            </div>
            
            <div class="ocpb-login-form">
                <form action="<?php echo $login_action; ?>" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                        <input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
                        <input type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                        
                    </div>
                    <div class="form-group row">
                        <div class="col-xs-6"><input type="submit" value="<?php echo $text_login_btn; ?>" class="btn btn-primary"></div>
                        <div class="col-xs-6 text-right"><a href="<?php echo $forgotten_link; ?>"><?php echo $text_forgotten; ?></a></div>
                    </div>
                    <input type="hidden" name="redirect" value="<?php echo $login_redirect; ?>" />
                </form>
            </div>
            <div class="ocpb-login-bg"></div>
   <?php } ?>

   
   <div class="row main-form<?php if(!$settings['buy_form_design']) echo ' right-left'; ?>">
     <div class="<?php echo $settings['buy_form_design']?'col-sm-6 col-sm-offset-3':'col-sm-6' ?>">
     
                    <?php if($settings['buy_form_headings']){ ?><h2><?php echo $buy_lang['heading_1']; ?></h2><?php } ?>
           <fieldset style="margin-bottom:40px;">
                    <div class="form-group" style="display: <?php echo (count($customer_groups) > 1 ? 'block' : 'none'); ?>;">
                        <label class="control-label"><?php echo $entry_customer_group; ?></label>
                        <?php foreach ($customer_groups as $customer_group) { ?>
                            <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
                                        <?php echo $customer_group['name']; ?></label>
                                </div>
                            <?php } else { ?>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" />
                                        <?php echo $customer_group['name']; ?></label>
                                </div>
                            <?php } ?>
                        <?php } ?>
                    </div>
                    <?php if($settings['buy_firstname_status']){ ?>
                    <div class="form-group<?php if($settings['buy_firstname_required']){ ?> required<?php } ?>">
                        <label class="control-label" for="input-payment-firstname"><?php echo $buy_field_lang['firstname']['text']; ?></label>
                        <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $buy_field_lang['firstname']['placeholder']; ?>" id="input-payment-firstname" class="form-control" />
                    </div>
                    <?php } ?>
                    <?php if($settings['buy_lastname_status']){ ?>
                    <div class="form-group<?php if($settings['buy_lastname_required']){ ?> required<?php } ?>">
                        <label class="control-label" for="input-payment-lastname"><?php echo $buy_field_lang['lastname']['text']; ?></label>
                        <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $buy_field_lang['lastname']['placeholder']; ?>" id="input-payment-lastname" class="form-control" />
                    </div>
                    <?php } ?>
                    <?php if($settings['buy_email_status']){ ?>
                    <div class="form-group email<?php if($settings['buy_email_required'] || $settings['buy_register_required'] || $register){ ?> required<?php } ?>">
                        <label class="control-label" for="input-payment-email"><?php echo $buy_field_lang['email']['text']; ?></label>
                        <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $buy_field_lang['email']['placeholder']; ?>" id="input-payment-email" class="form-control" />
                    </div>
                    <?php } ?>
                    <?php if($settings['buy_telephone_status']){ ?>
                    <div class="form-group<?php if($settings['buy_telephone_required']){ ?> required<?php } ?>">
                        <label class="control-label" for="input-payment-telephone"><?php echo $buy_field_lang['telephone']['text']; ?></label>
                        <input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $buy_field_lang['telephone']['placeholder']; ?>" id="input-payment-telephone" class="form-control" />
                    </div>
                    <?php } ?>
                    <?php if($settings['buy_fax_status']){ ?>
                    <div class="form-group<?php if($settings['buy_fax_required']){ ?> required<?php } ?>">
                        <label class="control-label" for="input-payment-fax"><?php echo $buy_field_lang['fax']['text']; ?></label>
                        <input type="text" name="fax" value="<?php echo $fax; ?>" placeholder="<?php echo $buy_field_lang['fax']['placeholder']; ?>" id="input-payment-fax" class="form-control" />
                    </div>
                    <?php } ?>
                    <?php if($settings['buy_company_status']){ ?>
                    <div class="form-group<?php if($settings['buy_company_required']){ ?> required<?php } ?>">
                        <label class="control-label" for="input-payment-company"><?php echo $buy_field_lang['company']['text']; ?></label>
                        <input type="text" name="company" value="<?php echo $company; ?>" placeholder="<?php echo $buy_field_lang['company']['placeholder']; ?>" id="input-payment-company" class="form-control" />
                    </div>
                    <?php } ?>
                    <?php foreach ($custom_fields as $custom_field) { ?>
                        <?php if ($custom_field['location'] == 'account') { ?>
                            <?php if ($custom_field['type'] == 'select') { ?>
                                <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <select name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                                        <option value=""><?php echo $text_select; ?></option>
                                        <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                                            <?php if (isset($guest_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $guest_custom_field[$custom_field['custom_field_id']]) { ?>
                                                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                                            <?php } else { ?>
                                                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'radio') { ?>
                                <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="control-label"><?php echo $custom_field['name']; ?></label>
                                    <div id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>">
                                        <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                                            <div class="radio">
                                                <?php if (isset($guest_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $guest_custom_field[$custom_field['custom_field_id']]) { ?>
                                                    <label>
                                                        <input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                                                        <?php echo $custom_field_value['name']; ?></label>
                                                <?php } else { ?>
                                                    <label>
                                                        <input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                                                        <?php echo $custom_field_value['name']; ?></label>
                                                <?php } ?>
                                            </div>
                                        <?php } ?>
                                    </div>
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'checkbox') { ?>
                                <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="control-label"><?php echo $custom_field['name']; ?></label>
                                    <div id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>">
                                        <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                                            <div class="checkbox">
                                                <?php if (isset($guest_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $guest_custom_field[$custom_field['custom_field_id']])) { ?>
                                                    <label>
                                                        <input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                                                        <?php echo $custom_field_value['name']; ?></label>
                                                <?php } else { ?>
                                                    <label>
                                                        <input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                                                        <?php echo $custom_field_value['name']; ?></label>
                                                <?php } ?>
                                            </div>
                                        <?php } ?>
                                    </div>
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'text') { ?>
                                <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'textarea') { ?>
                                <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <textarea name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'file') { ?>
                                <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="control-label"><?php echo $custom_field['name']; ?></label>
                                    <br />
                                    <button type="button" id="button-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                                    <input type="hidden" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : ''); ?>" />
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'date') { ?>
                                <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <div class="input-group date">
                                        <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-format="YYYY-MM-DD" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                        </span></div>
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'time') { ?>
                                <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <div class="input-group time">
                                        <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-format="HH:mm" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                        </span></div>
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'datetime') { ?>
                                <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <div class="input-group datetime">
                                        <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-format="YYYY-MM-DD HH:mm" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                        </span></div>
                                </div>
                            <?php } ?>
                        <?php } ?>
                    <?php } ?>
                    <?php if($settings['buy_register_status'] && !$settings['buy_register_required'] && !$customer_logged){ ?>
                    <div class="form-group checkbox">
                        <label><input type="checkbox" name="register" value="1"<?php if($register) { ?> checked<?php } ?> /> <?php echo $buy_field_lang['register']['text']; ?></label>
                    </div>
                    <?php } ?>
                    <?php if($settings['buy_register_status'] && !$customer_logged){ ?>
                        <fieldset class="register-fields<?php if(!$settings['buy_register_required'] && !$register){ ?> hidden<?php } ?>">
                            <?php if($settings['buy_register_required']){ ?>
                            <legend><?php echo $buy_field_lang['register']['text']; ?></legend>
                            <input type="hidden" name="register" value="1" />
                            <?php } ?>
                            <div class="form-group required">
                                <label class="control-label" for="input-password1"><?php echo $buy_field_lang['password1']['text']; ?></label>
                                <input type="password" name="password1" value="" placeholder="<?php echo $buy_field_lang['password1']['placeholder']; ?>" id="input-password1" class="form-control" />
                            </div>
                            <div class="form-group required">
                                <label class="control-label" for="input-password2"><?php echo $buy_field_lang['password2']['text']; ?></label>
                                <input type="password" name="password2" value="" placeholder="<?php echo $buy_field_lang['password2']['placeholder']; ?>" id="input-password2" class="form-control" />
                            </div>
                        </fieldset>

                    <?php } ?>
           </fieldset>

    
        
        <?php if($settings['buy_shipping_select']){ ?>
                    
             <?php if($settings['buy_form_headings']){ ?><h2><?php echo $buy_lang['heading_2']; ?></h2><?php } ?>
                    
             <div id="shipping-methods"></div>
        <?php }else{ ?>
             <div id="shipping-methods"></div>
             <div class="hidden"><input type="radio" name="shipping_method" value="flat.flat" checked="checked"></div>
        <?php } ?>
    
    
  
                    <h2>3. Укажите адрес (не требуется при самовывозе)</h2>
                    
                    <fieldset style="margin-bottom:40px;">
                    <?php if($settings['buy_country_status']){ ?>
                    <div class="form-group<?php if($settings['buy_country_required']){ ?> required<?php } ?>" id="payment-country">
                        <label class="control-label" for="input-payment-country"><?php echo $buy_field_lang['country']['text']; ?></label>
                        <select name="country_id" id="input-payment-country" class="form-control">
                            <option value=""><?php echo $text_select; ?></option>
                            <?php foreach ($countries as $country) { ?>
                                <?php if ($country['country_id'] == $country_id) { ?>
                                    <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                                <?php } else { ?>
                                    <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                                <?php } ?>
                            <?php } ?>
                        </select>
                    </div>
                    <?php }else{ ?>
                    <div class="hidden">
                        <select name="country_id">
                            <option value="<?php echo $country_id; ?>" selected="selected"></option>
                        </select>
                    </div>
                    <?php } ?>
                    <?php if($settings['buy_zone_status']){ ?>
                    <div class="form-group has-feedback<?php if($settings['buy_zone_required']){ ?> required<?php } ?>" id="payment-zone">
                        <label class="control-label" for="input-payment-zone"><?php echo $buy_field_lang['zone']['text']; ?></label>
                        <select name="zone_id" id="input-payment-zone" class="form-control">
                        </select>
                    </div>
                    <?php }else{ ?>
                    <div class="hidden">
                        <select name="zone_id">
                            <option value="<?php echo $zone_id; ?>" selected="selected"></option>
                        </select>
                    </div>
                    <?php } ?>
                    <?php if($settings['buy_city_status']){ ?>
                    <div class="form-group<?php if($settings['buy_city_required']){ ?> required<?php } ?>">
                        <label class="control-label" for="input-payment-city"><?php echo $buy_field_lang['city']['text']; ?></label>
                        <input type="text" name="city" value="<?php echo $city; ?>" placeholder="<?php echo $buy_field_lang['city']['placeholder']; ?>" id="input-payment-city" class="form-control" />
                    </div>
                    <?php } ?>
                    <?php if($settings['buy_postcode_status']){ ?>
                    <div class="form-group<?php if($settings['buy_postcode_required']){ ?> required<?php } ?>">
                        <label class="control-label" for="input-payment-postcode"><?php echo $buy_field_lang['postcode']['text']; ?></label>
                        <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $buy_field_lang['postcode']['placeholder']; ?>" id="input-payment-postcode" class="form-control" />
                    </div>
                    <?php } ?>
                    <?php if($settings['buy_address_1_status']){ ?>
                    <div class="form-group<?php if($settings['buy_address_1_required']){ ?> required<?php } ?>">
                        <label class="control-label" for="input-payment-address-1"><?php echo $buy_field_lang['address_1']['text']; ?></label>
                        <input type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="<?php echo $buy_field_lang['address_1']['placeholder']; ?>" id="input-payment-address-1" class="form-control" />
                    </div>
                    <?php } ?>
                    <?php if($settings['buy_address_2_status']){ ?>
                    <div class="form-group<?php if($settings['buy_address_2_required']){ ?> required<?php } ?>">
                        <label class="control-label" for="input-payment-address-2"><?php echo $buy_field_lang['address_2']['text']; ?></label>
                        <input type="text" name="address_2" value="<?php echo $address_2; ?>" placeholder="<?php echo $buy_field_lang['address_2']['placeholder']; ?>" id="input-payment-address-2" class="form-control" />
                    </div>
                    <?php } ?>
                    <?php foreach ($custom_fields as $custom_field) { ?>
                        <?php if ($custom_field['location'] == 'address') { ?>
                            <?php if ($custom_field['type'] == 'select') { ?>
                                <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <select name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                                        <option value=""><?php echo $text_select; ?></option>
                                        <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                                            <?php if (isset($guest_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $guest_custom_field[$custom_field['custom_field_id']]) { ?>
                                                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                                            <?php } else { ?>
                                                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'radio') { ?>
                                <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="control-label"><?php echo $custom_field['name']; ?></label>
                                    <div id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>">
                                        <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                                            <div class="radio">
                                                <?php if (isset($guest_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $guest_custom_field[$custom_field['custom_field_id']]) { ?>
                                                    <label>
                                                        <input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                                                        <?php echo $custom_field_value['name']; ?></label>
                                                <?php } else { ?>
                                                    <label>
                                                        <input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                                                        <?php echo $custom_field_value['name']; ?></label>
                                                <?php } ?>
                                            </div>
                                        <?php } ?>
                                    </div>
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'checkbox') { ?>
                                <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="control-label"><?php echo $custom_field['name']; ?></label>
                                    <div id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>">
                                        <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                                            <div class="checkbox">
                                                <?php if (isset($guest_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $guest_custom_field[$custom_field['custom_field_id']])) { ?>
                                                    <label>
                                                        <input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                                                        <?php echo $custom_field_value['name']; ?></label>
                                                <?php } else { ?>
                                                    <label>
                                                        <input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                                                        <?php echo $custom_field_value['name']; ?></label>
                                                <?php } ?>
                                            </div>
                                        <?php } ?>
                                    </div>
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'text') { ?>
                                <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'textarea') { ?>
                                <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <textarea name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'file') { ?>
                                <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="control-label"><?php echo $custom_field['name']; ?></label>
                                    <br />
                                    <button type="button" id="button-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                                    <input type="hidden" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : ''); ?>" />
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'date') { ?>
                                <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <div class="input-group date">
                                        <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-format="YYYY-MM-DD" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                        </span></div>
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'time') { ?>
                                <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <div class="input-group time">
                                        <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-format="HH:mm" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                        </span></div>
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'datetime') { ?>
                                <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <div class="input-group datetime">
                                        <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-format="YYYY-MM-DD HH:mm" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                        </span></div>
                                </div>
                            <?php } ?>
                        <?php } ?>
                    <?php } ?>
            </fieldset>
                    
                    
                    
                    
            <?php if($settings['buy_payment_select']){ ?>
                    
                    <?php if($settings['buy_form_headings']) { ?><h2><?php echo $buy_lang['heading_3']; ?></h2><?php } ?>
                    
                    <div id="payment-methods"></div>
            <?php }else{ ?>
                        <div class="hidden"><input type="radio" name="payment_method" value="cod" checked="checked"></div>
            <?php } ?>


            
            <?php if($settings['buy_comment_status']){ ?>
                    <div class="form-group<?php if($settings['buy_comment_required']){ ?> required<?php } ?>">
                        <label class="control-label" for="input-comment"><?php echo $buy_field_lang['comment']['text']; ?></label>
                        <textarea name="comment" rows="3" class="form-control" id="input-comment" placeholder="<?php echo $buy_field_lang['comment']['placeholder']; ?>"><?php echo $comment; ?></textarea>
                    </div>
            <?php } ?>
                    
                    
          
                    
                    
                        
                    <div id="product-bottom"><?php include('buy_product.tpl'); ?></div>
                    
                    <div class="ocpb-buttons">
                        <div class="text-center">
                            <input type="button" value="<?php echo $buy_lang['checkout_button']; ?>" id="button-order" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-success btn-lg" />
                            <?php if ($text_agree) { ?><div class="ocpb-agree"><?php echo $text_agree; ?></div><?php } ?>
                        </div>
                        <div id="payment-form"></div>
                    </div>
                    
                    


    <?php if(!$settings['buy_form_design']){ ?>
       </div>
       <div class="col-sm-6">
    <?php } ?>


   <?php include('buy_product.tpl'); ?>
    
                    
                </div>
            </div>


            <?php if($settings['buy_page_design'] == 2) { ?>
                <?php include('buy_product.tpl'); ?>
                <div class="ocpb-totals">
                    <table class="table">
                        <tbody></tbody>
                    </table>
                </div>
                    <div class="ocpb-buttons">
                            <div class="text-center">
                                <input type="button" value="<?php echo $buy_lang['checkout_button']; ?>" id="button-order" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-success btn-lg" />
                                <?php if ($text_agree) { ?><div class="ocpb-agree"><?php echo $text_agree; ?></div><?php } ?>
                            </div>
                            <div id="payment-form"></div>
                    </div>
            <?php } ?>
            
            </div>
            <?php } ?>



  </div>

  <?php echo $content_bottom; ?>
</div>
</section>

<script type="text/javascript"><!--
    var ocpb_params = {
        "zone_id":"<?php echo $zone_id; ?>",
        "zone_status":"<?php echo $settings['buy_zone_status'] ? 1 : 0; ?>",
        "customer_logged":<?php echo $customer_logged ? 1 : 0; ?>,
        "email_required":<?php echo $settings['buy_email_required'] ? 1 : 0; ?>,
        "shipping_select":<?php echo $settings['buy_shipping_select'] ? 1 : 0; ?>,
        "payment_select":<?php echo $settings['buy_payment_select'] ? 1 : 0; ?>,
        "clear_show":<?php echo $settings['buy_clear_show'] ? 1 : 0; ?>,
        "prod_count":<?php echo count($products); ?>,
        "telephone_mask":"<?php echo $settings['buy_telephone_mask']; ?>",
        "text_cart_clear":"<?php echo $text_cart_clear; ?>",
        "text_select":"<?php echo $text_select; ?>",
        "text_coupon_success":"<?php echo $text_coupon_success; ?>",
        "text_voucher_success":"<?php echo $text_voucher_success; ?>",
        "module_address":"checkout/buy",
        "required_custom_fields" : [<?php echo $required_custom_fields; ?>],
    };
//--></script>
<?php echo $footer; ?>