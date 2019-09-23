<?php echo $header; ?>
<section class="container"><?php echo $column_left; ?><?php echo $column_right; ?>

<div id="content"><?php echo $content_top; ?>
  
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $i=>$breadcrumb){ if($i+1 < count($breadcrumbs)){ ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } else { echo $breadcrumb['text']; }} ?>
  </div>
  
  <div id="news-item">
    <?php if ($image) { ?>
	  <div class="image">
	    <img src="<?php echo $image; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="img-responsive" />
	  </div>
	  <?php } ?>
  
	  <h1><?php echo $heading_title; ?></h1>
	
    <div class="description"><?php echo $description; ?></div>
	
    <div class="posted"><?php echo $posted; ?></div>

	  <?php if($news_share) { ?>
	  <div class="addthis">
								<!-- AddThis Button BEGIN -->
								<div class="addthis_toolbox addthis_default_style ">
									<a class="addthis_button_email"></a>
									<a class="addthis_button_print"></a>
									<a class="addthis_button_preferred_1"></a>
									<a class="addthis_button_preferred_2"></a>
									<a class="addthis_button_preferred_3"></a>
									<a class="addthis_button_preferred_4"></a>
									<a class="addthis_button_compact"></a>
									<a class="addthis_counter addthis_bubble_style"></a>
								</div>
								<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js"></script>
	  </div>
	  <?php } ?>

  					
    <div class="buttons pull-left">
	    <div class="pull-right">
		    <a class="btn btn-default" href="<?php echo $news_list; ?>"><?php echo $button_news; ?></a>
	    </div>
    </div>
  </div>


<?php echo $content_bottom; ?>
</div>
</section>
<?php echo $footer; ?>