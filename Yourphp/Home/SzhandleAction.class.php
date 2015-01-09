<?php
/**
 * 
 * 客户端接口
 */
if(!defined("Yourphp")) exit("Access Denied");
class SzhandleAction extends BaseAction {
	/**
	 * session_id
	 */
	private $_sid;

	/**
	 * 验证码过期时间
	 */
	private $_expired = 300;

	private $_page = 1;
	private $_page_size = 20;

	private $_domain = 'http://www.sz56568.com';

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

		$token = "token4wuliu8";
		$time = $_REQUEST['time'];
		$mac = $_REQUEST['mac'];

		$auth = md5($token.$time);
		$now = time();
		$result = array();
		if ($auth != $mac && $_GET['a'] != 'download') {
			$result = array(
				'status' => 0,
				'error_msg' => '请求参数错误'
			);
			die(json_encode($result));
		}/*elseif ($now - $time > 10 * 60) {
			$result = array(
                                'status' => 0,
                                'error_msg' => '请求已过期'
                        );	
			die(json_encode($result));	
		}*/
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
			$data['phone'] = $phone;
			$data['user_id'] = $user['id'];
			$result['data'] = $data;
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

		//$vercode= substr(md5(time()), 0, 6);
		$vercode= mt_rand(1000,9999);

		$ret = M('Vercode')->where("phone={$phone}")->find();

		$ctime = 0;
		if ($ret) {
			$ctime = $ret['ctime'];
		}
		$now = time();

		if ( ! $ret) {
			$data = array(
					'phone' => $phone,
					'vercode' => $vercode,
					'ctime' => time()
				     );
			M('Vercode')->add($data);
		}else if ($now - $ctime > $this->_expired) {
			$data = array(
					'vercode' => $vercode,
					'ctime' => time(),
				     );
			M('Vercode')->where("phone={$phone}")->save($data);
		}else{
			$result['status'] = 0;
			$result['error_msg'] = "请稍后再获取验证码.";
			echo json_encode($result);
			return;
		}

		$type = 1;
		switch($type){
			case 1:
				$msg  = "此次的手机验证码是：{$vercode}。请在1分钟内完成验证。【物流之家】";
				break;
			case 2:
				$msg  = "此次的手机验证码是：{$vercode}。请在1分钟内完成验证。【物流之家】";
				break;
		}

		$company = '物流之家';
		$tpl_id = 1;
		$tpl_value = "#code#={$vercode}&#company#={$company}";
		$ret = $this->_tpl_send_sms($tpl_id, $tpl_value, $phone);
		$arr = json_decode($ret, TRUE);
		$code = $arr['code'];
		if ($code == 0) {
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
		if ( ! $this->_check_vercode($phone, $vercode)) {
			$result['status'] = 0;
			$result['error_msg'] = '验证码已过期，请重新获取.';
			echo json_encode($result);
			exit;
		}

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
			$data['user_id'] = $ret;
			$data['phone'] = $phone;
			$result['data'] = $data;
			M('Vercode')->where("phone={$phone}")->delete();
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
		$ret = $user->where("mobile = '{$phone}' and password = '{$old_password}'")->find();
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
		$ret = $user->where("mobile = '{$phone}' and password = '{$old_password}'")->save($data);
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

		if ( ! $this->_check_vercode($phone, $vercode)) {
			$result['status'] = 0;
			$result['error_msg'] = '验证码已过期，请重新获取.';
			echo json_encode($result);
			exit;
		}

		$user = M('User');
		$data = array(
				'password' => sysmd5($password)
			     );
		$data['pass'] = sysmd5($password);
		$ret = M('User')->where("mobile = '{$phone}' and password = '{$data['password']}'")->find();
		if ($ret) {	// 密码与原密码一致亦成功
			$result['status'] = 1;
			M('Vercode')->where("phone={$phone}")->delete();
			echo json_encode($result);
			return;
		}

		$cnt = M('User')->where("mobile = '{$phone}'")->save($data);
		if ($cnt){
			$result['status'] = 1;
			M('Vercode')->where("phone={$phone}")->delete();
		}else{
			$result['status'] = 0;
			$result['error_msg'] = '密码重置失败.';
		}
		echo json_encode($result);
	}

	// 检查验证码是否过期
	private function _check_vercode($phone, $vercode) {
		$ret = M('Vercode')->where("phone={$phone}")->find();
		if ( ! $ret) return FALSE;
		if ($ret['vercode'] != $vercode) {
			return FALSE;
		}

		$ctime = $ret['ctime'];
		$now = time();

		if ($now - $ctime > $this->_expired) {
			return FALSE;
		}

		return TRUE;
	}

	// 检查用户id是否存在
	private function _check_user_id($user_id) {
		$ret = M('User')->where("id={$user_id}")->find();
		if ($ret) return TRUE;
		else return FALSE;
	}

	// ------------------------------------------- 公司 -----------------------------------------------
	/**
	 * 获取公司信息列表
	 */
	public function company_get_list() {
		$result = array();

		$city_id = $_REQUEST['city_id'];
		// 找出城市id对应的城市名称
		$city_name = M('Region')->where("region_id = {$city_id}")->getField('region_name');

		// 获取公司列表
		$companys = M('Companys')->where("address like '%{$city_name}%'")->order("is_recommend desc, is_approve desc, id desc")->page($this->_page)->select();
		if ( ! count($companys)) {
			$result['status'] = 1;
			$result['list'] = array();
			//$result['error_msg'] = '没有符合条件的公司.';
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

		$companys = M('Companys')->where("name like '%{$key}%'")->order("is_recommend desc, is_approve desc, id desc")->page($this->_page)->select();
		if ( ! count($companys)) {
			$result['status'] = 1;
			$result['list'] = array();
			//$result['error_msg'] = '没有符合条件的公司.';
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
		$user_id = $_REQUEST['user_id'];

		$company = M('Companys')->where("id = {$company_id}")->find();
		if ( ! $company) {
			$result['status'] = 0;
			$result['error_msg'] = '找不到该公司.';
			echo json_encode($result);
			exit;
		}

		$img_list = $this->_formate_img_list($company['type_id']);
		$module_list = $this->_formate_module_list($company['type_id']);
		$service_list = $this->_formate_service_list($company['type_id']);

		$ret = M('Companysfavo')->where("user_id={$user_id} and company_id={$company_id}")->find();	
		$is_favorite = 0;
		if ($ret) $is_favorite = 1;

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
		$companys = M('Companysfavo')->where("user_id={$user_id}")->order('id desc')->page($this->_page)->select();
		if ( ! $companys) {
			$result['status'] = 1;
			$result['list'] = array();
			//$result['error_msg'] = "没有收藏的公司.";
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
		$companys = M('Companys')->where("id in ({$companys_id_str})")->page($this->_page)->select();

		$tmp = array();
		foreach ($companys as $row) {
			$key = $this->_return_key_by_val($row['id'], $companys_id_arr);
			$tmp[$key] = $row;
		}
		ksort($tmp);
		$companys = $tmp;

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
			M('Companysfavo')->where("user_id = {$user_id} and company_id = {$company_id}")->delete();
			$result['status'] = 1;
			echo json_encode($result);
			exit;
		}

		$data = array(
				'user_id' => $user_id,
				'company_id' => $company_id
			     );
		$data['userid'] = 1;
		$data['lang'] = 1;

		$ret = M('Companysfavo')->add($data);
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
					'img_url' => $this->_domain.$row['img_url'],
					'name' => $row['name'],
					'address' => $row['address'],
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
			$img_list[] = array(
					'title' => $img['title'],
					'img_url' => $this->_domain.$img['img_url']
					);
		}

		return $img_list;
	}

	/**
	 * 获取地区列表
	 */
	public function get_location_list(){
		$result = array();
		$country = 1;
		$province_list = $this->_get_this_region(1, $country);
		foreach($province_list as &$province){
			$province['sub'] = $this->_get_this_region(2, $province['id']);
			foreach($province['sub'] as &$city){
				$city['sub'] = $this->_get_this_region(3, $city['id']);
			}
		}

		$result['success'] = true;
		$result['list'] = $province_list;
		echo json_encode($result);
	}

	private function _get_this_region($type = 0, $parent = 0){
		return M('Region')->field("region_id as id, region_name as name")->where("region_type = '$type' AND parent_id = '$parent'")->select();
	}

	// ------------------------------------------- 专线 -----------------------------------------------

	/**
	 * 物流专线列表
	 */
	public function leased_get_list() {
		$result = array();

		$start_county_id = isset($_REQUEST['start_county_id'])?trim($_REQUEST['start_county_id']):'';
		$end_county_id = isset($_REQUEST['end_county_id'])?trim($_REQUEST['end_county_id']):'';

		$leased_list = array();
		// 找出具备该专线的模块
		//$start_name = M('Region')->where("region_id={$start_county_id}")->getField('region_name');
		$start_city_id = M('Region')->where("region_id={$start_county_id}")->getField('parent_id');
		//$end_name = M('Region')->where("region_id={$end_county_id}")->getField('region_name');
		$end_city_id = M('Region')->where("region_id={$end_county_id}")->getField('parent_id');
		//$services = M('Services')->where("start_name like '%{$start_name}%' and end_name like '%{$end_name}%'")->page($this->_page)->select();
		$services = M('Services')->where("s_city = {$start_city_id} and e_city = {$end_city_id}")->page($this->_page)->select();
		if ( ! count($services)) {
			$result['status'] = 1;
			$result['list'] = array();
			//$result['error_msg'] = '没有符合条件的结果.';
			echo json_encode($result);
			exit;
		}

		$result['status'] = 1;
		$result['list'] = $this->_formate_leased_list($services);
		echo json_encode($result);
		exit;
	}


	/**
	 *专线列表-我的收藏
	 */
	public function leased_get_favorite_list() {
		$result = array();

		$user_id = $_REQUEST['user_id'];
		$services = M('Servicesfavo')->where("user_id={$user_id}")->order('id desc')->page($this->_page)->select();
		if ( ! count($services)) {
			$result['status'] = 1;
			$result['list'] = array();
			//$result['error_msg'] = '没有收藏的专线.';
			echo json_encode($result);
			exit;
		}

		// 找出收藏的专线id
		$services_id_arr = array();
		foreach ($services as $row) {
			$services_id_arr[] = $row['service_id'];
		}
		$services_id_str = implode(',', $services_id_arr);

		$services = M('Services')->where("id in ({$services_id_str})")->page($this->_page)->select();

		$tmp = array();
                foreach ($services as $row) {
                        $key = $this->_return_key_by_val($row['id'], $services_id_arr);
                        $tmp[$key] = $row;
                }
                ksort($tmp);
                $services = $tmp;

		$result['status'] = 1;
		$result['list'] = $this->_formate_service_list($services);
		echo json_encode($result);
	}

	/**
	 * 附近公司列表
	 */
	public function leased_get_around_list() {
		$result = array();

		$city_id = $_REQUEST['city_id'];
		// 找出出发点为该城市的服务器信息
		$services = M('Services')->where("s_city={$city_id}")->select();
		if ( ! $services) {
			$result['status'] = 1;
			$result['list'] = array();
			//$result['error_msg'] = '附近没有物流公司.';
			echo json_encode($result);
			exit;
		}

		$result['status'] = 1;
		$result['list'] = $this->_formate_leased_list($services);
		echo json_encode($result);
	}

	/**
	 * 格式化专线列表
	 */
	private function _formate_leased_list($services) {
		$longitude = isset($_REQUEST['longitude'])?trim($_REQUEST['longitude']):'';
		$latitude = isset($_REQUEST['latitude'])?trim($_REQUEST['latitude']):'';

		$leased_list = array();
		foreach ($services as $row) {
			// 找出模块对应的公司信息
			$company = M('Companys')->where("type_id={$row['company_id']}")->find();
			$modules = M('Modules')->where("company_id={$row['company_id']}")->select();
			foreach ($modules as $module) {
				$distance = $this->_get_distance($latitude, $longitude, $module['latitude'], $module['longitude']);
				$leased_list[$module['id']] = array(
						'company_id' => $company['id'],
						'start_name' => $row['start_name'],
						'end_name' => $row['end_name'],
						'img_url' => $this->_domain.$company['img_url'],
						'name' => $module['name']?$module['name']:'',
						'exp' => $company['exp']?$company['exp']:'',
						'address' => $module['address']?$module['address']:'',
						'is_recommend' => $company['is_recommend'],
						'is_approve' => $company['is_approve'],
						'distance' => $distance
						);	
			}
		}
		return array_values($leased_list);
	}

	/**
	 *  @desc 根据两点间的经纬度计算距离
	 *  @param float $lat 纬度值
	 *  @param float $lng 经度值
	 */
	private function _get_distance($lat1, $lng1, $lat2, $lng2) {
		$earthRadius = 6378137; //approximate radius of earth in meters

		$lat1 = ($lat1 * pi() ) / 180;
		$lng1 = ($lng1 * pi() ) / 180;

		$lat2 = ($lat2 * pi() ) / 180;
		$lng2 = ($lng2 * pi() ) / 180;

		$calcLongitude = $lng2 - $lng1;
		$calcLatitude = $lat2 - $lat1;
		$stepOne = pow(sin($calcLatitude / 2), 2) + cos($lat1) * cos($lat2) * pow(sin($calcLongitude / 2), 2);  $stepTwo = 2 * asin(min(1, sqrt($stepOne)));
		$calculatedDistance = $earthRadius * $stepTwo;

		if ($calculatedDistance > 1000) {
			$calculatedDistance = round($calculatedDistance / 1000).'km';
		}elseif ($calculatedDistance < 100) {
			$calculatedDistance = '< 100m';
		}else{
			$calculatedDistance = round($calculatedDistance).'m';
		}
		return $calculatedDistance;
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
		$carsrcs = M('Carsrc')->where("start_name like '%{$start_name}%' and end_name like '%{$end_name}%'")->order('id desc')->page($this->_page)->select();
		if ( ! count($carsrcs)) {
			$result['status'] = 1;
			$result['list'] = array();
			//$result['error_msg'] = '没有符合条件的车源.';
			echo json_encode($result);
			exit;
		}

		$result['status'] = 1;
		$result['list'] = $this->_formate_carsrc_list($carsrcs);
		$result['page'] = $this->_page;
		$result['page_size'] = $this->_page_size;
		echo json_encode($result);
	}

	/**
	 * 车源列表-我的收藏
	 */
	public function car_get_favorite_list() {
		$result = array();

		$user_id = $_REQUEST['user_id'];
		$carsrcs = M('Carsrcfavo')->where("user_id={$user_id}")->order('id desc')->page($this->_page)->select();
		if ( ! count($carsrcs)) {
			$result['status'] = 1;
			$result['list'] = array();
			//$result['error_msg'] = '没有符合条件的车源.';
			echo json_encode($result);
			exit;
		}

		$car_id_arr = array();
		foreach ($carsrcs as $row) {
			$car_id_arr[] = $row['carsrc_id'];
		}
		$car_id_str = implode(',', $car_id_arr);
		$carsrcs = M('Carsrc')->where("id in ({$car_id_str})")->page($this->_page)->select();
		$tmp = array();
		foreach ($carsrcs as $row) {
			$key = $this->_return_key_by_val($row['id'], $car_id_arr);
			$tmp[$key] = $row;
		}
		ksort($tmp);
		$carsrcs = $tmp;

		$result['status'] = 1;
		$result['list'] = $this->_formate_carsrc_list($carsrcs);
		$result['page'] = $this->_page;
		$result['page_size'] = $this->_page_size;
		echo json_encode($result);
	}

	/**
	 * 车源列表-我的发布
	 */
	public function car_get_my_list() {
		$user_id = $_REQUEST['user_id'];

		$carsrcs = M('Carsrc')->where("user_id={$user_id}")->order('id desc')->page($this->_page)->select();
		if ( ! count($carsrcs)) {
			$result['status'] = 1;
			$result['list'] = array();
			//$result['error_msg'] = '没有符合条件的车源.';
			echo json_encode($result);
			exit;
		}

		$result['status'] = 1;
		$result['list'] = $this->_formate_carsrc_list($carsrcs);
		$result['page'] = $this->_page;
		$result['page_size'] = $this->_page_size;

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
		$car_driver_type = $car_info['car_driver_type'];
		$car_type = $car_info['car_type'];
		$car_status = $car_info['car_status'];

		$is_favorite = 0;
		$ret = M('Carsrcfavo')->where("user_id={$user_id} and carsrc_id={$car_id}")->find();
		if ($ret) $is_favorite = 1;

		$data = array(
				'car_id' => $car_info['id'],
				'user_id' => $car_info['user_id'],
				'is_favorite' => $is_favorite,
				'start_name' => $car_info['start_name'],
				'end_name' => $car_info['end_name'],
				'start_county_id' => $car_info['s_town'],
				'end_county_id' => $car_info['e_town'],
				'date_s' => date('Y-m-d', $car_info['date_s']),
				'date_f' => date('Y-m-d', $car_info['date_f']),
				'exp' => $car_info['exp'],
				'car_driver_type' => $car_driver_type,
				'car_long' => $car_info['car_long'],
				'car_load' => $car_info['car_load'],
				'car_type' => $car_type,
				'car_status' => $car_status,
				'car_master' => $car_info['car_master'],
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
		$user_id = $_REQUEST['user_id'];
		$car_id = $_REQUEST['car_id'];

		$ret = M('Carsrcfavo')->where("user_id={$user_id} and carsrc_id={$car_id}")->find();
		if ($ret) {
			M('Carsrcfavo')->where("user_id={$user_id} and carsrc_id={$car_id}")->delete();
			$result['status'] = 1;
			echo json_encode($result);
			exit;
		}

		$data = array(
				'user_id' => $user_id,
				'carsrc_id' => $car_id
			     );
		$data['userid'] = 1;
		$data['lang'] = 1;

		$ret = M('Carsrcfavo')->add($data);
		if ( ! $ret) {
			$result['status'] = 0;
			$result['error_msg'] = '收藏失败.';
		}else{
			$result['status'] = 1;
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
		$data = json_decode($data, TRUE);

		$data['user_id'] = $user_id;
		$data['date_s'] = time();
		$data['date_f'] = strtotime($data['date_f']);
		//$data['date_f'] = time()+86400*3;

		$data['s_town'] = $data['start_county_id'];
		unset($data['start_county_id']);
		$data['e_town'] = $data['end_county_id'];
		unset($data['end_county_id']);

		$data['userid'] = 1;
		$data['lang'] = 1;

		$ret = M('Carsrc')->add($data);
		if ( ! $ret) {
			$result['status'] = 0;
			$result['error_msg'] = '发布失败.';
		}else{
			$result['status'] = 1;
		}

		echo json_encode($result);
	}

	/**
	 * 车源举报
	 */
	public function car_inform() {
		$result = array();

		$user_id = $_REQUEST['user_id'];
		$car_id = $_REQUEST['car_id'];

		// 检查车源是否存在
		if ( ! $this->_check_user_id($user_id) || ! $this->_check_car_id($car_id)) {
			$result['status'] = 0;
			$result['error_msg'] = '参数有误，请检查user_id和car_id.';
			echo json_encode($result);
			exit;
		}	
		// 检查是否已经举报过
		$ret = M('Carsrcinform')->where("user_id={$user_id} and carsrc_id={$car_id}")->find();
		if ($ret) {
			$result['status'] = 1;
			echo json_encode($result);
			exit;
		}

		// 添加举报
		$data = array(
				'user_id' => $user_id,
				'carsrc_id' => $car_id
			     );

		$data['userid'] = 1;
		$data['lang'] = 1;

		$ret = M('Carsrcinform')->add($data);
		if ( ! $ret) {
			$result['status'] = 0;
			$result['error_msg'] = '举报失败.';
		}else{
			$result['status'] = 1;
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
		$data = json_decode($data, TRUE);

		//$data['date_f'] = strtotime($data['date_f']);
		unset($data['date_s']);
		unset($data['date_f']);

		$data['s_town'] = $data['start_county_id'];
		unset($data['start_county_id']);
		$data['e_town'] = $data['end_county_id'];
		unset($data['end_county_id']);

		$ret = M('Carsrc')->where("user_id={$user_id} and id={$car_id}")->save($data);
		if ( ! $ret) {
			$result['status'] = 0;
			$result['error_msg'] = '车源修改失败.';
		}else{
			$result['status'] = 1;
		}
		echo json_encode($result);
	}

	/**
	 * 车源删除
	 */
	public function car_delete() {
		$result = array();

		$user_id = $_REQUEST['user_id'];
		$car_id = $_REQUEST['car_id'];

		$ret = M('Carsrc')->where("user_id={$user_id} and id={$car_id}")->delete();	
		if ( ! $ret) {
			$result['status'] = 0;
			$result['error_msg'] = '车源删除失败.';
		}else{
			M('Carsrcfavo')->where("car_id={$car_id}")->delete();
			M('Carsrcinform')->where("car_id={$car_id}")->delete();
			$result['status'] = 1;
		}
		echo json_encode($result);
	}

	/**
	 * 格式化车源数组信息
	 */
	private function _formate_carsrc_list($carsrcs) {
		$car_list = array();
		foreach ($carsrcs as $row) {
			$car_driver_type = $row['car_driver_type'];
			$car_type = $row['car_type'];
			$car_list[] = array(
					'car_id' => $row['id'],
					'start_name' => $row['start_name'],
					'end_name' => $row['end_name'],
					'exp' => $row['exp'],
					'title' => "{$row['car_number']}-{$car_driver_type}-{$row['car_load']}吨-{$row['car_long']}米-{$car_type}",
					'date_s' => date('Y-m-d', $row['date_s'])
					);
		}
		return $car_list;
	}

	/**
	 * 检查车源是否存在
	 */
	private function _check_car_id($car_id) {
		$ret = M('Carsrc')->where("id = {$car_id}")->find();
		if ($ret) return TRUE;
		else return FALSE;
	}

	// ------------------------------------------- 货源 -----------------------------------------------
	/**
	 * 货源列表
	 */
	public function goods_get_list() {
		$result = array();

		$city_id = $_REQUEST['city_id'];
		// 找出城市id对应的城市名称
		$city_name = M('Region')->where("region_id = {$city_id}")->getField('region_name');
		$goods = M('Goodsrc')->where("start_name like '%{$city_name}%'")->order("id desc")->page($this->_page)->select();
		if ( ! $goods) {
			$result['status'] = 1;
			$result['list'] = array();
			//$result['error_msg'] = '没有符合条件的货源.';
			echo json_encode($result);
			exit;
		}

		$result['status'] = 1;
		$result['list'] = $this->_formate_goodsrc_list($goods);
		$result['page'] = $this->_page;
		$result['page_size'] = $this->_page_size;

		echo json_encode($result);
	}

	/**
	 * 货源列表-我的收藏
	 */
	public function goods_get_favorite_list() {
		$result = array();

		$user_id = $_REQUEST['user_id'];
		$goods = M('Goodsrcfavo')->where("user_id={$user_id}")->order("id desc")->select();
		if ( ! $goods) {
			$result['status'] = 1;
			$result['list'] = array();
			//$result['error_msg'] = '没有收藏的货源.';
			echo json_encode($result);
			exit;
		}

		// 找出收藏的货源id
		$goods_id_arr = array();
		foreach ($goods as $row) {
			$goods_id_arr[] = $row['goods_id'];
		}
		$goods_id_str = implode(',', $goods_id_arr);
		$goods = M('Goodsrc')->where("id in ({$goods_id_str})")->page($this->_page)->select();
		if ( ! $goods) {
			$result['status'] = 1;
			$result['list'] = array();
			//$result['error_msg'] = '没有符合条件的货源.';
			echo json_encode($result);
			exit;
		}

		$tmp = array();
		foreach ($goods as $row) {
			$key = $this->_return_key_by_val($row['id'], $goods_id_arr);
			$tmp[$key] = $row;
		}
		ksort($tmp);
		$goods = $tmp;

		$result['status'] = 1;
		$result['list'] = $this->_formate_goodsrc_list($goods);
		$result['page'] = $this->_page;
		$result['page_size'] = $this->_page_size;

		echo json_encode($result);
	}

	public function goods_change_favorite() {
		$result = array();

		$user_id = $_REQUEST['user_id'];
		$goods_id = $_REQUEST['goods_id'];

		$data = array(
				'user_id' => $user_id,
				'goods_id' => $goods_id
			     );
		$data['userid'] = 1;
		$data['lang'] = 1;

		// 检查是否已经收藏
		$ret = M('Goodsrcfavo')->where("user_id={$user_id} and goods_id={$goods_id}")->find();
		if ($ret) {
			M('Goodsrcfavo')->where("user_id={$user_id} and goods_id={$goods_id}")->delete();
			$result['status'] = 1;
			echo json_encode($result);
			exit;
		}

		$ret = M('Goodsrcfavo')->add($data);
		if ( ! $ret) {
			$result['status'] = 0;
			$result['error_msg'] = '收藏失败';
			echo json_encode($result);
			exit;
		}
		$result['status'] = 1;
		echo json_encode($result);
	}

	/**
	 * 货源列表-我的发布
	 */
	public function goods_get_my_list() {
		$result = array();

		$user_id = $_REQUEST['user_id'];
		$goods = M('Goodsrc')->where("user_id={$user_id}")->order('id desc')->page($this->_page)->select();
		if ( ! $goods) {
			$result['status'] = 1;
			$result['list'] = array();
			//$result['error_msg'] = '没有符合条件的货源.';
			echo json_encode($result);
			exit;
		}

		$result['status'] = 1;
		$result['list'] = $this->_formate_goodsrc_list($goods);
		$result['page'] = $this->_page;
		$result['page_size'] = $this->_page_size;

		echo json_encode($result);
	}

	/**
	 * 货源详细
	 */
	public function goods_get_detail() {
		$result = array();
		$user_id = $_REQUEST['user_id'];
		$goods_id = $_REQUEST['goods_id'];

		$goodsrc = M('Goodsrc')->where("id={$goods_id}")->find();
		if ( ! $goodsrc) {
			$result['status'] = 0;
			$result['error_msg'] = '没有指定的货源信息.';
			echo json_encode($result);
			exit;
		}

		$ret = M('Goodsrcfavo')->where("user_id={$user_id} and goods_id={$goods_id}")->find();
		$is_favorite = 0;
		if ($ret) $is_favorite = 1;

		$data = array(
				'goods_id' => $goodsrc['id'],
				'user_id' => $goodsrc['user_id'],
				'start_name' => $goodsrc['start_name'],
				'end_name' => $goodsrc['end_name'],
				'start_county_id' => $goodsrc['s_town'],
				'end_county_id' => $goodsrc['e_town'],
				'date_s' => date('Y-m-d', $goodsrc['date_s']),
				'date_f' => date('Y-m-d', $goodsrc['date_f']),
				'about' => $goodsrc['about'],
				'contact' => $goodsrc['contact'],
				'is_favorite' => $is_favorite,
				'phone' => $goodsrc['phone']
			     );

		$result['status'] = 1;
		$result['data'] = $data;
		echo json_encode($result);
	}

	/**
	 * 货源发布
	 */
	public function goods_create() {
		$result = array();

		$user_id = $_REQUEST['user_id'];
		$data = trim($_REQUEST['data']);
		$data = json_decode($data, TRUE);	

		$data['user_id'] = $user_id;
		$data['date_s'] = time();
		$data['date_f'] = time()+3*86400;

		$data['s_town'] = $data['start_county_id'];
		unset($data['start_county_id']);
		$data['e_town'] = $data['end_county_id'];
		unset($data['end_county_id']);

		$data['user_id'] = $user_id;
		$data['userid'] = 1;
		$data['lang'] = 1;

		$ret = M('Goodsrc')->add($data);
		if ( ! $ret) {
			$result['status'] = 0;
			$result['error_msg'] = '添加货源失败.';
			echo json_encode($result);
			exit;
		}

		$result['status'] = 1;
		echo json_encode($result);
	}

	/**
         * 货源删除
         */
        public function goods_delete() {
                $result = array();

                $user_id = $_REQUEST['user_id'];
                $goods_id = $_REQUEST['goods_id'];

                $ret = M('Goodsrc')->where("user_id={$user_id} and id={$goods_id}")->delete();
                if ( ! $ret) {
                        $result['status'] = 0;
                        $result['error_msg'] = '货源删除失败.';
                }else{
			M('Goodsrcfavo')->where("goods_id={$goods_id}")->delete();
			M('Goodsinform')->where("goods_id={$goods_id}")->delete();
                        $result['status'] = 1;
                }
                echo json_encode($result);
        }

	/**
	 * 货源编辑
	 */
	public function goods_edit() {
		$result = array();

		$user_id = $_REQUEST['user_id'];
		$goods_id = $_REQUEST['goods_id'];
		$data = trim($_REQUEST['data']);
		$data = json_decode($data, TRUE);

		//$data['date_f'] = strtotime($data['date_f']);
		unset($data['date_s']);
		unset($data['date_f']);

		$data['s_town'] = $data['start_county_id'];
		unset($data['start_county_id']);
		$data['e_town'] = $data['end_county_id'];
		unset($data['end_county_id']);

		$ret = M('Goodsrc')->where("user_id={$user_id} and id={$goods_id}")->save($data);
		if ( ! $ret) {
			$result['status'] = 0;
			$result['error_msg'] = '货源修改失败.';
		}else{
			$result['status'] = 1;
		}
		echo json_encode($result);
	}

	public function goods_inform() {
		$result = array();

		$user_id = $_REQUEST['user_id'];
		$goods_id = $_REQUEST['goods_id'];

		// 检查是否已经举报过
		$ret = M('Goodsinform')->where("user_id={$user_id} and goods_id={$goods_id}")->find();
		if ($ret) {
			$result['status'] = 1;
			echo json_encode($result);
			exit;
		}

		$data = array(
				'user_id' => $user_id,
				'goods_id' => $goods_id	
			     );
		$data['userid'] = 1;
		$data['lang'] = 1;

		$ret = M('Goodsinform')->add($data);

		if ( ! $ret) {
			$result['status'] = 0;
			$result['error_msg'] = '举报失败.';
		}else{
			$result['status'] = 1;
		}

		echo json_encode($result);
	}

	/**
	 * 格式化货源列表
	 */
	private function _formate_goodsrc_list($goods) {
		$goods_list = array();
		foreach ($goods as $row) {
			$goods_list[] = array(
					'goods_id' => $row['id'],
					'start_name' => $row['start_name'],
					'end_name' => $row['end_name'],
					'about' => $row['about'],
					'date_s' => date('Y-m-d', $row['date_s'])
					);
		}	

		return $goods_list;
	}

	public function app_update(){
                $result = array();
                $versions = M('Versions');
                $os = $_REQUEST['os'];
                $latest_version = $versions->where("status = 1 and os='{$os}'")->order('version desc')->find();

                if ($latest_version) {
                        //$result['os'] = $latest_version['os'];
                        $result['version'] = $latest_version['version'];
                        $result['url'] = $this->_domain.$latest_version['app'];
                }

		$result['status'] = 1;

                echo json_encode($result);
        }

	public function download(){
		$os = 'android';
		$versions = M('Versions');
                $latest_version = $versions->where("status = 1 and os='{$os}'")->order('version desc')->find();
		$url = $this->_domain.$latest_version['app'];
		header("location:$url");
	}

	//-------------------------------------
	/**
	 * 普通接口发短信
	 * apikey 为云片分配的apikey
	 * text 为短信内容
	 * mobile 为接受短信的手机号
	 */
	private function _send_sms($text, $mobile){
		$apikey = '53bf304e83cdf458f5e3b35482c1e662';
		$url="http://yunpian.com/v1/sms/send.json";
		$encoded_text = urlencode("$text");
		$post_string="apikey=$apikey&text=$encoded_text&mobile=$mobile";
		return $this->_sock_post($url, $post_string);
	}

	/**
	 * url 为服务的url地址
	 * query 为请求串
	 */
	private function _sock_post($url,$query){
		$data = "";
		$info=parse_url($url);
		$fp=fsockopen($info["host"],80,$errno,$errstr,30);
		if(!$fp){
			return $data;
		}
		$head="POST ".$info['path']." HTTP/1.0\r\n";
		$head.="Host: ".$info['host']."\r\n";
		$head.="Referer: http://".$info['host'].$info['path']."\r\n";
		$head.="Content-type: application/x-www-form-urlencoded\r\n";
		$head.="Content-Length: ".strlen(trim($query))."\r\n";
		$head.="\r\n";
		$head.=trim($query);
		$write=fputs($fp,$head);
		$header = "";
		while ($str = trim(fgets($fp,4096))) {
			$header.=$str;
		}
		while (!feof($fp)) {
			$data .= fgets($fp,4096);
		}
		return $data;
	}

	/**
	 * 模板接口发短信
	 * apikey 为云片分配的apikey
	 * tpl_id 为模板id
	 * tpl_value 为模板值
	 * mobile 为接受短信的手机号
	 */
	private function _tpl_send_sms($tpl_id, $tpl_value, $mobile){
		$apikey = '53bf304e83cdf458f5e3b35482c1e662';
		$url="http://yunpian.com/v1/sms/tpl_send.json";
		$encoded_tpl_value = urlencode("$tpl_value");
		$post_string="apikey=$apikey&tpl_id=$tpl_id&tpl_value=$encoded_tpl_value&mobile=$mobile";
		return $this->_sock_post($url, $post_string);
	}

	private function _return_key_by_val($val, $array) {
		foreach ($array as $key=>$row) {
			if ($row == $val) return $key;
		}	
	}
}
