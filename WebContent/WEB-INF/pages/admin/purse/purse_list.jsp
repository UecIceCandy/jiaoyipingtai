<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.modal-header {
	text-align: center;
}

table td {
	text-align: center;
	vertical-align: middle !important;
	border: 0px;
}
</style>
<title>钱包列表</title>
<!-- 分页 -->
<link href="<%=basePath%>css/mypage.css" rel="stylesheet">

<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">

<link href="<%=basePath%>css/bootstrap-datetimepicker.min.css" rel="stylesheet">


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
								钱包管理
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									钱包列表
								</small>
							</h1>
						</div>
		<!-- Page table -->
		<div class="container" style="margin-left:0;">

			<!--搜索栏-->
			<form class="form-horizontal" id="mysearchform" name="myform"
				action="<%=basePath%>admin/purseList" method="post">
				<input id="page" style="display: none;" type="text" value="1" class="form-control" name="page" />
				<div class="form-group">
					<div class="col-sm-5" style="text-align: center;">
						<%-- <span>ID：</span> <input type="number" placeholder="请输入id~" name="id" value="${searchpurse.id}" />  --%>
						<input type="number" placeholder="请输用户id" name="userId" value="${searchpurse.userId}" class="form-control"/> 
					</div>
					<div class="col-sm-5" style="text-align: left;">
					<select name="state" data-style="btn-info" class="form-control" id="myselected">
					<option value="" >请选择审核状态</option>
					<option value="0">尚未审核</option>
					<option value="1">审核失败</option>
					<option value="2">审核成功</option>
					</select>
					</div>
					<div class="col-sm-2">
						<button class="btn btn-success btn-default" type="submit">查找</button>
						<!-- <button class="btn btn-danger btn-sm" type="button" id="deletePurseButton">删除</button>  -->
					</div>
				</div>
			</form>

			<!--表格显示-->
			<table class="table table-bordered">
				<thead>
					<tr>
						<!-- <th><input type="checkbox" id="selectAllButton"></th> -->
						<!-- <th>ID</th> -->
						<th>用户ID</th>
						<th>当前金额</th>
						<th>充值金额</th>
						<th>提现金额</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${purseList}" var="item">
						<tr>
							<%-- <td><input type="checkbox" name="itemIds" value="${item.id}"></td> --%>
							<%-- <td>${item.id}</td> --%>
							<td>${item.userId}</td>
							<td>￥${item.balance}</td>
							<td>${item.recharge}</td>
							<td>${item.withdrawals}</td>
							<td>
							<c:if test="${item.state==null}"><span >-</span></c:if>
							<c:if test="${item.state==0}"><span class="btn-primary btn-sm btn-info">尚待审核</span> </c:if>
							<c:if test="${item.state==1}"><span class="btn-primary btn-sm btn-danger">审核失败</span></c:if>
							<c:if test="${item.state==2}"><span class="btn-primary btn-sm btn-success">审核成功</span></c:if>
							</td>
							<td>
							<c:choose>
							  <c:when test="${item.state==null}"> 
							   <button type="button" class="btn btn-sm btn-primary" >无需审核</button>       
							   </c:when>
							   <c:when test="${item.state==0}"> 
							   <button type="button" class="btn btn-sm btn-info" onclick="doEdit(${item.id})">立即审核</button>       
							   </c:when>
							   <c:otherwise> 
							   <button type="button" class="btn btn-sm btn-success" >已经审核</button>       
							   </c:otherwise>
							</c:choose>
							</td> 
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!--分页条-->
			<div class="col-md-12 text-right">
				<div id="Paginator" style="text-align: center">
					<ul id="pageLimit"></ul>
				</div>
			</div>
		</div>
	</div>


	<!--==================================================================================================================-->
	 

	<!--修改  模态框（Modal） -->
	<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">审核信息</h4>
				</div>
				<div class="modal-body" style="height: 0 auto;">
					<form class="form-horizontal" id="myeditform" name="myform">
						<input type="hidden" id="id" name="id" value="" />
						<div class="form-group">
							<label class="col-sm-4 control-label">用户ID:</label>
							<div class="col-sm-8">
								<input type="text" readonly class="form-control" name="userId" style="margin-top: 8px;" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">当前金额:</label>
							<div class="col-sm-8">
								<input type="number" class="form-control" name="balance" style="margin-top: 8px;" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">充值金额:</label>
							<div class="col-sm-8">
								<input type="text" readonly class="form-control" name="recharge" style="margin-top: 8px;" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">提现金额:</label>
							<div class="col-sm-8">
								<input type="text" readonly class="form-control" name="withdrawals" style="margin-top: 8px;" />
								<input type="hidden" class="form-control" name="state" style="margin-top: 8px;" />
							</div>
						</div>
					</form>
				</div>

				<div class="modal-footer" >
				<div style="text-align:center">
					<div class="col-sm-2"></div>
					<button type="button" class="btn btn-success col-sm-4" onclick="doSavePass()">通过</button>
					<button type="button" class="btn btn-danger col-sm-4" onclick="doSaveRefuse()">拒绝</button>
				</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
</body>

<script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<!-- datetimepicker -->
<script type="text/javascript"
	src="<%=basePath%>js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript"
	src='<%=basePath%>js/bootstrap-datetimepicker.zh-CN.js'></script>
<!-- 全选 base.js -->
<script type="text/javascript" src="<%=basePath%>js/custom/base.js"></script>
<!-- 分页插件 -->
<script src="<%=basePath%>js/bootstrap-paginator.min.js"></script>
<script type="text/javascript">


////////////分页栏////////////
$('#pageLimit').bootstrapPaginator({
    currentPage: "${page}",//当前的请求页面。
    totalPages: "${total}",//一共多少页。
    size:"normal",//应该是页眉的大小。
    bootstrapMajorVersion: 3,//bootstrap的版本要求。
    alignment:"right",
    numberOfPages:10,//一页列出多少数据。
    //如下的代码是将页眉显示的中文显示我们自定义的中文。
    itemTexts:function (type, page, current) {
        switch (type) {
	        case "first": return "首页";
	        case "prev": return "上一页";
	        case "next": return "下一页";
	        case "last": return "末页";
	        case "page": return page;
        }
    },
    //给每个页眉绑定一个事件，其实就是ajax请求，其中page变量为当前点击的页上的数字。
    onPageClicked:function (event, originalEvent, type, page){
    	debugger;
    	$("#page").val(page);
    	$("#mysearchform").submit();
    	
    }
});


	/* 修改 */
	function doEdit(id){
		$.ajax({
			url:'<%=basePath%>admin/getPurse',
			type:'GET',
			data:{id:id},
			dataType:'json',
			success:function(json){
				if(json){
					$('#myeditform').find("input[name='id']").val(json.id);
					$('#myeditform').find("input[name='userId']").val(json.userId);
					$('#myeditform').find("input[name='balance']").val(json.balance);
					$('#myeditform').find("input[name='recharge']").val(json.recharge);
					$('#myeditform').find("input[name='withdrawals']").val(json.withdrawals);
					$('#myeditform').find("input[name='state']").val(json.state);
					$('#editModal').modal('toggle');
				}
			},
			error:function(){
				alert('请求超时或系统出错!');
				$('#editModal').modal('hide');
			}
		});
	}
	
	/* 通过 */
	function doSavePass(){
		$.ajax({
			url:'<%=basePath%>admin/updatePursePass',
			type:'POST',
			data:$('#myeditform').serialize(),// 序列化表单值  
			dataType:'json',
			success:function(json){
				alert(json.msg);
				$('#editModal').modal('toggle');
				location.reload();
			},
			error:function(){
				alert('请求超时或系统出错!');
				$('#editModal').modal('toggle');
			}
		});
	}
	
	/* 不通过 */
	function doSaveRefuse(){
		$.ajax({
			url:'<%=basePath%>admin/updatePurseRefuse',
			type:'POST',
			data:$('#myeditform').serialize(),// 序列化表单值  
			dataType:'json',
			success:function(json){
				alert(json.msg);
				$('#editModal').modal('toggle');
				location.reload();
			},
			error:function(){
				alert('请求超时或系统出错!');
				$('#editModal').modal('toggle');
			}
		});
	}
	
	//根据值 动态选中
	$("#myselected option[value='${searchpurse.state}']").attr("selected","selected"); 
</script>
</html>
