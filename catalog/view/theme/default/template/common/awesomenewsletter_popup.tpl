<style>
	#newsletterModal .modal-body{
		background-image:url('<?php echo $background_image; ?>');
	}
	<?php echo $awesomenewsletter_css; ?>
</style>
<div id="newsletterModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<button type="button" class="close closepopup" data-dismiss="modal"><img src="catalog/view/theme/default/image/close_news.png" /></button>

			<div class="modal-body">
				<?php if ($logo) { ?>
				<div class="row">
					<div class="col-sm-12 text-center">
						<div id="logo">
							<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
						</div>
					</div>
				</div>
				<?php } ?>
				
				<?php echo $text_description; ?>
				
				<form id="subsribe">
					<div id="successmsg"></div>
					<?php if($namestatus) { ?>
						<div class="form-group <?php echo ($namerequired ? 'required' : ''); ?>">
						<?php if($entry_name) { ?>
							<label class="control-label"><?php echo $entry_name; ?></label>
					<?php } ?>
							<input type="text" id="input-newsletter-name" class="form-control" placeholder="<?php echo $entry_name_placeholder; ?>" value="" name="name"/>
						</div>
					<?php } ?>
						<div class="form-group required">
							<?php if($entry_email) { ?>
									<label class="control-label"><?php echo $entry_email; ?></label>
							<?php } ?>
							<div class="input-group">
							  <input type="text" id="input-newsletter-email" class="form-control" placeholder="<?php echo $entry_email_placeholder; ?>" value="" name="email"/>
							  <span class="input-group-btn">
								<a id="button-subsribe" class="btn btn-primary" type="button"><?php echo $button_subscribe; ?></a>
							  </span>
							</div><!-- /input-group -->
						</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$('#newsletterModal #button-subsribe').on('click', function(){
	$.ajax({
		url: 'index.php?route=common/awesomenewsletter_popup/addsubscribe',
		type: 'post',
		data: $('#newsletterModal #subsribe input[type=\'text\']'),
		dataType: 'json',
		beforeSend: function(){
			$('#newsletterModal #button-subsribe').button('loading');
		},
		complete: function(){
			$('#newsletterModal #button-subsribe').button('reset');
		},
		success: function(json){
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');
			$('#newsletterModal #successmsg').html('');
			
			if(json['error']) {
				for (i in json['error']) {
					var element = $('#newsletterModal #input-newsletter-' + i.replace('_', '-'));

					if ($(element).parent().hasClass('input-group')){
						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
					} else {
						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
					}
				}
				
				$('.text-danger').parent().addClass('has-error');
			}
			
			if(json['success']) {
				$('#newsletterModal #successmsg').html('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				
				$('#newsletterModal #subsribe input[type=\'text\']').val('');
			}
			
			if(json['warring']) {
				$('#newsletterModal #successmsg').html('<div class="alert alert-danger">' + json['warring'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
		}
	});
});
</script>
<script type="text/javascript">
<?php if(!empty($awesomenewsletter_open)) { ?>
$(document).ready(function () {
	var time = parseInt(<?php echo $awesomenewsletter_popup_seconds; ?>*1000);
	setTimeout(function(){
		$('#newsletterModal').modal('show')  
	}, time); 
});
<?php } ?>
</script>