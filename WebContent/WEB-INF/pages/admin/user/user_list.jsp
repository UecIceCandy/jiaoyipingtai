<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

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

</style>
<title>用户列表</title>
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
	
	<div id="content" class="page-content" >
		<div class="page-header">
							<h1>
								用户管理
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									用户列表
								</small>
							</h1>
						</div>
		
		<!-- Page table -->
		<div class="container" style="margin-left:0;">
		

			<!--搜索栏-->
			 <form class="form-horizontal" id="mysearchform" name="myform" action="<%=basePath%>admin/userList" method="post">
				<input id="page" style="display: none;" type="text" value="1" class="form-control" name="page" />
				<div class="form-group">
				<div  class="col-sm-8" style="text-align:center;">
					<span >手机：</span>
					<input type="number" placeholder="请输入手机号~" name="phone" value="${searchuser.phone}"/>
					<span >昵称：</span>
					<input type="text" name="username" value="${searchuser.username}"/>
					<span >QQ：</span>
					<input type="text" name="qq" value="${searchuser.qq}"/>
				</div>
					<div class="col-sm-4">
						<button class="btn btn-success btn-sm" type="submit" >查找</button>
						<button class="btn btn-danger btn-sm" type="button" id="deleteUserButton">删除</button>
					</div>
				</div>
			</form>
			
			<!--表格显示-->
			<table class="table table-bordered" >
				<thead>
					<tr>
						<th><input type="checkbox" id="selectAllButton"></th>
						<th>ID</th>
						<th>手机号</th>
						<th>昵称</th>
						<th>QQ</th>
						<th>创建时间</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${userList}" var="item">
						<tr>
							<td ><input type="checkbox" name="itemIds" value="${item.id}"></td>
							<td>${item.id}</td>
							<td>${item.phone}</td>
							<td>${item.username}</td>
							<td>${item.qq}</td>
							<td>${item.createAt}</td>
							<td>
							<c:if test="${item.status == 1}">  
							<span style="color:blue">正常</span>
							</c:if>
							<c:if test="${item.status == 0}">
							<span style="color:red">禁用</span>
							</c:if>
							</td>
							<td>
							<button type="button" class="btn btn-primary btn-sm" onclick="doView(${item.id})">查看</button>
							<button type="button" class="btn btn-info btn-sm"  onclick="doEdit(${item.id})" >修改</button>
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
                <h4 class="modal-title" id="myModalLabel" >修改用户信息</h4>
            </div>
            <div class="modal-body" style="height:300px; ">
            <form class="form-horizontal" id="myeditform" name="myform">
             <input type="hidden" id="id" name="id" value=""/>
             <input type="hidden" id="power" name="power" value=""/>
              <input type="hidden" id="goodsNum" name="goodsNum" value=""/>
            	<div class="form-group">
					 <label class="col-sm-4 control-label" >手机号:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_phone" name="phone" style="margin-top: 8px;"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >昵称:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_username" name="username" style="margin-top: 8px;"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >QQ:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_qq" name="qq" style="margin-top: 8px;"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >创建时间:</label>
					<div class="col-sm-8">
						 <input  type="text" id="datetimepicker"  name="createAt" class="form-control form_datetime" style="margin-top: 8px;">
					</div>
					
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >状态:</label>
					<div class="col-sm-8">
						<select name="status" style="margin-top: 8px;width: 372px;height: 27px;">
						<option value="0" selected="selected">禁用</option>
						<option value="1">正常</option>
						</select>
					</div>
				</div>
			  </form>
            </div>
            
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="doSave()">提交更改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!-- 查看 模态框（Modal） -->
<div class="modal fade" id="viewModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel" >查看用户信息</h4>
            </div>
            <div class="modal-body" style="height:300px; ">
            <form class="form-horizontal" id="myviewform" name="myform">
             <input type="hidden" id="id" name="id" value=""/>
            	 <input type="hidden" id="power" name="power" value=""/>
            	  <input type="hidden" id="goodsNum" name="goodsNum" value=""/>
            	<div class="form-group">
					 <label class="col-sm-4 control-label" >手机号:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_phone" name="phone" readonly style="margin-top: 8px;"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >昵称:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_username" name="username" readonly style="margin-top: 8px;"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >QQ:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_qq" name="qq" readonly style="margin-top: 8px;"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >创建时间:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_createAt" name="createAt" readonly style="margin-top: 8px;"/>
					</div>
				</div>
				<div class="form-group">
					 <label class="col-sm-4 control-label" >状态:</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="my_status" name="status" readonly style="margin-top: 8px;"/>
					</div>
				</div>
			  </form>
            </div>
            
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>

<script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<!-- datetimepicker -->
<script type="text/javascript" src="<%=basePath%>js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src='<%=basePath%>js/bootstrap-datetimepicker.zh-CN.js'></script>
<!-- 全选 base.js -->
<script type="text/javascript"src="<%=basePath%>js/custom/base.js"></script>
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

		//初始化时间
		$(".form_datetime").datetimepicker({  
			format:'yyyy-mm-dd hh:ii',
	    	todayHighlight: true,
	    	language:'zh-CN',
	      	autoclose: true
		});  

		/* 查看 */
		function doView(id){
			$.ajax({
				url:'<%=basePath%>admin/getUser',
				type:'GET',
				data:{id:id},
				dataType:'json',
				success:function(json){
					if(json){
						$('#myviewform').find("input[name='id']").val(json.id);
						$('#myviewform').find("input[name='power']").val(json.power);
						$('#myeditform').find("input[name='goodsNum']").val(json.goodsNum);
						$('#myviewform').find("input[name='phone']").val(json.phone);
						$('#myviewform').find("input[name='username']").val(json.username);
						$('#myviewform').find("input[name='qq']").val(json.qq);
						$('#myviewform').find("input[name='createAt']").val(json.createAt);
						if(json.status==1){
							$('#myviewform').find("input[name='status']").val('正常');
						}else{
							$('#myviewform').find("input[name='status']").val('禁用');
						}
						$('#viewModal').modal('toggle');
					}
				},
				error:function(){
					alert('请求超时或系统出错!');
					$('#viewModal').modal('hide');
				}
			});
		}
		
		/* 修改 */
		function doEdit(id){
			$.ajax({
				url:'<%=basePath%>admin/getUser',
				type:'GET',
				data:{id:id},
				dataType:'json',
				success:function(json){
					if(json){
						$('#myeditform').find("input[name='id']").val(json.id);
						$('#myeditform').find("input[name='goodsNum']").val(json.goodsNum);
						$('#myeditform').find("input[name='power']").val(json.power);
						$('#myeditform').find("input[name='phone']").val(json.phone);
						$('#myeditform').find("input[name='username']").val(json.username);
						$('#myeditform').find("input[name='qq']").val(json.qq);
						$('#myeditform').find("input[name='createAt']").val(json.createAt);
						$('#myeditform').find("select[name='status']").val(json.status);
						$('#editModal').modal('toggle');
					}
				},
				error:function(){
					alert('请求超时或系统出错!');
					$('#viewModal').modal('hide');
				}
			});
				
		}
		
		/* 保存 */
		function doSave(){
			$.ajax({
				url:'<%=basePath%>admin/updateUser',
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
		
</script>

</html>
