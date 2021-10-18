<!--
##=====================================================================##
## @author    : OCdevWizard                                            ##
## @contact   : ocdevwizard@gmail.com                                  ##
## @support   : http://help.ocdevwizard.com                            ##
## @license   : http://license.ocdevwizard.com/Licensing_Policy.pdf    ##
## @copyright : (c) OCdevWizard. Smart Notification Bar Pro Plus, 2017 ##
##=====================================================================##
-->
<?php if ($forms) { ?>
<script type="text/javascript">
  <?php foreach ($forms as $form) { ?>
    <?php if ($form['module_trigger'] == 1) { ?>
      $(window).load(function() {
        <?php if ($form['display_frequency'] == 1) { ?>
          setTimeout(function() {
            <?php if ($form['custom_js'] == 1 || $form['custom_js'] == 3) { ?>
              <?php echo $form['custom_js_code']; ?>
            <?php } ?>
            <?php if ($form['animation_type'] == 1) { ?>
              $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
              $('#<?php echo $form['module_id_selector']; ?>').slideDown(<?php echo $form['animation_duration']; ?>);
            <?php } else if ($form['animation_type'] == 2) { ?>
              $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
              $('#<?php echo $form['module_id_selector']; ?>').fadeIn(<?php echo $form['animation_duration']; ?>);
            <?php } else { ?>
              $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
            <?php } ?>
          }, <?php echo $form['show_delay']; ?>);
        <?php } ?>

        <?php if ($form['display_frequency'] == 2) { ?>
          $.ajax({
            type: 'get',
            url: 'index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/validate&form=<?php echo $_code; ?>_form_<?php echo $form['form_id']; ?>&type=session',
            dataType: 'json',
            success: function(json) {
              if (json['status'] != 1) {
                setTimeout(function() {
                  <?php if ($form['custom_js'] == 1 || $form['custom_js'] == 3) { ?>
                    <?php echo $form['custom_js_code']; ?>
                  <?php } ?>
                  <?php if ($form['animation_type'] == 1) { ?>
                    $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                    $('#<?php echo $form['module_id_selector']; ?>').slideDown(<?php echo $form['animation_duration']; ?>);
                  <?php } else if ($form['animation_type'] == 2) { ?>
                    $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                    $('#<?php echo $form['module_id_selector']; ?>').fadeIn(<?php echo $form['animation_duration']; ?>);
                  <?php } else { ?>
                    $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                  <?php } ?>
                }, <?php echo $form['show_delay']; ?>);
              }
            }
          });
        <?php } ?>

        <?php if ($form['display_frequency'] == 3) { ?>
          $.ajax({
            type: 'get',
            url: 'index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/validate&form=<?php echo $_code; ?>_form_<?php echo $form['form_id']; ?>&type=cookie&days=<?php echo $form['display_frequency_days']; ?>',
            dataType: 'json',
            success: function(json) {
              if (json['status'] != 1) {
                setTimeout(function() {
                  <?php if ($form['custom_js'] == 1 || $form['custom_js'] == 3) { ?>
                    <?php echo $form['custom_js_code']; ?>
                  <?php } ?>
                  <?php if ($form['animation_type'] == 1) { ?>
                    $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                    $('#<?php echo $form['module_id_selector']; ?>').slideDown(<?php echo $form['animation_duration']; ?>);
                  <?php } else if ($form['animation_type'] == 2) { ?>
                    $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                    $('#<?php echo $form['module_id_selector']; ?>').fadeIn(<?php echo $form['animation_duration']; ?>);
                  <?php } else { ?>
                    $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                  <?php } ?>
                }, <?php echo $form['show_delay']; ?>);
              }
            }
          });
        <?php } ?>
      });
    <?php } ?>

    <?php if ($form['module_trigger'] == 2) { ?>
      $(document).ready(function() {
        <?php if ($form['display_frequency'] == 1) { ?>
          setTimeout(function() {
            <?php if ($form['custom_js'] == 1 || $form['custom_js'] == 3) { ?>
              <?php echo $form['custom_js_code']; ?>
            <?php } ?>
            <?php if ($form['animation_type'] == 1) { ?>
              $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
              $('#<?php echo $form['module_id_selector']; ?>').slideDown(<?php echo $form['animation_duration']; ?>);
            <?php } else if ($form['animation_type'] == 2) { ?>
              $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
              $('#<?php echo $form['module_id_selector']; ?>').fadeIn(<?php echo $form['animation_duration']; ?>);
            <?php } else { ?>
              $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
            <?php } ?>
          }, <?php echo $form['show_delay']; ?>);
        <?php } ?>

        <?php if ($form['display_frequency'] == 2) { ?>
          $.ajax({
            type: 'get',
            url: 'index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/validate&form=<?php echo $_code; ?>_form_<?php echo $form['form_id']; ?>&type=session',
            dataType: 'json',
            success: function(json) {
              if (json['status'] != 1) {
                setTimeout(function() {
                  <?php if ($form['custom_js'] == 1 || $form['custom_js'] == 3) { ?>
                    <?php echo $form['custom_js_code']; ?>
                  <?php } ?>
                  <?php if ($form['animation_type'] == 1) { ?>
                    $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                    $('#<?php echo $form['module_id_selector']; ?>').slideDown(<?php echo $form['animation_duration']; ?>);
                  <?php } else if ($form['animation_type'] == 2) { ?>
                    $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                    $('#<?php echo $form['module_id_selector']; ?>').fadeIn(<?php echo $form['animation_duration']; ?>);
                  <?php } else { ?>
                    $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                  <?php } ?>
                }, <?php echo $form['show_delay']; ?>);
              }
            }
          });
        <?php } ?>

        <?php if ($form['display_frequency'] == 3) { ?>
          $.ajax({
            type: 'get',
            url: 'index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/validate&form=<?php echo $_code; ?>_form_<?php echo $form['form_id']; ?>&type=cookie&days=<?php echo $form['display_frequency_days']; ?>',
            dataType: 'json',
            success: function(json) {
              if (json['status'] != 1) {
                setTimeout(function() {
                  <?php if ($form['custom_js'] == 1 || $form['custom_js'] == 3) { ?>
                    <?php echo $form['custom_js_code']; ?>
                  <?php } ?>
                  <?php if ($form['animation_type'] == 1) { ?>
                    $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                    $('#<?php echo $form['module_id_selector']; ?>').slideDown(<?php echo $form['animation_duration']; ?>);
                  <?php } else if ($form['animation_type'] == 2) { ?>
                    $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                    $('#<?php echo $form['module_id_selector']; ?>').fadeIn(<?php echo $form['animation_duration']; ?>);
                  <?php } else { ?>
                    $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                  <?php } ?>
                }, <?php echo $form['show_delay']; ?>);
              }
            }
          });
        <?php } ?>
      });
    <?php } ?>

    <?php if ($form['module_trigger'] == 3) { ?>
      $("<?php echo $form['module_trigger_target']; ?>").on('click', function() {
        <?php if ($form['display_frequency'] == 1) { ?>
          setTimeout(function() {
            <?php if ($form['custom_js'] == 1 || $form['custom_js'] == 3) { ?>
              <?php echo $form['custom_js_code']; ?>
            <?php } ?>
            <?php if ($form['animation_type'] == 1) { ?>
              $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
              $('#<?php echo $form['module_id_selector']; ?>').slideDown(<?php echo $form['animation_duration']; ?>);
            <?php } else if ($form['animation_type'] == 2) { ?>
              $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
              $('#<?php echo $form['module_id_selector']; ?>').fadeIn(<?php echo $form['animation_duration']; ?>);
            <?php } else { ?>
              $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
            <?php } ?>
          }, <?php echo $form['show_delay']; ?>);
        <?php } ?>

        <?php if ($form['display_frequency'] == 2) { ?>
          $.ajax({
            type: 'get',
            url: 'index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/validate&form=<?php echo $_code; ?>_form_<?php echo $form['form_id']; ?>&type=session',
            dataType: 'json',
            success: function(json) {
              if (json['status'] != 1) {
                setTimeout(function() {
                  <?php if ($form['custom_js'] == 1 || $form['custom_js'] == 3) { ?>
                    <?php echo $form['custom_js_code']; ?>
                  <?php } ?>
                  <?php if ($form['animation_type'] == 1) { ?>
                    $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                    $('#<?php echo $form['module_id_selector']; ?>').slideDown(<?php echo $form['animation_duration']; ?>);
                  <?php } else if ($form['animation_type'] == 2) { ?>
                    $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                    $('#<?php echo $form['module_id_selector']; ?>').fadeIn(<?php echo $form['animation_duration']; ?>);
                  <?php } else { ?>
                    $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                  <?php } ?>
                }, <?php echo $form['show_delay']; ?>);
              }
            }
          });
        <?php } ?>

        <?php if ($form['display_frequency'] == 3) { ?>
          $.ajax({
            type: 'get',
            url: 'index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/validate&form=<?php echo $_code; ?>_form_<?php echo $form['form_id']; ?>&type=cookie&days=<?php echo $form['display_frequency_days']; ?>',
            dataType: 'json',
            success: function(json) {
              if (json['status'] != 1) {
                setTimeout(function() {
                  <?php if ($form['custom_js'] == 1 || $form['custom_js'] == 3) { ?>
                    <?php echo $form['custom_js_code']; ?>
                  <?php } ?>
                  <?php if ($form['animation_type'] == 1) { ?>
                    $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                    $('#<?php echo $form['module_id_selector']; ?>').slideDown(<?php echo $form['animation_duration']; ?>);
                  <?php } else if ($form['animation_type'] == 2) { ?>
                    $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                    $('#<?php echo $form['module_id_selector']; ?>').fadeIn(<?php echo $form['animation_duration']; ?>);
                  <?php } else { ?>
                    $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                  <?php } ?>
                }, <?php echo $form['show_delay']; ?>);
              }
            }
          });
        <?php } ?>
      });
    <?php } ?>

    <?php if ($form['module_trigger'] == 4) { ?>
      $(window).scroll(function(e) {
        if ($('#<?php echo $form['module_id_selector']; ?>').length <= 0) {
          var scrollTop = $(window).scrollTop();
          var docHeight = $(document).height();
          var winHeight = $(window).height();
          var scrollPercent = (scrollTop) / (docHeight - winHeight);
          var scrollPercentRounded = Math.round(scrollPercent*100);
          if (scrollPercentRounded >= "<?php echo $form['module_trigger_scroll_value']; ?>") {
            <?php if ($form['display_frequency'] == 1) { ?>
              setTimeout(function() {
                <?php if ($form['custom_js'] == 1 || $form['custom_js'] == 3) { ?>
                  <?php echo $form['custom_js_code']; ?>
                <?php } ?>
                <?php if ($form['animation_type'] == 1) { ?>
                  $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                  $('#<?php echo $form['module_id_selector']; ?>').slideDown(<?php echo $form['animation_duration']; ?>);
                <?php } else if ($form['animation_type'] == 2) { ?>
                  $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                  $('#<?php echo $form['module_id_selector']; ?>').fadeIn(<?php echo $form['animation_duration']; ?>);
                <?php } else { ?>
                  $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                <?php } ?>
              }, <?php echo $form['show_delay']; ?>);
            <?php } ?>

            <?php if ($form['display_frequency'] == 2) { ?>
              $.ajax({
                type: 'get',
                url: 'index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/validate&form=<?php echo $_code; ?>_form_<?php echo $form['form_id']; ?>&type=session',
                dataType: 'json',
                success: function(json) {
                  if (json['status'] != 1) {
                    setTimeout(function() {
                      <?php if ($form['custom_js'] == 1 || $form['custom_js'] == 3) { ?>
                        <?php echo $form['custom_js_code']; ?>
                      <?php } ?>
                      <?php if ($form['animation_type'] == 1) { ?>
                        $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                        $('#<?php echo $form['module_id_selector']; ?>').slideDown(<?php echo $form['animation_duration']; ?>);
                      <?php } else if ($form['animation_type'] == 2) { ?>
                        $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                        $('#<?php echo $form['module_id_selector']; ?>').fadeIn(<?php echo $form['animation_duration']; ?>);
                      <?php } else { ?>
                        $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                      <?php } ?>
                    }, <?php echo $form['show_delay']; ?>);
                  }
                }
              });
            <?php } ?>

            <?php if ($form['display_frequency'] == 3) { ?>
              $.ajax({
                type: 'get',
                url: 'index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/validate&form=<?php echo $_code; ?>_form_<?php echo $form['form_id']; ?>&type=cookie&days=<?php echo $form['display_frequency_days']; ?>',
                dataType: 'json',
                success: function(json) {
                  if (json['status'] != 1) {
                    setTimeout(function() {
                      <?php if ($form['custom_js'] == 1 || $form['custom_js'] == 3) { ?>
                        <?php echo $form['custom_js_code']; ?>
                      <?php } ?>
                      <?php if ($form['animation_type'] == 1) { ?>
                        $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                        $('#<?php echo $form['module_id_selector']; ?>').slideDown(<?php echo $form['animation_duration']; ?>);
                      <?php } else if ($form['animation_type'] == 2) { ?>
                        $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                        $('#<?php echo $form['module_id_selector']; ?>').fadeIn(<?php echo $form['animation_duration']; ?>);
                      <?php } else { ?>
                        $('<?php echo $form['insert_module']; ?>').<?php if ($form['display_position'] == 1) { ?>prepend<?php } else { ?>append<?php } ?>('<div class="<?php echo $_code; ?>-notification-bar <?php if ($form['display_position'] == 1) { ?><?php echo $_code; ?>-position-top<?php } else { ?><?php echo $_code; ?>-position-bottom<?php } ?><?php if ($form['module_class']) { ?> <?php echo $form['module_class']; ?><?php } ?>" <?php if ($form['module_id_selector']) { ?>id="<?php echo $form['module_id_selector']; ?>"<?php } ?>><?php echo $form['module_content']; ?><?php if ($form['close_button_status'] == 1) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-right" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } else if ($form['close_button_status'] == 2) { ?><span class="<?php echo $_code; ?>-button-close <?php echo $_code; ?>-button-close-position-left" onclick="<?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(this);"><i class="fa fa-times"></i></span><?php } ?></div>');
                      <?php } ?>
                    }, <?php echo $form['show_delay']; ?>);
                  }
                }
              });
            <?php } ?>
          }
        }
      });
    <?php } ?>
    function <?php echo $_code; ?>_close_bar_<?php echo $form['form_id']; ?>(item) {
      $(item).parent().remove();
      <?php if ($form['custom_js'] == 2 || $form['custom_js'] == 3) { ?>
        <?php echo $form['custom_js_code']; ?>
      <?php } ?>
    }
  <?php } ?>
</script>
<style type="text/css">
  .<?php echo $_code; ?>-notification-bar {
    width: 100%;
    height: auto;
    z-index: 10000;
    font-family: Roboto-Regular, Arial, Tahoma;
    padding: 15px 15px 15px <?php if ($form['close_button_status'] == 2) { ?>35px<?php } else { ?>15px<?php } ?>;
  }

  <?php foreach ($forms as $form) { ?>
    #<?php echo $form['module_id_selector']; ?> {
      background-color: <?php echo $form['background_color']; ?>;
      color: <?php echo $form['text_color']; ?>;
      font-size: <?php echo $form['font_size']; ?>px;
      border-radius: <?php echo $form['border_radius']; ?>px;
      border: <?php echo $form['border_width']; ?>px solid <?php echo $form['border_color']; ?>;
      text-align: <?php echo $form['text_align']; ?>;
      <?php if ($form['animation_type'] == 1 || $form['animation_type'] == 2) { ?>display: none;<?php } ?>
    }

    #<?php echo $form['module_id_selector']; ?>.<?php echo $_code; ?>-notification-bar {
      position: <?php if ($form['display_position_type'] == 1) { ?>relative<?php } else { ?>fixed<?php } ?>;
    }
  <?php } ?>
</style>
<?php } ?>