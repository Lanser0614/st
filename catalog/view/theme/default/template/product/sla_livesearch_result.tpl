<?php if ($sla_live_search_ajax_enable) { ?>
<?php $not_empty = false; ?>
<ul>
  <?php if (isset($products) && $products['products']) { ?>
  <?php $not_empty = true; ?>
  <li class="result-heading"><?php echo $heading_product; ?></li>
  <?php foreach ( $products['products'] as $product) { ?>
  <li>
    <a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>">
    <?php if ($product['image'] && $sla_live_search_show_image) { ?>
      <span class="cell livesearch-image"><img alt="<?php echo $product['name']; ?>" src="<?php echo $product['image']; ?>"></span>
    <?php } ?>
  	  <span class="cell livesearch-info"><?php echo $product['name_hl']; ?>
  	  <?php if ($sla_live_search_show_sku && $product['sku'] ) { ?>
	  <span class="livesearch-product-sku"><b>SKU:</b> <?php  echo $product['sku']; ?></span>
      <?php } ?>
  	  <?php if ($sla_live_search_show_model && $product['model'] ) { ?>
	  <span class="livesearch-product-model"><b>Model:</b> <?php  echo $product['model']; ?></span>
      <?php } ?>
  	  <?php if ($sla_live_search_show_description) { ?>
          <span class="livesearch-description"><?php echo $product['description']; ?></span>
      <?php } ?>
  	  </span>
      <?php if ($sla_live_search_show_price && $product['price']) { ?>
      <span class="cell livesearch-price">
      <?php if ($product['special']) { ?>
  	  <span class="livesearch-product-special"><?php echo $product['price']; ?></span>
  	  <span class="livesearch-product-price"><?php echo $product['special']; ?></span>
      <?php } else { ?>
        <span class="livesearch-product-price"><?php echo $product['price']; ?></span>
      <?php } ?>
      </span>
      <?php } ?>
      <span style="clear:both"></span>
    </a>
  </li>
  <?php } ?>
  <?php } ?>
  
  <?php if (isset($category) && $category['categories']) { ?>
  <?php $not_empty = true; ?>
  <li class="result-heading"><?php echo $heading_category; ?></li>
  <?php foreach ($category['categories'] as $product) { ?>
  <li>
    <a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>">
    <?php if ($product['image'] && $sla_live_search_show_image) { ?>
      <span class="cell livesearch-image"><img alt="<?php echo $product['name']; ?>" src="<?php echo $product['image']; ?>"></span>
    <?php } ?> 	
	  <span class="cell livesearch-info"><?php echo $product['name']; ?>
  	  <?php if ($sla_live_search_show_description) { ?>
      <span class="livesearch-description"><?php echo $product['description']; ?></span>
      <?php } ?>
    <?php } ?>
	  </span>
      <span style="clear:both"></span>
    </a>
  </li>
  <?php } ?>
  <?php if (isset($manufacturer) && $manufacturer['manufacturers']) { ?>
  <li class="result-heading"><?php echo $heading_manufacturer; ?></li>
  <?php foreach ($manufacturer['manufacturers'] as $product) { ?>
  <li>
    <a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>">
    <?php if ($product['image'] && $sla_live_search_show_image) { ?>
      <span class="cell livesearch-image"><img alt="<?php echo $product['name']; ?>" src="<?php echo $product['image']; ?>"></span>
    <?php } ?>
  	  <span class="cell livesearch-info"><?php echo $product['name']; ?>
  	  <?php if ($sla_live_search_show_description) { ?>
        <span class="livesearch-description"><?php echo $product['description']; ?></span>
      <?php } ?>
  	  </span>
      <span style="clear:both"></span>
    </a>
  </li>
  <?php } ?>
  <?php $not_empty = true; ?>
  <?php } ?>
  <?php if (isset($information) && $information['informations']) { ?>
  <?php $not_empty = true; ?>
  <li class="result-heading"><?php echo $heading_information; ?></li>
  <?php foreach ($information['informations'] as $product) { ?>
  <li>
    <a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>">
  	  <span class="cell livesearch-info"><?php echo $product['name']; ?>
  	    <?php if ($sla_live_search_show_description) { ?>
        <span class="livesearch-description"><?php echo $product['description']; ?></span>
        <?php } ?>
  	  </span>
      <span style="clear:both"></span>
    </a>
  </li>
  <?php } ?>
  <?php } ?>
  <?php if (!$not_empty) { ?>
  <li class="result-heading">
  <?php echo $text_empty; ?>
  </li>
  <?php } ?>
</ul>
<?php } ?>