<?php if (!defined('Yourphp')) die('Yourphp');?><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><?php echo $seo_title;?>-<?php echo $site_name;?> - Powered by Yourphp</title>
<meta name="description" content="<?php echo $seo_description;?>" /> 
<meta name="keywords" content="<?php echo $seo_keywords;?>" />
<meta name="author" content="Yourphp">
<meta http-equiv="X-UA-Compatible" content="IE=7">
<script src="/Statics/Js/jquery.min.js"></script>
<script>$.YourphpInc([ '/Statics/Js/yourphp.min.js','/Statics/Js/yourphp.js','/Template/Default/css/style.css']);</script>
</head>
<body>
<div  class="warp" style="overflow:visible;">
	<div id="header">
		<div style="float:right;widht:240px;text-align:right;">

			<div class="top_right">

					<div id="login_div">
							&nbsp;<a  id="login_url" href="<?php echo URL('User-Login/index');?>"><?php echo L(LOGIN);?></a> | 
							<a id="register_url" href="<?php echo URL('User-Register/index');?>"/><?php echo L(REGISTER);?></a>
					</div>

					<div id="logined_div" style="display:none;">
						<div id="login_username" style="color:#FB0000;"></div>, <?php echo L(welcome_return);?> <a href="<?php echo URL('User-Index/index');?>"><?php echo L(user_center);?></a> | <a  id="logout_url" href="<?php echo URL('User-Login/logout');?>"><?php echo L(logout);?></a> 
					</div>
	 
					<div id="buy_box">
					&nbsp; | &nbsp;<a href="<?php echo URL('Home-Order/index');?>"><?php echo L(Cart);?></a> | <a href="<?php echo URL('User-Order/index');?>"><?php echo L(order_query);?></a> | 
					<?php $n=1;if(is_array($Lang)) foreach($Lang AS $r) { ?>
						 <a href="<?php echo HOMEURL($r[mark]);?>"><img src="/Statics/Images/flag/<?php echo $r['flag'];?>"></a> &nbsp;
					<?php $n++;}unset($n); ?>
					</div>
					<!--<span>[<a href="javascript:void(0);" onClick="this.style.behavior='url(#default#homepage)';this.setHomePage('<?php echo $site_url;?>');return(false);" style="behavior: url(#default#homepage)">设为首页</a>]</span> <span>[<a href="javascript:window.external.addFavorite('<?php echo $site_url;?>','<?php echo $site_name;?>')">加入收藏</a>]</span> 
					-->
			</div>
			<div class="topsearch"></div>
		</div>
		<div class="logo"><a href="<?php echo $site_url;?>"><img src="/Template/Default/images/logo.gif" alt="<?php echo $site_name;?>"></a></div>
		<div id="nav" class="nav">
		<ul id="nav_box"><li id="nav_0"><span class="fl_ico"></span><a href="/index.php?l=en" title="Home"><span class="fl">Home</span></a></li></ul><script>$('#nav').YourphpNav({ id: <?php echo $bcid;?>});</script>
		</div>
	</div>
</div>

<div class="warp"><div id="main">
<div class="c"></div>
<?php if(isset($bcid)) { ?>
<?php $flash = M('Slide')->where("status=1 and  id=1")->find();$flashid=$flash['id'];$data=M('Slide_data')->where("status=1 and  fid=1 and lang=2")->order("listorder ASC ,id DESC")->limit(5)->select();;?><style>
.slide-panel {position:relative;width:<?php echo $flash['width'];?>px;height:<?php echo $flash['height'];?>px;overflow:hidden;}
.slide-panel  li {width:<?php echo $flash['width'];?>px;height:<?php echo $flash['height'];?>px;}
.switchable-triggers { position:absolute; right:3px; bottom:6px; }
.switchable-triggers li {display:inline-block;border:1px solid #333;float:left;width:16px;height:16px;margin:0 3px;background:#454545;;color:#FFF;font-size:13px;
    line-height:16px; text-align:center; cursor:pointer; }
.switchable-triggers li.current {border:1px solid #BF0000;background:#EF0000;color:#fff;}
</style>
<div class="slide1">
	<div id="slide_<?php echo $flashid;?>" class="slide-panel"><ul>
		<?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
		 <li><a href="<?php echo $r['link'];?>" target="_blank"><img src="<?php echo $r['pic'];?>" alt="<?php echo $r['title'];?>"></a> </li>
		<?php $n++;}unset($n); ?>
	</ul></div>
</div> 
<script>
$.YourphpInc('/Statics/Js/jquery.switchable.min.js');
jQuery(document).ready(function($){
   var slide = $('#slide_<?php echo $flashid;?>').switchable({
    putTriggers: 'appendTo',
    panels: 'li',
    initIndex: -1,
    effect: 'scrollUp',
    easing: 'cubic-bezier(.455, .03, .515, .955)',
    end2end: true,
    loop: false, 
    autoplay: true,
    interval: 5,
    api: true
  });
});
</script>
<?php } ?>

		 
			
<div class="left" style="border:none;">

	<div class="icontact">Yourphp site management system, is a completely free open source PHP+MYSQL system. The core uses Thinkphp frame and many other open source software, at the same time the core function is also released as open source software. Set many open source projects in a characteristic, make the system from the security, efficiency, ease of use and scalability is more outstanding. Program built-in SEO optimization mechanism, make the enterprise website is easier to spread. Has the enterprise web site commonly used modules ( company profile module, news module, module, module, the picture download module, recruitment, online messages, links, membership and rights management ).</div>

	<div class="h10"></div>
	<div class="iProduct">
	<h2 class="tit"><span><a href="<?php echo $Categorys[$T['m_product_catid']]['url'];?>"><?php echo L(more);?>>></a></span><b><?php echo $Categorys[$T['m_product_catid']]['catname'];?></b></h2>
	<ul class="pic">
		<?php $catsql = getcatsql($T[m_product_catid],'');unset($data);$data=M("Content")->field("*")->where(" status=1  AND lang=2 $catsql[sql]   ")->order("id desc")->limit(0,15)->select();unset($catsql);;?>
			<?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
				<li><span><a href="<?php echo $r['url'];?>" target="_blank"><img src="<?php echo thumb($r['thumb']);?>"></a></span><a href="<?php echo $r['url'];?>" target="_blank"><?php echo $r['title'];?></a></li>
			<?php $n++;}unset($n); ?>
		
	</ul></div>

	<div class="h10"></div>
	<div class="inews">
	<h2 class="tit"><span><a href="<?php echo $Categorys[$T['m_news_catid']]['url'];?>"><?php echo L(more);?>>></a></span><b><?php echo $Categorys[$T['m_news_catid']]['catname'];?></b></h2>
	<div class="ilist"><ul class="txt">
		<?php $catsql = getcatsql($T[m_news_catid],'');unset($data);$data=M("Content")->field("*")->where(" status=1  AND lang=2 $catsql[sql]   ")->order("id desc")->limit(0,15)->select();unset($catsql);;?>
			<?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
			<li><a href="<?php echo $r['url'];?>" target="_blank"><?php echo str_cut($r[title],40,'..');?></a></li>
			<?php $n++;}unset($n); ?>
		 
		</ul>
	</div></div>
</div>


<div class="right">
	<div class="box"><div class="b1 catlist">
	<h3 class="tit"><span><a href="<?php echo $Categorys[$T['m_product_catid']]['url'];?>"><?php echo L(more);?>>></a></span><b><?php echo $T['right_name_1'];?></b><em>Product</em></h3>
	<ul id="catlist_box"></ul><script>$('#nav').YourphpNav({ id: <?php echo $bcid;?>});</script>
	</div></div>

	<div class="h10"></div>
	<div class="box"><div class="b1 contact">
	<h3 class="tit"><span><a href="<?php echo $Categorys[$T['m_contact_catid']]['url'];?>"><?php echo L(more);?>>></a></span><b><?php echo $T['right_name_2'];?></b><em>contact</em></h3>
	<ul><li><label>Tel:</label>0317-5022625</li> <li><label>Mobile:</label>13292793176</li> <li><label>Contact:</label>liuxun</li> <li><label>Email:</label>admin@yourphp.cn</li> <li><label>Site:</label>http://demo2.yourphp.cn</li> <li><label>Address:</label>China Hebei suning</li> </ul>
	</div></div>



	<div class="h10"></div>
	<div class="box"><div class="b1 contact">
	<h3 class="tit"><span><a href="<?php echo TAGURL();?>"><?php echo L(more);?>>></a></span><b><?php echo L(tags);?></b><em>Tags</em></h3>
	<ul>
	<?php $data=M("Tags")->where(" lang=2")->order("id desc")->limit("12")->select();;?>
		<?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
		<a href="<?php echo TAGURL($r);?>"><?php echo $r['name'];?></a>&nbsp;
		<?php $n++;}unset($n); ?> 
	 
	</ul>
	</div></div>


	<div class="h10"></div>

	<div class="box"><div class="b1 links">
	<h3 class="tit"><span></span><b><?php echo $T['right_name_3'];?></b><em>links</em></h3>
	<div class="h10"></div>
		<ul class="pic">
		<?php unset($data);$data=M("Link")->field("*")->where(" status=1  AND lang=2 $catsql[sql]    AND linktype=2")->order(" id DESC ")->limit(0,15)->select();;?>
			<?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
			<li><a href="<?php echo $r['siteurl'];?>" target="_blank" title="<?php echo $r['name'];?>"><img src="<?php echo $r['logo'];?>" alt="<?php echo $r['name'];?>"></a></li> 
			<?php $n++;}unset($n); ?>
		
		</ul>
		<ul class="txt"> 
		<?php unset($data);$data=M("Link")->field("*")->where(" status=1  AND lang=2 $catsql[sql]    AND linktype=1")->order(" id DESC ")->limit(0,15)->select();;?>
			<?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
				<li><a href="<?php echo $r['siteurl'];?>" target="_blank"><?php echo $r['name'];?></a></li>
			<?php $n++;}unset($n); ?>
		
		</ul>
	<div class="h10"></div>
	</div></div>

	<div class="c"></div>
	<div class="h10"></div>
</div>
<div class="c"></div>
<br>

</div></div>

<div id="footer" class="warp">
Powered by <a href="http://www.yourphp.cn" target="_blank">Yourphp</a>&nbsp;&nbsp;Copyright &copy; 2008-2011, All right reserved<br />
</div>
<?php if($Module[9]['status']) { ?>
	
<?php } ?>
<?php echo showTime();?>