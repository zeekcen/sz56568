<?php if (!defined('Yourphp')) die('Yourphp');?>
<!DOCTYPE html>
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
<script type="text/javascript">
$.YourphpInc(['/Statics/Js/yourphp.admin.min.js', '/Template/Default/images/order/order.css']);
</script>

		<div class="pos"><?php echo L(catpos);?> <a href="<?php echo URL();?>"><?php echo L(home_font);?></a> &gt <?php  $arrparentid = array_filter(explode(',', $Categorys[$catid]['arrparentid'].','.$catid));foreach($arrparentid as $cid):$parsestr[] = '<a href="'.$Categorys[$cid]['url'].'">'.$Categorys[$cid]['catname'].'</a>'; endforeach;echo implode(" &gt ",$parsestr);?></div>

     		<div id="cart_box"><div style="float:right;line-height:110px;"><a href="<?php echo URL('Home-Order/clear');?>"><?php echo L('CLEAR_ORDER');?></a></div>
					<div id="buy_ico">&nbsp;</div>
            		<div id="buy_tab">
						<ul class="buy_0">
							<li class="one">1.<?php echo L('ORDER_ADD_CART');?></li>
							<li class="two">2.<?php echo L('ORDER_CONFIRM');?></li>
							<li class="three">3.<?php echo L('ORDER_DOSUBMIT');?></li>						
						</ul>						
					</div> 
					<div class="c"></div>

                    <div class="order_table">
                        <table  class="order_table"   border="0" cellspacing='1' cellpadding='3' align="center">
                          <tr align="center">
							<th width="12%"><?php echo L('Order_product_thumb');?></th>
                            <th width="30%"><?php echo L('Order_product_name');?></th>
							<th width="10%"><?php echo L('Order_product_attr');?></th>
                            <th width="9%"><?php echo L('Order_product_price');?></th>
                            <th width="8%"><?php echo L('Order_product_number');?></th>
                            <th width="13%"><?php echo L('Order_product_small_count');?>（RMB）</th>
                            <th><?php echo L('manage');?></td>
                          </tr>
					<?php if(empty($cart)) { ?>
							 <tr align="center">
							 <td colspan="7"  style="padding:10px;border:0;color:#FB0000;" align="center"><?php echo L('Order_no_product');?></td>
							 </tr>
					<?php } else { ?>
						<?php $n=1;if(is_array($cart)) foreach($cart AS $vo) { ?>
                          <tr align="center">
							<td height="70" style="border-left:none;"><a href="<?php echo $vo['product_url'];?>" target="_blank"><img src="<?php echo thumb($vo['product_thumb']);?>" width="60" height="60"/></a></td>
							<td><?php echo $vo['product_name'];?></td>
							<td><?php echo $vo['attr'];?></td>
							<td ><span id="price_<?php echo $vo['id'];?>"><?php echo $vo['product_price'];?></span></td>
							<td>
							<?php if($buy) { ?>
							<?php echo $vo['num'];?>
							<?php } else { ?>				 
							<div><input type="text" name="num" onchange="changeorder('num_<?php echo $vo['id'];?>','<?php echo $vo['moduleid'];?>','<?php echo $vo['id'];?>','update',changeok);" class="num" id="num_<?php echo $vo['id'];?>" value="<?php echo $vo['number'];?>" size="2"/></div>
							<?php } ?>
							</td>
							<td ><span class="count_price" id="count_price_<?php echo $vo['id'];?>"><?php echo number_format($vo['price'],2);?></span></td>
							<td><a href="javascript:void(0);" onclick="changeorder('num_<?php echo $vo['id'];?>','<?php echo $vo['moduleid'];?>','<?php echo $vo['id'];?>','del',changeok)"><?php echo L('delete');?></a> <a href="<?php echo $vo['product_url'];?>"  target="_blank"><?php echo L('Order_view_product');?></a></td>
						 </tr>
						 <?php $n++;}unset($n); ?>
					<?php } ?>
						</table>
                    </div>
                    <div id="prototal" style="text-align:right;">
      					<span><?php echo L('Order_product_total_number');?>：</span><b id="totalnum"><?php echo intval($cart['totalnum']);?></b><span>，</span>
                    	<span><?php echo L('Order_product_count');?>：</span><b id="totalprice"><?php echo number_format($cart['totalprice'],2);?></b><span> RMB&nbsp;&nbsp;</span>
                    </div>
					<div class="c"></div> 

				<div id="buy_button">
				<a href="<?php echo $Categorys[$id]['url'];?>"><img src="/Template/Default/images/order/goshop.jpg" /></a>
				<?php if(!empty($cart)) { ?><a href="./index.php?m=Order&a=checkout"><img src="/Template/Default/images/order/buy.jpg" /></a><?php } ?>
				</div>
			<div class="c"></div>
			<br>
			</div>
 
 
 
<script>
function changeok(obj,moduleid,id,doit,data){
	$('#'+obj).parent().css({ 'position': 'relative','overflow':'visible'});
	$('#'+obj).parent().append('<div id="cart_buy_ok"><?php echo L(update_ok);?>!</div>');	
	$('#cart_buy_ok').css({ display:'block',width:'60px',top: '-23px',position:'absolute',border:'2px solid #FFA040',background:'#FFF4E8',padding:'10px 30px' });
	if(doit=='update'){
		objnum = obj.split("_");
		objnum =objnum[1];
		var price= parseFloat($('#price_'+objnum).html());
		var num = parseInt($('#num_'+objnum).val());
		$('#count_price_'+objnum).html(price*num);
	}
	if(doit=='del'){
		$('#'+obj).parent().parent().parent().remove();
	}
	countprice();
	setTimeout(function(){  $('#cart_buy_ok').remove();},2000);
} 

function countprice(){
		var countnum=0,totalprice=0;
		$('.num').each(function(){var num = $(this).val();countnum=countnum + parseInt(num);});
		$('.count_price').each(function(){var count_price = $(this).html();count_price = count_price.replace(',','');totalprice=totalprice + parseFloat(count_price);});
		//count_price
		$('#totalnum').html(countnum);
		$('#totalprice').html(totalprice);
}
countprice();
</script>

<div class="c"></div>
<br>

</div></div>

<div id="footer" class="warp">
Powered by <a href="http://www.yourphp.cn" target="_blank">Yourphp</a>&nbsp;&nbsp;Copyright &copy; 2008-2011, All right reserved<br />
</div>
<?php if($Module[9]['status']) { ?>
	
<?php } ?>
<?php echo showTime();?>