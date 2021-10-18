function getURLVar(key) {
    var value = [];

    var query = document.location.search.split('?');
    console.log(query);
    if (query[1]) {
        var part = query[1].split('&');

        for (i = 0; i < part.length; i++) {
            var data = part[i].split('=');

            if (data[0] && data[1]) {
                value[data[0]] = data[1];
            }
        }
        if (value[key]) {
            return value[key];
        } else {
            return '';
        }
    }
}

$(document).ready(function () {
    (function () {
        var max = 0;
        $('.catmenu .name').each(function (_, el) {
            if (max < $(el).height()) {
                max = $(el).height()
            }
        })
        $('.catmenu .name').each(function (_, el) {
            $(el).height(max)
        })
    })()
    $('#mob-menu .has-children').on('click', function (e) {
        e.preventDefault()
        if ($(this).hasClass('opened')) {
            $(this).siblings('.subcat').removeClass('show')
        } else {
            $(this).siblings('.subcat').addClass('show')
        }
        $(this).toggleClass('opened')
    })
    $('.price-sort').click(function () {
        var location = window.location;
        var origin = location.origin;
        var basename = location.pathname;
        var url = origin + basename;
        var sort = getURLVar('sort');
        var sort_url = '';
        var search_url = '?';
        var search = getURLVar('search');
        if (search.length > 0) {
            search_url = search_url + 'search=' + search + '&&'
        }
        if (sort === 'price') {
            sort_url = 'sort=-price';
        } else {
            sort_url = 'sort=price';
        }
        window.location.href = url + search_url + sort_url + '#wrapper';
    });
    $('.delivery-sort').click(function () {
        var location = window.location;
        var origin = location.origin;
        var basename = location.pathname;
        var url = origin + basename;
        var sort = getURLVar('sort');
        var sort_url = '';
        var search_url = '?';
        var search = getURLVar('search');
        if (search.length > 0) {
            search_url = search_url + 'search=' + search + '&&'
        }
        if (sort === 'delivery') {
            sort_url = 'sort=-delivery';
        } else {
            sort_url = 'sort=delivery';
        }
        window.location.href = url + search_url + sort_url + '#wrapper';
    });

    /* Search */
    $('#search input').on('keydown', function (e) {
        if (e.keyCode == 13) $('#search i').trigger('click');
    });

    $('#search i').click(function () {
        $('#search').addClass('active');
        var value = $('#search input').val();
        if (value) {
            url = $('base').attr('href') + 'index.php?route=product/search&search=' + encodeURIComponent(value);
            location = url;
        } else {
            $('#search').find('input').focus();
        }
    });


    var now_url = location.href;
    $.each($('a'), function () {
        if ($(this).attr('href') == now_url) {
            $(this).addClass('active');
        }
    });

    $('input.brand-check').prop('checked', true);

    function filter() {
        var wrap = $('#wrapper');
        var price_begin = wrap.find('#price-begin').val();
        var price_end = wrap.find('#price-end').val();
        var days = wrap.find('input[name=radio-check]:checked').val();
        var dealer = wrap.find('input[name=radio-dealer]:checked').val();
        var brands = wrap.find('input.brand-check');
        foreach(price_begin, price_end, days, dealer, brands)
    }

    function foreach(price_begin, price_end, days, dealer, brands) {
        var wrap = $('#wrapper table tbody tr');
        brands.each(function () {
            var brand_this = $(this);
            if (brand_this.is(":checked")) {
                childShow(brand_this.data('brand'));
            } else {
                childHide(brand_this.data('brand'));
            }
        });
        wrap.each(function () {
            var _this = $(this);
            if (price_begin.length > 0 && _this.data('price') < price_begin) {
                _this.hide();
            }
            if (price_end.length > 0 && _this.data('price') > price_end) {
                _this.hide();
            }
            if (price_begin.length > 0 && price_end.length > 0 && (_this.data('price') < price_end && _this.data('price') > price_begin)) {
                _this.show();
            }
            if (_this.data('days') > days) {
                _this.hide();
            }
        });
        brands.each(function () {
            var brand_this = $(this);
            decalculate(brand_this.data('brand'));
        });
    }

    function childHide(brand) {
        var child = $('#wrapper table tbody tr.childs-parent-' + brand + '');
        child.each(function (index, key) {
                $(this).hide();
            }
        )
    }

    function childShow(brand) {
        var child = $('#wrapper table tbody tr.childs-parent-' + brand + '');
        child.each(function (index) {
                if (index < 3) {
                    $(this).show();
                } else {
                    return false;
                }
            }
        )
    }

    function decalculate(brand) {
        var child = $('#wrapper table tbody tr.childs-parent-' + brand + ':visible');
        var all_childs = $('#wrapper table tbody tr.childs-parent-' + brand + '');
        var parent_count = $('#wrapper table tbody tr.parent-' + brand + '');
        var count = $('.child-count-' + brand + '');
        count.show();
        parent_count.show();
        if (child.length >= 3) {
            var math = Math.abs(all_childs.length - 3);
            count.find('.open-data').html('Показать еще ' + math + '<span></span>');
            count.attr('data-count', math);
            parent_count.find('.td-order').text(Math.abs(all_childs.length) + ' предложений')
        } else {
            if (child.length === 0) {
                parent_count.hide();
            } else {
                parent_count.find('.td-order').text(Math.abs(child.length) + ' предложений')
            }
            count.hide();
        }
    }


    $('#price-begin').on('keyup', function () {
        filter()
    });
    $('#price-end').on('keyup', function () {
        filter()
    });
    $('input[name=radio-check]:checked').on('change', function () {
        filter()
    });
    $('input[name=radio-dealer]:checked').on('change', function () {
        filter()
    });
    $('input.Checkbox__checkbox___3XTjs').on('change', function () {
        filter()
    });
    $('input.brand-check').on('change', function () {
        filter();
    });

    $('.open-data').on('click', function () {
        var parents_tr = $(this).parents('tr');
        var data_count = parents_tr.data('count');
        var data_brand = parents_tr.data('parent');
        if ($(".toggleclass.childs-parent-" + data_brand + ':visible').length < 3) {
            $(this).text('Закрыть');
            $(".hidden.childs-parent-" + data_brand).show();
        } else {
            $(".toggleclass.childs-parent-" + data_brand).hide('hidden');
            $(this).text('Показать еще ' + data_count + ' предложения');
        }
    });

    var x_block = $('#header');
    var x_height = $(x_block).outerHeight();
    $(x_block).find('#logo').after('<ul class="menu"><li class="is-submenu flyblock-parent">' + $('.menu li:first-child').html() + '</li></ul>');

    $(window).scroll(function () {
        if ($(this).scrollTop() > 240) {
            $('body').css({'padding-top': x_height});
            $(x_block).addClass('fixed');
        } else {
            $('body').css({'padding-top': 0});
            $(x_block).removeClass('fixed');
        }
    });


    $('#grid-view').click(function () {
        $('#display *').attr('class', '');
        $(this).attr('class', 'active');
        $('#content .product-list, #content .product-list2').attr('class', 'product-grid');
        localStorage.setItem('display', 'grid');
    });

    $('#list-view').click(function () {
        $('#display *').attr('class', '');
        $(this).attr('class', 'active');
        $('#content .product-grid, #content .product-list2').attr('class', 'product-list');
        localStorage.setItem('display', 'list');
    });

    $('#list-view2').click(function () {
        $('#display *').attr('class', '');
        $(this).attr('class', 'active');
        $('#content .product-grid, #content .product-list').attr('class', 'product-list2');
        localStorage.setItem('display', 'list2');
    });

    if (localStorage.getItem('display') == 'list') {
        $('#list-view').trigger('click').attr('class', 'active');
    } else if (localStorage.getItem('display') == 'list2') {
        $('#list-view2').trigger('click').attr('class', 'active');
    } else {
        $('#grid-view').trigger('click').attr('class', 'active');
    }


    $('.mobile-arrow').click(function () {
        $(this).toggleClass('krest').next().toggle(320, function () {
        });
        // $('#menu').toggle( "slow", function() {});
    });


    if ($('.htabs').length) {

        $('.htabs').each(function (index, element) {


            var selector = $(this).find('a');

            $(selector).each(function () {
                var obj = $(this);

                $(obj.attr('href')).hide();

                obj.click(function () {
                    $(selector).removeClass('selected');

                    $(this).addClass('selected');

                    $($(this).attr('href')).fadeIn();

                    $(selector).not(this).each(function (i, element) {
                        $($(element).attr('href')).hide();
                    });

                    return false;
                });
            });

            //$(this).show();

            $(selector).first().click();


        });

    }


    if ($(window).width() < 682) {
        $('.flyblock-parent').click(function () {
            $(this).find('.flyblock').toggle('slow');
        });
    }


    $('footer').prepend('<div id="scrollup">Запчасти для грузовых автомобилей с доставкой по России - ST-Spares.ru</div>');
    // $('footer').prepend('<div id="scrollup"><span>В начало страницы</span></div>');
    // $('#scrollup').click(function () {
    //     $('html, body').animate({scrollTop: 0}, 'slow');
    //     return false;
    // });

    // ===== Scroll to Top byAF ====
    $('footer').prepend('<a href="javascript:" id="return-to-top"><i>&#8593;</i></a>');
    $(window).scroll(function () {
        if ($(this).scrollTop() >= 50) {        // If page is scrolled more than 50px
            $('#return-to-top').fadeIn(200);    // Fade in the arrow
        } else {
            $('#return-to-top').fadeOut(200);   // Else fade out the arrow
        }
    });
    $('#return-to-top').click(function () {      // When arrow is clicked
        $('body,html').animate({
            scrollTop: 0                       // Scroll to top of body
        }, 500);
    });


    $('#cart').click(function () {
        $('#fastblock').html($('#flycart').html());
        ShowImage();
        $('#fastblock > div').attr('class', 'right');
    });


    $(document).on('click', '#flycart-content .qu-minus', function () {
        var input = $(this).next('input');
        var input_val = parseInt(input.val());
        var prod_key = input.data('key');

        if (input_val > 1) {
            input.val(input_val - 1);
            cart.update(prod_key, input_val - 1, 0);
        } else {
            cart.remove(prod_key);
        }
    });

    $(document).on('click', '#flycart-content .qu-plus', function () {
        var input = $(this).prev('input');
        var input_val = parseInt(input.val());
        var prod_key = input.data('key');

        input.val(input_val + 1);
        cart.update(prod_key, input_val + 1, 0);
    });


    $(document).on('click', '#button-cart', function () {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function () {
            },
            complete: function () {
            },
            success: function (json) {
                $('.alert, .text-danger').remove();
                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            $('#input-option' + i.replace('_', '-')).append('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                        }
                    }
                    if (json['error']['recurring']) $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                }

                if (json['success']) {
                    $('#cart').load('index.php?route=common/cart/info #cart > *', function () {
                        $('#fastblock').html($('#flycart').html());
                        ShowImage();
                        $('#fastblock > div').attr('class', 'right');
                    });
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
    $(document).on('click', '.button-cart-analog', function () {
        var product_id = $("#product input[type='hidden']").val();
        var analog_id = $(this).parents('tr').data('id');
        var article = $(this).parents('tr').data('article');
        var quantity = $(this).parents('form').find('input').val();
        var price = $(this).parents('tr').data('price');
        var name = $(this).parents('tr').data('name');
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: {
                product_id: product_id,
                article: article,
                analog_id: analog_id,
                quantity: quantity,
                name: name,
                price: price
            },
            dataType: 'json',
            beforeSend: function () {
            },
            complete: function () {
            },
            success: function (json) {
                $('.alert, .text-danger').remove();
                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            $('#input-option' + i.replace('_', '-')).append('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                        }
                    }
                    if (json['error']['recurring']) $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                }

                if (json['success']) {
                    $('#cart').load('index.php?route=common/cart/info #cart > *', function () {
                        $('#fastblock').html($('#flycart').html());
                        ShowImage();
                        $('#fastblock > div').attr('class', 'right');
                    });
                }
            },
        });
    });
});

// Cart add remove functions
var cart = {
    'add': function (product_id, quantity) {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: 'product_id=' + product_id + '&quantity=' + (typeof (quantity) != 'undefined' ? quantity : 1),
            dataType: 'json',
            beforeSend: function () {
            },
            complete: function () {
            },
            success: function (json) {
                if (json['redirect']) location = json['redirect'];

                if (json['success']) {
                    $('#cart').load('index.php?route=common/cart/info #cart > *', function () {
                        $('#fastblock').html($('#flycart').html());
                        ShowImage();
                        $('#fastblock > div').attr('class', 'right');
                    });
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    },
    'update': function (key, quantity, isarray) {
        $.ajax({
            url: 'index.php?route=checkout/cart/edit',
            type: 'post',
            data: 'key=' + key + '&quantity=' + (typeof (quantity) != 'undefined' ? quantity : 1) + (typeof (isarray) != 'undefined' ? '&isarray=0' : ''),
            dataType: 'json',
            beforeSend: function () {
            },
            complete: function () {
            },
            success: function (json) {

                if (getURLVar('route') == 'checkout/buy' || getURLVar('route') == 'checkout/checkout') {
                    location = 'index.php?route=checkout/buy';
                } else {
                    $('#cart').load('index.php?route=common/cart/info #cart > *', function () {
                        $('#fastblock > div').html($('#flycart').html() + '<i class="close x"></i>');
                    });

                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    },
    'remove': function (key) {
        $.ajax({
            url: 'index.php?route=checkout/cart/remove',
            type: 'post',
            data: 'key=' + key,
            dataType: 'json',
            beforeSend: function () {
            },
            complete: function () {
            },
            success: function (json) {

                if (getURLVar('route') == 'checkout/buy' || getURLVar('route') == 'checkout/checkout') {
                    location = 'index.php?route=checkout/buy';
                } else {
                    $('#cart').load('index.php?route=common/cart/info #cart > *', function () {
                        $('#fastblock > div').html($('#flycart').html() + '<i class="close x"></i>');
                    });
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }
}

var voucher = {
    'add': function () {

    },
    'remove': function (key) {
        $.ajax({
            url: 'index.php?route=checkout/cart/remove',
            type: 'post',
            data: 'key=' + key,
            dataType: 'json',
            beforeSend: function () {
            },
            complete: function () {
            },
            success: function (json) {

                if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
                    location = 'index.php?route=checkout/cart';
                } else {
                    $('#cart').load('index.php?route=common/cart/info #cart > *');
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }
}


var wishlist = {
    'add': function (product_id) {
        $.ajax({
            url: 'index.php?route=account/wishlist/add',
            type: 'post',
            data: 'product_id=' + product_id,
            dataType: 'json',
            success: function (json) {
                $('.alert').remove();

                if (json['redirect']) location = json['redirect'];

                if (json['success']) {
                    $('#fastblock').html(json['success']);
                    ShowImage();
                    $('#wishlist-total').html(json['total']);
                    setTimeout(function () {
                        $('#fastblock .close').click();
                    }, 3000);
                }

            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    },
    'remove': function () {

    }
}

var compare = {
    'add': function (product_id) {
        $.ajax({
            url: 'index.php?route=product/compare/add',
            type: 'post',
            data: 'product_id=' + product_id,
            dataType: 'json',
            success: function (json) {
                $('.alert').remove();

                if (json['success']) {
                    $('#fastblock').html(json['success']);
                    ShowImage();
                    $('#compare-total').html(json['total']);
                    setTimeout(function () {
                        $('#fastblock .close').click();
                    }, 2200);
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    },
    'remove': function () {

    }
}


function quickview(product_url) {
    $('#loading').css({display: 'block'});
    $('#fastblock').load(product_url + ' #product',
        function () {
            ShowImage();
            $('#fastblock > div').css({'max-width': '1100px'}).find('#reviews-box').remove();
        }
    );
}


$(document).on('click', '#fastblock .thumbnails .images > div + div img', function () {

    var big_img = $('#fastblock .thumbnails .images > div:first-child img');
    var img = $(this);

    var big_img_src = $(big_img).attr('src');
    var img_src = $(this).attr('src');

    $(big_img).attr('src', img_src);
    $(img).attr('src', big_img_src);

});