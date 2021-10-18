<?php echo $header; ?>
<style>
    .success-text{
        color: green;
        font-size: 30px;
    }
</style>
<section class="container">
    <div id="content" class="ocpb-design-1">
        <div class="breadcrumb">
            <a href="https://st-spares.ru/">Главная</a>Запрос по VIN
        </div>
        <?php if(isset($success_text)):?>
        <div class="success-text"><p><?= $success_text?></p></div>
        <?php endif;?>
        <form id="checkout-page" method="post">
            <h2 id="checkout-f"></h2>
            <div id="checkout-form">
                <div class="row main-form right-left">
                    <div class="col-sm-6">
                        <fieldset style="margin-bottom:40px;">
                            <div class="form-group" style="display: none;">
                                <label class="control-label">Марка автомобиля:</label>
                                <input type="text" class="text" name="brand" placeholder="ISUZU">
                            </div>
                            <div class="form-group required">
                                <label class="control-label">Модель автомобиля:</label>
                                <input type="text" name="article" required value="" placeholder="NQR75"
                                       id="input-payment-firstname" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="control-label">Год выпуска автомобиля:</label>
                                <input type="text" name="year" placeholder="2009"  class="form-control">
                            </div>
                            <br>
                            <div class="form-group required">
                                <label class="control-label" for="input-payment-email">Номер шасси:</label>
                                <input type="text" class="form-control" name="vin"
                                       placeholder="Z7XN1R75RT0003484" required>
                            </div>
                            <br>
                            <div class="form-group">
                                <label class="control-label" for="input-payment-email">Необходимые запчасти:</label>
                                <textarea cols="30" rows="3" class="text" name="product"
                                          placeholder="Тормозные колодки"></textarea>
                            </div>
                        </fieldset>
                    </div>
                    <div class="col-sm-6">
                        <fieldset style="margin-bottom:40px;">
                            <div class="form-group email required">
                                <label class="control-label" for="input-payment-email">Ваше имя:</label>
                                <input type="text" name="name" value="" placeholder="Иван"
                                       id="input-payment-email"
                                       class="form-control" required>
                            </div>
                            <div class="form-group email required">
                                <label class="control-label" for="input-payment-email">Ваш E-Mail</label>
                                <input type="email" name="email"  placeholder="ivan@mail.ru" required
                                       class="form-control">
                            </div>
                            <div class="form-group required">
                                <label class="control-label" for="input-payment-telephone">Ваш телефон:</label>
                                <input type="text" name="phone" value="" placeholder="+79001234567" required
                                       class="form-control">
                            </div>
                            <div class="form-group">
                                <p><b>Какие запчасти вас интересуют?</b></p>
                                <p class="checkbox_text">Оригинальные
                                    <input type="checkbox" name="origin" value="да">
                                </p>
                                <p class="checkbox_text">Аналоги
                                    <input type="checkbox" name="analog" value="да">
                                </p>
                                <button type="submit" class="btn button-coupon">Отправить</button>
                            </div>

                        </fieldset>
                    </div>
                </div>


            </div>


        </form>

    </div>
</section>
<?php echo $footer; ?>