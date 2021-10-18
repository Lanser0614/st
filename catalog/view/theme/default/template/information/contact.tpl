<?php echo $header; ?>
<section class="container"><?php echo $column_left; ?><?php echo $column_right; ?>

    <?php echo $content_top; ?>

    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $i=>$breadcrumb){ if($i+1 < count($breadcrumbs)){ ?><a
                href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } else { echo $breadcrumb['text']; }} ?>
    </div>
    <h1><?php echo $heading_title; ?></h1>
    <div class="htabs">
        <a href="#tab1" class="selected">Москва</a><a href="#tab2" class="">Санкт-Петербург</a></div>
    <div id="contacts">
        <div id="tab1" class="tab-content right-left" style="display: block;">
            <div class="left-content">
                <h4>Москва</h4>
                <div>
                    <strong>Адрес</strong></div>
                <div class="ya-phone">
                    <div><?php echo $address; ?>
                    </div>
                </div>
                <div class="address">
                </div>
                <div class="phone"><strong><?php echo $text_telephone; ?></strong>
                    <div><a href="tel:<?php echo $phone; ?>"><?php echo $phone; ?></a></div>
                </div>
                <?php if ($fax) { ?>
                <div>
                    <strong>E-mail</strong><br>
                    <a href="<?php echo $fax; ?>"><?php echo $fax; ?></a>
                </div>
                <?php } ?>

                <?php if ($open) { ?>
                <div>
                    <strong><?php echo $text_open; ?></strong><br/>
                    <?php echo $open; ?><br/>
                </div>
                <?php } ?>

                <?php if ($geocode) { ?>
                <div id="contacts-map"><?php echo $geocode; ?></div>
                <?php } ?>
                <?php if ($locations) { ?>
                <h3><?php echo $text_store; ?></h3>
                <?php foreach ($locations as $location) { ?>
                <div class="store-location">

                    <?php if ($location['image']) { ?>
                    <div class="col-sm-3"><img src="<?php echo $location['image']; ?>"
                                               alt="<?php echo $location['name']; ?>"
                                               title="<?php echo $location['name']; ?>"/></div>
                    <?php } ?>

                    <h4><?php echo $location['name']; ?></h4>

                    <div>
                        <address><?php echo $location['address']; ?></address>
                    </div>

                    <?php if ($location['geocode']) { ?>
                    <div><?php echo $location['geocode']; ?></div>
                    <?php } ?>

                    <div>
                        <strong><?php echo $text_telephone; ?></strong><br>
                        <?php echo $location['telephone']; ?>
                    </div>

                    <?php if ($location['fax']) { ?>
                    <div>
                        <strong><?php echo $text_fax; ?></strong><br>
                        <?php echo $location['fax']; ?>
                    </div>
                    <?php } ?>

                    <?php if ($location['open']) { ?>
                    <div>
                        <strong><?php echo $text_open; ?></strong><br/>
                        <?php echo $location['open']; ?>
                    </div>
                    <?php } ?>

                    <?php if ($location['comment']) { ?>
                    <div>
                        <strong><?php echo $text_comment; ?></strong><br/>
                        <?php echo $location['comment']; ?>
                    </div>
                    <?php } ?>

                </div>
                <?php } } ?>
            </div>
            <div class="right-content">
                <div>
                    <iframe src="https://yandex.by/map-widget/v1/-/CGH4eD5j" width="100%" height="400"
                            style="border:none!important;" frameborder="1" allowfullscreen="true"></iframe>
                </div>
            </div>
        </div>
        <div id="tab2" class="tab-content right-left" style="display: block;">
            <div class="left-content">
                <div class="contact-page">
                    <div class="left-box">
                        <h3>
                            Санкт-Петербург&nbsp;</h3>
                        <div>
                            <div>
                                <strong>Адрес</strong></div>
                            <div class="ya-phone">
                                <div>г. Санкт-Петербург, ул. Автобусная, дом 3</div>
                            </div>
                            <div>
                                <strong>Магазин</strong></div>
                            <div class="ya-phone">
                                <div><a href="tel:79219131345">+7(921) 913-13-45</a></div>
                                <div><a href="tel:79626901475">+7(962) 690-14-75</a></div>
                                <div><a href="tel:78007757072">+7(800) 775-70-72</a></div>
                            </div>
                            <div>
                                <strong>СТО</strong></div>
                            <div class="ya-phone">
                                <a href="tel:79112091400">+7(911) 209-14-00</a>
                            </div>
                            <div>
                                <strong>E-mail</strong></div>
                            <div class="ya-phone">
                                <a href="mailto:info@st-spares.ru">info@st-spares.ru</a>
                            </div>
                            <div>
                                <strong>Время работы</strong></div>
                            <div class="ya-phone">
                                Пн-Вс с 9:00 до 18:00
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right-content">
                <div>
                    <iframe src="https://yandex.ru/map-widget/v1/-/CKabMZyR" width="100%" height="400"
                            style="border:none!important;" frameborder="1" allowfullscreen="true"></iframe>
                </div>
            </div>
        </div>
        <style>
            .ya-phone {
                padding-bottom: 10px;
            }
        </style>
        <?php echo $content_bottom; ?>
    </div>
</section>
<?php echo $footer; ?>
