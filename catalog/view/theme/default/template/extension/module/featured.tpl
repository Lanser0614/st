<section  class="box featured-product-box product-carousel-box">
<div class="container">

<div class="box-heading"><?php echo $heading_title; ?></div>
<div class="product-carousel">
  <?php foreach ($products as $product) { ?>
    <div class="product">
      
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a></div>
      
      <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                
      <?php if ($product['price']) { ?>
      <div class="price">
          <?php if (!$product['special']) { echo $product['price']; } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
      </div>
      <?php } ?>
                
      <div class="cart">
        <span class="wishlist icon" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_wishlist; ?></span></span>
        <span class="compare icon" onclick="compare.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_compare; ?></span></span>
        <span class="incart btn" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><?php echo $button_cart; ?></span>
      </div>

    </div>
  <?php } ?>
  </div>
  
</div>
</section>