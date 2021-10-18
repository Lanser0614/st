<?php echo $header; ?>
<section class="container"><?php echo $column_left; ?><?php echo $column_right; ?>

    <div id="content"><?php echo $content_top; ?>

        <div class="breadcrumb">
            <?php foreach ($breadcrumbs as $i=> $breadcrumb) { if($i+1 < count($breadcrumbs)){ ?><a
                    href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } else { echo $breadcrumb['text']; }} ?>
        </div>

        <?php if (!empty($fx_span)) {  ?>
        <h1><?php echo "Запчасти ".$breadcrumbs[2]['text']; ?></h1>
        <?php } else { ?>
        <h1><?php echo "Запчасти ".$heading_title; ?></h1>
        <?php } ?>

        <?php if ($products) { ?>
        <div class="product-filter">
            <div class="sort">
                <?php foreach ($sorts as $sorts) { if ($sorts['value'] == $sort . '-' . $order) { ?>
                <a class="active" href="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></a>
                <?php } } ?>
            </div>

            <div id="display"><span id="grid-view"></span><span id="list-view"></span><span id="list-view2"></span>
            </div>
        </div>

        <div class="product-grid">
            <?php foreach ($products as $product) { ?>
            <div class="product flyblock-parent">

                <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>"
                                                                                  alt="<?php echo $product['name']; ?>"
                                                                                  title="<?php echo $product['name']; ?>"/></a>
                </div>

                <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>

                <div class="description"><?php echo $product['description']; ?></div>

                <div class="stock"><?php echo $product['stock']; ?></div>

                <div class="cart">
                    <?php if ($product['price']) { ?>
                    <div class="price">
                        <?php if (!$product['special']) {  if($product['price'] > 0 ) { echo $product['price']; } } else
                        { ?>
                        <span class="price-old"><?php echo $product['price']; ?></span> <span
                                class="price-new"><?php echo $product['special']; ?></span>
                        <?php } ?>
                    </div>
                    <?php } ?>
                    <?php if($product['price'] > 0 ) { ?>
                    <div class="incart icon"
                         onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"></div>
                    <?php } ?>
                </div>

                <div class="wishlist icon" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                    <span><?php echo $button_wishlist; ?></span></div>
                <div class="compare icon" onclick="compare.add('<?php echo $product['product_id']; ?>');">
                    <span><?php echo $button_compare; ?></span></div>
                <div class="quickview flyblock" onclick="quickview('<?php echo $product['href']; ?>');">
                    <span><?php echo $button_quickview; ?></span></div>

                <div class="more flyblock"><a href="<?php echo $product['href']; ?>"
                                              class="btn"><?php echo $button_more; ?></a></div>

            </div>
            <?php } ?>
        </div>


        <?php echo $pagination; ?>

        <?php } ?>


        <?php if ($description) { ?>
        <div class="category-info">
            <?php if ($thumb) { ?>
            <div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>"
                                    title="<?php echo $heading_title; ?>"/></div>
            <?php } ?>
            <?php echo $description; ?>
        </div>
        <?php } ?>


        <?php echo $content_bottom; ?>
    </div>
</section>
<?php echo $footer; ?>