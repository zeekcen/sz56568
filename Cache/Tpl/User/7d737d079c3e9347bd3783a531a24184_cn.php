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
<script type="text/javascript" src="/Statics/Js/jquery.YpBox.min.js"></script>
<script type="text/javascript">
jQuery.YourphpInc(['/Statics/Js/yourphp.admin.min.js','/Template/Default/User/images/order/order.css',"/Template/Default/User/css/member.css",'/Statics/Css/YpBox.css','/Statics/Css/Wdate.css']);
</script>

<div id="member">
	<?php if($module_name!='Login' && $module_name!='Register' ) { ?> 
	<div class="pos"><?php echo L(catpos);?> <a href="<?php echo URL();?>"><?php echo L(home_font);?></a> > <a href="<?php echo URL('User-Index/index');?>"><?php echo L(user_center);?></a> </div>
<div class="left-memu">

		<?php if($user_menu) { ?>
		<h5 class="title"><b><img src="/Template/Default/User/images/m_1.png" width="15" height="15" /> <?php echo L(user_post_online);?></b></h5>
		<ul>
		<?php $n=1;if(is_array($user_menu)) foreach($user_menu AS $r) { ?>
			<li > <span><a href="<?php echo URL('User-Post/add?moduleid='.$r['id']);?>"><?php echo L(user_post);?></a></span><a href="<?php echo URL('User-Post/index?moduleid='.$r['id']);?>"><img src="/Template/Default/User/images/m_2.png" width="14" height="15" /> <?php echo L($r['name']);?></a></li>
		<?php $n++;}unset($n); ?>
		</ul>
		<?php } ?>
		
		<h5 class="title"><b><img src="/Template/Default/User/images/coins.png" width="15" height="15" /> <?php echo L(user_pay_manage);?></b></h5>
		<ul>
			<li><a href="<?php echo URL('User-Order/index');?>"><img src="/Template/Default/User/images/table-information.png" width="16" height="16" /><?php echo L(user_order_query);?></a></li>

			<?php if($_COOKIE['YP_userid']) { ?>
				<li><span><a href="<?php echo U('User/Pay/pay');?>"><?php echo L(user_pay_recharge);?></a></span><a href="<?php echo URL('User-Pay/index');?>"><img src="/Template/Default/User/images/m_4.png" width="15" height="16" /><?php echo L(USER_PAYMENT_RECORDS);?></a></li>
				<li><a href="<?php echo URL('User-Pay/spend');?>"><img src="/Template/Default/User/images/m_8.png" width="16" height="16" /><?php echo L(user_Consumption_record);?></a></li>
				<li><a href="<?php echo URL('User-Pay/credit');?>"><img src="/Template/Default/User/images/coins_add.png" width="16" height="16" /><?php echo L(user_Integral_buy_Exchange);?></a></li>
			<?php } ?>
			
			
		</ul>

	  <?php if($_COOKIE['YP_userid']) { ?>
		<h5 class="title"><b><img src="/Template/Default/User/images/home.png" width="15" height="15" /> <a href="<?php echo URL('User-Index/index');?>"><?php echo L(user_center);?></a></b></h5>
		<ul>
			<li><a href="<?php echo URL('User-Index/profile');?>"><img src="/Template/Default/User/images/user_edit.png" width="16" /><?php echo L(user_edit_profile);?></a></li>
			<li><a href="<?php echo URL('User-Index/avatar');?>"><img src="/Template/Default/User/images/vcard.png" width="16" /><?php echo L(user_edit_avatar);?></a></li>
			<li><a href="<?php echo URL('User-Index/password');?>"><img src="/Template/Default/User/images/m_9.png" width="16" height="16" /><?php echo L(user_edit_email_password);?></a></li>
			<li><a href="<?php echo URL('User-Login/logout');?>"><img src="/Template/Default/User/images/computer_key.png" width="16" height="16" /><?php echo L(logout);?></a></li>
		</ul>
	   <?php } ?>

</div>
	<?php } ?>

	 
 
	<div class="right">
		 
			<h5 class="title"><b><?php echo L(user_order_query);?></b></h5>
			 
					<table  class="search_table" width="100%">
							<tr>
								<td class="search">
									<form action="<?php echo URL($module_name.'/index');?>" method="get">
									<input type="hidden" name="g" value="User" />
									<input type="hidden" name="m" value="<?php echo MODULE_NAME;?>" />
									<input type="hidden" name="a" value="<?php echo ACTION_NAME;?>" />	

									<input id="title" type="text" class="input-text" name="sn" value="<?php echo $_GET['sn'];?>" />
									<input type="hidden" id="searchtype" name="searchtype" value="sn"/> 
									<input type="submit" value="<?php echo L('query');?>"  class="button" />
									</form>
								</td>
								
							</tr>
						</table>

						<form name="YpForm" id="YpForm" action="" method="post">

						<div class="table-list">
							<table width="100%" cellspacing="0">
								<thead> 
									<tr> 
								 
									<th width="140" align="left"><?php echo L('order_sn');?></th> 
									<th width="70" align="left"><?php echo L('ORDER_PRICE');?></th>
									<th  align="left"><?php echo L('ORDER_createtime');?></th> 
									<th  align="left"><?php echo L('Order_payment_type');?></th>
									<th width="160" align="center"><?php echo L('order_status');?></th> 
									</tr> 
								</thead> 
								<tbody>
									<?php $n=1;if(is_array($list)) foreach($list AS $vo) { ?>
									<tr>
									<td><a href="<?php echo URL('User-Order/show',array(id=>$vo['id']));?>"><?php echo $vo['sn'];?> </a> </td>
									<td><font color="red"><?php echo number_format($vo[order_amount],2); echo L(RMB);?></font></td>
									<td><?php echo toDate($vo['add_time'],'Y-m-d H:i:s');?></td>
									<td><?php echo $vo['pay_name'];?></td>	
									<td align="center">
									<?php echo L("order_status_".$vo[status]);?> | <?php echo L("pay_status_".$vo[pay_status]);?> |  <?php echo L("shipping_status_".$vo[shipping_status]);?> 
									</td>      		
									</tr>
									<?php $n++;}unset($n); ?>
								</tbody>
							</table>
 


						   
						</form></div>    

						<div id="pages" class="page"><?php echo $page;?></div>
						<script>
						$("#catid").attr("value",'<?php echo $catid;?>');
						function confirm_deleteall(){
							$.YpBox.confirm("<?php echo L('real_delete');?>", "Message", submit);
							//art.dialog.confirm("<?php echo L('real_delete');?>", function(){ $('#YpForm').submit();});
						}

						var submit = function (v, h, f) {
							$('#YpForm').submit();
						};
						


						</script>

		 
	</div>
 

	<div class="c"></div><br>
	<div id="user_footer">
	<a href="/"><?php echo L('HOME_FONT');?></a>
	<?php $data=subcat($Categorys,0,0,0,1);?>
	<?php $n=1;if(is_array($data)) foreach($data AS $r) { ?> |  <a href="<?php echo $r['url'];?>"><?php echo $r['catname'];?></a><?php $n++;}unset($n); ?>
	
	<br>
	Powered by <?php if(!YP_KEY) { ?><a href="http://www.yourphp.cn">Yourphp  </a><?php } else { ?><a href="<?php echo $site_url;?>"><?php echo $site_name;?></a><?php } ?>  © 2011  
	</div>
</div>
</body>
</html>