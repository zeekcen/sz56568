<?php if (!defined('Yourphp')) die('Yourphp');?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo C('DEFAULT_CHARSET');?>" />
<title><?php echo L('system_name');?> - Powered by Yourphp</title>
<link rel="stylesheet" type="text/css" href="/Statics/Css/style.css" />
</head>
<body  id="loginbg" >
<form method='post' name="login" id="form1" action="<?php echo U('Login/doLogin');?>">
<div class="login_box">
	<div class="login_title"><?php echo L('system_name');?> <?php echo VERSION;?></div>
	<div class="login_left"><img src="/Statics/Images/admin_logo.gif"   border="0" alt="<?php echo L('system_name');?>" ></div>
	<div class="login_right">
		<div class="msg"><div id="result" class="result none"></div></div>
		<div class="login_form">
			<ul>
			<li><label><?php echo L('account');?>:</label><input type="text" id="username" class="input-text" name="username" size="16"></li>
			<li><label><?php echo L('password');?>:</label><input type="password"  class="input-text" name="password" size="16"></li>
			<?php if($admin_verify) { ?>
			<li><label><?php echo L('verify');?>:</label><input name="verifyCode" class="input-text"  class="inputbox" id="verifyCode"  size="6" value="" maxlength="4" /><img src="./index.php?m=Index&a=verify" onclick="javascript:resetVerifyCode();" class="checkcode" align="absmiddle"  title="<?php echo L('resetVerifyCode');?>" id="verifyImage"/></li><?php } ?>
			<li><label></label><input type="submit" value="<?php echo L('login');?>" class="button"> <input type="reset" name="reset" value="<?php echo L('reset');?>" class="button" id="reset" /></li> 
			</ul>
		</div>
	</div>
</div>
</form>
<script language="JavaScript">
function resetVerifyCode(){
	var timenow = new Date().getTime();
	document.getElementById('verifyImage').src='./index.php?m=Index&a=verify#'+timenow;
}
</script>
<style>
body {background:#02609b ;}
html{background:#02609b ;}
</style>