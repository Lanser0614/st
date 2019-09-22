<?php echo $header; ?>
<section class="container"><?php echo $column_left; ?><?php echo $column_right; ?>

<div id="content"><?php echo $content_top; ?>
  
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $i=> $breadcrumb) { if($i+1 < count($breadcrumbs)){ ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } else { echo $breadcrumb['text']; }} ?>
  </div>

  <h1><?php echo $heading_title; ?></h1>


  <div class="category_map">
	  <h4>группа запчастей:</h4>
	  <ul id="category_list">
	  <?php foreach ( $categories_map as $k=>$category ) { ?>
		  <li<?php if($category_id == $category['category_id']):?> class="active"<?php endif;?>><a href="<?php echo $category['href']?>" class="cat_<?php echo $category['category_id']?>"><?php echo $category['name']?></a></li>
	  <?php }?>
	  </ul>
	
	  <?php if($category_id == 60 || $parent_id == 60):?>
<?/*?>	<div class="bus">
		<img src="/image/catalog/images/category_map/bus/bus_all.jpg" id="b_all" />
		<img src="/image/catalog/images/category_map/bus/bus_1.jpg" id="cat_66" />
		<img src="/image/catalog/images/category_map/bus/bus_2.jpg" id="cat_67" />
		<img src="/image/catalog/images/category_map/bus/bus_3.jpg" id="cat_70" />
		<img src="/image/catalog/images/category_map/bus/bus_4.jpg" id="cat_68" />
		<img src="/image/catalog/images/category_map/bus/bus_5.jpg" id="cat_69" />
		<img src="/image/catalog/images/category_map/bus/bus_6.jpg" id="cat_74" />
		<img src="/image/catalog/images/category_map/bus/bus_7.jpg" id="cat_75" />
		<img src="/image/catalog/images/category_map/bus/bus_8.jpg" id="cat_76" />
		<img src="/image/catalog/images/category_map/bus/bus_9.jpg" id="cat_77" />
		<img src="/image/catalog/images/category_map/bus/bus_10.jpg" id="cat_78" />
		<img src="/image/catalog/images/category_map/bus/bus_11.jpg" id="cat_79" />
		<img src="/image/catalog/images/category_map/bus/bus_12.jpg" id="cat_80" />
		<img src="/image/catalog/images/category_map/bus/bus_13.jpg" id="cat_81" />
		<img src="/image/catalog/images/category_map/bus/bus_14.jpg" id="cat_82" />
	  </div><?*/?>
	  <div class="bus">
		<img src="/image/catalog/images/category_map/car2/car2_all.jpg" id="c_all" style="z-index: 5;" />
		<img src="/image/catalog/images/category_map/car2/car2_dvigatel.jpg" id="cat_66" />
		<img src="/image/catalog/images/category_map/car2/car2_korobka.jpg" id="cat_74" />
		<img src="/image/catalog/images/category_map/car2/car2_sceplenie.jpg" id="cat_69" />
		<img src="/image/catalog/images/category_map/car2/car2_oxlazdenie.jpg" id="cat_67" />
		<img src="/image/catalog/images/category_map/car2/car2_toplivo.jpg" id="cat_70" />
		<img src="/image/catalog/images/category_map/car2/car2_vihlop.jpg" id="cat_68" />
		<img src="/image/catalog/images/category_map/car2/car2_kardan.jpg" id="cat_75" />
		<img src="/image/catalog/images/category_map/car2/car2_tormoza.jpg" id="cat_77" />
		<img src="/image/catalog/images/category_map/car2/car2_mosti.jpg" id="cat_123" />
		<img src="/image/catalog/images/category_map/car2/car2_stupici.jpg" id="cat_78" />
		<img src="/image/catalog/images/category_map/car2/car2_ressori.jpg" id="cat_79" />
		<img src="/image/catalog/images/category_map/car2/car2_rulevoei.jpg" id="cat_80" />
		<img src="/image/catalog/images/category_map/car2/car2_elektrika.jpg" id="cat_81" />
		<img src="/image/catalog/images/category_map/car2/car2_filtr.jpg" id="cat_76" />
		<img src="/image/catalog/images/category_map/car2/car2_salon.jpg" id="cat_82" />
		<img src="/image/catalog/images/category_map/car2/car2_kuzov.jpg" id="cat_124" />
	  </div>
	  <?php elseif($category_id == 215 || $parent_id == 215):?>
	
    <div class="bus">
	  <?/*?>
		<img src="/image/catalog/images/category_map/car2/car2_all.jpg" id="c_all" style="z-index: 5;" />
		<img src="/image/catalog/images/category_map/car2/car2_dvigatel.jpg" id="cat_216" />
		<img src="/image/catalog/images/category_map/car2/car2_korobka.jpg" id="cat_217" />
		<img src="/image/catalog/images/category_map/car2/car2_sceplenie.jpg" id="cat_218" />
		<img src="/image/catalog/images/category_map/car2/car2_oxlazdenie.jpg" id="cat_219" />
		<img src="/image/catalog/images/category_map/car2/car2_toplivo.jpg" id="cat_220" />
		<img src="/image/catalog/images/category_map/car2/car2_vihlop.jpg" id="cat_221" />
		<img src="/image/catalog/images/category_map/car2/car2_kardan.jpg" id="cat_222" />
		<img src="/image/catalog/images/category_map/car2/car2_tormoza.jpg" id="cat_223" />
		<img src="/image/catalog/images/category_map/car2/car2_mosti.jpg" id="cat_224" />
		<img src="/image/catalog/images/category_map/car2/car2_stupici.jpg" id="cat_225" />
		<img src="/image/catalog/images/category_map/car2/car2_ressori.jpg" id="cat_226" />
		<img src="/image/catalog/images/category_map/car2/car2_rulevoei.jpg" id="cat_227" />
		<img src="/image/catalog/images/category_map/car2/car2_elektrika.jpg" id="cat_228" />
		<img src="/image/catalog/images/category_map/car2/car2_filtr.jpg" id="cat_229" />
		<img src="/image/catalog/images/category_map/car2/car2_salon.jpg" id="cat_230" />
		<img src="/image/catalog/images/category_map/car2/car2_kuzov.jpg" id="cat_231" />
	  <?*/?>
		<img src="/image/catalog/images/category_map/car4/all.png" id="c_all" style="z-index: 5;" />
		<img src="/image/catalog/images/category_map/car4/dvigatel.png" id="cat_216" />
		<img src="/image/catalog/images/category_map/car4/korobka.png" id="cat_217" />
		<img src="/image/catalog/images/category_map/car4/sceplenie.png" id="cat_218" />
		<img src="/image/catalog/images/category_map/car4/oxlazdenie.png" id="cat_219" />
		<img src="/image/catalog/images/category_map/car4/toplivo.png" id="cat_220" />
		<img src="/image/catalog/images/category_map/car4/vihlop.png" id="cat_221" />
		<img src="/image/catalog/images/category_map/car4/kardan.png" id="cat_222" />
		<img src="/image/catalog/images/category_map/car4/tormoza.png" id="cat_223" />
		<img src="/image/catalog/images/category_map/car4/mosti.png" id="cat_224" />
		<img src="/image/catalog/images/category_map/car4/stupici.png" id="cat_225" />
		<img src="/image/catalog/images/category_map/car4/ressori.png" id="cat_226" />
		<img src="/image/catalog/images/category_map/car4/rulevoei.png" id="cat_227" />
		<img src="/image/catalog/images/category_map/car4/elektrika.png" id="cat_228" />
		<img src="/image/catalog/images/category_map/car4/filtr.png" id="cat_229" />
		<img src="/image/catalog/images/category_map/car4/kuzov.png" id="cat_230" />
		<img src="/image/catalog/images/category_map/car4/salon.png" id="cat_231" />
		
	  </div>
	  <?php elseif($category_id == 157 || $parent_id == 157):?>
	
	  <div class="bus">
		<img src="/image/catalog/images/category_map/car3/all.jpg" id="c_all" style="z-index: 5;" />
		<img src="/image/catalog/images/category_map/car3/dvigatel.jpg" id="cat_158" />
		<img src="/image/catalog/images/category_map/car3/korobka.jpg" id="cat_159" />
		<img src="/image/catalog/images/category_map/car3/sceplenie.jpg" id="cat_160" />
		<img src="/image/catalog/images/category_map/car3/oxlazdenie.jpg" id="cat_161" />
		<img src="/image/catalog/images/category_map/car3/toplivo.jpg" id="cat_162" />
		<img src="/image/catalog/images/category_map/car3/vihlop.jpg" id="cat_163" />
		<img src="/image/catalog/images/category_map/car3/kardan.jpg" id="cat_164" />
		<img src="/image/catalog/images/category_map/car3/tormoza.jpg" id="cat_165" />
		<img src="/image/catalog/images/category_map/car3/mosti.jpg" id="cat_166" />
		<img src="/image/catalog/images/category_map/car3/stupici.jpg" id="cat_167" />
		<img src="/image/catalog/images/category_map/car3/ressori.jpg" id="cat_168" />
		<img src="/image/catalog/images/category_map/car3/rulevoei.jpg" id="cat_169" />
		<img src="/image/catalog/images/category_map/car3/elektrika.jpg" id="cat_170" />
		<img src="/image/catalog/images/category_map/car3/filtr.jpg" id="cat_171" />
		<img src="/image/catalog/images/category_map/car3/salon.jpg" id="cat_172" />
		<img src="/image/catalog/images/category_map/car3/kuzov.jpg" id="cat_173" />
	  </div>
	  <?php else:?>
	  <div class="car">
		<img src="/image/catalog/images/category_map/car/car_all.jpg" id="c_all" style="z-index: 5;" />
		<img src="/image/catalog/images/category_map/car/car_1.jpg" id="cat_62" />
		<img src="/image/catalog/images/category_map/car/car_2.jpg" id="cat_63" />
		<img src="/image/catalog/images/category_map/car/car_3.jpg" id="cat_64" />
		<img src="/image/catalog/images/category_map/car/car_4.jpg" id="cat_65" />
		<img src="/image/catalog/images/category_map/car/car_5.jpg" id="cat_61" />
		<img src="/image/catalog/images/category_map/car/car_6.jpg" id="cat_83" />
		<img src="/image/catalog/images/category_map/car/car_7.jpg" id="cat_84" />
		<img src="/image/catalog/images/category_map/car/car_8.jpg" id="cat_85" />
		<img src="/image/catalog/images/category_map/car/car_9.jpg" id="cat_86" />
		<img src="/image/catalog/images/category_map/car/car_10.jpg" id="cat_87" />
		<img src="/image/catalog/images/category_map/car/car_11.jpg" id="cat_88" />
		<img src="/image/catalog/images/category_map/car/car_12.jpg" id="cat_89" />
		<img src="/image/catalog/images/category_map/car/car_13.jpg" id="cat_90" />
		<img src="/image/catalog/images/category_map/car/car_14.jpg" id="cat_91" />
		<img src="/image/catalog/images/category_map/car/car_15.jpg" id="cat_92" />
		<img src="/image/catalog/images/category_map/car/car_16.jpg" id="cat_93" />
		<img src="/image/catalog/images/category_map/car/car_17.jpg" id="cat_94" />
	  </div>
	  <?php endif;?>
  </div>
  
  
  <?php if ($products) { ?>

  <div class="product-filter">        
    <div class="sort">
      <?php foreach ($sorts as $sorts) { if ($sorts['value'] == $sort . '-' . $order) { ?>
       <a class="active" href="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></a>
      <?php } else { ?>
       <a href="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></a>
      <?php } } ?>
    </div>
    
    <div id="display"><span id="grid-view"></span><span id="list-view"></span><span id="list-view2"></span></div>
  </div>

  <div class="product-grid">
  <?php foreach ($products as $product) { ?>
    <div class="product flyblock-parent">
      
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a></div>
      
      <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
      
      <div class="description"><?php echo $product['description']; ?></div>
      
      <div class="stock"><?php echo $product['stock']; ?></div>
                
      <div class="cart">
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { echo $product['price']; } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
      
        <div class="incart icon" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"></div>
      </div>
      
      <div class="wishlist icon" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_wishlist; ?></span></div>
      <div class="compare icon" onclick="compare.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_compare; ?></span></div>
      <div class="quickview flyblock" onclick="quickview('<?php echo $product['href']; ?>');"><span><?php echo $button_quickview; ?></span></div>
      
      <div class="more flyblock"><a href="<?php echo $product['href']; ?>" class="btn"><?php echo $button_more; ?></a></div>

    </div>
  <?php } ?>
  </div>

      
  <?php echo $pagination; ?>

  <?php } ?>

  
  <?php if ($description) { ?>
  <div class="category-info">
    <?php if ($h1) { ?><h2><?php echo $h1; ?></h2><?php } ?>
    <?php if ($thumb) { ?><div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div><?php } ?>
    <?php echo $description; ?>
  </div>
  <?php } ?>
  

  <?php echo $content_bottom; ?>
</div>
</section>


<script type="text/javascript"><!--

$(document).ready(function(){
	
	if($('#category_list .active').length > 0)
		class1 = $('#category_list .active a').attr('class');
	else
		class1 = 'c_all';
		
	//alert(class1);
	$('.bus img#'+class1+', .car img#'+class1+', .car2 img#'+class1).css('z-index', 5);
	
	$('#category_list a').mouseover(function(){
		$('.bus img, .car img, .car2 img').css('z-index', 1);
		$('.bus img#'+$(this).attr('class')+', .car img#'+$(this).attr('class')+', .car2 img#'+$(this).attr('class')).css('z-index', 5);
	});
	$('#category_list a').mouseout(function(){
		$('.bus img, .car img, .car2 img').css('z-index', 1);
		//$('.bus img#b_all, .car img#c_all').css('z-index', 5);
		$('.bus img#'+class1+', .car img#'+class1+', .car2 img#'+class1).css('z-index', 5);
	});
});

//--></script> 



<?php echo $footer; ?>
