<footer>
    <div id="scrollup">Запчасти для грузовых автомобилей с доставкой по России - ST-Spares.ru</div>
    <div id="footer">
        <div class="container">
            <div>
                <div class="title">Помощь покупателю</div>
                <ul>
                    <?php if ($informations1) { foreach ($informations1 as $information) { ?>
                    <?php if($information['title'] == 'О компании'){ continue;}?>

                    <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                    <?php } } ?>
                    <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                    <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                    <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
                    <li><a href="/index.php?route=extension/module/contact">Запрос по VIN</a></li>
                    <li><a href="/faq">Вопрос - ответ </a></li>
                </ul>
            </div>

            <div>
                <div class="title">Компания</div>
                <ul>
                    <li><a href="/o-kompanii">О компании</a></li>
                    <?php if ($informations2) { foreach ($informations2 as $information) { ?>
                    <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                    <?php } } ?>
                    <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>

                </ul>
            </div>

            <div>
                <div class="title">Информация</div>
                <ul>

                    <?php if ($categories_blog) { foreach ($categories_blog as $category) { ?>
                    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                    <?php } } ?>
                    <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
                    <li><a href="<?php echo $special; ?>">Товары со скидками</a></li>
                    <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap ?></a></li>
                </ul>
            </div>

            <div id="footer-contacts">
                <div class="title">Наши контакты</div>

                <div class="contact"><?php echo $open; ?></div>
                <div class="contact"><?php echo $phone; ?></div>
                <div class="contact">E-mail: <?php echo $email; ?></div>
                <div class="contact">Адрес: <?php echo $address; ?></div>
            </div>

        </div>
    </div>
    <div id="footer2">
        <div class="container">

            <div id="copy">&copy; 2014-2020 st-spares.ru</div>


        </div>
    </div>
</footer>
<!-- Yandex.Metrika informer -->
<a href="https://metrika.yandex.ru/stat/?id=28448401&amp;from=informer"
   target="_blank" rel="nofollow"><amp-img width="320" height="53"
            src="https://informer.yandex.ru/informer/28448401/3_1_FFFFFFFF_EFEFEFFF_0_pageviews"
            style="width:88px; height:31px; border:0; display:none;" alt="Яндекс.Метрика"
            title="Яндекс.Метрика: данные за сегодня (просмотры, визиты и уникальные посетители)"
            class="ym-advanced-informer" data-cid="28448401" data-lang="ru"/></a>
<!-- /Yandex.Metrika informer -->
</body></html>