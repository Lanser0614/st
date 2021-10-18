<?php echo $header; ?>
<section class="container"><?php echo $column_left; ?><?php echo $column_right; ?>

    <div id="content"><?php echo $content_top; ?>

        <div class="breadcrumb">
            <?php foreach ($breadcrumbs as $i=> $breadcrumb) { if($i+1 < count($breadcrumbs)){ ?><a
                    href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } else { echo $breadcrumb['text']; }} ?>
        </div>

        <h1><?php echo $heading_title; ?></h1>

        <div id="adv-search">
            <div>
                <input type="text" name="search" value="<?php echo $search; ?>"
                       placeholder="<?php echo $text_keyword; ?>" id="input-search"/>
            </div>
            <div>
                <select name="category_id">
                    <option value="0"><?php echo $text_category; ?></option>
                    <?php foreach ($categories as $category_1) { ?>
                    <?php if ($category_1['category_id'] == $category_id) { ?>
                    <option value="<?php echo $category_1['category_id']; ?>"
                            selected="selected"><?php echo $category_1['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
                    <?php } ?>
                    <?php foreach ($category_1['children'] as $category_2) { ?>
                    <?php if ($category_2['category_id'] == $category_id) { ?>
                    <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $category_2['category_id']; ?>">
                        &nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                    <?php } ?>
                    <?php foreach ($category_2['children'] as $category_3) { ?>
                    <?php if ($category_3['category_id'] == $category_id) { ?>
                    <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                    <?php } ?>
                    <?php } ?>
                </select>
            </div>

            <div>
                <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary"/>
            </div>
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
                        <?php if (!$product['special']) { echo $product['price']; } else { ?>
                        <span class="price-old"><?php echo $product['price']; ?></span> <span
                                class="price-new"><?php echo $product['special']; ?></span>
                        <?php } ?>
                    </div>
                    <?php } ?>

                    <div class="incart icon"
                         onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"></div>
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

        <?php } elseif(isset($articles) && !empty($articles)){ ?>
        <div id="wrapper">
            <div id="product">
                <input type="hidden" value="13640"/>
            </div>
            <div class="SidebarLayout__contentSectionSidebar___bO1hm"
                 style="position: relative;float: left;margin-right: 28px;">
                <div>
                    <div style=""></div>
                    <div class="SidebarLayout__contentSectionSidebarInner___2MEWe sticky-block_not-fixed" style="">
                        <div>
                            <div class="AppraiseFilterAdaptive__root___1sGdU">
                                <div class="AppraiseFilterAdaptive__button___uQ6bT"></div>
                                <div class="AppraiseFilterAdaptive__wrapper___2EHsI">
                                    <div>
                                        <div class="AppraiseFilter__root___93t1y"
                                             style="background-color:#f3f3f3;padding:15px">
                                            <div class="AppraiseFilter__section___WvQ-G">
                                                <div class="AppraiseFilter__sectionTitle___sgHlw"><span
                                                            class="AppraiseFilter__sectionName___3kf09">Цена, ₽</span>
                                                </div>
                                                <div class="AppraiseFilter__priceBlock___1xyh-">
                                                    <div><input placeholder="от 5 049"
                                                                class="AppraiseFilter__priceInput___2Ibto Input__input___1iIOy "
                                                                id="price-begin"
                                                                value=""></div>
                                                    <div>—</div>
                                                    <div><input placeholder="до 55 610"
                                                                id="price-end"
                                                                class="AppraiseFilter__priceInput___2Ibto Input__input___1iIOy"
                                                                value=""></div>
                                                </div>
                                            </div>
                                            <div class="AppraiseFilter__section___WvQ-G">
                                                <div class="AppraiseFilter__sectionTitle___sgHlw"><span
                                                            class="AppraiseFilter__sectionName___3kf09">Срок доставки</span>
                                                </div>
                                                <div class="Checkbox__root___2wndK Checkbox__hasTitle___3-WIM Checkbox__radioType___1VmHl">
                                                    <label class="Checkbox__label___3xh9F"><input type="radio"
                                                                                                  name="radio-check"
                                                                                                  value="1"
                                                                                                  class="Checkbox__checkbox___3XTjs delivery_day"><span
                                                                class="Checkbox__checkboxReplacer___1qlXc"></span><span
                                                                class="Checkbox__title___25CEp"
                                                                style="padding-left: 10px;">Сегодня</span></label>
                                                </div>
                                                <div class="Checkbox__root___2wndK Checkbox__hasTitle___3-WIM Checkbox__radioType___1VmHl">
                                                    <label class="Checkbox__label___3xh9F"><input type="radio"
                                                                                                  name="radio-check"
                                                                                                  value="2"
                                                                                                  class="Checkbox__checkbox___3XTjs delivery_day"><span
                                                                class="Checkbox__checkboxReplacer___1qlXc"></span><span
                                                                class="Checkbox__title___25CEp"
                                                                style="padding-left: 10px;">Завтра</span></label>
                                                </div>
                                                <div class="Checkbox__root___2wndK Checkbox__hasTitle___3-WIM Checkbox__radioType___1VmHl">
                                                    <label class="Checkbox__label___3xh9F"><input type="radio"
                                                                                                  name="radio-check"
                                                                                                  value="5"
                                                                                                  class="Checkbox__checkbox___3XTjs delivery_day"><span
                                                                class="Checkbox__checkboxReplacer___1qlXc"></span><span
                                                                class="Checkbox__title___25CEp"
                                                                style="padding-left: 10px;">До 5 дней</span></label>
                                                </div>
                                                <div class="Checkbox__root___2wndK Checkbox__hasTitle___3-WIM Checkbox__radioType___1VmHl">
                                                    <label class="Checkbox__label___3xh9F"><input type="radio"
                                                                                                  name="radio-check"
                                                                                                  value="10000"
                                                                                                  class="Checkbox__checkbox___3XTjs delivery_day"
                                                                                                  checked=""><span
                                                                class="Checkbox__checkboxReplacer___1qlXc"></span><span
                                                                class="Checkbox__title___25CEp"
                                                                style="padding-left: 10px;">Любой</span></label>
                                                </div>
                                            </div>
                                            <div class="AppraiseFilter__section___WvQ-G">
                                                <div class="AppraiseFilter__sectionTitle___sgHlw"><span
                                                            class="AppraiseFilter__sectionName___3kf09">Производитель</span>
                                                </div>
                                                <div class="AppraiseFilter__brandList___BR7f_">
                                                    <?php if(isset($brands_analog) && !empty($brands_analog)){ ?>
                                                    <?php echo $brands_analog?>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <?php
                echo $articles;
            ?>
        </div>
        <?php } else { echo $text_empty; } ?>


        <?php echo $content_bottom; ?>
    </div>
</section>
<style>

</style>
<script type="text/javascript"><!--

    $('#button-search').bind('click', function () {
        url = 'index.php?route=product/search';

        var search = $('#content input[name=\'search\']').prop('value');

        if (search) {
            url += '&search=' + encodeURIComponent(search);
        }

        var category_id = $('#content select[name=\'category_id\']').prop('value');

        if (category_id > 0) {
            url += '&category_id=' + encodeURIComponent(category_id);
        }

        // var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');
        url += '&sub_category=true';
        // if (sub_category) {
        // 	url += '&sub_category=true';
        // }
        url += '&search_template=true';
        var filter_description = $('#content input[name=\'description\']:checked').prop('value');

        if (filter_description) {
            url += '&description=true';
        }

        location = url;
    });

    $('#content input[name=\'search\']').bind('keydown', function (e) {
        if (e.keyCode == 13) {
            $('#button-search').trigger('click');
        }
    });

    $('select[name=\'category_id\']').on('change', function () {
        if (this.value == '0') {
            $('input[name=\'sub_category\']').prop('disabled', true);
        } else {
            $('input[name=\'sub_category\']').prop('disabled', false);
        }
    });

    $('select[name=\'category_id\']').trigger('change');
    --></script>
<?php echo $footer; ?>