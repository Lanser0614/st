<?php echo $header; ?>
<section class="container"><?php echo $column_left; ?><?php echo $column_right; ?>

<div id="content"><?php echo $content_top; ?>
  
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $i=> $breadcrumb) { if($i+1 < count($breadcrumbs)){ ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } else { echo $breadcrumb['text']; }} ?>
  </div>

  <?php if ($error_warning) { ?><div class="alert alert-danger"><?php echo $error_warning; ?></div><?php } ?>
  
  <h1><?php echo $heading_title; ?></h1>

  <div class="right-left">
    <div class="left-content">
          <h2><?php echo $text_new_customer; ?></h2>
          <p><strong><?php echo $text_register; ?></strong></p>
          <p><?php echo $text_register_account; ?></p>
          <a href="<?php echo $register; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
    </div>
    <div class="right-content">
          <h2><?php echo $text_returning_customer; ?></h2>
          <p><strong><?php echo $text_i_am_returning_customer; ?></strong></p>
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
            <div class="form-group">
              <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
              <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
            </div>
            <div class="form-group">
              <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
              <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
            </div>
            <input type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary" /> &nbsp; <a href="<?php echo $forgotten; ?>" style="display:inline-block; vertical-align:top; padding-top:6px;"><?php echo $text_forgotten; ?></a>
            <?php if ($redirect) { ?>
              <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
            <?php } ?>
          </form>
    </div>
  </div>

  <?php echo $content_bottom; ?>
</div>
</section>
<?php echo $footer; ?>