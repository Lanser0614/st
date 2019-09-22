<section class="box">
<div class="container">
  
  <div class="box-heading"><?php echo $heading_title; ?></div>
  
  <div class="htabs">
    <?php $i=0; foreach ($categories as $category) { $i++; ?><a href="#blogtab<?php echo $i; ?>"><?php echo $category['name']; ?></a><?php } ?>
  </div>
  
  
  <?php $i=0; foreach ($categories as $category) { $i++; ?>
  <div id="blogtab<?php echo $i; ?>" class="tab-content">


  <div class="product-grid">
  <?php foreach ($category['posts'] as $post) { ?>
    <div class="product blog_item">
      
      <?php if($post['image'] && $thumb){ ?>
      <div class="image">
				<a href="<?php echo $post['href']; ?>"><img src="<?php echo $post['image']; ?>" alt="<?php echo $post['title']; ?>" title="<?php echo $post['title']; ?>" /></a>
      </div>
			<?php } ?>
      
      <?php if($date_added_status){ ?><span class="date"><?php echo $post['date_added_full']; ?></span><?php } ?>
      
      <h4><a href="<?php echo $post['href']; ?>"><?php echo $post['title']; ?></a></h4>

    </div>
  <?php } ?>
  </div>


  </div>
  <?php } ?>

      
</div>

<?php if($carousel) { ?>
<script type="text/javascript">
$(document).ready(function() {
$('.blog_grid_holder.carousel-1.<?php echo $module; ?>').owlCarousel({
itemsCustom: [ [0, 1], [500, 2], [767, <?php echo $columns;?>]],
pagination: false,
navigation:true,
navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
slideSpeed:500
}); });
</script>
<?php } ?>

</section>