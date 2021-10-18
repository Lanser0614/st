<footer>
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

                <?php echo $newsletters; ?>

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
<script language="JavaScript" type="text/javascript">
    fimg = document.images;
    for (j = 0; j < fimg.length; j++) {
        fimg[j].galleryimg = "no";
        fimg[j].oncontextmenu = function (){return false;}
        fimg[j].ondragstart = function (){return false;}
    }
</script>

<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<script async type="text/javascript" src="catalog/view/javascript/fastblock.js"></script>


<?php echo $sla_live_search; ?>

<!-- Yandex.Metrika informer -->
<a href="https://metrika.yandex.ru/stat/?id=28448401&amp;from=informer"
   target="_blank" rel="noopener">.<img
            src="https://informer.yandex.ru/informer/28448401/3_1_FFFFFFFF_EFEFEFFF_0_pageviews"
            style="width:88px; height:31px; border:0; display:none;" alt="Яндекс.Метрика"
            title="Яндекс.Метрика: данные за сегодня (просмотры, визиты и уникальные посетители)"
            class="ym-advanced-informer" data-cid="28448401" data-lang="ru"/></a>
<!-- /Yandex.Metrika informer -->

<!-- Yandex.Metrika counter -->
<script type="text/javascript" async>
    (function (m, e, t, r, i, k, a){m[i]=m[i]||function(){(m[i].a=m[i].a||[]).push(arguments)};
            m[i].l=1*new Date();k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a)})
    (window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");

    ym(28448401, "init", {
        clickmap: true,
        trackLinks: true,
        accurateTrackBounce: true,
        webvisor: true
    });
</script>
<noscript>
    <div><img src="https://mc.yandex.ru/watch/28448401" style="position:absolute; left:-9999px;" alt=""/></div>
</noscript>
<!-- /Yandex.Metrika counter -->

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-106468669-1"></script>
<script>
    window.dataLayer = window.dataLayer || [];

    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'UA-106468669-1');
</script>


<script type="text/javascript">
    jQuery(document).ready(function ($) {
//Buttons
        $('#header-top .phones > .phone:nth-child(1)').on('click', function () {
            gtag('event', 'phone4959894331', {'event_category': 'click'});
            ym(28448401, 'reachGoal', 'phone_4959894331');
        });
        $('#header-top .phones > .phone:nth-child(2)').on('click', function () {
            gtag('event', 'phone8007747072', {'event_category': 'click'});
            yaCounter28448401.reachGoal('phone_8007747072');
        });
        $('#header-top .phones > .phone:nth-child(3)').on('click', function () {
            gtag('event', 'phone9853109550', {'event_category': 'click'});
            yaCounter28448401.reachGoal('phone_9853109550');
        });
//Forms
        $('a#button-subsribe').on('click', function () {
            gtag('event', 'feedback', {'event_category': 'form'});
            yaCounter28448401.reachGoal('form_feedback');
        });
    });
</script>

<?php echo $smart_notification_bar_pro_plus; ?>
</body></html>