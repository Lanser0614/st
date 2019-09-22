<?php echo $header; ?>
<section class="container"><?php echo $column_left; ?><?php echo $column_right; ?>

<div id="content"><?php echo $content_top; ?>
  
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $i=> $breadcrumb) { if($i+1 < count($breadcrumbs)){ ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } else { echo $breadcrumb['text']; }} ?>
  </div>

  <h1><?php echo $heading_title; ?></h1>
  
  <?php if ($categories) { foreach ($categories as $category) { ?>
  <div class="manufacturer-list">
    <div class="manufacturer-heading"><?php echo $category['name']; ?></div>
    
      <?php if ($category['manufacturer']) { foreach ($category['manufacturer'] as $manufacturer){ ?>

        <div class="manufacturer-content">
          <?php if($manufacturer['image']){ ?>
          <a href="<?php echo $manufacturer['href']; ?>" class="image"><img src="<?php echo $manufacturer['image']; ?>" alt="<?php echo $manufacturer['name']; ?>" title="<?php echo $manufacturer['name']; ?>" /></a>
          <?php } ?>
          
          <a href="<?php echo $manufacturer['href']; ?>" class="name"><?php echo $manufacturer['name']; ?></a>

          <div class="description"><?php echo $manufacturer['description']; ?></div>
        </div>

      <?php } } ?>

  </div>
  <?php } } else { echo $text_empty; } ?>

  <?php echo $content_bottom; ?>
</div>
</section>
<?php echo $footer; ?>