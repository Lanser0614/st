<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="button" onclick="saveStay()" data-toggle="tooltip" title="<?php echo $button_apply; ?>" class="btn btn-default"><i class="fa fa-check"></i></button>
        <button type="submit" form="form-livesearch" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><i class="fa fa-search fa-fw"></i> <?php echo $heading_title; ?></h1>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-livesearch" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <?php $checked = ($sla_live_search_ajax_enable)? 'checked="checked"':''; ?>
              <label class="switcher" title="<?php echo $entry_status; ?>">
                <input name="sla_live_search_ajax_enable" value="1" type="checkbox" <?php echo $checked; ?>>
                <span><span></span></span></label>			
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-selector"><?php echo $entry_selector; ?></label>
            <div class="col-sm-10">
              <input type="text" name="sla_live_search_selector" value="<?php echo $sla_live_search_selector; ?>" placeholder="<?php $entry_selector; ?>" id="input-selector" class="form-control" />
            </div>
          </div>
		
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-search-description"><?php echo $entry_search_include_description; ?></label>
            <div class="col-sm-10">
              <?php $checked = ($sla_live_search_description)? 'checked="checked"':''; ?>
              <label class="switcher" title="<?php echo $entry_search_include_description; ?>">
                <input name="sla_live_search_description" value="1" type="checkbox" <?php echo $checked; ?>>
                <span><span></span></span></label>			
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-show-description"><?php echo $entry_show_description; ?></label>
            <div class="col-sm-10">
              <?php $checked = ($sla_live_search_show_description)? 'checked="checked"':''; ?>
              <label class="switcher" title="<?php echo $entry_show_description; ?>">
              <input name="sla_live_search_show_description" value="1" type="checkbox" <?php echo $checked; ?>>
              <span><span></span></span></label>			
            </div>
          </div>
		  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-show-image"><?php echo $entry_show_image; ?></label>
            <div class="col-sm-10">
              <?php $checked = ($sla_live_search_show_image)? 'checked="checked"':''; ?>
              <label class="switcher" title="<?php echo $entry_show_image; ?>">
                <input name="sla_live_search_show_image" value="1" type="checkbox" <?php echo $checked; ?>>
                <span><span></span></span></label> <?php echo $entry_show_image; ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-show-first"><?php echo $entry_first; ?></label>
            <div class="col-sm-10">
              <?php $checked = ($sla_live_search_first)? 'checked="checked"':''; ?>
              <label class="switcher" title="<?php echo $entry_first; ?>">
                <input name="sla_live_search_first" value="1" type="checkbox" <?php echo $checked; ?>>
                <span><span></span></span></label><?php echo $entry_first; ?>
				<div class="text-warning"><?php echo $help_first; ?></div>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-show-hight-light"><?php echo $entry_high_light; ?></label>
            <div class="col-sm-10">
              <?php $checked = ($sla_live_search_high_light)? 'checked="checked"':''; ?>
              <label class="switcher" title="<?php echo $entry_high_light; ?>">
                <input name="sla_live_search_high_light" value="1" type="checkbox" <?php echo $checked; ?>>
                <span><span></span></span></label><?php echo $entry_high_light; ?>
            </div>
          </div>
          <fieldset><legend><?php echo $text_product; ?></legend>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-show-price"><?php echo $entry_show_price; ?></label>
              <div class="col-sm-10">
                <?php $checked = ($sla_live_search_show_price)? 'checked="checked"':''; ?>
                <label class="switcher" title="<?php echo $entry_show_price; ?>">
                <input name="sla_live_search_show_price" value="1" type="checkbox" <?php echo $checked; ?>>
                <span><span></span></span></label>			
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-show-model"><?php echo $entry_show_search_model; ?></label>
              <div class="col-sm-10">
                <div id="catalog_items">
                  <div class="list-group-item">
                    <?php $checked = ($sla_live_search_show_model)? 'checked="checked"':''; ?>
                    <label class="switcher" title="<?php echo $entry_show_model; ?>">
                    <input name="sla_live_search_show_model" value="1" type="checkbox" <?php echo $checked; ?>>
                    <span><span></span></span></label><?php echo $entry_show_model; ?>	
                  </div>
                  <div class="list-group-item">
                    <?php $checked = ($sla_live_search_model)? 'checked="checked"':''; ?>
                    <label class="switcher" title="<?php echo $entry_search_model; ?>">
                    <input name="sla_live_search_model" value="1" type="checkbox" <?php echo $checked; ?>>
                    <span><span></span></span></label><?php echo $entry_search_model; ?>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-show-model"><?php echo $entry_show_search_sku; ?></label>
              <div class="col-sm-10">
                <div id="catalog_items">
                  <div class="list-group-item">
                    <?php $checked = ($sla_live_search_show_sku)? 'checked="checked"':''; ?>
                    <label class="switcher" title="<?php echo $entry_show_sku; ?>">
                    <input name="sla_live_search_show_sku" value="1" type="checkbox" <?php echo $checked; ?>>
                    <span><span></span></span></label><?php echo $entry_show_sku; ?>
                  </div>
                  <div class="list-group-item">
                    <?php $checked = ($sla_live_search_sku)? 'checked="checked"':''; ?>
                    <label class="switcher" title="<?php echo $entry_search_sku; ?>">
                    <input name="sla_live_search_sku" value="1" type="checkbox" <?php echo $checked; ?>>
                    <span><span></span></span></label><?php echo $entry_search_sku; ?>
                  </div>
                </div>			  
              </div>
            </div>
<?php /*
            <div class="form-group required">
              <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_all_results; ?>"><?php echo $entry_all_results; ?></span></label>
              <div class="col-sm-10">
                <?php foreach ($languages as $language) { ?>
                <div class="input-group"> <span class="input-group-addon"><img src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                  <input type="text" name="sla_live_search_all_results[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($sla_live_search_all_results[$language['language_id']]) ? $sla_live_search_all_results[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $text_all_results; ?>" class="form-control" />
                </div>
                <?php if (isset($error_all_results[$language['language_id']])) { ?>
                <div class="text-danger"><?php echo $error_all_results[$language['language_id']]; ?></div>
                <?php } ?>
                <?php } ?>
              </div>
            </div>
*/ ?>		

            <div class="form-group required">
              <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_heading_product; ?>"><?php echo $entry_heading_product; ?></span></label>
              <div class="col-sm-10">
                <?php foreach ($languages as $language) { ?>
                <div class="input-group"> <span class="input-group-addon"><img src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                  <input type="text" name="sla_live_search_heading_product[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($sla_live_search_heading_product[$language['language_id']]) ? $sla_live_search_heading_product[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_heading_product; ?>" class="form-control" />
                </div>
                <?php if (isset($error_heading_product[$language['language_id']])) { ?>
                <div class="text-danger"><?php echo $error_heading_product[$language['language_id']]; ?></div>
                <?php } ?>
                <?php } ?>
                <div class="text-warning"><?php echo $help_header_product; ?></div> 
              </div>
            </div>
          </fieldset>
          <fieldset><legend><?php echo $text_category; ?></legend>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-search-category"><?php echo $entry_search_category; ?></label>
              <div class="col-sm-10">
                <?php $checked = ($sla_live_search_category)? 'checked="checked"':''; ?>
                <label class="switcher" title="<?php echo $entry_status; ?>">
                <input name="sla_live_search_category" value="1" type="checkbox" <?php echo $checked; ?>>
                <span><span></span></span></label>			
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-search-category"><?php echo $entry_show_count_products; ?></label>
              <div class="col-sm-10">
                <?php $checked = ($sla_live_search_show_count_category)? 'checked="checked"':''; ?>
                <label class="switcher" title="<?php echo $entry_show_count_products; ?>">
                <input name="sla_live_search_show_count_category" value="1" type="checkbox" <?php echo $checked; ?>>
                <span><span></span></span></label>			
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_heading_category; ?>"><?php echo $entry_heading_category; ?></span></label>
              <div class="col-sm-10">
                <?php foreach ($languages as $language) { ?>
                <div class="input-group"> <span class="input-group-addon"><img src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                  <input type="text" name="sla_live_search_heading_category[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($sla_live_search_heading_category[$language['language_id']]) ? $sla_live_search_heading_category[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_heading_category; ?>" class="form-control" />
                </div>
                <?php if (isset($error_heading_category[$language['language_id']])) { ?>
                <div class="text-danger"><?php echo $error_heading_category[$language['language_id']]; ?></div>
                <?php } ?>
                <?php } ?>
              </div>
            </div>
          </fieldset>
          <fieldset><legend><?php echo $text_manufacturer; ?></legend>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-search-manufacturer"><?php echo $entry_search_manufacturer; ?></label>
              <div class="col-sm-10">
                <?php $checked = ($sla_live_search_manufacturer)? 'checked="checked"':''; ?>
                <label class="switcher" title="<?php echo $entry_status; ?>">
                <input name="sla_live_search_manufacturer" value="1" type="checkbox" <?php echo $checked; ?>>
                <span><span></span></span></label>			
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-search-category"><?php echo $entry_show_count_products; ?></label>
              <div class="col-sm-10">
                <?php $checked = ($sla_live_search_show_count_manufacturer)? 'checked="checked"':''; ?>
                <label class="switcher" title="<?php echo $entry_show_count_products; ?>">
                <input name="sla_live_search_show_count_manufacturer" value="1" type="checkbox" <?php echo $checked; ?>>
                <span><span></span></span></label>			
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_heading_manufacturer; ?>"><?php echo $entry_heading_manufacturer; ?></span></label>
              <div class="col-sm-10">
                <?php foreach ($languages as $language) { ?>
                <div class="input-group"> <span class="input-group-addon"><img src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                  <input type="text" name="sla_live_search_heading_manufacturer[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($sla_live_search_heading_manufacturer[$language['language_id']]) ? $sla_live_search_heading_manufacturer[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_heading_manufacturer; ?>" class="form-control" />
                </div>
                <?php if (isset($error_heading_manufacturer[$language['language_id']])) { ?>
                <div class="text-danger"><?php echo $error_heading_manufacturer[$language['language_id']]; ?></div>
                <?php } ?>
                <?php } ?>
              </div>
            </div>
            <input type="hidden" name="sla_live_search_manufacturer_type" value="<?php echo $sla_live_search_manufacturer_type; ?>" />
          </fieldset>
          <fieldset><legend><?php echo $text_information; ?></legend>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-search-information"><?php echo $entry_search_information; ?></label>
              <div class="col-sm-10">
                <?php $checked = ($sla_live_search_information)? 'checked="checked"':''; ?>
                <label class="switcher" title="<?php echo $entry_status; ?>">
                <input name="sla_live_search_information" value="1" type="checkbox" <?php echo $checked; ?>>
                <span><span></span></span></label>			
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_heading_information; ?>"><?php echo $entry_heading_information; ?></span></label>
              <div class="col-sm-10">
                <?php foreach ($languages as $language) { ?>
                <div class="input-group"> <span class="input-group-addon"><img src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                  <input type="text" name="sla_live_search_heading_information[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($sla_live_search_heading_information[$language['language_id']]) ? $sla_live_search_heading_information[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_heading_information; ?>" class="form-control" />
                </div>
                <?php if (isset($error_heading_information[$language['language_id']])) { ?>
                <div class="text-danger"><?php echo $error_heading_information[$language['language_id']]; ?></div>
                <?php } ?>
                <?php } ?>
              </div>
            </div>
          </fieldset>
          <div class="form-group required">
            <label class="col-sm-2 control-label"><?php echo $entry_empty; ?></label>
            <div class="col-sm-10">
              <?php foreach ($languages as $language) { ?>
              <div class="input-group"> <span class="input-group-addon"><img src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                <input type="text" name="sla_live_search_empty[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($sla_live_search_empty[$language['language_id']]) ? $sla_live_search_empty[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_empty; ?>" class="form-control" />
              </div>
              <?php if (isset($error_empty[$language['language_id']])) { ?>
              <div class="text-danger"><?php echo $error_empty[$language['language_id']]; ?></div>
              <?php } ?>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>
            <div class="col-sm-10">
              <input type="number" name="sla_live_search_limit" value="<?php echo $sla_live_search_limit; ?>" placeholder="10" id="input-limit" class="form-control" />
              <?php if ($error_limit) { ?>
              <div class="text-danger"><?php echo $error_limit; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>
            <div class="col-sm-10">
              <input type="number" name="sla_live_search_image_width" value="<?php echo $sla_live_search_image_width; ?>" placeholder="50" id="input-width" class="form-control" />
              <?php if ($error_width) { ?>
              <div class="text-danger"><?php echo $error_width; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?></label>
            <div class="col-sm-10">
              <input type="number" name="sla_live_search_image_height" value="<?php echo $sla_live_search_image_height; ?>" placeholder="50" id="input-height" class="form-control" />
              <?php if ($error_height) { ?>
              <div class="text-danger"><?php echo $error_height; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-name-length"><span data-toggle="tooltip" title="<?php echo $help_length; ?>"><?php echo $entry_name_length; ?></span></label>
            <div class="col-sm-10">
              <input type="number" name="sla_live_search_name_length" value="<?php echo $sla_live_search_name_length; ?>" placeholder="100" id="input-name-length" class="form-control" />
              <?php if ($error_name_length) { ?>
              <div class="text-danger"><?php echo $error_name_length; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-description-length"><span data-toggle="tooltip" title="<?php echo $help_length; ?>"><?php echo $entry_description_length; ?></span></label>
            <div class="col-sm-10">
              <input type="number" name="sla_live_search_description_length" value="<?php echo $sla_live_search_description_length; ?>" placeholder="100" id="input-description-length" class="form-control" />
              <?php if ($error_description_length) { ?>
              <div class="text-danger"><?php echo $error_description_length; ?></div>
              <?php } ?>
            </div>
          </div>

          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-min-length"><?php echo $entry_min_length; ?></label>
            <div class="col-sm-10">
              <input type="number" name="sla_live_search_min_length" value="<?php echo $sla_live_search_min_length; ?>" placeholder="1" id="input-min-length" class="form-control" />
              <?php if ($error_min_length) { ?>
              <div class="text-danger"><?php echo $error_min_length; ?></div>
              <?php } ?>
            </div>
          </div>

        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
function saveStay() {
	$('#form-livesearch').append('<input type="hidden" name="apply" value="1" />');
	$('#form-livesearch').submit();
}

//--></script><style>
label.switcher input[type="checkbox"] {display:none}
label.switcher input[type="checkbox"] + span {position:relative;display:inline-block;vertical-align:middle;width:36px;height:17px;margin:0 5px 0 0;background:#ccc;border:solid 1px #999;border-radius:10px;box-shadow:inset 0 1px 2px #999;cursor:pointer;transition:all ease-in-out .2s;}
label.switcher input[type="checkbox"]:checked + span {background:#8fbb6c;border:solid 1px #7da35e;}
label.switcher input[type="checkbox"]:checked + span span {right:0;left:auto}
label.switcher span span{position:absolute;background:white;height:17px;width:17px;display:inlaine-box;left:0;top:-1px;border-radius:50%}
</style>

<?php echo $footer; ?>