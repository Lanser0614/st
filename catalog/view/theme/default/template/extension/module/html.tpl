<section class="box"<?php if($id) echo ' id="' . $id . '"'; ?>>
<div class="container">

  <?php if($heading_title) { ?><div class="box-heading"><?php echo $heading_title; ?></div><?php } ?>
  <div class="content"><?php echo $html; ?></div>

</div>
</section>
