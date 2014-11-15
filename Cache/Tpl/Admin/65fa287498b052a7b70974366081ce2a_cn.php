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


<form method='post'  id="form1" action="<?php echo U('Config/dosite');?>">
<table width="100%"  cellpadding=0 cellspacing=0  class="table_form"> 
  <tr> 
    <th width="120"><?php echo L('config_mail_md');?></th> 
    <td class="y-bg"> 
     <input name="mail_type"   value="1" onclick="showsmtp(this)" type="radio"  <?php if($mail_type == 1) { ?>  checked<?php } ?>> <?php echo L('config_mail_smtp');?>    
	 <input name="mail_type"  value="2" onclick="showsmtp(this)" type="radio"   <?php if($mail_type == 2) { ?>   checked<?php } ?>  <?php if(substr(strtolower(PHP_OS), 0, 3) == 'win') echo 'disabled'; ?>/> <?php echo L('config_mail_mailfun');?> 
	 <input name="mail_type"   value="3" onclick="showsmtp(this)" type="radio" <?php if($mail_type == 3) { ?>    checked<?php } ?>> sendmail
	</td>
  </tr> 
  <tbody id="smtpconfig" style=""> 
  <tr> 
    <th><?php echo L('config_mail_server');?></th> 
    <td class="y-bg"><input type="text" class="input-text" name="mail_server" id="mail_server" size="30" value="<?php echo $mail_server;?>"/></td> 
  </tr>  
  <tr> 
    <th><?php echo L('config_mail_port');?></th> 
    <td class="y-bg"><input type="text" class="input-text" name="mail_port" id="mail_port" size="30" value="<?php echo $mail_port;?>"/></td> 
  </tr> 
  <tr> 
    <th><?php echo L('config_mail_from');?></th> 
    <td class="y-bg"><input type="text" class="input-text" name="mail_from" id="mail_from" size="30" value="<?php echo $mail_from;?>"/></td> 
  </tr>   
  <tr> 
    <th><?php echo L('config_mail_auth');?></th> 
    <td class="y-bg"> 
    <input name="mail_auth" id="mail_auth" value="1" type="radio" <?php if($mail_auth == 1) { ?> checked<?php } ?>> <?php echo L('open_select');?>	<input name="mail_auth" id="mail_auth" value="0" type="radio" <?php if($mail_auth == 0) { ?>  checked<?php } ?> > <?php echo L('close_select');?></td> 
  </tr> 
 
	  <tr> 
	    <th><?php echo L('config_mail_user');?></th> 
	    <td class="y-bg"><input type="text" class="input-text" name="mail_user" id="mail_user" size="30" value="<?php echo $mail_user;?>"/></td> 
	  </tr> 
	  <tr> 
	    <th><?php echo L('config_mail_password');?></th> 
	    <td class="y-bg"><input type="password" class="input-text" name="mail_password" id="mail_password" size="30" value="<?php echo $mail_password;?>"/></td> 
	  </tr> 
 
 </tbody> 

<tbody id="sendmailconfig" style=""> 
 <!-- <tr> 
    <th><?php echo L('config_mail_sendmail');?></th> 
    <td class="y-bg"><input type="text" class="input-text" name="mail_sendmail" id="mail_sendmail" size="30" value="<?php echo $mail_sendmail;?>"/></td> 
  </tr> -->  
 </tbody> 

  <tr> 
    <th><?php echo L('config_mail_test');?></th> 
    <td class="y-bg"><input type="text" class="input-text" name="mail_to" id="mail_to" size="30" value=""/> <input type="button" class="button" onClick="javascript:test_mail();" value="<?php echo L('config_mail_testsed');?>"></td> 
  </tr>           
  </table> 
<div class="btn">
<INPUT TYPE="submit"  value="<?php echo L('save');?>" class="button" >
<input TYPE="reset"  value="<?php echo L('reset');?>" class="button">
</div>
</form>
</div>
<script>
function showsmtp(obj){
 
	if(obj){
	var issmtp  = $(obj).val();
	}else{
	var issmtp = $("input[name=mail_type][checked]").val();
	}
	
	if(issmtp==1){
		$('#smtpconfig').show();
		$('#sendmailconfig').hide();
	}else if(issmtp==3){
		$('#smtpconfig').hide();
		$('#sendmailconfig').show();
	}else{
		$('#smtpconfig').hide();
		$('#sendmailconfig').hide();
	}
}
function test_mail(){

 	var mail_type =  $("input[name=mail_type][checked]").val();
 

    $.post('<?php echo U("Config/testmail");?>&mail_to='+$('#mail_to').val(),{mail_type:mail_type,mail_sendmail:$('#mail_sendmail').val(),mail_server:$('#mail_server').val(),mail_port:$('#mail_port').val(),mail_user:$('#mail_user').val(),mail_password:$('#mail_password').val(),mail_auth:$('#mail_auth').val(),mail_auth:$('#mail_auth').val(),mail_from:$('#mail_from').val()}, function(data){
	alert(data.info);
	},"json");

}
showsmtp();
</script>