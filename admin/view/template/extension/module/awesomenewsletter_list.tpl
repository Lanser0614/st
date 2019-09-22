<div class="table-responsive">
	<table class="table table-bordered table-hover" id="newsletter_table_list">
		<thead>
			<tr>
				<td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
				<td class="text-left sortorder"><?php if ($sort == 'email') { ?>
					<a href="<?php echo $sort_email; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_email; ?></a>
					<?php } else { ?>
					<a href="<?php echo $sort_email; ?>"><?php echo $column_email; ?></a>
					<?php } ?></td>
				<td class="text-left sortorder"><?php if ($sort == 'name') { ?>
					<a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
					<?php } else { ?>
					<a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
					<?php } ?></td>
				<td class="text-center sortorder"><a>Registered</a></td>
				<!--<td class="text-left sortorder"><?php if ($sort == 'status') { ?>
					<a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
					<?php } else { ?>
					<a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
					<?php } ?></td>-->
					<td class="text-center sortorder"><?php if ($sort == 'approved') { ?>
					<a href="<?php echo $sort_approved; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_approved; ?></a>
					<?php } else { ?>
					<a href="<?php echo $sort_approved; ?>"><?php echo $column_approved; ?></a>
					<?php } ?></td>
					<td class="text-left sortorder"><?php if ($sort == 'ip') { ?>
					<a href="<?php echo $sort_ip; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_ip; ?></a>
					<?php } else { ?>
					<a href="<?php echo $sort_ip; ?>"><?php echo $column_ip; ?></a>
					<?php } ?></td>
				<td class="text-right sortorder"><?php if ($sort == 'date_added') { ?>
					<a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
					<?php } else { ?>
					<a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
					<?php } ?></td>
					<td class="text-right sortorder"><?php echo $column_action; ?></td>
			</tr>
		</thead>
		<tbody>
			<?php if ($subscribers) { ?>
			<?php foreach ($subscribers as $subscriber) { ?>
			<tr>
				<td class="text-center" >
					<input type="checkbox" name="selected[]" value="<?php echo $subscriber['awesomenewsletter_id']; ?>" />
				</td>
				<td class="text-left"><?php echo $subscriber['email']; ?></td>
				<td class="text-left"><?php echo $subscriber['name']; ?></td>
				<!--21-10-2016-->
				<td class="text-center"><?php echo $subscriber['type']; ?></td>
				<!--21-10-2016-->
				<!--<td class="text-left"><?php echo $subscriber['status']; ?></td>-->
				<td class="text-center"><?php echo $subscriber['approved']; ?></td>
				<td class="text-left"><?php echo $subscriber['ip']; ?>
					<br/>
					<a target="blank" href="<?php echo $subscriber['ip_href']; ?>" class="btn btn-default btn-xs"><small><i class="fa fa-info"></i> <?php echo $button_visitor_ip; ?></small></a>
				</td>
				<td class="text-right"><?php echo $subscriber['date_added']; ?></td>
				<td class="text-right">
					<?php if ($subscriber['approve']) { ?>
					<a data-toggle="tooltip" title="<?php echo $button_approve; ?>" rel="<?php echo $subscriber['awesomenewsletter_id']; ?>" id="btn-approve<?php echo $subscriber['awesomenewsletter_id']; ?>" class="btn btn-success btn-approve"><i class="fa fa-thumbs-o-up"></i></a>
					<?php } else { ?>
					<button type="button" class="btn btn-success" disabled><i class="fa fa-thumbs-o-up"></i></button>
					<?php } ?>
					
					<button rel="<?php echo $subscriber['awesomenewsletter_id']; ?>" type="button" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary button-edit-subscribe" id="button-edit-subscribe<?php echo $subscriber['awesomenewsletter_id']; ?>"><i class="fa fa-pencil"></i></button></td>
			</tr>
			<?php } ?>
			<?php } else { ?>
			<tr>
				<td class="text-center" colspan="7"><?php echo $text_no_results; ?></td>
			</tr>
			<?php } ?>
		</tbody>
	</table>
</div>
<div class="row">
	<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
	<div class="col-sm-6 text-right"><?php echo $results; ?></div>
</div>
<script type="text/javascript"><!--
$('.btn-approve').on('click', function() {
	var awesomenewsletter_id = $(this).attr('rel');
	if(awesomenewsletter_id) {
		$.ajax({
			url: 'index.php?route=extension/module/awesomenewsletter/approve&token=<?php echo $token; ?>&awesomenewsletter_id='+ awesomenewsletter_id,
			type: 'post',
			dataType: 'json',
			beforeSend: function() {
				$('#btn-approve'+ awesomenewsletter_id).button('loading');
			},
			complete: function() {
				$('#btn-approve'+ awesomenewsletter_id).button('reset');
			},
			success: function(json) {
				$('.alert').remove();
				
				if(json['success']) {
					$('.panel.panel-default').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> '+ json['success'] +'<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}
				
				var urls = '<?php echo $getsubscribers_action; ?>';
				
				getSubscribers(urls);
			}
		});
	}
});
//--></script>
<script>
$('.button-edit-subscribe').click(function() {
	var awesomenewsletter_id = $(this).attr('rel');
	if(awesomenewsletter_id) {
		$.ajax({
			url: '<?php echo $editsubscribersopen_action; ?>&awesomenewsletter_id='+ awesomenewsletter_id,
			type: 'post',
			dataType: 'html',
			beforeSend: function() {
				$('#button-edit-subscribe'+awesomenewsletter_id).button('loading');
			},
			complete: function() {
				$('#button-edit-subscribe'+awesomenewsletter_id).button('reset');
			},
			success: function(html) {
				$('#editsubscribe').html(html);
				$('#modal-editsubscribe').modal('show');
				
			}
		});
	}
});
</script>
<script>
function deleteSubscribers() {
	$.ajax({
		url: '<?php echo $deletesubscribers_action; ?>',
		type: 'post',
		dataType: 'json',
		data: $('#tab-newsletter-list input[type=\'checkbox\']:checked'),
		beforeSend: function() {
			$('#btn-del').button('loading');
		},
		complete: function() {
			$('#btn-del').button('reset');
		},
		success: function(json) {
			$('.alert').remove();
			
			if(json['success']) {
				$('.panel.panel-default').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> '+ json['success'] +'<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
			
			var urls = '<?php echo $getsubscribers_action; ?>';
			
			getSubscribers(urls);
		}
	});
}
</script>
<div id="editsubscribe"></div>