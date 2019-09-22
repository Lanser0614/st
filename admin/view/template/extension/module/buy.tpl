<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<style type="text/css">
.ocp-module .btn-default.active.focus, .ocp-module .btn-default.active:focus, .ocp-module .btn-default.active:hover, .ocp-module .btn-default:active.focus, .ocp-module .btn-default:active:focus, .ocp-module .btn-default:active:hover{
    color: #fff;
    background-color: #398439;
    border-color: #255625;
}
.ocp-module .btn-default.active, .ocp-module .btn-default:active {
    background-color: #75a74d;
    border-color: #5c843d;
    color: #fff;
}
.ocp-module .btn-default.btn-danger {
    color: #555555;
    background-color: #ffffff;
    border-color: #cccccc;
}
.ocp-module .btn-default.btn-danger.active.focus, .ocp-module .btn-default.btn-danger.active:focus, .ocp-module .btn-default.btn-danger.active:hover, .ocp-module .btn-default.btn-danger:active.focus, .ocp-module .btn-default.btn-danger:active:focus, .ocp-module .btn-default.btn-danger:active:hover{
    color: #ffffff;
    background-color: #f23b3b;
    border-color: #ea1010;
}
.ocp-module .btn-default.btn-danger.active, .ocp-module .btn-default.btn-danger:active {
    color: #ffffff;
    background-color: #f56b6b;
    border-color: #f24545;
}
#tab-form-fields .nav-tabs {
    margin-bottom: 5px;
}

#tab-form-fields .nav > li > a {
    padding: 5px 15px;
}

#form-buy .btn-group {
    min-width: 95px;
}
#form-buy .note-editor .btn-group {
    min-width: 0;
}

th.column-field {
    max-width: 200px;
}
</style>
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-buy" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <?php if (isset($success)) { ?>

            <div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>

                <button type="button" class="close" data-dismiss="alert">&times;</button>

            </div>

        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body ocp-module">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-buy" class="form-horizontal">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab-general" data-toggle="tab"><i class="fa fa-cog"></i> <?php echo $tab_general; ?></a></li>
                        <li><a href="#tab-form-fields" data-toggle="tab"><i class="fa fa-navicon"></i> <?php echo $tab_form_fields; ?></a></li>
                        <li><a href="#tab-localisation" data-toggle="tab"><i class="fa fa-language"></i> <?php echo $tab_localisation; ?></a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab-general">
                            <div class="row-fluid clearfix">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="col-sm-6 control-label" for="input-status"><?php echo $entry_status; ?></label>
                                        <div class="col-sm-6">
                                            <div class="btn-group" data-toggle="buttons">
                                                <label class="btn btn-default <?php echo $buy_status == 1 ? 'active' : ''; ?>">
                                                  <input type="radio" name="buy_status" value="1" autocomplete="off"<?php echo $buy_status == 1 ? ' checked="checked"' : ''; ?> /><?php echo $text_yes; ?>
                                                </label>
                                                <label class="btn btn-danger btn-default <?php echo $buy_status == 0 ? 'active' : ''; ?>">
                                                  <input type="radio" name="buy_status" value="0" autocomplete="off"<?php echo $buy_status == 0 ? ' checked="checked"' : ''; ?> /><?php echo $text_no; ?>
                                                </label>
                                              </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-6 control-label" for="input-shipping_select"><?php echo $entry_shipping_select; ?></label>
                                        <div class="col-sm-6">
                                            <div class="btn-group" data-toggle="buttons">
                                                <label class="btn btn-default <?php echo $settings['buy_shipping_select'] == 1 ? 'active' : ''; ?>">
                                                  <input type="radio" name="buy_shipping_select" value="1" autocomplete="off"<?php echo $settings['buy_shipping_select'] == 1 ? ' checked="checked"' : ''; ?> /><?php echo $text_yes; ?>
                                                </label>
                                                <label class="btn btn-danger btn-default <?php echo $settings['buy_shipping_select'] == 0 ? 'active' : ''; ?>">
                                                  <input type="radio" name="buy_shipping_select" value="0" autocomplete="off"<?php echo $settings['buy_shipping_select'] == 0 ? ' checked="checked"' : ''; ?> /><?php echo $text_no; ?>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-6 control-label" for="input-payment_select"><?php echo $entry_payment_select; ?></label>
                                        <div class="col-sm-6">
                                            <div class="btn-group" data-toggle="buttons">
                                                <label class="btn btn-default <?php echo $settings['buy_payment_select'] == 1 ? 'active' : ''; ?>">
                                                  <input type="radio" name="buy_payment_select" value="1" autocomplete="off"<?php echo $settings['buy_payment_select'] == 1 ? ' checked="checked"' : ''; ?> /><?php echo $text_yes; ?>
                                                </label>
                                                <label class="btn btn-danger btn-default <?php echo $settings['buy_payment_select'] == 0 ? 'active' : ''; ?>">
                                                  <input type="radio" name="buy_payment_select" value="0" autocomplete="off"<?php echo $settings['buy_payment_select'] == 0 ? ' checked="checked"' : ''; ?> /><?php echo $text_no; ?>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-6 control-label" for="input-clear_show"><?php echo $entry_clear_show; ?></label>
                                        <div class="col-sm-6">
                                            <div class="btn-group" data-toggle="buttons">
                                                <label class="btn btn-default <?php echo $settings['buy_clear_show'] == 1 ? 'active' : ''; ?>">
                                                  <input type="radio" name="buy_clear_show" value="1" autocomplete="off"<?php echo $settings['buy_clear_show'] == 1 ? ' checked="checked"' : ''; ?> /><?php echo $text_yes; ?>
                                                </label>
                                                <label class="btn btn-danger btn-default <?php echo $settings['buy_clear_show'] == 0 ? 'active' : ''; ?>">
                                                  <input type="radio" name="buy_clear_show" value="0" autocomplete="off"<?php echo $settings['buy_clear_show'] == 0 ? ' checked="checked"' : ''; ?> /><?php echo $text_no; ?>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-6 control-label" for="input-oneclick"><?php echo $entry_oneclick; ?></label>
                                        <div class="col-sm-6">
                                            <div class="btn-group" data-toggle="buttons">
                                                <label class="btn btn-default <?php echo $settings['buy_oneclick'] == 1 ? 'active' : ''; ?>">
                                                    <input type="radio" name="buy_oneclick" value="1" autocomplete="off"<?php echo $settings['buy_oneclick'] == 1 ? ' checked="checked"' : ''; ?> /><?php echo $text_yes; ?>
                                                </label>
                                                <label class="btn btn-danger btn-default <?php echo $settings['buy_oneclick'] == 0 ? 'active' : ''; ?>">
                                                    <input type="radio" name="buy_oneclick" value="0" autocomplete="off"<?php echo $settings['buy_oneclick'] == 0 ? ' checked="checked"' : ''; ?> /><?php echo $text_no; ?>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-6 control-label" for="input-oneclick-only"><?php echo $entry_oneclick_only; ?></label>
                                        <div class="col-sm-6">
                                            <div class="btn-group" data-toggle="buttons">
                                                <label class="btn btn-default <?php echo $settings['buy_oneclick_only'] == 1 ? 'active' : ''; ?>">
                                                    <input type="radio" name="buy_oneclick_only" value="1" autocomplete="off"<?php echo $settings['buy_oneclick_only'] == 1 ? ' checked="checked"' : ''; ?> /><?php echo $text_yes; ?>
                                                </label>
                                                <label class="btn btn-danger btn-default <?php echo $settings['buy_oneclick_only'] == 0 ? 'active' : ''; ?>">
                                                    <input type="radio" name="buy_oneclick_only" value="0" autocomplete="off"<?php echo $settings['buy_oneclick_only'] == 0 ? ' checked="checked"' : ''; ?> /><?php echo $text_no; ?>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-6 control-label" for="input-login"><?php echo $entry_login; ?></label>
                                        <div class="col-sm-6">
                                            <div class="btn-group" data-toggle="buttons">
                                                <label class="btn btn-default <?php echo $settings['buy_login'] == 1 ? 'active' : ''; ?>">
                                                  <input type="radio" name="buy_login" value="1" autocomplete="off"<?php echo $settings['buy_login'] == 1 ? ' checked="checked"' : ''; ?> /><?php echo $text_yes; ?>
                                                </label>
                                                <label class="btn btn-danger btn-default <?php echo $settings['buy_login'] == 0 ? 'active' : ''; ?>">
                                                  <input type="radio" name="buy_login" value="0" autocomplete="off"<?php echo $settings['buy_login'] == 0 ? ' checked="checked"' : ''; ?> /><?php echo $text_no; ?>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-6 control-label" for="input-coupon"><?php echo $entry_coupon; ?></label>
                                        <div class="col-sm-6">
                                            <div class="btn-group" data-toggle="buttons">
                                                <label class="btn btn-default <?php echo $settings['buy_coupon'] == 1 ? 'active' : ''; ?>">
                                                    <input type="radio" name="buy_coupon" value="1" autocomplete="off"<?php echo $settings['buy_coupon'] == 1 ? ' checked="checked"' : ''; ?> /><?php echo $text_yes; ?>
                                                </label>
                                                <label class="btn btn-danger btn-default <?php echo $settings['buy_coupon'] == 0 ? 'active' : ''; ?>">
                                                    <input type="radio" name="buy_coupon" value="0" autocomplete="off"<?php echo $settings['buy_coupon'] == 0 ? ' checked="checked"' : ''; ?> /><?php echo $text_no; ?>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-6 control-label" for="input-voucher"><?php echo $entry_voucher; ?></label>
                                        <div class="col-sm-6">
                                            <div class="btn-group" data-toggle="buttons">
                                                <label class="btn btn-default <?php echo $settings['buy_voucher'] == 1 ? 'active' : ''; ?>">
                                                    <input type="radio" name="buy_voucher" value="1" autocomplete="off"<?php echo $settings['buy_voucher'] == 1 ? ' checked="checked"' : ''; ?> /><?php echo $text_yes; ?>
                                                </label>
                                                <label class="btn btn-danger btn-default <?php echo $settings['buy_voucher'] == 0 ? 'active' : ''; ?>">
                                                    <input type="radio" name="buy_voucher" value="0" autocomplete="off"<?php echo $settings['buy_voucher'] == 0 ? ' checked="checked"' : ''; ?> /><?php echo $text_no; ?>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-6 control-label" for="input-bootstrap"><?php echo $entry_bootstrap; ?></label>
                                        <div class="col-sm-6">
                                            <div class="btn-group" data-toggle="buttons">
                                                <label class="btn btn-default <?php echo $settings['buy_bootstrap'] == 1 ? 'active' : ''; ?>">
                                                    <input type="radio" name="buy_bootstrap" value="1" autocomplete="off"<?php echo $settings['buy_bootstrap'] == 1 ? ' checked="checked"' : ''; ?> /><?php echo $text_yes; ?>
                                                </label>
                                                <label class="btn btn-danger btn-default <?php echo $settings['buy_bootstrap'] == 0 ? 'active' : ''; ?>">
                                                    <input type="radio" name="buy_bootstrap" value="0" autocomplete="off"<?php echo $settings['buy_bootstrap'] == 0 ? ' checked="checked"' : ''; ?> /><?php echo $text_no; ?>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="col-sm-6 control-label" for="input-page_design"><?php echo $entry_page_design; ?></label>
                                        <div class="col-sm-6">
                                            <select name="buy_page_design" class="form-control" id="input-page_design">
                                                <option value="1"<?php if(!isset($settings['buy_page_design']) || $settings['buy_page_design'] == 1){?> selected="selected"<?php }?>><?php echo $text_top; ?></option>
                                                <option value="2"<?php if(isset($settings['buy_page_design']) && $settings['buy_page_design'] == 2){?> selected="selected"<?php }?>><?php echo $text_bottom; ?></option>
                                                <option value="3"<?php if(isset($settings['buy_page_design']) && $settings['buy_page_design'] == 3){?> selected="selected"<?php }?>><?php echo $text_no_display; ?></option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-6 control-label" for="input-form_design"><?php echo $entry_form_design; ?></label>
                                        <div class="col-sm-6">
                                            <select name="buy_form_design" class="form-control" id="input-form_design">
                                                <option value="0"<?php if(!isset($settings['buy_form_design']) || $settings['buy_form_design'] == 0){?> selected="selected"<?php }?>><?php echo $text_two_col;?></option>
                                                <option value="1"<?php if(isset($settings['buy_form_design']) && $settings['buy_form_design'] == 1){?> selected="selected"<?php }?>><?php echo $text_single_col;?></option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-6 control-label" for="input-telephone_mask"><?php echo $entry_telephone_mask; ?></label>
                                        <div class="col-sm-6">
                                            <input type="text" name="buy_telephone_mask" value="<?php echo (isset($settings['buy_telephone_mask'])?$settings['buy_telephone_mask']:'');?>" class="form-control" id="input-telephone_mask" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-6 control-label" for="input-min_order_sum"><?php echo $entry_min_order_sum; ?></label>
                                        <div class="col-sm-6">
                                            <input type="text" name="buy_min_order_sum" value="<?php echo (isset($settings['buy_min_order_sum'])?$settings['buy_min_order_sum']:'');?>" style="width: 85px;" class="form-control" id="input-min_order_sum" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane" id="tab-form-fields">
                            
                            <table class="table table-hover" style="width: 80%;">
                                <thead>
                                    <tr>
                                        <th class="column-field"><?php echo $column_field; ?></th>
                                        <th><?php echo $column_status; ?></th>
                                        <th><?php echo $column_required; ?></th>
                                        <th><?php echo $column_text; ?></th>
                                        <th><?php echo $column_placeholder; ?></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach($fields as $key => $field) { ?>
                                    <tr>
                                        <td><b><?php echo $field['entry']; ?></b></td>
                                        <td>
                                            <div class="btn-group" data-toggle="buttons">
                                                <label class="btn btn-default <?php echo $settings['buy_' . $key . '_status'] == 1 ? 'active' : ''; ?>">
                                                  <input type="radio" name="buy_<?php echo $key; ?>_status" value="1" autocomplete="off"<?php echo $settings['buy_' . $key . '_status'] == 1 ? ' checked="checked"' : ''; ?> /><?php echo $text_yes; ?>
                                                </label>
                                                <label class="btn btn-danger btn-default <?php echo $settings['buy_' . $key . '_status'] == 0 ? 'active' : ''; ?>">
                                                  <input type="radio" name="buy_<?php echo $key; ?>_status" value="0" autocomplete="off"<?php echo $settings['buy_' . $key . '_status'] == 0 ? ' checked="checked"' : ''; ?> /><?php echo $text_no; ?>
                                                </label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="btn-group" data-toggle="buttons">
                                                <label class="btn btn-default <?php echo $settings['buy_' . $key . '_required'] == 1 ? 'active' : ''; ?>">
                                                  <input type="radio" name="buy_<?php echo $key; ?>_required" value="1" autocomplete="off"<?php echo $settings['buy_' . $key . '_required'] == 1 ? ' checked="checked"' : ''; ?> /><?php echo $text_yes; ?>
                                                </label>
                                                <label class="btn btn-danger btn-default <?php echo $settings['buy_' . $key . '_required'] == 0 ? 'active' : ''; ?>">
                                                  <input type="radio" name="buy_<?php echo $key; ?>_required" value="0" autocomplete="off"<?php echo $settings['buy_' . $key . '_required'] == 0 ? ' checked="checked"' : ''; ?> /><?php echo $text_no; ?>
                                                </label>
                                            </div>
                                        </td>
                                        <td>
                                            <ul class="nav nav-tabs" id="language_<?php echo $key; ?>">
                                                <?php foreach ($languages as $language) { ?>
                                                    <li><a href="#language_<?php echo $key.'_'.$language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                                                <?php } ?>
                                            </ul>
                                            <div class="tab-content">
                                                <?php foreach ($languages as $language) { ?>
                                                <div class="tab-pane" id="language_<?php echo $key.'_'.$language['language_id']; ?>">
                                                    <input type="text" name="buy_field_lang[<?php echo $language['code']; ?>][<?php echo $key; ?>][text]" value="<?php echo (isset($settings['buy_field_lang'][$language['code']][$key])?$settings['buy_field_lang'][$language['code']][$key]['text']:'');?>" class="form-control" />
                                                </div>
                                                <?php } ?>
                                            </div>
                                        </td>
                                        <td>
                                            <ul class="nav nav-tabs" id="language_pl_<?php echo $key; ?>">
                                                <?php foreach ($languages as $language) { ?>
                                                    <li><a href="#language_pl_<?php echo $key.'_'.$language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                                                <?php } ?>
                                            </ul>
                                            <div class="tab-content">
                                                <?php foreach ($languages as $language) { ?>
                                                <div class="tab-pane" id="language_pl_<?php echo $key.'_'.$language['language_id']; ?>">
                                                    <input type="text" name="buy_field_lang[<?php echo $language['code']; ?>][<?php echo $key; ?>][placeholder]" value="<?php echo (isset($settings['buy_field_lang'][$language['code']][$key])?$settings['buy_field_lang'][$language['code']][$key]['placeholder']:'');?>" class="form-control" />
                                                </div>
                                                <?php } ?>
                                            </div>
                                        </td>
                                    </tr>
                                    <?php } ?>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane" id="tab-localisation">
                            <ul class="nav nav-tabs" id="language">
                                <?php foreach ($languages as $language) { ?>
                                <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                                <?php } ?>
                              </ul>
                            <div class="tab-content">
                                <?php foreach ($languages as $language) { ?>
                            <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                            <div class="row-fluid clearfix">
                                <div class="col-sm-8">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-meta_title_<?php echo $language['code']; ?>"><?php echo $entry_meta_title; ?></label>
                                        <div class="col-sm-8">
                                            <input type="text" name="buy_lang[<?php echo $language['code']; ?>][meta_title]" value="<?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['meta_title']:$text_meta_title);?>" class="form-control" id="input-meta_title_<?php echo $language['code']; ?>" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-h1_<?php echo $language['code']; ?>"><?php echo $entry_h1; ?></label>
                                        <div class="col-sm-8">
                                            <input type="text" name="buy_lang[<?php echo $language['code']; ?>][h1]" value="<?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['h1']:$text_h1);?>" class="form-control" id="input-h1_<?php echo $language['code']; ?>" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-h2_<?php echo $language['code']; ?>"><?php echo $entry_h2; ?></label>
                                        <div class="col-sm-8">
                                            <input type="text" name="buy_lang[<?php echo $language['code']; ?>][h2]" value="<?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['h2']:$text_h2);?>" class="form-control" id="input-h2_<?php echo $language['code']; ?>" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-form_headings"><?php echo $entry_form_headings; ?></label>
                                        <div class="col-sm-8">                                            
                                            <div class="btn-group" data-toggle="buttons">
                                                <label class="btn btn-default <?php echo $settings['buy_form_headings'] == 1 ? 'active' : ''; ?>">
                                                  <input type="radio" name="buy_form_headings" value="1" autocomplete="off"<?php echo $settings['buy_form_headings'] == 1 ? ' checked="checked"' : ''; ?> /><?php echo $text_yes; ?>
                                                </label>
                                                <label class="btn btn-danger btn-default <?php echo $settings['buy_form_headings'] == 0 ? 'active' : ''; ?>">
                                                  <input type="radio" name="buy_form_headings" value="0" autocomplete="off"<?php echo $settings['buy_form_headings'] == 0 ? ' checked="checked"' : ''; ?> /><?php echo $text_no; ?>
                                                </label>
                                              </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                    <label class="col-sm-4 control-label" for="input-heading_1_<?php echo $language['code']; ?>"><?php echo $entry_heading_1; ?></label>
                                    <div class="col-sm-8">
                                        <input type="text" name="buy_lang[<?php echo $language['code']; ?>][heading_1]" value="<?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['heading_1']:$text_heading_1);?>" class="form-control" id="input-heading_1_<?php echo $language['code']; ?>" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="input-heading_2_<?php echo $language['code']; ?>"><?php echo $entry_heading_2; ?></label>
                                    <div class="col-sm-8">
                                        <input type="text" name="buy_lang[<?php echo $language['code']; ?>][heading_2]" value="<?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['heading_2']:$text_heading_2);?>" class="form-control" id="input-heading_2_<?php echo $language['code']; ?>" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="input-heading_3_<?php echo $language['code']; ?>"><?php echo $entry_heading_3; ?></label>
                                    <div class="col-sm-8">
                                        <input type="text" name="buy_lang[<?php echo $language['code']; ?>][heading_3]" value="<?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['heading_3']:$text_heading_3);?>" class="form-control" id="input-heading_3_<?php echo $language['code']; ?>" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="input-success_title_<?php echo $language['code']; ?>"><?php echo $entry_success_title; ?></label>
                                    <div class="col-sm-8">
                                        <input type="text" name="buy_lang[<?php echo $language['code']; ?>][success_title]" value="<?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['success_title']:$text_success_title);?>" class="form-control" id="input-success_title_<?php echo $language['code']; ?>" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <label class="control-label" for="input-success_text_<?php echo $language['code']; ?>"><?php echo $entry_success_text; ?></label>
                                    </div>
                                    <div class="col-sm-8">
                                        <textarea name="buy_lang[<?php echo $language['code']; ?>][success_text]" class="form-control summernote" id="input-success-text<?php echo $language['language_id']; ?>"><?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['success_text']:$text_success_text);?></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="input-success_text_logged_<?php echo $language['code']; ?>"><?php echo $entry_success_text_logged; ?></label>
                                    <div class="col-sm-8">
                                        <textarea name="buy_lang[<?php echo $language['code']; ?>][success_text_logged]" class="form-control summernote" id="input-success-text-logged<?php echo $language['language_id']; ?>"><?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['success_text_logged']:$text_success_text_logged);?></textarea>
                                    </div>
                                </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-oneclick_text_<?php echo $language['code']; ?>"><?php echo $entry_oneclick_text; ?></label>
                                        <div class="col-sm-8">
                                            <textarea name="buy_lang[<?php echo $language['code']; ?>][oneclick_text]" class="form-control summernote" id="input-oneclick-text<?php echo $language['language_id']; ?>"><?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['oneclick_text']:$text_oneclick_text);?></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-checkout_button_<?php echo $language['code']; ?>"><?php echo $entry_checkout_button; ?></label>
                                        <div class="col-sm-8">
                                            <input type="text" name="buy_lang[<?php echo $language['code']; ?>][checkout_button]" value="<?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['checkout_button']:$text_checkout_button);?>" class="form-control" id="input-checkout_button_<?php echo $language['code']; ?>" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-oneclick_button_<?php echo $language['code']; ?>"><?php echo $entry_oneclick_button; ?></label>
                                        <div class="col-sm-8">
                                            <input type="text" name="buy_lang[<?php echo $language['code']; ?>][oneclick_button]" value="<?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['oneclick_button']:$text_oneclick_button);?>" class="form-control" id="input-oneclick_button_<?php echo $language['code']; ?>" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="input-agree_text_<?php echo $language['code']; ?>"><?php echo $entry_agree_text; ?></label>
                                        <div class="col-sm-8">
                                            <input type="text" name="buy_lang[<?php echo $language['code']; ?>][agree_text]" value="<?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['agree_text']:$text_agree_text);?>" class="form-control" id="input-agree_text_<?php echo $language['code']; ?>" />
                                        </div>
                                    </div>

                                    <fieldset>
                                        <legend><?php echo $text_product_table; ?></legend>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="input-table-image<?php echo $language['code']; ?>"><?php echo $entry_table_image; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="buy_lang[<?php echo $language['code']; ?>][table_image]" value="<?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['table_image']:$entry_table_image);?>" class="form-control" id="input-table_image_<?php echo $language['code']; ?>" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="input-table-name<?php echo $language['code']; ?>"><?php echo $entry_table_name; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="buy_lang[<?php echo $language['code']; ?>][table_name]" value="<?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['table_name']:$entry_table_name);?>" class="form-control" id="input-table_name_<?php echo $language['code']; ?>" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="input-table-model<?php echo $language['code']; ?>"><?php echo $entry_table_model; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="buy_lang[<?php echo $language['code']; ?>][table_model]" value="<?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['table_model']:$entry_table_model);?>" class="form-control" id="input-table_model_<?php echo $language['code']; ?>" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="input-table-qty<?php echo $language['code']; ?>"><?php echo $entry_table_qty; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="buy_lang[<?php echo $language['code']; ?>][table_qty]" value="<?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['table_qty']:$entry_table_qty);?>" class="form-control" id="input-table_qty_<?php echo $language['code']; ?>" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="input-table-price<?php echo $language['code']; ?>"><?php echo $entry_table_price; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="buy_lang[<?php echo $language['code']; ?>][table_price]" value="<?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['table_price']:$entry_table_price);?>" class="form-control" id="input-table_price_<?php echo $language['code']; ?>" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="input-table-total<?php echo $language['code']; ?>"><?php echo $entry_table_total; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="buy_lang[<?php echo $language['code']; ?>][table_total]" value="<?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['table_total']:$entry_table_total);?>" class="form-control" id="input-table_total_<?php echo $language['code']; ?>" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="input-table-coupon<?php echo $language['code']; ?>"><?php echo $entry_table_coupon; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="buy_lang[<?php echo $language['code']; ?>][table_coupon]" value="<?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['table_coupon']:$entry_table_coupon);?>" class="form-control" id="input-table_coupon_<?php echo $language['code']; ?>" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="input-table-coupon-another<?php echo $language['code']; ?>"><?php echo $entry_table_coupon_another; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="buy_lang[<?php echo $language['code']; ?>][table_coupon_another]" value="<?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['table_coupon_another']:$entry_table_coupon_another);?>" class="form-control" id="input-table_coupon_another_<?php echo $language['code']; ?>" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="input-table-voucher<?php echo $language['code']; ?>"><?php echo $entry_table_voucher; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="buy_lang[<?php echo $language['code']; ?>][table_voucher]" value="<?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['table_voucher']:$entry_table_price);?>" class="form-control" id="input-table_voucher_<?php echo $language['code']; ?>" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="input-table-voucher-another<?php echo $language['code']; ?>"><?php echo $entry_table_voucher_another; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="buy_lang[<?php echo $language['code']; ?>][table_voucher_another]" value="<?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['table_voucher_another']:$entry_table_voucher_another);?>" class="form-control" id="input-table_voucher_another_<?php echo $language['code']; ?>" />
                                            </div>
                                        </div>
                                    </fieldset>
                                    <fieldset>
                                        <legend><?php echo $text_other; ?></legend>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="input-new-customer<?php echo $language['code']; ?>"><?php echo $entry_new_customer; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="buy_lang[<?php echo $language['code']; ?>][new_customer]" value="<?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['new_customer']:$text_new_customer);?>" class="form-control" id="input-new_customer_<?php echo $language['code']; ?>" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="input-old-customer<?php echo $language['code']; ?>"><?php echo $entry_old_customer; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="buy_lang[<?php echo $language['code']; ?>][old_customer]" value="<?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['old_customer']:$text_old_customer);?>" class="form-control" id="input-old_customer_<?php echo $language['code']; ?>" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="input-shipping-methods<?php echo $language['code']; ?>"><?php echo $entry_shipping_methods; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="buy_lang[<?php echo $language['code']; ?>][shipping_methods]" value="<?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['shipping_methods']:$text_shipping_methods);?>" class="form-control" id="input-shipping_methods_<?php echo $language['code']; ?>" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label" for="input-payment-methods<?php echo $language['code']; ?>"><?php echo $entry_payment_methods; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="buy_lang[<?php echo $language['code']; ?>][payment_methods]" value="<?php echo (isset($settings['buy_lang'][$language['code']])?$settings['buy_lang'][$language['code']]['payment_methods']:$text_payment_methods);?>" class="form-control" id="input-payment_methods_<?php echo $language['code']; ?>" />
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <div class="col-sm-4">
                                    <div class="ocp-hint" style="margin-top: 485px;">
                                        <?php echo $text_patterns; ?>
                                    </div>
                                </div>
                            </div>
                            </div>
                            <?php } ?>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
<link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>
<script type="text/javascript">
$('.status').change(function () {
    var name = (this.name).split('_');
    if (this.value == 0) {
        if (name[1] == 'address')
            name[1] = name[1] + '_' + name[2];
        $('select[name=\'buy_' + name[1] + '_required\']').val('0');
    }
});
$('#language a:first').tab('show');
<?php foreach($fields as $key => $field) { ?>
$('#language_<?php echo $key; ?> a:first').tab('show');
$('#language_pl_<?php echo $key; ?> a:first').tab('show');
<?php } ?>
</script>
<?php echo $footer; ?>