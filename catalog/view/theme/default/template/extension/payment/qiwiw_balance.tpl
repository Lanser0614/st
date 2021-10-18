<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1> 
      <form action="" id="form" method="POST">
      <?php if ($payment_methods) { ?>
      <input type="hidden" name="payment_code" value="<?php echo $balance_currency_code; ?>" /> 
      <div class="form-group">
          <label for="psum"><?php echo $text_balance_sum; ?></label>
          <input class="form-control" type="text" id="psum" name="payment_sum" value="" placeholder="<?php echo $entry_balance_sum; ?>" required="required" /> 
      </div>
      <div class="form-group">
      <p><?php echo $text_balance_method; ?></p>
      <?php foreach ($payment_methods as $payment_method) { ?>
      <div class="radio">
        <label>
          <?php if (!isset($code)) { ?>
          <?php $code = $payment_method['code']; ?>
          <input type="radio" name="payment_method" data-item="<?php echo $payment_method['href']; ?>" value="<?php echo $payment_method['code']; ?>" checked="checked" />
          <?php } else { ?>
          <input type="radio" name="payment_method" data-item="<?php echo $payment_method['href']; ?>" value="<?php echo $payment_method['code']; ?>" />
          <?php } ?>
          <?php echo $payment_method['name']; ?>
        </label>
      </div>
      <?php } ?>
      <?php } ?>
      </div>
      <div class="buttons">
        <div class="pull-left">
          <input type="submit" value="<?php echo $button_continue; ?>" id="button-payment-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
        </div>
      </div>
      </form>
      <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?>
  </div>
</div>
<script>
  $("form").submit(function(){
    $('#form').attr('action', $('input[name=payment_method]:checked').data('item'));
  });
</script>
<?php echo $footer; ?>