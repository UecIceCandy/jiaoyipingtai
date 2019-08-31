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

<meta charset="UTF-8">
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
<title>Insert title here</title>
</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs ace-save-state" id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a
						href="<%=basePath%>admin/index">Home</a></li>
					<li class="active">Simple &amp; Dynamic</li>
				</ul>
				<!-- /.breadcrumb -->


			</div>

			<div class="page-content">
				<div class="ace-settings-container" id="ace-settings-container">
					<div class="btn btn-app btn-xs btn-warning ace-settings-btn"
						id="ace-settings-btn">
						<i class="ace-icon fa fa-cog bigger-130"></i>
					</div>

					<div class="ace-settings-box clearfix" id="ace-settings-box">
						<div class="pull-left width-50">
							<div class="ace-settings-item">
								<div class="pull-left">
									<select id="skin-colorpicker" class="hide">
										<option data-skin="no-skin" value="#438EB9">#438EB9</option>
										<option data-skin="skin-1" value="#222A2D">#222A2D</option>
										<option data-skin="skin-2" value="#C6487E">#C6487E</option>
										<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
									</select>
								</div>
								<span>&nbsp; Choose Skin</span>
							</div>

							<div class="ace-settings-item">
								<input type="checkbox" class="ace ace-checkbox-2 ace-save-state"
									id="ace-settings-navbar" autocomplete="off" /> <label
									class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
							</div>

							<div class="ace-settings-item">
								<input type="checkbox" class="ace ace-checkbox-2 ace-save-state"
									id="ace-settings-sidebar" autocomplete="off" /> <label
									class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
							</div>

							<div class="ace-settings-item">
								<input type="checkbox" class="ace ace-checkbox-2 ace-save-state"
									id="ace-settings-breadcrumbs" autocomplete="off" /> <label
									class="lbl" for="ace-settings-breadcrumbs"> Fixed
									Breadcrumbs</label>
							</div>

							<div class="ace-settings-item">
								<input type="checkbox" class="ace ace-checkbox-2"
									id="ace-settings-rtl" autocomplete="off" /> <label class="lbl"
									for="ace-settings-rtl"> Right To Left (rtl)</label>
							</div>

							<div class="ace-settings-item">
								<input type="checkbox" class="ace ace-checkbox-2 ace-save-state"
									id="ace-settings-add-container" autocomplete="off" /> <label
									class="lbl" for="ace-settings-add-container"> Inside <b>.container</b>
								</label>
							</div>
						</div>
						<!-- /.pull-left -->

						<div class="pull-left width-50">
							<div class="ace-settings-item">
								<input type="checkbox" class="ace ace-checkbox-2"
									id="ace-settings-hover" autocomplete="off" /> <label
									class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
							</div>

							<div class="ace-settings-item">
								<input type="checkbox" class="ace ace-checkbox-2"
									id="ace-settings-compact" autocomplete="off" /> <label
									class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
							</div>

							<div class="ace-settings-item">
								<input type="checkbox" class="ace ace-checkbox-2"
									id="ace-settings-highlight" autocomplete="off" /> <label
									class="lbl" for="ace-settings-highlight"> Alt. Active
									Item</label>
							</div>
						</div>
						<!-- /.pull-left -->
					</div>
					<!-- /.ace-settings-box -->
				</div>
				<!-- /.ace-settings-container -->

				<div class="page-header">
					<h1>
						Tables <small> <i
							class="ace-icon fa fa-angle-double-right"></i> Static &amp;
							Dynamic Tables
						</small>
					</h1>
				</div>
				<!-- /.page-header -->



				<div class="row">
					<div class="col-xs-12">
						<!-- PAGE CONTENT BEGINS -->

						<!--搜索栏-->
						<div class="col-xs-12">

							<form class="form-horizontal" id="mysearchform" name="myform"
								action="<%=basePath%>admin/goodsList" method="post">
								<input id="page" style="display: none;" type="text" value="1"
									class="form-control" name="page" />
								<div class="form-group" style="border-radius: 5px">
									<div class="col-sm-8" style="text-align: center;">

										<span>商品ID：</span> <input type="number" placeholder="请输入纯数字~"
											name="id" value="${searchgoods.id}" class="nav-search-input"
											id="nav-search-input" autocomplete="off" /> <span>名称：</span>
										<input type="text" name="name" value="${searchgoods.name}"
											class="nav-search-input" id="nav-search-input"
											autocomplete="off" /> <span>状态：</span> <select
											class="chosen-select form-control" id="form-field-select-3"
											data-placeholder="Choose a State..." style="display: none;">
											<option value=""></option>

										</select> <select class="form-control" name="status" id="myselected"
											style="width: 100px; font-size: 12px; display: inline-block">
											<option value="" selected="selected">选择商品状态</option>
											<option value="1">在售</option>
											<option value="0">下架</option>
										</select>
									</div>
									<div class="col-sm-4">
										<button class="btn btn-success btn-sm" type="submit">查找</button>
										<button class="btn btn-danger btn-sm" type="button"
											id="deleteGoodsButton">删除</button>
										<a href="#" data-action="reload"> <i
											class="ace-icon fa fa-refresh"></i>
										</a>
									</div>
								</div>
							</form>
						</div>


						<div class="row">
							<div class="col-xs-12">
								<table id="simple-table"
									class="table  table-bordered table-hover">
									<thead>
										<tr>
											<th><input type="checkbox" id="selectAllButton"></th>
											<th>ID</th>
											<th>名称</th>
											<th>类别</th>
											<th>价格</th>
											<th>创建时间</th>
											<th>状态</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${goodsList}" var="item">
											<tr>
												<td><input type="checkbox" name="itemIds"
													value="${item.id}"></td>
												<td>${item.id}</td>
												<td>${item.name}</td>
												<td><c:if test="${item.catelogId == 1}">
														<span> 闲置数码</span>
													</c:if> <c:if test="${item.catelogId == 2}">
														<span>校园代步 </span>
													</c:if> <c:if test="${item.catelogId == 3}">
														<span> 电器日用 </span>
													</c:if> <c:if test="${item.catelogId == 4}">
														<span> 图书教材 </span>
													</c:if> <c:if test="${item.catelogId == 5}">
														<span>美妆衣物 </span>
													</c:if> <c:if test="${item.catelogId == 6}">
														<span> 运动棋牌</span>
													</c:if> <c:if test="${item.catelogId == 7}">
														<span> 票券小物</span>
													</c:if></td>
												<td>￥${item.realPrice}</td>
												<td>${item.startTime}</td>
												<td><c:if test="${item.status == 1}">
														<span style="color: blue">在售</span>
													</c:if> <c:if test="${item.status == 0}">
														<span style="color: red">下架</span>
													</c:if></td>
												<td>
													<button type="button" class="btn btn-primary btn-sm"
														onclick="doView(${item.id})">查看</button>
													<button type="button" class="btn btn-info btn-sm"
														onclick="doEdit(${item.id})">修改</button>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- /.span -->
							<!--分页条-->
			<div class="col-md-12 text-right">
				<div id="Paginator" style="text-align: center">
					<ul id="pageLimit"></ul>
				</div>
			</div>
						</div>
						<!-- /.row -->
						<!-- PAGE CONTENT ENDS -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
</body>
</html>