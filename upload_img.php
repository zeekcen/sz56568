<?php
$dir = '/var/www/nginx-default/pictures/';
define('UPLOADS_PATH', '/var/www/nginx-default/Uploads/201425');
getSubDirs($dir);

	function getSubDirs($dir) {
		if(!$dh = opendir($dir))
			return ;

		while ($f = readdir($dh)) {
			if($f =='.' || $f =='..') continue;
			$path = $dir.$f;
			uploadImg($path, $f);
		}
	}

// 上传图片
function uploadImg($path = '.', $company_id) {
	// 找出该公司对应的相册数据
	$ret = M('Pictures')->where("company_id = {$company_id}")->select();
	if ( ! $ret) return;
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
					$data = array('img_url' => $img_img);
					M('Companys')->where("id = $company_id")->save($data);
					$i++;
				}
				// 将目标图片的路径插入数据库
				$type_id = M('Companys')->where("id = $company_id")->getField('type_id');
				$data = array(
						'company_id' => $type_id,
						'img_url' => $img_img,
						'userid' => 1,
						'lang' => 1,
						'status' =>1
					     );
				M('Pictures')->add($data);
			}
		}
	}
}
