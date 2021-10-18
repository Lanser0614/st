$(document).ready(function() {

  $('#checkout-form select[name=\'country_id\']').on('change', function () {
      console.log('zone');
        getZones();
  });
    console.log('change');
  $('#checkout-form select[name=\'country_id\']').trigger('change');
	
	
  $('#button-order').click(function () {
        $.ajax({
            url: 'index.php?route='+ocpb_params['module_address']+'/save',
            type: 'post',
            data: $('#checkout-form .main-form input[type=\'text\'], #checkout-form input[type=\'checkbox\']:checked, #checkout-form select, #checkout-form input[type=\'radio\']:checked, #checkout-form textarea, #checkout-form .main-form input[type=\'hidden\'], #checkout-form .main-form input[type=\'password\']'),
            dataType: 'json',
            beforeSend: function () {
                //$('#button-order').button('loading');
            },
            success: function (json) {
                $('.error').remove();
                $('.alert-danger').remove();
                /*if (json['redirect']) {
                    location = json['redirect'];
                }*/
                if (json['error']) {
                    $('#checkout-form .has-error').removeClass('has-error');
                    $('#checkout-form .text-danger').remove();
                    if (json['error']['warning']) {
                        addWarning(json['error']['warning']);
                    }
                    if (json['error']['warning_top']) {
                        addWarningTop(json['error']['warning_top']);
                        $('html, body').animate({
                            scrollTop: $(".ocpb-alert").offset().top - 15
                        }, {
                            duration: 500,
                            complete: function () {
                                $('.ocpb-alert').animate({opacity: 0}, 100).animate({opacity: 1}, 100);
                            }
                        });
                    } else {
                        $('html, body').animate({
                            scrollTop: $("#checkout-form").offset().top - 15
                        }, {
                            duration: 500,
                            complete: function () {
                                $('.has-error').animate({opacity: 0}, 100).animate({opacity: 1}, 100);
                            }
                        });
                    }
                    if (json['error']['firstname']) {
                        addError('#input-payment-firstname', json['error']['firstname']);
                    }
                    if (json['error']['lastname']) {
                        addError('#input-payment-lastname', json['error']['lastname']);
                    }
                    if (json['error']['email']) {
                        addError('#input-payment-email', json['error']['email']);
                    }
                    if (json['error']['telephone']) {
                        addError('#input-payment-telephone', json['error']['telephone']);
                    }
                    if (json['error']['fax']) {
                        addError('#input-payment-fax', json['error']['fax']);
                    }
                    if (json['error']['company']) {
                        addError('#input-payment-company', json['error']['company']);
                    }
                    if (json['error']['country']) {
                        addError('#input-payment-country', json['error']['country']);
                    }
                    if (json['error']['zone']) {
                        addError('#input-payment-zone', json['error']['zone']);
                    }
                    if (json['error']['city']) {
                        addError('#input-payment-city', json['error']['city']);
                    }
                    if (json['error']['postcode']) {
                        addError('#input-payment-postcode', json['error']['postcode']);
                    }
                    if (json['error']['address_1']) {
                        addError('#input-payment-address-1', json['error']['address_1']);
                    }
                    if (json['error']['password_empty']) {
                        addError('#input-password2', json['error']['password_empty']);
                        $('#input-password1').parent().addClass('has-error');
                    }
                    if (json['error']['password_equal']) {
                        addError('#input-password2', json['error']['password_equal']);
                        $('#input-password1').parent().addClass('has-error');
                    }
                    if(ocpb_params['required_custom_fields'].length) {
                        $(ocpb_params['required_custom_fields']).each(function (indx, val) {
                            if (json['error']['custom_field' + val]) {
                                addError('#input-payment-custom-field' + val, json['error']['custom_field' + val]);
                                $('#input-payment-custom-field' + val).parent().addClass('has-error');
                            }
                        });
                    }
                    //$('#button-order').button('reset');
                    $('.wait').remove();
                } else {
                    $.ajax({
                        url: 'index.php?route='+ocpb_params['module_address']+'/confirm',
                        type: 'get',
                        dataType: 'json',
                        success: function () {
                            var code = $('#checkout-form input[name=\'payment_method\']:checked').val();
                            getPaymentForm(code, function () {

                                if ($('p,h1,h2,h3,input[type=text],input[type=radio],input[type=checkbox],input[type=password],select', $('#payment-form')).length > 0) {
                                    $('#payment-form').css('display', 'block');
                                    //$('#button-order').button('reset');
                                } else {
                                    var payment_form = $('#payment-form form#payment');

                                    if (payment_form.length) {
                                        payment_form.submit();
                                    } else {
                                        var href = $('#payment-form div.buttons a').attr('href');
                                        if (typeof href != 'undefined' && href != '' && href != '#') {
                                            location = href;
                                        } else {
                                            $('#payment-form div.buttons a,#payment-form div.buttons input[type=button],#payment-form div.buttons input[type=submit],#payment-form form input[type=submit]').click();
                                        }
                                    }
                                }
                            });
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            alert(thrownError);
                        }
                    });
                }
            }
        });
  });


  $('#button-oneclick').on('click', function () {
        $.ajax({
            async: false,
            cache: false,
            url: 'index.php?route='+ocpb_params['module_address']+'/oneclick',
            type: 'post',
            data: $('.ocpb-oneclick input'),
            dataType: 'json',
            beforeSend: function () {
                //$('#button-oneclick').button('loading');
            },
            success: function (json) {
                if (json['error']) {
                    $('.ocpb-oneclick .form-group').removeClass('has-error');
                    if (json['error']['firstname']) {
                        $('.ocpb-oneclick input[name="firstname"]').parent().addClass('has-error').animate({opacity: 0}, 100).animate({opacity: 1}, 100);
                    }
                    if (json['error']['telephone']) {
                        $('.ocpb-oneclick input[name="telephone"]').parent().addClass('has-error').animate({opacity: 0}, 100).animate({opacity: 1}, 100);
                    }
                    //$('#button-oneclick').button('reset');
                }
                if (json['success']) {
                    window.location = 'index.php?route=checkout/success';
                }
            }
        });
  });


  if (ocpb_params['telephone_mask']){
        $("#checkout-form input[name='telephone']").mask(ocpb_params['telephone_mask']);
	}


  $('.ocpb-products input[name^=quantity]').on('input', function(){
        var qty = parseInt($(this).val()) || 0;
        if(qty > 0){
            updateQty($(this).data('cart-id'), '=');
        }
  });
  $('.ocpb-products input[name^=quantity]').on('focusout', function(){
        var qty = parseInt($(this).val()) || 0;
        if(qty <= 0){
            $(this).val('1');
            updateQty($(this).data('cart-id'), '=');
        }
  });

	
	if(!ocpb_params['customer_logged']){
			$('.customer-type label').on('click', function(){
				$('.customer-type label input').prop('checked', false);
				$('.customer-type label').removeClass('checked');
				$(this).children('input').prop('checked', true);
				$(this).addClass('checked');
				if($(this).children('input').val() == '0'){
					$('.ocpb-login-form, .ocpb-login-bg').show();
				}else{
					$('.ocpb-login-form, .ocpb-login-bg').hide();
				}
			});

			$('#checkout-form input[name="register"]').on('change', function(){
				if($(this).is(':checked')){
					$('.register-fields').removeClass('hidden');
					if(!ocpb_params['email_required']) {
						$('#checkout-form .main-form .email').addClass('required');
					}
				}else{
					$('.register-fields').addClass('hidden');
					if(!ocpb_params['email_required']) {
						$('#checkout-form .main-form .email').removeClass('required');
					}
				}
			});
	}
    if($('#checkout-form input[name=\'city\']').length) {
        $('#checkout-form input[name=\'city\']').on('focusout', function(){
            updateMethods();
        });
    }
    if($('#checkout-form select[name=\'zone_id\']').length) {
        $('#checkout-form select[name=\'zone_id\']').on('change', function(){
            updateMethods();
        });
    }


//Coupon
  $('.button-coupon').on('click', function() {
        $.ajax({
            url: 'index.php?route=extension/total/coupon/coupon',
            type: 'post',
            data: 'coupon=' + encodeURIComponent($(this).prev('input').val()),
            dataType: 'json',
            beforeSend: function() {
                //$('#button-coupon').button('loading');
            },
            complete: function() {
               // $('#button-coupon').button('reset');
            },
            success: function(json) {
                $('.alert').remove();

                if (json['error']) {
                    addWarningTop(json['error']);
                    $('.ocpb-products').removeClass('with-coupon');
                }else {
                    addSuccessTop(ocpb_params['text_coupon_success']);
                    selectShipping();
                    $('.ocpb-products').addClass('with-coupon');
                }
            }
        });
  });


//Voucher
  $('.button-voucher').on('click', function() {
        $.ajax({
            url: 'index.php?route=extension/total/voucher/voucher',
            type: 'post',
            data: 'voucher=' + encodeURIComponent($(this).prev('input').val()),
            dataType: 'json',
            beforeSend: function() {
                //$('#button-voucher').button('loading');
            },
            complete: function() {
                //$('#button-voucher').button('reset');
            },
            success: function(json) {
                $('.alert').remove();

                if (json['error']) {
                    addWarningTop(json['error']);
                    $('.ocpb-products').removeClass('with-coupon');
                }else {
                    addSuccessTop(ocpb_params['text_voucher_success']);
                    selectShipping();
                    $('.ocpb-products').addClass('with-coupon');
                }
            }
        });
  });


  $('#checkout-form .main-form input[type=\'text\'], #checkout-form input[type=\'checkbox\'], #checkout-form textarea, #checkout-form .main-form input[type=\'hidden\'], #checkout-form .main-form select').on('change', function(){
        $.ajax({
            url: 'index.php?route='+ocpb_params['module_address']+'/save',
            type: 'post',
            data: $('#checkout-form .main-form input[type=\'text\'], #checkout-form input[type=\'checkbox\']:checked, #checkout-form input[type=\'radio\']:checked, #checkout-form textarea, #checkout-form .main-form input[type=\'hidden\'], #checkout-form .main-form input[type=\'password\'], #checkout-form .main-form select'),
            dataType: 'json',
            beforeSend: function() {
            },
            success: function(json) {
            }
        });
    });

    selectShipping();

    if(ocpb_params['zone_status'] == 1) {
        getZones();
    }
  });



function updateMethods() {
    console.log('qwe');
    var country_id = ($('#checkout-form select[name=\'country_id\'] option:selected').length) ? $('#checkout-form select[name=\'country_id\'] option:selected').val() : '';
    var zone_id = ($('#checkout-form select[name=\'zone_id\'] option:selected').length) ? $('#checkout-form select[name=\'zone_id\'] option:selected').val() : '';
    var city = ($('#checkout-form input[name=\'city\']').length) ? $('#checkout-form input[name=\'city\']').val() : '';
    var postcode = ($('#checkout-form input[name=\'postcode\']').length) ? $('#checkout-form input[name=\'postcode\']').val() : '';

	if(ocpb_params['shipping_select']){
	    console.log('shipping select');
        $.ajax({
            url: 'index.php?route='+ocpb_params['module_address']+'/getShippingMethods',
            type: 'post',
            data: 'zone_id=' + zone_id + '&country_id=' + country_id + '&city=' + city + '&postcode=' + postcode,
            dataType: 'html',
            beforeSend: function() {
            },
            success: function(html) {
                $('#shipping-methods').html(html);
                $('#shm_loading').empty();
                selectShipping();
            }
        });
    }else{
        selectShipping();
          console.log('shipping select');
    }
    if(ocpb_params['payment_select']) {
        $.ajax({
            url: 'index.php?route=' + ocpb_params['module_address'] + '/getPaymentMethods',
            type: 'post',
            data: 'zone_id=' + zone_id + '&country_id=' + country_id + '&city=' + city + '&postcode=' + postcode,
            dataType: 'html',
            beforeSend: function () {
            },
            success: function (html) {
                $('#payment-methods').html(html);
                $('#pay_loading').empty();
            }
        });
    }
}

function getPaymentForm(code, callback) {
    $.ajax({
        async: false,
        cache: false,
        url: 'index.php?route='+ocpb_params['module_address']+'/getPaymentForm',
        type: 'post',
        data: 'code=' + code.split('.')[0] + '&payment_method=' + code,
        dataType: 'json',
        success: function(json) {
            $('#payment_form2').html(json['output']);
            callback();
        }
    });
}

function getPaymentForm(code, callback) {
    $.ajax({
        async: false,
        cache: false,
        url: 'index.php?route='+ocpb_params['module_address']+'/getPaymentForm',
        type: 'post',
        data: 'code=' + code.split('.')[0] + '&payment_method=' + code,
        dataType: 'json',
        success: function(json) {
            $('#payment-form').html(json['output']);
            callback();
        }
    });
}

function addWarning(text) {
    $('#checkout-form .alert').remove();
    $('#checkout-form .main-form').before('<div class="alert alert-danger ocpb-alert"><i class="fa fa-exclamation-circle"></i> ' + text + '</div>');
    $('html, body').animate({
        scrollTop: $("#checkout-form").offset().top - 15
    }, {
        duration: 500,
        complete: function() {
            $('#checkout-form .alert').animate({opacity: 0}, 100).animate({opacity: 1}, 100);
        }
    });

}

function addWarningTop(text) {
    $('.alert').remove();
    $('.ocpb-products').before('<div class="alert alert-danger ocpb-alert"><i class="fa fa-exclamation-circle"></i> ' + text + '</div>');
    $('.ocpb-alert').animate({opacity: 0}, 100).animate({opacity: 1}, 100);

}

function addSuccessTop(text) {
    $('.alert').remove();
    $('.ocpb-products').before('<div class="alert alert-success ocpb-alert"><i class="fa fa-exclamation-circle"></i> ' + text + '</div>');
    $('.ocpb-alert').animate({opacity: 0}, 100).animate({opacity: 1}, 100);

}

function addError(el, text) {
    $(el).parent().addClass('has-error');
    $(el).after('<div class="text-danger" style="position:absolute; top:100%; left:0px; margin-top:-16px; font-size:11px;">' + text + '</div>');
}

function selectShipping(){
    if($('#shipping-methods').length && $('#shipping-methods').html().length){
        var t_url = 'index.php?route='+ocpb_params['module_address']+'/selectShipping';
         
    }else{
        var t_url = 'index.php?route='+ocpb_params['module_address']+'/getTotals';
    }
    $.ajax({
        async: false,
        cache: false,
        url: t_url,
        type: 'post',
        data: 'code='+$('input[name="shipping_method"]:checked').val(),
        dataType: 'json',
        success: function(json) {
            if(json['totals']){
                var html = '';
                var html_m = '';
                var container = $('table.total-items');

                $.each(json['totals'], function(key, totals){

                    html += '<tr class="total-' + totals['code'] + '"><td class="title">'+totals['title']+':</td><td class="value right">'+totals['total']+'</td></tr>';

                    //html_m += '<tr class="total-item total-item-'+key+'"><td class="text-right total-title" colspan="3"><strong>'+totals['title']+':</strong></td><td class="text-right">'+totals['total']+'</td></tr>';
                });

                container.children('tbody').html(html);
                //$('.table-totals tbody').html(html_m);
                //$('.ocpb-totals tbody').html(html_m);
                //$('.ocpb-totals td').removeAttr('colspan');
                //if(json['totals'].length == 2){
                //    $('.ocpb-totals .total-item-0').hide();
                //}
            }
        }
    });
		
		
		hide_input();
}

function updateQty(cart_id, ac){
    if(ac !== '='){
        var qty_obj = $('.ocpb-products input[name="quantity[' + cart_id + ']"]');

        var qty = parseInt(qty_obj.val());

        if(ac == '+'){
            qty_obj.val(qty + 1);
        }else{
            if(qty > 1){
                qty_obj.val(qty - 1);
            }
        }
    }

    $.ajax({
        async: false,
        cache: false,
        url: 'index.php?route='+ocpb_params['module_address']+'/edit',
        type: 'post',
        data: $('.ocpb-products input[name="quantity[' + cart_id + ']"]'),
        dataType: 'json',
        success: function(json) {
            $.each(json['products'], function(key, totals){
                $('.ocpb-products input[name="quantity[' + key + ']"]').closest('tr').children('.name-td').children('span.text-danger').remove();
                $('.ocpb-products input[name="quantity[' + key + ']"]').closest('tr').children('.price-td').text(totals['price']);
                $('.ocpb-products input[name="quantity[' + key + ']"]').closest('tr').children('.total-td').text(totals['total']);
                if(totals['stock'] !== 1){
                    $('.ocpb-products input[name="quantity[' + key + ']"]').closest('tr').children('.name-td').children('a').after('<span class="text-danger">***</span>');
                }
            });
            if(json['warning']){
                addWarningTop(json['warning']);
            }else{
                $('.alert-danger').remove();
            }
						
						$('#cart').load('index.php?route=common/cart/info #cart > *');
            updateMethods();
        }
    });
}
function ocpb_cart_remove(key) {
    $.ajax({
        url: 'index.php?route=checkout/cart/remove',
        type: 'post',
        data: 'key=' + key,
        dataType: 'json',
        beforeSend: function() {
            //$('#cart > button').button('loading');
        },
        success: function(json) {
            //$('#cart > button').button('reset');
            $('#cart-total').html(json['total']);
            $('.ocpb-products input[name="quantity[' + key + ']"]').closest('tr').remove();
            if(typeof($('.ocpb-products input[name^=quantity]').val()) == 'undefined'){
                location = 'index.php?route=' + ocpb_params['module_address'];
            }else{
                $('#cart').load('index.php?route=common/cart/info #cart > *');
                updateMethods();
            }
        }
    });
}
function cart_clear(){
    $.ajax({
        async: false,
        cache: false,
        url: 'index.php?route='+ocpb_params['module_address']+'/clear',
        type: 'get',
        success: function() {
            location = 'index.php?route=' + ocpb_params['module_address'];
        }
    });
}



function getZones(){
    $.ajax({
        url: 'index.php?route=checkout/checkout/country&country_id=' + $('#checkout-form select[name=\'country_id\'] option:selected').val(),
        dataType: 'json',
        beforeSend: function () {
            $('#checkout-form #payment-zone').append('<span class="form-control-feedback"><i class="fa fa-circle-o-notch fa-spin"></i></span>');
        },
        complete: function () {
            $('#checkout-form #payment-zone .form-control-feedback').remove();
        },
        success: function (json) {
            console.log(json);
            if (json['postcode_required'] == '1') {
                $('#checkout-form input[name=\'postcode\']').parent().addClass('required');
            } else {
                $('#checkout-form input[name=\'postcode\']').parent().removeClass('required');
            }

            html = '<option value="">' + ocpb_params['text_select'] + '</option>';

            if (json['zone']) {
                for (i = 0; i < json['zone'].length; i++) {
                    html += '<option value="' + json['zone'][i]['zone_id'] + '"';

                    if (ocpb_params['zone_id'].length) {
                        if (json['zone'][i]['zone_id'] == ocpb_params['zone_id']) {
                            html += ' selected="selected"';
                        }
                    }

                    html += '>' + json['zone'][i]['name'] + '</option>';
                }
            } else {
                html += '<option value="0" selected="selected">--none--</option>';
            }
          
            $('#checkout-form select[name=\'zone_id\']').html(html);
          
            var zone_id = $('#checkout-form select[name=\'zone_id\']').val();
         
            // if (zone_id) {
                updateMethods();
            // }
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}

function hide_input() {
  $('#checkout-form .hide-input').each(function() {
		$(this).parent().parent().find('input').remove();
		$(this).parent().addClass('no-input');
  });
}
