<div id="newsletterModule-footer">
		
			<div id="successmsg"><?php echo $heading_title ?></div>
			
      <div class="content">
			<?php if($namestatus) { ?>
				  <input type="text" id="input-newsletter-name" placeholder="<?php echo $entry_name_placeholder; ?>" value="" name="name"/>
				  <input type="text" id="input-newsletter-email" placeholder="<?php echo $entry_email_placeholder; ?>" value="" name="email"/>
				  <a id="button-subsribe" class="btn"><?php echo $button_subscribe; ?></a>
			<?php } else{ ?>
				  <input type="text" id="input-newsletter-email" placeholder="<?php echo $entry_email_placeholder; ?>" value="" name="email"/>
					<a id="button-subsribe" class="btn"><?php echo $button_subscribe; ?></a>
			<?php } ?>
      </div>
      
      <label class="privacy-policy"><input type="checkbox" checked="checked" /><span>Согласен на обработку персональных данных</span></label>
      
</div>

<script type="text/javascript">
$('#button-subsribe').on('click', function() {
	
	if( !$('#newsletterModule-footer .privacy-policy input').is(':checked')) return false;
	
	$.ajax({
		url: 'index.php?route=extension/module/awesomenewsletter/addsubscribe',
		type: 'post',
		data: $('#newsletterModule-footer input[type=\'text\']'),
		dataType: 'json',
		beforeSend: function(){
			//$('#newsletterFooterModule<?php echo $module; ?> #button-subsribe').button('loading');
		},
		complete: function(){
			//$('#newsletterFooterModule<?php echo $module; ?> #button-subsribe').button('reset');
		},
		success: function(json){
			$('#successmsg').html('<?php echo $heading_title ?>');
			
			if(json['error']) {
				if(json['error']['email']) {
					$('#successmsg').html('<div class="text-danger">' + json['error']['email'] + '</div>');
				}
				
				if(json['error']['name']) {
					$('#successmsg').html('<div class="text-danger">' + json['error']['name'] + '</div>');
				}
			}
			
			if(json['success']){
				$('#successmsg').html('<div class="text-success">' +  json['success'] + '</div>');	
				$('#newsletterModule-footer input[type=\'text\']').val('');
			}
			
			if(json['warring']) {
				$('#successmsg').html('<div class="text-danger">' + json['warring'] + '</div>');
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