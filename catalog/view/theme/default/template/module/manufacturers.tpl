<div class="list-group">
  <?php foreach ($manufacturers as $manufacturer) { ?>
  <?php if ($manufacturer['manufacturer_id'] == $manufacturer_id) { ?>
	<a href="<?php echo $manufacturer['href']; ?>" class="list-group-item active"><?php echo $manufacturer['name']; ?></a>
  <?php } else { ?>
	<a href="<?php echo $manufacturer['href']; ?>" class="list-group-item"><?php echo $manufacturer['name']; ?></a>
  <?php } ?>
  <?php } ?>
</div>
