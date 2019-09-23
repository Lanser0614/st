<section class="box"  id="slideshow<?php echo $module; ?>">
<div class="content">

  <?php foreach ($banners as $banner) { ?>
  <div>
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
    <?php } ?>
    
    <div class="container"></div>
  </div>
  <?php } ?>
</div>

<script type="text/javascript"><!--
$(document).on('ready', function() {
$("#slideshow<?php echo $module; ?> .content").slick({
		infinite: true,
		adaptiveHeight: false,
		variableWidth: false,
		autoplay: true,
		autoplaySpeed: 6000,
		arrows: false,
		dots: true,
		prevArrow: '<i class="prev"></i>',
		nextArrow: '<i class="next"></i>',
		fade: true,
		easing: 'linear'
});
});
--></script>

</section>