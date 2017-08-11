<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>爱书客</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Access-Control-Allow-Origin" content="*">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="爱书客，博客分享，博客管理，博客统计">
<meta http-equiv="description" content="爱书客，博客分享，博客管理，博客统计等。不一样的博客，不一样的博客管理平台。爱书客，做自己的博客管理平台。">
<!--[if lt IE 9]>
	<script type="text/javascript" src="js/html5shiv.min.js"></script>
	<script type="text/javascript" src="js/respond.min.js"></script>
<![endif]-->

<%-- 公共body样式 --%>
<link rel="stylesheet" rev="stylesheet" href="css/common/body.css" type="text/css" />
<%-- 公共右侧固定栏 --%>
<link rel="stylesheet" rev="stylesheet" href="css/ibooker.right.fixed.css" type="text/css" />
<style type="text/css">
/* 顶部 */
#top,#top_one,#top_two,#bottom {
	float: left;
	width: 100%;
	background-color: white;
}

#top,#bottom {
	min-height: 100px;
}
/* 中间区 */
#content {
	float: left;
	width: 74%;
	margin: 40px 13%;
	background-color: #40aff2;
	min-height: 2800px;
}
</style>
</head>

<body>
	<%-- 顶部 --%>
	<div id="top">
		<div id="top_one">
		
		</div>
		<div id="top_two">
		
		</div>
	</div>
	
	<%-- 内容区 --%>
	<div id="content">
		<div id="content_left">
		
		</div>
		<div id="content_right">
		
		</div>
	</div>
	
	<%-- 底部 --%>
	<div id="bottom">
	
	</div>
	
	<%-- 右侧固定栏 --%>
	<div id="right_fixed">
		<a class="right_fixed_feedback"></a>
		<a class="right_fixed_cproblems"></a>
		<a class="right_fixed_appdownload"><img id="img_appdownload" src="images/web/app_download_qrcode.png"></a>
		<a class="right_fixed_weixin"><img id="img_weixin" src="images/web/img_weixin_public.jpg"></a>
		<a id="btn_backup" class="right_fixed_backup" href="javascript:;"></a>
	</div>
</body>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<%-- 返回顶部 --%>
<script type="text/javascript" src="js/ibooker-backup-1.0.js"></script>
</html>
