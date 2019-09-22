<?php echo $header; ?>
<section class="container"><?php echo $column_left; ?><?php echo $column_right; ?>

<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $i=> $breadcrumb) { if($i+1 < count($breadcrumbs)){ ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } else { echo $breadcrumb['text']; }} ?>
  </div>
  
  <div id="product">
    
    <div id="product-left">
      <div class="thumbnails">
        <div class="image"><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></div>
        <?php if ($images) { ?>
        <div class="image-additional">
         <?php foreach ($images as $image) { ?>
            <a href="<?php echo $image['popup']; ?>"><img src="<?php echo $image['thumb']; ?>" alt="" /></a>
         <?php } ?>
        </div>
        <?php } ?>
      </div>
      
    </div>
    


    <div id="product-right">
      
      <?php if ($model) { ?><div class="right">Модель: <?php echo $model; ?></div><?php } ?>      
      
      <h1><?php echo $heading_title; ?></h1>
      
      <div>
        <div class="wishlist icon" onclick="wishlist.add('<?php echo $product_id; ?>');"><?php echo $button_wishlist; ?></div>
        <div class="compare icon" onclick="compare.add('<?php echo $product_id; ?>');"><?php echo $button_compare; ?></div> 
        
        <?php if ($review_status && $count_reviews > 0) { ?>
          <div class="review">
           <a onclick="$('html, body').animate({scrollTop: $('#reviews').offset().top}, 'slow');"><?php echo $text_reviews; ?></a> &nbsp;
           <div class="rating"><?php for ($i = 1; $i <= 5; $i++) { if ($rating < $i) echo '<i></i>'; else echo '<b></b>'; } ?></div>
          </div>
        <?php } ?>
      </div>

      
      
      <?php if ($options) { ?>
      <div class="options">
        <?php foreach ($options as $option) { ?>
        
            <?php if ($option['type'] == 'select') { ?>
            <div id="input-option<?php echo $option['product_option_id']; ?>" class="option">
              <label<?php if ($option['required']) echo ' class="req"'; ?>><?php echo $option['name']; ?></label>
              <select name="option[<?php echo $option['product_option_id']; ?>]" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>"><?php echo $option_value['name']; if ($option_value['price']) echo ' ('.($option_value['price_prefix'] != '=' ? $option_value['price_prefix'] : '').$option_value['price'] . ')'; ?></option>
                <?php } ?>
              </select>
            </div>
            <?php } ?>
                  
            <?php if ($option['type'] == 'radio') { ?>
            <div id="input-option<?php echo $option['product_option_id']; ?>" class="option">
              <b<?php if ($option['required']) echo ' class="req"'; ?>><?php echo $option['name']; ?></b>
              <?php foreach ($option['product_option_value'] as $option_value) { ?>
               <label>
                 <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" />
                 <span>
                   <?php if ($option_value['image']) { ?><img src="<?php echo $option_value['image']; ?>" alt="" /><?php } ?>
                   <span><?php echo $option_value['name']; if ($option_value['price']) echo ' ('.($option_value['price_prefix'] != '=' ? $option_value['price_prefix'] : '').$option_value['price'] . ')'; ?></span>
                 </span>
               </label>
              <?php } ?>
            </div>
            <?php } ?>
            
            <?php if ($option['type'] == 'checkbox') { ?>
            <div id="input-option<?php echo $option['product_option_id']; ?>" class="option">
              <b<?php if ($option['required']) echo ' class="req"'; ?>><?php echo $option['name']; ?></b>
              <?php foreach ($option['product_option_value'] as $option_value) { ?>
               <label>
                 <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" />
                 <span>
                   <?php if ($option_value['image']) { ?><img src="<?php echo $option_value['image']; ?>" alt="" /><?php } ?>
                   <span><?php echo $option_value['name']; if ($option_value['price']) echo ' ('.($option_value['price_prefix'] != '=' ? $option_value['price_prefix'] : '').$option_value['price'] . ')'; ?></span>
                 </span>
               </label>
              <?php } ?>
            </div>
            <?php } ?>
            
            <?php if ($option['type'] == 'text') { ?>
            <div id="input-option<?php echo $option['product_option_id']; ?>" class="option">
              <b<?php if ($option['required']) echo ' class="req"'; ?>><?php echo $option['name']; ?></b>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'textarea') { ?>
            <div id="input-option<?php echo $option['product_option_id']; ?>" class="option">
              <b<?php if ($option['required']) echo ' class="req"'; ?>><?php echo $option['name']; ?></b>
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="3" placeholder="<?php echo $option['name']; ?>"><?php echo $option['value']; ?></textarea>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div id="input-option<?php echo $option['product_option_id']; ?>" class="option">
              <b<?php if ($option['required']) echo ' class="req"'; ?>><?php echo $option['name']; ?></b>
              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
            <div id="input-option<?php echo $option['product_option_id']; ?>" class="option">
              <b<?php if ($option['required']) echo ' class="req"'; ?>><?php echo $option['name']; ?></b>
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'datetime') { ?>
            <div id="input-option<?php echo $option['product_option_id']; ?>" class="option">
              <b<?php if ($option['required']) echo ' class="req"'; ?>><?php echo $option['name']; ?></b>
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'time') { ?>
            <div id="input-option<?php echo $option['product_option_id']; ?>" class="option">
              <b<?php if ($option['required']) echo ' class="req"'; ?>><?php echo $option['name']; ?></b>
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span>
            </div>
            <?php } ?>

         <?php } ?>
      </div>
      <?php } ?>
      
      
      
      
      <?php if ($price) { ?>
        <div class="price">
        <?php if (!$special) { echo '<span class="autocalc-product-price">' . $price. '</span>'; } else { ?>
          <span class="price-old autocalc-product-price"><?php echo $price; ?></span> <span class="price-new autocalc-product-special"><?php echo $special; ?></span>
        <?php } ?>

        <?php if ($tax) { ?><span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span><br /><?php } ?>
        <?php if ($points) { ?><span class="reward"><small><?php echo $text_points; ?> <span class="autocalc-product-points"><?php echo $points; ?></span></small></span><br /><?php } ?>
        
         <?php if ($discounts) { ?>
         <div class="discounts">
           <?php foreach ($discounts as $i=>$discount) { ?>
           <div>
             <?php if($i+1 < count($discounts)){ ?>
               <?php echo $discount['quantity'] . ' - ' .$discounts[$i+1]['quantity'] .' шт.: <b>'.$discount['price'].'</b>'; ?>
             <?php } else { ?>
               <?php echo $discount['quantity'] . ' шт. и более: <b>'.$discount['price'].'</b>'; ?>
             <?php } ?>
           </div>
         <?php } ?>
         </div>
         <?php } ?>
        
        </div>
      <?php } ?>
      
      
      
      <?php echo $stock; ?>
      
      
      <div class="product-properties">     
        <?php if ($reward) { ?><div><?php echo $text_reward; ?> <?php echo $reward; ?></div><?php } ?>
        
        <?php if ($sku) { ?><div>Артикул: <?php echo $sku; ?></div><?php } ?>
        
        <?php if ($manufacturer) { ?>
          <div><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturer_link; ?>"><?php echo $manufacturer; ?></a></div>
        <?php } ?>
      
        <?php if ($attribute_groups) {  foreach ($attribute_groups as $attribute_group) { foreach ($attribute_group['attribute'] as $attribute) { ?>
          <div><?php echo $attribute['name']; ?>: <?php echo $attribute['text']; ?></div>
        <?php } } } ?>
      </div>


      
      <div class="cart">
        <div class="quantity">
          <span class="qu-minus" onclick="if($(this).next().val() > 1)$(this).next().val(~~$(this).next().val()-1);"></span>
          <input type="text" name="quantity" value="<?php echo $minimum; ?>" />
          <span class="qu-plus" onclick="$(this).prev().val(~~$(this).prev().val()+1);"></span>
        </div>

        <span id="button-cart" class="btn"><?php echo $button_cart; ?></span>
        
        <a class="btn btn2 fastorder" data-name="<?php echo $heading_title; ?>" data-url="<?php echo "http://".$_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI']; ?>" href="javascript:void(0)">Покупка в 1 клик</a>
      </div>


      <?php if ($minimum > 1) { ?><div class="minimum"><?php echo $text_minimum; ?></div><?php } ?>
      <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />

 
      <?php if ($recurrings) { ?>
            <h3><?php echo $text_payment_recurring ?></h3>
            <div class="form-group required">
              <select name="recurring_id" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($recurrings as $recurring) { ?>
                <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                <?php } ?>
              </select>
              <div class="help-block" id="recurring-description"></div>
            </div>
      <?php } ?>
      
      
    </div>

  </div>
          
  
  <?php if ($description) { ?>
    <div class="box description">
       <h3><?php echo $tab_description; ?></h3>
       <?php echo $description; ?>
    </div>
  <?php } ?>
      
      
  <?php if ($products) { ?>
  <section class="box related-product-box">
  
  <div class="box-heading"><?php echo $text_related; ?></div>
  <div class="product-grid">
    <?php foreach ($products as $product) { ?>
    <div class="product flyblock-parent">
      
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a></div>
      
      <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
      
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
  
  </section>
  <?php } ?>
      
      
      
      
  <?php if ($review_status) { ?>
  <div id="reviews-box" class="right-left">
    
    <div id="reviews">
      <?php if ($reviews) { foreach ($reviews as $review) { ?>
         <div class="review-item">
           <div class="rating"><?php for ($i = 1; $i <= 5; $i++) { if ($rating < $i) echo '<i></i>'; else echo '<b></b>'; } ?></div>
           <div class="author"><?php echo $review['author']; ?> <span class="date"><?php echo $review['date_added']; ?></span></div>
           <div class="text"><?php echo $review['text']; ?></div>
         </div>
      <?php } ?>
      
      <?php echo $pagination; ?>
      <?php } else { echo $text_no_reviews; } ?>
    </div>
    
    
    <form id="form-review">
          <div id="review-title" class="box-heading"><?php echo $text_write; ?></div>
    <?php if ($review_guest) { ?>
           <div class="elem">
              <input type="text" name="name" value="" placeholder="<?php echo $entry_name; ?> *" />
           </div>
           
           <div class="elem">
              <textarea name="text" rows="5" placeholder="<?php echo $entry_review; ?> *"></textarea>
           </div>
           
           <div class="elem rating-stars">
             <span><?php echo $entry_rating; ?></span>
             <div class="rating">
              <input type="radio" name="rating" value="1" id="rating1" /><label for="rating1"></label>
				      <input type="radio" name="rating" value="2" id="rating2" /><label for="rating2"></label>
				      <input type="radio" name="rating" value="3" id="rating3" /><label for="rating3"></label>
				      <input type="radio" name="rating" value="4" id="rating4" /><label for="rating4"></label>
				      <input type="radio" name="rating" value="5" id="rating5" checked="checked" /><label for="rating5"></label>
             </div>
           </div>
           
           <?php echo $captcha; ?>
           
           <div class="sbmt">
              <span id="button-review" class="btn"><?php echo $button_submit; ?></span>
           </div>

    <?php } else { echo $text_login; } ?>
    </form>
              
  </div>
  <?php } ?>
            
      
      
      <?php if ($tags) { ?>
      <p><?php echo $text_tags; ?>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>


      
<?php echo $content_bottom; ?>
</div>
</section>

<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});


$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').css({"opacity":"0.6"});
			$('#review-title').append('<img src="catalog/view/theme/default/image/loading2.gif" />');
		},
		complete: function() {
			$('#button-review').css({"opacity":"1"});
			$('#review-title img').remove();
		},
		success: function(json) {

			if (json['error']) {
				$('#review-title').html(json['error']).css({"color":"#e64d33"});
			}

			if (json['success']) {
				$('#review-title').html(json['success']).css({"color":"#3bb128"});
				$('#form-review input[type=\'text\']').val('');
				$('#form-review textarea').val('');
				$('#form-review input[type=\'radio\']:checked').attr('checked', '');
			}
		}
	});
});


$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
	
});




function price_format(price)
{ 
    c = <?php echo (empty($autocalc_currency['decimals']) ? "0" : $autocalc_currency['decimals'] ); ?>;
    d = '<?php echo $autocalc_currency['decimal_point']; ?>'; // decimal separator
    t = '<?php echo $autocalc_currency['thousand_point']; ?>'; // thousands separator
    s_left = '<?php echo str_replace("'", "\'", $autocalc_currency['symbol_left']); ?>';
    s_right = '<?php echo str_replace("'", "\'", $autocalc_currency['symbol_right']); ?>';
    n = price * <?php echo $autocalc_currency['value']; ?>;
    i = parseInt(n = Math.abs(n).toFixed(c)) + ''; 
    j = ((j = i.length) > 3) ? j % 3 : 0; 
    price_text = s_left + (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : '') + s_right; 
    
    <?php if (!empty($autocalc_currency2)) { ?>
    c = <?php echo (empty($autocalc_currency2['decimals']) ? "0" : $autocalc_currency2['decimals'] ); ?>;
    d = '<?php echo $autocalc_currency2['decimal_point']; ?>'; // decimal separator
    t = '<?php echo $autocalc_currency2['thousand_point']; ?>'; // thousands separator
    s_left = '<?php echo str_replace("'", "\'", $autocalc_currency2['symbol_left']); ?>';
    s_right = '<?php echo str_replace("'", "\'", $autocalc_currency2['symbol_right']); ?>';
    n = price * <?php echo $autocalc_currency2['value']; ?>;
    i = parseInt(n = Math.abs(n).toFixed(c)) + ''; 
    j = ((j = i.length) > 3) ? j % 3 : 0; 
    price_text += '  <span class="currency2">(' + s_left + (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : '') + s_right + ')</span>'; 
    <?php } ?>
    
    return price_text;
}

function calculate_tax(price)
{
    <?php // Process Tax Rates
      if (isset($tax_rates) && $tax) {
         foreach ($tax_rates as $tax_rate) {
           if ($tax_rate['type'] == 'F') {
             echo 'price += '.$tax_rate['rate'].';';
           } elseif ($tax_rate['type'] == 'P') {
             echo 'price += (price * '.$tax_rate['rate'].') / 100.0;';
           }
         }
      }
    ?>
    return price;
}

function process_discounts(price, quantity)
{
    <?php
      foreach ($dicounts_unf as $discount) {
        echo 'if ((quantity >= '.$discount['quantity'].') && ('.$discount['price'].' < price)) price = '.$discount['price'].';'."\n";
      }
    ?>
    return price;
}


animate_delay = 20;

main_price_final = calculate_tax(<?php echo $price_value; ?>);
main_price_start = calculate_tax(<?php echo $price_value; ?>);
main_step = 0;
main_timeout_id = 0;

function animateMainPrice_callback() {
    main_price_start += main_step;
    
    if ((main_step > 0) && (main_price_start > main_price_final)){
        main_price_start = main_price_final;
    } else if ((main_step < 0) && (main_price_start < main_price_final)) {
        main_price_start = main_price_final;
    } else if (main_step == 0) {
        main_price_start = main_price_final;
    }
    
    $('.autocalc-product-price').html( price_format(main_price_start) );
    
    if (main_price_start != main_price_final) {
        main_timeout_id = setTimeout(animateMainPrice_callback, animate_delay);
    }
}

function animateMainPrice(price) {
    main_price_start = main_price_final;
    main_price_final = price;
    main_step = (main_price_final - main_price_start) / 10;
    
    clearTimeout(main_timeout_id);
    main_timeout_id = setTimeout(animateMainPrice_callback, animate_delay);
}


<?php if ($special) { ?>
special_price_final = calculate_tax(<?php echo $special_value; ?>);
special_price_start = calculate_tax(<?php echo $special_value; ?>);
special_step = 0;
special_timeout_id = 0;

function animateSpecialPrice_callback() {
    special_price_start += special_step;
    
    if ((special_step > 0) && (special_price_start > special_price_final)){
        special_price_start = special_price_final;
    } else if ((special_step < 0) && (special_price_start < special_price_final)) {
        special_price_start = special_price_final;
    } else if (special_step == 0) {
        special_price_start = special_price_final;
    }
    
    $('.autocalc-product-special').html( price_format(special_price_start) );
    
    if (special_price_start != special_price_final) {
        special_timeout_id = setTimeout(animateSpecialPrice_callback, animate_delay);
    }
}

function animateSpecialPrice(price) {
    special_price_start = special_price_final;
    special_price_final = price;
    special_step = (special_price_final - special_price_start) / 10;
    
    clearTimeout(special_timeout_id);
    special_timeout_id = setTimeout(animateSpecialPrice_callback, animate_delay);
}
<?php } ?>


function recalculateprice()
{
    var main_price = <?php echo (float)$price_value; ?>;
    var input_quantity = Number($('input[name="quantity"]').val());
    var special = <?php echo (float)$special_value; ?>;
    var tax = 0;
    discount_coefficient = 1;
    
    if (isNaN(input_quantity)) input_quantity = 0;
    
    <?php if ($special) { ?>
        special_coefficient = <?php echo ((float)$price_value/(float)$special_value); ?>;
    <?php } else { ?>
        <?php if (empty($autocalc_option_discount)) { ?>
            main_price = process_discounts(main_price, input_quantity);
            tax = process_discounts(tax, input_quantity);
        <?php } else { ?>
            if (main_price) discount_coefficient = process_discounts(main_price, input_quantity) / main_price;
        <?php } ?>
    <?php } ?>
    
    
    var option_price = 0;
    
    <?php if ($points) { ?>
      var points = <?php echo (float)$points_value; ?>;
      $('input:checked,option:selected').each(function() {
          if ($(this).data('points')) points += Number($(this).data('points'));
      });
      $('.autocalc-product-points').html(points);
    <?php } ?>
    
    $('input:checked,option:selected').each(function() {
      if ($(this).data('prefix') == '=') {
        option_price += Number($(this).data('price'));
        main_price = 0;
        special = 0;
      }
    });
    
    $('input:checked,option:selected').each(function() {
      if ($(this).data('prefix') == '+') {
        option_price += Number($(this).data('price'));
      }
      if ($(this).data('prefix') == '-') {
        option_price -= Number($(this).data('price'));
      }
    });
    
    special += option_price;
    main_price += option_price;

    <?php if ($special) { ?>
      <?php if (empty($autocalc_option_special))  { ?>
        main_price = special * special_coefficient;
      <?php } else { ?>
        special = main_price / special_coefficient;
      <?php } ?>
      tax = special;
    <?php } else { ?>
      <?php if (!empty($autocalc_option_discount)) { ?>
          main_price *= discount_coefficient;
      <?php } ?>
      tax = main_price;
    <?php } ?>
    
    // Process TAX.
    main_price = calculate_tax(main_price);
    special = calculate_tax(special);
    
    main_price *= input_quantity;
    special *= input_quantity;
    tax *= input_quantity;

    // Display Main Price
    animateMainPrice(main_price);
      
    <?php if ($special) { ?>
      animateSpecialPrice(special);
    <?php } ?>
}

$(document).ready(function() {
    $('input[type="checkbox"]').bind('change', function() { recalculateprice(); });
    $('input[type="radio"]').bind('change', function() { recalculateprice(); });
    $('select').bind('change', function() { recalculateprice(); });
    
    $quantity = $('input[name="quantity"]');
    $quantity.data('val', $quantity.val());
    (function() {
        if ($quantity.val() != $quantity.data('val')){
            $quantity.data('val',$quantity.val());
            recalculateprice();
        }
        setTimeout(arguments.callee, 250);
    })();

    
    recalculateprice();
});
//--></script>
<?php echo $footer; ?>
