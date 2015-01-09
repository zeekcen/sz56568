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
		<td class="search">
			<form action="<?php echo U($module_name.'/index');?>" method="get">
			<input type="hidden" name="g" value="<?php echo GROUP_NAME;?>" />
			<input type="hidden" name="m" value="<?php echo MODULE_NAME;?>" />
			<input type="hidden" name="a" value="<?php echo ACTION_NAME;?>" />

			<input id="title" type="text" size="14" class="input-text" name="keyword" value="<?php echo $keyword;?>" />
			<select name="searchtype">
			<?php if($fields['name']) { ?><option value="title" <?php if($searchtype=='name') { ?>selected="selected"<?php } ?>><?php echo L('name');?></option><?php } ?>
			<?php if($fields['title']) { ?><option value="title" <?php if($searchtype=='title') { ?>selected="selected"<?php } ?>><?php echo L('title');?></option><?php } ?>
			<?php if($fields['username']) { ?><option value="username" <?php if($searchtype=='username') { ?>selected="selected"<?php } ?>><?php echo L('username');?></option><?php } ?>
			<?php if($fields['keywords']) { ?><option value="keywords" <?php if($searchtype=='keywords') { ?>selected="selected"<?php } ?>><?php echo L('keywords');?></option><?php } ?>
			<option value="id" <?php if($searchtype==$id) { ?>selected="selected"<?php } ?>>ID</option>
			</select>
			<?php if($fields['catid']) { ?>
			<select id="catid" name="catid">
			<option value=""><?php echo L('select_category');?></option>
			<?php echo $select_categorys;?>
			</select>
			<?php } ?>

			<?php if($fields['typeid']) { ?>
			<select id="typeid" name="typeid">
			<option value=""><?php echo L('select_typeid');?></option>
			<?php $n=1;if(is_array($Type)) foreach($Type AS $row) { ?>
			<?php if($row['parentid']==$fields['typeid']['setup']['default']) { ?><option value="<?php echo $row['typeid'];?>" <?php if($typeid==$row['typeid']) { ?>selected="selected"<?php } ?>><?php echo $row['name'];?></option><?php } ?>
			<?php $n++;}unset($n); ?>
			</select>
			<?php } ?>


			<?php if($fields['posid']) { ?>
			<select id="posid" name="map[posid]">
			<option value=""><?php echo L('select_posids');?></option>
			<?php $n=1;if(is_array($posids)) foreach($posids AS $row) { ?>
			<option value="<?php echo $row['id'];?>" <?php if($posid ==$row['id']) { ?>selected="selected"<?php } ?>><?php echo $row['name'];?></option>
			<?php $n++;}unset($n); ?>
			</select>
			<?php } ?>


			<select id="status" name="map[status]">
			<option value=""><?php echo L('status');?></option>
			<option value="0" <?php if(isset($status) && $status ==0) { ?>selected="selected"<?php } ?>><?php echo L(noshenhe);?></option>
			<option value="1" <?php if(isset($status) && $status ==1) { ?>selected="selected"<?php } ?>><?php echo L(isshenhe);?></option>
			</select>


			<select id="order" name="order">
			<option value="listorder" <?php if($order=='listorder') { ?>selected="selected"<?php } ?>><?php echo L('listorder');?></option>
			<option value="<?php echo $pkid;?>" <?php if($order=='$pkid') { ?>selected="selected"<?php } ?>>ID<?php echo L('listorder');?></option>
			<?php if($fields['hits']) { ?><option value="hits" <?php if($order=='hits') { ?>selected="selected"<?php } ?>><?php echo L('hits'); echo L('listorder');?></option><?php } ?>
			</select>

			<select name="sort">
				<option value="asc" <?php if($sort =='asc') { ?>selected="selected"<?php } ?>><?php echo L('order_by_asc');?></option>
				<option value="desc" <?php if($sort =='desc') { ?>selected="selected"<?php } ?>><?php echo L('order_by_desc');?></option>
			</select>

			<select name="listRows">
				<option value="15" <?php if($listRows ==5) { ?>selected="selected"<?php } ?>>15<?php echo L('listRows');?></option>
				<option value="20" <?php if($listRows ==20) { ?>selected="selected"<?php } ?>>20<?php echo L('listRows');?></option>
				<option value="50" <?php if($listRows ==50) { ?>selected="selected"<?php } ?>>50<?php echo L('listRows');?></option>
				<option value="100" <?php if($listRows ==100) { ?>selected="selected"<?php } ?>>100<?php echo L('listRows');?></option>
			</select>

			<input type="hidden" id="menuid" name="menuid" value="<?php echo intval($_GET['menuid']);?>"/>
			<input type="submit" value="<?php echo L('chaxun');?>"  class="button" />
			<input type="reset" value="<?php echo L('reset');?>" class="button"  />
			</form>
		</td>

	</tr>
</table>

<form name="YpForm" id="YpForm" action="" method="post">

<div class="table-list">
    <table width="100%" cellspacing="0">
		<thead>
            <tr>
			<th width="30"><input type="checkbox" value="" id="check_box" onclick="selectall('ids[]');"></th>
            <th width="40"><?php echo L('listorder');?></th>
            <th width="40">ID</th>
			<th><?php echo L('title');?></th>
			<?php if($fields['status']) { ?><th width="60"><?php echo L('status');?></th> <?php } ?>
			<?php if($fields['hits']) { ?><th width="40"><?php echo L('hits');?></th> <?php } ?>
			<th width="60"><?php echo L('username');?></th>
            
			<th width="72"><?php echo L('manage');?></th>
            </tr>
        </thead>
      	<tbody>
			<?php $n=1;if(is_array($list)) foreach($list AS $vo) { ?>
      		<tr>
			<td  width="30" align="center"><input class="inputcheckbox " name="ids[]" value="<?php echo $vo['id'];?>" type="checkbox" ></td>
			<td width="40" align='center'><input name='listorders[<?php echo $vo['id'];?>]' type='text' size='3' value='<?php echo $vo['listorder'];?>' class='input-text-c'></td>
			<td align="center"><?php echo $vo['id'];?></td>
      		<td><?php if($vo['catid']) { ?>[<font color="green"><?php echo $categorys[$vo['catid']]['catname'];?></font>]<?php } ?> 
			<?php if($module_name=='Guestbook' || $module_name=='Feedback') {  echo $vo['username'];?>-<?php echo $vo['title']; } else { ?><a href="<?php echo $vo['url'];?>" <?php if($vo['title_style']!='') { ?>style ="<?php echo $vo['title_style'];?>"<?php } ?> target="_blank"><?php echo $vo['title'];?> </a><?php } ?>
			
			<?php if($vo['thumb']!='') { ?><img src="/Statics/Images/admin_image.gif"><?php } ?>
			<?php if($vo['posid']!=0) { ?><img src="/Statics/Images/admin_elite.gif"><?php } ?></td>
			<?php if($fields['status']) { ?><td align="center"><?php if($vo['status']==1) { ?><font color="green"><?php echo L('isshenhe');?></font><?php } else { ?><a href="<?php echo U($module_name.'/status',array(id=>$vo['id'],status=>1));?>"><font color="red"><?php echo L('noshenhe');?></font></a><?php } ?></td><?php } ?>
			<?php if($fields['hits']) { ?> <td align="center"><?php echo $vo['hits'];?></td><?php } ?>
      		<td align="center"><?php echo $vo['username'];?></td>
      	 
			<td align="center"><a href="<?php echo U($module_name.'/edit',array(id=>$vo['id']));?>"><?php echo L('edit');?></a> | <a href="javascript:confirm_delete('<?php echo U($module_name.'/delete',array(id=>$vo['id']));?>')"><?php echo L('delete');?></a></td>
      		</tr>
      		<?php $n++;}unset($n); ?>
      	</tbody>
    </table>

    <div class="btn"><input type="button" class="button" name="dosubmit" value="<?php echo L('delete')?>" onclick="YpForm.action='<?php echo U($module_name.'/deleteall');?>';return confirm_deleteall()"/> <input  type="button" class="button" name="dosubmit" value="<?php echo L('listorder')?>" onclick="YpForm.action='<?php echo U($module_name.'/listorder');?>';$('#YpForm').submit();" />  <input  type="button" class="button" name="dosubmit" value="<?php echo L('status_ok')?>" onclick="YpForm.action='<?php echo U($module_name.'/statusallok');?>';$('#YpForm').submit();" /> </div>

</form></div>

<div id="pages" class="page"><?php echo $page;?></div>
<script>
$("#catid").attr("value",'<?php echo $catid;?>');
function confirm_deleteall(){
	art.dialog.confirm("<?php echo L('real_delete');?>", function(){ $('#YpForm').submit();});
}
</script>