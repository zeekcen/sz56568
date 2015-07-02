<?php
/**
 * 
 * AreaAction.class.php (ajax 获取地址)
 *
 * @package      	YOURPHP
 * @author          liuxun QQ:147613338 <admin@yourphp.cn>
 * @copyright     	Copyright (c) 2008-2011  (http://www.yourphp.cn)
 * @license         http://www.yourphp.cn/license.txt
 * @version        	YourPHP企业网站管理系统 v2.1 2011-03-01 yourphp.cn $
 */
if(!defined("Yourphp")) exit("Access Denied");
class OtherAction extends BaseAction
{
	public function upload_img() {
		$dir = '/var/www/nginx-default/pictures/';
		if(!$dh = opendir($dir))
			return ;

		while ($f = readdir($dh)) {
			if($f =='.' || $f =='..') continue;
			$path = $dir.$f;
			$this->_move_img($path, $f);
		}
	}

	private function _move_img($path = '.', $company_id) {
		define('UPLOADS_PATH', '/var/www/nginx-default/Uploads/201501');
		// 找出该公司对应的相册数据
		$ret = M('Pictures')->where("company_id = {$company_id}")->select();
		//if ( ! $ret) return;
		$imgs_arr = array();
		foreach ($ret as $row) {
			$img_url = trim($row['img_url']);
			if ( ! $img_url) continue;
			$parts = explode('/', $img_url);
			$len = count($parts);
			$idx = $len - 1;
			$imgs_arr = $parts[$idx];
		}
		$current_dir = opendir($path); //opendir()返回一个目录句柄,失败返回false
		$i = 1;
		while(($file = readdir($current_dir)) !== false) { //readdir()返回打开目录句柄中的一个条目
			$sub_dir = $path . DIRECTORY_SEPARATOR . $file; //构建子目录路径
			if( ! is_dir($sub_dir)) {
				$info = pathinfo($file);
				$ext =  $info['extension'];
				$resc_img = $path . DIRECTORY_SEPARATOR . $file;
				$new_name = md5($resc_img).'.'.$ext;
				if (in_array($new_name, $imgs_arr)) continue;
				$dest_img = UPLOADS_PATH . DIRECTORY_SEPARATOR . $new_name;
				//echo "copy $resc_img $dest_img\n";
				if (file_exists($dest_img)) unlink($dest_img);
				$ret = copy($resc_img, $dest_img);
				if ($ret) {
					$pos = strpos($dest_img, 'Uploads') - 1;
					$img_url = substr($dest_img, $pos);
					if ($i == 1) {	// 将相册的第一张图作为公司封面
						$data = array('img_url' => $img_url);
						M('Companys')->where("id = $company_id")->save($data);
						$i++;
					}
					// 将目标图片的路径插入数据库
					$type_id = M('Companys')->where("id = $company_id")->getField('type_id');
					$data = array(
							'company_id' => $type_id,
							'img_url' => $img_url,
							'userid' => 1,
							'lang' => 1,
							'status' =>1
						     );
					M('Pictures')->add($data);
					print_r($data);
				}
			}
		}
	}


	public function upload() {
		$adminaccess = '111111';
		if ( ! $adminaccess || $_POST['adminaccess'] != $adminaccess) {
			die('auth failed.');
		}
		/**
		  1、公司信息列表文件
		  2、公司模块列表文件
		  3、公司服务列表文件
		 */
		$i = 1;
		$j = 0;
		foreach ($_FILES['upfile']['tmp_name'] as $row) {
			//$j++;
			//if (1 == $j) continue;
			$str = file_get_contents($row);
			$lines = explode("\n", $str);
			switch($i) {
				case 1:
					$this->_add_companys($lines);
					break;
				case 2:
					$this->_add_modules($lines);
					break;
				case 3:
					$this->_add_services($lines);
					break;
			}
			$i++;
		}

		echo '<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />';
		echo '导入成功.<br>';
		echo '<a href="javascript:history.go(-1)">重新导入</a>';

	}

	// 添加公司信息
	private function _add_companys($lines) {
		foreach ($lines as $row) {
			$row = trim($row);
			if ( ! $row) continue;
			$parts = explode(",", $row);
			$id = $parts[0];

			$name = trim(iconv('GBK', 'UTF-8', $parts[1]));
			$ret = M('Companys')->where("name = '{$name}'")->find();
			if ($ret) continue;

			$address = trim(iconv('GBK', 'UTF-8', $parts[2]));
			$exp = trim(iconv('GBK', 'UTF-8', $parts[3]));
			$about = trim(iconv('GBK', 'UTF-8', $parts[4]));
			$data = array(
					'id' => $id,
					'name' => $name,
					'address' => $address,
					'exp' => $exp,
					'about' => $about,
					'status' => 1,
					'userid' => 1,
					'username' => 'admin',
					'lang' =>1
				     );
			$ret = M('Companys')->add($data);
			if ($ret) {
				$data = array(
						'name' => $name,
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
		}
	}

	// 添加公司模块
	private function _add_modules($lines) {
		foreach ($lines as $row) {
			$row = trim($row);
			if ( ! $row) continue;
			$parts = explode(",", $row);
			$company_id = $parts[0];
			$company_id = M('Companys')->where("id={$company_id}")->getField('type_id');

			$name = trim(iconv('GBK', 'UTF-8', $parts[1]));
			$ret = M('Modules')->where("name = '{$name}'")->find();
			if ($ret) continue;

			$address = trim(iconv('GBK', 'UTF-8', $parts[2]));
			$longitude = trim(iconv('GBK', 'UTF-8', $parts[3]));
			$latitude = trim(iconv('GBK', 'UTF-8', $parts[4]));
			$contact = trim(iconv('GBK', 'UTF-8', $parts[5]));
			$phone = trim(iconv('GBK', 'UTF-8', $parts[6]));
			$data = array(
					'company_id' => $company_id,
					'name' => $name,
					'address' => $address,
					'longitude' => $longitude,
					'latitude' => $latitude,
					'contact' => $contact,
					'phone' => $phone,
					'userid' => 1,
					'username' => 'admin',
					'status' => 1,
					'lang' => 1
				     );
			M("Modules")->add($data);
		}
	}

	// 添加公司服务
	private function _add_services($lines) {
		foreach ($lines as $row) {
			$row = trim($row);
			if ( ! $row) continue;
			$parts = explode(",", $row);
			$company_id = $parts[0];
			$company_id = M('Companys')->where("id={$company_id}")->getField('type_id');
			$start_name = trim(iconv('GBK', 'UTF-8', $parts[1]));
			$end_name = trim(iconv('GBK', 'UTF-8', $parts[2]));
			$start_county_id = M("Region")->where("region_name like '%{$start_name}%' and region_type = 2")->getField('region_id');
			if ($start_county_id) $start_city_name = M('Region')->where("region_id={$start_county_id}")->getField('region_name');

			$end_county_id = M("Region")->where("region_name like '%{$end_name}%' and region_type = 2")->getField('region_id');
			if ($end_county_id) $end_city_name = M('Region')->where("region_id={$end_county_id}")->getField('region_name');

			if ($start_county_id && $end_county_id && $company_id) $ret = M('Services')->where("s_city={$start_county_id} and e_city={$end_county_id} and company_id={$company_id}")->find();
			if ($ret) continue;

			$start_prov_id = M('Region')->where("region_id={$start_county_id}")->getField('parent_id');
			$start_prov_name = M('Region')->where("region_id={$start_prov_id}")->getField('region_name');

			$end_prov_id = M('Region')->where("region_id={$end_county_id}")->getField('parent_id');
			$end_prov_name = M('Region')->where("region_id={$end_prov_id}")->getField('region_name');

			$start_name = "$start_prov_name $start_city_name";
			$end_name = "$end_prov_name $end_city_name";

			$data = array(
					'company_id' => $company_id,
					'start_name' => $start_name,
					'end_name' => $end_name,
					's_province' => $start_prov_id,
					's_city' => $start_county_id,
					'e_province' => $end_prov_id,
					'e_city' => $end_county_id,
					'userid' => 1,
					'username' => 'admin',
					'status' => 1,
					'lang' => 1
				     );

			$ret = M('Services')->add($data);
		}
	}
}
