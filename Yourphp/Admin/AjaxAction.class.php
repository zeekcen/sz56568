<?php
/**
 *异步获取地区数据
 *
 */
class AjaxAction extends AdminbaseAction {
	protected  $dao,$fields;
	public function _initialize() {
		parent::_initialize();
	}

	public function getRegion(){
		$Region = M("Region");
		$map['parent_id']=$_REQUEST["parent_id"];
		$map['region_type']=$_REQUEST["region_type"];
		$list = $Region->where($map)->select();
		echo json_encode($list);
	}	

}
