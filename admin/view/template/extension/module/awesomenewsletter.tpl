<?php echo $header; ?>
<link href="view/stylesheet/awesomenewsletter.css" rel="stylesheet">
<link href="view/javascript/bootstrap/css/bootstrap-switch.css" rel="stylesheet">
<script src="view/javascript/bootstrap/js/bootstrap-switch.js"></script>
<?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
				<a href="<?php echo $importdeafultsubscriber; ?>" class="btn btn-info">Import Customers Subscribers</a>
				<a href="<?php echo $email_templates_link; ?>" class="btn btn-info"><?php echo $text_email_templates; ?></a>
        <button type="submit" form="form-awesomenewsletter" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
		<?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-awesomenewsletter" class="form-horizontal">
          <ul class="nav nav-tabs">
						<li class="active dropdown"><a href="#" data-toggle="dropdown"><i class="fa fa-cog"></i> <?php echo $tab_control_panel ?> <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#tab-general-setting" data-toggle="tab"><i class="fa fa-cogs"></i> <?php echo $tab_general_setting ?></a></li>
								<li><a href="#tab-email-setting" data-toggle="tab"><i class="fa fa-cogs"></i> <?php echo $tab_email_setting ?></a></li>
								<li><a href="#tab-popup-setting" data-toggle="tab"><i class="fa fa-cogs"></i> <?php echo $tab_popup_setting; ?></a></li>
								<li><a href="#tab-footer-setting" data-toggle="tab"><i class="fa fa-cogs"></i> <?php echo $tab_footer_setting; ?></a></li>
								<li><a href="#tab-css-setting" data-toggle="tab"><i class="fa fa-cogs"></i> <?php echo $tab_css_setting; ?></a></li>
								<li><a href="#tab-crownjob-setting" data-toggle="tab"><i class="fa fa-cogs"></i> <?php echo$tab_cronjob_setting; ?></a></li>
							</ul>
						</li>
						<li><a href="#tab-newsletter-list" data-toggle="tab"><i class="fa fa-shopping-cart"></i> <?php echo $tab_newsletter_list; ?></a></li>
						<li><a href="#tab-mail" data-toggle="tab"><i class="fa fa-envelope-o"></i> <?php echo $tab_mail; ?></a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-language"></i> <?php echo $tab_language_setting; ?> <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#tab-popup-language-setting" data-toggle="tab"><i class="fa fa-flag-o"></i> <?php echo $tab_popup_setting; ?></a></li>
								<li><a href="#tab-module-language-setting" data-toggle="tab"><i class="fa fa-flag-o"></i> <?php echo $tab_module_setting; ?></a></li>
								<li><a href="#tab-verify-language-setting" data-toggle="tab"><i class="fa fa-flag-o"></i> <?php echo $tab_page_setting; ?></a></li>
								<li><a href="#tab-unsubscribe-language-setting" data-toggle="tab"><i class="fa fa-flag-o"></i> <?php echo $tab_unsubscribe_page_setting; ?></a></li>
							</ul>
						</li>
						<li><a href="#tab-support" data-toggle="tab"><i class="fa fa-user"></i> Support</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active in" id="tab-general-setting">
							<div class="form-group">
								<label class="col-sm-2 control-label"><?php echo $entry_module_status; ?></label>
								<div class="col-sm-10">
									<?php if(!empty($awesomenewsletter_status)){
										$check = "checked=checked";
									 }else{
										$check = '';
									 }
									?>
									<input data-on-text="Yes" data-off-text="No" data-on-color="success" data-off-color="default" <?php echo $check; ?>  type="checkbox" class="switcher btn-xs" name="awesomenewsletter_status" value="1"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label"><?php echo $entry_subscribe; ?></label>
								<div class="col-sm-10">
									<?php if(!empty($awesomenewsletter_name_status)){
										$check = "checked=checked";
									 }else{
										$check = '';
									 }
									?>
									<input <?php echo $check; ?>  data-on-text="Yes" data-off-text="No" data-on-color="success" data-off-color="default" type="checkbox" class="switcher" name="awesomenewsletter_name_status" value="1"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label"><?php echo $entry_name_required; ?></label>
								<div class="col-sm-10">
									<?php if(!empty($awesomenewsletter_name_required)){
										$check = "checked=checked";
									 }else{
										$check = '';
									 }
									?>
									<input <?php echo $check; ?>  data-on-text="Yes" data-off-text="No" data-on-color="success" data-off-color="default" type="checkbox" class="switcher" name="awesomenewsletter_name_required" value="1"/>
								</div>
							</div>
						 </div>
						 <div class="tab-pane" id="tab-newsletter-list">
							<div class="well well-sm">
								<div class="row">
									<div class="col-sm-4">
											<label><?php echo $entry_email ?></label>
											<input type="text" name="filter_email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
									</div>
									<div class="col-sm-3">
										<label><?php echo $entry_status ?></label>
										<select name="filter_status" id="input-status" class="form-control">
											<option value="*"></option>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
										</select>
									</div>
									<div class="col-sm-3">
										<label><?php echo $entry_approved ?></label>
										<select name="filter_approved" id="input-approved" class="form-control">
											<option value="*"></option>
											<option value="1"><?php echo $text_yes; ?></option>
											<option value="0"><?php echo $text_no; ?></option>
										</select>
									</div>
									<div class="col-sm-2">
										<label> &nbsp; </label>
										<button type="button" id="button-filter" class="btn btn-primary btn-block"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
									</div>
								</div>
							</div>
							<div class="well well-sm">
								<div class="row">
									<div class="col-sm-12 text-left">
										<button type="button" id="btn-del" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? deleteSubscribers() : false;"><i class="fa fa-trash-o"></i> <?php echo $button_delete; ?></button>
										<a href="<?php echo $export; ?>" data-toggle="tooltip" title="<?php echo $button_export; ?>" class="btn btn-primary"><?php echo $button_export; ?></a>
										<a data-target="#myModal" id="popupopen" data-toggle="modal" data-toggle="tooltip" data-toggle="tooltip" title="<?php echo $button_import; ?>" class="btn btn-primary"><?php echo $button_import; ?></a>
									</div>
								</div>
							</div>
							<div id="newsletter-lists">
								<div class="loader text-center"><img src="view/image/awesomenewsletter/load.gif" /></div>
							</div>
						</div>
						<div class="tab-pane" id="tab-mail">
								<div class="form-group">
										<label class="control-label col-sm-2" for="input-email"><?php echo $entry_email_template; ?></label>
										<div class="col-sm-10">
											<select name="email_template_id" class="form-control">
												<?php foreach($email_templates as $email_template) { ?>
												<option value="<?php echo $email_template['email_template_id']; ?>"><?php echo $email_template['title']; ?></option>
												<?php } ?>
											</select>
										</div>
								</div>
								<div class="form-group" id="recipient_type">
									<label class="control-label col-sm-2" for="input-recipient-type"><?php echo $entry_recipient; ?></label>
									<div class="col-sm-10">
										<select name="recipient_type" id="input-recipient-type" class="form-control">
											<option value="all_subcribe"><?php echo $text_all_subcribe; ?></option>
											<option value="all_enabled_subcribe"><?php echo $text_all_enabled_subcribe; ?></option>
											<option value="all_disabled_subcribe"><?php echo $text_all_disabled_subcribe; ?></option>
											<option value="all_approved_subcribe"><?php echo $text_all_approved_subcribe; ?></option>
											<option value="all_unapproved_subcribe"><?php echo $text_all_unapproved_subcribe; ?></option>
											<option value="selected_subcribe"><?php echo $text_selected_subcribe; ?></option>
										</select>
									</div>
								</div>
								<div class="buttons pull-right">
									<button type="button" id="button-mail-send" class="btn btn-primary"><?php echo $button_send; ?></button>
								</div>
						</div>
						<div class="tab-pane" id="tab-email-setting">
							<div class="form-group">
								<label class="col-sm-12" for="input-product"><?php echo $entry_product; ?></label>
								<div class="col-sm-12">
									<input type="text" name="awesomenewsletter_product" value="" placeholder="<?php echo $help_product; ?>" id="input-product" class="form-control" />
									<div id="newsletter-product" class="well well-sm" style="height: 150px; overflow: auto;">
										<?php foreach ($products as $product) { ?>
										<div id="newsletter-product<?php echo $product['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product['name']; ?>
											<input type="hidden" name="awesomenewsletter_product[]" value="<?php echo $product['product_id']; ?>" />
										</div>
										<?php } ?>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-12" for="input-verify-template"><?php echo $entry_verify_email; ?></label>
								<div class="col-sm-12">
									<select id="input-verify-template" name="awesomenewsletter_verify_template_id" class="form-control">
										<option value=""><?php echo $text_select; ?></option>
										<?php foreach($email_templates as $email_template) { ?>
										<?php if($email_template['email_template_id'] == $awesomenewsletter_verify_template_id) {
											$sel = 'selected="selected"';
										}else{
											$sel = '';
										} ?>
										<option <?php echo $sel; ?> value="<?php echo $email_template['email_template_id']; ?>"><?php echo $email_template['title']; ?></option>
										<?php } ?>
									</select>
									<?php if($error_verify_template) { ?>
									<div class="text-danger"><?php echo $error_verify_template; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group required">
                <label class="col-sm-12" for="input-image-thumb-width"><?php echo $entry_image_thumb; ?></label>
                <div class="col-sm-12">
                  <div class="row">
                    <div class="col-sm-6">
                      <input type="text" name="awesomenewsletter_image_thumb_width" value="<?php echo $awesomenewsletter_image_thumb_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-thumb-width" class="form-control" />
                    </div>
                    <div class="col-sm-6">
                      <input type="text" name="awesomenewsletter_image_thumb_height" value="<?php echo $awesomenewsletter_image_thumb_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                    </div>
                  </div>
                  <?php if ($error_image_thumb) { ?>
                  <div class="text-danger"><?php echo $error_image_thumb; ?></div>
                  <?php } ?>
                </div>
              </div>
							<div class="form-group">
								<label class="col-sm-12" for="input-product-limit"><?php echo $entry_product_limit; ?></label>
								<div class="col-sm-12">
									<input type="text" id="input-product-limit" name="awesomenewsletter_product_limit" value="<?php echo $awesomenewsletter_product_limit; ?>" class="form-control" />
									<?php if ($error_product_limit) { ?>
                  <div class="text-danger"><?php echo $error_product_limit; ?></div>
                  <?php } ?>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="tab-css-setting">
							<div class="form-group">
								<label class="col-sm-2 control-label"><?php echo $entry_css; ?></label>
								<div class="col-sm-10">
								 <textarea rows="10" name="awesomenewsletter_css" class="form-control"><?php echo $awesomenewsletter_css ?></textarea>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="tab-crownjob-setting">
							<div class="form-group">
								<label class="col-sm-2 control-label"><?php echo $entry_cronjob_status; ?></label>
								<div class="col-sm-10">
								 <?php if(!empty($awesomenewsletter_crownjob_status)){
									$check = "checked=checked";
								 }else{
									$check = '';
								 }
								 ?>
									<input <?php echo $check; ?>  data-on-text="Yes" data-off-text="No" data-on-color="success" data-off-color="default" type="checkbox" class="switcher" name="awesomenewsletter_crownjob_status" value="1"/>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="input-crownjob-tempalte"><?php echo $entry_email_template; ?></label>
								<div class="col-sm-10">
									<select id="input-crownjob-tempalte" name="awesomenewsletter_crownjob_tempalte_id" class="form-control">
										<option value=""><?php echo $text_select; ?></option>
										<?php foreach($email_templates as $email_template) { ?>
											<?php if($email_template['email_template_id'] == $awesomenewsletter_crownjob_tempalte_id) { 
												$sel = 'selected="selected"';
											}else{ 
												$sel = '';
											} ?>
											
											<option <?php echo $sel; ?> value="<?php echo $email_template['email_template_id']; ?>"><?php echo $email_template['title']; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="input-crown-recipient"><?php echo $entry_recipient; ?></label>
								<div class="col-sm-10">
									<select name="awesomenewsletter_crownjob_recipient" id="input-crown-recipient" class="form-control">
										<option value=""><?php echo $text_select; ?></option>
										<option <?php echo ($awesomenewsletter_crownjob_recipient == 'all_subcribe') ? 'selected' : ''; ?> value="all_subcribe"><?php echo $text_all_subcribe; ?></option>
										<option <?php echo ($awesomenewsletter_crownjob_recipient == 'all_enabled_subcribe') ? 'selected' : ''; ?> value="all_enabled_subcribe"><?php echo $text_all_enabled_subcribe; ?></option>
										<option <?php echo ($awesomenewsletter_crownjob_recipient == 'all_disabled_subcribe') ? 'selected' : ''; ?> value="all_disabled_subcribe"><?php echo $text_all_disabled_subcribe; ?></option>
										<option <?php echo ($awesomenewsletter_crownjob_recipient == 'all_approved_subcribe') ? 'selected' : ''; ?> value="all_approved_subcribe"><?php echo $text_all_approved_subcribe; ?></option>
										<option <?php echo ($awesomenewsletter_crownjob_recipient == 'all_unapproved_subcribe') ? 'selected' : ''; ?> value="all_unapproved_subcribe"><?php echo $text_all_unapproved_subcribe; ?></option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="input-crown-url"><?php echo $entry_crown_url; ?></label>
								<div class="col-sm-10">
									<div class="form-control"><?php echo $awesomenewsletter_crownjob_url; ?></div>
									
									<span class="help">
										<i class="fa fa-info-circle"></i> Add Cron Job
									</span>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="tab-verify-language-setting">
							<ul class="nav nav-tabs" id="verify-language">
                <?php foreach ($languages as $language) { ?>
                <li>
									<a href="#verify-language<?php echo $language['language_id']; ?>" data-toggle="tab">
										<?php if(VERSION >= '2.2.0.0') { ?>
										<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
										<?php } else { ?> 
										<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> 
										<?php } ?>
										<?php echo $language['name']; ?>
									</a>
								</li>
                <?php } ?>
              </ul>
							<div class="tab-content">
                <?php foreach ($languages as $language) { ?>
                <div class="tab-pane" id="verify-language<?php echo $language['language_id']; ?>">
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-verify-title<?php echo $language['language_id']; ?>"><?php echo $entry_title; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="awesomenewsletter_verify_description[<?php echo $language['language_id']; ?>][verify_title]" value="<?php echo isset($awesomenewsletter_verify_description[$language['language_id']]) ? $awesomenewsletter_verify_description[$language['language_id']]['verify_title'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" id="input-verify-title<?php echo $language['language_id']; ?>" class="form-control" />
                    </div>
                  </div>
									<div class="form-group">
                    <label class="col-sm-2 control-label" for="input-verify-success-description<?php echo $language['language_id']; ?>"><?php echo $entry_success_description; ?></label>
                    <div class="col-sm-10">
                      <textarea type="text" name="awesomenewsletter_verify_description[<?php echo $language['language_id']; ?>][verify_success_description]" id="input-verify-success-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($awesomenewsletter_verify_description[$language['language_id']]) ? $awesomenewsletter_verify_description[$language['language_id']]['verify_success_description'] : ''; ?></textarea>
                    </div>
                  </div>
					<div class="form-group">
                    <label class="col-sm-2 control-label" for="input-verify-already-description<?php echo $language['language_id']; ?>"><?php echo $entry_already_description; ?></label>
                    <div class="col-sm-10">
                      <textarea type="text" name="awesomenewsletter_verify_description[<?php echo $language['language_id']; ?>][verify_already_description]" id="input-verify-already-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($awesomenewsletter_verify_description[$language['language_id']]) ? $awesomenewsletter_verify_description[$language['language_id']]['verify_already_description'] : ''; ?></textarea>
                    </div>
                  </div>
									<div class="form-group">
                    <label class="col-sm-2 control-label" for="input-verify-notfound-description<?php echo $language['language_id']; ?>"><?php echo $entry_notfound_description; ?></label>
                    <div class="col-sm-10">
                      <textarea type="text" name="awesomenewsletter_verify_description[<?php echo $language['language_id']; ?>][verify_notfound_description]" id="input-verify-notfound-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($awesomenewsletter_verify_description[$language['language_id']]) ? $awesomenewsletter_verify_description[$language['language_id']]['verify_notfound_description'] : ''; ?></textarea>
                    </div>
                  </div>
									<div class="form-group">
                    <label class="col-sm-2 control-label" for="input-verify-button<?php echo $language['language_id']; ?>"><?php echo $entry_button; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="awesomenewsletter_verify_description[<?php echo $language['language_id']; ?>][verify_button]" value="<?php echo isset($awesomenewsletter_verify_description[$language['language_id']]) ? $awesomenewsletter_verify_description[$language['language_id']]['verify_button'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" id="input-verify-button<?php echo $language['language_id']; ?>" class="form-control" />
                    </div>
                  </div>
								</div>
								<?php } ?>
							</div>
						</div>
						<div class="tab-pane" id="tab-unsubscribe-language-setting">
							<ul class="nav nav-tabs" id="unsubscribe-language">
                <?php foreach ($languages as $language) { ?>
                <li>
									<a href="#unsubscribe-language<?php echo $language['language_id']; ?>" data-toggle="tab">
										<?php if(VERSION >= '2.2.0.0') { ?>
										<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
										<?php } else { ?> 
										<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> 
										<?php } ?>
										<?php echo $language['name']; ?>
									</a>
								</li>
                <?php } ?>
              </ul>
							<div class="tab-content">
                <?php foreach ($languages as $language) { ?>
                <div class="tab-pane" id="unsubscribe-language<?php echo $language['language_id']; ?>">
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-unsubscribe-title<?php echo $language['language_id']; ?>"><?php echo $entry_title; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="awesomenewsletter_unsubscribe_description[<?php echo $language['language_id']; ?>][unsubscribe_title]" value="<?php echo isset($awesomenewsletter_unsubscribe_description[$language['language_id']]) ? $awesomenewsletter_unsubscribe_description[$language['language_id']]['unsubscribe_title'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" id="input-unsubscribe-title<?php echo $language['language_id']; ?>" class="form-control" />
                    </div>
                  </div>
									<div class="form-group">
                    <label class="col-sm-2 control-label" for="input-unsubscribe-success-description<?php echo $language['language_id']; ?>"><?php echo $entry_unsubscribe_success_description; ?></label>
                    <div class="col-sm-10">
                      <textarea type="text" name="awesomenewsletter_unsubscribe_description[<?php echo $language['language_id']; ?>][unsubscribe_success_description]" id="input-unsubscribe-success-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($awesomenewsletter_unsubscribe_description[$language['language_id']]) ? $awesomenewsletter_unsubscribe_description[$language['language_id']]['unsubscribe_success_description'] : ''; ?></textarea>
                    </div>
                  </div>
									<div class="form-group">
                    <label class="col-sm-2 control-label" for="input-unsubscribe-already-description<?php echo $language['language_id']; ?>"><?php echo $entry_unsubscribe_already_description; ?></label>
                    <div class="col-sm-10">
                      <textarea type="text" name="awesomenewsletter_unsubscribe_description[<?php echo $language['language_id']; ?>][unsubscribe_already_description]" id="input-unsubscribe-already-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($awesomenewsletter_unsubscribe_description[$language['language_id']]) ? $awesomenewsletter_unsubscribe_description[$language['language_id']]['unsubscribe_already_description'] : ''; ?></textarea>
                    </div>
                  </div>
									<div class="form-group">
                    <label class="col-sm-2 control-label" for="input-unsubscribe-notfound-description<?php echo $language['language_id']; ?>"><?php echo $entry_unsubscribe_notfound_description; ?></label>
                    <div class="col-sm-10">
                      <textarea type="text" name="awesomenewsletter_unsubscribe_description[<?php echo $language['language_id']; ?>][unsubscribe_notfound_description]" id="input-unsubscribe-notfound-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($awesomenewsletter_unsubscribe_description[$language['language_id']]) ? $awesomenewsletter_unsubscribe_description[$language['language_id']]['unsubscribe_notfound_description'] : ''; ?></textarea>
                    </div>
                  </div>
									<div class="form-group">
                    <label class="col-sm-2 control-label" for="input-unsubscribe-button<?php echo $language['language_id']; ?>"><?php echo $entry_button; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="awesomenewsletter_unsubscribe_description[<?php echo $language['language_id']; ?>][unsubscribe_button]" value="<?php echo isset($awesomenewsletter_unsubscribe_description[$language['language_id']]) ? $awesomenewsletter_unsubscribe_description[$language['language_id']]['unsubscribe_button'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" id="input-unsubscribe-button<?php echo $language['language_id']; ?>" class="form-control" />
                    </div>
                  </div>
								</div>
								<?php } ?>
							</div>
						</div>
						<div class="tab-pane" id="tab-popup-language-setting">
							<ul class="nav nav-tabs" id="popup-language">
                <?php foreach ($languages as $language) { ?>
                <li>
									<a href="#popup-language<?php echo $language['language_id']; ?>" data-toggle="tab">
										<?php if(VERSION >= '2.2.0.0') { ?>
										<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
										<?php } else { ?> 
										<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> 
										<?php } ?>
										<?php echo $language['name']; ?>
									</a>
								</li>
                <?php } ?>
              </ul>
							<div class="tab-content">
                <?php foreach ($languages as $language) { ?>
                <div class="tab-pane" id="popup-language<?php echo $language['language_id']; ?>">
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-title<?php echo $language['language_id']; ?>"><?php echo $entry_title; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="awesomenewsletter_popups_description[<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($awesomenewsletter_popups_description[$language['language_id']]) ? $awesomenewsletter_popups_description[$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" id="input-title<?php echo $language['language_id']; ?>" class="form-control" />
                    </div>
                  </div>
									<div class="form-group">
                    <label class="col-sm-2 control-label" for="input-popup-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                    <div class="col-sm-10">
                      <textarea type="text" name="awesomenewsletter_popups_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-popup-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($awesomenewsletter_popups_description[$language['language_id']]) ? $awesomenewsletter_popups_description[$language['language_id']]['description'] : ''; ?></textarea>
                    </div>
                  </div>
									<div class="form-group">
                    <label class="col-sm-2 control-label" for="input-button<?php echo $language['language_id']; ?>"><?php echo $entry_button; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="awesomenewsletter_popups_description[<?php echo $language['language_id']; ?>][button]" value="<?php echo isset($awesomenewsletter_popups_description[$language['language_id']]) ? $awesomenewsletter_popups_description[$language['language_id']]['button'] : ''; ?>" placeholder="<?php echo $entry_button; ?>" id="input-button<?php echo $language['language_id']; ?>" class="form-control" />
                    </div>
                  </div>
									<div class="form-group">
                    <label class="col-sm-2 control-label" for="input-success<?php echo $language['language_id']; ?>"><?php echo $entry_success; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="awesomenewsletter_popups_description[<?php echo $language['language_id']; ?>][success]" value="<?php echo isset($awesomenewsletter_popups_description[$language['language_id']]) ? $awesomenewsletter_popups_description[$language['language_id']]['success'] : ''; ?>" placeholder="<?php echo $entry_success; ?>" id="input-success<?php echo $language['language_id']; ?>" class="form-control" />
                    </div>
                  </div>
									<div class="form-group">
                    <label class="col-sm-2 control-label" for="input-exists-error<?php echo $language['language_id']; ?>"><?php echo $entry_exists_error; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="awesomenewsletter_popups_description[<?php echo $language['language_id']; ?>][exists_error]" value="<?php echo isset($awesomenewsletter_popups_description[$language['language_id']]) ? $awesomenewsletter_popups_description[$language['language_id']]['exists_error'] : ''; ?>" placeholder="<?php echo $entry_exists_error; ?>" id="input-exists-error<?php echo $language['language_id']; ?>" class="form-control" />
                    </div>
                  </div>
									<div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_subscribe; ?></label>
										<div class="col-sm-10 table-responsive">
											<table class="table table-bordered table-hover">
												<thead>
												 <tr>
													<td class="text-left"><?php echo $entry_title; ?></td>
													<td class="text-left"><?php echo $entry_placeholder; ?></td>
													<td class="text-left"><?php echo $entry_error; ?></td>
												</tr>
												</thead>
												<tbody>
												<tr>
													<td class="text-left">
														<input type="text" name="awesomenewsletter_popups_description[<?php echo $language['language_id']; ?>][name_title]" value="<?php echo isset($awesomenewsletter_popups_description[$language['language_id']]) ? $awesomenewsletter_popups_description[$language['language_id']]['name_title'] : ''; ?>" class="form-control" />
													</td>
													<td class="text-left">
														<input type="text" name="awesomenewsletter_popups_description[<?php echo $language['language_id']; ?>][name_placeholder]" value="<?php echo isset($awesomenewsletter_popups_description[$language['language_id']]) ? $awesomenewsletter_popups_description[$language['language_id']]['name_placeholder'] : ''; ?>" class="form-control" />
													</td>
													<td class="text-left">
														<input type="text" name="awesomenewsletter_popups_description[<?php echo $language['language_id']; ?>][name_error]" value="<?php echo isset($awesomenewsletter_popups_description[$language['language_id']]) ? $awesomenewsletter_popups_description[$language['language_id']]['name_error'] : ''; ?>"  class="form-control" />
													</td>
												</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_subscribe_email; ?></label>
										<div class="col-sm-10 table-responsive">
											<table class="table table-bordered table-hover">
												<thead>
												 <tr>
													<td class="text-left"><?php echo $entry_title; ?></td>
													<td class="text-left"><?php echo $entry_placeholder; ?></td>
													<td class="text-left"><?php echo $entry_error; ?></td>
												</tr>
												</thead>
												<tbody>
												<tr>
													<td class="text-left">
														<input type="text" name="awesomenewsletter_popups_description[<?php echo $language['language_id']; ?>][email_title]" value="<?php echo isset($awesomenewsletter_popups_description[$language['language_id']]) ? $awesomenewsletter_popups_description[$language['language_id']]['email_title'] : ''; ?>" class="form-control" />
													</td>
													<td class="text-left">
														<input type="text" name="awesomenewsletter_popups_description[<?php echo $language['language_id']; ?>][email_placeholder]" value="<?php echo isset($awesomenewsletter_popups_description[$language['language_id']]) ? $awesomenewsletter_popups_description[$language['language_id']]['email_placeholder'] : ''; ?>" class="form-control" />
													</td>
													<td class="text-left">
														<input type="text" name="awesomenewsletter_popups_description[<?php echo $language['language_id']; ?>][email_error]" value="<?php echo isset($awesomenewsletter_popups_description[$language['language_id']]) ? $awesomenewsletter_popups_description[$language['language_id']]['email_error'] : ''; ?>" class="form-control" />
													</td>
												</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<?php } ?>
							</div>
						</div>
						<div class="tab-pane" id="tab-module-language-setting">
							<ul class="nav nav-tabs" id="module-language">
                <?php foreach ($languages as $language) { ?>
                <li>
									<a href="#module-language<?php echo $language['language_id']; ?>" data-toggle="tab">
										<?php if(VERSION >= '2.2.0.0') { ?>
										<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
										<?php } else { ?> 
										<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> 
										<?php } ?>
										<?php echo $language['name']; ?>
									</a>
								</li>
                <?php } ?>
              </ul>
							<div class="tab-content">
                <?php foreach ($languages as $language) { ?>
                <div class="tab-pane" id="module-language<?php echo $language['language_id']; ?>">
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-title<?php echo $language['language_id']; ?>"><?php echo $entry_title; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="awesomenewsletter_modules_description[<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($awesomenewsletter_modules_description[$language['language_id']]) ? $awesomenewsletter_modules_description[$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" id="input-title<?php echo $language['language_id']; ?>" class="form-control" />
                    </div>
                  </div>
									<div class="form-group">
                    <label class="col-sm-2 control-label" for="input-module-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                    <div class="col-sm-10">
                      <textarea type="text" name="awesomenewsletter_modules_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-module-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($awesomenewsletter_modules_description[$language['language_id']]) ? $awesomenewsletter_modules_description[$language['language_id']]['description'] : ''; ?></textarea>
                    </div>
                  </div>
									<div class="form-group">
                    <label class="col-sm-2 control-label" for="input-button<?php echo $language['language_id']; ?>"><?php echo $entry_button; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="awesomenewsletter_modules_description[<?php echo $language['language_id']; ?>][button]" value="<?php echo isset($awesomenewsletter_modules_description[$language['language_id']]) ? $awesomenewsletter_modules_description[$language['language_id']]['button'] : ''; ?>" placeholder="<?php echo $entry_button; ?>" id="input-button<?php echo $language['language_id']; ?>" class="form-control" />
                    </div>
                  </div>
									<div class="form-group">
                    <label class="col-sm-2 control-label" for="input-success<?php echo $language['language_id']; ?>"><?php echo $entry_success; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="awesomenewsletter_modules_description[<?php echo $language['language_id']; ?>][success]" value="<?php echo isset($awesomenewsletter_modules_description[$language['language_id']]) ? $awesomenewsletter_modules_description[$language['language_id']]['success'] : ''; ?>" placeholder="<?php echo $entry_success; ?>" id="input-success<?php echo $language['language_id']; ?>" class="form-control" />
                    </div>
                  </div>
									<div class="form-group">
                    <label class="col-sm-2 control-label" for="input-exists-error<?php echo $language['language_id']; ?>"><?php echo $entry_exists_error; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="awesomenewsletter_modules_description[<?php echo $language['language_id']; ?>][exists_error]" value="<?php echo isset($awesomenewsletter_modules_description[$language['language_id']]) ? $awesomenewsletter_modules_description[$language['language_id']]['exists_error'] : ''; ?>" placeholder="<?php echo $entry_exists_error; ?>" id="input-exists-error<?php echo $language['language_id']; ?>" class="form-control" />
                    </div>
                  </div>
									<div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_subscribe; ?></label>
										<div class="col-sm-10 table-responsive">
											<table class="table table-bordered table-hover">
												<thead>
												 <tr>
													<td class="text-left"><?php echo $entry_title; ?></td>
													<td class="text-left"><?php echo $entry_placeholder; ?></td>
													<td class="text-left"><?php echo $entry_error; ?></td>
												</tr>
												</thead>
												<tbody>
												<tr>
													<td class="text-left">
														<input type="text" name="awesomenewsletter_modules_description[<?php echo $language['language_id']; ?>][name_title]" value="<?php echo isset($awesomenewsletter_modules_description[$language['language_id']]) ? $awesomenewsletter_modules_description[$language['language_id']]['name_title'] : ''; ?>" class="form-control" />
													</td>
													<td class="text-left">
														<input type="text" name="awesomenewsletter_modules_description[<?php echo $language['language_id']; ?>][name_placeholder]" value="<?php echo isset($awesomenewsletter_modules_description[$language['language_id']]) ? $awesomenewsletter_modules_description[$language['language_id']]['name_placeholder'] : ''; ?>" class="form-control" />
													</td>
													<td class="text-left">
														<input type="text" name="awesomenewsletter_modules_description[<?php echo $language['language_id']; ?>][name_error]" value="<?php echo isset($awesomenewsletter_modules_description[$language['language_id']]) ? $awesomenewsletter_modules_description[$language['language_id']]['name_error'] : ''; ?>"  class="form-control" />
													</td>
												</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_subscribe_email; ?></label>
										<div class="col-sm-10 table-responsive">
											<table class="table table-bordered table-hover">
												<thead>
												 <tr>
													<td class="text-left"><?php echo $entry_title; ?></td>
													<td class="text-left"><?php echo $entry_placeholder; ?></td>
													<td class="text-left"><?php echo $entry_error; ?></td>
												</tr>
												</thead>
												<tbody>
												<tr>
													<td class="text-left">
														<input type="text" name="awesomenewsletter_modules_description[<?php echo $language['language_id']; ?>][email_title]" value="<?php echo isset($awesomenewsletter_modules_description[$language['language_id']]) ? $awesomenewsletter_modules_description[$language['language_id']]['email_title'] : ''; ?>" class="form-control" />
													</td>
													<td class="text-left">
														<input type="text" name="awesomenewsletter_modules_description[<?php echo $language['language_id']; ?>][email_placeholder]" value="<?php echo isset($awesomenewsletter_modules_description[$language['language_id']]) ? $awesomenewsletter_modules_description[$language['language_id']]['email_placeholder'] : ''; ?>" class="form-control" />
													</td>
													<td class="text-left">
														<input type="text" name="awesomenewsletter_modules_description[<?php echo $language['language_id']; ?>][email_error]" value="<?php echo isset($awesomenewsletter_modules_description[$language['language_id']]) ? $awesomenewsletter_modules_description[$language['language_id']]['email_error'] : ''; ?>" class="form-control" />
													</td>
												</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<?php } ?>
							</div>
						</div>
						<div class="tab-pane" id="tab-popup-setting">
							<div class="form-group">
								<label class="col-sm-2 control-label"><?php echo $entry_popup; ?></label>
								<div class="col-sm-10">
								 <?php if(!empty($awesomenewsletter_popup_status)){
									$check = "checked=checked";
								 }else{
									$check = '';
								 }
								 ?>
									<input <?php echo $check; ?>  data-on-text="Yes" data-off-text="No" data-on-color="success" data-off-color="default" type="checkbox" class="switcher" name="awesomenewsletter_popup_status" value="1"/>
								</div>
							</div>
							<div class="form-group">
                <label class="col-sm-2 control-label" for="input-logo"><?php echo $entry_logo; ?></label>
                <div class="col-sm-10"><a href="" id="thumb-logo" data-toggle="image" class="img-thumbnail"><img src="<?php echo $logo; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                  <input type="hidden" name="awesomenewsletter_popup_logo" value="<?php echo $awesomenewsletter_popup_logo; ?>" id="input-logo" />
                </div>
              </div>
							<div class="form-group">
                <label class="col-sm-2 control-label" for="input-background"><?php echo $entry_background; ?></label>
                <div class="col-sm-10"><a href="" id="thumb-background" data-toggle="image" class="img-thumbnail"><img src="<?php echo $background_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                  <input type="hidden" name="awesomenewsletter_popup_background" value="<?php echo $awesomenewsletter_popup_background; ?>" id="input-background" />
                </div>
              </div>
							<div class="form-group">
								<label class="col-sm-2 control-label"><?php echo $entry_popup_again; ?></label>
								<div class="col-sm-10">
								 <?php if(!empty($awesomenewsletter_popup_again)){
									$check = "checked=checked";
								 }else{
									$check = '';
								 }
								 ?>
									<input <?php echo $check; ?>  data-on-text="Yes" data-off-text="No" data-on-color="success" data-off-color="default" type="checkbox" class="switcher" name="awesomenewsletter_popup_again" value="1"/>
								</div>
							</div>
							<div class="form-group">
                <label class="col-sm-2 control-label" for="input-seconds"><?php echo $entry_seconds; ?></label>
                <div class="col-sm-2">
                  <input type="text" name="awesomenewsletter_popup_seconds" value="<?php echo $awesomenewsletter_popup_seconds; ?>" id="input-seconds" class="form-control" />
                </div>
              </div>
						</div>
						<div class="tab-pane" id="tab-footer-setting">
							<div class="form-group"> 
								<label class="col-sm-2 control-label"><span title="" data-toggle="tooltip" data-original-title="<?php echo $entry_footer; ?>"><?php echo $entry_footer; ?></span></label>
								<div class="col-sm-10">
								 <?php if(!empty($awesomenewsletter_footer_status)){
									$check = "checked=checked";
								 }else{
									$check = '';
								 }
								 ?>
									<input <?php echo $check; ?>  data-on-text="Yes" data-off-text="No" data-on-color="success" data-off-color="default" type="checkbox" class="switcher" name="awesomenewsletter_footer_status" value="1"/>
								</div>
							</div>
						</div>
						
						<div class="tab-pane" id="tab-support">
							<p class="text-center">For Support and Query Feel Free to contact:<br /><strong>extensionsbazaar@gmail.com</strong></p>
						</div>
					</div>
				</form>
      </div>
    </div>
  </div>
</div>
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
	<!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"><?php echo $button_import; ?></h4>
      </div>
      <div class="modal-body" style="overflow:auto;">
        <form class="form-horizontal" action="<?php echo $xlsimport; ?>" method="post" enctype="multipart/form-data" id="form-subscribers">
		  <div class="form-group">
				<label class="control-label col-lg-2" for="input-import">Import Here</label>
				<div class="col-lg-10">
					 <input style="height:37px; margin-top:5px;" type="file" name="import" value=""/>
				</div>
		  </div>
		  <div class="pull-right">
				<button onclick="$('#form-subscribers').submit()" class="btn btn-primary">Submit</button>
		  </div>
		</form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
  $(".switcher").bootstrapSwitch({
		size : 'small'
	});
  
  $(".switcherx").bootstrapSwitch({
    disabled:true
  });
$.fn.bootstrapSwitch.defaults.onColor = 'success';
//--></script>
<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
<link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
<script type="text/javascript"><!--
$(document).ready(function() {
	// Override summernotes image manager
	$('.summernote').each(function() {
		var element = this;
		
		$(element).summernote({
			disableDragAndDrop: true,
			height: 150,
			emptyPara: '',
			toolbar: [
				['style', ['style']],
				['font', ['bold', 'underline', 'clear']],
				['fontname', ['fontname']],
				['color', ['color']],
				['para', ['ul', 'ol', 'paragraph']],
				['table', ['table']],
				['insert', ['link', 'image', 'video']],
				['view', ['fullscreen', 'codeview', 'help']]
			],
			buttons: {
    			image: function() {
					var ui = $.summernote.ui;

					// create button
					var button = ui.button({
						contents: '<i class="note-icon-picture" />',
						tooltip: $.summernote.lang[$.summernote.options.lang].image.image,
						click: function () {
							$('#modal-image').remove();
						
							$.ajax({
								url: 'index.php?route=common/filemanager&token=' + getURLVar('token'),
								dataType: 'html',
								beforeSend: function() {
									$('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
									$('#button-image').prop('disabled', true);
								},
								complete: function() {
									$('#button-image i').replaceWith('<i class="fa fa-upload"></i>');
									$('#button-image').prop('disabled', false);
								},
								success: function(html) {
									$('body').append('<div id="modal-image" class="modal">' + html + '</div>');
									
									$('#modal-image').modal('show');
									
									$('#modal-image').delegate('a.thumbnail', 'click', function(e) {
										e.preventDefault();
										
										$(element).summernote('insertImage', $(this).attr('href'));
																	
										$('#modal-image').modal('hide');
									});
								}
							});						
						}
					});
				
					return button.render();
				}
  			}
		});
	});
	
});
//--></script> 
  <script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	var url = 'index.php?route=extension/module/awesomenewsletter/getSubscribers&token=<?php echo $token; ?>';

	var filter_email = $('input[name=\'filter_email\']').val();
	if (filter_email) {
		url += '&filter_email=' + encodeURIComponent(filter_email);
	}

	var filter_status = $('select[name=\'filter_status\']').val();
	if (filter_status != '*') {
		url += '&filter_status=' + encodeURIComponent(filter_status);
	}
	
	var filter_approved = $('select[name=\'filter_approved\']').val();
	if (filter_approved != '*') {
		url += '&filter_approved=' + encodeURIComponent(filter_approved);
	}

	getSubscribers(url);
});
//--></script>
<script type="text/javascript"><!--
$(document).ready(function() {
	var url = 'index.php?route=extension/module/awesomenewsletter/getSubscribers&token=<?php echo $token; ?>';
	
	getSubscribers(url);
});

$('#newsletter-lists').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();

	
	getSubscribers(this.href);
});

$('#newsletter-lists').delegate('thead tr td.sortorder a', 'click', function(e) {
	e.preventDefault();

	
	getSubscribers(this.href);
});

function getSubscribers(url) {
	$.ajax({
		url: url,
		dataType: 'html',
		beforeSend: function() {
			$('#newsletter-lists').html('<div class="loader text-center"><img src="view/image/awesomenewsletter/load.gif" /></div>');
		},
		complete: function() {
			$('.loader').remove();
		},
		success: function(html) {
			$('#newsletter-lists').html(html);
		}
	});
}
//--></script>
<script type="text/javascript"><!--
$('input[name=\'awesomenewsletter_product\']').autocomplete({
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
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
		$('input[name=\'awesomenewsletter_product\']').val('');
		
		$('#newsletter-product' + item['value']).remove();
		
		$('#newsletter-product').append('<div id="newsletter-product' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="awesomenewsletter_product[]" value="' + item['value'] + '" /></div>');	
	}
});
	
$('#newsletter-product').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script>

<script type="text/javascript"><!--
$('#tab-mail select[name=\'recipient_type\']').change(function() {
	
	$('#selected_subcribe').remove();
	
	var recipient_type = $('#tab-mail select[name=\'recipient_type\']').val();
	
	if(recipient_type == 'selected_subcribe') {
		var html = '<div class="form-group" id="selected_subcribe">';
			html += '<label class="col-sm-2 control-label" for="input-recipient-email"><?php echo $entry_recipient_email; ?></label>';
			html += '<div class="col-sm-10">';
				html += '<input type="text" name="recipient_email_input" value="" placeholder="<?php echo $help_recipient_email; ?>" id="input-recipient-email" class="form-control" />';
				html += '<div id="newsletter-email" class="well well-sm" style="height: 150px; overflow: auto;">';
				html += '</div>';
			html += '</div>';
		html += '</div>';
	}
	$('#recipient_type').after(html);
	
	$('input[name=\'recipient_email_input\']').autocomplete({
		source: function(request, response) {
			$.ajax({
				url: 'index.php?route=extension/module/awesomenewsletter/autocomplete&token=<?php echo $token; ?>&filter_email=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['email'],
							value: item['awesomenewsletter_id']
						}
					}));
				}
			});
		},
		select: function(item) {
			$('input[name=\'recipient_email_input\']').val('');
			
			$('#newsletter-email' + item['value']).remove();
			
			$('#newsletter-email').append('<div id="newsletter-email' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="recipient_email[]" value="' + item['value'] + '" /></div>');	
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#tab-mail #button-mail-send').click(function() {
	$.ajax({
		url: 'index.php?route=extension/module/awesomenewsletter/SendEmail&token=<?php echo $token; ?>',
		type: 'post',
		dataType: 'json',
		data: $('#tab-mail input[type=\'hidden\'], #tab-mail select'),
		beforeSend: function() {
			$('#tab-mail #button-mail-send').button('loading');
		},
		complete: function() {
			$('#tab-mail #button-mail-send').button('reset');
		},
		success: function(json) {
			$('.alert').remove();
			
			if(json['warning']) {
				$('.panel.panel-default').before('<div class="alert alert-warning"><i class="fa fa-check-circle"></i> '+ json['warning'] +'<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
			
			if(json['success']) {
				$('.panel.panel-default').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> '+ json['success'] +'<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--	
$(document).delegate('#newsletter-email .fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script>
<script type="text/javascript"><!--
$('#language a:first').tab('show');
$('#module-language a:first').tab('show');
$('#popup-language a:first').tab('show');
$('#verify-language a:first').tab('show');
$('#unsubscribe-language a:first').tab('show');
//--></script>
<?php echo $footer; ?>