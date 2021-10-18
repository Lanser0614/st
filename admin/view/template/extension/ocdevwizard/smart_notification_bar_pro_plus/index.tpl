<?php echo $header; ?>
<?php echo $column_left; ?>

<!--
##=====================================================================##
## @author    : OCdevWizard                                            ##
## @contact   : ocdevwizard@gmail.com                                  ##
## @support   : http://help.ocdevwizard.com                            ##
## @license   : http://license.ocdevwizard.com/Licensing_Policy.pdf    ##
## @copyright : (c) OCdevWizard. Smart Notification Bar Pro Plus, 2017 ##
##=====================================================================##
-->

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right" id="top-nav-line">
        <button type="submit" formaction="<?php echo $action; ?>" form="form" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <button type="submit" formaction="<?php echo $action_plus; ?>" form="form" data-toggle="tooltip" title="<?php echo $button_save_and_stay; ?>" class="btn btn-primary"><i class="fa fa-save"></i> + <i class="fa fa-refresh"></i></button>
        <div class="btn-group">
          <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-trash"></i>&nbsp;&nbsp;&nbsp;<span class="caret"></span></button>
          <ul class="dropdown-menu dropdown-menu-right">
            <li><a onclick="confirm('<?php echo $text_are_you_sure; ?>') ? href='<?php echo $uninstall; ?>' : false;"><i class="fa fa-trash"></i> <?php echo $button_uninstall; ?></a></li>
            <li><a onclick="confirm('<?php echo $text_are_you_sure; ?>') ? href='<?php echo $uninstall_and_remove; ?>' : false;"><i class="fa fa-trash"></i> <?php echo $button_uninstall_and_remove; ?></a></li>
            <li><a onclick="confirm('<?php echo $text_are_you_sure; ?>') ? href='<?php echo $cache_backup; ?>' : false;"><i class="fa fa-trash"></i> <?php echo $button_cache_backup; ?></a></li>
            <li><a onclick="confirm('<?php echo $text_are_you_sure; ?>') ? href='<?php echo $restore; ?>' : false;"><i class="fa fa-repeat"></i> <?php echo $button_restore; ?></a></li>
          </ul>
        </div>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb-module">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
          <?php if ($breadcrumb['href']) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
          <?php } elseif (empty($breadcrumb['href']) && $breadcrumb['dropdown']) { ?>
            <li>
              <div class="btn-group dropdown-on-hover">
                <button type="button" class="btn btn-default dropdown-toggle btn-xs" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><?php echo $breadcrumb['text']; ?> <span class="caret"></span></button>
                <?php if ($breadcrumb['dropdown']) { ?>
                  <ul class="dropdown-menu">
                    <?php foreach ($breadcrumb['dropdown'] as $dropdown) { ?>
                      <li><a href="<?php echo $dropdown['href']; ?>"><?php if ($dropdown['active']) { ?><i class="fa fa-check-square-o"></i><?php } else { ?><i class="fa fa-square-o"></i><?php } ?> <?php echo $dropdown['text']; ?></a></li>
                    <?php } ?>
                  </ul>
                <?php } ?>
              </div>
            </li>
          <?php } else { ?>
            <li><a><?php echo $breadcrumb['text']; ?></a></li>
          <?php } ?>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid" id="top-alerts">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="row">
      <div class="col-sm-3 col-md-3 col-lg-2">
        <div class="btn-group" style="width: 100%;margin-bottom: 10px;">
          <button type="button" class="btn btn-default dropdown-toggle btn-block" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog"></i> <?php echo $text_select_store; ?> <span class="caret"></span></button>
          <ul class="dropdown-menu">
            <?php foreach ($all_stores as $store) { ?>
              <li><a href="<?php echo $store['href']; ?>"><?php if ($store_id == $store['store_id']) { ?><i class="fa fa-check-square-o"></i><?php } else { ?><i class="fa fa-square-o"></i><?php } ?> <?php echo $store['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <!-- Nav tabs -->
        <div class="list-group list-group-root well" id="setting-tabs">
          <a class="list-group-item list-group-item-info"><i class="fa fa-cog"></i><?php echo $tab_control_panel; ?></a>
          <div class="list-group">
            <a class="list-group-item" data-toggle="tab" href="#general-block" role="tab"><i class="fa fa-cogs"></i> <?php echo $tab_general_setting; ?></a>
            <a class="list-group-item" data-toggle="tab" href="#basic-block" role="tab"><i class="fa fa-cogs"></i> <?php echo $tab_basic_setting; ?></a>
            <a class="list-group-item" data-toggle="tab" href="#css-block" role="tab"><i class="fa fa-css3"></i> <?php echo $tab_css_setting; ?></a>
            <a class="list-group-item" data-toggle="tab" href="#module-import-export-block" role="tab"><i class="fa fa-file-archive-o"></i> <?php echo $tab_module_import_export_setting; ?></a>
          </div>
          <a class="list-group-item list-group-item-info"><i class="fa fa-list-alt"></i><?php echo $tab_form_setting; ?></a>
          <div class="list-group">
            <a class="list-group-item" data-toggle="tab" href="#form-constructor-block" role="tab"><i class="fa fa-cogs"></i> <?php echo $tab_form_constructor_setting; ?></a>
            <a class="list-group-item" data-toggle="tab" href="#form-import-export-block" role="tab"><i class="fa fa-file-archive-o"></i> <?php echo $tab_form_import_export_setting; ?></a>
          </div>
          <a class="list-group-item list-group-item-info"><i class="fa fa-life-ring"></i><?php echo $tab_support_setting; ?></a>
          <div class="list-group">
            <a class="list-group-item" data-toggle="tab" href="#support-extension-block" role="tab"><i class="fa fa-info-circle"></i> <?php echo $tab_support_extension_setting; ?></a>
            <a class="list-group-item" data-toggle="tab" href="#support-general-block" role="tab"><i class="fa fa-info-circle"></i> <?php echo $tab_support_general_setting; ?></a>
            <a class="list-group-item" data-toggle="tab" href="#support-terms-block" role="tab"><i class="fa fa-info-circle"></i> <?php echo $tab_support_terms_setting; ?></a>
            <a class="list-group-item" data-toggle="tab" href="#support-faq-block" role="tab"><i class="fa fa-question-circle"></i> <?php echo $tab_support_faq_setting; ?></a>
            <a class="list-group-item" data-toggle="tab" href="#promo-block" role="tab"><i class="fa fa-briefcase"></i> <?php echo $tab_promo_setting; ?></a>
          </div>
        </div>
      </div>
      <div class="col-sm-9 col-md-9 col-lg-10">
        <div class="panel panel-default">
          <div class="panel-body">
            <form method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
              <div class="tab-content">
                <!-- TAB General block -->
                <div class="tab-pane fade active in" role="tabpanel" id="general-block">
                  <div class="form-group">
                    <label class="col-sm-2 control-label"><?php echo $text_activate_module; ?></label>
                    <div class="col-sm-10">
                      <div class="btn-group btn-toggle" data-toggle="buttons">
                        <label class="btn <?php echo $form_data['activate'] == 1 ? 'active btn-success' : 'btn-default'; ?>">
                          <input type="radio"
                            name="n4k434y5k4z3l4o4p4g484m5l5f5p4g4g4j40454h5y5z3x5z5j4h5k4g4o4l4h5o5i4q4v5049464k454[activate]"
                            value="1"
                            autocomplete="off"
                            <?php echo $form_data['activate'] == 1 ? 'checked="checked"' : ''; ?>
                          /><?php echo $text_yes; ?>
                        </label>
                        <label class="btn <?php echo $form_data['activate'] == 0 ? 'active btn-success' : 'btn-default'; ?>">
                          <input type="radio"
                            name="n4k434y5k4z3l4o4p4g484m5l5f5p4g4g4j40454h5y5z3x5z5j4h5k4g4o4l4h5o5i4q4v5049464k454[activate]"
                            value="0"
                            autocomplete="off"
                            <?php echo $form_data['activate'] == 0 ? 'checked="checked"' : ''; ?>
                          /><?php echo $text_no; ?>
                        </label>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- TAB Basic block -->
                <div class="tab-pane fade" role="tabpanel" id="basic-block">
                  <div class="form-group">
                    <label class="col-sm-2 control-label"><?php echo $text_direction_type; ?></label>
                    <div class="col-sm-10">
                      <?php foreach ($languages as $language) { ?>
                      <div class="btn-group-vertical btn-toggle" data-toggle="buttons">
                        <label class="btn <?php echo (isset($form_data['direction_type'][$language['language_id']]) && $form_data['direction_type'][$language['language_id']] == 1) ? 'active btn-success' : 'btn-default'; ?>">
                          <input type="radio"
                            name="n4k434y5k4z3l4o4p4g484m5l5f5p4g4g4j40454h5y5z3x5z5j4h5k4g4o4l4h5o5i4q4v5049464k454[direction_type][<?php echo $language['language_id']; ?>]"
                            value="1"
                            autocomplete="off"
                            <?php echo (isset($form_data['direction_type'][$language['language_id']]) && $form_data['direction_type'][$language['language_id']] == 1) ? 'checked="checked"' : ''; ?>
                          /><img src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $text_direction_type_1; ?>
                        </label>
                        <label class="btn <?php echo (isset($form_data['direction_type'][$language['language_id']]) && $form_data['direction_type'][$language['language_id']] == 2) ? 'active btn-success' : 'btn-default'; ?>">
                          <input type="radio"
                            name="n4k434y5k4z3l4o4p4g484m5l5f5p4g4g4j40454h5y5z3x5z5j4h5k4g4o4l4h5o5i4q4v5049464k454[direction_type][<?php echo $language['language_id']; ?>]"
                            value="2"
                            autocomplete="off"
                            <?php echo (isset($form_data['direction_type'][$language['language_id']]) && $form_data['direction_type'][$language['language_id']] == 2) ? 'checked="checked"' : ''; ?>
                          /><img src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $text_direction_type_2; ?>
                        </label>
                      </div>
                      <?php } ?>
                    </div>
                  </div>
                </div>
                <!-- TAB CSS block -->
                <div class="tab-pane fade" role="tabpanel" id="css-block">
                  <div class="form-group pro-block">
                    <label class="col-sm-2 control-label"><?php echo $text_edit_css; ?></label>
                    <div class="col-sm-10">
                      <textarea id="edit-css-block-0"><?php echo $stylesheet_code; ?></textarea>
                      <br/>
                      <button type="button" class="btn btn-primary" data-toggle="tooltip" title="<?php echo $button_save_css; ?>" onclick="save_css('0', 'stylesheet');"><i class="fa fa-save"></i></button>
                      <button type="button" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_restore_css; ?>" onclick="confirm('<?php echo $text_are_you_sure; ?>') ? restore_css('0', 'stylesheet', 'stylesheet_default') : false;"><i class="fa fa-refresh"></i></button>
                      <br/><br/>
                      <div id="result-css-block-0"></div>
                    </div>
                  </div>
                  <div class="form-group pro-block">
                    <label class="col-sm-2 control-label"><?php echo $text_edit_css_rtl; ?></label>
                    <div class="col-sm-10">
                      <textarea id="edit-css-block-1"><?php echo $stylesheet_code_rtl; ?></textarea>
                      <br/>
                      <button type="button" class="btn btn-primary" data-toggle="tooltip" title="<?php echo $button_save_css; ?>" onclick="save_css('1', 'stylesheet_rtl');"><i class="fa fa-save"></i></button>
                      <button type="button" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_restore_css; ?>" onclick="confirm('<?php echo $text_are_you_sure; ?>') ? restore_css('1', 'stylesheet_rtl', 'stylesheet_rtl_default') : false;"><i class="fa fa-refresh"></i></button>
                      <br/><br/>
                      <div id="result-css-block-1"></div>
                    </div>
                  </div>
                </div>
                <!-- TAB Import/Export module block -->
                <div class="tab-pane fade" role="tabpanel" id="module-import-export-block">
                  <div class="form-group">
                    <label class="col-sm-2 control-label"><?php echo $text_restore_from_external_file; ?></label>
                    <div class="col-sm-5">
                      <input type="file" name="module_import" style="display:none;" id="module-load-file" />
                      <div class="input-group">
                        <span class="input-group-btn">
                          <button class="btn btn-primary" type="button" onclick="$('#module-load-file').click();"><?php echo $text_select_file; ?></button>
                        </span>
                        <input type="text" name="module_load_file_mask" id="module-load-file-mask" class="form-control">
                        <span class="input-group-btn">
                          <button id="module-button-import-file-1" type="submit" formaction="<?php echo $action_plus; ?>" form="form" class="btn btn-success" disabled="disabled"><i class="fa fa-download"></i> <?php echo $button_import; ?></button>
                        </span>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label"><?php echo $text_restore_from_local_file; ?></label>
                    <div class="col-sm-5">
                      <div class="input-group">
                        <select name="module_backup_file_name" class="form-control">
                          <option value=""><?php echo $text_make_a_choice; ?></option>
                          <?php if ($module_backup_files) { ?>
                          <?php foreach ($module_backup_files as $module_backup_file) { ?>
                          <option value="<?php echo $module_backup_file['name']; ?>"><?php echo $module_backup_file['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select>
                        <span class="input-group-btn">
                          <button id="module-button-import-file-2" type="button" class="btn btn-success" disabled="disabled"><i class="fa fa-download"></i> <?php echo $button_import; ?></button>
                        </span>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label"><?php echo $text_export; ?></label>
                    <div class="col-sm-5">
                      <a href="<?php echo $export_module_settings_button; ?>" class="btn btn-primary"><i class="fa fa-upload"></i> <?php echo $button_export; ?></a>
                    </div>
                  </div>
                </div>
                <!-- TAB Form constructor block -->
                <div class="tab-pane fade" role="tabpanel" id="form-constructor-block">
                  <div class="well">
                    <div class="input-group">
                      <input type="text" name="filter_form" value="" placeholder="<?php echo $text_enter_form; ?>" class="form-control" />
                      <span class="input-group-btn">
                        <button class="btn btn-danger" type="button" id="clear-filter-form"><i class="fa fa-eraser"></i> <?php echo $button_clear_filter; ?></button>
                        <button class="btn btn-primary" type="button" id="submit-filter-form"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
                      </span>
                    </div>
                  </div>
                  <div id="history-form"></div>
                </div>
                <!-- TAB Import/Export form block -->
                <div class="tab-pane fade" role="tabpanel" id="form-import-export-block">
                  <div class="form-group">
                    <label class="col-sm-2 control-label"><?php echo $text_restore_from_external_file; ?></label>
                    <div class="col-sm-5">
                      <input type="file" name="form_import" style="display:none;" id="form-load-file" />
                      <div class="input-group">
                        <span class="input-group-btn">
                          <button class="btn btn-primary" type="button" onclick="$('#form-load-file').click();"><?php echo $text_select_file; ?></button>
                        </span>
                        <input type="text" name="form_load_file_mask" id="form-load-file-mask" class="form-control">
                        <span class="input-group-btn">
                          <button id="form-button-import-file-1" type="submit" formaction="<?php echo $action_plus; ?>" form="form" class="btn btn-success" disabled="disabled"><i class="fa fa-download"></i> <?php echo $button_import; ?></button>
                        </span>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label"><?php echo $text_restore_from_local_file; ?></label>
                    <div class="col-sm-5">
                      <div class="input-group">
                        <select name="form_backup_file_name" class="form-control">
                          <option value=""><?php echo $text_make_a_choice; ?></option>
                          <?php if ($form_backup_files) { ?>
                          <?php foreach ($form_backup_files as $form_backup_file) { ?>
                          <option value="<?php echo $form_backup_file['name']; ?>"><?php echo $form_backup_file['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select>
                        <span class="input-group-btn">
                          <button id="form-button-import-file-2" type="button" class="btn btn-success" disabled="disabled"><i class="fa fa-download"></i> <?php echo $button_import; ?></button>
                        </span>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label"><?php echo $text_export; ?></label>
                    <div class="col-sm-5">
                      <a href="<?php echo $export_form_settings_button; ?>" class="btn btn-primary"><i class="fa fa-upload"></i> <?php echo $button_export; ?></a>
                    </div>
                  </div>
                </div>
                <!-- TAB Support General block -->
                <div class="tab-pane fade" role="tabpanel" id="support-general-block">
                  <?php if (isset($support_info['general'])) { ?>
                    <?php echo $support_info['general']; ?>
                  <?php } else { ?>
                    <div class="alert alert-danger" role="alert"><i class="fa fa-info-circle"></i> <?php echo $error_data_load_error; ?></div>
                  <?php } ?>
                </div>
                <!-- TAB Support Extension block -->
                <div class="tab-pane fade" role="tabpanel" id="support-extension-block">
                  <div class="form-group">
                    <label class="col-sm-2 control-label"><?php echo $text_license_text; ?></label>
                    <div class="col-sm-10">
                      <p style="margin-top: 9px;"><?php echo $license_type; ?></p>
                      <div class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_license_text_faq; ?></div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label"><?php echo $text_license_holder; ?></label>
                    <div class="col-sm-10">
                      <p style="margin-top: 9px;"><?php echo $license_holder; ?></p>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label"><?php echo $text_license_expires; ?></label>
                    <div class="col-sm-10">
                      <p style="margin-top: 9px;"><?php echo $license_expire; ?> <?php if ($license_expire_status == 0) { ?><i class="fa fa-refresh fa-spin fa-fw"></i> <b><a href="http://help.ocdevwizard.com" target="_blank">[<?php echo $text_renew_my_license; ?>]</a></b><?php } ?></p>
                      <?php if ($license_expire_status == 0) { ?>
                      <div class="alert alert-danger" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_license_expires_faq_0; ?></div>
                      <?php } elseif ($license_expire_status == 1) { ?>
                      <div class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_license_expires_faq_1; ?></div>
                      <?php } elseif ($license_expire_status == 2) { ?>
                      <div class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_license_expires_faq_2; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <?php if ($products) { ?>
                  <?php foreach ($products as $product) { ?>
                  <?php if ($product['extension_id'] == 32708) { ?>
                  <div class="form-group">
                    <label class="col-sm-2 control-label"><?php echo $text_installed_module_name; ?></label>
                    <div class="col-sm-10">
                      <p style="margin-top: 9px;"><i class="fa fa-external-link"></i> <a href="<?php echo $product['url']; ?>" target="_blank"><?php echo $product['title']; ?></a></p>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label"><?php echo $text_installed_module_version; ?></label>
                    <div class="col-sm-10">
                      <?php $_tmp_module_version = version_compare($_version, $product['latest_version']); ?>
                      <p style="margin-top: 9px;"><?php echo $_version; ?> <?php if ($_tmp_module_version == "-1") { ?><i class="fa fa-refresh fa-spin fa-fw"></i> <b><a href="<?php echo $product['url']; ?>" target="_blank">[<?php echo $text_new_module_version; ?> <?php echo $product['latest_version']; ?>]</a></b><?php } ?></p>
                    </div>
                  </div>
                  <?php } ?>
                  <?php } ?>
                  <?php } ?>
                  <div class="form-group">
                    <label class="col-sm-2 control-label"><?php echo $text_opencart_version; ?></label>
                    <div class="col-sm-10">
                      <p style="margin-top: 9px;"><?php echo $opencart_version; ?></p>
                    </div>
                  </div>
                </div>
                <!-- TAB Support General block -->
                <div class="tab-pane fade" role="tabpanel" id="support-terms-block">
                  <?php if (isset($support_info['terms'])) { ?>
                    <?php echo $support_info['terms']; ?>
                  <?php } else { ?>
                    <div class="alert alert-danger" role="alert"><i class="fa fa-info-circle"></i> <?php echo $error_data_load_error; ?></div>
                  <?php } ?>
                </div>
                <!-- TAB Support Faq block -->
                <div class="tab-pane fade" role="tabpanel" id="support-faq-block">
                  <?php if (isset($support_info['faq'])) { ?>
                    <?php echo $support_info['faq']; ?>
                  <?php } else { ?>
                    <div class="alert alert-danger" role="alert"><i class="fa fa-info-circle"></i> <?php echo $error_data_load_error; ?></div>
                  <?php } ?>
                </div>
                <!-- TAB OCdev Products -->
                <div class="tab-pane fade" role="tabpanel" id="promo-block">
                  <?php if ($products) { ?>
                  <div class="row">
                    <?php foreach ($products as $product) { ?>
                    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                      <button type="button" class="thumbnail" data-promo-product-id="<?php echo $product['extension_id']; ?>" data-toggle="tooltip" data-placement="bottom" title="<?php echo $button_read_more; ?>" >
                        <img src="<?php echo $product['img']; ?>" alt="<?php echo $product['title']; ?>" width="100%" />
                      </button>
                    </div>
                    <?php } ?>
                  </div>
                  <?php } else { ?>
                  <div class="alert alert-danger" role="alert"><i class="fa fa-info-circle"></i> <?php echo $error_data_load_error; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div>
                <input type="hidden" style="display:none;" name="<?php echo $_name; ?>_license" value="<?php echo $license_key; ?>" />
                <input type="hidden" style="display:none;" name="n4k434y5k4z3l4o4p4g484m5l5f5p4g4g4j40454h5y5z3x5z5j4h5k4g4o4l4h5o5i4q4v5049464k454[front_module_name]" value="<?php echo $heading_title; ?>" />
                <input type="hidden" style="display:none;" name="n4k434y5k4z3l4o4p4g484m5l5f5p4g4g4j40454h5y5z3x5z5j4h5k4g4o4l4h5o5i4q4v5049464k454[front_module_version]" value="<?php echo $_version; ?>" />
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- start: code for tab OCdev products -->
<script type="text/javascript">
$(document).delegate('button[data-promo-product-id]', 'click', function(e) {
  e.preventDefault();

  $('#modal-promo-product').remove();

  var element = this;

  $(element).tooltip('hide');

  $.ajax({
    url: 'index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/get_promo_products&<?php echo $token; ?>&extension_id='+$(element).attr('data-promo-product-id'),
    type: 'get',
    dataType: 'json',
    success: function(json) {
      html = '';
      if (json['product']) {
        html += '<div id="modal-promo-product" class="modal fade">';
        html += '  <div class="modal-dialog modal-mf" style="max-width:450px;">';
        html += '    <div class="modal-content">';
        html += '      <div class="modal-header">';
        html += '        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span>&times;</span></button>';
        html += '        <h4 class="modal-title" id="myModalLabel">'+json['product']['title']+'</h4>';
        html += '      </div>';
        html += '      <div class="modal-body">';
        html += '        <div role="tabpanel">';
        html += '          <ul class="nav nav-tabs" role="tablist">';
        html += '            <li class="active"><a href="#modal-info" data-toggle="tab"><i class="fa fa-info-circle"></i> <?php echo $tab_modal_info; ?></a></li>';
        html += '            <li><a href="#modal-opencart-version" data-toggle="tab"><i class="fa fa-check-circle"></i> <?php echo $tab_modal_for_opencart; ?></a></li>';
        html += '            <li><a href="#modal-features" data-toggle="tab"><i class="fa fa-star"></i> <?php echo $tab_modal_features; ?></a></li>';
        html += '          </ul>';
        html += '          <div class="tab-content">';
        html += '            <div class="tab-pane active" id="modal-info">';
        html += '              <ul class="list-group">';
        html += '                <li class="list-group-item"><?php echo $text_modal_price; ?> <b class="pull-right">'+json['product']['price']+'</b></li>';
        html += '                <li class="list-group-item"><?php echo $text_modal_date_added; ?> <b class="pull-right">'+json['product']['date_added']+'</b></li>';
        html += '                <li class="list-group-item"><?php echo $text_modal_latest_version; ?> <b class="pull-right">'+json['product']['latest_version']+'</b></li>';
        html += '              </ul>';
        html += '            </div>';
        html += '            <div class="tab-pane" id="modal-opencart-version">';
        html += '              <ul class="list-group">';
        html += '                <li class="list-group-item">';
        html += '                  <div class="row">';
                                   $.each(json['opencart_version_array'], function(i,value) {
        html += '                    <div class="col-xs-6 col-md-2 col-sm-3">'+value+'</div>';
                                   });
        html += '                  </div>';
        html += '                </li>';
        html += '              </ul>';
        html += '            </div>';
        html += '            <div class="tab-pane" id="modal-features">';
        html += '              <ul class="list-group">';
        html += '                <li class="list-group-item">';
        html += '                  <div class="row">';
                                   $.each(json['opencart_features_array'], function(i,value) {
        html += '                    <div class="col-xs-12 col-md-12 col-sm-12">'+value+'</div>';
                                   });
        html += '                  </div>';
        html += '                </li>';
        html += '              </ul>';
        html += '            </div>';
        html += '          </div>';
        html += '        </div>';
        html += '        <a href="'+json['product']['url']+'" target="_blank" class="btn btn-primary" style="width:100%;"><i class="fa fa-external-link"></i> <?php echo $button_visit_sales_page; ?></a>';
        html += '      </div>  ';
        html += '    </div';
        html += '  </div>';
        html += '</div>';
      }
      
      $('body').append(html);

      $('#modal-promo-product').modal('show'); 
    }
  });
});
</script>
<!-- end: code for tab OCdev products -->
<!-- start: code for tab CSS setting -->
<script type="text/javascript">
var codemirror = CodeMirror.fromTextArea(document.querySelector('#edit-css-block-0'), {
  mode : "css",
  height: '500px',
  lineNumbers: true,
  autofocus: true,
  theme: 'monokai',
  lineWrapping: true
});

var codemirror2 = CodeMirror.fromTextArea(document.querySelector('#edit-css-block-1'), {
  mode : "css",
  height: '500px',
  lineNumbers: true,
  autofocus: true,
  theme: 'monokai',
  lineWrapping: true
});

$('a[href=\'#css-block\']').on('click', function() {
  setTimeout(function() {
    $(this).click();
    codemirror.refresh();
    codemirror2.refresh();
  }, 500);
});

function save_css(id, stylesheet) {
  if (id == '0') {
    var codemirror_code = codemirror;
  } else {
    var codemirror_code = codemirror2;
  }
  $.ajax({
    type: 'post',
    url:  'index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/save_css&<?php echo $token; ?>',
    data: 'code='+encodeURIComponent(codemirror_code.getValue())+'&stylesheet='+stylesheet,
    dataType: 'json',
    success: function(json) {
      if (json['error']) {
        $('#result-css-block-'+id).html('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> '+json['error']+' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
      }
      if (json['success']) {
        $('#result-css-block-'+id).html('<div class="alert alert-success"><i class="fa fa-check-circle"></i> '+json['success']+' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
      }
    }
  });
}

function restore_css(id, stylesheet, stylesheet_default) {
  $.ajax({
    type: 'post',
    url:  'index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/restore_css&<?php echo $token; ?>',
    data: 'stylesheet='+stylesheet+'&stylesheet_default='+stylesheet_default,
    dataType: 'json',
    success: function(json) {
      if (json['error']) {
        $('#result-css-block-'+id).html('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> '+json['error']+' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
      }
      if (json['success']) {
        $('#result-css-block-'+id).html('<div class="alert alert-success"><i class="fa fa-check-circle"></i> '+json['success']+' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        setTimeout(function() {
          location.reload();
        }, 2000);
      }
    }
  });
}
</script>
<!-- end: code for tab CSS setting -->
<!-- start: code for tab Language setting -->
<script type="text/javascript">
function texteditor_action({id = '', destroy = false, start = true} = {}) {
  if (start) {
    $(id).summernote({focus: true});

    $(id).parent().next().find('button:eq(1)').show();

    if ($(id).summernote('isEmpty')) {
      $(id).val('');
    }
  }

  if (destroy) {
    $(id).summernote('destroy');
    $(id).parent().next().find('button:eq(1)').hide();
  }
}
</script>
<!-- end: code for tab Language setting -->
<!-- start: code for tab Form constructor setting -->
<script type="text/javascript">
$(function() {
  $('a[href=#form-constructor-block]').on('click', function() {
    $('#history-form').load('index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/history_form_list&<?php echo $token; ?>');
    $('#form-constructor-block .alert, #form-constructor-block .text-danger, #unviewed-saved-record-block .alert, #unviewed-saved-record-block .text-danger, #viewed-saved-record-block .alert, #viewed-saved-record-block .text-danger').remove();
  });
});

function submit_form(element, action) {
  $.ajax({
    url:  'index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/history_form_action&<?php echo $token; ?>',
    type: 'post',
    data: $('#modal-form-constructor input[type=\'text\'], #modal-form-constructor input[type=\'hidden\'], #modal-form-constructor input[type=\'radio\']:checked, #modal-form-constructor input[type=\'checkbox\']:checked, #modal-form-constructor select, #modal-form-constructor textarea'),
    dataType: 'json',
    success: function(json) {
      $('#modal-form-constructor-content .alert-danger, #modal-form-constructor-content .alert-success').remove();
      $('#modal-form-constructor-content .form-group').removeClass('has-error');

      if (json['error']) {
        for (i in json['error']) {
          if (i.replace(/_/g, '-') == 'warning') {
            $('#modal-form-constructor-content .panel-body').append('<div class="alert alert-danger" style="margin-bottom: 0px;"><i class="fa fa-exclamation-circle"></i> ' + json['error'][i] + '</div>');
          } else if (i.replace(/_/g, '-') == 'field-data') {
            if (json['error'][i].length) {
              $('#modal-fields-block').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'][i] + '</div>');
            }

            for (b in i) {
              for (c in json['error'][i][b]) {
                $('#modal-error-'+i.replace(/_/g, '-')+'-'+b+'-'+c).append('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'][i][b][c] + '</div>');
              }
            }
          } else if (i.replace(/_/g, '-') == 'field-data-language') {
            if (json['error'][i].length) {
              $('#modal-fields-block').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'][i] + '</div>');
            }

            for (b in i) {
              for (c in json['error'][i][b]) {
                for (d in json['error'][i][b][c]) {
                  $('#modal-error-'+i.replace(/_/g, '-')+'-'+b+'-'+c.replace(/_/g, '-')+'-'+d).append('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'][i][b][c][d] + '</div>');
                }
              }
            }
          } else if (i.replace(/_/g, '-') == 'form-description-language') {
            if (json['error'][i].length) {
              $('#modal-fields-block').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'][i] + '</div>');
            }

            for (b in json['error'][i]) {
              for (c in json['error'][i][b]) {
                $('#modal-error-'+i.replace(/_/g, '-')+'-'+b.replace(/_/g, '-')+'-'+c).append('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'][i][b][c] + '</div>');
              }
            }
          } else {
            $('#modal-error-' + i.replace(/_/g, '-')).html('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'][i] + '</div>');
            $('#modal-error-' + i.replace(/_/g, '-')).parent().parent().addClass('has-error');
          }
        }
      }

      if (json['success']) {
        if (action == 'add') {
          $(element).attr('disabled', true);
          $(element).next().show();
        }
        $('a[href=#form-constructor-block]').click();
        $('#modal-form-constructor-content > div > div >.panel-body').append('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
      }
    }
  });
}

$('#history-form').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();
  $('#history-form').load(this.href);
});

$('#history-form').load('index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/history_form_list&<?php echo $token; ?>');

$('#submit-filter-form').on('click', function() {
  $('#history-form').load('index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/history_form_list&<?php echo $token; ?>&filter_form='+encodeURIComponent($('input[name=\'filter_form\']').val()));
});

$('#clear-filter-form').on('click', function() {
  $('input[name=\'filter_form\']').val('');
  $('#history-form').load('index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/history_form_list&<?php echo $token; ?>&filter_form='+encodeURIComponent($('input[name=\'filter_form\']').val()));
});

$('input[name=\'filter_form\']').autocomplete({
  'source': function(request, response) {
    $.ajax({
      url: 'index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/autocomplete_form&<?php echo $token; ?>&filter_form='+encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item['heading'],
            value: item['form_id']
          }
        }));
      }
    });
  },
  'select': function(item) {
    $('input[name=\'filter_form\']').val(item['label']);
  }
});

function open_form({id = 0} = {}) {
  html = '';

  html += '<div id="modal-form-constructor" class="modal fade">';
  html += '  <div class="modal-dialog modal-lg">';
  html += '    <div id="modal-form-constructor-list"></div>';
  html += '  </div>';
  html += '</div>';

  $('body').append(html);

  if (id > 0) {
    $('#modal-form-constructor-list').load('index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/history_form&<?php echo $token; ?>&form_id='+id);
  } else {
    $('#modal-form-constructor-list').load('index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/history_form&<?php echo $token; ?>');
  }

  $('#modal-form-constructor').modal('show');

  $('[role=\'tooltip\']').tooltip('destroy');
}

function delete_selected(filter_status, type, id) {
  $.ajax({
    type: 'post',
    url:  'index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/delete_selected&<?php echo $token; ?>&filter_status='+filter_status+'&type='+type+'&delete='+id,
    dataType: 'json',
    success: function(json) {
      $('#form-constructor-block .alert, #form-constructor-block .text-danger, #unviewed-saved-record-block .alert, #unviewed-saved-record-block .text-danger, #viewed-saved-record-block .alert, #viewed-saved-record-block .text-danger').remove();
      
      if (json['error']) {
        if (type == 'form') {
          $('#history-form').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> '+json['error']+' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        }
      }
      if (json['success']) {
        if (type == 'form') {
          $('#history-form').load('index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/history_form_list&<?php echo $token; ?>');
          $('#history-form').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> '+json['success']+' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        }
      }
      $('[role=\'tooltip\']').tooltip('destroy');
    }
  });
}

function delete_all(filter_status, type) {
  $.ajax({
    type: 'get',
    url:  'index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/delete_all&<?php echo $token; ?>&filter_status='+filter_status+'&filter_store_id=<?php echo $store_id; ?>&type='+type,
    dataType: 'json',
    success: function(json) {
      $('#form-constructor-block .alert, #form-constructor-block .text-danger, #unviewed-saved-record-block .alert, #unviewed-saved-record-block .text-danger, #viewed-saved-record-block .alert, #viewed-saved-record-block .text-danger').remove();
      
      if (json['error']) {
        if (type == 'form') {
          $('#history-form').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> '+json['error']+' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        }
      }
      if (json['success']) {
        if (type == 'form') {
          $('#history-form').load('index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/history_form_list&<?php echo $token; ?>');
          $('#history-form').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> '+json['success']+' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        }
      }
      $('[role=\'tooltip\']').tooltip('destroy');
    }
  });
}

function delete_all_selected(filter_status, type) {
  if (type == 'form') {
    var checkbox_data = $('#history-form input[type=\'checkbox\']:checked');
  } else if (type == 'record') {
    var checkbox_data = $('#history'+filter_status+' input[type=\'checkbox\']:checked');
  }

  $.ajax({
    type: 'post',
    url:  'index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/delete_all_selected&<?php echo $token; ?>&filter_status='+filter_status+'&type='+type,
    data: checkbox_data,
    dataType: 'json',
    success: function(json) {
      $('#form-constructor-block .alert, #form-constructor-block .text-danger, #unviewed-saved-record-block .alert, #unviewed-saved-record-block .text-danger, #viewed-saved-record-block .alert, #viewed-saved-record-block .text-danger').remove();
      
      if (json['error']) {
        if (type == 'form') {
          $('#history-form').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> '+json['error']+' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        }
      }
      if (json['success']) {
        if (type == 'form') {
          $('#history-form').load('index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/history_form_list&<?php echo $token; ?>');
          $('#history-form').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> '+json['success']+' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        }
      }
      $('[role=\'tooltip\']').tooltip('destroy');
    }
  });
}

function copy_selected(id) {
  $.ajax({
    type: 'post',
    url:  'index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/copy_selected&<?php echo $token; ?>&copy='+id,
    dataType: 'json',
    success: function(json) {
      $('#form-constructor-block .alert, #form-constructor-block .text-danger').remove();
      
      if (json['error']) {
        $('#history-form').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> '+json['error']+' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
      }
      if (json['success']) {
        $('#history-form').load('index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/history_form_list&<?php echo $token; ?>');
        $('#history-form').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> '+json['success']+' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
      }
      $('[role=\'tooltip\']').tooltip('destroy');
    }
  });
}
</script>
<!-- end: code for tab Form constructor setting -->
<!-- start: code for tab Import/Export module setting -->
<script type="text/javascript">
$('#module-load-file').change(function(){
  $('#module-load-file-mask').val($(this).val());
  $('#module-button-import-file-1').attr('disabled', false);
});

$('select[name=\'module_backup_file_name\']').change(function(){
  if ($(this).val()) {
    $('#module-button-import-file-2').attr('disabled', false);
  } else {
    $('#module-button-import-file-2').attr('disabled', true);
  }
});

$('#module-button-import-file-2').on('click', function(){
  $.ajax({
    type: 'post',
    url:  'index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/import_module_settings&<?php echo $token; ?>&store_id=<?php echo $store_id; ?>',
    data: 'file_name='+$('select[name=\'module_backup_file_name\']').val(),
    dataType: 'json',
    success: function(json) {
      if (json['success']) {
        $('#top-alerts').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> '+json['success']+' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        setTimeout(function() {
          location.reload();
        }, 2000);
      }
    }
  });
});
</script>
<!-- end: code for tab Import/Export module setting -->
<!-- start: code for tab Import/Export form setting -->
<script type="text/javascript">
$('#form-load-file').change(function(){
  $('#form-load-file-mask').val($(this).val());
  $('#form-button-import-file-1').attr('disabled', false);
});

$('select[name=\'form_backup_file_name\']').change(function(){
  if ($(this).val()) {
    $('#form-button-import-file-2').attr('disabled', false);
  } else {
    $('#form-button-import-file-2').attr('disabled', true);
  }
});

$('#form-button-import-file-2').on('click', function(){
  $.ajax({
    type: 'post',
    url:  'index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/import_form_settings&<?php echo $token; ?>&store_id=<?php echo $store_id; ?>',
    data: 'file_name='+$('select[name=\'form_backup_file_name\']').val(),
    dataType: 'json',
    success: function(json) {
      if (json['success']) {
        $('#top-alerts').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> '+json['success']+' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        setTimeout(function() {
          location.reload();
        }, 2000);
      }
    }
  });
});
</script>
<!-- end: code for tab Import/Export form setting -->
<!-- start: code for module usability -->
<script type="text/javascript">
if (window.localStorage && window.localStorage['last_active_tab']) {
  $('#setting-tabs a[href='+window.localStorage['last_active_tab']+']').trigger('click').addClass('list-group-item-warning').prepend('<i class="fa fa-chevron-right"></i>');
  $('body,html').animate({
    scrollTop: 0
  }, 800);
}

$('#setting-tabs a[data-toggle="tab"]').click(function() {
  if (window.localStorage) {
    window.localStorage['last_active_tab'] = $(this).attr('href');
  }
  $('#setting-tabs a[data-toggle="tab"]').removeClass('list-group-item-warning').find('i[class=\'fa fa-chevron-right\']').remove();
  $(this).addClass('list-group-item-warning').prepend('<i class="fa fa-chevron-right"></i>');
  $('body, html').animate({
    scrollTop: 0
  }, 800);
});

$('.btn-toggle').on('click', '.btn', function() {
  if(!$(this).hasClass('disabled')){
    $(this).addClass('btn-success').siblings().removeClass('btn-success').addClass('btn-default');
  }
});

$('.btn-toggle').on('click', '.disabled', function() {
  return false;
});

$('body').on('hidden.bs.modal', function () {
  if($('.modal.in').length > 0) {
    $('body').addClass('modal-open');
  }
});

$(document).delegate('button[data-faq-target]', 'click', function(e) {
  e.preventDefault();

  $('#modal-faq').remove();

  var element = this;

  html  = '<div id="modal-faq" class="modal fade bs-example-modal-lg">';
  html += '  <div class="modal-dialog modal-lg">';
  html += '    <div class="modal-content">';
  html += '      <div class="modal-header">';
  html += '        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span>&times;</span></button>';
  html += '        <h4 class="modal-title" id="myModalLabel"><?php echo $text_preview_image; ?></h4>';
  html += '      </div>';
  html += '      <div class="modal-body">';
  html += '        <img src="http://images.ocdevwizard.com/<?php echo $_name; ?>/'+$(element).attr('data-faq-target')+'.gif" width="100%" />';
  html += '      </div>';
  html += '      <div class="modal-footer">';
  html += '        <a href="http://images.ocdevwizard.com/<?php echo $_name; ?>/'+$(element).attr('data-faq-target')+'.gif" class="btn btn-info" target="_blank"><?php echo $button_open_image_in_original_size; ?></a>';
  html += '      </div>';
  html += '    </div';
  html += '  </div>';
  html += '</div>';

  $('body').append(html);

  $('#modal-faq').modal('show');
});
      
$(function() {
  if ($('.pro-block').length) {
    $('.pro-block').each(function(index) {
      $(this).find('.control-label').append('<div class="clear"></div><div class="label label-info" style="text-transform: uppercase;"><?php echo $text_exclusive; ?></div>');
      // $(this).find('input[type=\'radio\'], input[type=\'checkbox\'], select, button').attr('disabled', true);
      // $(this).find('input[type=\'text\'], textarea').on('focus', function(){ alert('<?php echo $text_exclusive; ?>'); });
      // $(this).find('label').addClass('disabled');
      // $(this).addClass('pro-version-only');
    });
  }
});     
</script>
<!-- end: code for module usability -->
<?php echo $footer; ?>