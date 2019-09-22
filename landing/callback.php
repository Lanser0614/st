<?php
// Сообщение
$message = "время: ".date('d.m.Y H:i:s')."\r\nтелефон: ".$_POST['phone'];
if($_POST['email']) $message .= "\r\nE-mail: ".$_POST['email'];

// На случай если какая-то строка письма длиннее 70 символов мы используем wordwrap()
$message = wordwrap($message, 70, "\r\n");

// Отправляем
mail('valery.ageeva@gmail.com', 'Заполнена форма на сайте: Лендинг', $message);
echo 1;
?>

<?//var_dump($_POST);?>