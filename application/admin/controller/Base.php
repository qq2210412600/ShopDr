<?php
/**   
*（后台基础控制器）  
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

class Base extends Controller
{
    public function _initialize()
    {
    	if (isset($_SESSION['admin_user_id'])) {
            $this->user_db = M("User");
            $id = $_SESSION['admin_user_id'];
            $user = $this->user_db->where("id = ".$id)->find();
            if (!$this->check_access($id)) {
                $this->error("您没有访问权限！");
                exit();
            }
            $this->assign("admin",$user);
    	} else {
   			return $this->fetch('publics/login');
    	}
    }
	
    private function check_access($uid){
    	
    	//如果用户角色是1，则无需判断
    	if($uid == 1){
    		return true;
    	}
    	if(MODULE_NAME.CONTROLLER_NAME.ACTION_NAME!="AdminIndexindex"){
    		return sys_auth_check($uid);
    	}else{
    		return true;
    	}
    }	
}
