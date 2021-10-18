<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <ul class="box-category">
		  <?php foreach ($manufacturers as $manufacturer) { ?>
		  <li>
			  <?php if ($manufacturer['manufacturer_id'] == $manufacturer_id) { ?>
				<a href="<?php echo $manufacturer['href']; ?>" class="active"><?php echo $manufacturer['name']; ?></a>
			  <?php } else { ?>
				<a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a>
			  <?php } ?>
		  </li>
		  <?php } ?>
    </ul>
  </div>
</div>
