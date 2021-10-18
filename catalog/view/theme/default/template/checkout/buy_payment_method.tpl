<?php if ($error_warning) { ?>
<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>

<?php if ($payment_methods) { ?>
<?php foreach ($payment_methods as $payment_method) { ?>
<div class="radio">
  <label class="<?php echo $payment_method['code']; ?>">
    <?php if ($payment_method['code'] == $code || !$code) { ?>
    <?php $code = $payment_method['code']; ?>
    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" checked="checked" />
    <?php } else { ?>
    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" />
    <?php } ?>
    <?php if ($payment_method['code'] == 'qiwiw_card') { ?>
    <span><span><?php echo $payment_method['title']; if ($payment_method['terms']) echo ' ('.$payment_method['terms'].')'; ?><img class="pay_icon" src="image/Pay_icon.png"></span></span>
	<?php } else { ?>
	<span><?php echo $payment_method['title']; if ($payment_method['terms']) echo ' ('.$payment_method['terms'].')'; ?></span>
	<?php } ?>
  </label>
</div>
<?php } ?>
<?php } ?>
