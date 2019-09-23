<?php if ($error_warning) { ?>
<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>

<?php if ($shipping_methods) { ?>
<?php foreach ($shipping_methods as $shipping_method) { ?>
<?php if (!$shipping_method['error']) { ?>
<?php foreach ($shipping_method['quote'] as $quote) { ?>
<div class="radio">
  <label>
    <?php if ($quote['code'] == $code || !$code) { ?>
    <?php $code = $quote['code']; ?>
    <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" checked="checked" data-cost="<?php echo $quote['cost']; ?>" />
    <?php } else { ?>
    <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" data-cost="<?php echo $quote['cost']; ?>" />
    <?php } ?>
    
    <span><span><?php echo $quote['title']; ?><!--: <b><?php echo $quote['text']; ?></b>--></span></span></label>
</div>
<?php } ?>
<?php } else { ?>
<div class="alert alert-danger"><?php echo $shipping_method['error']; ?></div>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript">
    $('input[name=\'shipping_method\'').change(function(){
        selectShipping();
    });
</script>