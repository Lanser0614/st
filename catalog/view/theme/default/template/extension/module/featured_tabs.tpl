<section class="box" id="features-products">
<div class="container">
  
  <div class="box-heading">Хиты продаж</div>
  
  <div class="htabs">
    <?php $i=0; foreach ($products as $product) { $i++; ?><a href="#tab<?php echo $i; ?>"><?php echo $product['title']; ?></a><?php } ?>
  </div>



  <?php $i=0; foreach ($products as $product) { $i++; ?>
  <div id="tab<?php echo $i; ?>" class="tab-content">


  <div class="product-grid">
  <?php foreach ($product['products'] as $product) { ?>
    <div class="product flyblock-parent">
      
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" class="lazyload" title="<?php echo $product['name']; ?>" /></a></div>
      
      <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
      
      <div class="description"><?php echo $product['description']; ?></div>
      
      <div class="stock"><?php echo $product['stock']; ?></div>
                
      <div class="cart">
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { echo $product['price']; } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
      
        <div class="incart icon" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"></div>
      </div>
      
      <div class="wishlist icon" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_wishlist; ?></span></div>
      <div class="compare icon" onclick="compare.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_compare; ?></span></div>
      <div class="quickview flyblock" onclick="quickview('<?php echo $product['href']; ?>');"><span><?php echo $button_quickview; ?></span></div>
      <?php if($product['min_price_analog'] > 0 ) { ?>
         <div class="my-clearfix"></div>
         <div class=""><a href="<?php echo $product['href']; ?>#wrapper" class="btn my-btn">аналоги от <?=$product['min_price_analog']?></br>ПОДРОБНЕЕ</a></div>
      <?php }else{ ?>
      <div class="more flyblock"><a href="<?php echo $product['href']; ?>" class="btn"><?php echo $button_more; ?></a></div>
      <?php } ?>
    </div>
  <?php } ?>
  </div>


  </div>
  <?php } ?>


</div>
</section>