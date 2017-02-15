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

class Publics extends Controller
{
    public function login()
    {
     	if (isset($_SESSION['admin_user_id'])) {//已经登录
    		$this->success(L('LOGIN_SUCCESS'),U("Admin/Index"));
    	} else {
			return $this->fetch();
    	}
	}
}
