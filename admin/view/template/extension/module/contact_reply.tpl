<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<a onclick="$('#form').submit();" class="btn btn-primary"><?php echo $button_send; ?></a>
				<a href="<?php echo $cancel; ?>" class="btn btn-danger"><?php echo $button_cancel; ?></a>
			</div>
			<h1><?php echo $heading_title_contact_reply; ?></h1>
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
				<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $heading_title_contact_reply; ?></h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $send; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
					<?php if ($single_data) { ?>
						<?php foreach ($single_data as $contact) { ?>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-name"><?php echo $column_name; ?></label>
								<div class="col-sm-10">
									<input type="text" name="name" id="name" value="<?php echo $contact['firstname']; ?>" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-email"><?php echo $column_email; ?></label>
								<div class="col-sm-10">
									<input type="text" name="email" id="email" value="<?php echo $contact['email'] ?>" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-description"><?php echo $column_description; ?></label>
								<div class="col-sm-10">
									<textarea  id="input-message" name="enquiry" class="form-control summernote">  </textarea>
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
	<script type="text/javascript"><!--
		<?php if ($ckeditor) { ?>
			ckeditorInit('input-message', getURLVar('token'));
		<?php } ?>
	//--></script>
</div>
<?php echo $footer; ?>