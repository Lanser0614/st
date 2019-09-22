<div id="cart">
  <div id="cart-total" class="icon"><?php echo $text_items; ?></div>
  
  <div id="flycart">
    <div id="flycart-content">
    <div class="title">Товары в корзине</div>
    
    <?php if ($products || $vouchers) { ?>
      <table class="table">
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="image" rowspan="3"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
            <?php } ?>
          </td>
          <td class="name">
            <div><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
            <div><?php echo $product['model']; ?></div>
            
            <?php if ($product['option']) { foreach ($product['option'] as $option) { ?>
            <div>- <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small></div>
            <?php } } ?>
            
            <?php if ($product['recurring']) { ?>- <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small><?php } ?>
          </td>
          <td class="price"><?php echo $product['price']; ?></td>
        </tr>
        <tr>
          <td colspan="2">
          <div class="quant">
            <div>Количество:</div>
            
            <div class="quantity">
              <span class="qu-minus"></span>
              <input type="text" value="<?php echo $product['quantity']; ?>" data-key="<?php echo $product['cart_id']; ?>" />
              <span class="qu-plus"></span>
            </div>
          
            <div>шт.</div>
          </div>
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <div class="remove" onclick="cart.remove('<?php echo $product['cart_id']; ?>');">
              <span class="x"></span> <span>Удалить</span>
            </div>
          </td>
        </tr>
        <tr>
          <td colspan="3"></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td><?php echo $voucher['description']; ?></td>
          <td><?php echo $voucher['amount']; ?>x&nbsp;1</td>
          <td><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"></button></td>
        </tr>
        <?php } ?>
      </table>

      <div class="ttl"><span><?php echo $totals[0]['title']; ?>:</span> <span><?php echo $totals[0]['text']; ?></span></div>
      <div class="pull-center"><a class="btn" href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></div>
    
    <?php } else { ?>
      <p class="empty"><?php echo $text_empty; ?></p>
    <?php } ?>
    </div>
  </div>
</div>
