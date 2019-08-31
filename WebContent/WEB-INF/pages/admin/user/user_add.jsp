<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<title>用户信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="<c:url value="/js/jquery.min.js"/>"></script>
<script type="text/javascript" charset="utf-8"
	src="<c:url value="/js/script_user.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/css/info_main.css"/>" />
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
								用户管理
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									用户添加
								</small>
							</h1>
						</div>
		<!-- Tabs Container-->
		<section id="tabsContainer" class="clearfix">
			<!--Inner-->
			<div id="innerBg">

				<!--About Tab-->
				<article id="about" class="clearfix">
					<form action="<c:url value="${formAction}"/>"
						method="post">
						<input type="hidden" value="${user.id }" name="id" id="id">
						<c:if test="${errors!=null }">
							<c:forEach items="${errors }" var="error">
							<span id="span" style="color: red;">${error.defaultMessage }</span><br/>
						</c:forEach>
						</c:if>
						<!-- Introduction -->
						<section  class="clearfix">
							<h1>个人信息</h1>
							<ul class="info">
								
								<li><span>手机</span> :
									<input type="text" value="${user.phone }" name="phone" 
									id="phone"> <span id="span" style="color: red;">*</span>
								</li>
								<c:if test="${formAction ne '/back/user/update'}">
									<li><span>密码</span> :
										<input type="text" value="${user.password }" name="password" 
										id="phone"> <span id="span" style="color: red;">*</span>
									</li>
								</c:if>
								
								<li><span>昵称</span> :
									<input type="tel" value="${user.nickname}" name="nickname">
									<span id="span" style="color: red;">*</span>
								</li>
								<li >
									<span>性别</span> :
									<c:choose>
										<c:when test="${user.gender eq 'fmale' }">
											<input type="radio" id="gender"
												name="gender"  value="male" /> 男
											<input type="radio" id="gender"
												name="gender" checked="checked" value="fmale" /> 女
										</c:when>
										<c:otherwise >
											<input type="radio" id="gender"
												name="gender" checked="checked" value="male" /> 男
								
											<input type="radio" id="gender"
												name="gender" value="fmale" /> 女
										</c:otherwise>
									</c:choose>
								</li>
								
								<li style="margin-top: 10px;"><span>地址</span> :
									<input type="tel" value="${user.address}" name="address">
									<span id="span" style="color: red;">*</span>
								</li>
								
							</ul>
							
						</section>
						<section id="clearfix">
							<input type="submit" value="保存" id="submit" /> 
							<input type="reset" onclick="window.history.go(-1)" value="取消">
						</section>
					</form>
				</article>
			</div>
			<!--End Inner-->
		</section>


	</div>
	<!--==================================================================================================================-->
	 
	<!--End Page Wrapper-->
</body>