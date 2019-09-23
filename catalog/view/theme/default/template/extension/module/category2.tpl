<section id="categories-box" class="box">
<div class="container">

<?php if($heading_title) { ?><div class="box-heading"><?php echo $heading_title; ?></div><?php } ?>

<div class="product-grid product-grid4">
<?php foreach ($categories as $category) { ?>
  <div class="product">
    <div class="image">
      <a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" /></a>
    </div>
    <h4><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></h4>
  </div>
<?php } ?>
</div>

</div>
</section>
