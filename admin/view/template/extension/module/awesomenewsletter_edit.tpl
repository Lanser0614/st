<div id="modal-editsubscribe" class="modal" data-easein="flipYIn" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
	<div class="modal-dialog" >
		<div class="modal-content">
			<div class="modal-header">        
				<button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>        
				<h4 class="modal-title"><?php echo $text_edit_status ?></h4>      
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>
					<div class="col-sm-10">
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
				<div class="form-group hide">
					<label class="col-sm-2 control-label"><?php echo $entry_approved; ?></label>
					<div class="col-sm-10">
						<select name="approved" id="input-approved" class="form-control">
							<?php if ($approved) { ?>
							<option value="1" selected="selected"><?php echo $text_yes; ?></option>
							<option value="0"><?php echo $text_no; ?></option>
							<?php } else { ?>
							<option value="1"><?php echo $text_yes; ?></option>
							<option value="0" selected="selected"><?php echo $text_no; ?></option>
							<?php } ?>
						</select>
					</div>
				</div>
				<div class="clearfix">
					<button type="button" id="button-edit-save" class="btn btn-primary pull-right"><i class="fa fa-save"></i> <?php echo $button_save; ?></button>
				</div>
			</div>
		</div>
	</div>
</div>

  <script type="text/javascript"><!--
$('#modal-editsubscribe #button-edit-save').on('click', function() {
	$.ajax({
		url: '<?php echo $editsubscribers_action; ?>&awesomenewsletter_id=<?php echo $awesomenewsletter_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $('#modal-editsubscribe select'),
		beforeSend: function() {
			$('#modal-editsubscribe #button-edit-save').button('loading');
		},
		complete: function() {
			$('#modal-editsubscribe #button-edit-save').button('reset');
		},
		success: function(json) {
			$('#modal-editsubscribe').modal('hide');
			
			$('.alert').remove();
			
			if(json['success']) {
				$('.panel.panel-default').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> '+ json['success'] +'<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
			
			var urls = '<?php echo $getsubscribers_action; ?>';
			
			getSubscribers(urls);
		}
	});
});
//--></script>