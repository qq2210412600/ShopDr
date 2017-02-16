<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

/**
 * 全局获取验证码图片
 * 生成的是个HTML的img标签
 * @param string $imgparam <br>
 * 生成图片样式，可以设置<br>
 * length=4&font_size=20&width=238&height=50&use_curve=1&use_noise=1<br>
 * length:字符长度<br>
 * font_size:字体大小<br>
 * width:生成图片宽度<br>
 * heigh:生成图片高度<br>
 * use_curve:是否画混淆曲线  1:画，0:不画<br>
 * use_noise:是否添加杂点 1:添加，0:不添加<br>
 * @param string $imgattrs<br>
 * img标签原生属性，除src,onclick之外都可以设置<br>
 * 默认值：style="cursor: pointer;" title="点击获取"<br>
 * @return string<br>
 * 原生html的img标签<br>
 * 注，此函数仅生成img标签，应该配合在表单加入name=verify的input标签<br>
 * 如：&lt;input type="text" name="verify"/&gt;<br>
 */
function sys_verifycode_img($imgparam='height=50',$imgattrs='style="cursor: pointer;" title="点击获取"'){
	$src = url('admin/publics/checkcode',$imgparam);
	$img = <<<hello
<img class="verify_img" src="$src" onclick="this.src='$src&time='+Math.random();" $imgattrs/>
hello;
	return $img;
}


/**
 * 验证码检查，验证完后销毁验证码增加安全性 ,<br>返回true验证码正确，false验证码错误
 * @return boolean <br>true：验证码正确，false：验证码错误
 */
function sys_check_verify_code(){
	$verify = new \Think\Verify();
	return $verify->check($_REQUEST['verify'], "");
}



/**
 * 密码加密方法
 * @param string $pw 要加密的字符串
 * @return string
 */
function sys_password($pw){
	$mi=md5(md5($pw));
	return $mi;
}

/**
 * 递归重组节点信息多维数组
 * @param  [array] $node [要处理的节点数组:二维数组]
 * @param  [int]   $pid  [父级ID]
 * @return [array]       [树状结构的节点体系:多维数组]
 */
function node_merge($node,$pid=0){
	$arr=array();
	foreach ($node as $v) {
	 if ($v['pid']==$pid) {
		 $v['child']=node_merge($node,$v['id']);
		 $arr[]=$v;
	 }
	}
	return $arr;
}

function node_tree($node,$pid=0){
	$arr=array();
	foreach ($node as $v) {
		if ($v['pid']==$pid) {
			$v['additionalParameters']['children']=node_tree($node,$v['id']);
			if(!empty($v['additionalParameters']['children'])){
				$v['type'] = 'folder';
				
			}else{
				$v['type'] = 'item';
			}
			
			$arr[]=$v;
		}
	}
	return $arr;
}

/**
 * 获取菜单深度
 * @param $id
 * @param $array
 * @param $i
 */
function sys_get_level($id, $array = array(), $i = 0) {

	if ($array[$id]['pid']==0 || empty($array[$array[$id]['pid']]) || $array[$id]['pid']==$id){
		return  $i;
	}else{
		$i++;
		return sys_get_level($array[$id]['pid'],$array,$i);
	}

}

function msubstr($str, $start=0, $length, $charset="utf-8", $suffix=true) {  
	if(function_exists("mb_substr")){ 
		if($suffix)  
		return mb_substr($str, $start, $length, $charset)."...";  
		else
		return mb_substr($str, $start, $length, $charset);  
	}  
	elseif(function_exists('iconv_substr')) {  
		if($suffix)  
		return iconv_substr($str,$start,$length,$charset)."...";  
		else
		return iconv_substr($str,$start,$length,$charset);  
	}  
	$re['utf-8']   = "/[x01-x7f]|[xc2-xdf][x80-xbf]|[xe0-xef]
	[x80-xbf]{2}|[xf0-xff][x80-xbf]{3}/";  
	$re['gb2312'] = "/[x01-x7f]|[xb0-xf7][xa0-xfe]/";  
	$re['gbk']    = "/[x01-x7f]|[x81-xfe][x40-xfe]/";  
	$re['big5']   = "/[x01-x7f]|[x81-xfe]([x40-x7e]|xa1-xfe])/";  
	preg_match_all($re[$charset], $str, $match);  
	$slice = join("",array_slice($match[0], $start, $length));  
	if($suffix) return $slice."…";  
	return $slice;
}

function get_child_str($pid){
	$result = M('Category')->where(array('status'=>1,'parentid'=>$pid))->field('tid')->select();
	if($result){
		foreach($result as $key=>$val){
			$str .= $val['tid'].',';
			$str .=get_child_str($val['tid']);
		}
	}
	return $str;
	
}
