<h2>&nbsp;</h2>
<fieldset style="padding-top:0px; padding-bottom:0px;">
<table class="table ocpb-products">
   <tr class="th">
      <td>Ваш заказ</td>
   </tr>
   <tr>
      <td>Товаров в корзине: <?php echo $producttotal; ?></td>
   </tr>

<?php foreach ($vouchers as $voucher) { ?>
   <tr>
      <td></td>
      <td class="left"><?php echo $voucher['description']; ?></td>
      <td class="left qty-td">
           <div class="input-group"><input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" /></div>
      </td>
      <td class="right"><?php echo $voucher['amount']; ?></td>
      <td class="right"><?php echo $voucher['amount']; ?></td>
      <td class="right"><span onclick="voucher.remove('<?php echo $voucher['key']; ?>');" class="x"></span></td>
    </tr>
<?php } ?>
</table>



<?php if($settings['buy_clear_show'] && $i==0 && count($products) > 1){ ?>
  <div class="pull-left"><span onclick="cart_clear();" class="btn btn-alert btn-clear"><?php echo $text_cart_clear; ?></span>
<?php } ?>

<table class="table total-items">
<?php foreach ($totals as $total) { ?>
    <tr class="total-<?php echo $total['code']; ?>">
      <td class="title"><?php echo $total['title']; ?>:</td>
      <td class="value right"><?php echo $total['text']; ?></td>
    </tr>
<?php } ?>
</table>

    
    
<?php if($settings['buy_coupon']){ ?>
<div class="ocpb-coupon">
    <b><?php echo $coupon ? $buy_lang['table_coupon_another'] : $buy_lang['table_coupon']; ?></b>
    <div>
      <input type="text" name="coupon" value="" placeholder="<?php echo $entry_coupon; ?>" class="input-coupon">
      <span class="btn button-coupon"><?php echo $button_coupon; ?></span>
    </div>
</div>
<?php } ?>

<?php if($settings['buy_voucher']){ ?>
<div class="ocpb-coupon">
    <b><?php echo $voucher ? $buy_lang['table_voucher_another'] : $buy_lang['table_voucher']; ?></b>
    <div>
      <input type="text" name="voucher" value="" placeholder="<?php echo $entry_voucher; ?>" class="input-voucher" >
      <span class="btn button-voucher"><?php echo $button_coupon; ?></span>
    </div>
</div>
<?php } ?>


</fieldset>
