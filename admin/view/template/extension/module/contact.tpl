<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right buttons">
				<a href="<?php echo $csvfile; ?>" class="btn btn-primary"><?php echo $button_csv; ?> </a>
				<!-- <a onclick="$('#execute').val('markasread');$('#form').submit();" class="btn btn-success"><?php echo $button_read; ?> </a> -->
			    <a onclick="$('#execute').val('delete');$('#form').submit();"  data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger"><i class="fa fa-trash-o"></i></a>
			</div>
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if ($error_warning) { ?>
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<?php if ($success) { ?>
			<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $heading_title_contact_list; ?></h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $execute; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
					<input type="hidden" name="execute" id="execute" />
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
									<td class="text-left" colspan="2"><?php echo $column_name; ?></td>
									<td class="text-left"><?php echo $column_date_added; ?></td>
									<td class="text-left"><?php echo $column_email; ?></td>
									<td class="text-left"><?php echo $column_ip; ?></td>
									<td class="text-left"><?php echo $column_description; ?></td>
									<td class="text-left">Доп информации</td>
									<td class="text-right""><?php echo $column_action; ?></td>
									</tr>
									</thead>
									<tbody>
									<?php if ($contact_info) { ?>
										<?php foreach ($contact_info as $contact) { ?>
											<tr>
											<td class="text-left"> <input type="checkbox" name="selected[]" value="<?php echo $contact['contact_id']; ?>" /></td> 
											<?php if ($contact['is_read'] == 0) { ?>
												<td class="text-center">
													<p class="btn btn-warning" type="button" data-toggle="tooltip" title="<?php echo $text_not_read; ?>"><i class="fa fa-envelope-o" aria-hidden="true"></i>
													</p>
												</td>
												<?php } else { ?>
												<td class="text-center"> 
													<p class="btn btn-success" type="button" data-toggle="tooltip" title="<?php echo $text_read; ?>"><i class="fa fa-envelope-o"></i>
													</p>
												</p>
											</td>
										<?php } ?>
										<td class="text-left"> <?php echo $contact['firstname']; ?></td>
										<td class="text-left"> <?php echo $contact['date_added']; ?></td>
										<td class="text-left"> <?php echo $contact['email'] ?></td>
										<td class="text-left"> <a href="http://whatismyipaddress.com/ip/<?php echo $contact['ipaddress'] ?>" target="_blank"><?php echo $contact['ipaddress'] ?></a></td>
										<td class="text-left"><?php $contact_message = $contact['enquiry']; $message = utf8_substr($contact_message, 0,'80');  echo $message; ?>...</td>
										<td class="text-left">
											<strong>Телефон:</strong> <?=$contact['phone'];?></br>
											<strong>Аналог:</strong> <?php if($contact['analog']){ ?>Да<?php }else { ?>Нет<?php }?></br>
											<strong>Оргиналь:</strong> <?php if($contact['origin']){ ?>Да<?php }else{ ?>Нет<?php }?></br>
											<strong>Год выпуска автомобиля:</strong> <?=$contact['year_product'];?></br>
											<strong>VIN или номер шасси:</strong><?=$contact['vin'];?></br>
											<strong>Необходимые запчасти:</strong><?=$contact['product'];?></br>
											<strong>Модель автомобиля:</strong> <?=$contact['article'];?></br>
											<strong>Марка автомобиля:</strong> <?=$contact['brand'];?></br>
										</td>
										<td class="text-right">
											<a class="btn btn-info" href="<?php echo $contact['view'] ?>"  data-toggle="tooltip" title="" data-original-title="<?php echo $button_view; ?>"><i class="fa fa-eye"></i></a>
											<a href="<?php echo $contact['reply'] ?>" data-toggle="tooltip" title="" class="btn btn-default" data-original-title="<?php echo $button_reply; ?>"><i class="fa fa-share"></i></a>
										</td> 
									</tr>
								<?php } ?>
								<?php } else { ?>
								<tr>
									<td class="center" colspan="8"><?php echo $text_no_results; ?></td>
								</tr>
							<?php } ?>
						</tbody>
					</table>
				</div>
			</form>
		
		</div>		
	</div>
</div>
</div>
<?php echo $footer; ?>	