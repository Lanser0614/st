<div id="newsletterModule-Static" class="well">
	<div id="newsletterStaticModule<?php echo $module; ?>">
		<h2><?php echo $heading_title; ?></h2>
			<?php echo $text_description; ?>
			
			<div id="subsribe">
				<div id="successmsg"></div>
				<?php if($namestatus) { ?>
				<div class="form-group <?php echo ($namerequired ? 'required' : ''); ?>">
				<?php if($entry_name) { ?>
					<label class="control-label"><?php echo $entry_name; ?></label>
				<?php } ?>
					<div class="input-group">
					  <span class="input-group-addon" id="basic-addon1"><i class="fa fa-user"></i></span>
					  <input type="text" id="input-newsletter-name" class="form-control" placeholder="<?php echo $entry_name_placeholder; ?>" value="" name="name"/>
					</div>
				</div>
				<?php } ?>
				<div class="form-group required">
				<?php if($entry_email) { ?>
					<label class="control-label"><?php echo $entry_email; ?></label>
				<?php } ?>
					<div class="input-group">
					  <span class="input-group-addon" id="basic-addon1"><i class="fa fa-envelope"></i></span>
					  <input type="text" id="input-newsletter-email" class="form-control" placeholder="<?php echo $entry_email_placeholder; ?>" value="" name="email"/>
					</div>					
				</div>
			</div>
			<a id="buttonsubsribe" class="btn btn-primary"><?php echo $button_subscribe; ?></a>
	</div>
</div>
<script type="text/javascript">
$('#newsletterStaticModule<?php echo $module; ?> #buttonsubsribe').on('click', function() {
	$.ajax({
		url: 'index.php?route=extension/module/awesomenewsletter/addsubscribe',
		type: 'post',
		data: $('#newsletterStaticModule<?php echo $module; ?> #subsribe input[type=\'text\']'),
		dataType: 'json',
		beforeSend: function(){
			$('#newsletterStaticModule<?php echo $module; ?> #buttonsubsribe').button('loading');
		},
		complete: function(){
			$('#newsletterStaticModule<?php echo $module; ?> #buttonsubsribe').button('reset');
		},
		success: function(json){
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');
			$('#newsletterStaticModule<?php echo $module; ?> #successmsg').html('');
			
			if(json['error']) {
				for (i in json['error']) {
					var element = $('#newsletterStaticModule<?php echo $module; ?> #input-newsletter-' + i.replace('_', '-'));

					if ($(element).parent().hasClass('input-group')){
						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
					} else {
						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
					}
				}
				
				$('.text-danger').parent().addClass('has-error');
			}
			
			if(json['success']){
				$('#newsletterStaticModule<?php echo $module; ?> #successmsg').html('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				
				$('#newsletterStaticModule<?php echo $module; ?> #subsribe input[type=\'text\']').val('');
			}
			
			if(json['warring']){
				$('#newsletterStaticModule<?php echo $module; ?> #successmsg').html('<div class="alert alert-danger">' + json['warring'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
			
		}
	});
});
</script>

<?php if($awesomenewsletter_css) { ?>
<style>
<?php echo $awesomenewsletter_css; ?>
</style>
<?php } ?>