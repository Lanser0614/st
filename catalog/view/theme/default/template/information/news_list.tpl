<?php echo $header; ?>
<section class="container"><?php echo $column_left; ?><?php echo $column_right; ?>

<div id="content"><?php echo $content_top; ?>
  
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $i=>$breadcrumb){ if($i+1 < count($breadcrumbs)){ ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } else { echo $breadcrumb['text']; }} ?>
  </div>
  
	<h1><?php echo $heading_title; ?></h1>
	
  <?php if ($news_list) { ?>
  <div id="news-list">
	  <?php foreach ($news_list as $news_item) { ?>
		<div>
		    <?php if($news_item['thumb']) { ?>
				  <div class="image"><a href="<?php echo $news_item['href']; ?>"><img src="<?php echo $news_item['thumb']; ?>" alt="<?php echo $news_item['title']; ?>" title="<?php echo $news_item['title']; ?>" class="img-responsive" /></a></div>
				<?php }?>
				
        <h4><span class="date"><?php echo $news_item['posted']; ?></span> <a href="<?php echo $news_item['href']; ?>"><?php echo $news_item['title']; ?></a></h4>
      
			  <div class="description"><?php echo $news_item['description']; ?></div>

	  </div>
    <?php } ?>
  </div>
  
  <?php echo $pagination; ?>
  
	<?php } else { echo $text_empty; } ?>

<?php echo $content_bottom; ?>
</div>
</section>
<?php echo $footer; ?>