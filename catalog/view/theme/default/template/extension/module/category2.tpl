<section id="categories-box" class="box">
  <div class="container">

    <?php if($heading_title) { ?><div class="box-heading"><?php echo $heading_title; ?></div><?php } ?>

    <div class="product-grid product-grid4">
      <?php foreach ($categories as $category) { ?>
      <div class="product flyblock-parent">
        <?php if(isset($category['children']) && !empty($category['children'])){ ?>
        <div class="quickview podcat flyblock">
        <?php foreach ($category['children'] as $child) { ?>
        <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
        <?php }?>
      </div>
      <?php } ?>
      <div class="image">
        <a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" class="lazyload" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>"></a>
      </div>
      <h4><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></h4>
    </div>
    <?php } ?>
    <!--

           <div class="product flyblock-parent">
        <div class="quickview flyblock podcat">
<a href="/FOTON-1039">FOTON 1039</a>
<a href="/FOTON-1049">FOTON 1049</a>
<a href="FOTON-1069">FOTON 1069</a>
<a href="/FOTON-1084">FOTON 1084</a>
<a href="/FOTON-1093">FOTON 1093</a>
<a href="/FOTON-1099">FOTON 1099</a>

        </div>
    <div class="image">
      <a href="https://st-spares.ru/FOTON/"><img src="https://st-spares.ru/image/cache/catalog/Hino26-280x280.jpg" alt="FOTON" title="FOTON"></a>
    </div>
    <h4><a href="https://st-spares.ru/FOTON/">FOTON</a></h4>
  </div>



       <div class="product flyblock-parent">
        <div class="quickview flyblock podcat">
<a href="/N56">JAC N56</a>
<a href="/N80">JAC N80</a>
<a href="/N120">JAC N120</a>

        </div>
    <div class="image">
      <a href="https://st-spares.ru/JAC/"><img src="https://st-spares.ru/image/cache/catalog/Hino26-280x280.jpg" alt="JAC" title="JAC"></a>
    </div>
    <h4><a href="https://st-spares.ru/JAC/">JAC</a></h4>
  </div>



    <div class="product flyblock-parent">
    <div class="image">
      <a href="https://st-spares.ru/gazon"><img src="https://st-spares.ru/image/cache/catalog/car1-280x280.jpg" alt="ГАЗОН" title="ГАЗОН"></a>
    </div>
    <h4><a href="https://st-spares.ru/gazon">ГАЗОН</a></h4>
  </div>
    -->



  </div>

  </div>
</section>
