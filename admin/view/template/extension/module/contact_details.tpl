<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<a href="<?php echo $reply; ?>" class="btn btn-success"><?php echo $button_reply; ?></a>
				<a onclick="$('#execute').val('delete');$('#form').submit();" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form').submit() : false;"><i class="fa fa-trash-o"></i></a>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="" class="btn btn-default" data-original-title="<?php echo $button_cancel; ?>"><i class="fa fa-reply"></i></a>
			</div>
			<h1><?php echo $heading_title_contact_details; ?></h1>
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
				<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $heading_title_contact; ?></h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $execute; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
					<input type="hidden" name="execute" id="execute" />
					<?php if ($single_data) { ?>
						<?php foreach ($single_data as $contact) { ?>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-name"><?php echo $column_name; ?></label>
								<div class="col-sm-10">
									<input type="text" name="bannerTitle" id="bannerTitle" value="<?php echo $contact['firstname']; ?>"  class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-email"><?php echo $column_email; ?></label>
								<div class="col-sm-10">
									<input type="text" name="bannerTitle" id="bannerTitle" value="<?php echo $contact['email'] ?>" class="form-control" />
								</div>
							</div>	
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-description"><?php echo $column_description; ?></label>
								<div class="col-sm-10">
									<textarea name="enquiry" class="form-control" style="width:100%;height:180px;"> <?php echo $contact['enquiry']; ?>  </textarea>
								</div>
							</div>								
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-ip"><?php echo $column_ip; ?></label>
								<div class="col-sm-10">
									<input type="text" name="bannerTitle" id="bannerTitle" value="<?php echo $contact['ipaddress'] ?>" class="form-control" />
									<div class="form-text">
										<a href="http://whatismyipaddress.com/ip/<?php echo $contact['ipaddress'] ?>" target="_blank" class="btn btn-outline-secondary" type="button"><?php echo $text_view; ?>...</a>
									</div>
								</div>
							</div>
						<?php } ?>
						<?php } else { ?>
						<?php echo $text_no_results; ?>
					<?php } ?>
				</form>
				<div id="copyright"><?php echo $text_copyright; ?></div>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>