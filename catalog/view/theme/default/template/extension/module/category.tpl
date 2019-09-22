<div class="box">
<div class="box-heading mobile-arrow"><?php echo $heading_title; ?></div>
<ul class="box-category">
  <?php foreach ($categories as $category) { ?>
      <li>
        <a href="<?php echo $category['href']; ?>"<?php if ($category['category_id'] == $category_id) echo ' class="active"'; ?>><?php echo $category['name']; ?></a>
        <?php if ($category['children']) { ?>
        <ul>
          <?php foreach ($category['children'] as $child) { ?>
          <li>
            <a href="<?php echo $child['href']; ?>"<?php if ($child['category_id'] == $child_id) echo ' class="active"'; ?>><?php echo $child['name']; ?></a>
          </li>
          <?php } ?>
        </ul>
        <?php } ?>
      </li>
  <?php } ?>
  
  <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
  <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
</ul>
</div>