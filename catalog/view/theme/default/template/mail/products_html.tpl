<?php if($products) { ?>
<!--<h3><?php echo $heading_title_products; ?></h3>-->
<table style="border-collapse:collapse;width:100%;margin:0 0 20px 0;table-layout:fixed;">
	<tbody>
		<tr>
			<?php foreach ($products as $product) { ?>
			<td style="padding:5px 10px;text-align:center;">
				<a style="display:block;padding:0;margin:0 0 5px 0;font-size:0;" href="<?php echo $product['href']; ?>">
					<img style="font-size:0;padding:0;margin:0;border:none;" alt="<?php echo $product['name']; ?>" src="<?php echo $product['thumb']; ?>">
				</a> 
				<a target="_blank" href="<?php echo $product['href']; ?>" style="text-decoration:none;color:#00B7FF;display:block;padding:0;margin:0 0 5px 0;font-size:14px;"><?php echo $product['name']; ?></a> 
				<?php if ($product['price']) { ?>
					<?php if (!$product['special']) { ?>
					<span style="font-size:13px;font-weight:bold;color:#000;display:inline-block;margin:0 0 5px 0;"><?php echo $product['price']; ?>
					</span>
					<?php }else{ ?>
					<span style="font-size:12px;color:#F00;text-decoration:line-through;display:inline-block;margin:0 0 5px 0;"><?php echo $product['price']; ?>
					</span>
					<span style="font-size:13px;font-weight:bold;color:#000;display:inline-block;margin:0 0 5px 0;"><?php echo $product['special']; ?>				
					</span>
					<?php } ?>
				<?php } ?>
			</td>
		<?php } ?>
		</tr>
	</tbody>
</table>
<?php } ?>
