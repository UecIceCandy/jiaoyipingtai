
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>  
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="robots" content="index, follow">
    <title>FAFU校园二手市场</title>
    <link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon"/>
   
    <script type="text/javascript" src="<%=basePath%>js/jquery.js" ></script>
    <script type="text/javascript" src="<%=basePath%>js/materialize.min.js" ></script>
    <script type="text/javascript" src="<%=basePath%>js/index.bundle.js" ></script>
    <link rel="stylesheet" href="<%=basePath%>css/materialize-icon.css" />
    <link rel="stylesheet" href="<%=basePath%>css/user.css" />
    <link rel="stylesheet" href="<%=basePath%>css/custom/lightBorder.css" />
    <link rel="stylesheet" href="<%=basePath%>css/custom/commentshow.css" />
    	<script src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
		<script src="<%=basePath%>assets/plugins/owl-carousel/owl.carousel.min.js"></script>
		<link rel="stylesheet" href="<%=basePath%>assets/plugins/owl-carousel/owl.carousel.min.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/plugins/owl-carousel/owl.theme.default.min.css" />
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:regular,700,600&amp;latin" type="text/css" />
        <!-- Essential styles -->
        <link rel="stylesheet" href="<%=basePath%>assets/bootstrap/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="<%=basePath%>assets/plugins/font-awesome/css/font-awesome.css" type="text/css"> 

        <!-- Dlapak styles -->
        <link id="theme_style" type="text/css" href="<%=basePath%>assets/css/style1.css" rel="stylesheet" media="screen">

        <!-- Assets -->
        <link rel="stylesheet" href="<%=basePath%>assets/plugins/owl-carousel/owl.carousel.css">
        <link rel="stylesheet" href="<%=basePath%>assets/plugins/owl-carousel/owl.theme.css">

        <!-- JS Library -->
        <script src="<%=basePath%>assets/js/jquery.js"></script>
        
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
                        <a href="<%=basePath%>goods/homeGoods" class="navbar-brand"><span class="logo"><i class="fa fa-recycle"></i> FaFu</span></a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                         <c:if test="${empty cur_user}">
                            <li class="new-ads"><a onclick="showLogin()" data-toggle="tooltip" title="您需要先登录哦！"  class="btn btn-ads btn-block">我要发布</a></li>
                            </c:if>
                            <c:if test="${!empty cur_user}">
                            <li class="new-ads"><a href="<%=basePath%>goods/publishGoods" data-position="bottom"   class="btn btn-ads btn-block">我要发布</a></li>
                            <li>
                        <a href="<%=basePath%>user/allGoods">我发布的商品</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>user/home" >${cur_user.username}</a>
                    </li>
                               <li class="dropdown">
                                <a class="dropdown-toggle" href="#" data-toggle="dropdown"><strong class="caret"></strong>&nbsp;操作</a>
                                <ul class="dropdown-menu">
                                    <li><a href="<%=basePath%>user/home">个人中心</a></li>
                                <li><a href="<%=basePath%>user/allFocus">我的关注</a></li>
                          
                                <li><a href="<%=basePath%>admin" target="_blank">登录后台</a></li>
                                <li><a href="<%=basePath%>user/logout">退出登录</a></li>
                                </ul>
                            </li>
                            </c:if>
							<c:if test="${empty cur_user}">
                          
                            <li class="dropdown">
                                <a class="dropdown-toggle" href="#" data-toggle="dropdown">注册</a>
                                <div class="dropdown-menu dropdown-login" style="padding:15px;min-width:250px">
                                    <form action="<%=basePath%>user/addUser" method="POST" role="form" id="signup_form" >                       
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon addon-login"><i class="fa fa-user"></i></span>
                                                <input type="text" name="username" required="required" class="form-control input-login">                                            
                                            </div>
                                        </div>
                                          <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon addon-login"><i class="fa fa-phone"></i></span>
                                                <input type="text" name="phone" id="phone" required="required" pattern="^1[0-9]{10}$" class="form-control input-login">                                            
                                            </div>
                                        </div>
                                     
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon addon-login"><i class="addon fa fa-lock"></i></span>
                                                <input type="password" name="password" required="required" class="form-control input-login">                                            
                                            </div>
                                        </div>
                                        
                                        <input type="submit" id="register" class="btn btn-custom btn-block" value="点击注册">
                                      
                                    </form>                                    
                                </div>
                            </li>
                             <li class="dropdown">
                                <a class="dropdown-toggle" href="#" data-toggle="dropdown">登录</a>
                                <div class="dropdown-menu dropdown-login" style="padding:15px;min-width:250px">
                                    <form action="<%=basePath%>user/login" method="post" role="form">                       
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon addon-login"><i class="fa fa-phone"></i></span>
                                                <input type="text" name="phone" id="login_phone" required="required" pattern="^1[0-9]{10}$" class="form-control input-login">                                            
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon addon-login"><i class="addon fa fa-lock"></i></span>
                                                <input type="password" id="login_password"  name="password" required="required" class="form-control input-login">                                            
                                            </div>
                                        </div>
                                        
                                        <input type="submit" id="loginIn" class="btn btn-custom btn-block" value="登录">
                                      
                                    </form>                                    
                                </div>
                            </li>                                              
                             </c:if>
                        </ul>
                    </div>
                </div>
            </header>
            <section class="hero">
                <div class="container text-center">
                    <h2 class="hero-title">福建农林大学二手交易平台</h2>
                    <p class="hero-description hidden-xs">找到你想要的一切</p>
                    <div class="row hero-search-box">
                        <form  action="<%=basePath%>goods/search" >
                            <div class="col-md-8 col-sm-6 search-input">
                                <input id="search" name="str" type="text" class="form-control input-lg search-first" align="center" placeholder="搜点什么吧">
                            </div>
                           
                            <div class="col-md-4 col-sm-6 search-input">
                                <button value="搜索" class="btn btn-custom btn-block btn-lg"><i class="fa fa-search"></i></button>
                            </div>
                        </form>
                    </div>
                </div>
            </section>
            <section class="main">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-sm-8">
                            <div class="row">
                                <div class="col-xs-4 col-sm-3">
                                    <div class="shortcut">
                                        <a href="<%=basePath%>goods/catelog"><i class="fa fa-fire shortcut-icon icon-orange"></i></a>
                                        <a href="<%=basePath%>goods/catelog"><h3>最新发布</h3></a>
                                        <span class="total-items">234,567</span>
                                    </div>
                                </div>
                                <div class="col-xs-4 col-sm-3">
                                    <div class="shortcut">
                                        <a href="<%=basePath%>goods/catelog/1"><i class="fa fa-mobile-phone shortcut-icon icon-dark-blue"></i></a>
                                        <a href="<%=basePath%>goods/catelog/1"><h3>闲置数码</h3></a>
                                        <span class="total-items">25,366</span>
                                    </div>
                                </div>
                                <div class="col-xs-4 col-sm-3">
                                    <div class="shortcut">
                                        <a href="<%=basePath%>goods/catelog/2"><i class="fa fa-bicycle shortcut-icon icon-brown"></i></a>
                                        <a href="<%=basePath%>goods/catelog/2"><h3>校园代步</h3></a>
                                        <span class="total-items">252,546</span>
                                    </div>
                                </div>
                                <div class="col-xs-4 col-sm-3">
                                    <div class="shortcut">
                                        <a href="<%=basePath%>goods/catelog/3"><i class="fa fa-television shortcut-icon icon-violet"></i></a>
                                        <a href="<%=basePath%>goods/catelog/3"><h3>电器日用</h3></a>
                                        <span class="total-items">52,546</span>
                                    </div>
                                </div>
                                <div class="col-xs-4 col-sm-3">
                                    <div class="shortcut">
                                        <a href="<%=basePath%>goods/catelog/4"><i class="fa fa-book shortcut-icon icon-dark-blue"></i></a>
                                        <a href="<%=basePath%>goods/catelog/4"><h3>图书教材</h3></a>
                                        <span class="total-items">215,546</span>
                                    </div>
                                </div>
                                <div class="col-xs-4 col-sm-3">
                                    <div class="shortcut">
                                        <a href="<%=basePath%>goods/catelog/5"><i class="fa fa-female shortcut-icon icon-orange"></i></a>
                                        <a href="<%=basePath%>goods/catelog/5"><h3>美妆衣服</h3></a>
                                        <span class="total-items">415,546</span>
                                    </div>  
                                </div>
                                <div class="col-xs-4 col-sm-3">
                                    <div class="shortcut">
                                        <a href="<%=basePath%>goods/catelog/6"><i class="fa fa-soccer-ball-o shortcut-icon icon-light-blue"></i></a>
                                        <a href="<%=basePath%>goods/catelog/6"><h3>运动棋牌</h3></a>
                                        <span class="total-items">15,546</span>
                                    </div>  
                                </div>
                                <div class="col-xs-4 col-sm-3">
                                    <div class="shortcut">
                                        <a href="<%=basePath%>goods/catelog/7"><i class="fa fa-ticket shortcut-icon icon-light-green"></i></a>
                                        <a href="<%=basePath%>goods/catelog/7"><h3>票卷小物</h3></a>
                                        <span class="total-items">152,546</span>
                                    </div>  
                                </div>
                            </div>
                            </div>
  <div class="col-md-4 col-sm-4">              
       <div class="box">
			<div class="content">
				<h1>Hello</h1>
				<p>
					临近毕业季的你是否有太多的闲置与校友分享，为了追求更好的校园服务，我们打造了一个全新的校园平台-福建农林大学校园二手市场。
					这里有更多的闲置分享，更自由的校园话题讨论，你想要的，都在这里。
					加入福建农林大学校园二手市场，你的大学，将更加精彩！
				</p>
			</div>
		</div>             
</div>
 </div>
     <div class="row">
                       <div class="col-md-12 col-sm-6 ">
                                    <div class="section-header">
                                        <h2>最新发布</h2>
                                    </div>
                                    <div id="featured-products" class="owl-carousel owl-carousel-featured">
                                     <c:forEach var="item" items="${catelogGoods}">
                                        <div class="item">
                                         
                                            <div class="item-ads-grid">
                                               <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                                                <div class="item-img-grid">
                                                    <img alt="" src="<%=basePath%>upload/${item.images[0].imgUrl}" class="img-responsive img-center">
                                                </div>
                                                <div class="item-title">
                                                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}"><h4><c:out value="${item.goods.name}"></c:out></h4></a>
                                                </div>
                                                <div class="item-meta">
                                                    <ul>
                                                        <li class="item-date"><i class="fa fa-clock-o"></i> 上架时间:<c:out value="${item.goods.startTime}"></c:out></li>
                                                        <li class="item-date"><i class="fa fa-clock-o"></i> 下架时间:<c:out value="${item.goods.endTime}"></c:out></li>
                                                        <li class="item-location"><i class="fa fa-map-marker"></i> 福建农林大学</a></li>
                                                        <li class="item-price "><i class="fa fa-money"></i> 原价<c:out value="${item.goods.realPrice}"></c:out></li>                       
                                                    </ul>
                                                </div>
                                                <div class="product-footer">
                                                    <div class="item-price-grid pull-left">
                                                        <h3><c:out value="${item.goods.price}"></c:out></h3>
                                                        <span>可议价</span>
                                                    </div>
                                                    <div class="item-action-grid pull-right">
                                                        <ul>
                                                        <c:if test="${!empty cur_user}">
                                                            <li><a href="#" value="加入关注" data-toggle="tooltip" data-placement="top" title="Save Favorite" class="btn btn-default btn-sm" id="btn_cart" onclick="addFocus(${item.goods.id})"><i class="fa fa-heart"></i></a></li>
                                                            </c:if>
                                                            <li><a href="<%=basePath%>goods/goodsId/${item.goods.id}" data-toggle="tooltip" data-placement="top" title="Show Details" class="btn btn-success btn-sm"><i class="fa fa-eye"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>   
                                        </div>
                                     </c:forEach>
                                    </div>
                                </div>                       
                         <div class="row">
                                <div class="col-md-12 col-sm-6">
                                <c:if test="${notice!=null}"> 
                                <div class="section-header">
                                        <h2>求购信息</h2>
                                    </div>
                                    
        <div class="sliders owl-carousel">
        <c:forEach items="${notice}" var="item" varStatus="status">
                         <div class="testimonial">
						<div class="test-info">
							<div class="test-name">
							<img class="test-pic" src="<%=basePath%>img/headpic3.jpg" alt="" />
								<span>${item.user.username}</span>
								
							</div>
						</div>
						<p>
							${item.context}
							</p>
							<p>
							${item.createAt}
						</p>
					</div> 
					</c:forEach>      				
     </div>
     </c:if>  
                                    <div class="section-header">
                                        <h2>闲置数码</h2>
                                    </div>
                                    <div id="featured-products" class="owl-carousel owl-carousel-featured">
                                     <c:forEach var="item" items="${catelogGoods1}">
                                        <div class="item">
                                         
                                            <div class="item-ads-grid">
                                               <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                                                <div class="item-img-grid">
                                                    <img alt="" src="<%=basePath%>upload/${item.images[0].imgUrl}" class="img-responsive img-center">
                                                </div>
                                                <div class="item-title">
                                                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}"><h4><c:out value="${item.goods.name}"></c:out></h4></a>
                                                </div>
                                                <div class="item-meta">
                                                    <ul>
                                                        <li class="item-date"><i class="fa fa-clock-o"></i> 上架时间:<c:out value="${item.goods.startTime}"></c:out></li>
                                                        <li class="item-date"><i class="fa fa-clock-o"></i> 下架时间:<c:out value="${item.goods.endTime}"></c:out></li>
                                                        <li class="item-location"><i class="fa fa-map-marker"></i> 福建农林大学</a></li>
                                                        <li class="item-price "><i class="fa fa-money"></i> 原价<c:out value="${item.goods.realPrice}"></c:out></li>
                                                    </ul>
                                                </div>
                                                <div class="product-footer">
                                                    <div class="item-price-grid pull-left">
                                                        <h3><c:out value="${item.goods.price}"></c:out></h3>
                                                        <span>可议价</span>
                                                    </div>
                                                    <div class="item-action-grid pull-right">
                                                        <ul>
                                                 <c:if test="${!empty cur_user}">
                                                            <li><a href="#" value="加入关注" data-toggle="tooltip" data-placement="top" title="Save Favorite" class="btn btn-default btn-sm" id="btn_cart" onclick="addFocus(${item.goods.id})"><i class="fa fa-heart"></i></a></li>
                                                            </c:if>
                                                            <li><a href="<%=basePath%>goods/goodsId/${item.goods.id}" data-toggle="tooltip" data-placement="top" title="Show Details" class="btn btn-success btn-sm"><i class="fa fa-eye"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div> 
                                            
                                        </div>
                                     </c:forEach>  
                                    </div>
                                </div>
  <div class="row">
 <div class="col-md-12 col-sm-6 ">
                                    <div class="section-header">
                                        <h2>校园代步</h2>
                                    </div>
                                    <div id="featured-products" class="owl-carousel owl-carousel-featured">
                                     <c:forEach var="item" items="${catelogGoods2}">
                                        <div class="item">
                                         
                                            <div class="item-ads-grid">
                                               <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                                                <div class="item-img-grid">
                                                    <img alt="" src="<%=basePath%>upload/${item.images[0].imgUrl}" class="img-responsive img-center">
                                                </div>
                                                <div class="item-title">
                                                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}"><h4><c:out value="${item.goods.name}"></c:out></h4></a>
                                                </div>
                                                <div class="item-meta">
                                                    <ul>
                                                        <li class="item-date"><i class="fa fa-clock-o"></i> 上架时间:<c:out value="${item.goods.startTime}"></c:out></li>
                                                        <li class="item-date"><i class="fa fa-clock-o"></i> 下架时间:<c:out value="${item.goods.endTime}"></c:out></li>
                                                        <li class="item-location"><i class="fa fa-map-marker"></i> 福建农林大学</a></li>
                                                        <li class="item-price "><i class="fa fa-money"></i> 原价<c:out value="${item.goods.realPrice}"></c:out></li>
                                                        
                                                    </ul>
                                                </div>
                                                <div class="product-footer">
                                                    <div class="item-price-grid pull-left">
                                                        <h3><c:out value="${item.goods.price}"></c:out></h3>
                                                        <span>可议价</span>
                                                    </div>
                                                    <div class="item-action-grid pull-right">
                                                        <ul>
                                                        <c:if test="${!empty cur_user}">
                                                            <li><a href="#" value="加入关注" data-toggle="tooltip" data-placement="top" title="Save Favorite" class="btn btn-default btn-sm" id="btn_cart" onclick="addFocus(${item.goods.id})"><i class="fa fa-heart"></i></a></li>
                                                            </c:if>
                                                            <li><a href="<%=basePath%>goods/goodsId/${item.goods.id}" data-toggle="tooltip" data-placement="top" title="Show Details" class="btn btn-success btn-sm"><i class="fa fa-eye"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>   
                                        </div>
                                     </c:forEach>
                                    </div>
                                </div>
                                <div class="row">
 <div class="col-md-12 col-sm-6 ">
                                    <div class="section-header">
                                        <h2>电器日用</h2>
                                    </div>
                                    <div id="featured-products" class="owl-carousel owl-carousel-featured">
                                     <c:forEach var="item" items="${catelogGoods3}">
                                        <div class="item">
                                         
                                            <div class="item-ads-grid">
                                               <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                                                <div class="item-img-grid">
                                                    <img alt="" src="<%=basePath%>upload/${item.images[0].imgUrl}" class="img-responsive img-center">
                                                </div>
                                                <div class="item-title">
                                                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}"><h4><c:out value="${item.goods.name}"></c:out></h4></a>
                                                </div>
                                                <div class="item-meta">
                                                    <ul>
                                                        <li class="item-date"><i class="fa fa-clock-o"></i> 上架时间:<c:out value="${item.goods.startTime}"></c:out></li>
                                                        <li class="item-date"><i class="fa fa-clock-o"></i> 下架时间:<c:out value="${item.goods.endTime}"></c:out></li>
                                                        <li class="item-location"><i class="fa fa-map-marker"></i> 福建农林大学</a></li>
                                                        <li class="item-price "><i class="fa fa-money"></i> 原价<c:out value="${item.goods.realPrice}"></c:out></li>
                                                        
                                                    </ul>
                                                </div>
                                                <div class="product-footer">
                                                    <div class="item-price-grid pull-left">
                                                        <h3><c:out value="${item.goods.price}"></c:out></h3>
                                                        <span>可议价</span>
                                                    </div>
                                                    <div class="item-action-grid pull-right">
                                                        <ul>
                                                        <c:if test="${!empty cur_user}">
                                                            <li><a href="#" value="加入关注" data-toggle="tooltip" data-placement="top" title="Save Favorite" class="btn btn-default btn-sm" id="btn_cart" onclick="addFocus(${item.goods.id})"><i class="fa fa-heart"></i></a></li>
                                                            </c:if>
                                                            <li><a href="<%=basePath%>goods/goodsId/${item.goods.id}" data-toggle="tooltip" data-placement="top" title="Show Details" class="btn btn-success btn-sm"><i class="fa fa-eye"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>   
                                        </div>
                                     </c:forEach>
                                    </div>
                                </div>      
                    <div class="row">
 <div class="col-md-12 col-sm-6 ">
                                    <div class="section-header">
                                        <h2>图书教材</h2>
                                    </div>
                                    <div id="featured-products" class="owl-carousel owl-carousel-featured">
                                     <c:forEach var="item" items="${catelogGoods4}">
                                        <div class="item">
                                         
                                            <div class="item-ads-grid">
                                               <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                                                <div class="item-img-grid">
                                                    <img alt="" src="<%=basePath%>upload/${item.images[0].imgUrl}" class="img-responsive img-center">
                                                </div>
                                                <div class="item-title">
                                                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}"><h4><c:out value="${item.goods.name}"></c:out></h4></a>
                                                </div>
                                                <div class="item-meta">
                                                    <ul>
                                                        <li class="item-date"><i class="fa fa-clock-o"></i> 上架时间:<c:out value="${item.goods.startTime}"></c:out></li>
                                                        <li class="item-date"><i class="fa fa-clock-o"></i> 下架时间:<c:out value="${item.goods.endTime}"></c:out></li>
                                                        <li class="item-location"><i class="fa fa-map-marker"></i> 福建农林大学</a></li>
                                                        <li class="item-price "><i class="fa fa-money"></i> 原价<c:out value="${item.goods.realPrice}"></c:out></li>
                                                        
                                                    </ul>
                                                </div>
                                                <div class="product-footer">
                                                    <div class="item-price-grid pull-left">
                                                        <h3><c:out value="${item.goods.price}"></c:out></h3>
                                                        <span>可议价</span>
                                                    </div>
                                                    <div class="item-action-grid pull-right">
                                                        <ul>
                                                        <c:if test="${!empty cur_user}">
                                                            <li><a href="#" value="加入关注" data-toggle="tooltip" data-placement="top" title="Save Favorite" class="btn btn-default btn-sm" id="btn_cart" onclick="addFocus(${item.goods.id})"><i class="fa fa-heart"></i></a></li>
                                                            </c:if>
                                                            <li><a href="<%=basePath%>goods/goodsId/${item.goods.id}" data-toggle="tooltip" data-placement="top" title="Show Details" class="btn btn-success btn-sm"><i class="fa fa-eye"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>   
                                        </div>
                                     </c:forEach>
                                    </div>
                                </div>
                                <div class="row">
 <div class="col-md-12 col-sm-6 ">
                                    <div class="section-header">
                                        <h2>美妆衣服</h2>
                                    </div>
                                    <div id="featured-products" class="owl-carousel owl-carousel-featured">
                                     <c:forEach var="item" items="${catelogGoods5}">
                                        <div class="item">
                                         
                                            <div class="item-ads-grid">
                                               <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                                                <div class="item-img-grid">
                                                    <img alt="" src="<%=basePath%>upload/${item.images[0].imgUrl}" class="img-responsive img-center">
                                                </div>
                                                <div class="item-title">
                                                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}"><h4><c:out value="${item.goods.name}"></c:out></h4></a>
                                                </div>
                                                <div class="item-meta">
                                                    <ul>
                                                        <li class="item-date"><i class="fa fa-clock-o"></i> 上架时间:<c:out value="${item.goods.startTime}"></c:out></li>
                                                        <li class="item-date"><i class="fa fa-clock-o"></i> 下架时间:<c:out value="${item.goods.endTime}"></c:out></li>
                                                        <li class="item-location"><i class="fa fa-map-marker"></i> 福建农林大学</a></li>
                                                        <li class="item-price "><i class="fa fa-money"></i> 原价<c:out value="${item.goods.realPrice}"></c:out></li>
                                                        
                                                    </ul>
                                                </div>
                                                <div class="product-footer">
                                                    <div class="item-price-grid pull-left">
                                                        <h3><c:out value="${item.goods.price}"></c:out></h3>
                                                        <span>可议价</span>
                                                    </div>
                                                    <div class="item-action-grid pull-right">
                                                        <ul>
                                                        <c:if test="${!empty cur_user}">
                                                            <li><a href="#" value="加入关注" data-toggle="tooltip" data-placement="top" title="Save Favorite" class="btn btn-default btn-sm" id="btn_cart" onclick="addFocus(${item.goods.id})"><i class="fa fa-heart"></i></a></li>
                                                            </c:if>
                                                            <li><a href="<%=basePath%>goods/goodsId/${item.goods.id}" data-toggle="tooltip" data-placement="top" title="Show Details" class="btn btn-success btn-sm"><i class="fa fa-eye"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>   
                                        </div>
                                     </c:forEach>
                                    </div>
                                </div>
                                <div class="row">
 <div class="col-md-12 col-sm-6 ">
                                    <div class="section-header">
                                        <h2>运动棋牌</h2>
                                    </div>
                                    <div id="featured-products" class="owl-carousel owl-carousel-featured">
                                     <c:forEach var="item" items="${catelogGoods6}">
                                        <div class="item">
                                         
                                            <div class="item-ads-grid">
                                               <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                                                <div class="item-img-grid">
                                                    <img alt="" src="<%=basePath%>upload/${item.images[0].imgUrl}" class="img-responsive img-center">
                                                </div>
                                                <div class="item-title">
                                                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}"><h4><c:out value="${item.goods.name}"></c:out></h4></a>
                                                </div>
                                                <div class="item-meta">
                                                    <ul>
                                                        <li class="item-date"><i class="fa fa-clock-o"></i> 上架时间:<c:out value="${item.goods.startTime}"></c:out></li>
                                                        <li class="item-date"><i class="fa fa-clock-o"></i> 下架时间:<c:out value="${item.goods.endTime}"></c:out></li>
                                                        <li class="item-location"><i class="fa fa-map-marker"></i> 福建农林大学</a></li>
                                                        <li class="item-price "><i class="fa fa-money"></i> 原价<c:out value="${item.goods.realPrice}"></c:out></li>
                                                        
                                                    </ul>
                                                </div>
                                                <div class="product-footer">
                                                    <div class="item-price-grid pull-left">
                                                        <h3><c:out value="${item.goods.price}"></c:out></h3>
                                                        <span>可议价</span>
                                                    </div>
                                                    <div class="item-action-grid pull-right">
                                                        <ul>
                                                        <c:if test="${!empty cur_user}">
                                                            <li><a href="#" value="加入关注" data-toggle="tooltip" data-placement="top" title="Save Favorite" class="btn btn-default btn-sm" id="btn_cart" onclick="addFocus(${item.goods.id})"><i class="fa fa-heart"></i></a></li>
                                                            </c:if>
                                                            <li><a href="<%=basePath%>goods/goodsId/${item.goods.id}" data-toggle="tooltip" data-placement="top" title="Show Details" class="btn btn-success btn-sm"><i class="fa fa-eye"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>   
                                        </div>
                                     </c:forEach>
                                    </div>
                                </div> 
                                <div class="row">
 <div class="col-md-12 col-sm-6 ">
                                    <div class="section-header">
                                        <h2>票卷小物</h2>
                                    </div>
                                    <div id="featured-products" class="owl-carousel owl-carousel-featured">
                                     <c:forEach var="item" items="${catelogGoods7}">
                                        <div class="item">
                                         
                                            <div class="item-ads-grid">
                                               <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                                                <div class="item-img-grid">
                                                    <img alt="" src="<%=basePath%>upload/${item.images[0].imgUrl}" class="img-responsive img-center">
                                                </div>
                                                <div class="item-title">
                                                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}"><h4><c:out value="${item.goods.name}"></c:out></h4></a>
                                                </div>
                                                <div class="item-meta">
                                                    <ul>
                                                        <li class="item-date"><i class="fa fa-clock-o"></i> 上架时间:<c:out value="${item.goods.startTime}"></c:out></li>
                                                        <li class="item-date"><i class="fa fa-clock-o"></i> 下架时间:<c:out value="${item.goods.endTime}"></c:out></li>
                                                        <li class="item-location"><i class="fa fa-map-marker"></i> 福建农林大学</a></li>
                                                        <li class="item-price "><i class="fa fa-money"></i> 原价<c:out value="${item.goods.realPrice}"></c:out></li>
                                                        
                                                    </ul>
                                                </div>
                                                <div class="product-footer">
                                                    <div class="item-price-grid pull-left">
                                                        <h3><c:out value="${item.goods.price}"></c:out></h3>
                                                        <span>可议价</span>
                                                    </div>
                                                    <div class="item-action-grid pull-right">
                                                        <ul>
                                                        <c:if test="${!empty cur_user}">
                                                            <li><a href="#" value="加入关注" data-toggle="tooltip" data-placement="top" title="Save Favorite" class="btn btn-default btn-sm" id="btn_cart" onclick="addFocus(${item.goods.id})"><i class="fa fa-heart"></i></a></li>
                                                            </c:if>
                                                            <li><a href="<%=basePath%>goods/goodsId/${item.goods.id}" data-toggle="tooltip" data-placement="top" title="Show Details" class="btn btn-success btn-sm"><i class="fa fa-eye"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>   
                                        </div>
                                     </c:forEach>
                                    </div>
                                </div>           
                    
           </div>
      </div>
</section>
        
   
</div>
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
			$('.owl-carousel').owlCarousel({
				margin: 10,
				responsiveClass: true,
				responsive: {
					0: {
						items: 1
					},
					680: {
						items: 2
					},
					960: {
						items: 3
					}
				}
			})
		</script>
</body>
</html> 
