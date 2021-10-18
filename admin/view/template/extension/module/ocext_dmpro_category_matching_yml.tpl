
        <?php $i = FALSE; ?>

        <?php foreach($categories as $category){ ?>

                    <?php if( !isset($tamplate_data_selected['category']['category_matching'][$yml_category_id][$category['category_id']]) ){ ?>
                    
                        <?php $i = TRUE; ?>
                    
                        <div id="setCategoryMatchingRow_<?php echo $yml_category_id ?>_<?php echo $category['category_id'] ?>__">
                    
                        <input onclick="setCategoryMatchingRow('<?php echo $yml_category_id ?>','<?php echo $category['category_id'] ?>',true,'<?php echo $category['name'] ?>');removeSel(<?php echo $yml_category_id ?>,<?php echo $category['category_id'] ?>,'_')" name="odmproyml_tamplate_data_yml[category][category_matching][<?php echo $yml_category_id ?>][<?php echo $category['category_id'] ?>]" type="checkbox" value="<?php echo $category['category_id'] ?>"  />
                        
                        <label for="odmproyml_tamplate_data_yml[category][category_matching][<?php echo $yml_category_id ?>][<?php echo $category['category_id'] ?>]" >&nbsp;&nbsp;&nbsp;<?php echo $category['name'] ?></label><br>
                        
                        </div>

                    <?php } ?>

        <?php } ?>
        
        <?php if(!$i && $categories){ ?>
        
            Уже все категории выбраны для этой категории YML
        
        <?php }elseif(!$categories){ ?>
        
            На сайте нет созданных категорий
        
        <?php } ?>
