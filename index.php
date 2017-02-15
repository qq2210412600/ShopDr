<?php
// [ 应用入口文件 ]

// 定义应用目录
define('APP_PATH', __DIR__ . '/application/');

// 定义运行时目录
define('RUNTIME_PATH','./cache/');

// 定义模板文件默认目录
define("VIEW_BASE","./tpl/");

// 加载框架引导文件
require __DIR__ . '/core/start.php';
