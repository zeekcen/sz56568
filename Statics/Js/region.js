function loadRegion(elem, sel,type_id,selName,url){
	jQuery("#box_"+elem+" ."+selName+" option").each(function(){
		jQuery(this).remove();
	});
	jQuery("<option value=0>请选择</option>").appendTo(jQuery("#box_"+elem+" ."+selName));
	if(jQuery("#box_"+elem+" ."+sel).val()==0){
		return;
	}
/*
	jQuery.getJSON(url,{parent_id:jQuery("#box_"+elem+" ."+sel).val(),region_type:type_id},
		function(data){
			if(data){
				jQuery.each(data,function(idx,item){
					jQuery("<option value="+item.region_id+">"+item.region_name+"</option>").appendTo(jQuery("#box_"+elem+" ."+selName));
				});
			}else{
				jQuery("<option value='0'>请选择</option>").appendTo(jQuery("#box_"+elem+" ."+selName));
			}
		}
	);
*/
	jQuery.ajax({
		url:url,
		data:{parent_id:jQuery("#box_"+elem+" ."+sel).val(),region_type:type_id},
                success:function(data){
			data = data.replace(/<script src.*<\/script>/g,'');
			data = eval('(' + data + ')');
                        if(data){
                                jQuery.each(data,function(idx,item){
                                        jQuery("<option value="+item.region_id+">"+item.region_name+"</option>").appendTo(jQuery("#box_"+elem+" ."+selName));
                                });
                        }else{
                                jQuery("<option value='0'>请选择</option>").appendTo(jQuery("#box_"+elem+" ."+selName));
                        }
                }
        });	
}
