<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>更改密码</title>

<link rel="stylesheet" href="<%=basePath%>css/info_main.css" />
<!-- JavaScript includes - jQuery, the complexify plugin and our own script.js -->
<script src="<%=basePath%>js/jquery.min.js"></script>
<script src="<%=basePath%>js/jquery.md5.js"></script>

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


</head>

<body>
	<div class="main-content">
		<div class="main-content-inner">
			<!--=============================================================================================================================================================================-->
			<!--main-container-part-->
			<div id="content" class="page-content">
				<div class="page-header">
					<h1>
						系统设置 <small> <i class="ace-icon fa fa-angle-double-right"></i>
							修改密码
						</small>
					</h1>
				</div>

				<div id="main">
					<form class="" method="post"
						action="<%=basePath%>admin/changePassword">

						<input type="hidden" value='${admin.id }' id="id" name="id" />
						<div class="row pass">
							原密码 :<input type="password" id="password" name="password"
								placeholder="" />
						</div>
						<br>
						<div class="row pass">
							新密码 :<input type="password" id="password1" name="password1"
								placeholder="" />
						</div>
						<br>
						<c:if test="${msg!=null}">
							<span style="color: red;">${msg}</span>
							<br>
						</c:if>
						<input type="submit" class="btn btn-info" value="立即提交"
							style="width: 100px;" />
					</form>
				</div>
			</div>
			<!--==================================================================================================================-->
</body>
</html>