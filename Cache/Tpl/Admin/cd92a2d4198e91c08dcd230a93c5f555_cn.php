<?php if (!defined('Yourphp')) die('Yourphp');?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="/Statics/Js/jquery.min.js"></script>
<script type="text/javascript" src="/Statics/Js/jquery.YpBox.min.js"></script>
<link rel='stylesheet' type='text/css' href="/Statics/Css/style.css">
<title><?php echo L('welcome');?> - Powered by Yourphp</title>
</head>
<body style="background:#E2E9EA">
<div id="header" class="header">
	<?php if(YP_KEY) { ?>
		<div class="logo"></div>
	<?php } else { ?>
	<div class="logo"><a href="http://www.youRphp.cn" target="_blank"><img src="/Statics/Images/admin_logo.gif" width="180"></a></div>
	<div class="nav f_r"> <a href="http://www.yourphp.cn" target="_blank"><?php echo L('org_url');?></a> <i>|</i> <a href="http://www.yourphp.cn/ebook/" target="_blank"><?php echo L('ebook');?></a>  <i>|</i> <a href="http://www.yourphp.cn/support" target="_blank"><?php echo L('org_bbs');?></a>  <i>|</i> <a href="http://www.yourphp.cn/help" target="_blank"><?php echo L('help');?></a> <i>|</i> &nbsp;&nbsp;</div>
	<?php } ?>

	<div class="nav">&nbsp;&nbsp;&nbsp;&nbsp;<?php echo L('welcome_user'); echo $_SESSION['username'];?>  <i>|</i> [<?php echo $usergroup;?>]  <i>|</i> [<a href="<?php echo U('Login/logout');?>" target="_top"><?php echo L('logout');?></a>]  <i>|</i> <a href="<?php echo $site_url;?>" target="_blank"><?php echo L('home_index');?></a> <i>|</i>  <a href="javascript:void(0);"  onclick="gocacheurl();" ><?php echo L('UPDATE_CACHE');?></a> <i>|</i>  <a href="/upload.php">批量导入</a></div>

	<div class="topmenu">
		<ul>
		<?php $n=1;if(is_array($menuGroupList)) foreach($menuGroupList AS $tag) { ?>
		<li id="menu_<?php echo $tag['id'];?>"><span><a href="javascript:void(0);" onClick="sethighlight(<?php echo $tag['id'];?>);"><?php echo $tag['name'];?></a></span></li>		 
		<?php $n++;}unset($n); ?>
		</ul>
	</div>
	<div class="header_footer"></div>
</div>


<div id="Main_content">

	<div id="MainBox" >
	    <div class="main_box">
			<iframe name="main" id="Main" src='<?php echo U("Index/main");?>' frameborder="false"    width="100%" height="auto" allowtransparency="true"></iframe>
		</div>
    </div>

	<div id="leftMenuBox">
    	<div id="leftMenu">
			<div style="padding-left:12px;_padding-left:10px;">	
				<?php $n=1;if(is_array($menu)) foreach($menu AS $r) { ?>
					<dl id="nav_<?php echo $r['bnav']['id'];?>">
						<dt><?php echo $r['bnav']['name'];?></dt>
						<?php $n=1;if(is_array($r[nav])) foreach($r[nav] AS $item) { ?>
						<dd id="nav_<?php echo $item['id'];?>"><span><a href="<?php echo U($item['model'].'/'.$item['action'],$item['data']);?>" target="main"><?php echo $item['name'];?></a><?php if($r[bnav]['model']=='Category') { ?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<?php echo U($item['model'].'/add',$item['data']);?>" id="<?php echo $i;?>" target="main"><?php echo L(add);?></a><?php } ?></span></dd>
						<?php $n++;}unset($n); ?>
					</dl>
				<?php $n++;}unset($n); ?>
			</div>
		</div>

		<div id="Main_drop">
			<a  href="javascript:toggleMenu(1);" class="on"><img src="/Statics/Images/admin_barclose.gif" width="11" height="60" border="0"  /></a>   
			<a  href="javascript:toggleMenu(0);" class="off" style="display:none;"><img src="/Statics/Images/admin_baropen.gif" width="11" height="60" border="0"  /></a>  
		</div>
    </div>

</div>



<script language="JavaScript">
if(!Array.prototype.map)
Array.prototype.map = function(fn,scope) {
  var result = [],ri = 0;
  for (var i = 0,n = this.length; i < n; i++){
	if(i in this){
	  result[ri++]  = fn.call(scope ,this[i],i,this);
	}
  }
return result;
};
var getWindowWH = function(){
	  return ["Height","Width"].map(function(name){
	  return window["inner"+name] ||
		document.compatMode === "CSS1Compat" && document.documentElement[ "client" + name ] || document.body[ "client" + name ]
	});
}
window.onload = function (){
	if(!+"\v1" && !document.querySelector) { //IE6 IE7
	 document.body.onresize = resize;
	} else { 
	  window.onresize = resize;
	}
	function resize() {
		wSize();
		return false;
	}
}
function wSize(){
	var str=getWindowWH();
	var strs= new Array();
	strs=str.toString().split(","); //字符串分割
	var h = strs[0] - 95-30;
	$('#leftMenu').height(h);
	$('#Main').height(h); 
	$('#Main_drop').height(h-220); 
}
wSize();


function sethighlight(n) {
	 $('.topmenu li span').removeClass('current');
	 $('#menu_'+n+' span').addClass('current');
	 $('#leftMenu dl').hide();
	 $('#nav_'+n).show();
	 $('#leftMenu dl dd').removeClass('on');
	 $('#nav_'+n+' dd').eq(0).addClass('on');
	 url = $('#nav_'+n+' dd a').eq(0).attr('href');
	 window.main.location.href= url;
}

$('#leftMenu dl dd').click(function(){
	$('#leftMenu dl dd').removeClass('on');
	$(this).addClass('on');
    window.main.location.href = $(this).find("a").attr("href");
});
function gocacheurl(){
	mainurl = window.main.location.href;
	window.main.location.href= "<?php echo U('Admin/Index/cache');?>&forward="+encodeURIComponent(mainurl);
}

function toggleMenu(doit){
	if(doit==1){
		$('#Main_drop a.on').hide();
		$('#Main_drop a.off').show();
		$('#MainBox .main_box').css('margin-left','24px');
		$('#leftMenu').hide();
	}else{
		$('#Main_drop a.off').hide();
		$('#Main_drop a.on').show();
		$('#leftMenu').show();
		$('#MainBox .main_box').css('margin-left','224px');
	}
}	
sethighlight(1);
</script>