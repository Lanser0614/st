<?php echo $header; ?>

<style>
    .faq-section {
        background: #fdfdfd;
        min-height: 100vh;
        padding: 10vh 0 0;
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
    .faq-title h3{
        margin-top: 50px;
    }
    .faq_ask{border:1px solid #e5e5e5;padding:44px;} .faq_ask .form .form_footer{margin-bottom:0;} .button.faq_button{float:left;padding:9px 25px 10px 25px;text-align:center;width:97px;position:relative;white-space:nowrap;} .button.faq_button > span{display:inline;} .button.faq_button > span:last-of-type{display:none;} .button.faq_button.opened > span{display:none;} .button.faq_button.opened > span:last-of-type{display:inline;} .button.faq_button i{background:rgba(0, 0, 0, 0) url("images/arrows.png") repeat scroll 1px -441px;display:block;height:9px;left:18px;position:absolute;top:13px;width:12px;} .button.faq_button.opened i{background-position:-17px -441px;} .faq_desc{margin-left:183px;margin-top:-4px;} .faq_ask .form{margin:23px 0 0;} .faq_ask .form_head h4{display:none;} .faq-title h3 {
        position: relative;
        margin-bottom: 45px;
        display: inline-block;
        font-weight: 600;
        line-height: 1;
    }

    .form.inline.hide {
        display: none;
    }

    .faq-title h3::before {
        content: "";
        position: absolute;
        left: 15%;
        width: 60px;
        height: 2px;
        background: #055187;
        bottom: -25px;
        margin-left: -30px;
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
        background: rgba(233, 30, 99, 0.1);
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
    .faq-section{
        margin-bottom: 100px;
    }
    .success-text{
        color: green;
        font-size: 30px;
    }
</style>
<section class="faq-section">
    <div class="container">
        <div class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
            <?php } ?>
        </div>
        <?php if(isset($success_text)):?>
         <div class="success-text"><p><?= $success_text?></p></div>
        <?php endif;?>
        <form method="post" class="uk-form">
            <div class="uk-width-large-8-12 uk-width-medium-10-12 uk-width-small-1-1">
                <img src="https://rst-motors.ru/upload/rst/vinp.jpg">
                <br>
                <br><div class="form-group">
                    <p class="req"><b>Марка автомобиля:</b></p>
                    <input type="text" class="text" name="brand" placeholder="Пример: ISUZU" required>
                </div>

                <br><div class="form-group">
                    <p class="req"><b>Модель автомобиля:</b></p>
                    <input type="text" class="text" name="article" placeholder="Пример: NQR75" required>
                </div>

                <br><div class="form-group">
                    <p class="req"><b>Год выпуска автомобиля:</b></p>
                    <input type="text" class="text" name="year" placeholder="Пример: 2009" required>
                </div>

                <br><div class="form-group">
                    <p class="req"><b>VIN или номер шасси:</b></p>
                    <input type="text" class="text" name="vin" placeholder="Пример: Z7XN1R75RT0003484" required>
                </div>


                <br><div class="form-group">
                    <p class="req"><b>Необходимые запчасти:</b></p>
                    <textarea cols="30" rows="5" class="text" name="product" placeholder="Пример: Тормозные колодки" required></textarea>
                </div>


                <br><div class="form-group">
                    <p><b>Дополнительная информация:</b></p>
                    <textarea cols="30" rows="3" name="enquiry" class="text" required></textarea>
                </div>


                <br><div class="form-group">
                    <p><b>Ваше имя:</b></p>
                    <input type="text" class="text" name="name" value="" placeholder="Пример: Иван" required>
                </div>

                <br><div class="form-group">
                    <p><b>Ваш E-mail:</b></p>
                    <input type="email" class="text" name="email" placeholder="Пример: ivan@mail.ru" required>
                </div>

                <br><div class="form-group">
                    <p class="req"><b>Ваш телефон:</b></p>
                    <input type="text" class="text phone_with_ddd" name="phone" value="" placeholder="Пример: +79001234567" required>
                </div>

                <br><div class="form-group">
                    <p><b>Какие запчасти вас интересуют?</b></p>
                    <p class="checkbox_text">Оригинальные
                        <input type="checkbox" name="origin" value="да">
                    </p>
                    <p class="checkbox_text">Аналоги
                        <input type="checkbox" name="analog" value="да">
                    </p>
                </div>
                <br><div class="form-group">
                    <input type="submit" class="btn" value="Отправить">
                </div>
            </div>
        </form>
    </div>
</section>
<?php echo $footer; ?>