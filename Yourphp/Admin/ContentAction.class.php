<?php
/**
 *
 * Content(内容管理模块)
 *
 * @package      	YOURPHP
 * @author          liuxun QQ:147613338 <web@yourphp.cn>
 * @copyright     	Copyright (c) 2008-2011  (http://www.yourphp.cn)
 * @license         http://www.yourphp.cn/license.txt
 * @version        	YourPHP企业网站管理系统 v2.1 2012-10-08 yourphp.cn $
 */
if(!defined("Yourphp")) exit("Access Denied");
class ContentAction extends AdminbaseAction
{
    protected  $dao,$fields;
    public function _initialize()
    {
        parent::_initialize();
		$module =$this->module[$this->moduleid]['name'];
		$this->dao = M($module);
		$this->M=C('M');

		$fields = F($this->moduleid.'_Field');
		foreach($fields as $key => $res){
			$res['setup']=string2array($res['setup']);
			$this->fields[$key]=$res;
		}
		unset($fields);
		unset($res);
		$this->assign ('fields',$this->fields);
    }

    /**
	 * 列表
	 *
	 */
    public function index()
    {
		$template = file_exists(THEME_PATH.MODULE_NAME.'_index.html') ? MODULE_NAME.':index' : 'Content:index';
		if($this->M[MODULE_NAME]){
			$this->_list('Content');
		}else{
			$this->_list(MODULE_NAME);
		}
        $this->display ($template);
    }

	public function add()
    {
		$vo['catid']= intval($_GET['catid']);
		$form=new Form($vo);
		$form->isadmin=1;
		$template =  file_exists(THEME_PATH.MODULE_NAME.'_edit.html') ? MODULE_NAME.':edit' : 'Content:edit';
		$this->display ( $template);
	}


	public function edit()
    {		
		$id = $_REQUEST ['id'];		
		if(MODULE_NAME=='Page'){
			$Page=M('Page');
			$p = $Page->find($id);
			if(empty($p)){
				$data['id']=$id;
				$data['title'] = $this->categorys[$id]['catname'];
				$data['keywords'] = $this->categorys[$id]['keywords'];
				$Page->add($data);	
			}
			$vo = $Page->find ( $id );
		}else{
			$vo = $this->dao->find ( $id );
		}
		$vo['content'] = htmlspecialchars($vo['content']);
 	 	
 
		$this->assign ( 'vo', $vo );
		$template =  file_exists(THEME_PATH.MODULE_NAME.'_edit.html') ? MODULE_NAME.':edit' : 'Content:edit';
		$this->display ( $template);
	}

    /**
     * 录入
     *
     */
    public function insert($module='',$fields=array(),$userid=0,$username='',$groupid=0)
    {
		$model = $module ?  M($module) : $this->dao;
		$fields = $fields ? $fields : $this->fields ;

		if($fields['verifyCode']['status'] && (md5($_POST['verifyCode']) != $_SESSION['verify'])){
			$this->assign ( 'jumpUrl','javascript:history.go(-1);');
			$this->error(L('error_verify'));
        }

		$_POST = checkfield($fields,$_POST);
		if(empty($_POST)) $this->error (L('do_empty'));


		//区域处理1
        if (isset($_POST['start_name_prov'])&&isset($_POST['start_name_city'])&&isset($_POST['start_name_town'])){   
                $prov = M('Region')->where("region_id={$_POST['start_name_prov']}")->getField('region_name');
                $city = M('Region')->where("region_id={$_POST['start_name_city']}")->getField('region_name');
                $town = M('Region')->where("region_id={$_POST['start_name_town']}")->getField('region_name');
                $_POST['start_name'] = "{$prov} {$city} {$town}";
                $_POST['start_name'] = trim($_POST['start_name']);

                $_POST['s_province'] = $_POST['start_name_prov'];
                $_POST['s_city'] = $_POST['start_name_city'];
                $_POST['s_town'] = $_POST['start_name_town'];
        }

        //区域处理2
        if (isset($_POST['end_name_prov'])&&isset($_POST['end_name_city'])&&isset($_POST['end_name_town'])){   
                $prov = M('Region')->where("region_id={$_POST['end_name_prov']}")->getField('region_name');
                $city = M('Region')->where("region_id={$_POST['end_name_city']}")->getField('region_name');
                $town = M('Region')->where("region_id={$_POST['end_name_town']}")->getField('region_name');
                $_POST['end_name'] = "{$prov} {$city} {$town}";
                $_POST['end_name'] = trim($_POST['end_name']);

                $_POST['e_province'] = $_POST['end_name_prov'];
                $_POST['e_city'] = $_POST['end_name_city'];
                $_POST['e_town'] = $_POST['end_name_town'];
        }
		
		$_POST['createtime'] = time();		 
		$_POST['updatetime'] = $_POST['createtime'];	
        $_POST['userid'] = $module ? $userid : $_SESSION['userid'];
		$_POST['username'] = $module ? $username : $_SESSION['username'];
		if($_POST['style_color']) $_POST['style_color'] = 'color:'.$_POST['style_color'];
		if($_POST['style_bold']) $_POST['style_bold'] =  ';font-weight:'.$_POST['style_bold'];
		if($_POST['style_color'] || $_POST['style_bold'] ) $_POST['title_style'] = $_POST['style_color'].$_POST['style_bold'];
 
		$module = $module? $module : MODULE_NAME ;
		if(GROUP_NAME=='User')$_POST['status'] = $this->Role[$groupid]['allowpostverify'] ? 1 : 0;
 
		if($this->M[$module]){
			$_POST['keywords'] =  str_replace('，',',',$_POST['keywords']);
			$_POST['mid']=$this->mod[$module];
			$_POST['id']=M('Content')->add($_POST);
		}
		if (false === $model->create ()) {
			$this->error ( $model->getError () );
		}

		$id = $model->add();
		if ($id !==false) {
			$id = $_POST['id'] ? $_POST['id'] : $id;
			$catid = $module =='Page' ? $id : $_POST['catid'];

			if($_POST['aid']) {
				$Attachment =M('Attachment');		
				$aids =  implode(',',$_POST['aid']);
				$data['id']=$id;
				$data['catid']= $catid;
				$data['status']= '1';
				$Attachment->where("aid in (".$aids.")")->save($data);
			}

			// 如果是添加公司，则添加对应的类型
			if ('Companys' == $module) {
				$data = array(
					'name' => $_POST['name'],
					'parentid' => 8,
					'keyid' => 8,
					'status' => 1
					);
				$type = M('Type');
				$type_id = $type->add($data);
				savecache('Type');
				$data = array(
					'type_id' => $type_id
					);
				M('Companys')->where("id = {$id}")->save($data);
			}

			$field = $model->getDbFields();			
			$data=array();
			$cat = $this->categorys[$catid];
			$url = geturl($cat,$_POST,$this->Urlrule);
			$data['id']=  $id;
			$data['url']= $url[0];
			if($this->M[$module]){
				M('Content')->save($data);
			}elseif($field['url']){
				$model->save($data);
			}

			if($this->M[$module]){
				$keywordsarr=explode(',',$_POST['keywords']);
				$i=0;
				$tagsdata =M('Tags_data');
				//$tagsdata->where("id=".$id)->delete();
				foreach((array)$keywordsarr as $tagname){
					if($tagname){
						$tagidarr=$tagdatas=$where=array();
						$slug =  substr(Pinyin($tagname),0,70);
						$where['slug']=array('eq',$slug);
						$tagid=M('Tags')->where($where)->field('id')->find();
						$tagidarr['id']=$id;
						if($tagid['id']){
							$num = $tagsdata->where("tagid=".$tagid[id])->count();
							$tagdatas['num']=$num+1;
							M('Tags')->where("id=".$tagid[id])->save($tagdatas);
							$tagidarr['tagid']=$tagid['id'];
							$tagidarr['moduleid']=$cat['moduleid'];
						}else{
							$tagdatas['name'] = $tagname;
							$tagdatas['slug'] = $slug;
							$tagdatas['num']=1;
							$tagdatas['lang']=$_POST['lang'];
							$tagidarr['tagid']=M('Tags')->add($tagdatas);
							$tagidarr['moduleid']=$cat['moduleid'];
						}
						$i++;
						$tagsdata->add($tagidarr);
					}
				}
			}

			if($cat['presentpoint']){
				if($cat['presentpoint']>0) M('User')->where("id=".$_POST['userid'])->setInc('point',$cat['presentpoint']);
				if($cat['presentpoint']<0) M('User')->where("id=".$_POST['userid'])->setDec('point',$cat['presentpoint']);
			}
 
			if($cat['ishtml'] && $_POST['status']){
				if($module!='Page'   && $_POST['status'])	$this->create_show($id,$module);				
				$arrparentid = array_filter(explode(',',$cat['arrparentid'].','.$cat['id']));
				foreach($arrparentid as $catid) {
					if($this->categorys[$catid]['ishtml'])	$this->clisthtml($catid);					
				}
 			}
			if($this->sysConfig['HOME_ISHTML']) $this->create_index();
			if(GROUP_NAME=='Admin'){
				$this->assign ( 'jumpUrl', U($module.'/index') );
			}elseif(GROUP_NAME=='User'){
				$this->assign ( 'jumpUrl',$_SERVER['HTTP_REFERER']);
				//$this->assign ( 'jumpUrl', U(GROUP_NAME.'-'.MODULE_NAME.'/add?moduleid='.$cat['moduleid']) );
			}
			$this->success (L('add_ok'));
		} else {
			$this->error (L('add_error').': '.$model->getDbError());
		}
	
    }

	function update($module='',$fields=array(),$userid=0,$username='')
	{  

		$model = $module ?  M($module) : $this->dao;
		$fields = $fields ? $fields : $this->fields ;
		if($fields['verifyCode']['status'] && (md5($_POST['verifyCode']) != $_SESSION['verify'])){
			$this->assign ( 'jumpUrl','javascript:history.go(-1);');
			$this->error(L('error_verify'));
        }

		$_POST = checkfield($fields,$_POST);
		if(empty($_POST)) $this->error (L('do_empty'));

		//区域处理1
        if (isset($_POST['start_name_prov'])&&isset($_POST['start_name_city'])&&isset($_POST['start_name_town'])){   
                $prov = M('Region')->where("region_id={$_POST['start_name_prov']}")->getField('region_name');
                $city = M('Region')->where("region_id={$_POST['start_name_city']}")->getField('region_name');
                $town = M('Region')->where("region_id={$_POST['start_name_town']}")->getField('region_name');
                $_POST['start_name'] = "{$prov} {$city} {$town}";
                $_POST['start_name'] = trim($_POST['start_name']);

                $_POST['s_province'] = $_POST['start_name_prov'];
                $_POST['s_city'] = $_POST['start_name_city'];
                $_POST['s_town'] = $_POST['start_name_town'];
        }

        //区域处理2
        if (isset($_POST['end_name_prov'])&&isset($_POST['end_name_city'])&&isset($_POST['end_name_town'])){   
                $prov = M('Region')->where("region_id={$_POST['end_name_prov']}")->getField('region_name');
                $city = M('Region')->where("region_id={$_POST['end_name_city']}")->getField('region_name');
                $town = M('Region')->where("region_id={$_POST['end_name_town']}")->getField('region_name');
                $_POST['end_name'] = "{$prov} {$city} {$town}";
                $_POST['end_name'] = trim($_POST['end_name']);

                $_POST['e_province'] = $_POST['end_name_prov'];
                $_POST['e_city'] = $_POST['end_name_city'];
                $_POST['e_town'] = $_POST['end_name_town'];
        }

		$_POST['updatetime'] = time();		
		if($_POST['style_color']) $_POST['style_color'] = 'color:'.$_POST['style_color'];
		if($_POST['style_bold']) $_POST['style_bold'] =  ';font-weight:'.$_POST['style_bold'];
		if($_POST['style_color'] || $_POST['style_bold'] ) $_POST['title_style'] = $_POST['style_color'].$_POST['style_bold'];

		$cat = $this->categorys[$_POST['catid']];
		$module = $module? $module : MODULE_NAME ;
		$_POST['url'] = geturl($cat,$_POST,$this->Urlrule);
		$_POST['url'] =$_POST['url'][0];
		$olddata = $model->find($_POST['id']);
		$_POST['keywords'] =  str_replace('，',',',$_POST['keywords']);

		
		if($this->M[$module])M('Content')->save($_POST);

		if (false === $model->create ()) {
			$this->error ( $model->getError () );
		}
		

		// 更新数据
		$list=$model->save ();

		if (false !== $list) {
			$id= $_POST['id'];

			// 如果修改公司信息，则修改公司分类中对应的公司名称
			if ('Companys' == $module) {
				$type_id = M('Companys')->where("id={$id}")->getField('type_id');
				$data = array(
					'name' => $_POST['name']
					);
				M('Type')->where("typeid={$type_id}")->save($data);
				savecache('Type');
			}

			$catid = $module =='Page' ? $id : $_POST['catid'];

			if($olddata['keywords']!=$_POST['keywords']  && $this->M[$module]){


				$tagidarr=$tagdatas=$where=array();
				$where['name']=array('in',$olddata['keywords']);
				$where['lang']=array('eq',$_POST['lang']);
				M('Tags')->where($where)->setDec('num'); 
				$tagsdata =M('Tags_data');
				$tagsdata->where("id=".$id)->delete();

				$keywordsarr=explode(',',$_POST['keywords']);			
				foreach((array)$keywordsarr as $tagname){
					if($tagname){
						$tagidarr=$tagdatas=$where=array();
						$slug =  substr(Pinyin($tagname),0,70);
						$where['slug']=array('eq',$slug);
						$tagid=M('Tags')->where($where)->field('id')->find();
						$tagidarr['id']=$id;
						if($tagid['id']){
							M('Tags')->where("id=".$tagid[id])->setInc('num');
							$tagidarr['tagid']=$tagid['id'];
						}else{
							$tagdatas['name'] = $tagname;
							$tagdatas['slug'] = $slug;
							$tagdatas['num']=1;
							$tagdatas['lang']=$_POST['lang'];
							$tagidarr['tagid']=M('Tags')->add($tagdatas);
						}
						$tagidarr['moduleid']=$cat['moduleid'];
						$tagsdata->add($tagidarr);
					}
				}
				M('Tags')->where('num<=0')->delete();
			}

			if($_POST['aid']) {
				$Attachment =M('Attachment');		
				$aids =  implode(',',$_POST['aid']);
				$data['id']= $id;
				$data['catid']= $catid;
				$data['status']= '1';
				$Attachment->where("aid in (".$aids.")")->save($data);
			}
			$cat = $this->categorys[$catid];
			if($cat['ishtml']){
				if($module!='Page'  && $_POST['status'])	$this->create_show($id,$module);
				$arrparentid = array_filter(explode(',',$cat['arrparentid'].','.$cat['id']));
				foreach($arrparentid as $catid) {
					if($this->categorys[$catid]['ishtml'])	$this->clisthtml($catid);					
				}
 			}
			if($this->sysConfig['HOME_ISHTML']) $this->create_index();
			$this->assign ( 'jumpUrl', $_POST['forward'] );
			$this->success (L('edit_ok'));
		} else {
			//错误提示
			$this->success (L('edit_error').': '.$model->getDbError());
		}
	}

 
	function statusallok(){

		$module = MODULE_NAME;
		$model = $this->M[$module]?  M ( 'Content' ) : M ( $module );
		$ids=$_POST['ids'];
		if(!empty($ids) && is_array($ids)){
			$id=implode(',',$ids);
			$data = $model->select($id);
			if($data){				
				foreach($data as $key=>$r){	
					$model->save(array(id=>$r['id'],status=>1));
					if($this->categorys[$r['catid']]['ishtml'] && $r['status'])$this->create_show($r['id'],$module);	
				}
				$cat =  $this->categorys[$r['catid']];
				if($cat['ishtml']){			
					if($this->sysConfig['HOME_ISHTML']) $this->create_index();
					$arrparentid = array_filter(explode(',',$cat['arrparentid'].','.$cat['id']));
					foreach($arrparentid as $catid) {
						if($this->categorys[$catid]['ishtml'])	$this->clisthtml($catid);					
					}
				}
				$this->success(L('do_ok'));
			}else{
				$this->error(L('do_error').': '.$model->getDbError());
			}
		}else{
			$this->error(L('do_empty'));
		}
	}

	/*状态*/

	public function status(){
		$module = MODULE_NAME;
		$model = $this->M[$module]?  M ( 'Content' ) : M ( $module );
		if($model->save($_GET)){
			$_POST ='';
			$_POST = $model->find($_GET['id']);
			$cat =  $this->categorys[$_POST['catid']];
			if($cat['ishtml']){
				if($module!='Page'  && $_POST['status'])	$this->create_show($_POST['id'],$module);				
				if($this->sysConfig['HOME_ISHTML']) $this->create_index();
				$arrparentid = array_filter(explode(',',$cat['arrparentid'].','.$cat['id']));
				foreach($arrparentid as $catid) {
					if($this->categorys[$catid]['ishtml'])	$this->clisthtml($catid);					
				}
 			}

			$this->success(L('do_ok'));
		}else{
			$this->error(L('do_error'));
		}
	}


}?>