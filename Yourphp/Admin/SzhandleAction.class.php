<?php
/**
 * 
 * 客户端接口
 */
if(!defined("Yourphp")) exit("Access Denied");
class SzhandleAction extends AdminbaseAction {
	/**
	 * session_id
	 */
	private $_sid;

	/**
	 * 验证码过期时间
	 */
	private $_expired = 1;

	private $_page = 1;
	private $_page_size = 10;

	function _initialize() {
		parent::_initialize();

		$this->_sid = session_id();
		if(empty($this->_sid)) session_start();
		$this->_sid = session_id();

		if (isset($_REQUEST['page']) && trim($_REQUEST['page'])) {
			$this->_page = trim($_REQUEST['page']);
		}

		if (isset($_REQUEST['page_size']) && trim($_REQUEST['page_size'])) {
                        $this->_page_size = trim($_REQUEST['page_size']);
                } 
	}

	/**
	 * 客户端登陆
	 */
	public function user_login(){
		$result = array();

		$phone = $_REQUEST['phone'];
		$password = $_REQUEST['password'];
		$password = sysmd5($password);

		$user = M('User')->where("mobile='{$phone}' and password='{$password}'")->find();

		if ($user) {
			$_SESSION[$this->_sid]['phone'] = $phone;
			$_SESSION[$this->_sid]['id'] = $user['id'];

			$result['status'] = 1;
			$result['phone'] = $phone;
			$result['user_id'] = $user['id'];
		}else{
			$result['status'] = 0;
			$result['error_msg'] = "请检查登录账号或密码.";
		}
		echo json_encode($result);
	}

	// 获取短信验证码
	public function vercode_get(){
		$result = array();
		$phone = $_REQUEST['phone'];
		$type = $_REQUEST['type'];

		$vercode= substr(md5(time()), 0, 6);
		$vercode= mt_rand(100000,999999);

		$ctime = 0;
		if (isset($_SESSION['vercode_ctime'])) $ctime = $_SESSION['vercode_ctime'];
		$now = time();

		if ( ! isset($_SESSION['vercode_ctime'])) {
			$_SESSION['vercode_ctime'] = time();
		}else if ($now - $ctime > $this->_expired) {
			$_SESSION['vercode'] = $vercode;
			$_SESSION['vercode_ctime'] = time();
		}else{
			$result['status'] = 0;
			$result['error_msg'] = "请稍后再获取验证码.";
			echo json_encode($result);
			return;
		}

		$name = 'zqqjs';
		$pwd = 'zqqjs';
		$dst  = $phone;
		switch($type){
			case 1:
				$msg  = "此次的手机验证码是：{$vercode}。请在1分钟内完成验证。【】";
				break;
			case 2:
				$msg  = "此次的手机验证码是：{$vercode}。请在1分钟内完成验证。【】";
				break;
		}

		$msg = iconv("utf-8","gbk", $msg);
		$msg = rawurlencode(rawurlencode($msg));
		$url = "http://111.1.37.36:8686/link_smssend.asp?username=$name&password=$pwd&mobile=$dst&content=$msg";
		$ret = file_get_contents($url);

		if ($ret == '10000') {
			$result['status'] = 1;
		}else{
			$result['status'] = 0;
			$result['error_msg'] = '短信发送失败.';
		}
		echo json_encode($result);
	}

	/**
	 * 用户注册
	 */
	public function user_register(){
		$result = array();

		$phone = $_REQUEST['phone'];
		$password = $_REQUEST['password'];
		$username = 'unknow';
		$vercode = $_REQUEST['vercode'];

		// 检查验证码
/*
		if ( ! $this->_check_vercode($vercode)) {
			$result['status'] = 0;
			$result['error_msg'] = '验证码已过期，请重新获取.';
			echo json_encode($result);
			exit;
		}
*/

		$user = M('User');
		$ret = $user->where("mobile = '{$phone}'")->find();
		if ($ret){
			$result['status'] = 0;
			$result['error_msg'] = '该用户已经存在.';
			echo json_encode($result);
			return;
		}

		$data = array(
				'mobile' => $phone,
				'username' => $username,
				'password' => sysmd5($password),
				'groupid' => 3,
				'createtime' => time()
			     );

		$ret = $user->add($data);
		if ($ret){
			$result['status'] = 1;
		}else{
			$result['status'] = 0;
			$result['error_msg'] = '注册失败.';
		}

		echo json_encode($result);
	}

	/**
	 * 修改密码
	 */
	public function password_update() {
		$result = array();
		// 获取参数
		$phone = $_REQUEST['phone'];
		$old_password = $_REQUEST['password_old'];
		$new_password = $_REQUEST['password_new'];

		if ($old_password == $new_password) {
			$result['status'] = 0;
			$result['error_msg'] = '新旧密码一致，请确认是否修改密码.';
			echo json_encode($result);
			return;
		}

		// 加密密码
		$old_password = sysmd5($old_password);
		$new_password = sysmd5($new_password);

		$user = M('User');
		// 检查原密码是否正确
		$ret = $user->where("mobile='{$phone}' and password='{$old_password}'")->find();
		if ( ! $ret){
			$result['status'] = 0;
			$result['error_msg'] = '原始密码有误，请检查.';
			echo json_encode($result);
			return;
		}

		// 修改密码
		$data = array(
				'password' => $new_password
			     );
		$ret = $user->where("mobile='{$phone}' and password='{$old_password}'")->save($data);
		if ($ret){
			$result['status'] = 1;
		}else{
			$result['status'] = 0;
			$result['error_msg'] = '修改密码失败.';
		}

		echo json_encode($result);
	}

	// 找回密码
	public function password_remember() {
		$result = array();

		$phone = $_REQUEST['phone'];
		$password = $_REQUEST['password'];
		$vercode = $_REQUEST['vercode'];
/*
		if ( ! $this->_check_vercode($vercode)) {
			$result['status'] = 0;
			$result['error_msg'] = '验证码已过期，请重新获取.';
			echo json_encode($result);
			exit;
		}
*/
		$user = M('User');
		$data = array(
				'password' => sysmd5($password)
			     );
		$data['pass'] = sysmd5($password);
		$ret = M('User')->where("mobile = '{$phone}' and password = '{$data['password']}'")->find();
		if ($ret) {	// 密码与原密码一致亦成功
			$result['status'] = 1;
			echo json_encode($result);
			return;
		}

		$cnt = M('User')->where("mobile = '{$phone}'")->save($data);
		if ($cnt){
			$result['status'] = 1;
		}else{
			$result['status'] = 0;
			$result['error_msg'] = '密码重置失败.';
		}
		echo json_encode($result);
	}

	public function check_app_update(){
		$result = array();

		$os = $_REQUEST['os'];
		$versioncode = $_REQUEST['version'];

		$versions = M('Versions');

		$latest_version = $version->where("status = 1 and version > {$versioncode}")->order('version desc')->find();
		if ($latest_version) {
			$result['status'] = 1;
			$result['version'] = $latest_version['version'];
			if ($os = 'android') {
				$result['url'] = $this->_domain.$latest_version['url'];
			}else{
				$result['url'] = $latest_version['url'];
			}

			$result['remark'] = $latest_version['remark'];
		}else{
			$result['status'] = 0;
			$result['version'] = "";
			$result['url'] = "";
			$result['remark'] = "";
		}
		echo json_encode($result);
	}

	// 检查验证码是否过期
	private function _check_vercode($vercode) {
		if ($_SESSION['vercode'] != $vercode) {
			return FALSE;
		}

		$ctime = 0;
		if (isset($_SESSION['vercode_ctime'])) $ctime = $_SESSION['vercode_ctime'];
		else return FALSE;
		$now = time();

		if ($now - $ctime > $this->_expired) {
			return FALSE;
		}

		return TRUE;
	}

	// ------------------------------------------- 公司 -----------------------------------------------
	/**
	 * 获取公司信息列表
	 */
	public function company_get_list() {
		$result = array();

		$city_id = $_REQUEST['city_id'];
		// 找出城市id对应的城市名称
		$city_name = M('Region')->where("region_id={$city_id}")->getField('region_name');

		// 获取公司列表
		$companys = M('Companys')->where("address like '%{$city_name}%'")->page($this->_page)->select();
		if ( ! count($companys)) {
			$result['status'] = 0;
			$result['error_msg'] = '没有符合条件的公司.';
			echo json_encode($result);
			exit;
		}


		$result['status'] = 1;
		$result['list'] = $this->_formate_company_list($companys);
		$result['page'] = $this->_page;
                $result['page_size'] = $this->_page_size;
		echo json_encode($result);
	}

	/**
	 * 公司搜索
	 */
	public function company_search_list() {
		$result = array();

		$key = $_REQUEST['key'];

		$companys = M('Companys')->where("name like '%{$key}%'")->page($this->_page)->select();
		if ( ! count($companys)) {
			$result['status'] = 0;
			$result['error_msg'] = '没有符合条件的公司.';
			echo json_encode($result);
			exit;
		}

		$result['status'] = 1;
		$result['list'] = $result['list'] = $this->_formate_company_list($companys);
		$result['page'] = $this->_page;
                $result['page_size'] = $this->_page_size;
		echo json_encode($result);
	}

	/**
	 * 公司详细
	 */
	public function company_get_detail() {
		$result = array();

		$company_id = $_REQUEST['company_id'];
		$company = M('Companys')->where("id={$company_id}")->find();
		if ( ! $company) {
			$result['status'] = 0;
			$result['error_msg'] = '找不到该公司.';
			echo json_encode($result);
			exit;
		}

		$img_list = $this->_formate_img_list($company['type_id']);
		$module_list = $this->_formate_module_list($company['type_id']);
		$service_list = $this->_formate_service_list($company['type_id']);
		$data = array(
				'company_id' => $company_id,
				'is_favorite' => $is_favorite,
				'is_approve' => $company['is_approve'],
				'exp' => $company['exp'],
				'about' => $company['about'],
				'img_list' => $img_list,
				'sub_list' => $module_list,
				'service_list' => $service_list
			     );

		$result['status'] = 1;
		$result['data'] = $data;
		echo json_encode($result);
	}

	/**
	 * 公司列表我的收藏
	 */
	public function company_get_favorite_list() {
		$result = array();

		$user_id = $_REQUEST['user_id'];

		// 找出用户收藏的公司
		$companys = M('Companysfavo')->where("user_id={$user_id}")->page($this->_page)->select();
		if ( ! $companys) {
			$result['status'] = 0;
			$result['error_msg'] = "没有收藏的公司.";
			echo json_encode($result);
			exit;
		}
		// 找出收藏的公司id
		$companys_id_arr = array();
		foreach ($companys as $row) {
			$companys_id_arr[] = $row['company_id'];
		}
		$companys_id_str = implode(',', $companys_id_arr);

		// 查询公司信息
		$companys = M('Companys')->where("id in ({$companys_id_str})")->select();
		$result['status'] = 1;
		$result['list'] = $result['list'] = $this->_formate_company_list($companys);
		$result['page'] = $this->_page;
		$result['page_size'] = $this->_page_size;
		echo json_encode($result);

	}

	/**
	 * 收藏公司
	*/
	public function company_change_favorite() {
		$result = array();
		$user_id = $_REQUEST['user_id'];
		$company_id = $_REQUEST['company_id'];

		if ( ! $user_id || ! $company_id) {
			$result['status'] = 0;
			$result['error_msg'] = '缺少参数用户id或者公司id.';
			echo json_encode($result);
			exit;
		} 

		// 检查是否已经收藏
		$ret = M('Companysfavo')->where("user_id = {$user_id} and company_id = {$company_id}")->find();
		if ($ret) {
			$result['status'] = 1;
			echo json_encode($result);
			exit;
		}

		$data = array(
			'user_id' => $user_id,
			'company_id' => $company_id
		);
		$ret = M('Companysfavo')->save($data);
		if ( ! $ret) {
			$result['status'] = 0;
			$result['error_msg'] = '收藏失败.';
		}else{
			$result['status'] = 1;
		}
		echo json_encode($result);
	}

	/**
	 * 格式化公司列表数组
	 */
	private function _formate_company_list($companys) {
		$company_list = array();
		foreach ($companys as $row) {
			// 获取公司服务信息列表
			$service_list = $this->_formate_service_list($row['type_id']);
			$company_list[] = array(
					'company_id' => $row['id'],
					'img_url' => $row['img_url'],
					'name' => $row['name'],
					'is_recommend' => $row['is_recommend'],
					'is_approve' => $row['is_approve'],
					'service_list' => $service_list
					);
		}
		return $company_list;
	}


	/**
	 * 格式化服务信息列表
	 */
	private function _formate_service_list($company_id) {
		$service_list = array();
		$services = M('Services')->where("company_id={$company_id}")->select();
		foreach ($services as $service) {
			$service_list[] = array(
					'start_name' => $service['start_name'],
					'end_name' => $service['end_name']
					);
		}

		return $service_list;
	}

	/**
	 * 格式化公司模块列表
	 */
	private function _formate_module_list($company_id) {
		$module_list = array();
		$modules = M('Modules')->where("company_id={$company_id}")->select();
		foreach ($modules as $module) {
			$module_list[] = array(
					'name' => $module['name'],
					'address' => $module['address'],
					'longitude' => $module['longitude'],
					'latitude' => $module['latitude'],
					'contact' => $module['contact'],
					'phone' => $module['phone']
					);
		}

		return $module_list;
	}

	/**
	 * 格式化图册信息列表
	 */
	private function _formate_img_list($company_id) {
		$img_list = array();
		$imgs = M('Pictures')->where("company_id={$company_id}")->select();
		foreach ($imgs as $img) {
			$img_list = array(
					'title' => $img['title'],
					'img_url' => $img['img_url']
					);
		}

		return $img_list;
	}

	// ------------------------------------------- 专线 -----------------------------------------------

	/**
	 * 物流专线列表
	 */
	public function leased_get_list() {
		$result = array();

		$longitude = $_POST['longitude'];
		$latitude = $_POST['latitude'];
		$start_county_id = $_POST['start_county_id'];
		$end_county_id = $_POST['end_county_id'];

		$leased_list = array();
		// 找出具备该专线的模块
		$start_name = M('Region')->where("region_id={$start_county_id}")->getField('region_name');
		$end_name = M('Region')->where("region_id={$end_county_id}")->getField('region_name');
		$services = M('Services')->where("start_name like '%{$start_name}%' and end_name like '%{$end_name}%'")->page($this->_page)->select();
		if ( ! count($services)) {
			$result['status'] = 0;
			$result['error_msg'] = '没有符合条件的结果.';
			echo json_encode($result);
			exit;
		}

		$result['status'] = 1;
		$result['list'] = $this->_formate_leased_list($services);
		echo json_encode($result);
	}


	/**
	 *专线列表-我的收藏
	 */
	public function leased_get_favorite_list() {
		$result = array();

		$user_id = $_REQUEST['user_id'];

		$services = M('Servicesfavo')->where("user_id={$user_id}")->page($this->_page)->select();
		if ( ! count($services)) {
			$result['status'] = 0;
			$result['error_msg'] = '没有收藏的专线.';
			echo json_encode($result);
			exit;
		}

		// 找出收藏的专线id
		$services_id_arr = array();
		foreach ($services as $row) {
			$services_id_arr[] = $row['service_id'];
		}
		$services_id_str = implode(',', $services_id_arr);

		$services = M('Services')->where("id in ({$services_id_str})")->select();
		$result['status'] = 1;
		$result['list'] = $this->_formate_service_list($services);
		echo json_encode($result);
	}

	/**
	 * 附近公司列表
	 */
	public function leased_get_around_list() {
		$result = array();

		$longitude = $_REQUEST['longitude'];
		$latitude = $_REQUEST['latitude'];


	}

	/**
	 * 格式化专线列表
	 */
	private function _formate_leased_list($services) {
		$leased_list = array();
		foreach ($services as $row) {
			// 找出模块对应的公司信息
			$company = M('Companys')->where("type_id={$row['company_id']}")->find();
			$distance = 0;
			$leased_list[] = array(
					'id' => $company['id'],
					'start_name' => $row['start_name'],
					'end_name' => $row['end_name'],
					'img_url' => $company['img_url'],
					'name' => $row['name'],
					'exp' => $row['exp'],
					'address' => $row['address'],
					'is_recommend' => $row['is_recommend'],
					'is_approve' => $row['is_approve'],
					'distance' => $distance
					);
		}
		return $leased_list;
	}

	// ------------------------------------------- 车源 -----------------------------------------------
	/**
	 * 车源列表
	 */
	public function car_get_list() {
		$result = array();

		$start_county_id = $_REQUEST['start_county_id'];
		$end_county_id = $_REQUEST['end_county_id'];

		$start_name = M('Region')->where("region_id={$start_county_id}")->getField('region_name');
		$end_name = M('Region')->where("region_id={$end_county_id}")->getField('region_name');

		// 找出具备该路线的车源
		$carsrcs = M('Carsrc')->where("start_name like '%{$start_name}%' and end_name like '%{$end_name}%'")->select();
		if ( ! count($carsrcs)) {
			$result['status'] = 0;
			$result['error_msg'] = '没有符合条件的车源.';
			echo json_encode($result);
			exit;
		}

		$result['status'] = 1;
		$result['list'] = $this->_get_carsrc_list($carsrcs);
		echo json_encode($result);
	}

	/**
	 * 车源列表-我的收藏
	 */
	public function car_get_favorite_list() {
		$user_id = $_REQUEST['user_id'];
		$page = $_REQUEST['page'];
		$page_size = $_REQUEST['page_size'];

		$carsrcs = M('Carsrcfavo')->where("user_id={$user_id}")->page("{$page}, {$page_size}")->select();
		if ( ! count($carsrcs)) {
			$result['status'] = 0;
			$result['error_msg'] = '没有符合条件的车源.';
			echo json_encode($result);
			exit;
		}

		$result['status'] = 1;
		$result['list'] = $this->_get_carsrc_list($carsrcs);
		echo json_encode($result);
	}

	/**
	 * 车源列表-我的发布
	 */
	public function car_get_my_list() {
		$user_id = $_REQUEST['user_id'];
		$page = $_REQUEST['page'];
		$page_size = $_REQUEST['page_size'];

		$carsrcs = M('Carsrcpub')->where("user_id={$user_id}")->page("{$page}, {$page_size}")->select();
		if ( ! count($carsrcs)) {
			$result['status'] = 0;
			$result['error_msg'] = '没有符合条件的车源.';
			echo json_encode($result);
			exit;
		}

		$result['status'] = 1;
		$result['list'] = $this->_get_carsrc_list($carsrcs);
		echo json_encode($result);
	}

	/**
	 * 车源详细
	 */
	public function car_get_detail() {
		$result = array();
		$user_id = $_REQUEST['user_id'];
		$car_id = $_REQUEST['car_id'];

		$car_info = M('Carsrc')->where("id={$car_id}")->find();
		if ( ! $car_info) {
			$result['status'] = 0;
			$result['error_msg'] = '无法获取车源详情.';
			echo json_encode($result);
			exit;
		}

		// 0 本地车；1 回车程
		$car_driver_type = $car_info['car_driver_type']?'回程车':'本地车';
		$car_type = M('Type')->where("typeid={$car_info['car_type']}")->getField('name');
		$car_status = M('Type')->where("typeid={$car_info['car_status']}")->getField('name');

		$data = array(
				'car_id' => $car_info['id'],
				'user_id' => $car_info['user_id'],
				'start_name' => $car_info['start_name'],
				'end_name' => $car_info['end_name'],
				'start_county_id' => '',
				'end_county_id' => '',
				'date_s' => date('Y-m-d', $car_info['date_s']),
				'date_f' => date('Y-m-d', $car_info['date_f']),
				'exp' => $car_info['car_info'],
				'car_driver_type' => $car_driver_type,
				'car_long' => $car_info['car_long'],
				'car_load' => $car_load['car_load'],
				'car_type' => $car_type,
				'car_number' => $car_info['car_number'],
				'car_vin' => $car_info['car_vin'],
				'car_phone' => $car_info['car_phone']
			     );
		$result['status'] = 1;
		$result['data'] = $data;
		echo json_encode($result);		
	}

	/**
	 * 车源收藏状态改变
	 */
	public function car_change_favorite() {
		$result = array();
		$user_id = isset($_REQUEST['user_id'])?trim($_REQUEST['user_id']):0;
		$car_id = $_REQUEST['car_id'];

		$data = array(
				'user_id' => $user_id,
				'carsrc_id' => $car_id
			     );

		$ret = M('Carsrcfavo')->add($data);
		if ( ! $ret) {
			$result['status'] = 0;
			$result['error_msg'] = '收藏失败.';
		}else{
			$result['status'] = 1;
			$result['error_msg'] = '收藏成功.';
		}

		echo json_encode($result);
	}

	/**
	 * 车源发布
	 */
	public function car_create() {
		$result = array();
		$user_id = $_REQUEST['user_id'];
		$data = $_REQUEST['data'];
		$data = json_decode($data);

		$ret = M('Carsrc')->add($data);
		if ( ! $ret) {
			$result['status'] = 0;
			$result['error_msg'] = '发布失败.';
		}else{
			$result['status'] = 1;
			$result['error_msg'] = '发布成功.';
		}

		echo json_encode($result);
	}

	/**
	 * 车源举报
	 */
	public function car_inform() {
		$user_id = $_REQUEST['user_id'];
		$car_id = $_REQUEST['car_id'];

		$data = array(
				'user_id' => $user_id,
				'carsrc_id' => $car_id
			     );

		$ret = M('Carsrcinform')->add($data);
		if ( ! $ret) {
			$result['status'] = 0;
			$result['error_msg'] = '举报失败.';
		}else{
			$result['status'] = 1;
			$result['error_msg'] = '举报成功.';
		}

		echo json_encode($result);
	}

	/**
	 * 车源编辑
	 */
	public function car_edit() {
		$user_id = $_REQUEST['user_id'];
		$car_id = $_REQUEST['car_id'];
		$data = $_REQUEST['data'];
		$data = json_decode($data);

		$ret = M('Carsrc')->where("user_id={$user_id} and id={$car_id}")->save($data);

		$ret = M('Carsrcinform')->add($data);
		if ( ! $ret) {
			$result['status'] = 0;
			$result['error_msg'] = '修改失败.';
		}else{
			$result['status'] = 1;
			$result['error_msg'] = '修改成功.';
		}

		echo json_encode($result);
	}

	/**
	 * 获取收藏或发布车源列表
	 */
	private function _get_carsrc_list($carsrcs) {
		$car_list = array();
		foreach ($carsrcs as $row) {
			$carsrc_id = $row['carsrc_id'];
			$car_info = M('Carsrc')->where("id={$carsrc_id}")->find();
			$car_list[] = $this->_formate_carsrc_arr($car_info);
		}
		return $car_list;
	}

	/**
	 * 格式化车源数组信息
	 */
	private function _formate_carsrc_arr($car_info) {
		$formate_arr = array(
				'company_id' => '',
				'start_name' => $car_info['start_name'],
				'end_name' => $car_info['end_name'],
				'title' => "{$car_info['car_number']}-{$car_info['car_driver_type']}-{$car_info['car_load']}-{$car_info['car_long']}-{$car_info['car_type']}",
				'date_s' => date('Y-m-d', $car_info['date_s'])
				);

		return $formate_arr;
	}

	// ------------------------------------------- 货源 -----------------------------------------------
	/**
	 * 货源列表
	 */
	public function goods_get_list() {
		$result = array();

		$page = $_REQUEST['page'];
		$page_size = $_REQUEST['page_size'];
		$city_id = $_REQUEST['city_id'];


	}

	/**
	 * 货源列表-我的收藏
	 */
	public function goods_get_favorite_list() {
		$result = array();

		$user_id = $_REQUEST['user_id'];
		$page = $_REQUEST['page'];
		$page_size = $_REQUEST['page_size'];

	}

	/**
	 * 货源列表-我的发布
	 */
	public function goods_get_my_list() {
		$result = array();

		$user_id = $_REQUEST['user_id'];
		$page = $_REQUEST['page'];
		$page_size = $_REQUEST['page_size'];
	}

	/**
	 * 货源详细
	 */
	public function goods_get_detail() {
		$result = array();
		$user_id = $_REQUEST['user_id'];
		$goods_id = $_REQUEST['goods_id'];

	}
}
