<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
              <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
              <?php foreach ($breadcrumbs as $breadcrumb) { ?>
              <li><a  href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
              <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
    <style>
        .small_text{
            font-size: 9px;
            color: darkgray;
        }
        .small_text:hover{
            font-size: 9px;
            color: black;
        }
        .table_zebra tbody tr td:nth-child(2n+1){
           background: lemonchiffon;
        }
        .table_zebra tbody tr td:nth-child(2){
           background: none;
        }
        
        .alert-box{
            margin-bottom: 5px;
            margin-top: 5px;
            display: none;
        }
        
        .table-abc-analysis tr td:first-child{
            width: 25%;
        }
        
        .field-file{
            font-size: 15px;
            font-weight: bold;
            text-shadow: 1px 1px 1px #444, 0 0 1px #ccc;
            color: black;
        }
        
        optgroup{
            border-bottom: 1px solid #ccc;
            color:#bbb;
        }
        optgroup option{
            color:#444;
        }
        
        .error-border{
            border:3px solid red;
            background: bisque;
        }
        
        
        .setTemplateDataBtn{
            border:1px solid #dddddd;
            background: #bbbbbb;
        }
        
        .setTemplateDataBtnNeedSave{
            border:1px solid brown;
            background: red;
        }
        
        .field-view-file-data{
            font-size: 9px; color:#bbb;
        }
        
        .field-view-file-data:hover{
            background: white;
            color: black;
        }
        
        .attribute_import_status,
        .product_import_status,
        .manufacturer_import_status,
        .attribute_import_status,
        .option_import_status
        {
            border-left: 10px solid #CCC;
        }
        #modal_form {
	width: 800px; 
	height: 600px; /* Рaзмеры дoлжны быть фиксирoвaны */
	border-radius: 5px;
	border: 3px #000 solid;
	background: #fff;
	position: fixed; /* чтoбы oкнo былo в видимoй зoне в любoм месте */
	top: 25%; /* oтступaем сверху 45%, oстaльные 5% пoдвинет скрипт */
	left: 50%; /* пoлoвинa экрaнa слевa */
	margin-top: -300px;
	margin-left: -400px; /* тут вся мaгия центрoвки css, oтступaем влевo и вверх минус пoлoвину ширины и высoты сooтветственнo =) */
	display: none; /* в oбычнoм сoстoянии oкнa не дoлжнo быть */
	opacity: 0; /* пoлнoстью прoзрaчнo для aнимирoвaния */
	z-index: 5; /* oкнo дoлжнo быть нaибoлее бoльшем слoе */
	padding: 40px 10px;
}

#modal_form_well{

    overflow-y: auto;

}
/* Кнoпкa зaкрыть для тех ктo в тaнке) */
#modal_form #modal_close {
	width: 21px;
	height: 21px;
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
	display: block;
}
/* Пoдлoжкa */
#overlay {
	z-index:3; /* пoдлoжкa дoлжнa быть выше слoев элементoв сaйтa, нo ниже слoя мoдaльнoгo oкнa */
	position:fixed; /* всегдa перекрывaет весь сaйт */
	background-color:#000; /* чернaя */
	opacity:0.8; /* нo немнoгo прoзрaчнa */
	-moz-opacity:0.8; /* фикс прозрачности для старых браузеров */
	filter:alpha(opacity=80);
	width:100%; 
	height:100%; /* рaзмерoм вo весь экрaн */
	top:0; /* сверху и слевa 0, oбязaтельные свoйствa! */
	left:0;
	cursor:pointer;
	display:none; /* в oбычнoм сoстoянии её нет) */
}
    </style>
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
          <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <?php if ($success) { ?>
        <div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>
          <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        
    <div class="panel panel-default">
    
    <div class="panel-body">
        
        <ul  class="nav nav-tabs" >
            <li><a  data-toggle="tab"  href="#tab_yml_import" ><?php echo $tab_yml_import; ?></a></li>
            <li><a  data-toggle="tab" href="#tab-setting"  ><?php echo $tab_setting; ?></a></li>
        </ul>
        
        <div class="tab-content">
            <div id="tab_yml_import" class="tab-pane" >
                <div class="row">
                    <div class="col-sm-12">				
                        <div class="tab-content">
                            <div class="table-responsive">
                                <h3><?php echo $text_step_1_setting ?></h3>
                                <form id="tamplate_data_form">
                                    <table class="table table-bordered table-hover">
                                          <tbody>
                                                <tr>
                                                    <td class="text-left" width="25%">
                                                        <?php echo $entry_odmproyml_format_data ?>
                                                    </td>
                                                    <td class="text-left">
                                                        <div class="panel-body">
                                                            <div class="form-group">
                                                                <select onchange="getStepOneSettings(this.value,0);" name="odmproyml_format_data"  class="form-control">
                                                    <option value="0" ><?php echo $entry_select; ?></option>
                                                                    <?php foreach($odmproyml_format_data as $odmproyml_format_data_row){ ?>
                                                    <option value="<?php echo $odmproyml_format_data_row ?>" ><?php echo ${'entry_odmproyml_format_data_format_'.$odmproyml_format_data_row}; ?></option>
                                                                    <?php } ?>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-left" colspan="2" id="stepOneSettings">

                                                    </td>
                                                </tr>
                                            </tbody>
                                    </table>
                                    <div  id="stepTwoSettings">

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="tab-setting" class="tab-pane" >
            
                <div align="right">
                    <a onclick="$('#form-setting').submit();" title="<?php echo $entry_odmproyml_tamplate_data_save_tamplate_data; ?>" class="btn btn-info"><i class="fa fa-tasks"></i>  <?php echo $entry_odmproyml_tamplate_data_save_tamplate_data; ?></a>
                </div>   
            
                <br>
            
                <h2><?php echo $entry_update_csv_link_new_title ?></h2>
                
                <form action="<?php echo $action_setting; ?>" method="post" enctype="multipart/form-data" id="form-setting">
                    
                    <?php $id = time(); ?>
                    
                    <input name="odmproyml_update_yml_link[<?php echo $id ?>][id]" type="hidden" value="<?php echo $id ?>" />
                    
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th><?php echo $column_update_csv_link_template_data ?></th>
                                <th><?php echo $column_update_csv_link_token ?></th>
                                <th><?php echo $column_update_csv_link_status ?></th>
                            </tr>
                        </thead>
                        <tbody>
                              <tr>
                                  <td class="text-left">
                                      <div class="input-group">
                                      <?php if(!$odmproyml_update_yml_link_tamplate_data){ ?>
                                          <select name="odmproyml_update_yml_link[<?php echo $id ?>][tamplate_data_id]"  class="form-control">
                                              <option value="0" ><?php echo $entry_odmproyml_tamplate_data_empty; ?></option>
                                          </select>
                                      <?php }else{ ?>
                                          <select name="odmproyml_update_yml_link[<?php echo $id ?>][tamplate_data_id]"  class="form-control">
                                              
                                              <option value="0" ><?php echo $entry_select; ?></option>
                                              
                                                  <?php foreach($odmproyml_update_yml_link_tamplate_data as $tamplate_data_key => $tamplate_data){ ?>
                                              
                                                        <option value="<?php echo $tamplate_data_key ?>" ><?php echo $tamplate_data['name']; ?></option>
                                                      
                                                  <?php } ?>
                                                  
                                          </select>
                                      <?php } ?>
                                      </div>
                                  </td>
                                  <td>
                                      <input class="form-control" name="odmproyml_update_yml_link[<?php echo $id ?>][token]" value="" />
                                  </td>
                                  <td>
                                        <select name="odmproyml_update_yml_link[<?php echo $id ?>][status]"  class="form-control">
                                              
                                            <option value="0" ><?php echo $entry_update_csv_link_status_0; ?></option>
                                            <option value="1" ><?php echo $entry_update_csv_link_status_1; ?></option>
                                            <option value="3" ><?php echo $entry_update_csv_link_status_3; ?></option>
                                                  
                                        </select>
                                  </td>
                              </tr>
                        </tbody>
                    </table>
                
                <h2><?php echo $entry_update_csv_link_title ?></h2>
                
                <?php if($odmproyml_update_yml_link){ ?>
                
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th><?php echo $column_update_csv_link_template_data ?></th>
                            <th><?php echo $column_update_csv_link_token ?></th>
                            <th><?php echo $column_update_csv_link_status ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <?php foreach( $odmproyml_update_yml_link as $link_data ){ ?>
                        
                            <?php $id = $link_data['id']; ?>
                            
                            <input name="odmproyml_update_yml_link[<?php echo $id ?>][id]" type="hidden" value="<?php echo $id ?>" />
                            
                            <tr>
                                <td class="text-left">
                                    <div class="input-group">
                                    <?php if(!$odmproyml_update_yml_link_tamplate_data){ ?>
                                        <select name="odmproyml_update_yml_link[<?php echo $id ?>][tamplate_data_id]"  class="form-control">
                                            <option value="0" ><?php echo $entry_odmproyml_tamplate_data_empty; ?></option>
                                        </select>
                                    <?php }else{ ?>
                                        <select name="odmproyml_update_yml_link[<?php echo $id ?>][tamplate_data_id]"  class="form-control">

                                                <?php foreach($odmproyml_update_yml_link_tamplate_data as $tamplate_data_key => $tamplate_data){ ?>
                                                
                                                    <?php if($link_data['tamplate_data_id'] && $link_data['tamplate_data_id']==$tamplate_data_key){ ?>

                                                        <option selected="" value="<?php echo $tamplate_data_key ?>" ><?php echo $tamplate_data['name']; ?></option>
                                                      
                                                    <?php }else{ ?>
                                                        
                                                        <option value="<?php echo $tamplate_data_key ?>" ><?php echo $tamplate_data['name']; ?></option>
                                                    
                                                    <?php } ?>

                                                <?php } ?>

                                        </select>
                                    <?php } ?>
                                    </div>
                                </td>
                                <td>
                                    <input class="form-control" name="odmproyml_update_yml_link[<?php echo $id ?>][token]" value="<?php echo $link_data['token'] ?>" />
                                </td>
                                <td>
                                      <select name="odmproyml_update_yml_link[<?php echo $id ?>][status]"  class="form-control">
                                          
                                          <option value="0" ><?php echo $entry_update_csv_link_status_0; ?></option>
                                          
                                          <?php if($link_data['status'] && $link_data['status']==1){ ?>
                                            
                                                <option selected="" value="1" ><?php echo $entry_update_csv_link_status_1; ?></option>

                                                <option value="3" ><?php echo $entry_update_csv_link_status_3; ?></option>
                                            
                                            <?php }elseif($link_data['status'] && $link_data['status']==3){ ?>
                                            
                                                <option value="1" ><?php echo $entry_update_csv_link_status_1; ?></option>

                                                <option selected=""  value="3" ><?php echo $entry_update_csv_link_status_3; ?></option>
                                            
                                            <?php }else{ ?>
                                            
                                                <option value="1" ><?php echo $entry_update_csv_link_status_1; ?></option>

                                                <option value="3" ><?php echo $entry_update_csv_link_status_3; ?></option>
                                            
                                            <?php } ?>

                                      </select>
                                </td>
                            </tr>
                              <tr>
                                    <td class="text-right"><?php echo $column_update_csv_link_link ?></td>
                                    <td colspan="2">
                                        <input style="width:60%"  class="form-control"  readonly="" onclick="$(this).select()" value="<?php echo HTTP_CATALOG.'index.php?route=feed/odmproyml_update_yml_link&token='.$link_data['token'] ?>"/>
                                    </td>
                              </tr>
                        <?php } ?>
                    </tbody>
                </table>
                
                <?php } else { ?>
                
                    <div class="alert alert-success"><?php echo $entry_update_csv_link_empty ?></div>
                
                <?php } ?>
                
                </form>
                
                
                <hr>
                
                <?php if ((!$error_warning) && (!$success)) { ?>
                
                    <div id="ocext_notification" class="alert alert-info"><i class="fa fa-info-circle"></i>
                        
                            <div id="ocext_loading"><img src="<?php echo HTTP_SERVER; ?>/view/image/ocext/loading.gif" /></div>
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            
                    </div>
                <?php } ?>
                
            </div>        
        
        </div>
        
    </div>        
    </div>
</div>
</div>

<div id="modal_form"><!-- Сaмo oкнo --> 
      <span id="modal_close">X</span> <!-- Кнoпкa зaкрыть --> 
      <div id="modal_form_well" class="well" style="height: 550px; overflow-y: auto">
          
      </div>
</div>
<div id="overlay"></div>

<script type="text/javascript"><!--

var start = 0;
var first_start = 0;
var finished = 0;
var limit = 0;
var total = 0;

function startImport(new_start){
    var errors = false;
    
    if($("select[name='odmproyml_tamplate_data_yml[type_change]']").val()==0){
        $("select[name='odmproyml_tamplate_data_yml[type_change]']").addClass('error-border');
        errors = true;
    }else{
        $("select[name='odmproyml_tamplate_data_yml[type_change]']").removeClass('error-border');
    }
    if(errors===true){
        return;
    }
    
    if(limit==0 && start==0){
        start = parseInt($('input[name=\'odmproyml_tamplate_data_yml[start]\']').val()) - 1;
        first_start = parseInt($('input[name=\'odmproyml_tamplate_data_yml[start]\']').val()) - 1;
        if(start<0){
            start = 0;
        }
        if(first_start<0){
            first_start = 0;
        }
        
        limit = parseInt($('input[name=\'odmproyml_tamplate_data_yml[limit]\']').val());
        $('input[name=\'odmproyml_tamplate_data_yml[limit]\']').prop('readOnly',true);
        $('input[name=\'odmproyml_tamplate_data_yml[start]\']').prop('readOnly',true);
        $('#startImport').hide();
        $('#importStartMessages').html('<div class="alert alert-info"><i class="fa fa-info-circle"></i>&nbsp;&nbsp;<img src="<?php echo HTTP_SERVER; ?>/view/image/ocext/loading.gif" /><button type="button" class="close" data-dismiss="alert">&times;</button>&nbsp;&nbsp;<?php echo $text_import_start ?>: <b><?php echo $text_wite ?></b> / <b><?php echo $text_wite ?></b></div>');
    }else{
        finished = start+limit-first_start;
        new_start = parseInt(new_start);
        start = new_start;
    }
    
    $.ajax({
            type: 'post',
            url: 'index.php?route=extension/module/yml_ocext_dmpro/startImport&token=<?php echo $token; ?>&start='+start,
            data: $('#tamplate_data_form input:text, #tamplate_data_form input:hidden, #tamplate_data_form input:checkbox:checked, #tamplate_data_form select'),
        <?php if($debug_mode){ ?>
            dataType: 'html',
            success: function(json) {
                $('#importStartMessages').html('Извините, включен режим отладки. Sorry, debug mode is enabled<br><br>'+json);
                $('#startImport').show();
                start = 0;
                total = 0;
                first_start = 0;
                limit = 0;
                finished = 0;
                return;
        <?php }else{ ?>
            dataType: 'json',
            success: function(json) {
        <?php } ?>
    
                if(json['error']!=''){
                    $('#importStartMessages').html('<div class="alert alert-danger">'+json['error']+'</div>');
                    $('#startImport').show();
                    start = 0;
                    total = 0;
                    first_start = 0;
                    limit = 0;
                    finished = 0;
                    return;
                }
                
                if(json['success']!=''){
                    $('#importStartMessages').html('<div class="alert alert-success">'+json['success']+'</div>');
                    $('input[name=\'odmproyml_tamplate_data_yml[limit]\']').prop('readonly',false);
                    $('input[name=\'odmproyml_tamplate_data_yml[start]\']').prop('readonly',false);
                    $('#startImport').show();
                    start = 0;
                    total = 0;
                    first_start = 0;
                    limit = 0;
                    finished = 0;
                    return;
                }
                if(json['total']!=''){
                    total = parseInt(json['total']) - first_start;
                    if(total<0){
                        total = 0;
                    }
                    $('#importStartMessages').html('<div class="alert alert-info"><i class="fa fa-info-circle"></i>&nbsp;&nbsp;<img src="<?php echo HTTP_SERVER; ?>/view/image/ocext/loading.gif" /><button type="button" class="close" data-dismiss="alert">&times;</button>&nbsp;&nbsp;<?php echo $text_import_start ?>: : <b>'+finished+'</b> / <b>'+total+'</b></div>');
                    startImport(start+limit);
                }
            },
            failure: function(response){
                <?php if($debug_mode){ ?>
                    
                    alert(response);
            
                <?php } ?>
            },
            error: function(xhr, ajaxOptions, thrownError) {
                
                <?php if($debug_mode){ ?>
                    
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            
                <?php } ?>
            }
    });
    
}

function openElementOnNameValue(name_open,value_this,value_open,element){
    if(value_open==value_this){
        $(element + "[name='"+name_open+"']").show();
    }else{
        $(element + "[name='"+name_open+"']").hide();
        $(element + "[name='"+name_open+"'] option[value='0']").prop('selected', true);
    }
}

function setTemplateData(type_action){
    
    $("#setTemplateData").empty();
    
    $("#setTemplateData").before('<div id="ocext_loading_setTemplateData"><img src="<?php echo HTTP_SERVER; ?>/view/image/ocext/loading.gif" /></div>').show();
    
    $.ajax({
            type: 'post',
            url: 'index.php?route=extension/module/yml_ocext_dmpro/setTemplateData&token=<?php echo $token; ?>&type_action='+type_action,
            data: $('#tamplate_data_form input:text, #tamplate_data_form input:hidden, #tamplate_data_form input:checkbox:checked, #tamplate_data_form select'),
            dataType: 'json',
            success: function(json) {
                if(json['success']!=''){
                    $('#setTemplateData').html(json['success']);
                }
                if(json['error']!=''){
                    $('#setTemplateData').html(json['error']);
                }
                if(type_action=='save'){
                    var new_option = '<option value="'+json['odmproyml_tamplate_data_yml_id']+'">'+json['odmproyml_tamplate_data_yml_name']+'</option>'
                    $("select[name='odmproyml_tamplate_data_yml[id]']").append(new_option);
                    $("select[name='odmproyml_tamplate_data_yml[id]'] option[value='"+json['odmproyml_tamplate_data_yml_id']+"']").prop('selected', true);
                    $("#setTemplateDataTypeAction option[value='update']").prop('selected', true);
                }
                if(type_action=='delete'){
                    $("select[name='odmproyml_tamplate_data_yml[id]'] option[value='"+json['odmproyml_tamplate_data_yml_id_delete']+"']").remove();
                }
                $('#ocext_loading_setTemplateData').remove();
                $("#setTemplateDataBtn").removeClass('setTemplateDataBtnNeedSave');
            },
            failure: function(response){
                
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
    });
}

function getTypesDataColumns(type_data,id_td,field){
    $(id_td).html('<div id="ocext_loading_'+id_td+'"><img src="<?php echo HTTP_SERVER; ?>/view/image/ocext/loading.gif" /></div>').show();
    $.ajax({
            type: 'post',
            url: 'index.php?route=extension/module/csv_ocext_dmpro/getTypesData&token=<?php echo $token; ?>&field='+field+'&type_data='+type_data,
            data: $('#tamplate_data_form input:text, #tamplate_data_form input:hidden, #tamplate_data_form input:checkbox:checked, #tamplate_data_form select'),
            dataType: 'html',
            success: function(response) {
                $(id_td).html(response);
            },
            failure: function(response){
                    
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
    });
}

function updateSaveButton(){

    $('#tamplate_data_form input:text, #tamplate_data_form input:hidden, #tamplate_data_form input:checkbox:checked, #tamplate_data_form select').change(function(){
        $("#setTemplateDataBtn").addClass('setTemplateDataBtnNeedSave');
        $("#setTemplateData").hide();
    });

}

function changeTypeData(){
    $('.select-type-data').each(function(){
        if(this.value!=0){
            $(this).change();
        }
    });
    
}

function changeTypeDataColumn(data_column_class){
    if(data_column_class===0){
        $('.select-type-data-column').each(function(){
            if(this.value!=0){
                $(this).change();
            }
        });
    }else{
        $('.'+data_column_class).change();
    }
}



function getTypesDataColumnsAdditional(type_data_column,field,id_td){
    $(id_td).html('<div id="ocext_loading_'+id_td+'"><img src="<?php echo HTTP_SERVER; ?>/view/image/ocext/loading.gif" /></div>').show();
    $.ajax({
            type: 'post',
            url: 'index.php?route=extension/module/csv_ocext_dmpro/getTypesDataColumnAdditional&token=<?php echo $token; ?>&field='+field+'&type_data_column='+type_data_column,
            data: $('#tamplate_data_form input:text, #tamplate_data_form input:hidden, #tamplate_data_form input:checkbox:checked, #tamplate_data_form select'),
            dataType: 'html',
            success: function(response) {
                if(response!=''){
                    $(id_td).show(100);
                    $(id_td).html(response);
                }else{
                    $(id_td).hide();
                }
                
            },
            failure: function(response){
                    
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
    });
}

function getStepTwoSettings(){
    $("#stepTwoSettings").before('<div class="ocext_loading_stepTwoSettings"><img src="<?php echo HTTP_SERVER; ?>/view/image/ocext/loading.gif" /></div>');
    $.ajax({
            type: 'post',
            url: 'index.php?route=extension/module/yml_ocext_dmpro/getStepTwoSettings&token=<?php echo $token; ?>',
            data: $('#tamplate_data_form input:text, #tamplate_data_form input:hidden, #tamplate_data_form input:checkbox:checked, #tamplate_data_form select'),
            dataType: 'html',
            success: function(response) {
                $('#stepTwoSettings').html(response);
                $('.ocext_loading_stepTwoSettings').remove();
            },
            failure: function(response){
                    //alert(response);
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
    });
}

function setCategoryMatchingRow(yml_category_id,category_id,set,text){
    
    if(set==true){
    
        var row = "<div id='setCategoryMatchingRow_"+yml_category_id+"_"+category_id+"_0'><input onclick='removeSel("+yml_category_id+","+category_id+",0);' id='setCategoryMatchingRow"+yml_category_id+"_"+category_id+"' name='odmproyml_tamplate_data_yml[category][category_matching]["+yml_category_id+"]["+category_id+"]' type='checkbox' checked='' value="+category_id+" /><label for='setCategoryMatchingRow"+yml_category_id+"_"+category_id+"' >&nbsp;&nbsp;&nbsp;"+text+"</label><br></div>";
        
        $("#yml_category_category_matching_select"+yml_category_id).append(row);
        
        $("#yml_category_category_matching_select"+yml_category_id).show();
    
    }else{
    
        $("#setCategoryMatchingRow"+yml_category_id+"_"+category_id+"_").remove();
        
    }
    
    
}

function removeSel(yml_category_id,category_id,str){

    $("#setCategoryMatchingRow_"+yml_category_id+"_"+category_id+"_"+str).remove();

}

function setCategoryMatching(yml_category_id,this_value,set){

    if( set==true && $("input[name='odmproyml_tamplate_data_yml[category][category_matching]["+yml_category_id+"][select]']").is(":checked")==true ){
        
        $.ajax({
                type: 'post',
                url: 'index.php?route=extension/module/yml_ocext_dmpro/setCategoryMatching&token=<?php echo $token; ?>&yml_category_id='+yml_category_id,
                data: $('#tamplate_data_form input:text, #tamplate_data_form input:hidden, #tamplate_data_form input:checkbox:checked, #tamplate_data_form select'),
                dataType: 'html',
                success: function(html) {
                    
                    $('#modal_form_well').empty();
                    $('#modal_form_well').append(html);
                    
                },
                failure: function(response){

                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
        });
       
        $('#overlay').fadeIn(400,function(){ 
            
            $('#modal_form').css('display', 'block').animate({opacity: 1, top: '50%'}, 50);
            
        });
    }
    
    if($("input[name='odmproyml_tamplate_data_yml[category][category_matching]["+yml_category_id+"][select]']").is(":checked")==false){
    
        $("#yml_category_category_matching_select"+yml_category_id).hide();
        
        return;
        
    }

}

$(document).ready(function() { 
	$('#modal_close, #overlay').click( function(){ 
		$('#modal_form')
			.animate({opacity: 0, top: '45%'}, 200,  
				function(){ 
					$(this).css('display', 'none'); 
					$('#overlay').fadeOut(400); 
                                        $('#modal_form_well').empty();
				}
			);
	});
});

function getStepOneSettings(format_data,tamplate_data){
    $("#stepOneSettings").before('<div id="ocext_loading_stepOneSettings"><img src="<?php echo HTTP_SERVER; ?>/view/image/ocext/loading.gif" /></div>');
    $("#stepTwoSettings").empty();
    $.ajax({
            type: 'post',
            url: 'index.php?route=extension/module/yml_ocext_dmpro/getStepOneSettings&token=<?php echo $token; ?>',
            data: 'tamplate_data='+tamplate_data+'&format_data='+format_data,
            dataType: 'html',
            success: function(response) {
                $('#stepOneSettings').html(response);
                $('#ocext_loading_stepOneSettings').remove();
            },
            failure: function(response){
                
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
    });
}    
    
function openSettingBox(id_box,check_value){

    if(check_value==0){
        $(id_box).hide(100);
    }else{
        $(id_box).show(200);
    }

}

function getUniqueParams(){
    $("#unique_param").hide();
    
    $(".unique_param_type_row").hide();
    $('.select-type-data').each(function(){
        if(this.value!=0){
            $("#unique_param_"+this.value).show(150);
            $("#unique_param").show(150);
        }
    
    });

}

    
$(document).ready(function() {
    $("a[href=\'#<?php echo $open_tab ?>\']").click();
    
    <?php if($demo_mode){ ?>
    
        $("select[name='odmproyml_format_data']").val('csv');
        $("select[name='odmproyml_format_data']").change();
                    
    <?php } ?>
    
});

function getNotifications() {
	$.ajax({
            type: 'GET',
            url: 'index.php?route=extension/module/yml_ocext_dmpro/getNotifications&token=<?php echo $token; ?>',
            dataType: 'json',
            success: function(json) {
                    if (json['error']) {
                            $('#ocext_notification').html('<i class="fa fa-info-circle"></i><button type="button" class="close" data-dismiss="alert">&times;</button> '+json['error']);
                    } else if (json['message'] && json['message']!='' ) {
                            $('#ocext_notification').html('<i class="fa fa-info-circle"></i><button type="button" class="close" data-dismiss="alert">&times;</button> '+json['message']);
                    }else{
                        $('#ocext_notification').remove();
                    }
            },
            failure: function(){
                    $('#ocext_notification').remove();
            },
            error: function() {
                    $('#ocext_notification').remove();
            }
    });
}
getNotifications();

//--></script> 
<?php echo $footer; ?>