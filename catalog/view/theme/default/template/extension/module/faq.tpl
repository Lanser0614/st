<?php echo $header; ?>

<style>
    .faq-section {
        background: #fdfdfd;
        min-height: 100vh;
        padding: 0;
    }

    .button.faq_button {
        color: white;
        background-color: #055187;
    }
    .button.red{
        cursor: pointer;
        margin-left: 2px;
        border-width: 1px;
        border-color:  #055187;
        float:left;padding:8px 15px 9px 15px;text-align:center;width:97px;position:relative;white-space:nowrap;
        color: #055187;
        background-color: white;
    }
    .button.red:hover{
        float:left;padding:9px 15px 10px 15px;text-align:center;width:97px;position:relative;white-space:nowrap;
        margin-left: 2px;
        border: none;
        color: white;
        background-color: #055187;
    }
    .button.medium{
        cursor: pointer;
        margin-left: 2px;
        border: none;
        float:left;padding:9px 15px 10px 15px;text-align:center;width:97px;position:relative;white-space:nowrap;
        color: white;
        background-color: #055187;
    }
    .faq_button:hover {
        background-color: #0072c3;
    }
    .faq-title h3{
        margin-top: 50px;
    }
    .faq_ask{border:1px solid #e5e5e5;padding:44px;}
    .faq_ask .form .form_footer{margin-bottom:0;}
    .button.faq_button{float:left;padding:9px 25px 10px 25px;text-align:center;text-decoration:none;width:auto;position:relative;white-space:nowrap;}
    .button.faq_button > span{display:inline;}
    .button.faq_button > span:last-of-type{display:none;}
    .button.faq_button.opened > span{display:none;}
    .button.faq_button.opened > span:last-of-type{display:inline;}
    .button.faq_button i{background:rgba(0, 0, 0, 0) url("images/arrows.png") repeat scroll 1px -441px;display:block;height:9px;left:18px;position:absolute;top:13px;width:12px;} .button.faq_button.opened i{background-position:-17px -441px;} .faq_desc{margin-left:183px;margin-top:-4px;} .faq_ask .form{margin:23px 0 0;} .faq_ask .form_head h4{display:none;} .faq-title h3 {
        position: relative;
        margin-bottom: 45px;
        display: inline-block;
        font-weight: 600;
        line-height: 1;
    }

    .form.inline.hide {
        display: none;
    }

    /* .faq-title h3::before {
        content: "";
        position: absolute;
        left: 15%;
        width: 60px;
        height: 2px;
        background: #055187;
        bottom: -25px;
        margin-left: -30px;
    } */
    .faq .card .card-header .faq-title .badge {
        display: none!important;
    }

    .faq-title p {
        padding: 0 190px;
        margin-bottom: 10px;
    }

    .faq {
        background: #FFFFFF;
        box-shadow: 0 2px 48px 0 rgba(0, 0, 0, 0.06);
        border-radius: 4px;
    }

    .faq .card {
        border: none;
        background: none;
        border-bottom: 1px dashed #CEE1F8;
    }

    .faq .card .card-header {
        padding: 0px;
        border: none;
        background: none;
        -webkit-transition: all 0.3s ease 0s;
        -moz-transition: all 0.3s ease 0s;
        -o-transition: all 0.3s ease 0s;
        transition: all 0.3s ease 0s;
    }

    .collapse.hide {
        display: none;
    }

    .faq .card .card-header:hover {
        background: rgba(196, 196, 196, 0.2);
        padding-left: 10px;
    }

    .faq .card .card-header .faq-title {
        width: 100%;
        text-align: left;
        padding: 0px;
        padding-left: 30px;
        padding-right: 30px;
        font-weight: 400;
        font-size: 15px;
        letter-spacing: 1px;
        color: #3B566E;
        text-decoration: none !important;
        -webkit-transition: all 0.3s ease 0s;
        -moz-transition: all 0.3s ease 0s;
        -o-transition: all 0.3s ease 0s;
        transition: all 0.3s ease 0s;
        cursor: pointer;
        padding-top: 20px;
        padding-bottom: 20px;
    }

    .faq .card .card-header .faq-title .badge {
        display: inline-block;
        width: 20px;
        height: 20px;
        line-height: 14px;
        float: left;
        -webkit-border-radius: 100px;
        -moz-border-radius: 100px;
        border-radius: 100px;
        text-align: center;
        background: #055187;
        color: #fff;
        font-size: 12px;
        margin-right: 20px;
    }

    .faq .card .card-body {
        padding: 30px;
        padding-left: 35px;
        padding-bottom: 16px;
        font-weight: 400;
        font-size: 16px;
        color: #6F8BA4;
        line-height: 28px;
        letter-spacing: 1px;
        border-top: 1px solid #F3F8FF;
    }

    .faq .card .card-body p {
        margin-bottom: 14px;
    }

    @media (max-width: 991px) {
        .faq {
            margin-bottom: 30px;
        }

        .faq .card .card-header .faq-title {
            line-height: 26px;
            margin-top: 10px;
        }
    }
</style>
<section class="faq-section">
    <div class="container">
        <div class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
            <?php } ?>
        </div>
        <div class="col-md-6 offset-md-3">
            <div class="faq-title text-center pb-3">
                <h1>Вопрос-ответ</h1>
            </div>
        </div>
        <div class="faq_ask">
            <a class="button faq_button"><span>Задать вопрос</span><span>Свернуть форму</span></a>
            <div class="faq_desc">Вы можете задать любой вопрос на тему нашей продукции или работы интеренет
                магазина.<br>
                Мы постараемся ответить на него как можно быстрее и подробнее.
            </div>
            <!--'start_frame_cache_form-faq-block'-->
            <div class="form inline ASK hide">
                <!--noindex-->
                <div class="form_head">
                    <h4>Задать вопрос</h4>
                </div>
                
                <form method="POST" enctype="multipart/form-data">
                    <div class="form_body">
                        <div class="form-group required">
                            <label class="control-label" for="input-payment-firstname">Имя</label>
                            <input type="text" name="username" required value="" id="input-payment-firstname"
                                   class="form-control">
                        </div>
                        <div class="form-group email required">
                            <label class="control-label" for="input-payment-email">E-Mail</label>
                            <input type="email" name="email" required value="" id="input-payment-email"
                                   class="form-control">
                        </div>
                        <div class="form-group required">
                            <label class="control-label" for="input-payment-telephone">Телефон</label>
                            <input type="text" required name="phone" value="" id="input-payment-telephone"
                                   class="form-control">
                        </div>
                        <div class="form-group required">
                            <label class="control-label" for="input-payment-telephone">Вопрос</label>
                            <input type="text" name="title" required value="" id="input-payment-telephone" class="form-control">
                        </div>
                    </div>
                    <div class="form_footer">
                        <input type="submit" class="button medium" value="Сохранить" name="web_form_submit">
                        <!-- *****   {*<button type="reset" class="button red transparent" value="reset" name="web_form_reset">*}
                            {*<span>Сбросить</span></button>*} ***** -->
                    </div>
                </form>    <!--/noindex-->
            </div>
            <!--'end_frame_cache_form-faq-block'--></div>
        <div class="row">
            <!-- ***** FAQ Start ***** -->
            <?php if ($cat_answers): ?>
            <?php foreach ($cat_answers as $cat_name=>$cat_arr): ?>
            <div class="col-md-6 offset-md-3">
                <div class="faq-title text-center pb-3">
                    <h3><?=htmlspecialchars($cat_name);?></h3>
                </div>
            </div>
            <div class="col-md-6 offset-md-3">
                <div class="faq" id="accordion">
                    <?php foreach ($cat_arr as $key=>$item): ?>
                    <?php $count = $key+1;?>
                    <div class="card">
                        <div class="card-header" id="faqHeading-1">
                            <div class="mb-0">
                                <h5 class="faq-title" data-toggle="collapse" data-target="#faqCollapse-1"
                                    data-aria-expanded="true" data-aria-controls="faqCollapse-1">
                                    <!-- <span class="badge"><?php echo $count?></span> -->
                                    <?php echo $item['title']?>
                                </h5>
                            </div>
                        </div>
                        <div id="faqCollapse-1" class="collapse hide" aria-labelledby="faqHeading-1"
                             data-parent="#accordion">
                            <div class="card-body">
                                <p><?=html_entity_decode($item['description'])?> </p>
                            </div>
                        </div>
                    </div>
                    <?php endforeach;?>
                </div>
            </div>
            <?php endforeach;?>
            <?php endif;?>
        </div>
    </div>
</section>
<script>
    $('.faq_button').click(function ($e) {
        $(this).toggleClass('opened');
        $(this).parents('.faq_ask').find('.form.inline').toggleClass('hide')
    });
    $('.card-header').click(function () {
        $(this).parents('.card').find('.collapse').toggleClass('hide');
    });
</script>
<?php echo $footer; ?>