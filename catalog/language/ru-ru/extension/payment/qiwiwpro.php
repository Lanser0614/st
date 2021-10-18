<?php
$_['text_instruction'] = 'Инструкции по онлайн оплате';
$_['button_confirm'] = 'Подтверждение заказа';
$_['button_pay_later'] = 'Оплатить позже';
$_['text_stat'] = 'Перейдите по ссылке для оплаты онлайн';

$_['inter_title'] = 'Оплатить онлайн';
$_['heading_title'] = 'Онлайн оплата';
$_['history'] = 'История заказов';
$_['lich'] = 'Личный Кабинет';
$_['button_pay'] = 'ПЕРЕЙТИ К ОПЛАТЕ';
$_['button_back'] = 'Назад';
$_['text_title'] = 'Онлайн оплата';
$_['button_ok'] = 'Готово';
$_['success_text_first'] = '<p>Ваш заказ успешно создан!</p>';
$_['success_text'] = '<p>Операция прошла успешно. Ваш заказ #%d оплачен.</p>';
$_['success_text_wait'] = '<p>Поcле того как деньги поступят на наш счет, статус Вашего Заказа #%1$d изменится. Если произошла ошибка <a href="/index.php?route=information/contact">свяжитесь с нами</a>. Мы поможем Вам произвести оплату. Для повторной оплаты перейдите <a href="%2$s">по ссылке</a>.</p>';
$_['success_text_wait_noorder'] = '<p>Поcле того как деньги поступят на наш счет, наш менеджер свяжется с Вами. Если произошла ошибка <a href="/index.php?route=information/contact">свяжитесь с нами</a>. Мы поможем Вам произвести оплату. Для повторной оплаты перейдите <a href="%1$s">по ссылке</a>.</p>';
$_['success_text_loged'] = '<p>Вы можете просматривать историю заказов в <a href="%2$s">Личном кабинете</a>, открыв <a href="%1$s">Историю заказов</a></p>';
$_['waiting_text_loged'] = '<p>Вы также можете произвести оплату позже из <a href="%s">личного кабинета</a>.</p>';

$_['send_text'] = 'Заказ #%1$s Сумма: %2$sр.';
$_['send_text_comis'] = ', Комиссия: %1$sр.';
$_['send_order_split'] = 'Внимание! Ваш платеж будет разбит на суммы менее %1$sр.<br/>Сумма к оплате: %2$sр.';
$_['send_order_split2'] = ' Осталось оплатить: %1$sр.';
$_['send_order_split_comis'] = ', в том числе комиссия: %1$sр. ';
$_['send_order_split_button'] = '<br/><br/><form method="POST" action="%1$s"><input type="hidden" name="nesyandexa" value="nesyandexa"><input type="submit" value="ПЕРЕЙТИ К ОПЛАТЕ" class="btn btn-primary"></form><br/>';
$_['send_text_wait'] = '<p>Поcле того как деньги поступят на наш счет, статус Вашего Заказа #%1$d изменится. Если произошла ошибка <a href="/index.php?route=information/contact">свяжитесь с нами</a>. Мы поможем Вам произвести оплату.</p>';

$_['success_admin_alert'] = 'Поступила оплата заказа #%s';
$_['oplachen'] = 'Ваш заказ уже оплачен';
$_['pay_text'] = 'Оплатить онлайн';

$_['pay_order_text'] = 'Заказ %1$s';
$_['pay_order_text_target'] = 'Оплата заказа %1$s';
$_['pay_order_comment'] = '';



$_['no_stock'] = 'Оплата будет доступна после обработки заказа.<br/>';
$_['stock'] = 'Повторно перейти на оплату можно <a href="%s">по ссылке</a><br/>';

$_['success_morepay_alert_admin'] = 'Поступила частичная оплата заказа #%1$s.'."\n".'Заказ разбит на суммы менее %2$sр.'."\n".'Зачислено: %5$sр. %6$'."\n".'Всего оплачено: %3$sр. Осталось оплатить: %4$sр.';
$_['success_morepay_alert_customer'] = 'Операция прошла успешно.'."\n".'Внимание! Ваш заказ #%1$s разбит на суммы менее %2$sр.'."\n".'Зачислено: %5$sр. %6$s'."\n".'Всего оплачено: %3$sр. Осталось оплатить: %4$sр.'."\n".'Оплатить остаток можно по ссылке %7$s';
$_['success_morepay_alert_comis'] = 'в том числе комиссия %1$sр.';

$_['waiting_payment'] = 'Ожидание платежа.....При поступлении оплаты страница автоматически обновится....';
$_['waiting_payment_new_text'] = 'Совершите оплату по кнопке ниже. Переход на оплату произойдет в новом окне.';
$_['waiting_payment_new_button'] = 'ОПЛАТИТЬ';


//PAGE BALANCE
$_['text_balance'] = 'Пополнение баланса';
$_['balance_heading_title'] = 'Пополнение баланса';
$_['balance_button_continue'] = 'Пополнить баланс';
$_['text_balance_sum'] = 'Cумма пополнения (%1$s):';
$_['entry_balance_sum'] = 'Введите сумму';
$_['text_balance_method'] = 'Метод оплаты:';

//BALANCE MOD
$_['addbalance_formcomment'] = 'Баланс %1$s';
$_['addbalance_short_dest'] = 'Баланс %1$s';
$_['addbalance_targets'] = 'Пополнение баланса %1$s';
$_['addbalance_comment'] = '';
$_['addbalance_text_transaction'] = 'Пополнение через платежную систему (%1$s)';
$_['addbalance_success_text_message'] = 'Ваш баланс успешно пополнен.';
$_['addbalance_mail_customer'] = 'Баланс успешно поплнен. Текущий баланс %1$s';

//PAGE FPAY
$_['text_fpay'] = 'Оплата оговоренной суммы';
$_['fpay_heading_title'] = 'Оплата оговоренной суммы';
$_['fpay_button_continue'] = 'Оплатить';
$_['text_fpay_sum'] = 'Cумма оплаты (%1$s):';
$_['entry_fpay_sum'] = 'Введите сумму';
$_['text_fpay_method'] = 'Метод оплаты:';
$_['text_fpay_email'] = 'Ваш email:';
$_['text_fpay_phone'] = 'Номер телефона:';
$_['text_fpay_comment'] = 'Комментарий:';

//FPAY MOD
$_['addfpay_formcomment'] = 'Платеж%1$s';
$_['addfpay_short_dest'] = 'Платеж%1$s';
$_['addfpay_targets'] = 'Платеж%1$s';
$_['addfpay_comment'] = 'Свободный платеж.%1$s';
$_['addfpay_success_text_message'] = 'Платеж успешно завершен.';
$_['addfpay_mail_customer'] = 'Ваш платеж успешно завершен. Номер транзакции %1$s. Сумма: %2$s';
$_['addfpay_mail_admin'] = 'Поступила оплата с формы свободного платежа. Номер транзакции %1$s, данные плательщика: %2$s. Сумма: %3$s';
?>