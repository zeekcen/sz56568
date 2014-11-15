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


<form  id="YpForm" name="YpForm" action="<?php echo U('Type/listorder');?>" method="post">
<div class="table-list">
    <table width="100%" cellspacing="0">
        <thead>
      		<tr>
            <th width="40"><?php echo L('listorder');?></th>
            <th width="20">typeid</th>
            <th align="left"><?php echo L('name');?></th>	
			<th width="*" align="left"><?php echo L('description');?></th>
			<th width="40"><?php echo L('status');?></th>
			<th width="270"><?php echo L('manage');?></th>
            </tr>
      	</thead>
      	<tbody>
			<?php $n=1; if(is_array($list)) foreach($list AS $k => $vo) { ?>
      		<tr>
			<td  width="40" align='center'><input name="listorders[<?php echo $vo['typeid'];?>]" type='text' size='3' value="<?php echo $vo['listorder'];?>"></td>
			<td align='center'><?php echo $vo['typeid'];?></td>
			<td ><?php echo $vo['name'];?></td>
			<td><?php echo $vo['description'];?></td>
 			<td align='center'>
			<?php if($vo[status]==1) { ?>
				<a href="<?php echo U('Type/status',array(typeid=>$vo['typeid'],status=>0));?>"><font color="green"><?php echo L('enable');?></font></a>
			<?php } else { ?>				
				<a href="<?php echo U('Type/status',array(typeid=>$vo['typeid'],status=>1));?>"><font color="red"><?php echo L('disable');?></font></a>	
			<?php } ?>
			</td>
      		<td align="center">
			<a href="<?php echo U('Type/index',array(keyid=>$vo['keyid'],parentid=>$vo['typeid']));?>"><?php echo L('type_manage');?></a> |  
			<a href="<?php echo U('Type/add',array(keyid=>$vo['keyid'],parentid=>$vo['typeid']));?>"><?php echo L('add_type');?></a> | 
			<a href="<?php echo U('Type/edit',array(keyid=>$vo['keyid'],typeid=>$vo['typeid']));?>"><?php echo L('edit');?></a> | 
			<a href="javascript:confirm_delete('<?php echo U('Type/delete',array(typeid=>$vo['typeid']));?>')"><?php echo L('delete');?></a> 
      		</td>      		
      		</tr>
      		<?php $n++;}unset($n); ?>
      	</tbody>       
      	</table>
</div>

  <div class="btn">  <input  type="button" class="button" name="dosubmit" value="<?php echo L(listorder);?>" onclick="YpForm.action='<?php echo U($module_name.'/listorder');?>';$('#YpForm').submit();" /></div> 

</form></div>
</body></html>