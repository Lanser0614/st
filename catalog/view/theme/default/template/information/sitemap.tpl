<?php echo $header; ?>
<section class="container"><?php echo $column_left; ?><?php echo $column_right; ?>

<div id="content"><?php echo $content_top; ?>
  
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $i=>$breadcrumb){ if($i+1 < count($breadcrumbs)){ ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } else { echo $breadcrumb['text']; }} ?>
  </div>

  <h1><?php echo $heading_title; ?></h1>

  <div id="sitemap">
    <style type="text/css" scoped>
      .imaf-sitemap *{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;position:relative}.imaf-sitemap .cf:before,.imaf-sitemap .cf:after{content:" ";display:table}.imaf-sitemap .cf:after{clear:both}.imaf-sitemap .cf{*zoom:1}.imaf-sitemap .content{width:100%;max-width:1142px;margin:0 auto;padding:0 20px}.imaf-sitemap a:focus{outline:2px dashed #f7f7f7}.imaf-sitemap @media screen and (max-width:767px){.content{padding:0 20px}}.imaf-sitemap ul{padding:0!important;margin:0!important;list-style:none}.imaf-sitemap ul a{display:block;background:#014780;border:4px solid whitesmoke;text-align:center;overflow:hidden;font-size:1em;text-decoration:none;font-weight:bold;color:whitesmoke;height:70px;margin-bottom:-26px;box-shadow:4px 4px 9px -4px rgba(0,0,0,0.4);-webkit-transition:all linear .1s;-moz-transition:all linear .1s;transition:all linear .1s}.imaf-sitemap @media print{ul a{border:4px solid #000}}.imaf-sitemap @media screen and (max-width:767px){ul a{font-size:1em}}.imaf-sitemap ul a span{top:50%;margin-top:-0.7em;display:block}.imaf-sitemap .administration>li>a{margin-bottom:25px}.imaf-sitemap .director>li>a{width:50%;margin:0 auto 0 auto}.imaf-sitemap .subdirector:after{content:"";display:block;width:0;height:130px;background:#00000047;border-left:4px solid #00000047;left:45.45%;position:relative}.imaf-sitemap @media print{.subdirector:after{border-left:4px solid #000}}.imaf-sitemap .subdirector,.imaf-sitemap .departments{position:absolute;width:100%}.imaf-sitemap .subdirector>li:first-child,.imaf-sitemap .departments>li:first-child{width:18.59894921190893%;height:64px;margin:0 auto 92px auto;padding-top:25px;border-bottom:4px solid #00000047;z-index:1}.imaf-sitemap @media print{.subdirector>li:first-child,.departments>li:first-child{border-bottom:4px solid #000}}.imaf-sitemap .subdirector>li:first-child{float:right;right:27.2%;border-left:4px solid #00000047}.imaf-sitemap @media print{.subdirector>li:first-child{border-left:4px solid black}}.imaf-sitemap .departments>li:first-child{float:left;left:27.2%;border-right:4px solid #00000047}.imaf-sitemap @media print{.departments>li:first-child{border-right:4px solid black}}.imaf-sitemap .subdirector>li:first-child a,.imaf-sitemap .departments>li:first-child a{width:100%}.imaf-sitemap .subdirector>li:first-child a{left:25px}.imaf-sitemap @media screen and (max-width:767px){.imaf-sitemap .subdirector>li:first-child,.imaf-sitemap .departments>li:first-child{width:40%}.imaf-sitemap .subdirector>li:first-child{right:10%;margin-right:2px}.imaf-sitemap .subdirector:after{left:49.8%}.imaf-sitemap .departments>li:first-child{left:10%;margin-left:2px}}.imaf-sitemap .departments>li:first-child a{right:25px}.imaf-sitemap .department:first-child,.imaf-sitemap .departments li:nth-child(2){margin-left:0;clear:left}.imaf-sitemap .departments:after{content:"";display:block;position:absolute;width:81.1%;height:22px;border-top:4px solid #00000047;border-right:4px solid #00000047;border-left:4px solid #00000047;margin:0 auto;top:130px;left:9.1%}.imaf-sitemap @media print{.departments:after{border-top:4px solid #000;border-right:4px solid #000;border-left:4px solid #000}}.imaf-sitemap @media screen and (max-width:767px){.departments:after{border-right:0;left:0;width:49.8%}}.imaf-sitemap @media screen and (min-width:768px){.department:first-child:before,.department:last-child:before{border:0}}.imaf-sitemap .department:before{content:"";display:block;position:absolute;width:0;height:22px;border-left:4px solid #00000047;z-index:1;top:-22px;left:50%;margin-left:-4px}.imaf-sitemap @media print{.department:before{border-left:4px solid black}}.imaf-sitemap .department{border-left:4px solid #00000047;width:18.59894921190893%;float:left;margin-left:1.751313485113835%;margin-bottom:60px}.imaf-sitemap @media print{.department{border-left:4px solid #000}}.imaf-sitemap .lt-ie8 .department{width:18.25%}.imaf-sitemap @media screen and (max-width:767px){.imaf-sitemap .department{float:none;width:100%;margin-left:0}.imaf-sitemap .department:before{content:"";display:block;position:absolute;width:0;height:60px;border-left:4px solid #00000047;z-index:1;top:-60px;left:0;margin-left:-4px}.imaf-sitemap .department:nth-child(2):before{display:none}}.imaf-sitemap .department>a{margin:0 0 -26px -4px;z-index:1}.imaf-sitemap .department>a:hover{height:80px}.imaf-sitemap .department>ul{margin-top:0;margin-bottom:0}.imaf-sitemap .department li{padding-left:25px;border-bottom:4px solid #00000047;height:80px}.imaf-sitemap @media print{.department li{border-bottom:4px solid #000}}.imaf-sitemap .department li a{background:#00000047;top:48px;position:absolute;z-index:1;width:90%;height:60px;vertical-align:middle;right:-1px;background-image:url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIxMDAlIiB5Mj0iMTAwJSI+CiAgICA8c3RvcCBvZmZzZXQ9IjAlIiBzdG9wLWNvbG9yPSIjMDAwMDAwIiBzdG9wLW9wYWNpdHk9IjAuMjUiLz4KICAgIDxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iIzAwMDAwMCIgc3RvcC1vcGFjaXR5PSIwIi8+CiAgPC9saW5lYXJHcmFkaWVudD4KICA8cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIiBmaWxsPSJ1cmwoI2dyYWQtdWNnZy1nZW5lcmF0ZWQpIiAvPgo8L3N2Zz4=);background-image:-moz-linear-gradient(-45deg,rgba(0,0,0,0.25) 0,rgba(0,0,0,0) 100%)!important;background-image:-webkit-gradient(linear,left top,right bottom,color-stop(0%,rgba(0,0,0,0.25)),color-stop(100%,rgba(0,0,0,0)))!important;background-image:-webkit-linear-gradient(-45deg,rgba(0,0,0,0.25) 0,rgba(0,0,0,0) 100%)!important;background-image:-o-linear-gradient(-45deg,rgba(0,0,0,0.25) 0,rgba(0,0,0,0) 100%)!important;background-image:-ms-linear-gradient(-45deg,rgba(0,0,0,0.25) 0,rgba(0,0,0,0) 100%)!important;background-image:linear-gradient(135deg,rgba(0,0,0,0.25) 0,rgba(0,0,0,0) 100%)!important;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#40000000',endColorstr='#00000000',GradientType=1)}.imaf-sitemap .department li a:hover{box-shadow:8px 8px 9px -4px rgba(0,0,0,0.1);height:80px;width:95%;top:39px;background-image:none!important}.imaf-sitemap .department.dep-a a{background:#c5af3b}.imaf-sitemap .department.dep-b a{background:#2196f3}.imaf-sitemap .department.dep-c a{background:#6a90a1}.imaf-sitemap .department.dep-d a{background:#a3a2a2}.imaf-sitemap .department.dep-e a{background:#e79595}
    </style>
    <div class="imaf-sitemap" style="height: 65rem">
      <div class="content">
        <figure class="org-chart cf">
          <ul class="administration">
            <li>
              <ul class="director">
                <li>
                  <a href="https://st-spares.ru/"><span>Главная</span></a>
                  <ul class="subdirector">
                    <li><a href="https://st-spares.ru/login/"><span>Авторизация</span></a></li>
                  </ul>
                  <ul class="departments cf">
                    <li><a href="https://st-spares.ru/create-account/"><span>Регистрация</span></a></li>

                    <li class="department dep-a">
                      <a><span>Помощь покупателю</span></a>
                      <ul class="sections">
                        <li class="section"><a href="https://st-spares.ru/oplata-i-dostavka"><span>Оплата и доставка</span></a></li>
                        <li class="section"><a href="https://st-spares.ru/garantiya"><span>Гарантия</span></a></li>
                        <li class="section"><a href="https://st-spares.ru/rukovodstvo-po-remontu"><span>Руководство по ремонту</span></a></li>
                        <li class="section"><a href="https://st-spares.ru/order-history/"><span>История заказов</span></a></li>
                        <li class="section"><a href="https://st-spares.ru/newsletter/"><span>Рассылка новостей</span></a></li>
                        <li class="section"><a href="https://st-spares.ru/index.php?route=extension/module/contact"><span>Запрос по VIN</span></a></li>
                        <li class="section"><a href="https://st-spares.ru/faq"><span>Вопрос - ответ</span></a></li>
                      </ul>
                    </li>
                    <li class="department dep-b">
                      <a><span>Компания</span></a>
                      <ul class="sections">
                        <li class="section"><a href="https://st-spares.ru/o-kompanii"><span>О компании</span></a></li>
                        <li class="section"><a href="https://st-spares.ru/dostavka"><span>Доставка</span></a></li>
                        <li class="section"><a href="https://st-spares.ru/contact-us/"><span>Контакты</span></a></li>
                      </ul>
                    </li>
                    <li class="department dep-c">
                      <a><span>Информация</span></a>
                      <ul class="sections">
                        <li class="section"><a href="https://st-spares.ru/index.php?route=blog/category&blogpath=49"><span>Новости</span></a></li>
                        <li class="section"><a href="https://st-spares.ru/index.php?route=blog/category&blogpath=50"><span>Обзор товаров</span></a></li>
                        <li class="section"><a href="https://st-spares.ru/index.php?route=blog/category&blogpath=51"><span>Акции</span></a></li>
                        <li class="section"><a href="https://st-spares.ru/brands/"><span>Бренды</span></a></li>
                        <li class="section"><a href="https://st-spares.ru/specials/"><span>Товары со скидками</span></a></li>
                      </ul>
                    </li>
                    <li class="department dep-d">
                      <a><span>Каталог товаров</span></a>
                      <ul class="sections">
                        <li class="section"><a href="https://st-spares.ru/tata613/"><span>TATA 613</span></a></li>
                        <li class="section"><a href="https://st-spares.ru/mitsubishi_fuso_canter/"><span>MITSUBISHI FUSO (Российской сборки)</span></a></li>
                        <li class="section"><a href="https://st-spares.ru/hino/"><span>HINO</span></a></li>
                        <li class="section"><a href="https://st-spares.ru/isuzu/"><span>ISUZU</span></a></li>
                        <li class="section"><a href="https://st-spares.ru/foton/"><span>FOTON</span></a></li>
                        <li class="section"><a href="https://st-spares.ru/jac/"><span>JAC</span></a></li>
                        <li class="section"><a href="https://st-spares.ru/baw/"><span>BAW 1044 / 1065</span></a></li>
                        <li class="section"><a href="https://st-spares.ru/gazon/"><span>ГАЗон NEXT</span></a></li>
                        <li class="section"><a href="https://st-spares.ru/paz-vektor-next/"><span>ПАЗ Вектор Next</span></a></li>
                      </ul>
                    </li>
                    <li class="department dep-e">
                      <a><span>Телефоны</span></a>
                      <ul class="sections">
                        <li class="section"><a href="tel:+74959894331"><span>+7 (495) 989-43-31</span></a></li>
                        <li class="section"><a href="tel:+78007757072"><span>+7 (800) 775-70-72</span></a></li>
                        <li class="section"><a href="tel:+79853109550"><span>+7 (985) 310-95-50</span></a></li>
                      </ul>
                    </li>
                  </ul>
                </li>
              </ul>
            </li>
          </ul>
        </figure>
      </div>
    </div>
  </div>
  <?php echo $content_bottom; ?>

</div>
</section>
<?php echo $footer; ?>