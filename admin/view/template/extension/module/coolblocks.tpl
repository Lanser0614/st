<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-coolblocks" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-coolblocks" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>          
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-heading"><?php echo $entry_heading; ?></label>
            <div class="col-sm-10">
              <input type="text" name="heading" value="<?php echo $heading; ?>" placeholder="<?php echo $entry_heading; ?>" id="input-heading" class="form-control" />
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-id"><?php echo $entry_id; ?></label>
            <div class="col-sm-10">
              <input type="text" name="id" value="<?php echo $id; ?>" placeholder="<?php echo $entry_id; ?>" id="input-id" class="form-control" />
            </div>
          </div>
         
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          
          
          
          
          <div id="tab-image">
          <div class="table-responsive">
                <table id="images" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_image; ?></td>
                      <td class="text-right"><?php echo $entry_link; ?></td>
                      <td class="text-right"><?php echo $entry_title; ?></td>
                      <td class="text-right"><?php echo $entry_text; ?></td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $image_row = 0; ?>
                    <?php foreach ($coolblocks as $coolblock) { ?>
                    <tr id="image-row<?php echo $image_row; ?>">
                      <td class="text-left"><a href="" id="thumb-image<?php echo $image_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo ($coolblock['image'] ? '/image/'.$coolblock['image'] : $placeholder); ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" style="width:100px;" /></a><input type="hidden" name="coolblocks[<?php echo $image_row; ?>][image]" value="<?php echo $coolblock['image']; ?>" id="input-image<?php echo $image_row; ?>" /></td>
                      
                      <td class="text-right"><input type="text" name="coolblocks[<?php echo $image_row; ?>][link]" value="<?php echo $coolblock['link']; ?>" placeholder="<?php echo $entry_link; ?>" class="form-control" />
                      </td>
                      
                      <td class="text-right"><input type="text" name="coolblocks[<?php echo $image_row; ?>][title]" value="<?php echo $coolblock['title']; ?>" placeholder="<?php echo $entry_title; ?>" class="form-control" />
                      </td>
                      
                      <td class="text-right"><textarea name="coolblocks[<?php echo $image_row; ?>][text]" rows="3" placeholder="<?php echo $entry_text; ?>" class="form-control"><?php echo $coolblock['text']; ?></textarea>
                      </td>
                      
                      <td class="text-left"><button type="button" onclick="$('#image-row<?php echo $image_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                    </tr>
                    <?php $image_row++; ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="4"></td>
                      <td class="text-left"><button type="button" onclick="addImage();" data-toggle="tooltip" title="<?php echo $button_block_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
              </div>
              
              
              
              
              
        </form>
      </div>
    </div>
  </div>
 
<script type="text/javascript"><!--
var image_row = <?php echo $image_row; ?>;

function addImage() {
	html  = '<tr id="image-row' + image_row + '">';
	
	html += '  <td class="text-left"><a href="" id="thumb-image' + image_row + '"data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="coolblocks[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';
	html += '  <td class="text-right"><input type="text" name="coolblocks[' + image_row + '][link]" value="" placeholder="<?php echo $entry_link; ?>" class="form-control" /></td>';
	html += '  <td class="text-right"><input type="text" name="coolblocks[' + image_row + '][title]" value="" placeholder="<?php echo $entry_title; ?>" class="form-control" /></td>';
	
	html += '  <td class="text-right"><textarea name="coolblocks[' + image_row + '][text]" rows="3" placeholder="<?php echo $entry_text; ?>" class="form-control"></textarea></td>';
											
											
	html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';

	$('#images tbody').append(html);

	image_row++;
}
//--></script></div>
<?php echo $footer; ?>
