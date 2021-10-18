<?php if($format_data=='yml'){ ?>

<input name="odmproyml_tamplate_data_yml[format_data]" type="hidden" value="<?php echo $format_data ?>" />

<table class="table table-bordered table-hover">
          <tbody>
                <tr>
                    <td class="text-left">
                        <?php echo $entry_odmproyml_tamplate_data ?>
                    </td>
                    <td class="text-left">
                        <div class="input-group">
                        <?php if(!$tamplates_data){ ?>
                            <select name="odmproyml_tamplate_data_yml[id]"  class="form-control">
                                <option value="0" ><?php echo $entry_odmproyml_tamplate_data_empty; ?></option>
                            </select>
                        <?php }else{ ?>
                            <select onchange="getStepOneSettings('<?php echo $format_data ?>',this.value);" name="odmproyml_tamplate_data_yml[id]"  class="form-control">
                                <option value="0" ><?php echo $entry_odmproyml_tamplate_data_new; ?></option>
                                    <?php foreach($tamplates_data as $tamplate_data_key => $tamplate_data){ ?>
                                        <?php if($tamplate_data_selected['id']== $tamplate_data_key){ ?>
                                <option value="<?php echo $tamplate_data_key ?>" selected="" ><?php echo $tamplate_data['name']; ?></option>
                                        <?php }else{ ?>
                                <option value="<?php echo $tamplate_data_key ?>" ><?php echo $tamplate_data['name']; ?></option> 
                                        <?php } ?>
                                    <?php } ?>
                            </select>
                        <?php } ?>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="text-left">
                        <?php echo $entry_odmproyml_encoding ?>
                    </td>
                    <td class="text-left">
                        <div class="input-group">
                        <select name="odmproyml_tamplate_data_yml[encoding]" class="form-control">
                                <option value="0" ><?php echo $entry_select; ?></option>
                                    <?php foreach($encodings as $encoding){ ?>
                                        <?php if($tamplate_data_selected['encoding']== $encoding){ ?>
                                <option value="<?php echo $encoding ?>" selected="" ><?php echo $encoding; ?></option>
                                        <?php }else{ ?>
                                <option value="<?php echo $encoding ?>" ><?php echo $encoding; ?></option> 
                                        <?php } ?>
                                    <?php } ?>
                        </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="text-left">
                        <?php echo $entry_odmproyml_file ?>
                    </td>
                    <td class="text-left">
                        <?php if($entry_odmproyml_file_upload_error_type){ ?>
                            <div class="alert alert-danger"><?php echo $entry_odmproyml_file_upload_error_type ?></div>
                        <?php } ?>
                        <div class="input-group">
                            <input type="text" name="odmproyml_tamplate_data_yml[file_upload]" value="<?php echo $tamplate_data_selected['file_upload'] ?>" placeholder="<?php echo $entry_odmproyml_file_upload ?>" id="input-filename" class="form-control" />
                            <span class="input-group-btn">
                                <button type="button" id="button-upload" data-loading-text="<?php echo $text_wite; ?>" class="btn btn-primary"><i class="fa fa-upload"></i> <?php echo $entry_odmproyml_file_upload ?></button>
                            </span>
                        </div>
                        <div class="input-group" style="margin-top: 7px;">
                            <?php echo $entry_odmproyml_file_url; ?> <input type="text" name="odmproyml_tamplate_data_yml[file_url]" value="<?php echo $tamplate_data_selected['file_url'] ?>" placeholder="<?php echo $entry_odmproyml_file_url ?>" id="input-filename" class="form-control" />
                        </div>
                    </td>
                </tr>
                
                <tr>
                    <td class="text-left">
                        <?php echo $entry_odmproyml_tamplate_data_level ?>
                    </td>
                    <td class="text-left">
                        <div class="input-group">
                        <select name="odmproyml_tamplate_data_yml[level]" class="form-control">
                                        <?php if($tamplate_data_selected['level']){ ?>
                                <option value="1" selected="" ><?php echo $entry_odmproyml_tamplate_data_level_1; ?></option>
                                <option value="0" ><?php echo $entry_odmproyml_tamplate_data_level_0; ?></option>
                                        <?php }else{ ?>
                                <option value="1"  ><?php echo $entry_odmproyml_tamplate_data_level_1; ?></option>
                                <option value="0" selected=""><?php echo $entry_odmproyml_tamplate_data_level_0; ?></option> 
                                        <?php } ?>
                        </select>
                        </div>
                    </td>
                </tr>
                
                <tr>
                    <td class="text-left">
                        <?php echo $entry_odmproyml_language ?>
                    </td>
                    <td class="text-left">
                        <div class="input-group">
                        <select name="odmproyml_tamplate_data_yml[language_id]" class="form-control">
                                <option value="0" ><?php echo $entry_select; ?></option>
                                <?php foreach($languages as $language_id => $language){ ?>
                                        <?php if($tamplate_data_selected['language_id'] == $language_id){ ?>
                                <option value="<?php echo $language_id ?>" selected="" ><?php echo $language['name']; ?></option>
                                        <?php }else{ ?>
                                <option value="<?php echo $language_id ?>" ><?php echo $language['name']; ?></option> 
                                        <?php } ?>
                                <?php } ?>
                        </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="text-left">
                        <?php echo $entry_odmproyml_currency ?>
                    </td>
                    <td class="text-left">
                        <div class="input-group">
                        <select name="odmproyml_tamplate_data_yml[currency_code]" class="form-control">
                                <option value="0" ><?php echo $entry_select; ?></option>
                                <?php foreach($currencies as $currency_code => $currency){ ?>
                                        <?php if($tamplate_data_selected['currency_code'] == $currency_code){ ?>
                                <option value="<?php echo $currency_code ?>" selected="" ><?php echo $currency['name']; ?></option>
                                        <?php }else{ ?>
                                <option value="<?php echo $currency_code ?>" ><?php echo $currency['name']; ?></option> 
                                        <?php } ?>
                                <?php } ?>
                        </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="text-left">
                        <?php echo $entry_odmproyml_store ?>
                    </td>
                    <td class="text-left">
                        <div class="well well-sm" style="max-height: 70px; overflow: auto; margin-bottom: 0px;">
                        <?php foreach ($stores as $store) { ?>
                        <div class="checkbox">
                          <label>
                            <?php if ( isset($tamplate_data_selected['store_id'][$store['store_id']]) ) { ?>
                                <input type="checkbox" name="odmproyml_tamplate_data_yml[store_id][<?php echo $store['store_id'] ?>]" value="<?php echo $store['store_id'] ?>" checked="checked" />
                            <?php echo $store['name']; ?>
                            <?php } else { ?>
                                <input type="checkbox" name="odmproyml_tamplate_data_yml[store_id][<?php echo $store['store_id'] ?>]" value="<?php echo $store['store_id'] ?>" />
                            <?php echo $store['name']; ?>
                            <?php } ?>
                          </label>
                        </div>
                        <?php } ?>
                      </div>
                    </td>
                </tr>
            </tbody>
</table>
<a onclick="getStepTwoSettings()" class="btn btn-primary btn-step-two"><?php echo $entry_download_field_to_file; ?></a>
<?php }else{ ?>

    <?php echo $entry_odmproyml_format_data_redirect; ?>

<?php } ?>
<script type="text/javascript"><!--
$('#button-upload').on('click', function() {
	$('#form-upload').remove();
	
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');
	
	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}
	
	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);		
			
			$.ajax({
				url: 'index.php?route=catalog/download/upload&token=<?php echo $token; ?>',
				type: 'post',		
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,		
				beforeSend: function() {
					$('#button-upload').button('loading');
				},
				complete: function() {
					$('#button-upload').button('reset');
				},	
				success: function(json) {
					if (json['error']) {
						alert(json['error']);
					}
								
					if (json['success']) {
						alert(json['success']);
						$('input[name=\'odmproyml_tamplate_data_yml[file_upload]\']').attr('value', json['filename']);
					}
				},			
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});


$(document).ready(function() {

    for(var fofi=0;fofi<5;fofi++){
        //$('.btn-step-two').fadeOut('fast').fadeIn('fast'); 
    }

});

//--></script> 