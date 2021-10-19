<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="yandex-verification" content="4a78947c28440398"/>
    <title><?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?></title>
    <base href="<?php echo $base; ?>"/>
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; if (isset($_GET['page'])) { echo " -
    ". ((int) $_GET['page'])." ".$text_page;} ?>" />
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>"/>
    <?php } ?>
    <meta property="og:title" content="<?php echo $title; if (isset($_GET['page'])) { echo " -
    ". ((int) $_GET['page'])." ".$text_page;} ?>" />
    <meta property="og:url" content="<?php echo $og_url; ?>"/>
    <?php if ($og_image) { ?>
    <meta property="og:image" content="<?php echo $og_image; ?>"/>
    <?php } else { ?>
    <meta property="og:image" content="<?php echo $logo; ?>"/>
    <?php } ?>
    <meta property="og:site_name" content="<?php echo $name; ?>"/>

    <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>

    <link href="catalog/view/javascript/bootstrap/js/bootstrap.min.js" rel="preload" as="script">
    <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" ></script>
    <script src="catalog/view/javascript/lazysizes.min.js" async></script>

    <style>
        @font-face{font-family:MuseoSans;src:local('MuseoSansCyrl-300'),url(catalog/view/theme/default/fonts/MuseoSansCyrl-300.ttf) format('truetype');font-weight:400;font-style:normal;font-display:swap}@font-face{font-family:MuseoSans;src:local('MuseoSansCyrl-500'),url(catalog/view/theme/default/fonts/MuseoSansCyrl-500.ttf) format('truetype');font-weight:500;font-style:normal;font-display:swap}.hide-tag{opacity:0; display:table-column}#scrollup{padding:20px;font-size:17px;font-weight:500;color:#fff;text-align:center;background:#055187;cursor:pointer}#scrollup span::after{content:'';border:solid 8px transparent;border-bottom:solid 8px #fff;margin-left:10px;position:relative;top:-12px}#scrollup:hover{background:#0660a0}.attractYellow{background-color: #fbdb32;}.p-x-5{padding: 0 5px;}#wrapper td{text-align:center}.submenu .name{min-height:0!important;padding-top:0!important}.maincat span{font-weight:700!important}.subcat:hover{text-decoration:underline}.maincat:hover{text-decoration:underline}.product-grid4 h4 a:hover{text-decoration:underline}*{margin:0;padding:0}.welcome.icon{font-weight:700}.phone.icon{font-weight:700}body{font-family:MuseoSans,Arial,Tahoma,sans-serif;color:#424242;font-size:15px;background:#fff}.box-heading,h1,h2,h3,h4,h5,h6{font-weight:700;color:#262626}.box-heading,h1{margin:0 0 20px 0;font-size:26px}h2{margin:0 0 18px 0;font-size:24px}h3{margin:0 0 16px 0;font-size:22px}h4{margin:0 0 14px 0;font-size:20px}p{margin:0 0 12px 0}li,ul{list-style-position:inside}.hidden{display:none}a{color:inherit;text-decoration:underline;cursor:pointer;-webkit-transition:all .3s ease;-moz-transition:all .3s ease;-o-transition:all .3s ease}a:hover{text-decoration:none}a img{border:none}input[type=email],input[type=password],input[type=tel],input[type=text],select{color:gray;padding:10px 16px;font-size:14px;border:solid 1px #ececec;border-radius:3px;background:#fff;box-shadow:2px 2px 4px rgba(0,0,0,.02) inset;font-family:MuseoSans,Arial,Tahoma,sans-serif;outline:0;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box}select{padding:4px 6px}.right-center-left,.right-left{overflow:hidden;margin-left:-3%}.right-left>div{float:left;width:47%;margin:0 0 3% 3%}.right-center-left>div{float:left;width:30.33%;margin:0 0 3% 3%}#content img{max-width:100%}.container{max-width:1180px;min-width:280px;margin:0 auto;padding:0 10px;position:relative}#content{min-height:400px;margin-bottom:25px}.flyblock{position:absolute;top:100%;min-width:100%;background:#fff;z-index:666;margin-top:10px;opacity:0;visibility:hidden;box-shadow:0 2px 4px rgba(0,0,0,.16);-webkit-transition:opacity .3s,margin-top .3s,visibility 0s linear .3s;-moz-transition:opacity .3s,margin-top .3s,visibility 0s linear .3s;-o-transition:opacity .3s,margin-top .3s,visibility 0s linear .3s;transition:opacity .3s,margin-top .3s,visibility 0s linear .3s;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box}.flyblock-parent:hover .flyblock{margin-top:0;opacity:1;visibility:visible;-webkit-transition-delay:0s;-moz-transition-delay:0s;-o-transition-delay:0s;transition-delay:0s}.mobile-arrow{min-height:50px;padding-left:60px;position:relative;cursor:pointer;display:none}.mobile-arrow::after,.mobile-arrow::before{content:'';position:absolute;top:10px;left:6px;width:38px;height:6px;border-top:solid 6px #055187;border-bottom:solid 6px #055187;-webkit-transition:all .3s ease;-moz-transition:all .3s ease;-o-transition:all .3s ease}.mobile-arrow::after{top:34px;height:6px;border:none;background:#055187}.box .mobile-arrow::after,.box .mobile-arrow::before{border-top:solid 6px #3f3f3f;border-bottom:solid 6px #3f3f3f}.box .mobile-arrow::after{border:none;background:#3f3f3f}.img-l{float:left;margin:0 3% 6px 0}.img-r{float:right;margin:0 0 6px 3%}.clear{display:block;width:100%;overflow:hidden}.clear::before{content:'';display:block;clear:both}#header-top{color:#555;font-size:14px;padding:10px 0;background:#fafafa}#header-top .container{display:flex;justify-content:space-between;align-items:center}#header{padding:20px 0 5px 0}#header>.container{display:flex;justify-content:space-between;align-items:center}#header .menu{display:none}#header.fixed{position:fixed;left:0;top:0;width:100%;padding:12px 0;background:#f9f9f9;z-index:888}.fixed #slogan{display:none}.fixed #search input{background:#fff;border:solid 1px rgba(0,0,0,.1)}.fixed #search i{background:#fbdb32}#header.fixed .menu{display:block}.fixed .menu>li.is-submenu{padding:0 6px 0 12px;background:#fbdb32}.fixed .menu>li>a{min-height:38px}.fixed .menu>li.is-submenu>a::after,.fixed .menu>li.is-submenu>a::before{top:21px}.fixed .menu>li.is-submenu a i{top:17px}#logo,#slogan{overflow:hidden}#logo img,#slogan img{float:left;max-width:100%}.icon{display:block;padding-left:26px;text-decoration:none;position:relative}.analog-icon{display:block;padding-left:26px;text-decoration:none;position:relative}.icon::after{content:'';position:absolute;top:0;left:0;width:20px;height:20px;background:url(catalog/view/theme/default/image/icons.png) no-repeat}.analog-icon::after{content:'';position:absolute;top:-36px;left:50px;width:50px;height:41px;background:url(catalog/view/theme/default/image/50x50.png) no-repeat}header .address{padding-left:28px}header .address::after{top:-2px;width:22px;background-position:-100px -24px}.welcome{padding-left:28px}.welcome::after{top:-2px;background-position:-146px -24px}.phones{display:flex;justify-content:space-between;align-items:center}.phone{font-size:14px;font-weight:500;text-decoration:none;margin-right:18px}.phone:last-child{margin-right:0}.phone::after{background-position:-126px 0}#header .phones{display:none}.open::after{background-position:-146px 0}#cart-total{font-size:14px;padding:12px 0 0 60px;white-space:nowrap;cursor:pointer}#cart-total b,#wishlist-total b{position:absolute;left:40px;top:0;width:14px;height:14px;font-size:11px;line-height:14px;text-align:center;font-weight:500;border-radius:50%;background:#ffc000;z-index:20}#cart-total::after{width:48px;height:48px;top:-7px;left:-2px;transition:transform .2s;background-position:left center;background-image:url(catalog/view/theme/default/image/cart.png)}#cart-total:hover::after{transform:scale(1.1)}#flycart{display:none;-moz-user-select:none;-khtml-user-select:none;user-select:none}#flycart-content table{margin-bottom:46px}#flycart-content td{padding:6px 0;border:none}#flycart-content .price{text-align:right;font-size:16px;font-weight:500;white-space:nowrap}#flycart-content .name{font-size:15px}#flycart-content .btn{display:block;font-size:17px;font-weight:500;padding:.6em .1em}#wishlist-total{font-size:14px;padding:12px 0 0 54px}#wishlist-total b{left:36px}#wishlist-total::after{width:44px;height:38px;background-position:-52px 0}#search{width:100%;max-width:340px;position:relative}#search i{position:absolute;right:0;top:0;bottom:0;width:40px;padding:0;cursor:pointer}#search i::after{left:50%;top:50%;margin:-11px 0 0 -11px;background-position:-99px 0;width:23px;height:23px}#search input{width:100%;font-size:14px;padding:12px 50px 12px 20px;background:#f5f5f5;border:none}#menu-container{border-top:solid 1px #ccc;border-bottom:solid 1px #ccc}.menu{list-style:none;display:flex;justify-content:space-between}.menu>li>a{display:flex;justify-content:center;align-items:center;min-height:52px;font-size:16px;font-weight:500;line-height:17px;text-decoration:none;padding:2px 2px;position:relative}.menu>li>a:hover{color:#055187}.menu>li.is-submenu a i{position:absolute;left:0;top:24px}.menu>li.is-submenu a i::after{width:16px;height:9px;background-position:-195px -36px}.menu>li.is-submenu>a{padding-left:26px;padding-right:26px;color:#055187}.menu>li.is-submenu>a::after,.menu>li.is-submenu>a::before{content:'';position:absolute;top:28px;right:9px;width:9px;height:2px;border-radius:1px;background:#024880;transform:rotate(45deg)}.menu>li.is-submenu>a::after{right:4px;transform:rotate(-45deg)}.submenu{left:0}.submenu .container{display:flex;justify-content:space-between;align-items:stretch;padding:20px}.submenu a{display:table;width:1px;max-width:20%;min-width:130px;text-align:center;text-decoration:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box}.submenu .name{display:block;min-height:38px;font-size:14px;font-weight:500;color:#055187;padding-top:8px;text-transform:uppercase}.submenu img{max-width:100%;border:solid 1px rgba(0,0,0,.1)}.submenu a:hover img{border:solid 1px rgba(0,0,0,.2)}#mob-menu{list-style:none;display:none}#mob-menu a{display:block;font-size:16px;font-weight:500;line-height:17px;text-decoration:none;padding:10px 16px}#mob-menu a:hover{color:#055187}#mob-menu li{color:#fff;background:#055187}#mob-menu .cat-li:hover{background:#0660a0}#mob-menu .cat-li:hover a{color:#fff}.breadcrumb{display:flex;justify-content:flex-start;align-items:center;min-height:62px;font-size:14px;color:#5a5a5a;padding:4px 0}.breadcrumb a{display:inline-block;vertical-align:top;margin-right:18px;color:#055187;position:relative}.breadcrumb a::after{content:'/';position:absolute;top:0;right:-12px;color:#5a5a5a}.alert{padding:8px 14px;font-size:12px;border:1px solid transparent;border-radius:4px;margin-bottom:20px}.alert-success{background:#dff0d8;border:solid 1px #d6e9c6;color:#3c763d}.alert-danger{background:#f2dede;border:solid 1px #ebccd1;color:#a94442}.table{border-collapse:collapse;width:100%;margin-bottom:20px}.table td{padding:10px 10px 9px 10px;vertical-align:top;border-bottom:1px solid rgba(0,0,0,.08)}#wrapper .table td:nth-child(6),.table td:nth-child(2){text-align:left!important}#wrapper th:nth-child(2){text-align:left!important}.table th{padding:8px 10px 8px 10px;font-weight:700;background:rgba(0,0,0,.08)!important}.table td.left,.table th.left{text-align:left}.table td.right,.table th.right{text-align:right}.text-danger{color:#e62e2e}.text-success{color:#5fbd26}.product-filter{display:flex;justify-content:space-between;align-items:center;margin-bottom:28px;overflow:hidden}#display{display:flex;justify-content:space-between;align-items:center}#display *{display:block;width:30px;height:30px;cursor:pointer;background:url(catalog/view/theme/default/image/display.png) left top no-repeat}#grid-view.active{background-position:left bottom;cursor:default}#list-view{margin-left:8px;background-position:-30px 0}#list-view.active{background-position:-30px -30px;cursor:default}#list-view2{margin-left:8px;background-position:-60px 0}#list-view2.active{background-position:-60px -30px;cursor:default}.product-filter .sort{overflow:hidden}.product-filter .sort a{display:block;float:left;margin-right:20px;font-size:14px;font-weight:500;color:#055187;text-decoration:none;border-bottom:dashed 1px #055187}.product-filter .sort .active{border:none;color:#6c6c6c;cursor:default}.pagination{margin-bottom:30px;text-align:center}.pagination li{display:inline-block;vertical-align:top;margin:0 4px}.pagination li a,.pagination li span{display:block;height:30px;width:30px;font-size:15px;font-weight:500;line-height:30px;text-align:center;text-decoration:none;position:relative}.pagination .active span{color:#fff;background:#055187}.p-next a,.p-prev a{text-indent:-9000px}.pagination .p-last a{width:36px}.p-prev a::after,.p-prev a::before{content:'';position:absolute;top:11px;left:9px;width:9px;height:2px;border-radius:1px;background:#434343;transform:rotate(-45deg)}.p-prev a::after{top:16px;transform:rotate(45deg)}.p-next a::after,.p-next a::before{content:'';position:absolute;top:11px;right:9px;width:9px;height:2px;border-radius:1px;background:#434343;transform:rotate(45deg)}.p-next a::after{top:16px;transform:rotate(-45deg)}.box-heading a{font-size:70%}.box{margin-bottom:50px}.btn{display:inline-block;vertical-align:top;font-size:16px;font-weight:400;text-decoration:none;text-align:center;padding:.5em 1.6em;margin:0;color:#262626;background:#ffc000;position:relative;border:solid 1px #d5a000;cursor:pointer;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;-webkit-transition:all .3s ease;-moz-transition:all .3s ease;-o-transition:all .3s ease;-moz-user-select:none;-khtml-user-select:none;user-select:none}.btn:hover{background:#ffcc31}.btn2{background:#fff;border:solid 1px #ffc000}.btn2:hover{border:solid 1px #d5a000;background:#ffcc31}.btn-default{color:#777;background:#c4c4c4}.btn-default:hover{color:#777;background:#e6e6e6}.btn-danger{background:#bd362f}.btn-danger:hover{background:#ee5f5b}.btn-info,.btn-reorder,.btn-return{padding:0;width:32px;height:32px}.btn-info::after,.btn-reorder::after,.btn-return::after{content:'';position:absolute;top:50%;left:50%;margin:-5px 0 0 -3px;border:solid 6px transparent;border-left:solid 9px rgba(255,255,255,.9)}.btn-reorder::after,.btn-return::after{width:22px;height:22px;margin:-11px 0 0 -11px;border:none;background:url(catalog/view/theme/default/image/reorder.png) 1px 0 no-repeat}.btn-return::after{background:url(catalog/view/theme/default/image/return.png) 0 1px no-repeat}.buttons{overflow:hidden;padding-top:18px;margin-top:18px;border-top:solid 1px rgba(0,0,0,.05)}.category-info{overflow:hidden;margin-bottom:32px}.category-info .image{float:left;margin:0 20px 4px 0}.category-list{margin-bottom:18px;overflow:hidden}.category-list a{display:inline-block;vertical-align:top;font-size:13px;color:#775f00;padding:7px 16px 6px 16px;margin:0 1.2% 6px 0;text-decoration:none;text-transform:uppercase;font-weight:700;border-radius:18px;white-space:nowrap;background:#f5d500}.category-list a:hover{background:#ffde00}ul.box-category{list-style:none;margin:0;padding:0}ul.box-category>li+li a{border-top:1px solid rgba(0,0,0,.05)}ul.box-category>li>a{display:block;font-size:16px;font-weight:500;padding:8px 2px 8px 2px;text-decoration:none}ul.box-category a.active,ul.box-category a:hover{color:#d03214}ul.box-category>li ul{list-style:none;margin:0;padding:6px 0}ul.box-category>li ul>li{margin:0 0 0 22px}ul.box-category>li ul>li>a{display:block;color:#646464;text-decoration:none;padding:4px 2px 4px 0}.manufacturer-list{overflow:hidden;margin-bottom:12px}.manufacturer-heading{float:left;width:60px;height:60px;line-height:60px;text-transform:uppercase;background:rgba(0,0,0,.05);color:#bababa;font-size:60px;font-weight:700;text-align:center}.manufacturer-content{margin:0 0 3px 70px;padding:8px;overflow:hidden;background:rgba(0,0,0,.03)}.manufacturer-list .image{display:block;float:left;margin-right:20px}.manufacturer-list .name{display:block;font-size:17px;text-transform:uppercase;margin-bottom:5px;font-weight:700}.price-new{color:#e73840}.product-grid{display:flex;justify-content:flex-start;align-items:stretch;flex-wrap:wrap;margin-left:-1%;padding-bottom:32px}.product-grid>div{width:19%;margin:0 0 1% 1%}.product{padding:18px 18px 0 18px;background:#fff;text-align:center;border:solid 1px rgba(0,0,0,.2);position:relative;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box}.product-grid .description{display:none}.product .image img{max-width:100%}.product p{min-height:92px;font-size:16px;line-height:18px;font-weight:400;margin:8px 0 2px 0}.product p a{text-decoration:none}.product p a:hover{color:#055187}.product .price{font-size:24px;font-weight:500;color:#262626;text-align:left}.product .cart{display:flex;justify-content:space-between;align-items:center;height:52px}.incart{padding-left:0;width:36px;height:36px;cursor:pointer}.incart:hover::after{transform:scale(1.1)}.incart::after{width:100%;height:100%;background-position:center;transition:transform .2s;background-image:url(catalog/view/theme/default/image/cart.png)}.product .compare,.product .wishlist{width:20px;height:20px;padding:0;cursor:pointer;position:absolute;top:14px;right:14px}.product .wishlist{right:42px}.compare::after{top:4px;left:2px;width:15px;height:12px;background-position:-174px -24px;opacity:.8}.wishlist::after{top:4px;left:3px;width:14px;height:13px;background-position:-174px 0;opacity:.8}.compare:hover::after,.wishlist:hover::after{opacity:1}.compare span,.wishlist span{position:absolute;left:50%;bottom:120%;margin:0 0 0 -36px;color:#fff;font-size:10px;text-align:center;width:64px;padding:2px 4px;border-radius:3px;background:rgba(0,0,0,.7);display:none}.compare span::before,.wishlist span::before{content:'';position:absolute;left:50%;margin-left:-3px;bottom:-6px;border:solid 3px transparent;border-top:solid 3px rgba(0,0,0,.7)}.compare:hover span,.wishlist:hover span{display:block;z-index:66}.quickview{left:0;right:0;top:25%;text-align:center;box-shadow:none;background:0 0}.quickview span{display:inline-block;padding:12px 22px;background:rgba(232,232,232,.9);cursor:pointer}.quickview span:hover{background:rgba(232,232,232,1)}.more{left:-1px;right:-1px;padding:4px 18px 16px 18px;background:#fff;text-align:center;border:solid 1px rgba(0,0,0,.3);border-top:none;box-shadow:none;z-index:66}.more::after{content:'';position:absolute;left:0;right:0;top:-1px;height:3px;background:#fff}.more .btn{display:block}.product .stock{display:inline-block;padding-left:28px;margin:0;font-size:14px}.product .instock::before,.product .nostock::before{display:none}.product .instock::after{border-left:solid 2px #2d982d;border-bottom:solid 2px #2d982d}.product .nostock::after{border-left:solid 2px #cf3d3d;border-bottom:solid 2px #cf3d3d}.product:hover{border:solid 1px rgba(0,0,0,.3)}.product-list{padding-bottom:32px}.product-list>div{margin-top:-1px;padding-bottom:12px;text-align:left}.product-list>div::after{content:'';display:block;clear:both}.product-list .image{float:left;width:18%;margin-right:2%}.product-list h4{min-height:26px;margin-bottom:4px;font-size:16px}.product-list .description{font-size:13px;min-height:30px}.product-list .stock{float:left}.product-list .cart{min-width:220px;height:40px;float:right}.product-list2{padding-bottom:32px}.product-list2>div{display:flex;justify-content:space-between;align-items:center;margin-top:-1px;padding:10px 12px;text-align:left}.product-list2 .compare,.product-list2 .description,.product-list2 .image,.product-list2 .wishlist{display:none}.product-list2 h4{width:65%;min-height:18px;margin:0}.product-list2 .cart{width:100%;max-width:200px;height:32px}.box .product-grid{padding-bottom:0}#product{display:flex;justify-content:flex-start;align-items:stretch;margin-bottom:3%}#product-left{width:40%;margin-right:6%}#product-right{width:54%}#product-right .right{float:right;max-width:25%;padding-top:6px;font-size:14px}#product-right .right+*{margin-right:26%}.stock{padding-left:34px;margin:20px 0;position:relative}.nostock{color:#cf3d3d}.instock{color:#3d9301}.instock::before,.nostock::before{content:'';position:absolute;left:0;top:-4px;width:24px;height:24px;border-radius:50%;background:#cf3d3d}.instock::before{background:#3d9301}.instock::after,.nostock::after{content:'';position:absolute;left:5px;top:3px;width:12px;height:5px;border-left:solid 2px #fff;border-bottom:solid 2px #fff;transform:rotate(-45deg)}#product .image{overflow:hidden;text-align:center}#product-left a img{float:left;border:solid 1px rgba(0,0,0,.2);max-width:100%;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box}#product-left a img:hover{border:solid 1px rgba(0,0,0,.3)}.box.description{font-size:16px}#product .price{font-size:48px;font-weight:500;color:#262626;margin-bottom:24px}.option+.option{margin-top:10px;padding-top:10px;border-top:solid 2px rgba(0,0,0,.05)}.option b{display:block;font-size:13px;padding-bottom:8px}.option label input{display:none}.option label{display:inline-block;vertical-align:top;margin:0 8px 8px 0;border-radius:2px;cursor:pointer}.option label>span{display:block;padding:4px 8px 5px 8px;font-size:13px;text-align:center;overflow:hidden;border:solid 2px rgba(0,0,0,.1)}.option label img+span{display:block;text-align:center;font-size:10px}.option label input:checked+span{border:solid 2px rgba(0,0,0,.6)}#product .compare,#product .wishlist{display:inline-block;vertical-align:top;font-size:13px;margin:0 4% 22px 0;cursor:pointer}#product .compare{margin-right:0}.compare::after{top:1px;left:0}.wishlist::after{top:1px;left:0}#product .cart{display:flex;justify-content:space-between;align-items:center;max-width:560px;margin-bottom:30px}#product .cart .btn{width:100%;max-width:186px;padding-left:4px;padding-right:4px}#button-cart{font-size:16px;font-weight:500}.htabs{margin-bottom:22px;border-bottom:solid 1px #c4c4c4}.htabs a{display:inline-block!important;padding-bottom:8px;margin-right:1.4%;text-decoration:none;border-bottom:solid 4px #fff}#success{text-align:center;padding-top:146px;font-size:16px;background:url(catalog/view/theme/default/image/success.png) center top no-repeat}#success .title{font-size:34px;font-weight:600;margin-bottom:14px}address{font-style:normal}#contacts .left-content>div{font-size:16px;margin-bottom:18px}.blog_item,.blog_item:hover{padding:0;text-align:left;border:none}.blog_item .date{color:#999;font-size:13px}.blog_item h4{margin:0}#successmsg{margin-bottom:12px;font-size:16px}#newsletterModule-footer{margin-bottom:16px}#newsletterModule-footer .content{display:flex;justify-content:space-between;align-items:stretch;max-width:100%}#newsletterModule-footer .content input{width:68%;padding:8px 10px}#newsletterModule-footer .btn{width:32%;font-size:14px;padding:10px 0}.coolblocks .content{display:flex;justify-content:space-between}.coolblocks .content>*{width:100%;max-width:220px}.coolblocks .content span{display:block}.coolblocks .image{float:left;max-width:26%}.coolblocks .image img{max-width:100%}.coolblocks .image+*,.coolblocks .image+*+*{margin-left:27%}#categories-box h4{font-size:16px;text-transform:uppercase;margin-top:12px;color:#055187}#categories-box .product,#categories-box .product:hover{border:none}#categories-box .image img{border:solid 1px rgba(0,0,0,.1)}#categories-box .product:hover img{border:solid 1px rgba(0,0,0,.2)}#return-to-top{position:fixed;bottom:120px;right:30px;background:#055187;width:50px;height:50px;display:block;text-decoration:none;-webkit-border-radius:35px;-moz-border-radius:35px;border-radius:35px;display:none;-webkit-transition:all .3s linear;-moz-transition:all .3s ease;-ms-transition:all .3s ease;-o-transition:all .3s ease;transition:all .3s ease}#return-to-top i{font-weight:bolder;color:#fff;margin:0;position:relative;left:18px;top:5px;font-size:30px;-webkit-transition:all .3s ease;-moz-transition:all .3s ease;-ms-transition:all .3s ease;-o-transition:all .3s ease;transition:all .3s ease}#return-to-top:hover{background:#0660a0}#return-to-top:hover i{color:#fff;top:15px}footer{clear:both}#footer{padding:36px 0 28px 0}#footer .container{display:flex;justify-content:space-between}#footer .container>div{margin-bottom:12px;width:100%;max-width:280px}#footer #footer-contacts{max-width:340px}#footer .title{min-height:40px;font-size:16px;font-weight:500;color:#262626}#footer-contacts{max-width:340px}#footer li{font-size:15px;margin-bottom:14px;list-style:none}#footer li a{text-decoration:none}#footer li a:hover{color:#055187}#footer .contact{margin-bottom:4px}#footer2{font-size:13px;padding:10px 0;border-top:solid 1px #e8e8e8;overflow:hidden}#footer2 .container{display:flex;justify-content:space-between;align-items:center}#copy{color:#777}.x{display:inline-block;width:26px;height:26px;opacity:.6;position:relative;cursor:pointer;-webkit-transition:all .3s ease;-moz-transition:all .3s ease;-o-transition:all .3s ease}.x::after,.x::before{content:'';position:absolute;top:50%;left:50%;width:18px;height:2px;margin:-1px 0 0 -9px;background:#df0904;transform:rotate(45deg)}.x::after{transform:rotate(-45deg)}.x:hover{opacity:.8}#fastblock .title,form .title{margin-bottom:26px;font-size:20px;font-weight:500;text-transform:uppercase;text-align:center}.fastblock-success{text-align:center;font-size:16px;font-weight:700;color:#75ba42}#loading{position:fixed;width:140px;height:140px;top:50%;left:50%;z-index:1000;margin:-70px 0 0 -70px;display:none;background:rgba(255,255,255,.3) url(catalog/view/theme/default/image/loading-big.gif) center center no-repeat;border-radius:50%}#fastblock{display:flex;justify-content:center;align-items:center;position:absolute;left:0;right:0;height:100%;text-align:center;z-index:1020;display:none}#fastblock>div{text-align:left;width:100%;max-width:600px;background:#fff;padding:3%;margin-top:-80px;border-radius:4px;box-shadow:0 0 50px rgba(0,0,0,.2);position:relative;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;-webkit-transition:all .3s ease;-moz-transition:all .3s ease;-o-transition:all .3s ease}#fastblock>div.right{position:absolute;top:0!important;right:0;max-width:500px;border-radius:0}#fastblock>div.right::before{content:'';position:absolute;left:0;right:0;bottom:100%;height:3000px;background:#fff}#fastblock>div.right::after{content:'';position:absolute;left:0;right:0;top:100%;height:3000px;background:#fff}.privacy-policy{display:block;margin-top:12px;cursor:pointer}.privacy-policy input{display:none}.privacy-policy span{display:block;padding-left:24px;font-size:11px;color:#999;position:relative}.privacy-policy span::before{content:'';position:absolute;top:-2px;left:0;width:14px;height:14px;border-radius:3px;border:solid 1px #bbb}.privacy-policy input:checked+span::after{content:'';position:absolute;left:4px;top:2px;width:8px;height:4px;border-left:solid 1px #bbb;border-bottom:solid 1px #bbb;transform:rotate(-45deg)}#fixed_phone{display:none;align-items:center;z-index:999}.phone_icon{width:30px;height:30px;background-image:url(catalog/view/theme/default/image/header_phone.jpg);background-size:contain;background-repeat:no-repeat;border-radius:50%;margin-right:5px}.header__phones .info{font-size:12px}#header.fixed #fixed_phone{display:inline-flex}#header.fixed #logo{display:none}.more-section{width:100%;border:solid 1px rgba(0,0,0,.2);padding:10px 0;text-align:center;margin-bottom:30px;font-size:15px;cursor:pointer}.more-section span{position:relative}.more-section span::before{content:' ';position:absolute;left:-20px;width:16px;height:16px;transition:transform .2s;background-image:url(catalog/view/theme/default/image/refresh.png)}@-moz-keyframes spin{100%{-moz-transform:rotate(360deg)}}@-webkit-keyframes spin{100%{-webkit-transform:rotate(360deg)}}@keyframes spin{100%{-webkit-transform:rotate(360deg);transform:rotate(360deg)}}.more-section:hover span::before{animation:spin 2s linear infinite}@media screen and (max-width:1020px){.product-grid>div{width:24%}#footer .container>div{max-width:180px}}@media screen and (max-width:840px){.address{display:none}.breadcrumb{display:block;min-height:10px;font-size:12px;padding:12px 0}#header.fixed #logo{display:none}.product-grid>div{width:32.33%}#product{flex-wrap:wrap}#product-left{width:100%;margin:0 0 20px 0}#product-right{width:100%}#product .cart{flex-wrap:wrap;justify-content:space-around}#product .cart>*{margin-bottom:10px}#product #button-cart{width:60%;margin-right:0}.coolblocks .content{flex-wrap:wrap}.coolblocks .content>*{max-width:820px}#footer .container{flex-wrap:wrap}#footer .container>div{width:50%;max-width:620px}}@media screen and (max-width:680px){#header-top{font-size:12px}.pagination li a,.pagination li span{width:25px}#header-top .phones{display:none}#header:not(.fixed) .phones{display:flex;justify-content:space-around;width:100%;padding:20px 0}#header .phone{margin-right:2px}#header:not(.fixed) .container{justify-content:space-around;flex-wrap:wrap}#logo{width:27%;margin-right:3%}#slogan{width:70%}#search{width:100%;max-width:800px;margin-bottom:18px}.fixed #search{display:none}#header:not(.fixed) #wishlist-total{margin-left:60px}#menu-container .mobile-arrow{position:absolute;left:10px;top:-56px}.menu{display:none}.submenu a{width:33.33%;max-width:33.33%;min-width:80px;padding:8px}#header.fixed .menu{overflow:hidden;opacity:0;user-select:none}#header.fixed+#menu-container .container .mobile-arrow{position:fixed;top:10px;z-index:999}#header.fixed+#menu-container .container #mob-menu{position:fixed;width:100%;top:66px;left:0;z-index:99}.fixed .menu>li.is-submenu>a{font-size:0;padding-right:0;padding-left:32px}.fixed .menu>li.is-submenu a i{left:5px}.fixed .menu>li.is-submenu>a::after,.fixed .menu>li.is-submenu>a::before{display:none}#wishlist-total{text-indent:-1000px}#wishlist-total b{text-indent:0}#fixed_phone{margin-right:30px}.mobile-arrow{display:block}.box .mobile-arrow{display:flex;align-items:center}.flyblock,.flyblock-parent:hover .flyblock{display:none}.product-grid>div{width:49%!important}#product-right .right{float:none;max-width:100%;padding-top:0;margin-bottom:8px}#product-right .right+*{margin-right:0}.bus,.car{display:none}.right-center-left,.right-left{margin-left:0!important}.right-center-left>*,.right-left>*{float:none;width:100%!important;margin:0 0 3% 0!important}#footer .container{display:block}#footer .container>div{width:100%;max-width:620px}}@media screen and (max-width:440px){.box-heading,h1{margin:0 0 14px 0;font-size:19px}h2{margin:0 0 12px 0;font-size:18px}h3{margin:0 0 10px 0;font-size:17px}h4{margin:0 0 8px 0;font-size:16px}.phone{padding-left:0}.phone::after{display:none}.table td,.table th{padding:6px 1px 5px 1px}.product-grid>div{width:99%!important}#fastblock>div{padding-left:8px;padding-right:8px}#flycart-content .name{font-size:13px}}.category_map{border:1px solid #f3f3f3;margin-bottom:30px;padding:2.6% 1% 1.4% 2.4%;min-height:360px;position:relative;background:linear-gradient(to bottom,#fff 0,#fdfdfd 50%,#f1f1f1 100%);box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box}.category_map>p{position:relative;z-index:20;font-weight:700}#category_list{position:relative;z-index:20;max-width:320px}.category_map ul{margin:0;padding:0;list-style:none}.category_map a{text-decoration:none;font-size:14px;color:#595959;display:block;padding:2px 0 2px 14px;position:relative}.category_map li.active a,.category_map li:hover a{color:#1b1b1b}.category_map li.active a::after,.category_map li:hover a::after{content:'';position:absolute;top:5px;left:0;border:solid 4px transparent;border-left:solid 5px #0d63a3}.bus,.car{width:100%;position:absolute;bottom:0;left:0;z-index:1}.bus img,.car img{position:absolute;bottom:0;right:0;z-index:1}#wrapper h2{margin-top:0}.search-link{display:block}.t-ac{text-align:center}.td-order{width:90px}.td-order input[type=text]{width:40px;padding:2px 6px;height:22px;display:inline-block}.td-order button{margin-left:12px;cursor:pointer;top:2px}.td-order button:hover{color:#428bca}.nowrap{white-space:nowrap}.pointer{cursor:pointer}.product-grid .my-btn{font-size:13px!important;border-radius:5px;margin-bottom:5px;border-width:0}.product-grid .my-clearfix{border:solid 1px rgba(0,0,0,.2);border-bottom:none;border-left:none;border-right:none;padding:2px}.product-list .my-btn{font-size:12px!important;border-radius:5px;margin-bottom:5px;border-width:0;float:right;position:absolute;right:50px;bottom:60px}.product-list .my-clearfix{border:solid 1px rgba(0,0,0,.2);border-bottom:none;border-left:none;border-right:none;position:absolute;width:200px;float:right;bottom:100px;right:22px;padding:5px}.product-list2 .my-btn{font-size:12px!important;border-radius:5px;border-width:0;position:absolute;float:left;left:570px;bottom:5px}th a.sort-asc,th a.sort-desc{text-decoration:none;display:block;width:100%;padding-right:18px;position:relative}a.sort-asc:before{border:4px solid transparent;content:"";display:block;height:0;right:5px;top:50%;position:absolute;width:0;border-bottom-color:#00f;margin-top:-9px}a.sort-asc:after{border:4px solid transparent;content:"";display:block;height:0;right:5px;top:50%;position:absolute;width:0;border-top-color:#666;margin-top:1px}a.sort-desc:after{border:4px solid transparent;content:"";display:block;height:0;right:5px;top:50%;position:absolute;width:0;border-top-color:#00f;margin-top:1px}a.sort-desc:before{border:4px solid transparent;content:"";display:block;height:0;right:5px;top:50%;position:absolute;width:0;border-bottom-color:#666;margin-top:-9px}.product .analog-stock::before{display:none}.analog-stock::after{content:'';position:absolute;left:5px;top:3px;width:12px;height:5px;border-left:solid 2px #fff;border-bottom:solid 2px #fff;transform:rotate(-45deg)}.analog-stock::before{content:'';position:absolute;left:0;top:-4px;width:24px;height:24px;border-radius:50%;background:#ffc000}.product .analog-stock::after{border-left:solid 2px #ffc000;border-bottom:solid 2px #ffc000}.analog-stock{color:#ffc000}.podcat{top:5%!important;height:200px;background:#fff;width:200px;padding-top:20px}.podcat a{display:block;padding:2px 0;text-decoration:none}.podcat a:hover{text-decoration:underline}.faq-title h3::before{content:none!important}#mob-menu a.subcat{display:none;padding-left:25px}#mob-menu a.subcat.show{display:block}#mob-menu a.has-children::after{content:'';position:absolute;width:5px;height:5px;border:1px solid #fff;border-left-color:transparent;border-top-color:transparent;transform:rotate(-45deg);margin-left:15px;margin-top:5px}
    </style>
    <link href="catalog/view/theme/default/stylesheet/stylesheet.min.css" rel="preload" as="style" onload="this.rel='stylesheet'">
    <noscript><link rel="stylesheet" href="catalog/view/theme/default/stylesheet/stylesheet.min.css"></noscript>

    <?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" rel="preload" as="style" onload="this.rel='stylesheet'">
    <noscript><link rel="<?php echo $style['rel']; ?>" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" /></noscript>
    <?php } ?>

    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>"/>
    <?php } ?>
    <?php foreach ($scripts as $script) { ?>
    <script defer src="<?php echo $script; ?>" type="text/javascript"></script>
    <?php } ?>
    <?php foreach ($analytics as $analytic) { echo $analytic; } ?>

    <script type="module" src="catalog/view/javascript/pwabuilder-sw-register.js"></script>
    <meta name="theme-color" content="#000000"/>
    <link rel="icon" type="image/png" href="image/catalog/favicon.png"/>
    <link rel="apple-touch-icon" href="image/catalog/favicon.png"/>
    <link rel="manifest" href="catalog/view/javascript/manifest.json">
    <script type='application/ld+json' defer>
        {
            "@context": "http://www.schema.org",
            "@type": "AutomotiveBusiness",
            "name": "ST Автозапчасти",
            "url": "https://st-spares.ru/",
            "logo": "https://st-spares.ru/image/catalog/logo.png",
            "image": "https://st-spares.ru/image/catalog/logo.png",
            "description": "Продажа запчастей и расходных материалов для китайских грузовых автомобилей",
            "telephone": "+7 (495) 989-43-31",
            "address": {
                "@type": "PostalAddress",
                "streetAddress": "32 км МКАД, владение 15, Торговый Комплекс Сфера-Авто (второй этаж, офис 305)",
                "addressLocality": "Москва",
                "addressRegion": "Москва",
                "postalCode": " 117405",
                "addressCountry": "Россия"
            },
            "hasMap": "https://goo.gl/maps/981f9EJQGh38iDmj9",
            "openingHours": "Mo, Tu, We, Th, Fr 10:00-18:00",
            "contactPoint": {
                "@type": "ContactPoint",
                "contactType": "shop",
                "telephone": "+7 (495) 989-43-31"
            }
        }
    </script>
</head>

<body>
<header>
    <div id="header-top">
        <div class="container">
            <a class="address icon" href="<?php echo $contact; ?>">Наши магазины</a>

            <div class="open icon"><?php echo $open; ?></div>

            <div class="phones">
                <?php $simv = array("(", ")", "-", " "); foreach($phones as $phone){ $phone2 = str_replace($simv, "", $phone); ?>
                <a class="phone icon" href="tel:<?php echo $phone2; ?>"><?php echo $phone; ?></a>
                <?php } ?>
            </div>
            <a class="welcome icon <?php if (!$logged) echo 'auth_phone_link'; ?>"
               href="<?php if ($logged) echo $account; else echo '#'; ?>"><?php echo $text_account; ?></a>
        </div>
    </div>
    <div id="header">
        <div class="container">
            <div id="logo">
                <?php if ($home == $og_url) { ?><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>"
                                                     alt="<?php echo $name; ?>"/>
                <?php } else { ?><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>"
                                                                     title="<?php echo $name; ?>"
                                                                     alt="<?php echo $name; ?>"/></a><?php } ?>
            </div>

            <div id="slogan"><img src="image/catalog/slogannew.png" alt=""/></div>

            <div class="phones">
                <?php $simv = array("(", ")", "-", " "); foreach($phones as $phone){ $phone2 = str_replace($simv, "", $phone); ?>
                <a class="phone icon" href="tel:<?php echo $phone2; ?>"><?php echo $phone; ?></a>
                <?php } ?>
            </div>

            <div id="search"><label for="searchproduct" class="hide-tag">Search</label><input id="searchproduct" type="text" name="search" placeholder="<?php echo $text_search; ?>"/><i class="icon attractYellow"></i></div>

            <a rel="nofollow" href="<?php echo $wishlist; ?>" id="wishlist-total"
               class="icon"><?php echo $text_wishlist; ?></a>

            <?php echo $cart; ?>

            <div id="fixed_phone">
                <div class="phone_icon"></div>
                <div class="header__phones">
                    <strong>8 800 775-7072</strong>
                    <div class="info">Бесплатный звонок по РФ</div>
                </div>
            </div>

        </div>
    </div>


    <div id="menu-container">
        <div class="container">

            <div class="mobile-arrow"></div>
            <ul id="mob-menu">
                <?php foreach ($categories as $category) { ?>
                <li class="cat-li">
                    <a class="<?= !empty($category['children']) ? 'has-children' : ''?>"
                       href="<?php echo $category['href']; ?>"><span
                                class="name"><?php echo $category['name']; ?></span></a>
                    <?php foreach ($category['children'] as $child) { ?>
                    <a class="subcat" href="<?php echo $child['href']; ?>"><span
                                class="name"><?php echo $child['name']; ?></span></a>
                    <?php }?>
                </li>
                <?php } ?>
                <!--
                <li class="cat-li"><a href="/FOTON"><span class="name">FOTON</span></a>
                <a class="subcat" href="/FOTON-1039"><span class="name">FOTON 1039</span></a>
          <a class="subcat" href="/FOTON-1049"><span class="name">FOTON 1049</span></a>
          <a class="subcat" href="/FOTON-1069"><span class="name">FOTON 1069</span></a>
          <a class="subcat" href="/FOTON-1084"><span class="name">FOTON 1084</span></a>
          <a class="subcat" href="/FOTON-1093"><span class="name">FOTON 1093</span></a>
          <a class="subcat" href="/FOTON-1099"><span class="name">FOTON 1099</span></a>
                </li>
                <li class="cat-li"><a href="/jac"><span class="name">JAC</span></a>
                <a class="subcat" href="/N56"><span class="name">JAC N56</span></a>
          <a class="subcat" href="/N80"><span class="name">JAC N80</span></a>
          <a class="subcat" href="/N120"><span class="name">JAC N120</span></a>
                </li>
                <li class="cat-li"><a href="/gazon"><span class="name">ГАЗОН</span></a></li>
            -->
                <li><a href="/index.php?route=extension/module/contact">Запрос по VIN</a></li>
                <?php if ($informations) { foreach ($informations as $information) { ?>

                <?php if($information['title'] == 'Бренды'){ continue;}?>
                <?php if($information['title'] == 'Гарантия'){ continue;}?>
                <?php if($information['title'] == 'Акции'){ continue;}?>
                <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                <?php } } ?>
                <li><a href="/faq">Вопрос - Ответ</a></li>
                <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>

            </ul>


            <ul class="menu">


                <li class="is-submenu flyblock-parent attractYellow p-x-5"><a><i class="icon"></i>Каталог товаров</a>
                    <div class="submenu flyblock">
                        <div class="container">

                            <?php foreach ($categories as $category) { ?>
                            <div class="catmenu">
                                <a class="maincat" href="<?php echo $category['href']; ?>"><span
                                            class="name"><?php echo $category['name']; ?></span></a>
                                <?php foreach ($category['children'] as $child) { ?>
                                <a class="subcat" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                                <?php }?>
                            </div>
                            <?php } ?>
                            <!--

                        <div class="catmenu">
                            <a class="maincat" href="/FOTON"><span class="name">FOTON</span></a>
               <a class="subcat" href="/FOTON-1039"><span class="name">FOTON 1039</span></a>
               <a class="subcat" href="/FOTON-1049"><span class="name">FOTON 1049</span></a>
               <a class="subcat" href="/FOTON-1069"><span class="name">FOTON 1069</span></a>
               <a class="subcat" href="/FOTON-1084"><span class="name">FOTON 1084</span></a>
               <a class="subcat" href="/FOTON-1093"><span class="name">FOTON 1093</span></a>
               <a class="subcat" href="/FOTON-1099"><span class="name">FOTON 1099</span></a>

                       </div>
                        <div class="catmenu">
                            <a class="maincat" href="/jac"><span class="name">JAC</span></a>
               <a class="subcat" href="/N56"><span class="name">JAC N56</span></a>
               <a class="subcat" href="/N80"><span class="name">JAC N80</span></a>
               <a class="subcat" href="/N120"><span class="name">JAC N120</span></a>

                       </div>
                        <div class="catmenu"><a class="maincat" href="/gazon"><span class="name">ГАЗОН</span></a></div>

                   -->

                        </div>
                    </div>
                </li>

                <li><a href="/index.php?route=extension/module/contact">Запрос по VIN</a></li>


                <?php if ($informations) { foreach ($informations as $information) { ?>
                <?php if($information['title'] == 'Бренды'){ continue;}?>
                <?php if($information['title'] == 'Гарантия'){ continue;}?>
                <?php if($information['title'] == 'Акции'){ continue;}?>
                <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                <?php } } ?>
                <li><a href="/faq">Вопрос - Ответ</a></li>
                <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>

            </ul>

        </div>
    </div>

</header>

