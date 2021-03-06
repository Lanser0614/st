<section class="coolblocks box"<?php if($id) echo ' id="' . $id . '"'; ?>>
<div class="container">

<?php if($heading_title) { ?><div class="box-heading"><?php echo $heading_title; ?></div><?php } ?>

<div class="content">
  <?php foreach ($coolblocks as $coolblock) { ?>
    <div>
      <?php if($coolblock['link']) { ?><a href="<?php echo $coolblock['link']; ?>"><?php } ?>
      
      <?php if($coolblock['image']) { ?>
        <span class="image"><img class="lazyload" srcset="<?php echo $coolblock['image'].' 2x, '.$coolblock['image'].' 1x' ?>" src="<?php echo $coolblock['image']; ?>" alt="icons" width="40px" height="40px" /></span>
      <?php } ?>
      <span class="title"><?php echo $coolblock['title']; ?></span>
      <span class="text"><?php echo $coolblock['text']; ?></span>
                
      <?php if($coolblock['link']) { ?></a><?php } ?>

    </div>
  <?php } ?>
  </div>

</div>
</section>