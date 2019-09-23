<?php echo $header; ?>
<section class="container"><?php echo $column_left; ?><?php echo $column_right; ?>

<div id="content"><?php echo $content_top; ?>
  
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $i=>$breadcrumb){ if($i+1 < count($breadcrumbs)){ ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } else { echo $breadcrumb['text']; }} ?>
  </div>

  <h1><?php echo $heading_title; ?></h1>
  
  <div id="contacts" class="right-left">
    <div class="left-content">
            
      <h4><?php echo $store; ?></h4>
      
      <?php if ($image) { ?>
        <div><img src="<?php echo $image; ?>" alt="<?php echo $store; ?>" /></div>
      <?php } ?>
      
      <div class="address"><address><?php echo $address; ?></address></div>
              
      <div class="phone"><strong><?php echo $text_telephone; ?></strong><br /><?php echo $phone; ?></div>
      
      <?php if ($fax) { ?>
        <div>
          <strong>E-mail</strong><br>
          <?php echo $fax; ?>
        </div>
      <?php } ?>

            
      <?php if ($open) { ?>
        <div>
          <strong><?php echo $text_open; ?></strong><br />
          <?php echo $open; ?><br />
        </div>
      <?php } ?>
              
      <?php if ($comment) { ?>
        <div>
          <strong><?php echo $text_comment; ?></strong><br />
          <?php echo $comment; ?>
        </div>
      <?php } ?>

    </div>
    
    <div class="right-content">
      <form onsubmit="return false;">
        <h4><?php echo $text_contact; ?></h4>
        <div class="msg_error"></div>
        <div class="elem"><input type="text" name="name" value="" placeholder="<?php echo $entry_name; ?>" /></div>
        <div class="elem"><input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?> *" class="requir" /></div>
        <div class="elem"><textarea name="info" rows="3" placeholder="<?php echo $entry_enquiry; ?> *" class="requir"></textarea></div>
        <div class="sbmt"><span class="btn goform"><?php echo $button_submit; ?></span></div>
        <input type="hidden" name="title" value="Письмо с сайта" />
      </form>
    </div>
      
  </div>
      
      
     <?php if ($geocode) { ?>
       <div id="contacts-map"><?php echo $geocode; ?></div>
     <?php } ?>
      
      
      
      <?php if ($locations) { ?>
      <h3><?php echo $text_store; ?></h3>
        <?php foreach ($locations as $location) { ?>
        <div class="store-location">
          
          <?php if ($location['image']) { ?>
            <div class="col-sm-3"><img src="<?php echo $location['image']; ?>" alt="<?php echo $location['name']; ?>" title="<?php echo $location['name']; ?>" /></div>
          <?php } ?>
          
          <h4><?php echo $location['name']; ?></h4>
          
          <div><address><?php echo $location['address']; ?></address></div>
          
          <?php if ($location['geocode']) { ?><div><?php echo $location['geocode']; ?></div><?php } ?>
          
          <div>
            <strong><?php echo $text_telephone; ?></strong><br>
            <?php echo $location['telephone']; ?>
          </div>
          
          <?php if ($location['fax']) { ?>
          <div>
            <strong><?php echo $text_fax; ?></strong><br>
            <?php echo $location['fax']; ?>
          </div>
          <?php } ?>

          <?php if ($location['open']) { ?>
          <div>
            <strong><?php echo $text_open; ?></strong><br />
            <?php echo $location['open']; ?>
          </div>
          <?php } ?>
          
          <?php if ($location['comment']) { ?>
          <div>
            <strong><?php echo $text_comment; ?></strong><br />
            <?php echo $location['comment']; ?>
          </div>
          <?php } ?>

        </div>
      <?php } } ?>

      
<?php echo $content_bottom; ?>
</div>
</section>
<?php echo $footer; ?>
