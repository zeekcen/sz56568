<?php if (!defined('Yourphp')) die('Yourphp');?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo C('DEFAULT_CHARSET');?>" />
<title><?php echo L('welcome');?> - Powered by Yourphp</title>
<script type="text/javascript" src="/Statics/Js/jquery.min.js"></script>
<script type="text/javascript" src="/Statics/Js/region.js"></script>
<script language="JavaScript">
<!--
$.YourphpInc([ '/Statics/Js/yourphp.admin.min.js','/Statics/Css/style.css']);
function confirm_delete(url){
	var submit = function (v, h, f) {
		if (v == 'ok'){
			location.href = url;
		}
		return true;
	};
	top.YpBox.confirm("<?php echo L('real_delete');?>", "Message", submit);
}
function selectall(name) {
	if (document.getElementById("check_box").checked) {
		$("input[name='"+name+"']").each(function() {
			this.checked=true;
		});
	} else {
		$("input[name='"+name+"']").each(function() {
			this.checked=false;
		});
	}
}
function Tabs(id,title,content,box,on,action){
	if(action){
		  $(id+' '+title).click(function(){
			  $(this).addClass(on).siblings().removeClass(on);
			  $(content+" > "+box).eq($(id+' '+title).index(this)).show().siblings().hide();
		  });
	  }else{
		  $(id+' '+title).mouseover(function(){
			  $(this).addClass(on).siblings().removeClass(on);
			  $(content+" > "+box).eq($(id+' '+title).index(this)).show().siblings().hide();
		  });
	  }
}

function openwin(id,url,title,width,height,lock,yesdo,topurl){ 

	top.YpBox.open("iframe:"+url,title,width,height,{
			id:id,
			submit: function (v, h, f){
				iframeWin = top.YpBox.getIframe(id);
				if (v == 'ok'){
					if(yesdo || topurl){
						if(yesdo){
							yesdo.call(this,iframeWin, id,inputid); 
						}else{
							top.jBox.close(true);
							top.location.href=topurl;
						}
					}else{
						var form = $(iframeWin).contents().find('#dosubmit');
						$(form).click();
						return false;
					}

				}
			}
		});
 
}

function showpicbox(url){
	top.YpBox( '<img src="'+url+'" />',{width:'auto'});
} 
//-->
</script>
</head>
<body width="100%" style="overflow-x:hidden;">
<div id="loader" ><?php echo L('load_page');?></div>
<div id="result" class="result none"></div>
<div class="mainbox">

<?php if(empty($_GET['isajax'])) { ?>
	<div id="nav" class="mainnav_title">
	<div id="lang">
	<?php if(APP_LANG) { ?>
		<?php
		parse_str($_SERVER['QUERY_STRING'],$urlarr);
		unset($urlarr[l]);
		$url='?'.http_build_query($urlarr);
		?>
		<?php $n=1;if(is_array($Lang)) foreach($Lang AS $langvo) { ?>		 
			<a href="<?php echo $url;?>&l=<?php echo $langvo['mark'];?>" <?php if($langvo[mark]==$_SESSION['YP_lang']) { ?> class="on"<?php } ?>><?php echo $langvo['name'];?></a>
		<?php $n++;}unset($n); ?>
	<?php } ?>
	</div>
	<ul><a href="<?php echo U($nav[bnav][model].'/'.$nav[bnav][action],$nav[bnav][data]);?>"><?php echo $nav['bnav']['name'];?></a>|
	<?php $n=1;if(is_array($nav[nav])) foreach($nav[nav] AS $vonav) { ?>	
	<?php if($vonav[data][isajax]) { ?>
	<a href="javascript:void(0);" onclick="openwin('<?php echo $vonav['action'];?>','<?php echo U($vonav[model].'/'.$vonav[action],$vonav[data]);?>','<?php echo $vonav['name'];?>',600,440)"><?php echo $vonav['name'];?></a>|
	<?php } else { ?>
	<a href="<?php echo U($vonav[model].'/'.$vonav[action],$vonav[data]);?>"><?php echo $vonav['name'];?></a>|
	<?php } ?>
	<?php $n++;}unset($n); ?></ul>
	</div>
	<script>
	//|str_replace=.'/index.php','',###
	var onurl ='<?php echo $_SERVER["REQUEST_URI"];?>';
	jQuery(document).ready(function(){
		$('#nav ul a ').each(function(i){
		if($('#nav ul a').length>1){
			var thisurl= $(this).attr('href');
			thisurl = thisurl.replace('&menuid=<?php echo cookie("menuid");?>','');
			if(onurl.indexOf(thisurl) == 0 ) $(this).addClass('on').siblings().removeClass('on');
		}else{
			$('#nav ul').hide();
		}
		});
		if($('#nav ul a ').hasClass('on')==false){
		$('#nav ul a ').eq(0).addClass('on');
		}
	});
	</script>
<?php } ?>
<script type="text/javascript" src="/Statics/Js/swfupload.js"></script> 

<script>
$('#nav ul a ').removeClass('on');
<?php if(!empty($_GET['type'])) { ?>
$('#nav ul a ').eq(3).addClass('on');
<?php } ?>
<?php if($action_name=='add' && empty($_GET['type'])) { ?>
$('#nav ul a ').eq(1).addClass('on');
<?php } ?>
</script>

<form name="YpForm"  id="YpForm"  action="<?php if($action_name=='add') {  echo U('Category/insert'); } else {  echo U('Category/update'); } ?>&iscreatehtml=1" method="post">


<div id="tabs" style="margin-top:10px;">
	<div class="title"><ul style="margin-left:30px;"><li class="on"><a href="javascript:void(0);"><?php echo L(base_setup);?></a></li>
	<li style="margin-left:10px;"><a href="javascript:void(0);"><?php echo L(seo_setup);?></a></li>
</ul></div>

<div class="content_2">
	<div class="tabbox" style="display:block;">
		<table cellpadding=0 cellspacing=0 class="table_form"width="100%"><tr>
		<td width="20%"><?php echo L('chose_module');?></td>
        <td width="80%" class="box_thumb">

		<div class="thumb_box" style ="margin-top:-7px;left:340px;"><div id="image_aid_box"></div>
		<a href="javascript:swfupload('image_uploadfile','image','<?php echo L(uploadfiles);?>',1,1,0,1,'jpeg,jpg,png,gif',3,0,'<?php echo $yourphp_auth;?>',yesdo,nodo)">
		<img src="<?php if(!empty($vo['image'])) {  echo $vo['image']; } else { ?>/Statics/Images/admin_upload_thumb.png<?php } ?>" id="image_pic" ></a><br> <input type="button" value="<?php echo L('clean_thumb');?>" onclick="javascript:clean_thumb('image');" class="button" /><input type="hidden"  id="image" name="image"  value="<?php echo $vo['image'];?>" /></div>
		<?php echo Form::select(array('field'=>'moduleid','options'=>$module+array('0'=>array('id'=>0,'title'=>L('Module_url'))),'options_key'=>'id,title','setup'=>array('onchange'=>'changetemplate(this.value)')),$vo['moduleid']);?>	
		</td>
      </tr>
      <tr>
        <td><?php echo L('chose_parentid');?></td>
        <td>

		<select name="parentid">
		<option value=""><?php echo L('select_parentid');?></option>
		<?php echo $select_categorys;?>
		</select>
		</td>
      </tr>

      	<tr>
		<td><?php echo L('catname');?></td>
		<td><input type="text" name="catname" class="input-text  required" value="<?php echo $vo['catname'];?>"  minlength="1"  maxlength="30"  /></td>
		</tr>

	    <tr>
		<td><?php echo L('catdir');?></td>
		<td><input type="text" id="catdir" name="catdir" class="input-text " value="<?php echo $vo['catdir'];?>" 
	 validate="en_num:true,remote: '<?php echo U('Category/checkdcatdir?id='.$vo[id]);?>' " /></td>
		</tr>



		<tr id="module_url" style="display:none;">
		<td><?php echo L('cat_link_url');?></td>
		<td><input type="text" name="url" class="input-text" value="<?php if($vo['type']==1) {  echo $vo['url']; } ?>" size='50'  /><input type="hidden" id="type" name="type" value="0" /></td>
		</tr>
 

		<tr style="background:#EFEFEF;">
		<td><?php echo L('chage_is');?>: </td>
		<td><input type="checkbox"  class="input_checkbox "  id="chage_all" name="chage_all" value="1" /><font color="red"> <?php echo L('chage_all');?></font>
		</td>
		</tr>

      	<tr>
		<td><?php echo L('ismenu');?></td>
		<td><?php echo Form::radio(array('field'=>'ismenu','options'=>array('1'=>L('yes'),'0'=>L('no'))),$vo['ismenu']);?></td>
		</tr>



		<tr>
		<td><?php echo L('ishtml');?></td>
		<td><?php echo Form::radio(array('field'=>'ishtml','options'=>array('1'=>L('yes'),'0'=>L('no')),'setup'=>array('onclick'=>'urlrule(this.value)')),$vo['ishtml']);?></td>
		</tr>

		<tr id="urlrule">
		<td><?php echo L('urlrule');?></td>
		<td><?php echo Form::select(array('field'=>'urlruleid','options'=>$Urlrule,'options_key'=>'key,listexample'),$vo['urlruleid']);?></td>
		</tr>



		<tr>
		<td><?php echo L('readgroup');?></td>
		<td><?php echo Form::checkbox(array('field'=>'readgroup','options'=>$rlist,'options_key'=>'key,name'),$vo['readgroup']);?></td>
		</tr>


		<tr>
		<td><?php echo L('postgroup');?></td>
		<td><?php echo Form::checkbox(array('field'=>'postgroup','options'=>$rlist,'options_key'=>'key,name'),$vo['postgroup']);?></td>
		</tr>

		<tr>
		<td><?php echo L('chargesetup');?></td>
		<td><?php echo L('presentpoint');?> <input type="text" class="input-text" name="presentpoint" style="width:20px;" value="<?php echo $vo['presentpoint'];?>"/><?php echo L('dian');?> ,
		<?php echo L('defaultchargepoint');?> <input type="text" class="input-text" name="chargepoint"  style="width:20px;"   value="<?php echo $vo['chargepoint'];?>"/><?php echo Form::select(array('field'=>'paytype','options'=>array('0'=>L('dian'),'1'=>L('yuan'))),$vo['paytype']);?> ,
		<?php echo L('repeatchargedays');?> <input type="text" class="input-text" name="repeatchargedays"  style="width:20px;" value="<?php echo $vo['repeatchargedays'];?>"/><?php echo L('tian');?>
		</td>
		</tr> 
 
		<tr>
		<td><?php echo L('pagesize');?></td>
		<td><input type="text" name="pagesize" class="input-text" value="<?php if(!empty($vo['pagesize'])) {  echo $vo['pagesize']; } ?>" size="3" /> <font color="red"><?php echo L('pagesize_desc');?></font></td>
		</tr>

		<tr>
		<td><?php echo L('template_list');?></td>
		<td>
		<select id="template_list" name="template_list"></select> &nbsp;&nbsp; <input type="checkbox"  class="input_checkbox " id="listtype" name="listtype"  onclick="javascript:templatetype();" value="1"  <?php if(!empty($vo['listtype'])) { ?>checked<?php } ?> /> <?php echo L('listtype');?>
			</td>
		</tr>

		<tr>
		<td><?php echo L('template_show');?></td>
		<td><select id="template_show" name="template_show"></select>
		</td>
		</tr>
		</table>



	</div>

	<div class="tabbox" style="display:none;">
		<table cellpadding=0 cellspacing=0 class="table_form"width="100%">
		 <tr>
		  <td><?php echo L('seo_title');?></td>
		  <td><input name='title' type='text' id='meta_title' value="<?php echo $vo['title'];?>" class="input-text"  size='60' maxlength='150'></td>
		</tr>
		<tr>
		  <td><?php echo L('seo_keywords');?></td>
		  <td><input name='keywords' type='text' id='meta_keywords' value="<?php echo $vo['keywords'];?>" class="input-text"  size='60' maxlength='150'></td>
		</tr>
		<tr>
		  <td><?php echo L('seo_description');?></td>
		  <td><textarea name='description' id='meta_description'  rows="5" cols="60" ><?php echo $vo['description'];?></textarea></td>
		</tr>
		</table>
	</div>
</div>
 


		<div class="btn">
		<?php if($vo['id']) { ?><input TYPE="hidden" name="id" value="<?php echo $vo['id'];?>"><?php } ?>
		<INPUT TYPE="submit"  value="<?php echo L('dosubmit');?>" class="button" >
		<input TYPE="reset"  value="<?php echo L('cancel');?>" class="button">
		</div>

</form></div>
<script>

var modulearr = new Array();
<?php $n=1;if(is_array($module)) foreach($module AS $mdate) { ?>
modulearr[<?php echo $mdate['id'];?>] = "<?php echo $mdate['name'];?>";
<?php $n++;}unset($n); ?>
var templatearr = new Array();
<?php $n=1; if(is_array($templates)) foreach($templates AS $i => $tem) { ?>
templatearr[<?php echo $i;?>] = "<?php echo $tem['name'];?>,<?php echo $tem['value'];?>,<?php echo $tem['filename'];?>";
<?php $n++;}unset($n); ?>


var datas = "<option value=''><?php echo L('please_chose');?></option>";
var moduleid =  $('#moduleid').val();


showtemplist(moduleid,<?php if(empty($vo['listtype'])) { ?>0<?php } else {  echo $vo['listtype']; } ?>);
function showtemplist(m,t){
	var type='_list';
	if(t){type='_index';}
	var mtlist = modulearr[m]+type;
	var mtshow = modulearr[m]+'_show';
	if(modulearr[m]=='Page') mtlist=mtshow ='Page';
	$('#template_list').html(datas);
	$('#template_show').html(datas);
	listdatas = showdatas ='';
	for(i=1;i<templatearr.length;i++){
		data = templatearr[i].split(',');
		if(data[0].indexOf(mtlist)  >= 0){
			listdatas  ="<option value='"+data[1]+"'>"+data[2]+"</option>";
			$('#template_list').append(listdatas);
		}
		if(data[0].indexOf(mtshow)  >= 0){
			showdatas ="<option value='"+data[1]+"'>"+data[2]+"</option>";
			$('#template_show').append(showdatas);
		}
	}
	$("#template_list").attr("value",'<?php echo $vo['template_list'];?>');
	$("#template_show").attr("value",'<?php echo $vo['template_show'];?>');
}
function changetemplate(m){
	if(m==0){
		$('#module_url').show();
		$('#type').val('1');
		$('#catdir').removeClass('required');
	}else{
		$('#module_url').hide();
		$('#type').val('0');
		$('#catdir').addClass('required');
	}
	showtemplist(m,0);
	$("#listtype").removeAttr("checked");
}
function templatetype(){
	var moduleid = $('#moduleid').val();
	if($("#listtype").attr('checked')=='checked'){
		showtemplist(moduleid,1);
	}else{
		showtemplist(moduleid,0);
	}
}
new Tabs("#tabs",".title ul li",".content_2",".tabbox","on",1);


function urlrule(m){
 
	if(m==1){
		$('#urlrule').show();
	}else{
		$('#urlrule').hide();
	}
}
urlrule(<?php echo $vo['ishtml'];?>);


<?php if(!empty($_GET['type'])) { ?>
$('#moduleid').val(0);changetemplate(0);
<?php } ?>


</script>