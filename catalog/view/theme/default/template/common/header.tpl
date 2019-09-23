<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="yandex-verification" content="4a78947c28440398" />
<title><?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
<?php } ?>
<?php if ($keywords) { ?><meta name="keywords" content= "<?php echo $keywords; ?>" /><?php } ?>
<meta property="og:title" content="<?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
<meta property="og:url" content="<?php echo $og_url; ?>" />
<?php if ($og_image) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />

<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>

<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>

<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { echo $analytic; } ?>
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
  
  <a class="welcome icon" href="<?php if ($logged) echo $account; else echo $login; ?>"><?php echo $text_account; ?></a>
  
</div>
</div>

<div id="header">
<div class="container">

  <div id="logo">
    <?php if ($home == $og_url) { ?><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
    <?php } else { ?><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a><?php } ?>
  </div>
  
  <div id="slogan"><img src="image/catalog/slogan.png" alt="" /></div>
  
  <div class="phones">
  <?php $simv = array("(", ")", "-", " "); foreach($phones as $phone){ $phone2 = str_replace($simv, "", $phone); ?>
    <a class="phone icon" href="tel:<?php echo $phone2; ?>"><?php echo $phone; ?></a>
  <?php } ?>
  </div>
  
  <div id="search"><input type="text" name="search" placeholder="<?php echo $text_search; ?>" /><i class="icon"></i></div>  
  
  <a href="<?php echo $wishlist; ?>" id="wishlist-total" class="icon"><?php echo $text_wishlist; ?></a>
    
  <?php echo $cart; ?>

</div>
</div>


<div id="menu-container">
<div class="container">
  
  <div class="mobile-arrow"></div>
  <ul id="mob-menu">
  
    <?php if ($categories) { foreach ($categories as $category) { ?>
      <li class="cat-li"><a href="<?php echo $category['href']; ?>"<?php echo $category['active']; ?>><?php echo $category['name']; ?></a></li>
    <?php } } ?>
    
    <?php if ($informations) { foreach ($informations as $information) { ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
    <?php } } ?>
    <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>

  </ul>


  <ul class="menu">
  
    <?php if ($categories) { ?>
    <li class="is-submenu flyblock-parent"><a><i class="icon"></i>Каталог товаров</a>
    <div class="submenu flyblock">
    <div class="container">
      <?php foreach ($categories as $category) { ?>
    
         <a href="<?php echo $category['href']; ?>"<?php echo $category['active']; ?>><img src="<?php echo $category['thumb']; ?>" alt="" /><span class="name"><?php echo $category['name']; ?></span></a>
    
      <?php } ?>
    </div>
    </div>
    </li>
    <?php } ?>
  
    <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
    <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
  
    <?php if ($informations) { foreach ($informations as $information) { ?>
    <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
    <?php } } ?>
    <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>

  </ul>

</div>
</div>

</header>

