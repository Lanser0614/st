$(document).ready(function () {

    $('body').append('<div id="overlay"></div>');
    $('body').append('<div id="loading"></div>');
    $('body').append('<div id="fastblock"></div>');


    var fastorder_html = '<form onsubmit="return false;"><div class="title"></div><div class="elem"><input type="text" name="name" value="" placeholder="Ваше имя" class="requir"/></div><div class="elem"><input type="text" name="phone" value="" placeholder="Телефон *" class="requir" /></div><div class="elem"><textarea class="requir" rows="2" name="info" placeholder="Комментарий к заказу"></textarea></div><div class="sbmt"><span class="btn">Отправить</span></div><label class="privacy-policy"><input type="checkbox" checked="checked" /><span>Согласен на обработку персональных данных</span></label><input type="hidden" name="data_url" value="" /><input type="hidden" name="product" value="" /><input type="hidden" name="title" value="" /><input type="hidden" name="dopinfo" value="" /></form>';

    var callme_html = '<form onsubmit="return false;"><div class="title">Заказать звонок</div><div class="elem"><input type="text" name="name" value="" placeholder="Ваше имя" /></div><div class="elem"><input type="text" name="phone" value="" placeholder="Телефон *" class="requir" /></div><div class="sbmt"><span class="btn goform">Отправить</span></div><label class="privacy-policy"><input type="checkbox" checked="checked" /><span>Согласен на обработку персональных данных</span></label><input type="hidden" name="title" value="Заказ звонка" /></form>';

	var login_html = '<form  class="auth_phone_form"><input type="hidden" name="route" value="feed/rest_api/phone"/><div class="title">Войдите или зарегистрируйтесь,<br> чтобы продолжить</div><div class="elem"><input type="text" name="phone" value="" placeholder="Телефон *" class="requir" /></div><div class="sbmt"><button class="btn">Получить код</button></div><br/><p style="text-align:center"><a href="#" class="auth_email_link">Войти через email</a></p></form>';
	var login_html_email = '<form class="auth_email_form"><input type="hidden" name="route" value="feed/rest_api/email"/><div class="title">Войдите или зарегистрируйтесь,<br> чтобы продолжить</div><div class="elem"><input type="email" name="email" value="" placeholder="Email *" class="requir" /></div><div class="sbmt"><button class="btn">Получить код</button></div><br/><p style="text-align:center"><a href="#" class="auth_phone_link">Войти через SMS</a></p></form>';
	var login_html_code = '<form class="auth_code_form"><input type="hidden" name="route" value="feed/rest_api/code"/><div class="title">Введите код</div><div class="elem"><input type="text" name="code" value="" placeholder="Код *" class="requir" /></div><div class="sbmt"><button class="btn">Подтвердить</button></div></form>';
	
	$(document).on("submit", ".auth_phone_form", function(e) {
		e.preventDefault();
		let request = $(this).serialize();
		console.log(request);
		$.ajax({
			method: "GET",
			url:'/',
			data: request,
			success: function(response) {
				if( response.result == 'wait' ) {
					alert('Время ожидания еще не истекло, отправьте запрос позднее');
				} else {
					$('#fastblock').html(login_html_code);
					ShowImage();
				}
			},
			error: function() {
				alert('Произошла ошибка, попробуйте отправить запрос позднее');
			}
		});
	});
	
	$(document).on("submit", ".auth_email_form", function(e) {
		e.preventDefault();
		let request = $(this).serialize();
		
		$.ajax({
			method: "GET",
			url:'/index.php',
			data: request,
			success: function(response) {
				if( response.result == 'wait' ) {
					alert('Время ожидания еще не истекло, отправьте запрос позднее');
				} else {
					$('#fastblock').html(login_html_code);
					ShowImage();
				}
			},
			error: function() {
				alert('Произошла ошибка, попробуйте отправить запрос позднее');
			}
		});
	});
	
	let phone_tries = 3;
	$(document).on("submit", ".auth_code_form", function(e) {
		e.preventDefault();
		let request = $(this).serialize();
		
		$.ajax({
			method: "GET",
			url:'/index.php',
			data: request,
			success: function(response) {
				if( response.result == 'fail' ) {
					--phone_tries;
					if( phone_tries > 0 )
						alert('Введен неверный код. Осталось попыток: ' + phone_tries);
					else {
						alert('Истрачены все попытки, отправьте код заново');
						phone_tries = 3;
						$('#fastblock').html(login_html);
						ShowImage();
					}
				} else {
					document.location.reload();
				}
			},
			error: function() {
				alert('Произошла ошибка, попробуйте отправить запрос позднее');
			}
		});
	});
	
	$(document).on('click', '.auth_phone_link', function (e) {
        e.preventDefault();
		$('#fastblock').html(login_html);
        ShowImage();
    });
	
	$(document).on('click', '.auth_email_link', function (e) {
		e.preventDefault();
        $('#fastblock').html(login_html_email);
        ShowImage();
    });
	
    $(document).on('click', '.fastorder', function (e) {
        var url = $(this).attr('data-url');
        var name = $(this).attr('data-name');
        var title = 'Быстрый заказ';

        var dopinfo = '';
        $('.options input:checked').each(function () {
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


    $('.callme').on('click', function () {
        $('#fastblock').html(callme_html);
        ShowImage();
    });


    $(document).on('click', '.goform', function () {
        var myblock = $(this).parents('form');

        if (!$('.privacy-policy input', myblock).is(':checked')) return false;

        $('.requir', myblock).removeClass('requir-bg-red');
        var error_var = false;

        $(myblock).find('.requir').each(function (index, element) {
            if (!$(this).val()) {
                $(this).addClass('requir-bg-red');
                if (index == 0) $(element).focus();
                error_var = true;
            }
        });


        /*byAF*/
        /*Name validation*/
        var nameValue = $("input[name='name'].requir", myblock).val();
        if (nameValue.length != 0 && (nameValue.length < 5 || nameValue.length > 32)) {

            $("input[name='name'].requir + .temp__validation").remove();
            $("input[name='name'].requir", myblock)
                .after('<p class="temp__validation" style="color: red;">Имя должно быть от 5 до 32 символов</p>');

            error_var = true;
        } else {
            $("input[name='name'].requir + .temp__validation").remove();
        }

        /*Phone validation*/
        var phoneValue = $("input[name='phone'].requir", myblock).val();
        var phoneRegex = /[a-zA-Z]$/;
        if (phoneValue.length < 7 || phoneValue.length > 15 || phoneRegex.test(phoneValue)) {

            $("input[name='phone'].requir + .temp__validation").remove();
            $("input[name='phone'].requir", myblock)
                .after('<p class="temp__validation" style="color: red;">Номер телефона должно быть от 7 до 15 символов</p>');

            error_var = true;
        } else {
            $("input[name='phone'].requir + .temp__validation").remove();
        }
        /*endOfAF */


        if ($("input[name='email'].requir", myblock).length && !/^\w+[a-zA-Z0-9_.-]*@{1}\w{1}[a-zA-Z0-9_.-]*\.{1}\w{2,4}$/.test($("input[name='email'].requir", myblock).val())) {
            $("input[name='email'].requir", myblock).addClass('requir-bg-red');
            error_var = true;
        }

        if (error_var) {
            return false;
        }

        /*YM and GA*/
        gtag('event', 'oneclick', {'event_category': 'form'});
        ym(28448401, 'reachGoal', 'oneclick');
        /* end of YM and GA*/

        var fastblock_width = $(myblock).width();

        $('.btn', myblock).addClass('close_loading');

        jQuery.ajax({
            type: 'post',
            caсhe: false,
            url: 'index.php?route=extension/module/fastblock',
            data: $(myblock).serialize(),
            dataType: 'json',
            success: function (json) {
                if (json['success']) {
                    $(myblock).hide(300, function () {
                        $(this).html('<div class="fastblock-success">Спасибо!<br /> Мы свяжемся с Вами в ближайшее время.</div>').css('width', fastblock_width).show(400);
                    });
                    $('.btn', myblock).removeClass('close_loading');
                    setTimeout(function () {
                        $('#fastblock .close').click();
                    }, 2100);
                }
            }
        });

    });


});


function ShowImage() {
    //$('#loading').css({display:'block'});

    $('#fastblock').html('<div>' + $('#fastblock').html() + '<i class="close x"></i></div>').fadeOut(40).click(
        function (event) {
            if ($(event.target).closest('#fastblock div').length) return;
            $('#fastblock .close').trigger('click');
        }
    );

    $('#overlay').fadeIn(160, function () {
        $('#fastblock').css({"top": $(window).scrollTop() + "px", "display": "flex"}).fadeIn(320);
        $('#fastblock > div').css({'margin-top': 0});
        $('#loading').css('display', 'none');

        if ($('#fastblock > div').offset().top < 0) $('#fastblock > div').css({'top': ($('#fastblock > div').offset().top * -1)});

    }).click(function () {
        $('#fastblock .close').trigger('click');
    });

    $(document).on('click', '#fastblock .close', function () {
        $('#overlay').fadeOut(140);
        $('#fastblock > div').css({'margin-top': '-100px'});
        $('#fastblock').fadeOut(140).prop('class', '');
    });
    fimg = document.images;
    for (j = 0; j < fimg.length; j++) {
        fimg[j].galleryimg = "no";
        fimg[j].oncontextmenu = function () {
            return false;
        }
        fimg[j].ondragstart = function () {
            return false;
        }
    }

}
