<?php echo $header; ?>
<section class="container"><?php echo $column_left; ?><?php echo $column_right; ?>

<div id="content"><?php echo $content_top; ?>
  
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $i=> $breadcrumb) { if($i+1 < count($breadcrumbs)){ ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } else { echo $breadcrumb['text']; }} ?>
  </div>
 
  <h1><?php echo $heading_title; ?></h1>

  <?php if ($products) { ?>
    <div class="product-grid">
      <?php foreach ($products as $product) { ?>
      <div>
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a></div>
              
      <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                
      <?php if ($product['price']) { ?>
      <div class="price">
          <?php if (!$product['special']) { echo $product['price']; } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span><span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
      </div>
      <?php } ?>
                
      <div class="cart" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>', this);"></div>
      
      <a href="<?php echo $product['remove']; ?>" title="<?php echo $button_remove; ?>" class="wishlist-remove"></a>
      </div>
      <?php } ?>
    </div>

  <?php } else { echo $text_empty; } ?>


  <?php echo $content_bottom; ?>
</div>
</section>
<?php echo $footer; ?>