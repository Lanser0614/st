<?php if (!$frame) { ?>
<form method="POST" name="form" action="<?php echo $action; ?>"></form> 
<script>
document.form.submit();
</script>
<?php } else { ?>
<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div style="text-align: center;">
      <div><?php echo $wait; ?></div>
    <?php if ($frame == 'frame') {  ?>
		<iframe id="qiwos" seamless src="<?php echo $action; ?>" width="100%" height="1000">
	    Ваш браузер не поддерживает плавающие фреймы!
		</iframe>
    <?php } if ($frame == 'new') { ?>
      <div><?php echo $waiting_payment_new_text; ?></div>
      <div><a href="<?php echo $action; ?>" class="btn btn-primary" target="_blank"><?php echo $waiting_payment_new_button; ?></a></div>
    <?php } ?>
     </div>
    </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php } ?>
<?php if  ($frame == 'new' || $frame == 'frame') {  ?>
<script>
$(function(){
    setTimeout(checkstatus, 4000);
});
function checkstatus(){

  
    $.ajax({
    url: '<?php echo $checkstate; ?>',
    dataType: 'json',
    beforeSend: function() {
      
    },
    complete: function() {
      
    },
    success: function(json) {
      if (json['call'] == true) {
        window.location.replace("<?php echo $redir; ?>");
      }
      else{
        setTimeout(checkstatus, 4000);
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
  
}
</script>
<?php echo $footer; ?>
<?php } ?>