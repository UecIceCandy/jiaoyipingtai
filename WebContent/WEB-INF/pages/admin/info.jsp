<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<title>个人信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<link rel="stylesheet" href="<%=basePath%>css/info_main.css" />
<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=basePath%>font-awesome/4.5.0/css/font-awesome.min.css" />

<!-- page specific plugin styles -->

<!-- text fonts -->
<link rel="stylesheet" href="<%=basePath%>css/fonts.googleapis.com.css" />

<!-- ace styles -->
<link rel="stylesheet" href="<%=basePath%>css/ace.min.css"
	class="ace-main-stylesheet" id="main-ace-style" />

<!--[if lte IE 9]>
			<link rel="stylesheet" href="<%=basePath%>css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
<link rel="stylesheet" href="<%=basePath%>css/ace-skins.min.css" />
<link rel="stylesheet" href="<%=basePath%>css/ace-rtl.min.css" />

<!--[if lte IE 9]>
		  <link rel="stylesheet" href="<%=basePath%>css/ace-ie.min.css" />
		<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->
<script src="<%=basePath%>js/ace-extra.min.js"></script>

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
		<script src="<%=basePath%>js/html5shiv.min.js"></script>
		<script src="<%=basePath%>js/respond.min.js"></script>
		<![endif]-->


<body>

	<div class="main-content">
		<div class="main-content-inner">
			<!--=============================================================================================================================================================================-->
			<!--main-container-part-->
			<div id="content" class="page-content">
				<div class="page-header">
					<h1>
						系统设置 <small> <i class="ace-icon fa fa-angle-double-right"></i>
							个人信息
						</small>
					</h1>
				</div>
				<!-- Tabs Container-->
				<section id="tabsContainer" class="clearfix">

					<!--Inner-->
					<div id="innerBg" >

						<!--About Tab-->
						<article id="about" class="clearfix">
							<!-- Introduction -->
							<section id="introduction" class="clearfix">
								<h1>个人信息</h1>
								<ul class="info">
									<li><span>姓名</span> : ${admin.userName }</li>
									<li><span>账号</span> : ${admin.phone }</li>
									<li><span>角色</span> : ${admin.userRole }</li>
								</ul>
							</section>
							<!-- End introduction -->
						</article>

					</div>
					<!--End Inner-->
				</section>

			</div>
			<!--==================================================================================================================-->
			
			<!--End Page Wrapper-->
</body>