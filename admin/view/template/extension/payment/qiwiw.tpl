<?php echo $header; ?><style type="text/css">
.error{
    color: red;
}
</style>
<?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-cod" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
        <a href="<?php echo $cloner; ?>" data-toggle="tooltip" title="<?php echo $button_cloner; ?>" class="btn btn-default"><?php echo $entry_cloner; ?></a>
      </div>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-cod" class="form-horizontal">
        <table class="table">
        <thead>
           <h4><?php echo $text_allset; ?></h4>
        </thead>
        <tr>
        <td width="25%"><span class="required">*</span> <?php echo $entry_license; ?></td>
        <td><input type="text" name="<?php echo $pname; ?>_license" value="<?php if (isset(${"{$pname}_license"})){ echo ${"{$pname}_license"}; }?>" />
          <br />
          <?php if ($error_license) { ?>
          <span class="error"><?php echo $error_license; ?></span>
          <?php } ?></td>
        </tr>
        <tr>
        <td width="25%"><span class="required">*</span> <?php echo $entry_login; ?></td>
        <td><input type="text" name="<?php echo $pname; ?>_login" value="<?php if (isset(${"{$pname}_login"})){ echo ${"{$pname}_login"}; }?>" />
          <br />
          <?php if ($error_login) { ?>
          <span class="error"><?php echo $error_login; ?></span>
          <?php } ?></td>
        </tr>
        <tr>
        <td><span class="required">*</span> <?php echo $entry_qtoken; ?></td>
        <td><input type="password" id="tok" name="<?php echo $pname; ?>_qtoken" value="<?php echo $qiwiwpro_qtoken; ?>" />
          <br />
          <?php if ($error_password) { ?>
          <span class="error"><?php echo $error_password; ?></span>
          <?php } ?></td>
        </tr>
        <tr>
        <td><span class="required">*</span> <?php echo $entry_password; ?></td>
        <td><input type="password" id="su" name="<?php echo $pname; ?>_password" value="<?php if (isset(${"{$pname}_password"})){ echo ${"{$pname}_password"}; }?>" />
          <input type="button" value="<?php echo $text_secred; ?>" id="getuiid" class="button btn btn-default" />
          <input type="hidden" value="<?php echo $text_secred_edit; ?>" id="edituiid" class="button btn btn-default" />
          <br />
          <span id="requ"></span>
          <?php if ($error_password) { ?>
          <span class="error"><?php echo $error_password; ?></span>
          <?php } ?></td>
        </tr>
        </table>
        <table class="table">
        <thead>
           <h4><?php echo $text_orderset; ?></h4>
        </thead>
        <tr>
          <td width="25%"><?php echo $entry_debug; ?></td>
          <td><?php if ($qiwiwpro_debug) { ?>
            <input type="radio" name="<?php echo $pname; ?>_debug" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_debug" value="0" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_debug" value="1" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_debug" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_pagepay; ?></td>
          <td><?php if ($qiwiwpro_pagepay == 'frame') { ?>
            <input type="radio" name="<?php echo $pname; ?>_pagepay" value="redir" />
            <?php echo $text_pagepay_redir; ?><br>
            <input type="radio" name="<?php echo $pname; ?>_pagepay" value="frame" checked="checked" />
            <?php echo $text_pagepay_frame; ?><br>
            <input type="radio" name="<?php echo $pname; ?>_pagepay" value="0" />
            <?php echo $text_pagepay_new; ?>
            <?php } else if ($qiwiwpro_pagepay == 'redir') { ?>
            <input type="radio" name="<?php echo $pname; ?>_pagepay" value="redir" checked="checked" />
            <?php echo $text_pagepay_redir; ?><br>
            <input type="radio" name="<?php echo $pname; ?>_pagepay" value="frame" />
            <?php echo $text_pagepay_frame; ?><br>
            <input type="radio" name="<?php echo $pname; ?>_pagepay" value="0" />
            <?php echo $text_pagepay_new; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_pagepay" value="redir" />
            <?php echo $text_pagepay_redir; ?><br>
            <input type="radio" name="<?php echo $pname; ?>_pagepay" value="frame" />
            <?php echo $text_pagepay_frame; ?><br>
            <input type="radio" name="<?php echo $pname; ?>_pagepay" value="0" checked="checked" />
            <?php echo $text_pagepay_new; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_returnpage; ?></td>
          <td><?php if ($qiwiwpro_returnpage) { ?>
            <input type="radio" name="<?php echo $pname; ?>_returnpage" value="1" checked="checked" />
            <?php echo $entry_returnpage_default; ?>
            <input type="radio" name="<?php echo $pname; ?>_returnpage" value="0" />
            <?php echo $entry_returnpage_self; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_returnpage" value="1" />
            <?php echo $entry_returnpage_default; ?>
            <input type="radio" name="<?php echo $pname; ?>_returnpage" value="0" checked="checked" />
            <?php echo $entry_returnpage_self; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_otlog ; ?></td>
          <td><?php if ($qiwiwpro_otlog == 'pay') { ?>
            <input type="radio" name="<?php echo $pname; ?>_otlog" id="stock_tab" value="stock" />
            <?php echo $entry_otlog_stock; ?>
            <input type="radio" name="<?php echo $pname; ?>_otlog" id="pay_tab" value="pay" checked="checked" />
            <?php echo $entry_otlog_pay; ?>
            <input type="radio" name="<?php echo $pname; ?>_otlog" id="standard_tab" value="0" />
            <?php echo $entry_otlog_standard; ?>
            <?php } else if($qiwiwpro_otlog == 'stock'){ ?>
            <input type="radio" name="<?php echo $pname; ?>_otlog" id="stock_tab" value="stock" checked="checked" />
            <?php echo $entry_otlog_stock; ?>
            <input type="radio" name="<?php echo $pname; ?>_otlog" id="pay_tab" value="pay" />
            <?php echo $entry_otlog_pay; ?>
            <input type="radio" name="<?php echo $pname; ?>_otlog" id="standard_tab" value="0" />
            <?php echo $entry_otlog_standard; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_otlog" id="stock_tab" value="stock" />
            <?php echo $entry_otlog_stock; ?>
            <input type="radio" name="<?php echo $pname; ?>_otlog" id="pay_tab" value="pay" />
            <?php echo $entry_otlog_pay; ?>
            <input type="radio" name="<?php echo $pname; ?>_otlog" id="standard_tab" value="0" checked="checked" />
            <?php echo $entry_otlog_standard; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_name_tab; ?></td>
          <td><?php if (${"{$pname}_name_attach"}) { ?>
            <input type="radio" name="<?php echo $pname; ?>_name_attach" value="1" checked="checked" />
            <?php echo $text_my; ?>
            <input type="radio" name="<?php echo $pname; ?>_name_attach" value="0" />
            <?php echo $text_default; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_name_attach" value="1" />
            <?php echo $text_my; ?>
            <input type="radio" name="<?php echo $pname; ?>_name_attach" value="0" checked="checked" />
            <?php echo $text_default; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_name; ?></td>
          <td><?php foreach ($languages as $language) { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <textarea name="<?php echo $pname; ?>_name_<?php echo $language['language_id']; ?>" cols="50" rows="1"><?php echo isset(${"{$pname}_name_{$language['language_id']}"}) ? ${"{$pname}_name_{$language['language_id']}"} : ''; ?></textarea><br />
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_fixen ; ?></td>
          <td><?php if (${"{$pname}_fixen"} == 'sum') { ?>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="sum" checked="checked" />
            <?php echo $entry_fixen_sum; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_sum" />
            <?php echo $entry_fixen_proc_sum; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_noship" />
            <?php echo $entry_fixen_proc_noship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="order_noship" />
            <?php echo $entry_fixen_order_noship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_ship" />
            <?php echo $entry_fixen_proc_ship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="ship" />
            <?php echo $entry_fixen_ship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="fix" />
            <?php echo $entry_fixen_fix; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc" />
            <?php echo $entry_fixen_proc; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="0" />
            <?php echo $entry_fixen_order; ?>
            <?php } else if (${"{$pname}_fixen"} == 'proc_sum') { ?>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="sum" />
            <?php echo $entry_fixen_sum; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_sum" checked="checked" />
            <?php echo $entry_fixen_proc_sum; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_noship" />
            <?php echo $entry_fixen_proc_noship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="order_noship" />
            <?php echo $entry_fixen_order_noship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_ship" />
            <?php echo $entry_fixen_proc_ship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="ship" />
            <?php echo $entry_fixen_ship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="fix" />
            <?php echo $entry_fixen_fix; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc" />
            <?php echo $entry_fixen_proc; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="0" />
            <?php echo $entry_fixen_order; ?>
            <?php } else if (${"{$pname}_fixen"} == 'proc_noship') { ?>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="sum" />
            <?php echo $entry_fixen_sum; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_sum" />
            <?php echo $entry_fixen_proc_sum; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_noship" checked="checked" />
            <?php echo $entry_fixen_proc_noship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="order_noship" />
            <?php echo $entry_fixen_order_noship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_ship" />
            <?php echo $entry_fixen_proc_ship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="ship" />
            <?php echo $entry_fixen_ship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="fix" />
            <?php echo $entry_fixen_fix; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc" />
            <?php echo $entry_fixen_proc; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="0" />
            <?php echo $entry_fixen_order; ?>
            <?php } else if (${"{$pname}_fixen"} == 'order_noship') { ?> 
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="sum" />
            <?php echo $entry_fixen_sum; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_sum" />
            <?php echo $entry_fixen_proc_sum; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_noship" />
            <?php echo $entry_fixen_proc_noship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="order_noship" checked="checked" />
            <?php echo $entry_fixen_order_noship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_ship" />
            <?php echo $entry_fixen_proc_ship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="ship" />
            <?php echo $entry_fixen_ship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="fix" />
            <?php echo $entry_fixen_fix; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc" />
            <?php echo $entry_fixen_proc; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="0" />
            <?php echo $entry_fixen_order; ?>
            <?php } else if (${"{$pname}_fixen"} == 'proc_ship') { ?>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="sum" />
            <?php echo $entry_fixen_sum; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_sum" />
            <?php echo $entry_fixen_proc_sum; ?><br/> 
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_noship" />
            <?php echo $entry_fixen_proc_noship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="order_noship" />
            <?php echo $entry_fixen_order_noship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_ship" checked="checked" />
            <?php echo $entry_fixen_proc_ship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="ship" />
            <?php echo $entry_fixen_ship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="fix" />
            <?php echo $entry_fixen_fix; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc" />
            <?php echo $entry_fixen_proc; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="0" />
            <?php echo $entry_fixen_order; ?>
            <?php } else if (${"{$pname}_fixen"} == 'ship') { ?> 
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="sum" />
            <?php echo $entry_fixen_sum; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_sum" />
            <?php echo $entry_fixen_proc_sum; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_noship" />
            <?php echo $entry_fixen_proc_noship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="order_noship" />
            <?php echo $entry_fixen_order_noship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_ship" />
            <?php echo $entry_fixen_proc_ship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="ship" checked="checked" />
            <?php echo $entry_fixen_ship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="fix" />
            <?php echo $entry_fixen_fix; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc" />
            <?php echo $entry_fixen_proc; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="0" />
            <?php echo $entry_fixen_order; ?>
          <?php } else if (${"{$pname}_fixen"} == 'proc') { ?> 
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="sum" />
            <?php echo $entry_fixen_sum; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_sum" />
            <?php echo $entry_fixen_proc_sum; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_noship" />
            <?php echo $entry_fixen_proc_noship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="order_noship" />
            <?php echo $entry_fixen_order_noship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_ship" />
            <?php echo $entry_fixen_proc_ship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="ship" />
            <?php echo $entry_fixen_ship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="fix" />
            <?php echo $entry_fixen_fix; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc" checked="checked" />
            <?php echo $entry_fixen_proc; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="0" />
            <?php echo $entry_fixen_order; ?>
            <?php } else if(${"{$pname}_fixen"} == 'fix'){ ?>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="sum" />
            <?php echo $entry_fixen_sum; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_sum" />
            <?php echo $entry_fixen_proc_sum; ?><br/> 
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_noship" />
            <?php echo $entry_fixen_proc_noship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="order_noship" />
            <?php echo $entry_fixen_order_noship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_ship" />
            <?php echo $entry_fixen_proc_ship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="ship" />
            <?php echo $entry_fixen_ship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="fix" checked="checked" />
            <?php echo $entry_fixen_fix; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc" />
            <?php echo $entry_fixen_proc; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="0" />
            <?php echo $entry_fixen_order; ?>
            <?php } else { ?> 
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="sum" />
            <?php echo $entry_fixen_sum; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_sum" />
            <?php echo $entry_fixen_proc_sum; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_noship" />
            <?php echo $entry_fixen_proc_noship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="order_noship" />
            <?php echo $entry_fixen_order_noship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc_ship" />
            <?php echo $entry_fixen_proc_ship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="ship" />
            <?php echo $entry_fixen_ship; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="fix" />
            <?php echo $entry_fixen_fix; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="proc" />
            <?php echo $entry_fixen_proc; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_fixen" value="0" checked="checked" />
            <?php echo $entry_fixen_order; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_fixen_amount; ?></td>
          <td><input type="text" name="<?php echo $pname; ?>_fixen_amount" value="<?php echo isset(${"{$pname}_fixen_amount"}) ? ${"{$pname}_fixen_amount"} : ''; ?>" ><br />
          <?php if ($error_fixen) { ?>
          <span class="error"><?php echo $error_fixen; ?></span>
          <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_komis_brain; ?></td>
          <td><?php if ($qiwiwpro_komis_brain) { ?>
            <input type="radio" name="<?php echo $pname; ?>_komis_brain" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_komis_brain" value="0" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_komis_brain" value="1" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_komis_brain" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_komis; ?></td>
          <td><input type="text" name="<?php echo $pname; ?>_komis" value="<?php echo isset(${"{$pname}_komis"}) ? ${"{$pname}_komis"} : ''; ?>" >%</td>
        </tr>
        <tr>
          <td><?php echo $entry_minpay; ?></td>
          <td><input type="text" name="<?php echo $pname; ?>_minpay" value="<?php echo isset(${"{$pname}_minpay"}) ? ${"{$pname}_minpay"} : ''; ?>" >руб.</td>
        </tr>
        <tr>
          <td><?php echo $entry_maxpay; ?></td>
          <td><input type="text" name="<?php echo $pname; ?>_maxpay" value="<?php echo isset(${"{$pname}_maxpay"}) ? ${"{$pname}_maxpay"} : ''; ?>" >руб.</td>
        </tr>
        <tr>
          <td><?php echo $entry_morepay; ?></td>
          <td><input type="text" name="<?php echo $pname; ?>_morepay" value="<?php echo isset($qiwiwpro_morepay) ? $qiwiwpro_morepay : ''; ?>" >руб.</td>
        </tr>
        <tr>
          <td><?php echo $entry_morepay_alert_admin; ?></td>
          <td><?php if ($qiwiwpro_morepay_alert_admin) { ?>
            <input type="radio" name="<?php echo $pname; ?>_morepay_alert_admin" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_morepay_alert_admin" value="0" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_morepay_alert_admin" value="1" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_morepay_alert_admin" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_morepay_alert_customer; ?></td>
          <td><?php if ($qiwiwpro_morepay_alert_customer) { ?>
            <input type="radio" name="<?php echo $pname; ?>_morepay_alert_customer" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_morepay_alert_customer" value="0" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_morepay_alert_customer" value="1" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_morepay_alert_customer" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
        <!--<tr>
          <td><?php echo $entry_morepay_redirect; ?></td>
          <td><?php if ($qiwiwpro_morepay_redirect) { ?>
            <input type="radio" name="<?php echo $pname; ?>_morepay_redirect" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_morepay_redirect" value="0" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_morepay_redirect" value="1" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_morepay_redirect" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>-->
        <tr>
          <td><?php echo $entry_style; ?></td>
          <td><?php if (${"{$pname}_style"}) { ?>
            <input type="radio" name="<?php echo $pname; ?>_style" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_style" value="0" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_style" value="1" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_style" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_later; ?></td>
          <td><?php if (${"{$pname}_button_later"}) { ?>
            <input type="radio" name="<?php echo $pname; ?>_button_later" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_button_later" value="0" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_button_later" value="1" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_button_later" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
        <tr class="hideotlog" <?php if ($qiwiwpro_otlog == 'pay') {?>style="display:none;"<?php } ?>>
          <td><?php echo $text_createorder_or_notcreate; ?></td>
          <td><?php if (${"{$pname}_createorder_or_notcreate"}) { ?>
            <input type="radio" name="<?php echo $pname; ?>_createorder_or_notcreate" value="1" checked="checked" id="nocreate" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_createorder_or_notcreate" value="0" id="create" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_createorder_or_notcreate" value="1" id="nocreate" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_createorder_or_notcreate" value="0" checked="checked" id="create" />
            <?php echo $text_no; ?>
            <?php } ?></td>
       </tr>
        <tr>
          <td><?php echo $entry_success_alert_admin_tab; ?></td>
          <td><?php if (${"{$pname}_success_alert_admin"}) { ?>
            <input type="radio" name="<?php echo $pname; ?>_success_alert_admin" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_success_alert_admin" value="0" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_success_alert_admin" value="1" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_success_alert_admin" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_success_alert_customer_tab; ?></td>
          <td><?php if (${"{$pname}_success_alert_customer"}) { ?>
            <input type="radio" name="<?php echo $pname; ?>_success_alert_customer" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_success_alert_customer" value="0" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_success_alert_customer" value="1" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_success_alert_customer" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_instruction_tab; ?></td>
          <td><?php if (${"{$pname}_instruction_attach"}) { ?>
            <input type="radio" name="<?php echo $pname; ?>_instruction_attach" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_instruction_attach" value="0" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_instruction_attach" value="1" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_instruction_attach" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_instruction; ?></td>
          <td><?php foreach ($languages as $language) { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <textarea name="<?php echo $pname; ?>_instruction_<?php echo $language['language_id']; ?>" cols="50" rows="3"><?php echo isset(${"{$pname}_instruction_{$language['language_id']}"}) ? ${"{$pname}_instruction_{$language['language_id']}"} : ''; ?></textarea><br /><?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_mail_instruction_tab; ?></td>
          <td><?php if (${"{$pname}_mail_instruction_attach"}) { ?>
            <input type="radio" name="<?php echo $pname; ?>_mail_instruction_attach" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_mail_instruction_attach" value="0" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_mail_instruction_attach" value="1" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_mail_instruction_attach" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_mail_instruction; ?></td>
          <td><?php foreach ($languages as $language) { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <textarea name="<?php echo $pname; ?>_mail_instruction_<?php echo $language['language_id']; ?>" cols="50" rows="3"><?php echo isset(${"{$pname}_mail_instruction_{$language['language_id']}"}) ? ${"{$pname}_mail_instruction_{$language['language_id']}"} : ''; ?></textarea><br /><?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_success_comment_tab; ?></td>
          <td><?php if (${"{$pname}_success_comment_attach"}) { ?>
            <input type="radio" name="<?php echo $pname; ?>_success_comment_attach" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_success_comment_attach" value="0" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_success_comment_attach" value="1" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_success_comment_attach" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_success_comment; ?></td>
          <td><?php foreach ($languages as $language) { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <textarea name="<?php echo $pname; ?>_success_comment_<?php echo $language['language_id']; ?>" cols="50" rows="3"><?php echo isset(${"{$pname}_success_comment_{$language['language_id']}"}) ? ${"{$pname}_success_comment_{$language['language_id']}"} : ''; ?></textarea><br /><?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_hrefpage_tab; ?></td>
          <td><?php if (${"{$pname}_hrefpage_text_attach"}) { ?>
            <input type="radio" name="<?php echo $pname; ?>_hrefpage_text_attach" value="1" checked="checked" />
            <?php echo $text_my; ?>
            <input type="radio" name="<?php echo $pname; ?>_hrefpage_text_attach" value="0" />
            <?php echo $text_default; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_hrefpage_text_attach" value="1" />
            <?php echo $text_my; ?>
            <input type="radio" name="<?php echo $pname; ?>_hrefpage_text_attach" value="0" checked="checked" />
            <?php echo $text_default; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_hrefpage; ?></td>
          <td><?php foreach ($languages as $language) { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <textarea name="<?php echo $pname; ?>_hrefpage_text_<?php echo $language['language_id']; ?>" cols="50" rows="3"><?php echo isset(${"{$pname}_hrefpage_text_{$language['language_id']}"}) ? ${"{$pname}_hrefpage_text_{$language['language_id']}"} : ''; ?></textarea><br /><?php } ?></td>
        </tr>
        <!--<tr>
          <td><?php echo $entry_success_page_tab; ?></td>
          <td><?php if (${"{$pname}_success_page_text_attach"}) { ?>
            <input type="radio" name="<?php echo $pname; ?>_success_page_text_attach" value="1" checked="checked" />
            <?php echo $text_my; ?>
            <input type="radio" name="<?php echo $pname; ?>_success_page_text_attach" value="0" />
            <?php echo $text_default; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_success_page_text_attach" value="1" />
            <?php echo $text_my; ?>
            <input type="radio" name="<?php echo $pname; ?>_success_page_text_attach" value="0" checked="checked" />
            <?php echo $text_default; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_success_page_text; ?></td>
          <td><?php foreach ($languages as $language) { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <textarea name="<?php echo $pname; ?>_success_page_text_<?php echo $language['language_id']; ?>" cols="50" rows="3"><?php echo isset(${"{$pname}_success_page_text_{$language['language_id']}"}) ? ${"{$pname}_success_page_text_{$language['language_id']}"} : ''; ?></textarea><br /><?php } ?></td>
        </tr>-->
         <!--<tr>
          <td><?php echo $entry_waiting_page_tab; ?></td>
          <td><?php if (${"{$pname}_waiting_page_text_attach"}) { ?>
            <input type="radio" name="<?php echo $pname; ?>_waiting_page_text_attach" value="1" checked="checked" />
            <?php echo $text_my; ?>
            <input type="radio" name="<?php echo $pname; ?>_waiting_page_text_attach" value="0" />
            <?php echo $text_default; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_waiting_page_text_attach" value="1" />
            <?php echo $text_my; ?>
            <input type="radio" name="<?php echo $pname; ?>_waiting_page_text_attach" value="0" checked="checked" />
            <?php echo $text_default; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_waiting_page_text; ?></td>
          <td><?php foreach ($languages as $language) { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <textarea name="<?php echo $pname; ?>_waiting_page_text_<?php echo $language['language_id']; ?>" cols="50" rows="3"><?php echo isset(${"{$pname}_waiting_page_text_{$language['language_id']}"}) ? ${"{$pname}_waiting_page_text_{$language['language_id']}"} : ''; ?></textarea><br /><?php } ?></td>
        </tr>-->
        <tr class="showotlog" <?php if ($qiwiwpro_otlog != 'stock' && $qiwiwpro_otlog != 'pay') {?>style="display:none;"<?php } ?>>
        <td><?php echo $entry_start_status; ?></td>
        <td><select name="<?php echo $pname; ?>_start_status_id">
            <?php foreach ($order_statuses as $order_status) { ?>
            <?php if ($order_status['order_status_id'] == ${"{$pname}_start_status_id"}) { ?>
            <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></td>
        </tr>
        <tr>
        <td><?php echo $entry_on_status; ?></td>
        <td><select name="<?php echo $pname; ?>_on_status_id">
            <?php foreach ($order_statuses as $order_status) { ?>
            <?php if ($order_status['order_status_id'] == ${"{$pname}_on_status_id"}) { ?>
            <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></td>
        </tr>
        <tr>
        <td><?php echo $entry_order_status; ?></td>
        <td><select name="<?php echo $pname; ?>_order_status_id">
            <?php foreach ($order_statuses as $order_status) { ?>
            <?php if ($order_status['order_status_id'] == ${"{$pname}_order_status_id"}) { ?>
            <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></td>
        </tr>
        <tr>
        <td><?php echo $entry_gruppa; ?></td>
        <td><input name="<?php echo $pname; ?>_gruppa[]" id="qiwiwpro_gruppa_all" value="all" <?php if ($qiwiwpro_gruppa['0'] == 'all'){ echo 'checked'; } ?> type="checkbox" >&nbsp<label for="qiwiwpro_gruppa_all"><?php echo $text_all_groups; ?></label><br/>
        <?php $i = 0; foreach ($qiwiwpro_groups as $group) { $i++; ?>
            <input name="<?php echo $pname; ?>_gruppa[]" id="qiwiwpro_gruppa_<?php echo $i; ?>" value="<?php echo $group['customer_group_id'] ?>" <?php if (isset($qiwiwpro_gruppa)){ foreach($qiwiwpro_gruppa as $qiwiwpro_gru){ if ($qiwiwpro_gru == $group['customer_group_id']){ echo 'checked';  }}} ?> type="checkbox" class="checkboxg" onclick="toggleParentChecked(this.checked)">&nbsp<label for="qiwiwpro_gruppa_<?php echo $i; ?>"><?php echo $group['name']; ?></label><br/>
        <?php } ?>
        <?php if ($error_dgruppa) { ?>
            <span class="error"><?php echo $error_dgruppa; ?></span>
        <?php } ?>
        </td>
        </tr>
        <tr>
        <td><?php echo $entry_shipping; ?></td>
        <td>
            <input name="<?php echo $pname; ?>_shippings[]" id="qiwiwpro_shippings_all" value="all" <?php if ($qiwiwpro_shippings['0'] == 'all'){ echo 'checked'; } ?> type="checkbox" ><label for="qiwiwpro_shippings_all"><?php echo $text_all_shipping; ?></label><br/>
                            <?php $i = 0; foreach ($shipping_on as $shipping_code => $shipping_name) { $i++; ?>
                              <input name="<?php echo $pname; ?>_shippings[]" id="qiwiwpro_shippings_<?php echo $i; ?>" value="<?php echo $shipping_code ?>" <?php if (isset($qiwiwpro_shippings)){ foreach($qiwiwpro_shippings as $qiwiwpro_shipping){ if ($qiwiwpro_shipping == $shipping_code){ echo 'checked';  }}} ?> type="checkbox" class="checkbox_ship" onclick="toggleParentCheckedShip(this.checked)"><label for="qiwiwpro_shippings_<?php echo $i; ?>"><?php echo $shipping_name; ?></label><br/><?php } ?>
                            <?php if ($error_dshippings) { ?>
                              <span class="error"><?php echo $error_dshippings; ?></span>
                            <?php } ?>
                           </td>
                        </tr>
        <tr>
              <td><?php echo $entry_store; ?></td>
              <td><div class="scrollbox">
                  <?php $class = 'even'; ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (in_array(0, ${"{$pname}_store"})) { ?>
                    <input type="checkbox" name="<?php echo $pname; ?>_store[]" value="0" checked="checked" />
                    <?php echo $text_default; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="<?php echo $pname; ?>_store[]" value="0" />
                    <?php echo $text_default; ?>
                    <?php } ?>
                  </div>
                  <?php foreach ($stores as $store) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (in_array($store['store_id'], ${"{$pname}_store"})) { ?>
                    <input type="checkbox" name="<?php echo $pname; ?>_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                    <?php echo $store['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="<?php echo $pname; ?>_store[]" value="<?php echo $store['store_id']; ?>" />
                    <?php echo $store['name']; ?>
                    <?php } ?>
                  </div>
                  <?php } ?>
                </div></td>
        </tr>
        <tr>
        <td><?php echo $entry_geo_zone; ?></td>
        <td><select name="<?php echo $pname; ?>_geo_zone_id">
            <option value="0"><?php echo $text_all_zones; ?></option>
            <?php foreach ($geo_zones as $geo_zone) { ?>
            <?php if ($geo_zone['geo_zone_id'] == ${"{$pname}_geo_zone_id"}) { ?>
            <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_showadmin ; ?></td>
          <td><?php if ($qiwiwpro_showadmin == 'none') { ?>
            <input type="radio" name="<?php echo $pname; ?>_showadmin" value="none" checked="checked" />
            <?php echo $text_showadmin_none; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_showadmin" value="only" />
            <?php echo $text_showadmin_only; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_showadmin" value="main" />
            <?php echo $text_showadmin_main; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_showadmin" value="0" />
            <?php echo $text_showadmin_default; ?>
            <?php } else if ($qiwiwpro_showadmin == 'main') { ?>
            <input type="radio" name="<?php echo $pname; ?>_showadmin" value="none" />
            <?php echo $text_showadmin_none; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_showadmin" value="only" />
            <?php echo $text_showadmin_only; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_showadmin" value="main" checked="checked" />
            <?php echo $text_showadmin_main; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_showadmin" value="0" />
            <?php echo $text_showadmin_default; ?>
            <?php } else if($qiwiwpro_showadmin == 'only'){ ?>
            <input type="radio" name="<?php echo $pname; ?>_showadmin" value="none" />
            <?php echo $text_showadmin_none; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_showadmin" value="only" checked="checked" />
            <?php echo $text_showadmin_only; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_showadmin" value="main" />
            <?php echo $text_showadmin_main; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_showadmin" value="0" />
            <?php echo $text_showadmin_default; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_showadmin" value="none" />
            <?php echo $text_showadmin_none; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_showadmin" value="only" />
            <?php echo $text_showadmin_only; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_showadmin" value="main" />
            <?php echo $text_showadmin_main; ?><br/>
            <input type="radio" name="<?php echo $pname; ?>_showadmin" value="0" checked="checked" />
            <?php echo $text_showadmin_default; ?>
            <?php } ?></td>
        </tr>
        <tr>
        <td><?php echo $entry_status; ?></td>
        <td><select name="<?php echo $pname; ?>_status">
            <?php if (${"{$pname}_status"}) { ?>
            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
            <option value="0"><?php echo $text_disabled; ?></option>
            <?php } else { ?>
            <option value="1"><?php echo $text_enabled; ?></option>
            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
            <?php } ?>
          </select></td>
        </tr>
         <tr>
          <td><?php echo $entry_sort_order; ?></td>
          <td><input type="text" name="<?php echo $pname; ?>_sort_order" value="<?php echo ${"{$pname}_sort_order"}; ?>" size="1" /></td>
        </tr>
        </table>
        <table class="table">
        <thead>
           <h4><?php echo $text_balance; ?></h4>
        </thead>
        <tr>
          <td width="25%"><?php echo $entry_artprbalance; ?></td>
          <td><?php if ($qiwiwpro_artprbalance) { ?>
            <input type="radio" name="<?php echo $pname; ?>_artprbalance" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_artprbalance" value="0" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_artprbalance" value="1" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_artprbalance" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_balance_name; ?></td>
          <td><?php foreach ($languages as $language) { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <textarea name="<?php echo $pname; ?>_balance_name_<?php echo $language['language_id']; ?>" cols="50" rows="1"><?php echo isset(${"{$pname}_balance_name_{$language['language_id']}"}) ? ${"{$pname}_balance_name_{$language['language_id']}"} : ''; ?></textarea><br />
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_balance_url; ?></td>
          <td><?php echo $copy_balance_url; ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_balance_sort; ?></td>
          <td><input type="text" name="<?php echo $pname; ?>_balance_sort" value="<?php echo $qiwiwpro_balance_sort; ?>" size="1" /></td>
        </tr>
        </table>
        <table class="table">
        <thead>
           <h4><?php echo $text_fpay; ?></h4>
        </thead>
        <tr>
          <td width="25%"><?php echo $entry_artprfpay; ?></td>
          <td><?php if ($qiwiwpro_artprfpay) { ?>
            <input type="radio" name="<?php echo $pname; ?>_artprfpay" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_artprfpay" value="0" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="<?php echo $pname; ?>_artprfpay" value="1" />
            <?php echo $text_yes; ?>
            <input type="radio" name="<?php echo $pname; ?>_artprfpay" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_fpay_name; ?></td>
          <td><?php foreach ($languages as $language) { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <textarea name="<?php echo $pname; ?>_fpay_name_<?php echo $language['language_id']; ?>" cols="50" rows="1"><?php echo isset(${"{$pname}_fpay_name_{$language['language_id']}"}) ? ${"{$pname}_fpay_name_{$language['language_id']}"} : ''; ?></textarea><br />
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_fpay_url; ?></td>
          <td><?php echo $copy_fpay_url; ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_fpay_sort; ?></td>
          <td><input type="text" name="<?php echo $pname; ?>_fpay_sort" value="<?php echo $qiwiwpro_fpay_sort; ?>" size="1" /></td>
        </tr>
        </table>
        <input type="hidden" name="<?php echo $pname; ?>_methodcode" value="<?php echo $methodcode; ?>" />
        <input type="hidden" name="<?php echo $pname; ?>_balance_href" value="<?php echo $balance_href; ?>" />
        <input type="hidden" name="<?php echo $pname; ?>_fpay_href" value="<?php echo $fpay_href; ?>" />
        </div>
      </form>
    </div>
      <p style="text-align:center;">Qiwi PRO <?php echo $version ?></p>
  </div>
</div>
<script>
  $(document).ready(function() {
    $('#pay_tab').click(function () {
      $('#create').prop("checked", true);
      $('.hideotlog').hide('fast');
      $('.showotlog').show('fast');
    });
    $('#stock_tab').click(function () {
      $('#create').prop("checked", true);
      $('.hideotlog').hide('fast');
      $('.showotlog').show('fast');
    });
    $('#standard_tab').click(function () {
      $('.hideotlog').show('fast');
      $('.showotlog').hide('fast');
    });

    
    $('#qiwiwpro_gruppa_all').click(function(){
      var checked = $(this).is (':checked');
      $('.checkboxg').prop('checked', checked);
    });

    $('.checkboxg').on('change', function(){
        $('#qiwiwpro_gruppa_all').prop('checked', $('.checkboxg').length == $('.checkboxg:checked').length);
    });



    $('#qiwiwpro_shippings_all').click(function(){
      var checked = $(this).is (':checked');
      $('.checkbox_ship').prop('checked', checked);
    });

    $('.checkbox_ship').on('change', function(){
        $('#qiwiwpro_shippings_all').prop('checked', $('.checkbox_ship').length == $('.checkbox_ship:checked').length);
    });

});

function toggleParentChecked(status) {
     if(status==false)
     $("#qiwiwpro_gruppa_all").attr("checked",status); 
     else
     {
        var isallchecked = true;
        $(".checkboxg").each(function() {
        if(!$(this).attr("checked"))
           isallchecked = false;
     })
     if(isallchecked)
        $("#qiwiwpro_gruppa_all").attr("checked", true);
     } 
}

function toggleParentCheckedShip(status) {
     if(status==false)
     $("#qiwiwpro_shippings_all").attr("checked",status); 
     else
     {
        var isallchecked_ship = true;
        $(".checkbox_ship").each(function() {
        if(!$(this).attr("checked"))
           isallchecked_ship = false;
     })
     if(isallchecked_ship)
        $("#qiwiwpro_shippings_all").attr("checked", true); 
     } 
}

$('#getuiid').on('click', function() {
    $.ajax({
    url: '<?php echo $storeuuid; ?>&tok=' + $("#tok").val(),
    dataType: 'json',
    beforeSend: function() {
      $('#getuiid').button('loading');
    },
    complete: function() {
      $('#getuiid').button('reset');
    },
    success: function(json) {
      if (json['suiid']) {
        $('#su').empty();
        $.each(json['suiid'], function(){
            $("#su").val(this.name);
            $("#requ").text('');
            $('#edituiid').get(0).type = 'hidden';
            $('#su').get(0).type = '';
            if (this.uiid) {
            $("#requ").text('Адрес уведомлений: '+this.uiid);
            $('#edituiid').get(0).type = 'button';
            }
        })
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});

$('#edituiid').on('click', function() {
    var poehali = confirm("Вы уверены?");
    if (poehali) {
        $.ajax({
        url: '<?php echo $euuid; ?>&tok=' + $("#tok").val(),
        dataType: 'json',
        beforeSend: function() {
          $('#edituiid').button('loading');
        },
        complete: function() {
          $('#edituiid').button('reset');
        },
        success: function(json) {
          if (json['suiid']) {
            $('#su').empty();
            $.each(json['suiid'], function(){
                $("#su").val(this.name);
                $("#requ").text('');
                $('#edituiid').get(0).type = 'hidden';
                $('#su').get(0).type = '';
                if (this.uiid) {
                $("#requ").text('Адрес уведомлений: '+this.uiid);
                $('#edituiid').get(0).type = 'button';
                }
            })
          }
        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });
    }
});
</script>
<?php echo $footer; ?> 