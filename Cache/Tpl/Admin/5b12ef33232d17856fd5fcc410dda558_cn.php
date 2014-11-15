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

	<form id="YpForm" name="YpForm" method="post" action="">
	<div class="table-list">
       <table cellpadding=0 cellspacing=0  width="100%">
	   <thead>
		<tr>
        <th style="width:4%">选择</th>
		 <th align="left" style="width:20%">名称</th>
              <th align="left" style="width:15%">类型</th>
              <th align="left" style="width:15%">字符集</th>
              <th align="left" style="width:8%">记录数</th>              
              <th align="left" style="width:8%">碎片</th>
			  <th align="left" style="width:8%">大小</th>
		</tr>
		</thead> 
		<tbody>
		<?php $n=1;if(is_array($dataList)) foreach($dataList AS $vo) { ?>
		<tr>
		<td><input type="checkbox" name="tables[]" value="<?php echo $vo['Name'];?>" id="<?php echo $vo['Name'];?>"> </td>
        <td><?php echo $vo['Name'];?></td>
        <td><?php echo $vo['Engine'];?></td>
        <td><?php echo $vo['Collation'];?></td>
        <td><?php echo $vo['Rows'];?></td>       
        <td><?php echo byte_format($vo[Data_free]);?></td>
		 <td><?php echo byte_format($vo[Data_length]);?></td>
		</tr>
		<?php $n++;}unset($n); ?>
		</tbody>
		</table> 
		</div>
		<div class="btn">
			<input type="checkbox" value="" id="check_box" onclick="selectall('tables[]');">全选&nbsp;&nbsp;
			<input type="button" class="button"  name="" value="修复" onclick="YpForm.action='<?php echo U($module_name.'/docommand?do=repair');?>';$('#YpForm').submit();" >
			<input type="button" class="button"  name="" value="优化" onclick="YpForm.action='<?php echo U($module_name.'/docommand?do=optimze');?>';$('#YpForm').submit();">
			<input type="button"  class="button"  name="" value="检查" onclick="YpForm.action='<?php echo U($module_name.'/docommand?do=check');?>';$('#YpForm').submit();">
			<input type="button"  class="button"  name="" value="分析" onclick="YpForm.action='<?php echo U($module_name.'/docommand?do=analyze');?>';$('#YpForm').submit();" >       
			 <input type="button"  class="button"  name="" value="结构" onclick="YpForm.action='<?php echo U($module_name.'/docommand?do=show');?>';$('#YpForm').submit();">
			 分卷大小：<input type="text" name="sizelimit" value="2048" class="input-text" size=4>
			 <input type="button" class="button"  name="" value="执行备份" onclick="YpForm.action='<?php echo U($module_name.'/backup');?>';$('#YpForm').submit();">
			<span style="float:right;color:#FB0000">数据库大小：<?php echo byte_format($totalSize);?></span>
		</div>  
		 
	</form>