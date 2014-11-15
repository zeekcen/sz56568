<?php
/**
 * 
 * User/IndexAction.class.php (ǰ̨��Ա����ģ��)
 *
 * @package      	YOURPHP
 * @author          liuxun QQ:147613338 <admin@yourphp.cn>
 * @copyright     	Copyright (c) 2008-2011  (http://www.yourphp.cn)
 * @license         http://www.yourphp.cn/license.txt
 * @version        	YourPHP��ҵ��վ����ϵͳ v2.1 2012-10-08 yourphp.cn $
 */
defined('YOURPHP_PATH') or exit();
class IndexAction extends BaseAction
{

	function _initialize()
    {	
		parent::_initialize();
		if(!$this->_userid){
			$this->assign('jumpUrl',U('User/Login/index'));
			$this->error(L('nologin'));
			exit;
		}
		$this->dao = M('User');
		$user = $this->dao->find($this->_userid);
		$this->assign('vo',$user);
		unset($_POST['status']);
		unset($_POST['groupid']);
		unset($_POST['amount']);
		unset($_POST['point']);
		unset($_POST['email']);
		unset($_POST['username']);
		$_GET =get_safe_replace($_GET);
		$_POST =get_safe_replace($_POST);
    }

    public function index()
    {
        $this->display();
    }
	
	public function profile()
    {	 
		if($_POST['dosubmit']){
			$_POST['id']=$this->_userid;
			if(!$this->dao->create($_POST)) {
				$this->error($this->dao->getError());
			}
			$this->dao->update_time = time();
			$this->dao->last_ip = ip();
			$result	=	$this->dao->save();
			if(false !== $result) {
				$this->success(L('do_success'));
			}else{
				$this->error(L('do_error'));
			}
			exit;
		}
        $this->display();
    }

	public function avatar()
    {	
		
		if($_POST['dosubmit']){
		
			$_POST['id']=$this->_userid;
			if(!$this->dao->create($_POST)) {
				$this->error($this->dao->getError());
			}
			$this->dao->update_time = time();
			$this->dao->last_ip = ip();
			$result	=	$this->dao->save();
			if(false !== $result) {
				if($_POST['aid']){
					foreach($_POST['aid'] as $r){
					$aids[]=intval($r);
				}
				$Attachment =M('Attachment');		
				$aids =  implode(',',$aids);
				$data['userid']= $this->_userid;
				$data['catid']= 0;
				$data['status']= '1';
				$Attachment->where("aid in (".$aids.")")->save($data);
				}

				$this->success(L('do_success'));
			}else{
				$this->error(L('do_error'));
			}
			exit;
		}

		$yourphp_auth_key = sysmd5(C('ADMIN_ACCESS').$_SERVER['HTTP_USER_AGENT']);
		$yourphp_auth = authcode('0-1-0-1-jpeg,jpg,png,gif-0.2-0', 'ENCODE',$yourphp_auth_key);
		$this->assign('yourphp_auth',$yourphp_auth);
        $this->display();
    }

	public function password()
    {
		if($_POST['dosubmit']){

			if(md5($_POST['verify']) != $_SESSION['verify']) {
				$this->error(L('error_verify'));
			}
			if($_POST['password'] != $_POST['repassword']){
				$this->error(L('password_repassword'));
			}
			$map	=	array();
			$map['password']= array('eq',sysmd5($_POST['oldpassword']));
			$map['id']		=	$this->_userid;
			//����û�
			if(!$this->dao->where($map)->field('id')->find()) {
				$this->error(L('error_oldpassword'));
			}else {
				//$this->dao->email = $_POST['email'];
				$this->dao->id = $this->_userid;
				$this->dao->update_time = time();
				$this->dao->password	=	sysmd5($_POST['password']);
				$r = $this->dao->save();
				$this->assign('jumpUrl',U('User/Index/password'));
				if($r){
					$this->success(L('do_success'));
				}else{
					$this->error(L('do_error'));
				}
			 }
			 exit;
		}
		$this->display();
    }


		/**
		 * ͼƬ�ü�������֧��ָ������ü��ͷ�λ�ü����ֲü�ģʽ
		 * @param <string>  $src_file       ԭͼƬ·��
		 * @param <int>     $new_width      �ü���ͼƬ��ȣ�����ȳ���ԭͼƬ���ʱ��ȥԭͼƬ��ȣ�
		 * @param <int>     $new_height     �ü���ͼƬ�߶ȣ�����ȳ���ԭͼƬ���ʱ��ȥԭͼƬ�߶ȣ�
		 * @param <int>     $type           �ü���ʽ��1-��λģʽ�ü���0-����ģʽ�ü���
		 * @param <int>     $pos            ��λģʽ�ü�ʱ����ʼ��λ����ѡ����ģʽ�ü�ʱ���˲����������ã�
		 *                                      1Ϊ���˾���2Ϊ���˾��У�3Ϊ���˾��ң� 
		 *                                      4Ϊ�в�����5Ϊ�в����У�6Ϊ�в����ң� 
		 *                                      7Ϊ�׶˾���8Ϊ�׶˾��У�9Ϊ�׶˾��ң�
		 * @param <int>     $start_x        ��ʼλ��X ����ѡ����λģʽ�ü�ʱ���˲����������ã�
		 * @param <int>     $start_y        ��ʼλ��Y����ѡ����λģʽ�ü�ʱ���˲����������ã�
		 * @return <string>                 �ü�ͼƬ�洢·��
		 */
	public function thumb($src_file, $new_width, $new_height, $type = 1, $pos = 5, $start_x = 0, $start_y = 0) {
			$pathinfo = pathinfo($src_file);
			$dst_file = $pathinfo['dirname'] . '/' . $pathinfo['filename'] .'_'. $new_width . 'x' . $new_height . '.' . $pathinfo['extension'];
			if (!file_exists($dst_file)) {
				if ($new_width < 1 || $new_height < 1) {
					echo "params width or height error !";
					exit();
				}
				if (!file_exists($src_file)) {
					echo $src_file . " is not exists !";
					exit();
				}
				// ͼ������
				$img_type = exif_imagetype($src_file);
				$support_type = array(IMAGETYPE_JPEG, IMAGETYPE_PNG, IMAGETYPE_GIF);
				if (!in_array($img_type, $support_type, true)) {
					echo "ֻ֧��jpg��png��gif��ʽͼƬ�ü�";
					exit();
				}
				/* ����ͼ�� */
				switch ($img_type) {
					case IMAGETYPE_JPEG :
						$src_img = imagecreatefromjpeg($src_file);
						break;
					case IMAGETYPE_PNG :
						$src_img = imagecreatefrompng($src_file);
						break;
					case IMAGETYPE_GIF :
						$src_img = imagecreatefromgif($src_file);
						break;
					default:
					echo "����ͼ�����!";
					exit();
				}
				/* ��ȡԴͼƬ�Ŀ�Ⱥ͸߶� */
				$src_width = imagesx($src_img);
				$src_height = imagesy($src_img);
				/* �������ͼƬ�Ŀ�Ⱥ͸߶� */
				$mid_width = ($src_width < $new_width) ? $src_width : $new_width;
				$mid_height = ($src_height < $new_height) ? $src_height : $new_height;
				/* ��ʼ��ԴͼƬ���вü�����ʼλ������ */
				switch ($pos * $type) {
					case 1://1Ϊ���˾��� 
						$start_x = 0;
						$start_y = 0;
						break;
					case 2://2Ϊ���˾��� 
						$start_x = ($src_width - $mid_width) / 2;
						$start_y = 0;
						break;
					case 3://3Ϊ���˾��� 
						$start_x = $src_width - $mid_width;
						$start_y = 0;
						break;
					case 4://4Ϊ�в����� 
						$start_x = 0;
						$start_y = ($src_height - $mid_height) / 2;
						break;
					case 5://5Ϊ�в����� 
						$start_x = ($src_width - $mid_width) / 2;
						$start_y = ($src_height - $mid_height) / 2;
						break;
					case 6://6Ϊ�в����� 
						$start_x = $src_width - $mid_width;
						$start_y = ($src_height - $mid_height) / 2;
						break;
					case 7://7Ϊ�׶˾��� 
						$start_x = 0;
						$start_y = $src_height - $mid_height;
						break;
					case 8://8Ϊ�׶˾��� 
						$start_x = ($src_width - $mid_width) / 2;
						$start_y = $src_height - $mid_height;
						break;
					case 9://9Ϊ�׶˾��� 
						$start_x = $src_width - $mid_width;
						$start_y = $src_height - $mid_height;
						break;
					default://��� 
						break;
				}
				// Ϊ����ͼ�񴴽���������
				$mid_img = imagecreatetruecolor($mid_width, $mid_height);
				//�������е�ͼ�����ݵ����壬���ɼ���ͼ��
				imagecopy($mid_img, $src_img, 0, 0, $start_x, $start_y, $mid_width, $mid_height);
				// Ϊ�ü�ͼ�񴴽���������
				$new_img = imagecreatetruecolor($new_width, $new_height);
				//��������ͼ�񵽱������壬���������ü�
				imagecopyresampled($new_img, $mid_img, 0, 0, 0, 0, $new_width, $new_height, $mid_width, $mid_height);

				/* ����ʽ����ΪͼƬ */
				switch ($img_type) {
					case IMAGETYPE_JPEG :
						imagejpeg($new_img, $dst_file, 100);
						break;
					case IMAGETYPE_PNG :
						imagepng($new_img, $dst_file, 9);
						break;
					case IMAGETYPE_GIF :
						imagegif($new_img, $dst_file, 100);
						break;
					default:
						break;
				}
			}
			return ltrim($dst_file, '.');
		}

}
?>