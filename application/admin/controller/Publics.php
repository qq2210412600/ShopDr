<?php
/**   
*（后台公用控制器）  
*   
* 详细的功能描述
* 
* @property 类型 $prop 属性描述
* 
* @author ${AUTHOR}     
* @package application.components（参见路径别名）
* 
*/
namespace app\admin\controller;
use think\Controller;
use think\Session;

class Publics extends Controller
{
    public function _initialize()
    {
        $this->user_db = db('User');
    }    
    
    /**   
    * 登录
    *  
    * @param 类型 $fields 描述  
    *    
    * @return 类型 描述
    */
    public function login()
    {
     	if (isset($_SESSION['admin_user_id'])) {//已经登录
    		$this->success(lang('LOGIN_SUCCESS'),url("admin/index"));
    	} else {
			return view();
    	}
	}
    
    /**   
    * 登出
    *  
    * @param 类型 $fields 描述  
    *    
    * @return 类型 描述
    */
    public function logout()
    {
        session('ADMIN_ID',null);
        return view("public/login");
    }

    /**   
    * 登录操作
    *  
    * @param 类型 $fields 描述  
    *    
    * @return 类型 描述
    */
    public function doLogin()
    {
    	$name = input("post.username");
    	if (empty($name)) {
    		$this->error(lang('USERNAME_OR_EMAIL_EMPTY'));
    	}
    	$pass = input("post.password");
    	if (empty($pass)) {
    		$this->error(lang('LAN_PASSWORD_REQUIRED'));
    	}
    	$verrify = input("post.verify");
    	if (empty($verrify)) {
    		$this->error(lang('CAPTCHA_REQUIRED'));
    	}
    	//验证码
    	if (Session::get('code','wll_')!=$verrify) {
    		$this->error(lang('CAPTCHA_NOT_RIGHT'));
    	} else {
    		if (strpos($name,"@")>0) {//邮箱登陆
    			$where['user_email'] = $name;
    		} else {
    			$where['user_name'] = $name;
    		}
    		$result = $this->user_db->where($where)->find();
    		if (!empty($result)) {
    			if ($result['user_password'] == sys_password($pass)) {
    				
    				/* $role_user_model=M("RoleUser");
    				
    				$role_user_join = C('DB_PREFIX').'role as b on a.role_id =b.id';
    				
    				$groups=$role_user_model->alias("a")->join($role_user_join)->where(array("user_id"=>$result["id"],"status"=>1))->getField("role_id",true);
    				
    				if( $result["id"]!=1 && ( empty($groups) || empty($result['user_status']) ) ){
    					$this->error(lang('USE_DISABLED'));
    				} */
    				//登入成功页面跳转
    				$_SESSION["admin_user_id"] = $result["id"];
    				$result['last_login_ip'] = get_client_ip(0,true);
    				$result['last_login_time'] = date("Y-m-d H:i:s");
    				$this->user_db->save($result);
    				setcookie("admin_user_name",$name,time()+30*24*3600,"/");
    				$this->success(lang('LOGIN_SUCCESS'),url("admin/index"));
    			}else{
    				$this->error(lang('PASSWORD_NOT_RIGHT'));
    			}
    		} else {
    			$this->error(lang('USERNAME_NOT_EXIST'));
    		}
    	}
    } 

    /**   
    * 验证码生成
    *  
    * @param 类型 $fields 描述  
    *    
    * @return 类型 描述
    */
    public function getCaptcha()
    {    
        //使用memcheck 设置session    
        Session::init(['prefix'=> 'wll_','type'=> '','auto_start' => true]);
        $captcha = new \other\Captcha(80,40,4);
        echo $captcha->showImg();        
        Session::set('code',$captcha->getCaptcha());
        exit;
    }
    
}
