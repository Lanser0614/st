$(document).ready(function() {

$('body').append('<div id="overlay"></div>');
$('body').append('<div id="loading"></div>');
$('body').append('<div id="fastblock"></div>');


var fastorder_html = '<form onsubmit="return false;"><div class="title"></div><div class="elem"><input type="text" name="name" value="" placeholder="Ваше имя" /></div><div class="elem"><input type="text" name="phone" value="" placeholder="Телефон *" class="requir" /></div><div class="elem"><textarea rows="2" name="info" placeholder="Комментарий к заказу"></textarea></div><div class="sbmt"><span class="btn goform">Отправить</span></div><label class="privacy-policy"><input type="checkbox" checked="checked" /><span>Согласен на обработку персональных данных</span></label><input type="hidden" name="data_url" value="" /><input type="hidden" name="product" value="" /><input type="hidden" name="title" value="" /><input type="hidden" name="dopinfo" value="" /></form>';

var callme_html = '<form onsubmit="return false;"><div class="title">Заказать звонок</div><div class="elem"><input type="text" name="name" value="" placeholder="Ваше имя" /></div><div class="elem"><input type="text" name="phone" value="" placeholder="Телефон *" class="requir" /></div><div class="sbmt"><span class="btn goform">Отправить</span></div><label class="privacy-policy"><input type="checkbox" checked="checked" /><span>Согласен на обработку персональных данных</span></label><input type="hidden" name="title" value="Заказ звонка" /></form>';


$(document).on('click', '.fastorder', function(e){
		var url = $(this).attr('data-url');
		var name = $(this).attr('data-name');
		var title = 'Быстрый заказ';
		
		var dopinfo = '';
		$('.options input:checked').each(function() {
		  dopinfo += $(this).next().text() + ' | ';
	  });
		dopinfo += ' Количество: ' + parseInt($("input[name='quantity']").val());
		
		$('#fastblock').html(fastorder_html);
		ShowImage();
		$("#fastblock input[name='data_url']").val(url);
		$("#fastblock input[name='product']").val(name);
		$("#fastblock input[name='title']").val(title);
		$("#fastblock input[name='dopinfo']").val(dopinfo);
		$('#fastblock .title').html(title + ' <span>«' + name + '»</span>');
});


$('.callme').on('click', function(){
		$('#fastblock').html(callme_html);
		ShowImage();
});




$(document).on('click', '.goform', function(){
		var myblock = $(this).parents('form');
		
		if( !$('.privacy-policy input', myblock).is(':checked')) return false;
		
		$('.requir', myblock).removeClass('requir-bg-red');
		var error_var = false;
		
		$(myblock).find('.requir').each(function(index, element) {
		  if(!$(this).val()) {
					$(this).addClass('requir-bg-red');
					if(index == 0) $(element).focus();
					error_var = true;
			}
		});

		if( $("input[name='email'].requir", myblock).length && !/^\w+[a-zA-Z0-9_.-]*@{1}\w{1}[a-zA-Z0-9_.-]*\.{1}\w{2,4}$/.test($("input[name='email'].requir", myblock).val()) ) {
			$("input[name='email'].requir", myblock).addClass('requir-bg-red');
			error_var = true;
		}
		
		if(error_var) {
			return false;
		}
    
		var fastblock_width = $(myblock).width();
		
    $('.btn', myblock).addClass('close_loading');
        
				jQuery.ajax({
					type: 'post',
					caсhe: false,
					url: 'index.php?route=extension/module/fastblock',
					data: $(myblock).serialize(),
					dataType: 'json',
					success: function(json) {
			      if (json['success']) {
				      $(myblock).hide(300, function(){ $(this).html('<div class="fastblock-success">Спасибо!<br /> Мы свяжемся с Вами в ближайшее время.</div>').css('width', fastblock_width).show(400); });
							$('.btn', myblock).removeClass('close_loading');
							setTimeout(function(){$('#fastblock .close').click();}, 2100);
			      }	
		      }
				});

	});



});


function ShowImage(){
	  //$('#loading').css({display:'block'});
		
		$('#fastblock').html('<div>' + $('#fastblock').html() + '<i class="close x"></i></div>').fadeOut(40).click(
		     function(event){
           if( $(event.target).closest('#fastblock div').length ) return;
           $('#fastblock .close').trigger('click');
         }
	  );
		
		$('#overlay').fadeIn(160, function() {
		     $('#fastblock').css({"top":$(window).scrollTop() + "px", "display":"flex"}).fadeIn(320);
				 $('#fastblock > div').css({'margin-top':0});
				 $('#loading').css('display','none');
				 
				 if($('#fastblock > div').offset().top < 0) $('#fastblock > div').css({'top':($('#fastblock > div').offset().top * -1)});
				 
		}).click(function(){ $('#fastblock .close').trigger('click'); });
    
    $(document).on('click', '#fastblock .close', function(){
		  $('#overlay').fadeOut(140);
			$('#fastblock > div').css({'margin-top':'-100px'});
			$('#fastblock').fadeOut(140).prop('class','');
	  });
	
}

