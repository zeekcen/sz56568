<?php	return array (
  'start_name' => 
  array (
    'id' => '170',
    'moduleid' => '12',
    'field' => 'start_name',
    'name' => '出发地',
    'tips' => '',
    'required' => '0',
    'minlength' => '0',
    'maxlength' => '0',
    'pattern' => '0',
    'errormsg' => '',
    'class' => '',
    'type' => 'linkage',
    'setup' => 'array (
  \'safefun\' => \'\',
)',
    'ispost' => '0',
    'unpostgroup' => '',
    'listorder' => '0',
    'status' => '1',
    'issystem' => '0',
  ),
  'end_name' => 
  array (
    'id' => '171',
    'moduleid' => '12',
    'field' => 'end_name',
    'name' => '目的地',
    'tips' => '',
    'required' => '0',
    'minlength' => '0',
    'maxlength' => '0',
    'pattern' => '0',
    'errormsg' => '',
    'class' => '',
    'type' => 'linkage',
    'setup' => 'array (
  \'safefun\' => \'\',
)',
    'ispost' => '0',
    'unpostgroup' => '',
    'listorder' => '0',
    'status' => '1',
    'issystem' => '0',
  ),
  'company_id' => 
  array (
    'id' => '179',
    'moduleid' => '12',
    'field' => 'company_id',
    'name' => '所属公司id',
    'tips' => '',
    'required' => '0',
    'minlength' => '0',
    'maxlength' => '0',
    'pattern' => '0',
    'errormsg' => '',
    'class' => '',
    'type' => 'typeid',
    'setup' => 'array (
  \'inputtype\' => \'select\',
  \'fieldtype\' => \'smallint\',
  \'numbertype\' => \'1\',
  \'labelwidth\' => \'\',
  \'default\' => \'8\',
  \'safefun\' => \'\',
)',
    'ispost' => '0',
    'unpostgroup' => '',
    'listorder' => '0',
    'status' => '1',
    'issystem' => '0',
  ),
  'createtime' => 
  array (
    'id' => '118',
    'moduleid' => '12',
    'field' => 'createtime',
    'name' => '发布时间',
    'tips' => '',
    'required' => '1',
    'minlength' => '0',
    'maxlength' => '0',
    'pattern' => '',
    'errormsg' => '',
    'class' => '',
    'type' => 'datetime',
    'setup' => '',
    'ispost' => '0',
    'unpostgroup' => '3,4',
    'listorder' => '93',
    'status' => '1',
    'issystem' => '1',
  ),
  'status' => 
  array (
    'id' => '119',
    'moduleid' => '12',
    'field' => 'status',
    'name' => '状态',
    'tips' => '',
    'required' => '0',
    'minlength' => '0',
    'maxlength' => '0',
    'pattern' => '',
    'errormsg' => '',
    'class' => '',
    'type' => 'radio',
    'setup' => 'array (
  \'options\' => \'已审核|1
未审核|0\',
  \'fieldtype\' => \'tinyint\',
  \'numbertype\' => \'1\',
  \'labelwidth\' => \'75\',
  \'default\' => \'1\',
)',
    'ispost' => '0',
    'unpostgroup' => '3,4',
    'listorder' => '99',
    'status' => '1',
    'issystem' => '1',
  ),
);?>