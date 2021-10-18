<!--
##=====================================================================##
## @author    : OCdevWizard                                            ##
## @contact   : ocdevwizard@gmail.com                                  ##
## @support   : http://help.ocdevwizard.com                            ##
## @license   : http://license.ocdevwizard.com/Licensing_Policy.pdf    ##
## @copyright : (c) OCdevWizard. Smart Notification Bar Pro Plus, 2017 ##
##=====================================================================##
-->
<div class="modal-content" id="modal-form-constructor-content">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span>&times;</span></button>
    <h4 class="modal-title" id="myModalLabel"><?php echo $text_form; ?></h4>
  </div>
  <div class="modal-body">
    <div id="content" class="row" style="padding-bottom: 0;">
      <div class="panel-body" style="padding-top: 0;padding-bottom: 0;">
        <ul class="nav nav-tabs" id="modal-setting-tabs">
          <li class="active dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-cog"></i> <?php echo $tab_control_panel; ?> <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="#modal-general-block" data-toggle="tab"><i class="fa fa-cogs"></i> <?php echo $tab_general_setting; ?></a></li>
              <li><a href="#modal-layout-block" data-toggle="tab"><i class="fa fa-eye"></i> <?php echo $tab_layout_setting; ?></a></li>
              <li><a href="#modal-marketing-tools-block" data-toggle="tab"><i class="fa fa-cog" aria-hidden="true"></i> <?php echo $tab_marketing_tools_setting; ?></a></li>
            </ul>
          </li>
          <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-language"></i> <?php echo $tab_language_setting; ?> <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="#modal-language-block" data-toggle="tab"><i class="fa fa-flag-o"></i> <?php echo $tab_basic_language_setting; ?></a></li>
            </ul>
          </li>
        </ul>
        <form method="post" enctype="multipart/form-data" id="modal-form" class="form-horizontal">
          <input type="hidden" style="display:none;" name="form_id" value="<?php echo $form_id; ?>" />
          <div class="tab-content">
            <!-- TAB Modal General block -->
            <div class="tab-pane fade active in" role="tabpanel" id="modal-general-block">
              <div class="form-group">
                <label class="col-sm-3 control-label" for="input-status"><?php echo $text_activate_module; ?></label>
                <div class="col-sm-9">
                  <select name="status" id="input-status" class="form-control">
                    <?php if ($status) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-3 control-label" for="input-heading"><?php echo $text_module_heading; ?></label>
                <div class="col-sm-9">
                  <input value="<?php echo $heading; ?>" type="text" name="heading" class="form-control"/>
                  <div class="modal-error-block" id="modal-error-heading"></div>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-3 control-label"><?php echo $text_stores; ?></label>
                <div class="col-sm-9">
                  <?php $row_height = 55; $row = 0; foreach ($all_stores as $store) { ?>
                  <?php if ($row < 5) { $row_height = $row_height*1.26; } $row++; ?>
                  <?php } ?>
                  <div class="well well-sm" style="height: <?php echo $row_height; ?>px; overflow: auto;">
                    <?php foreach ($all_stores as $store) { ?>
                    <div class="checkbox">
                      <label>
                        <input
                          type="checkbox"
                          name="stores[]"
                          value="<?php echo $store['store_id']; ?>" <?php echo (!empty($stores) && in_array($store['store_id'], $stores)) ? 'checked' : ''; ?>
                        /> <?php echo $store['name']; ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                  <div class="btn-group">
                    <button type="button" class="btn btn-default btn-xs" onclick="$(this).parent().parent().find(':checkbox').trigger('click').attr('checked', true);"><?php echo $text_select_all; ?></button>
                    <button type="button" class="btn btn-default btn-xs" onclick="$(this).parent().parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></button>
                  </div>
                  <div class="modal-error-block" id="modal-error-stores"></div>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_stores_faq; ?></div>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-3 control-label"><?php echo $text_customer_groups; ?></label>
                <div class="col-sm-9">
                  <?php $row_height = 55; $row = 0; foreach ($all_customer_groups as $customer_group) { ?>
                  <?php if ($row < 5) { $row_height = $row_height*1.26; } $row++; ?>
                  <?php } ?>
                  <div class="well well-sm" style="height: <?php echo $row_height; ?>px; overflow: auto;">
                    <?php foreach ($all_customer_groups as $customer_group) { ?>
                    <div class="checkbox">
                      <label>
                        <input
                          type="checkbox"
                          name="customer_groups[]"
                          value="<?php echo $customer_group['customer_group_id']; ?>" <?php echo (!empty($customer_groups) && in_array($customer_group['customer_group_id'], $customer_groups)) ? 'checked' : ''; ?>
                        /> <?php echo $customer_group['name']; ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                  <div class="btn-group">
                    <button type="button" class="btn btn-default btn-xs" onclick="$(this).parent().parent().find(':checkbox').trigger('click').attr('checked', true);"><?php echo $text_select_all; ?></button>
                    <button type="button" class="btn btn-default btn-xs" onclick="$(this).parent().parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></button>
                  </div>
                  <div class="modal-error-block" id="modal-error-customer-groups"></div>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_customer_groups_faq; ?></div>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-3 control-label"><?php echo $text_layouts; ?></label>
                <div class="col-sm-9">
                  <?php $row_height = 55; $row = 0; foreach ($all_layouts as $layout) { ?>
                  <?php if ($row < 5) { $row_height = $row_height*1.26; } $row++; ?>
                  <?php } ?>
                  <div class="well well-sm" style="height: <?php echo $row_height; ?>px; overflow: auto;">
                    <?php foreach ($all_layouts as $layout) { ?>
                    <div class="checkbox">
                      <label>
                        <input
                          type="checkbox"
                          name="layouts[]"
                          value="<?php echo $layout['layout_id']; ?>" <?php echo (!empty($layouts) && in_array($layout['layout_id'], $layouts)) ? 'checked' : ''; ?>
                        /> <?php echo $layout['name']; ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                  <div class="btn-group">
                    <button type="button" class="btn btn-default btn-xs" onclick="$(this).parent().parent().find(':checkbox').trigger('click').attr('checked', true);"><?php echo $text_select_all; ?></button>
                    <button type="button" class="btn btn-default btn-xs" onclick="$(this).parent().parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></button>
                  </div>
                  <div class="modal-error-block" id="modal-error-layouts"></div>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_layouts_faq; ?></div>
                </div>
              </div>
              <div class="form-group pro-block">
                <label class="col-sm-3 control-label"><?php echo $text_improved_selection; ?></label>
                <div class="col-sm-9">
                  <select name="mixed_data_type" class="form-control">
                    <?php if ($mixed_data_type == 1) { ?>
                      <option value="0"><?php echo $text_disabled; ?></option>
                      <option value="1" selected="selected"><?php echo $text_improved_selection_1; ?></option>
                      <option value="2"><?php echo $text_improved_selection_2; ?></option>
                      <option value="3"><?php echo $text_improved_selection_3; ?></option>
                      <option value="4"><?php echo $text_improved_selection_4; ?></option>
                    <?php } elseif ($mixed_data_type == 2) { ?>
                      <option value="0"><?php echo $text_disabled; ?></option>
                      <option value="1"><?php echo $text_improved_selection_1; ?></option>
                      <option value="2" selected="selected"><?php echo $text_improved_selection_2; ?></option>
                      <option value="3"><?php echo $text_improved_selection_3; ?></option>
                      <option value="4"><?php echo $text_improved_selection_4; ?></option>
                    <?php } elseif ($mixed_data_type == 3) { ?>
                      <option value="0"><?php echo $text_disabled; ?></option>
                      <option value="1"><?php echo $text_improved_selection_1; ?></option>
                      <option value="2"><?php echo $text_improved_selection_2; ?></option>
                      <option value="3" selected="selected"><?php echo $text_improved_selection_3; ?></option>
                      <option value="4"><?php echo $text_improved_selection_4; ?></option>
                    <?php } elseif ($mixed_data_type == 4) { ?>
                      <option value="0"><?php echo $text_disabled; ?></option>
                      <option value="1"><?php echo $text_improved_selection_1; ?></option>
                      <option value="2"><?php echo $text_improved_selection_2; ?></option>
                      <option value="3"><?php echo $text_improved_selection_3; ?></option>
                      <option value="4" selected="selected"><?php echo $text_improved_selection_4; ?></option>
                    <?php } else { ?>
                      <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                      <option value="1"><?php echo $text_improved_selection_1; ?></option>
                      <option value="2"><?php echo $text_improved_selection_2; ?></option>
                      <option value="3"><?php echo $text_improved_selection_3; ?></option>
                      <option value="4"><?php echo $text_improved_selection_4; ?></option>
                    <?php } ?>
                  </select>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_improved_selection_faq; ?></div>
                </div>
              </div>
              <div class="form-group mixed-data-type-1">
                <label class="col-sm-3 control-label" for="input-product"><?php echo $text_show_in_products; ?></label>
                <div class="col-sm-9">
                  <input type="text" name="product" value="" placeholder="<?php echo $text_product_ph; ?>" id="input-product" class="form-control" />
                  <div id="product-filter" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($all_products as $product) { ?>
                    <div id="product-filter<?php echo $product['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product['name']; ?>
                      <input type="hidden" name="mixed_data_products[]" value="<?php echo $product['product_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group mixed-data-type-2">
                <label class="col-sm-3 control-label" for="input-category"><?php echo $text_show_in_categories; ?></label>
                <div class="col-sm-9">
                  <input type="text" name="category" value="" placeholder="<?php echo $text_category_ph; ?>" id="input-category" class="form-control" />
                  <div id="category-filter" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($all_categories as $category) { ?>
                    <div id="category-filter<?php echo $category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $category['name']; ?>
                      <input type="hidden" name="mixed_data_categories[]" value="<?php echo $category['category_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group mixed-data-type-3">
                <label class="col-sm-3 control-label" for="input-manufacturer"><?php echo $text_show_in_brands; ?></label>
                <div class="col-sm-9">
                  <input type="text" name="manufacturer" value="" placeholder="<?php echo $text_brand_ph; ?>" id="input-manufacturer" class="form-control" />
                  <div id="manufacturer-filter" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($all_manufacturers as $manufacturer) { ?>
                    <div id="manufacturer-filter<?php echo $manufacturer['manufacturer_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $manufacturer['name']; ?>
                      <input type="hidden" name="mixed_data_manufacturers[]" value="<?php echo $manufacturer['manufacturer_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group mixed-data-type-4">
                <label class="col-sm-3 control-label" for="input-information"><?php echo $text_show_in_informations; ?></label>
                <div class="col-sm-9">
                  <input type="text" name="information" value="" placeholder="<?php echo $text_information_ph; ?>" id="input-information" class="form-control" />
                  <div id="information-filter" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($all_informations as $information) { ?>
                    <div id="information-filter<?php echo $information['information_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $information['title']; ?>
                      <input type="hidden" name="mixed_data_informations[]" value="<?php echo $information['information_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $text_display_frequency; ?></label>
                <div class="col-sm-9">
                  <select name="display_frequency" class="form-control">
                    <?php if ($display_frequency == 1) { ?>
                      <option value="1" selected="selected"><?php echo $text_display_frequency_1; ?></option>
                      <option value="2"><?php echo $text_display_frequency_2; ?></option>
                      <option value="3"><?php echo $text_display_frequency_3; ?></option>
                    <?php } elseif ($display_frequency == 2) { ?>
                      <option value="1"><?php echo $text_display_frequency_1; ?></option>
                      <option value="2" selected="selected"><?php echo $text_display_frequency_2; ?></option>
                      <option value="3"><?php echo $text_display_frequency_3; ?></option>
                    <?php } else { ?>
                      <option value="1"><?php echo $text_display_frequency_1; ?></option>
                      <option value="2"><?php echo $text_display_frequency_2; ?></option>
                      <option value="3" selected="selected"><?php echo $text_display_frequency_3; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group required display-frequency-3">
                <label class="col-sm-3 control-label" for="input-display_frequency_days"><?php echo $text_display_frequency_days; ?></label>
                <div class="col-sm-9">
                  <div class="input-group">
                    <input value="<?php echo $display_frequency_days; ?>" type="text" name="display_frequency_days" class="form-control" id="input-display_frequency_days" />
                    <span class="input-group-addon"><?php echo $text_days_indicator; ?></span>
                  </div>
                  <div class="modal-error-block" id="modal-error-display-frequency-days"></div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label" for="input-date_status"><?php echo $text_date_status; ?></label>
                <div class="col-sm-9">
                  <select name="date_status" id="input-date_status" class="form-control">
                    <?php if ($date_status) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group date-period-status">
                <label class="col-sm-3 control-label"><?php echo $text_date_period; ?></label>
                <div class="col-sm-9">
                  <div class="input-group datetime">
                    <input type="text" name="date_period_start" value="<?php echo $date_period_start; ?>" class="form-control" />
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                    </span>
                  </div>
                  <div class="modal-error-block" id="modal-error-date-period-start"></div>
                  <div class="input-group datetime" style="margin-top:10px;">
                    <input type="text" name="date_period_end" value="<?php echo $date_period_end; ?>" class="form-control" />
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                    </span>
                  </div>
                  <div class="modal-error-block" id="modal-error-date-period-end"></div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $text_module_trigger; ?></label>
                <div class="col-sm-9">
                  <select name="module_trigger" class="form-control">
                    <?php if ($module_trigger == 1) { ?>
                      <option value="1" selected="selected"><?php echo $text_module_trigger_1; ?></option>
                      <option value="2"><?php echo $text_module_trigger_2; ?></option>
                      <option value="3"><?php echo $text_module_trigger_3; ?></option>
                      <option value="4"><?php echo $text_module_trigger_4; ?></option>
                    <?php } elseif ($module_trigger == 2) { ?>
                      <option value="1"><?php echo $text_module_trigger_1; ?></option>
                      <option value="2" selected="selected"><?php echo $text_module_trigger_2; ?></option>
                      <option value="3"><?php echo $text_module_trigger_3; ?></option>
                      <option value="4"><?php echo $text_module_trigger_4; ?></option>
                    <?php } elseif ($module_trigger == 3) { ?>
                      <option value="1"><?php echo $text_module_trigger_1; ?></option>
                      <option value="2"><?php echo $text_module_trigger_2; ?></option>
                      <option value="3" selected="selected"><?php echo $text_module_trigger_3; ?></option>
                      <option value="4"><?php echo $text_module_trigger_4; ?></option>
                    <?php } else { ?>
                      <option value="1"><?php echo $text_module_trigger_1; ?></option>
                      <option value="2"><?php echo $text_module_trigger_2; ?></option>
                      <option value="3"><?php echo $text_module_trigger_3; ?></option>
                      <option value="4" selected="selected"><?php echo $text_module_trigger_4; ?></option>
                    <?php } ?>
                  </select>
                  <div class="alert alert-info module-trigger-1" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_module_trigger_faq_1; ?></div>
                  <div class="alert alert-info module-trigger-2" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_module_trigger_faq_2; ?></div>
                  <div class="alert alert-info module-trigger-3" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_module_trigger_faq_3; ?></div>
                  <div class="alert alert-info module-trigger-4" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_module_trigger_faq_4; ?></div>
                </div>
              </div>
              <div class="form-group required module-trigger-3">
                <label class="col-sm-3 control-label" for="input-module_trigger_target"><?php echo $text_module_trigger_target; ?></label>
                <div class="col-sm-9">
                  <div class="input-group">
                    <span class="input-group-addon"><?php echo $text_mixed_indicator; ?></span>
                    <input value="<?php echo $module_trigger_target; ?>" type="text" name="module_trigger_target" class="form-control" id="input-module_trigger_target" />
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button" data-faq-target="faq_1" data-toggle="tooltip" title="<?php echo $text_open_example; ?>"><i class="fa fa-info-circle"></i></button>
                    </span>
                  </div>
                  <div class="modal-error-block" id="modal-error-module-trigger-target"></div>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_module_trigger_target_faq; ?></div>
                </div>
              </div>
              <div class="form-group required module-trigger-4">
                <label class="col-sm-3 control-label" for="input-module_trigger_scroll_value"><?php echo $text_module_trigger_scroll_value; ?></label>
                <div class="col-sm-9">
                  <div class="input-group">
                    <input value="<?php echo $module_trigger_scroll_value; ?>" type="text" name="module_trigger_scroll_value" class="form-control" id="input-module_trigger_scroll_value" />
                    <span class="input-group-addon"><?php echo $text_percent_indicator; ?></span>
                  </div>
                  <div class="modal-error-block" id="modal-error-module-trigger-scroll-value"></div>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-3 control-label" for="input-insert_module"><?php echo $text_insert_module; ?></label>
                <div class="col-sm-9">
                  <div class="input-group">
                    <span class="input-group-addon"><?php echo $text_mixed_indicator; ?></span>
                    <input value="<?php echo $insert_module; ?>" type="text" name="insert_module" class="form-control" id="input-insert_module" />
                  </div>
                  <div class="modal-error-block" id="modal-error-insert-module"></div>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_insert_module_faq; ?></div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label" for="input-module_class"><?php echo $text_module_class; ?></label>
                <div class="col-sm-9">
                  <div class="input-group">
                    <span class="input-group-addon"><?php echo $text_css_class_indicator; ?></span>
                    <input value="<?php echo $module_class; ?>" type="text" name="module_class" class="form-control" />
                  </div>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_module_class_faq; ?></div>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-3 control-label" for="input-show_delay"><?php echo $text_show_delay; ?></label>
                <div class="col-sm-9">
                  <div class="input-group">
                    <input value="<?php echo $show_delay; ?>" type="text" name="show_delay" class="form-control" id="input-show_delay" />
                    <span class="input-group-addon"><?php echo $text_seconds_indicator; ?></span>
                  </div>
                  <div class="modal-error-block" id="modal-error-show-delay"></div>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_show_delay_faq; ?></div>
                </div>
              </div>
              <div class="form-group required" <?php if (!$form_id) { ?>style="display: none;"<?php } ?>>
                <label class="col-sm-3 control-label" for="input-module_id_selector"><?php echo $text_module_id_selector; ?></label>
                <div class="col-sm-9">
                  <div class="input-group">
                    <span class="input-group-addon"><?php echo $text_css_id_indicator; ?></span>
                    <input value="<?php echo $module_id_selector; ?>" type="text" name="module_id_selector" class="form-control" readonly/>
                  </div>
                  <div class="modal-error-block" id="modal-error-module-id-selector"></div>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_module_id_selector_faq; ?></div>
                </div>
              </div>
              <div class="form-group pro-block">
                <label class="col-sm-3 control-label"><?php echo $text_custom_js; ?></label>
                <div class="col-sm-9">
                  <select name="custom_js" class="form-control">
                    <?php if ($custom_js == 1) { ?>
                      <option value="0"><?php echo $text_disabled; ?></option>
                      <option value="1" selected="selected"><?php echo $text_custom_js_1; ?></option>
                      <option value="2"><?php echo $text_custom_js_2; ?></option>
                      <option value="3"><?php echo $text_custom_js_3; ?></option>
                    <?php } elseif ($custom_js == 2) { ?>
                      <option value="0"><?php echo $text_disabled; ?></option>
                      <option value="1"><?php echo $text_custom_js_1; ?></option>
                      <option value="2" selected="selected"><?php echo $text_custom_js_2; ?></option>
                      <option value="3"><?php echo $text_custom_js_3; ?></option>
                    <?php } elseif ($custom_js == 3) { ?>
                      <option value="0"><?php echo $text_disabled; ?></option>
                      <option value="1"><?php echo $text_custom_js_1; ?></option>
                      <option value="2"><?php echo $text_custom_js_2; ?></option>
                      <option value="3" selected="selected"><?php echo $text_custom_js_3; ?></option>
                    <?php } else { ?>
                      <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                      <option value="1"><?php echo $text_custom_js_1; ?></option>
                      <option value="2"><?php echo $text_custom_js_2; ?></option>
                      <option value="3"><?php echo $text_custom_js_3; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group required custom-js pro-block">
                <label class="col-sm-3 control-label" for="textarea-custom_js_code"><?php echo $text_custom_js_code; ?></label>
                <div class="col-sm-9">
                  <div class="input-group">
                    <span class="input-group-addon"><?php echo $text_js_indicator; ?></span>
                    <textarea style="min-height:70px;" name="custom_js_code" class="form-control" id="textarea-custom_js_code"><?php echo $custom_js_code; ?></textarea>
                  </div>
                  <div class="modal-error-block" id="modal-error-custom-js-code"></div>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_custom_js_code_faq; ?></div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label" for="input-sort_order"><?php echo $text_sort_order; ?></label>
                <div class="col-sm-9">
                  <input value="<?php echo $sort_order; ?>" type="text" name="sort_order" class="form-control" />
                  <div class="modal-error-block" id="modal-error-sort-order"></div>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_sort_order_faq; ?></div>
                </div>
              </div>
            </div>
            <!-- TAB Modal Layout block -->
            <div class="tab-pane fade" role="tabpanel" id="modal-layout-block">
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $text_display_position; ?></label>
                <div class="col-sm-9">
                  <select name="display_position" class="form-control">
                    <?php if ($display_position == 1) { ?>
                      <option value="1" selected="selected"><?php echo $text_display_position_1; ?></option>
                      <option value="2"><?php echo $text_display_position_2; ?></option>
                    <?php } else { ?>
                      <option value="1"><?php echo $text_display_position_1; ?></option>
                      <option value="2" selected="selected"><?php echo $text_display_position_2; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $text_display_position_type; ?></label>
                <div class="col-sm-9">
                  <select name="display_position_type" class="form-control">
                    <?php if ($display_position_type == 1) { ?>
                      <option value="1" selected="selected"><?php echo $text_display_position_type_1; ?></option>
                      <option value="2"><?php echo $text_display_position_type_2; ?></option>
                    <?php } else { ?>
                      <option value="1"><?php echo $text_display_position_type_1; ?></option>
                      <option value="2" selected="selected"><?php echo $text_display_position_type_2; ?></option>
                    <?php } ?>
                  </select>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_display_position_type_faq; ?></div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $text_animation_type; ?></label>
                <div class="col-sm-9">
                  <select name="animation_type" class="form-control">
                    <?php if ($animation_type == 1) { ?>
                      <option value="0"><?php echo $text_animation_type_1; ?></option>
                      <option value="1" selected="selected"><?php echo $text_animation_type_2; ?></option>
                      <option value="2"><?php echo $text_animation_type_3; ?></option>
                    <?php } elseif ($animation_type == 2) { ?>
                      <option value="0"><?php echo $text_animation_type_1; ?></option>
                      <option value="1"><?php echo $text_animation_type_2; ?></option>
                      <option value="2" selected="selected"><?php echo $text_animation_type_3; ?></option>
                    <?php } else { ?>
                      <option value="0" selected="selected"><?php echo $text_animation_type_1; ?></option>
                      <option value="1"><?php echo $text_animation_type_2; ?></option>
                      <option value="2"><?php echo $text_animation_type_3; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-3 control-label" for="input-animation_duration"><?php echo $text_animation_duration; ?></label>
                <div class="col-sm-9">
                  <div class="input-group">
                    <input value="<?php echo $animation_duration; ?>" type="text" name="animation_duration" class="form-control" id="input-animation_duration" />
                    <span class="input-group-addon"><?php echo $text_seconds_indicator; ?></span>
                  </div>
                  <div class="modal-error-block" id="modal-error-animation-duration"></div>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_animation_duration_faq; ?></div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $text_close_button_status; ?></label>
                <div class="col-sm-9">
                  <select name="close_button_status" class="form-control">
                    <?php if ($close_button_status == 1) { ?>
                      <option value="0"><?php echo $text_close_button_status_1; ?></option>
                      <option value="1" selected="selected"><?php echo $text_close_button_status_2; ?></option>
                      <option value="2"><?php echo $text_close_button_status_3; ?></option>
                    <?php } elseif ($close_button_status == 2) { ?>
                      <option value="0"><?php echo $text_close_button_status_1; ?></option>
                      <option value="1"><?php echo $text_close_button_status_2; ?></option>
                      <option value="2" selected="selected"><?php echo $text_close_button_status_3; ?></option>
                    <?php } else { ?>
                      <option value="0" selected="selected"><?php echo $text_close_button_status_1; ?></option>
                      <option value="1"><?php echo $text_close_button_status_2; ?></option>
                      <option value="2"><?php echo $text_close_button_status_3; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-3 control-label" for="input-background-color"><?php echo $text_background_color; ?></label>
                <div class="col-sm-9">
                  <div class="input-group">
                    <span class="input-group-addon"><i class="colorpicker-block" <?php echo $background_color ? 'style="background:' . $background_color . '"' : ''; ?>></i></span>
                    <input value="<?php echo $background_color; ?>" type="text" name="background_color" class="form-control" />
                  </div>
                  <div class="modal-error-block" id="modal-error-background-color"></div>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-3 control-label" for="input-text-color"><?php echo $text_text_color; ?></label>
                <div class="col-sm-9">
                  <div class="input-group">
                    <span class="input-group-addon"><i class="colorpicker-block" <?php echo $text_color ? 'style="background:' . $text_color . '"' : ''; ?>></i></span>
                    <input value="<?php echo $text_color; ?>" type="text" name="text_color" class="form-control" />
                  </div>
                  <div class="modal-error-block" id="modal-error-text-color"></div>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-3 control-label" for="input-font_size"><?php echo $text_font_size; ?></label>
                <div class="col-sm-9">
                  <div class="input-group">
                    <input value="<?php echo $font_size; ?>" type="text" name="font_size" class="form-control" id="input-font_size" />
                    <span class="input-group-addon"><?php echo $text_px_indicator; ?></span>
                  </div>
                  <div class="modal-error-block" id="modal-error-font-size"></div>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-3 control-label" for="input-border_radius"><?php echo $text_border_radius; ?></label>
                <div class="col-sm-9">
                  <div class="input-group">
                    <input value="<?php echo $border_radius; ?>" type="text" name="border_radius" class="form-control" id="input-border_radius" />
                    <span class="input-group-addon"><?php echo $text_px_indicator; ?></span>
                  </div>
                  <div class="modal-error-block" id="modal-error-border-radius"></div>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-3 control-label" for="input-border_width"><?php echo $text_border_width; ?></label>
                <div class="col-sm-9">
                  <div class="input-group">
                    <input value="<?php echo $border_width; ?>" type="text" name="border_width" class="form-control" id="input-border_width" />
                    <span class="input-group-addon"><?php echo $text_px_indicator; ?></span>
                  </div>
                  <div class="modal-error-block" id="modal-error-border-width"></div>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-3 control-label" for="input-border-color"><?php echo $text_border_color; ?></label>
                <div class="col-sm-9">
                  <div class="input-group">
                    <span class="input-group-addon"><i class="colorpicker-block" <?php echo $border_color ? 'style="background:' . $border_color . '"' : ''; ?>></i></span>
                    <input value="<?php echo $border_color; ?>" type="text" name="border_color" class="form-control" />
                  </div>
                  <div class="modal-error-block" id="modal-error-border-color"></div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $text_text_align; ?></label>
                <div class="col-sm-9">
                  <select name="text_align" class="form-control">
                    <?php if ($text_align == 'left') { ?>
                      <option value="left" selected="selected"><?php echo $text_text_align_1; ?></option>
                      <option value="right"><?php echo $text_text_align_2; ?></option>
                      <option value="center"><?php echo $text_text_align_3; ?></option>
                      <option value="justify"><?php echo $text_text_align_4; ?></option>
                    <?php } elseif ($text_align == 'right') { ?>
                      <option value="left"><?php echo $text_text_align_1; ?></option>
                      <option value="right" selected="selected"><?php echo $text_text_align_2; ?></option>
                      <option value="center"><?php echo $text_text_align_3; ?></option>
                      <option value="justify"><?php echo $text_text_align_4; ?></option>
                    <?php } elseif ($text_align == 'center') { ?>
                      <option value="left"><?php echo $text_text_align_1; ?></option>
                      <option value="right"><?php echo $text_text_align_2; ?></option>
                      <option value="center" selected="selected"><?php echo $text_text_align_3; ?></option>
                      <option value="justify"><?php echo $text_text_align_4; ?></option>
                    <?php } else { ?>
                      <option value="left"><?php echo $text_text_align_1; ?></option>
                      <option value="right"><?php echo $text_text_align_2; ?></option>
                      <option value="center"><?php echo $text_text_align_3; ?></option>
                      <option value="justify" selected="selected"><?php echo $text_text_align_4; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
            </div>
            <!-- TAB Modal Language block -->
            <div class="tab-pane fade" role="tabpanel" id="modal-marketing-tools-block">
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $text_select_gift_coupon; ?></label>
                <div class="col-sm-9">
                  <select name="gift_coupon" class="form-control">
                    <option value=""><?php echo $text_make_a_choice; ?></option>
                    <?php foreach ($all_coupons as $coupon) { ?>
                      <?php if ($coupon['coupon_id'] == $gift_coupon) { ?>
                        <option value="<?php echo $coupon['coupon_id']; ?>" selected="selected"><?php echo $coupon['name']; ?></option>
                      <?php } else { ?>
                        <option value="<?php echo $coupon['coupon_id']; ?>"><?php echo $coupon['name']; ?></option>
                      <?php } ?>
                    <?php } ?>
                  </select>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_select_gift_coupon_faq; ?></div>
                </div>
              </div>
            </div>
            <!-- TAB Modal Language block -->
            <div class="tab-pane fade" role="tabpanel" id="modal-language-block">
              <div class="form-group required">
                <label class="col-sm-3 control-label"><?php echo $text_module_content; ?></label>
                <div class="col-sm-9">
                  <?php foreach ($languages as $language) { ?>
                  <div class="input-group" style="margin-bottom: 5px;">
                    <span class="input-group-addon"><img src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                    <textarea name="form_description[<?php echo $language['language_id']; ?>][module_content]" id="module_content<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($form_description[$language['language_id']]) ? $form_description[$language['language_id']]['module_content'] : ''; ?></textarea>
                  </div>
                  <div class="btn-group">
                    <button type="button" class="btn btn-default btn-xs" onclick="texteditor_action({id: '#module_content<?php echo $language['language_id']; ?>'});"><?php echo $text_open_texteditor; ?></button>
                    <button type="button" class="btn btn-default btn-xs" onclick="texteditor_action({id: '#module_content<?php echo $language['language_id']; ?>', start: false, destroy: true});" style="display: none;"><?php echo $text_save_texteditor; ?></button>
                  </div>
                  <div class="modal-error-block" id="modal-error-form-description-language-module-content-<?php echo $language['language_id']; ?>"></div>
                  <?php } ?>
                  <div class="alert alert-info" role="alert" style="margin-bottom:10px;"><i class="fa fa-info-circle"></i> <?php echo $text_module_content_faq; ?></div>
                  <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapse-module-content-sub" aria-expanded="false" aria-controls="collapse-module-content-sub"><?php echo $button_view_shortcodes; ?></button>
                </div>
              </div>
              <div class="collapse" id="collapse-module-content-sub">
                <div class="form-group" style="margin-bottom: 0px;">
                  <div class="col-sm-3"></div>
                  <div class="col-sm-9">
                    <div class="well">
                      <?php echo $text_result_email_sub_h1; ?><br/>
                      <?php echo $text_result_email_sub_c1; ?><br/><br/>
                      <?php echo $text_result_email_sub_h2; ?><br/>
                      <?php echo $text_result_email_sub_c2; ?><br/><br/>
                      <?php echo $text_result_email_sub_h3; ?><br/>
                      <?php echo $text_result_email_sub_c3; ?><br/><br/>
                      <?php echo $text_result_email_sub_h4; ?><br/>
                      <?php echo $text_result_email_sub_c4; ?><br/><br/>
                      <?php echo $text_result_email_sub_h5; ?><br/>
                      <?php echo $text_result_email_sub_c5; ?><br/><br/>
                      <?php echo $text_result_email_sub_h6; ?><br/>
                      <?php echo $text_result_email_sub_c6; ?><br/><br/>
                      <?php echo $text_result_email_sub_h7; ?><br/>
                      <?php echo $text_result_email_sub_c7; ?><br/><br/>
                      <?php echo $text_result_email_sub_h8; ?><br/>
                      <?php echo $text_result_email_sub_c8; ?>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-info" onclick="submit_form(this, <?php if ($form_id) { ?>'edit'<?php } else { ?>'add'<?php } ?>);"><?php echo $button_submit; ?></button>
    <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close" <?php if (!$form_id) { ?>style="display: none;"<?php } ?>><?php echo $button_close; ?></button>
  </div>
</div>
<!-- start: code for ColorPicker -->
<script type="text/javascript">
$('.colorpicker-block').each(function() {
  var self = $(this);
  $(this).ColorPicker({
    onShow: function (colpkr) {
      $(colpkr).fadeIn(500);
      return false;
    },
    onHide: function (colpkr) {
      $(colpkr).fadeOut(500);
      return false;
    },
    onChange: function (hsb, hex, rgb) {
      self.css('background', '#' + hex);
      self.parent().next().val('#' + hex);
    }
  });
});  
</script>
<!-- end: code for ColorPicker -->
<!-- start: code for DateTimePicker -->
<script type="text/javascript">
$('.datetime').datetimepicker({
  format: 'YYYY-MM-DD HH:mm:ss',
  pickDate: true,
  pickTime: true
});  
</script>
<!-- end: code for DateTimePicker -->
<!-- start: code for tab General setting -->
<script type="text/javascript">
$('select[name=mixed_data_type]').change(function() {
  var val = $(this).val();

  if (val == 1) {
    $('.mixed-data-type-1').show();
    $('.mixed-data-type-2').hide();
    $('.mixed-data-type-3').hide();
    $('.mixed-data-type-4').hide();
  } else if (val == 2) {
    $('.mixed-data-type-1').hide();
    $('.mixed-data-type-2').show();
    $('.mixed-data-type-3').hide();
    $('.mixed-data-type-4').hide();
  } else if (val == 3) {
    $('.mixed-data-type-1').hide();
    $('.mixed-data-type-2').hide();
    $('.mixed-data-type-3').show();
    $('.mixed-data-type-4').hide();
  } else if (val == 4) {
    $('.mixed-data-type-1').hide();
    $('.mixed-data-type-2').hide();
    $('.mixed-data-type-3').hide();
    $('.mixed-data-type-4').show();
  } else {
    $('.mixed-data-type-1').hide();
    $('.mixed-data-type-2').hide();
    $('.mixed-data-type-3').hide();
    $('.mixed-data-type-4').hide();
  }
});

$('select[name=mixed_data_type]').trigger('change');

$('select[name=display_frequency]').change(function() {
  var val = $(this).val();

  if (val == 3) {
    $('.display-frequency-3').show();
  } else {
    $('.display-frequency-3').hide();
  }
});

$('select[name=display_frequency]').trigger('change');

$('select[name=date_status]').change(function() {
  var val = $(this).val();

  if (val == 1) {
    $('.date-period-status').show();
  } else {
    $('.date-period-status').hide();
  }
});

$('select[name=date_status]').trigger('change');

$('select[name=module_trigger]').change(function() {
  var val = $(this).val();

  if (val == 1) {
    $('.module-trigger-1').show();
    $('.module-trigger-2').hide();
    $('.module-trigger-3').hide();
    $('.module-trigger-4').hide();
  } else if (val == 2) {
    $('.module-trigger-1').hide();
    $('.module-trigger-2').show();
    $('.module-trigger-3').hide();
    $('.module-trigger-4').hide();
  } else if (val == 3) {
    $('.module-trigger-1').hide();
    $('.module-trigger-2').hide();
    $('.module-trigger-3').show();
    $('.module-trigger-4').hide();
  } else {
    $('.module-trigger-1').hide();
    $('.module-trigger-2').hide();
    $('.module-trigger-3').hide();
    $('.module-trigger-4').show();
  }
});

$('select[name=module_trigger]').trigger('change');

$('select[name=custom_js]').change(function() {
  var val = $(this).val();

  if (val > 0) {
    $('.custom-js').show();
  } else {
    $('.custom-js').hide();
  }
});

$('select[name=custom_js]').trigger('change');

$('input[name=\'manufacturer\']').autocomplete({
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=catalog/manufacturer/autocomplete&<?php echo $token; ?>&filter_name='+ encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['manufacturer_id']
          }
        }));
      }
    });
  },
  select: function(item) {
    $('input[name=\'manufacturer\']').val('');

    $('#manufacturer-filter'+item['value']).remove();

    $('#manufacturer-filter').append('<div id="manufacturer-filter'+item['value']+'"><i class="fa fa-minus-circle"></i> '+item['label']+'<input type="hidden" name="mixed_data_manufacturers[]" value="'+item['value']+'" /></div>');
  }
});

$('#manufacturer-filter').delegate('.fa-minus-circle', 'click', function() {
  $(this).parent().remove();
});

$('input[name=\'category\']').autocomplete({
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=catalog/category/autocomplete&<?php echo $token; ?>&filter_name='+ encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['category_id']
          }
        }));
      }
    });
  },
  select: function(item) {
    $('input[name=\'category\']').val('');

    $('#category-filter'+item['value']).remove();

    $('#category-filter').append('<div id="category-filter'+item['value']+'"><i class="fa fa-minus-circle"></i> '+item['label']+'<input type="hidden" name="mixed_data_categories[]" value="'+item['value']+'" /></div>');
  }
});

$('#category-filter').delegate('.fa-minus-circle', 'click', function() {
  $(this).parent().remove();
});

$('input[name=\'product\']').autocomplete({
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=catalog/product/autocomplete&<?php echo $token; ?>&filter_name='+ encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['product_id']
          }
        }));
      }
    });
  },
  select: function(item) {
    $('input[name=\'product\']').val('');
    $('#product-filter'+item['value']).remove();
    $('#product-filter').append('<div id="product-filter'+item['value']+'"><i class="fa fa-minus-circle"></i> '+item['label']+'<input type="hidden" name="mixed_data_products[]" value="'+item['value']+'" /></div>');
  }
});

$('#product-filter').delegate('.fa-minus-circle', 'click', function() {
  $(this).parent().remove();
});

$('input[name=\'information\']').autocomplete({
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/autocomplete_information&<?php echo $token; ?>&filter_title='+ encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item['title'],
            value: item['information_id']
          }
        }));
      }
    });
  },
  select: function(item) {
    $('input[name=\'information\']').val('');
    $('#information-filter'+item['value']).remove();
    $('#information-filter').append('<div id="information-filter'+item['value']+'"><i class="fa fa-minus-circle"></i> '+item['label']+'<input type="hidden" name="mixed_data_informations[]" value="'+item['value']+'" /></div>');
  }
});

$('#information-filter').delegate('.fa-minus-circle', 'click', function() {
  $(this).parent().remove();
});
</script>
<!-- end: code for tab General setting -->
<!-- start: code for module usability -->
<script type="text/javascript">
if ($('#modal-form-constructor-content .pro-block').length) {
  $('#modal-form-constructor-content .pro-block').each(function(index) {
    $(this).find('.control-label').append('<div class="clear"></div><div class="label label-info" style="text-transform: uppercase;"><?php echo $text_exclusive; ?></div>');
    // $(this).find('input[type=\'radio\'], input[type=\'checkbox\'], select, button').attr('disabled', true);
    // $(this).find('input[type=\'text\'], textarea').on('focus', function(){ alert('<?php echo $text_exclusive; ?>'); });
    // $(this).find('label').addClass('disabled');
    // $(this).addClass('pro-version-only');
  });
}
</script>
<!-- end: code for module usability -->
</div>
