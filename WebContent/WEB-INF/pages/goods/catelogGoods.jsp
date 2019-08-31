
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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="robots" content="index, follow">
<title>FAFU校园二手市场</title>
<link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon" />

<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>js/materialize.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/index.bundle.js"></script>
<link rel="stylesheet" href="<%=basePath%>css/materialize-icon.css" />
<link rel="stylesheet" href="<%=basePath%>css/user.css" />
<link rel="stylesheet" href="<%=basePath%>css/custom/lightBorder.css" />
<link rel="stylesheet" href="<%=basePath%>css/custom/commentshow.css" />
<script src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
<script
	src="<%=basePath%>assets/plugins/owl-carousel/owl.carousel.min.js"></script>
<link rel="stylesheet"
	href="<%=basePath%>assets/plugins/owl-carousel/owl.carousel.min.css" />
<link rel="stylesheet"
	href="<%=basePath%>assets/plugins/owl-carousel/owl.theme.default.min.css" />
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Open+Sans:regular,700,600&amp;latin"
	type="text/css" />
<!-- Essential styles -->
<link rel="stylesheet"
	href="<%=basePath%>assets/bootstrap/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=basePath%>assets/plugins/font-awesome/css/font-awesome.css"
	type="text/css">

<!-- Dlapak styles -->
<link id="theme_style" type="text/css"
	href="<%=basePath%>assets/css/style1.css" rel="stylesheet"
	media="screen">

<!-- Assets -->
<link rel="stylesheet"
	href="<%=basePath%>assets/plugins/owl-carousel/owl.carousel.css">
<link rel="stylesheet"
	href="<%=basePath%>assets/plugins/owl-carousel/owl.theme.css">

<!-- JS Library -->
<script src="<%=basePath%>assets/js/jquery.js"></script>

	<!-- 分页插件 -->
	<script src="<%=basePath%>js/bootstrap-paginator.min.js"></script>

<!-- Essentials -->
<script src="<%=basePath%>assets/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=basePath%>assets/plugins/owl-carousel/owl.carousel.js"></script>
<script src="<%=basePath%>assets/plugins/counter/jquery.countTo.js"></script>
<script type="text/javascript">
    $(document).ready(function () {

        // ===========Featured Owl Carousel============
        if ($(".owl-carousel-featured").length > 0) {
            $(".owl-carousel-featured").owlCarousel({
                items: 3,
                lazyLoad: true,
                pagination: true,
                autoPlay: 5000,
                stopOnHover: true
            });
        }

        // ==================Counter====================
        $('.item-count').countTo({
            formatter: function (value, options) {
                return value.toFixed(options.decimals);
            },
            onUpdate: function (value) {
                console.debug(this);
            },
            onComplete: function (value) {
                console.debug(this);
            }
        });
    });
</script>
<script>
        function showLogin() {
            if($("#signup-show").css("display")=='block'){
                $("#signup-show").css("display","none");
            }
            if($("#login-show").css("display")=='none'){
                $("#login-show").css("display","block");
            }else{
                $("#login-show").css("display","none");
            }
        }
        function showSignup() {
            if($("#login-show").css("display")=='block'){
                $("#login-show").css("display","none");
            }
            if($("#signup-show").css("display")=='none'){
                $("#signup-show").css("display","block");
            }else{
                $("#signup-show").css("display","none");
            }
        }
        function ChangeName() {
            if($("#changeName").css("display")=='none'){
                $("#changeName").css("display","block");
            }else{
                $("#changeName").css("display","none");
            }
        }
        
        $(document).ready(function(){
            //异步验证
            $("#phone").blur(function(){
              var phone=$(this).val();
              $.ajax({
    				url:'<%=basePath%>user/register',
    				type:'POST',
    				data:{phone:phone},
    				dataType:'json',
    				success:function(json){
    					if(json.flag){
    						 $("#errorPhone").html("账号已被注册，请重新输入!");
    						 $("#register").attr("disabled",true);
    					}else{
    						 $("#errorPhone").empty();
    						 $("#register").attr("disabled",false);
    					}
    				},
    				error:function(){
    					alert('请求超时或系统出错!');
    				}
    			});
               
            });
  
            
        });
  
    </script>
<script type="text/javascript">
    function  addFocus(id) {
    	location.href = '<%=basePath%>user/addFocus/'+id
    	alert("已关注成功，查看关注列表~")
    	
    }
    
    </script>
</head>
<body>
	<div class="wrapper">
		<header class="navbar navbar-default navbar-fixed-top navbar-top">
			<div class="container">
				<div class="navbar-header">
					<a href="<%=basePath%>goods/homeGoods" class="navbar-brand"><span
						class="logo"><i class="fa fa-recycle"></i> FaFu</span></a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<c:if test="${empty cur_user}">
							<li class="new-ads"><a onclick="showLogin()"
								data-toggle="tooltip" title="您需要先登录哦！"
								class="btn btn-ads btn-block">我要发布</a></li>
						</c:if>
						<c:if test="${!empty cur_user}">
							<li class="new-ads"><a
								href="<%=basePath%>goods/publishGoods" data-position="bottom"
								class="btn btn-ads btn-block">我要发布</a></li>
							<li><a href="<%=basePath%>user/allGoods">我发布的商品</a></li>
							<li><a href="<%=basePath%>user/home">${cur_user.username}</a></li>
							<li class="dropdown"><a class="dropdown-toggle" href="#"
								data-toggle="dropdown"><strong class="caret"></strong>&nbsp;操作</a>
								<ul class="dropdown-menu">
									<li><a href="<%=basePath%>user/home">个人中心</a></li>
									<li><a href="<%=basePath%>user/allFocus">我的关注</a></li>
									
									<li><a href="<%=basePath%>admin" target="_blank">登录后台</a></li>
									<li><a href="<%=basePath%>user/logout">退出登录</a></li>
								</ul></li>
						</c:if>
						<c:if test="${empty cur_user}">

							<li class="dropdown"><a class="dropdown-toggle" href="#"
								data-toggle="dropdown">注册</a>
								<div class="dropdown-menu dropdown-login"
									style="padding: 15px; min-width: 250px">
									<form action="<%=basePath%>user/addUser" method="POST"
										role="form" id="signup_form">
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon addon-login"><i
													class="fa fa-user"></i></span> <input type="text" name="username"
													required="required" class="form-control input-login">
											</div>
										</div>
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon addon-login"><i
													class="fa fa-phone"></i></span> <input type="text" name="phone"
													id="phone" required="required" pattern="^1[0-9]{10}$"
													class="form-control input-login">
											</div>
										</div>

										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon addon-login"><i
													class="addon fa fa-lock"></i></span> <input type="password"
													name="password" required="required"
													class="form-control input-login">
											</div>
										</div>

										<input type="submit" id="register"
											class="btn btn-custom btn-block" value="点击注册">

									</form>
								</div></li>
							<li class="dropdown"><a class="dropdown-toggle" href="#"
								data-toggle="dropdown">登录</a>
								<div class="dropdown-menu dropdown-login"
									style="padding: 15px; min-width: 250px">
									<form action="<%=basePath%>user/login" method="post"
										role="form">
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon addon-login"><i
													class="fa fa-phone"></i></span> <input type="text" name="phone"
													id="login_phone" required="required" pattern="^1[0-9]{10}$"
													class="form-control input-login">
											</div>
										</div>
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon addon-login"><i
													class="addon fa fa-lock"></i></span> <input type="password"
													id="login_password" name="password" required="required"
													class="form-control input-login">
											</div>
										</div>

										<input type="submit" id="loginIn"
											class="btn btn-custom btn-block" value="登录">

									</form>
								</div></li>
						</c:if>
					</ul>
				</div>
			</div>
		</header>
		<div class="category-search">
			<div class="container">
				<div class="row category-search-box">
					<form action="<%=basePath%>goods/search">
					
						<div class="col-md-8 col-sm-6 search-input">
							<input id="search" name="str" type="text"
								class="form-control input-lg search-first" align="center"
								placeholder="搜点什么吧">
						</div>

						<div class="col-md-4 col-sm-6 search-input">
							<button value="搜索" class="btn btn-custom btn-block btn-lg">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<section class="category-wrapper">
			<div class="container">


				<div class="row">
					<div class="col-md-3 col-sm-3">
						<div class="widget">
							<div class="widget-header">
								<h3>Browse by Category</h3>
							</div>
							<div class="widget-body">
								<ul class="trends">
									<li><a href="<%=basePath%>goods/catelog">最新发布 &nbsp;<span
											class="item-numbers">(2,342)</span></a></li>
									<li><a href="<%=basePath%>goods/catelog/1">闲置数码 &nbsp;<span
											class="item-numbers">(2,342)</span></a></li>
									<li><a href="<%=basePath%>goods/catelog/2">校园代步 &nbsp;<span
											class="item-numbers">(2,342)</span></a></li>
									<li><a href="<%=basePath%>goods/catelog/3">电器日用 &nbsp;<span
											class="item-numbers">(2,342)</span></a></li>
									<li><a href="<%=basePath%>goods/catelog/4">图书教材 &nbsp;<span
											class="item-numbers">(2,342)</span></a></li>
									<li><a href="<%=basePath%>goods/catelog/5">美妆衣服 &nbsp;<span
											class="item-numbers">(2,342)</span></a></li>
									<li><a href="<%=basePath%>goods/catelog/6">运动棋牌 &nbsp;<span
											class="item-numbers">(242)</span></a></li>
									<li><a href="<%=basePath%>goods/catelog/7">票卷小物 &nbsp;<span
											class="item-numbers">(2,342)</span></a></li>
								</ul>
							</div>
						</div>

					</div>
					<div class="col-md-9 col-sm-9">
						<form class="form-horizontal" id="mysearchform" name="myform"
					action="<%=basePath%>catelog" method="post">
					<input id="page" style="display: none;" type="text" value="1"
						class="form-control" name="page" />
						<div class="search-results-box">
							<div class="row">
								<div class="col-md-12 search-results">
									Keyword : <span>"${catelog.name}"</span>
								</div>
							</div>
						</div>
						<div class="list-results">
							<c:forEach var="item" items="${goodsExtendList}">
								<div class="row">
									<div class="col-sm-12">


										<div class="row">

											<div class="col-sm-2 col-xs-3">

												<div class="item-img-grid">
													<img alt=""
														src="<%=basePath%>upload/${item.images[0].imgUrl}"
														class="img-responsive img-center">
												</div>
											</div>
											<div class="col-sm-8 col-xs-6">
												<div class="item-title">
													<a href="<%=basePath%>goods/goodsId/${item.goods.id}"><h4>
															&nbsp;&nbsp;
															<c:out value="${item.goods.name}"></c:out>
														</h4></a>
												</div>
												<div class="item-meta">
													<ul>
														<li class="item-date"><i class="fa fa-clock-o"></i>
															上架时间:<c:out value="${item.goods.startTime}"></c:out></li>
														<li class="item-date"><i class="fa fa-clock-o"></i>
															下架时间:<c:out value="${item.goods.endTime}"></c:out></li>
														<li class="item-location"><i class="fa fa-map-marker"></i>
															福建农林大学</li>
														<li class="item-price "><i class="fa fa-money"></i>
															原价<c:out value="${item.goods.realPrice}"></c:out></li>

													</ul>
												</div>
											</div>
											<div class="col-sm-2 col-xs-3">
												<div class="item-price">
													<h3>
														
														<c:out value="${item.goods.price}"></c:out>
													</h3>
													<span>可议价</span>
												</div>
												<div class="item-action">
													<ul>
														<c:if test="${!empty cur_user}">
															<li><a href="#" value="加入关注" data-toggle="tooltip"
																data-placement="top" title="Save Favorite"
																class="btn btn-default btn-sm" id="btn_cart"
																onclick="addFocus(${item.goods.id})"><i
																	class="fa fa-heart"></i></a></li>
														</c:if>
														<li><a
															href="<%=basePath%>goods/goodsId/${item.goods.id}"
															data-toggle="tooltip" data-placement="top"
															title="Show Details" class="btn btn-success btn-sm"><i
																class="fa fa-eye"></i></a></li>
													</ul>
												</div>
											</div>
										</div>


									</div>
								</div>
							</c:forEach>
						</div>
						<!--分页条-->
					<div class="col-md-12 text-right">
						<div id="Paginator" style="text-align: center">
							<ul id="pageLimit"></ul>
						</div>
					</div>
						</form>
					</div>
					
				</div>
			</div>
	</div>
	</section>

	</div>
	
	<script type="text/javascript">
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
            
            </script>
  <script type="text/javascript"> 
////////////分页栏////////////
    		$('#pageLimit').bootstrapPaginator({
    		    currentPage: "${page}",//当前的请求页面。
    		    totalPages: "${total}",//一共多少页。
    		    size:"normal",//应该是页眉的大小。
    		    bootstrapMajorVersion: 3,//bootstrap的版本要求。
    		    alignment:"right",
    		    numberOfPages:5,//一页列出多少数据。
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
        </script>
</body>
</html>

