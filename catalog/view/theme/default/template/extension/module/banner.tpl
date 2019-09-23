<section class="box" id="banner<?php echo $module; ?>">
<div class="container">

<?php if($heading_title) { ?><div class="box-heading"><?php echo $heading_title; ?></div><?php } ?>

<div class="banners">
  <?php foreach ($banners as $banner) { ?>
  <div>
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
</div>

</div>
</section>