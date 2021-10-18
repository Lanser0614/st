<?php echo $header; ?>
<!-- Разметка JSON-LD, созданная Мастером разметки структурированных данных Google. -->
<script type="application/ld+json">
    {
        "@context" : "http://schema.org",
        "@type" : "Product",
        "name" : "<?php echo $heading_title?>",
        "gtin12": "<?php echo $model?>",
        "image" : [ "<?php echo $thumb?>" ],
        "brand" : {
            "@type" : "Brand",
            "name" : "<?php echo ($manufacturer) ? $manufacturer : ''; ?>"
        },
        "offers" : {
            "@type" : "Offer",
            "price" : "<?php echo str_replace(' ', '',str_replace('₽', '', $price)); ?>",
            "priceCurrency" : "RUB"
        }
    }
</script>
<script type="application/ld+json">
    {
        "@context": "https://schema.org",
        "@type": "BreadcrumbList",
        "itemListElement": [{
            "@type": "ListItem",
            "position": 1,
            "name": "<?= $breadcrumbs[0]['text'] ?>",
            "item": "<?= $breadcrumbs[0]['href'] ?>"
        },{
            "@type": "ListItem",
            "position": 2,
            "name": "<?= $breadcrumbs[1]['text'] ?>",
            "item": "<?= $breadcrumbs[1]['href'] ?>"
        },{
            "@type": "ListItem",
            "position": 3,
            "name": "<?= $breadcrumbs[2]['text'] ?>"
        }]
    }
</script>
<section class="container"><?php echo $column_left; ?><?php echo $column_right; ?>

    <div id="content"><?php echo $content_top; ?>

        <div class="breadcrumb">
            <?php foreach ($breadcrumbs as $i=> $breadcrumb) { if($i+1 < count($breadcrumbs)){ ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } else { echo $breadcrumb['text']; }} ?>
        </div>
         <?php if ($h1) { ?><h1><?php echo $h1; ?></h1><?php }else{ echo $heading_title; } ?>
        


        <div class="category_map">
            <p>Группа запчастей:</p>
            <ul id="category_list">
                <?php foreach ( $categories_map as $k=>$category ) { ?>
                <li<?php if($category_id == $category['category_id']):?> class="active"<?php endif;?>><a href="<?php echo $category['href']?>" class="cat_<?php echo $category['category_id']?>"><?php echo $category['name']?></a></li>
                <?php }?>
            </ul>
            <div class="bus">
                <img src="<?=$image?>" id="c_all" style="z-index: 5;" />
                <?php foreach ( $categories_map as $k=>$category ) { ?>
                  <img src="<?=$category['image']?>"
                  id="cat_<?=$category['category_id']?>" />
                <?php }?>
            </div>
        </div>


        <?php if ($products) { ?>

        <div class="product-filter">
            <div class="sort">
                <?php foreach ($sorts as $sorts) { if ($sorts['value'] == $sort . '-' . $order) { ?>
                <a rel="nofollow" class="active" href="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></a>
                <?php } else { ?>
                <a rel="nofollow" href="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></a>
                <?php } } ?>
            </div>

            <div id="display"><span id="grid-view"></span><span id="list-view"></span><span id="list-view2"></span></div>
        </div>

        <div class="product-grid">
            <?php foreach ($products as $product) { ?>
            <div class="product flyblock-parent">

                <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a></div>

                <p><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></p>

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
                <?php if($product['min_price_analog'] > 0 ) { ?>
                <div class="my-clearfix"></div>
                <div class=""><a href="<?php echo $product['href']; ?>#wrapper" class="btn my-btn">аналоги от <?=$product['min_price_analog']?></br>ПОДРОБНЕЕ</a></div>
                <?php }else{ ?>
                <div class="more flyblock"><a href="<?php echo $product['href']; ?>" class="btn"><?php echo $button_more; ?></a></div>
                <?php } ?>
            </div>
            <?php } ?>
        </div>


        <?php echo $pagination; ?>

        <?php } ?>


        <?php if ($description) { ?>
        <div class="category-info">

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
