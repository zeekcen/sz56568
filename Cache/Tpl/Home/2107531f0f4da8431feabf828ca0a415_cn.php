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
		<ul id="nav_box"><li id="nav_0"><span class="fl_ico"></span><a href="/" title="网站首页"><span class="fl">网站首页</span></a></li><li id="nav_1" class="first folder"><span class="fd_ico"></span><a href="/index.php?m=Article&a=index&id=1" title="新闻中心"><span class="fd">新闻中心</span></a><ul><li id="nav_2" class="first file"><span class="fl_ico"></span><a href="/index.php?m=Article&a=index&id=2" title="行业新闻"><span class="fl">行业新闻</span></a></li><li id="nav_3" class="file"><span class="fl_ico"></span><a href="/index.php?m=Article&a=index&id=3" title="公司新闻"><span class="fl">公司新闻</span></a></li><li id="nav_10" class="file"><span class="fl_ico"></span><a href="/index.php?m=Article&a=index&id=10" title="行业资讯"><span class="fl">行业资讯</span></a></li><li id="nav_16" class="foot file"><span class="fl_ico"></span><a href="/index.php?m=Article&a=index&id=16" title="国内新闻"><span class="fl">国内新闻</span></a></li></ul></li><li id="nav_4" class="folder"><span class="fd_ico"></span><a href="/index.php?m=Product&a=index&id=4" title="产品展示"><span class="fd">产品展示</span></a><ul><li id="nav_5" class="first file"><span class="fl_ico"></span><a href="/index.php?m=Product&a=index&id=5" title="产品分类1"><span class="fl">产品分类1</span></a></li><li id="nav_6" class="file"><span class="fl_ico"></span><a href="/index.php?m=Product&a=index&id=6" title="产品分类2"><span class="fl">产品分类2</span></a></li><li id="nav_7" class="file"><span class="fl_ico"></span><a href="/index.php?m=Product&a=index&id=7" title="产品分类3"><span class="fl">产品分类3</span></a></li><li id="nav_9" class="foot folder"><span class="fd_ico"></span><a href="/index.php?m=Product&a=index&id=9" title="产品分类4"><span class="fd">产品分类4</span></a><ul><li id="nav_13" class="foot file"><span class="fl_ico"></span><a href="/index.php?m=Product&a=index&id=13" title="产品分类5"><span class="fl">产品分类5</span></a></li></ul></li></ul></li><li id="nav_14" class="file"><span class="fl_ico"></span><a href="/index.php?m=Picture&a=index&id=14" title="图片展示"><span class="fl">图片展示</span></a></li><li id="nav_17" class="file"><span class="fl_ico"></span><a href="/index.php?m=Download&a=index&id=17" title="文档下载"><span class="fl">文档下载</span></a></li><li id="nav_19" class="folder"><span class="fd_ico"></span><a href="/index.php?m=Guestbook&a=index&id=19" title="在线留言"><span class="fd">在线留言</span></a><ul><li id="nav_18" class="foot file"><span class="fl_ico"></span><a href="/index.php?m=Feedback&a=index&id=18" title="信息反馈"><span class="fl">信息反馈</span></a></li></ul></li><li id="nav_8" class="foot folder"><span class="fd_ico"></span><a href="/index.php?m=Page&a=index&id=8" title="关于我们"><span class="fd">关于我们</span></a><ul><li id="nav_11" class="first file"><span class="fl_ico"></span><a href="/index.php?m=Page&a=index&id=11" title="公司简介"><span class="fl">公司简介</span></a></li><li id="nav_12" class="foot file"><span class="fl_ico"></span><a href="/index.php?m=Page&a=index&id=12" title="联系我们"><span class="fl">联系我们</span></a></li></ul></li></ul><script>$('#nav').YourphpNav({ id: <?php echo $bcid;?>});</script>
		</div>
	</div>
</div>

<div class="warp"><div id="main">
<div class="c"></div>
<?php if(isset($bcid)) { ?>
<?php $flash = M('Slide')->where("status=1 and  id=1")->find();$flashid=$flash['id'];$data=M('Slide_data')->where("status=1 and  fid=1 and lang=1")->order("listorder ASC ,id DESC")->limit(5)->select();;?><style>
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

		<div class="left">
		<div class="pos"><b></b><span><?php echo L(catpos);?> <a href="<?php echo URL();?>"><?php echo L(home_font);?></a> &gt <?php  $arrparentid = array_filter(explode(',', $Categorys[$catid]['arrparentid'].','.$catid));foreach($arrparentid as $cid):$parsestr[] = '<a href="'.$Categorys[$cid]['url'].'">'.$Categorys[$cid]['catname'].'</a>'; endforeach;echo implode(" > ",$parsestr);?></span></div>
		<?php $data=subcat($Categorys,$catid,0,0,1);?>
			<?php $n=1;if(is_array($data)) foreach($data AS $cid) { ?>
				<div class="list">
				<h4 class="tit"><span><a href="<?php echo $cid['url'];?>"><?php echo L(more);?>>></a></span> <b><a href="<?php echo $cid['url'];?>"><?php echo $cid['catname'];?></a></b></h4>
				<ul class="txt">
				<?php $catsql = getcatsql($cid[arrchildid],'');unset($data1);$data1=M("Content")->field("*")->where(" status=1  AND lang=1 $catsql[sql]   ")->order("id desc")->limit(0,12)->select();unset($catsql);;?>
					<?php $n=1;if(is_array($data1)) foreach($data1 AS $r) { ?>
					<li><span class="date">[<?php echo toDate($r[createtime],'Y-m-d');?>]</span><a href="<?php echo $r['url'];?>" target="_blank"><?php echo $r['title'];?></a></li>
					<?php $n++;}unset($n); ?>
				
				</ul></div>
			<?php $n++;}unset($n); ?>
		
		<br>
</div>



<div class="right">
	<div class="box"><div class="b1 catlist">
	<h3 class="tit"><span><a href="<?php echo $Categorys[$T['m_product_catid']]['url'];?>"><?php echo L(more);?>>></a></span><b><?php echo $T['right_name_1'];?></b><em>Product</em></h3>
	<ul id="catlist_box"><li id="catlist_5" class="first file"><span class="fl_ico"></span><a href="/index.php?m=Product&a=index&id=5" title="产品分类1"><span class="fl">产品分类1</span></a></li><li id="catlist_6" class="file"><span class="fl_ico"></span><a href="/index.php?m=Product&a=index&id=6" title="产品分类2"><span class="fl">产品分类2</span></a></li><li id="catlist_7" class="file"><span class="fl_ico"></span><a href="/index.php?m=Product&a=index&id=7" title="产品分类3"><span class="fl">产品分类3</span></a></li><li id="catlist_9" class="foot folder"><span class="fd_ico"></span><a href="/index.php?m=Product&a=index&id=9" title="产品分类4"><span class="fd">产品分类4</span></a><ul><li id="catlist_13" class="foot file"><span class="fl_ico"></span><a href="/index.php?m=Product&a=index&id=13" title="产品分类5"><span class="fl">产品分类5</span></a></li></ul></li></ul><script>$('#nav').YourphpNav({ id: <?php echo $bcid;?>});</script>
	</div></div>

	<div class="h10"></div>
	<div class="box"><div class="b1 contact">
	<h3 class="tit"><span><a href="<?php echo $Categorys[$T['m_contact_catid']]['url'];?>"><?php echo L(more);?>>></a></span><b><?php echo $T['right_name_2'];?></b><em>contact</em></h3>
	<ul><li><label>电 &nbsp;&nbsp;话:</label>0317-5022625</li> <li><label>手 &nbsp;&nbsp;机:</label>13290000000</li> <li><label>联系人:</label>liuxun</li> <li><label>邮 &nbsp;&nbsp;箱:</label>admin@yourphp.cn</li> <li><label>网 &nbsp;&nbsp;址:</label>http://www.yourphp.cn</li> <li><label>地 &nbsp;&nbsp;址:</label>河北省沧州市肃宁县宅南村</li> </ul>
	</div></div>



	<div class="h10"></div>
	<div class="box"><div class="b1 contact">
	<h3 class="tit"><span><a href="<?php echo TAGURL();?>"><?php echo L(more);?>>></a></span><b><?php echo L(tags);?></b><em>Tags</em></h3>
	<ul>
	<?php $data=M("Tags")->where(" lang=1")->order("id desc")->limit("12")->select();;?>
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
		<?php unset($data);$data=M("Link")->field("*")->where(" status=1  AND lang=1 $catsql[sql]    AND linktype=2")->order(" id DESC ")->limit(0,15)->select();;?>
			<?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
			<li><a href="<?php echo $r['siteurl'];?>" target="_blank" title="<?php echo $r['name'];?>"><img src="<?php echo $r['logo'];?>" alt="<?php echo $r['name'];?>"></a></li> 
			<?php $n++;}unset($n); ?>
		
		</ul>
		<ul class="txt"> 
		<?php unset($data);$data=M("Link")->field("*")->where(" status=1  AND lang=1 $catsql[sql]    AND linktype=1")->order(" id DESC ")->limit(0,15)->select();;?>
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
<p>Powered by <a href="http://www.yourphp.cn" target="_blank"><span style="color:#000000;">Yourphp</span></a> 版权所有 &copy; 2008-2011, All right reserved</p>
</div>
<?php if($Module[9]['status']) { ?>
	<div class="kefu" id="kefu"><div class="open"></div><div class="kefubox"><div class="kftop"><div class="close"></div></div><div class="kfbox"><ul><li class="tit type_4">咨询电话:</li><li>0317-508888</li><li class="tit type_1">QQ客服:</li><li><a href="http://wpa.qq.com/msgrd?v=3&uin=10000&site=qq&menu=yes" rel="nofollow"><img border="0" SRC="http://wpa.qq.com/pa?p=1:10000:3" alt="QQ客服"></a></li></ul></div><div class="kfbottom"></div></div></div><script>$.YourphpInc("/Template/Default/images/kefu/default/style.css");$(document).ready(function(){  $("#kefu").YourphpKefu({ top:200,position:"right",left:0,right:0,close:1,effect:1,open:1,showopen:1 }); });</script>
<?php } ?>
<?php echo showTime();?>