<?php ?>
   </div><!-- #main -->
     <div class="all" id="our_projects">
       <div style="line-height: 45px; color: #494949; font-size: 20px; text-align: center;">Наши лучшие проекты</div>
         <?php do_action('slideshow_deploy', '275'); ?>
       <div class="allproject"><a href="/nashi-proekty">Все проекты</a></div>
       
         
          <?php echo do_shortcode('[slick-carousel-slider dots="false"]'); ?> 

         
     </div>


<style>
    .footertag {padding: 10px 20px; text-align: center;}
    .footertag div {display: inline-block!important;}
</style>
<div class="footertag">
    <a href="//akvaice.ru/moskva"><div class="slick-image-slide-wrap">Москва</div></a>
<a href="//akvaice.ru/moskovskaya-oblast"><div class="slick-image-slide-wrap">Московская область</div></a>
<a href="//akvaice.ru/sankt-peterburg"><div class="slick-image-slide-wrap">Санкт- Петербург</div></a>
<a href="//akvaice.ru/bryansk"><div class="slick-image-slide-wrap">Брянск</div></a>
<a href="//akvaice.ru/velikij-novgorod"><div class="slick-image-slide-wrap">Великий Новгород</div></a>
<a href="//akvaice.ru/vladimir"><div class="slick-image-slide-wrap">Владимир</div></a>
<a href="//akvaice.ru/vologda"><div class="slick-image-slide-wrap">Вологда</div></a>
<a href="//akvaice.ru/voronezh"><div class="slick-image-slide-wrap">Воронеж</div></a>
<a href="//akvaice.ru/kaluga"><div class="slick-image-slide-wrap">Калуга</div></a>
<a href="//akvaice.ru/kostroma"><div class="slick-image-slide-wrap">Кострома</div></a>
<a href="//akvaice.ru/kursk"><div class="slick-image-slide-wrap">Курск</div></a>
<a href="//akvaice.ru/lipetsk"><div class="slick-image-slide-wrap">Липецк</div></a>
<a href="//akvaice.ru/nizhnij-novgorod"><div class="slick-image-slide-wrap">Нижний Новгород</div></a>
<a href="//akvaice.ru/oryol"><div class="slick-image-slide-wrap">Орёл</div></a>
<a href="//akvaice.ru/penza"><div class="slick-image-slide-wrap">Пенза</div></a>
<a href="//akvaice.ru/pskov"><div class="slick-image-slide-wrap">Псков</div></a>
<a href="//akvaice.ru/ryazan"><div class="slick-image-slide-wrap">Рязань</div></a>
<a href="//akvaice.ru/saransk"><div class="slick-image-slide-wrap">Саранск</div></a>
<a href="//akvaice.ru/smolensk"><div class="slick-image-slide-wrap">Смоленск</div></a>
<a href="//akvaice.ru/tambov"><div class="slick-image-slide-wrap">Тамбов</div></a>
<a href="//akvaice.ru/tver"><div class="slick-image-slide-wrap">Тверь</div></a>
<a href="//akvaice.ru/tula"><div class="slick-image-slide-wrap">Тула</div></a>
<a href="//akvaice.ru/cheboksary"><div class="slick-image-slide-wrap">Чебоксары</div></a>
<a href="//akvaice.ru/yaroslavl"><div class="slick-image-slide-wrap">Ярославль</div></a>
</div>

<?php 
	   	/**
	   	 * attitude_before_footer hook
	   	 */
	   	do_action( 'attitude_before_footer' );
	   ?>	
	  	   <footer id="colophon" class="clearfix">
			<?php
		      /** 
		       * attitude_footer hook		       
				 *
				 * HOOKED_FUNCTION_NAME PRIORITY
				 *
				 * attitude_footer_widget_area 10
				 * attitude_open_sitegenerator_div 20
				 * attitude_socialnetworks 25
				 * attitude_footer_info 30
				 * attitude_close_sitegenerator_div 35
				 * attitude_backtotop_html 40
		       */
		      do_action( 'attitude_footer' );
		   ?>





<div style="display:none;">	   
<!-- Yandex.Metrika informer -->
<a href="https://metrika.yandex.ru/stat/?id=27344234&amp;from=informer"
target="_blank" rel="nofollow"><img src="//bs.yandex.ru/informer/27344234/3_1_FFFFFFFF_EFEFEFFF_0_pageviews"
style="width:88px; height:31px; border:0;" alt="Яндекс.Метрика" title="Яндекс.Метрика: данные за сегодня (просмотры, визиты и уникальные посетители)" onclick="try{Ya.Metrika.informer({i:this,id:27344234,lang:'ru'});return false}catch(e){}"/></a>
<!-- /Yandex.Metrika informer -->

<!-- Yandex.Metrika counter -->
<script type="text/javascript" >
    (function (d, w, c) {
        (w[c] = w[c] || []).push(function() {
            try {
                w.yaCounter37722504 = new Ya.Metrika2({
                    id:37722504,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true,
                    webvisor:true
                });
            } catch(e) { }
        });

        var n = d.getElementsByTagName("script")[0],
            s = d.createElement("script"),
            f = function () { n.parentNode.insertBefore(s, n); };
        s.type = "text/javascript";
        s.async = true;
        s.src = "https://mc.yandex.ru/metrika/tag.js";

        if (w.opera == "[object Opera]") {
            d.addEventListener("DOMContentLoaded", f, false);
        } else { f(); }
    })(document, window, "yandex_metrika_callbacks2");
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/37722504" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->


<!--LiveInternet counter--><script type="text/javascript"><!--
document.write("<a href='//www.liveinternet.ru/click' "+
"target=_blank><img src='//counter.yadro.ru/hit?t26.1;r"+
escape(document.referrer)+((typeof(screen)=="undefined")?"":
";s"+screen.width+"*"+screen.height+"*"+(screen.colorDepth?
screen.colorDepth:screen.pixelDepth))+";u"+escape(document.URL)+
";"+Math.random()+
"' alt='' title='LiveInternet: показано число посетителей за"+
" сегодня' "+
"border='0' width='88' height='15'><\/a>")
//--></script><!--/LiveInternet-->		   
</div>	   
		</footer>
	   
		<?php 
	   	/**
	   	 * attitude_after_footer hook
	   	 */
	   	do_action( 'attitude_after_footer' );
	   ?>	

	</div><!-- .wrapper -->

	<?php
		/** 
		 * attitude_after hook
		 */
		do_action( 'attitude_after' );
	?> 

<?php wp_footer(); ?>

</div>
<link rel="stylesheet" href="https://cdn.envybox.io/widget/cbk.css">
<script type="text/javascript" src="https://cdn.envybox.io/widget/cbk.js?wcb_code=b5a3ff97cc9af7b6098600850614905d" charset="UTF-8" async></script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-103813589-1', 'auto');
  ga('send', 'pageview');

</script>

<script type="text/javascript">
    jQuery(document).on('click', 'a.eModal-1', function() {
		yaCounter37722504.reachGoal('call-in-head');
		//return false;
	});
	jQuery('div#eModal-1').on('click', 'input.wpcf7-form-control.wpcf7-submit', function() {
		yaCounter37722504.reachGoal('call-in-head-send');
		//alert('1');
		//return false;
	});
	jQuery('div#wpcf7-f89-p323-o1').on('click', 'input.wpcf7-form-control.wpcf7-submit', function() {
		yaCounter37722504.reachGoal('write-to-us');
		//alert('1');
		//return false;
	});
	jQuery('div#wpcf7-f843-p323-o2').on('click', 'input.wpcf7-form-control.wpcf7-submit', function() {
		yaCounter37722504.reachGoal('call-five-send');
		//alert('1');
		//return false;
	});
	jQuery('div#wpcf7-f843-p154-o2').on('click', 'input.wpcf7-form-control.wpcf7-submit', function() {
		yaCounter37722504.reachGoal('call-five-send');
		//alert('1');
		//return false;
	});
	jQuery('div#wpcf7-f91-p154-o1').on('click', 'input.wpcf7-form-control.wpcf7-submit', function() {
		yaCounter37722504.reachGoal('order-service-send');
		//alert('1');
		//return false;
	});
</script>

</body>
</html>