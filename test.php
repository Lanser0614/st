<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script>
			$( document ).ready(function() {
		
			
			$.ajax({
    url: "https://st-spares.ru/index.php?route=payment/yandexmoney/callback&check=1",
	method: "POST",
	dataType: "text",
 
    data: {
        action: "paymentAviso",
		shopId: "39251",
		orderNumber: "120",
		invoiceId: "2000PANRE2664",
		orderSumAmount: '3800.00',
		orderSumCurrencyPaycash: '10643',
		orderSumBankPaycash: '1003',
		customerNumber: '120',
		md5: 'A870A3ACB0BE686177C7F9BDB992E3DF'
    },
 
    // Work with the response
    success: function( response ) {
        $( ".ans" ).text( response );
		
    }
});
	});
        </script>
    </head>
    <body>
		<div class='ans'>
        </div>
    </body>
</html>
