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

<form method='post'   id="YpForm"  action="<?php echo U('Config/dosite');?>">
<table cellpadding=0 cellspacing=0 width="100%" class="table_form" >


	<tr>
		<th style="width:120px;"><?php echo L('APP_DEBUG');?>:</th>
		<td><?php echo Form::select(array('field'=>'APP_DEBUG','options'=>$openarr),$APP_DEBUG);?> </td>
	</tr>

	<tr>
		<th style="width:120px;"><?php echo L('PAGE_LISTROWS');?>:</th>
		<td><input name="PAGE_LISTROWS" type="text"  class="input-text" size="5" id="PAGE_LISTROWS" value="<?php echo $PAGE_LISTROWS;?>"></td>
	</tr>


	<tr>
		<th><?php echo L('URL_MODEL');?>:</th>
		<td><?php echo Form::select(array('field'=>'URL_MODEL','options'=>$urlmodelarr,'setup'=>array('onchange'=>'urlrule(this.value)')),$URL_MODEL);?>
		</td>
	</tr>

	<tr id="urlrule">
		<th><?php echo L('URL_Urlrule');?>:</th>
		<td><?php echo Form::select(array('field'=>'URL_URLRULE','options'=>$Urlrule),$URL_URLRULE);?></td>
	</tr>

 
	<tr>
		<th><?php echo L('URL_HTML_SUFFIX');?>:</th>
		<td><input name="URL_HTML_SUFFIX" type="text" class="input-text" id="URL_HTML_SUFFIX" value="<?php echo $URL_HTML_SUFFIX;?>"></td>
	</tr>

 
	 
	<tr>
		<th><?php echo L('TMPL_CACHE_ON');?>:</th>
		<td><?php echo Form::select(array('field'=>'TMPL_CACHE_ON','options'=>$openarr),$TMPL_CACHE_ON);?>
		</td>
	</tr>
	<tr>
		<th><?php echo L('TMPL_CACHE_TIME');?>:</th>
		<td><input name="TMPL_CACHE_TIME" type="text" id="TMPL_CACHE_TIME" value="<?php echo $TMPL_CACHE_TIME;?>"> </td>
	</tr>
	<tr>
		<th><?php echo L('HTML_CACHE_ON');?>:</th>
		<td><?php echo Form::select(array('field'=>'HTML_CACHE_ON','options'=>$openarr),$HTML_CACHE_ON);?></td>
	</tr>
	<tr>
		<th><?php echo L('HTML_CACHE_TIME');?>:</th>
		<td><input name="HTML_CACHE_TIME" type="text" class="input-text"  id="HTML_CACHE_TIME" value="<?php echo $HTML_CACHE_TIME;?>"> </td>
	</tr>
	 
	<tr>
		<th><?php echo L('HTML_FILE_SUFFIX');?>:</th>
		<td><input name="HTML_FILE_SUFFIX" type="text" class="input-text"  id="HTML_FILE_SUFFIX" value="<?php echo $HTML_FILE_SUFFIX;?>">
		
		</td>
	</tr>
	<tr>
		<th>ADMIN_ACCESS:</th>
		<td><input name="ADMIN_ACCESS" type="text"  class="input-text" size="40" id="ADMIN_ACCESS" value="<?php echo $ADMIN_ACCESS;?>"> </td>
	</tr>
	<tr>
		<th><?php echo L('HOME_ISHTML');?>:</th>
		<td><?php echo Form::select(array('field'=>'HOME_ISHTML','options'=>$openarr),$HOME_ISHTML);?></td>
	</tr>
	<tr>
		<th><?php echo L('ADMIN_VERIFY');?>:</th>
		<td><?php echo Form::select(array('field'=>'ADMIN_VERIFY','options'=>$openarr),$ADMIN_VERIFY);?></td>
	</tr>
 
	<tr>
		<th><?php echo L('COOKIE_PATH');?>:</th>
		<td><input name="COOKIE_PATH" type="text" class="input-text" id="COOKIE_PATH" value="<?php echo $COOKIE_PATH;?>"> </td>
	</tr>
	<tr>
		<th><?php echo L('COOKIE_DOMAIN');?>:</th>
		<td><input name="COOKIE_DOMAIN" type="text" class="input-text" id="COOKIE_DOMAIN" value="<?php echo $COOKIE_DOMAIN;?>"> </td>
	</tr>
	<tr>
		<th><?php echo L('DEFAULT_LANG');?>:</th>
		<td><?php echo Form::select(array('field'=>'DEFAULT_LANG','options'=>$Lang,'options_key'=>'key,name'),$DEFAULT_LANG);?></td>
	</tr>
</table>
<div class="btn">
<INPUT TYPE="submit"  value="<?php echo L('save');?>" class="button" >
<input TYPE="reset"  value="<?php echo L('reset');?>" class="button">
</div>
</form>
</div>
<script>
function urlrule(m){
 
	if(m==1 || m==2){
	$('#urlrule').show();
	}else{
	$('#urlrule').hide();
	}
}
urlrule(<?php echo $URL_MODEL;?>);
</script>