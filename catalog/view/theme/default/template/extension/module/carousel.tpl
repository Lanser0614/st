<section class="box box-carousel">
<div class="container">

<?php if($heading_title) { ?><div class="box-heading"><?php echo $heading_title; ?></div><?php } ?>

<div id="carousel<?php echo $module; ?>">
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
<script type="text/javascript"><!--
$(document).on('ready', function() {
$("#carousel<?php echo $module; ?>").slick({
    slidesToShow: <?php echo $quantity; ?>,
    slidesToScroll: <?php echo $quantity; ?>,
		//
		infinite: true,
		vertical: false,
		verticalSwiping: false,
		adaptiveHeight: false,
		variableWidth: false,
		autoplay: true,
		autoplaySpeed: 6000,
		arrows: true,
		dots: false,
		prevArrow: '<i class="prev"></i>',
		nextArrow: '<i class="next"></i>',
		centerMode: false,
		centerPadding: '50px', //Side padding when in center mode (px or %)
		fade: false,
		easing: 'linear',
		rows: 1,
		slidesPerRow: 1, //With grid mode intialized via the rows option, this sets how many slides are in each grid row. dver
  responsive: [
    {
      breakpoint: 1024,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 3
      }
    },
    {
      breakpoint: 600,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 2
      }
    },
    {
      breakpoint: 480,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1
      }
    }
  ]
});
});
--></script>

</div>
</section>