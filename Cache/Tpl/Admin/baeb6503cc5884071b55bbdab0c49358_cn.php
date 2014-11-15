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

<table  class="search_table" width="100%">
	<tr>
		<td>
			<form action="<?php echo U('User/index');?>" method="get">
			<input type="hidden" name="g" value="<?php echo GROUP_NAME;?>" />
			<input type="hidden" name="m" value="<?php echo MODULE_NAME;?>" />
			<input type="hidden" name="a" value="<?php echo ACTION_NAME;?>" />			
			<?php echo L('user_select_option');?>: <input type="text" name="keyword"  class="input-text" value="<?php echo $keyword;?>"/>
			<select name="searchtype">
			<option value="username" <?php if($searchtype=='username') { ?>selected<?php } ?>><?php echo L('username');?></option>
			<option value="realname" <?php if($searchtype=='realname') { ?>selected<?php } ?>><?php echo L('realname');?></option>
			<option value="id" <?php if($searchtype=='id') { ?>selected<?php } ?>>ID</option>
			</select>
			<select name="groupid">
			<option value=""><?php echo L('user_group');?></option>
			<?php $n=1;if(is_array($usergroup)) foreach($usergroup AS $row) { ?>
			<option value="<?php echo $row['id'];?>"  <?php if($groupid==$row['id']) { ?>selected="selected"<?php } ?>><?php echo $row['name'];?></option>
			<?php $n++;}unset($n); ?>
			</select>
			<input type="submit" value="<?php echo L('chaxun');?>"  class="button" />
			<input type="reset" value="<?php echo L('reset');?>" class="button"  />
			</form>
		</td>
		
	</tr>
</table>

<form name="YpForm" action="<?php echo U('User/deleteall');?>" method="post">
<div class="table-list">
    <table width="100%" cellspacing="0">
        <thead>
      		<tr>
      		<th width="20"><input type="checkbox"  id="check_box"  onclick="selectall('ids[]');" /></th>
			<th width="40">ID</th>
			<th align="left"><?php echo L('username');?></th>	
			<th width="110"><?php echo L('user_group');?></th>
			<th width="120"><?php echo L('email');?></th>
			<th width="150"><?php echo L('user_reg_time');?></th>	
			<th  width="30"><?php echo L('status');?></th>
			<th  width="120"><?php echo L('manage');?></th>
      		</tr>
      	</thead>
      	<tbody>
			<?php $n=1; if(is_array($ulist)) foreach($ulist AS $k => $user) { ?>
      		<tr>
      		<td align="center"><input type="checkbox" name="ids[]" value="<?php echo $user['id'];?>" /></td>
			<td align="center"><?php echo $user['id'];?></td>
      		<td><?php echo $user['username'];?></td>
			<td align="center"><?php echo $usergroup[$user['groupid']]['name'];?></td>
      		<td><?php echo $user['email'];?></td>
      		<td align="center"><?php echo date("Y-m-d H:m:s",$user['createtime']);?></td>     		
			<td align="center">
      		<?php if($user['status']=='1') { ?>
      		<?php echo L('enable');?>
      		<?php } else { ?>
      		<?php echo L('disable');?>
      		<?php } ?>
      		</td>
			<td align="center"><a href="<?php echo U('User/edit',array(id=>$user['id']));?>"><?php echo L('edit');?></a> | <a href="javascript:confirm_delete('<?php echo U('User/delete',array(id=>$user['id']));?>')"><?php echo L('delete');?></a></td>      		
      		</tr>
      		<?php $n++;}unset($n); ?>
      	</tbody>
    </table>
  
    <div class="btn"><input type="submit" class="button" name="dosubmit" value="<?php echo L('delete')?>" /></div>  </div>
</div>
</form>

<div id="pages" class="page"><?php echo $page;?></div>