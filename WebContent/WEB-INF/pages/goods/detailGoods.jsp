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
    
    <link rel="stylesheet" href="<%=basePath%>css/index.css" />
    <link rel="stylesheet" href="<%=basePath%>css/detail.css" />
    
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
        <link rel="stylesheet" href="<%=basePath%>assets/plugins/flexslider/flexslider.css" type="text/css" media="screen" />

        <!-- JS Library -->
        <script src="<%=basePath%>assets/js/jquery.js"></script>
        
        <script src="<%=basePath%>assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="<%=basePath%>assets/plugins/owl-carousel/owl.carousel.js"></script>
        <script src="<%=basePath%>assets/plugins/counter/jquery.countTo.js"></script>
    
        <script defer src="<%=basePath%>assets/plugins/flexslider/jquery.flexslider.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {

                // ===============Flexslider=====================
                $('.flexslider').flexslider({
                    animation: "slide",
                    controlNav: "thumbnails",
                    directionNav: false,
                    start: function (slider) {
                        $('body').removeClass('loading');
                    }
                });

                // ==========tooltip initial=================
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
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
    </script>
  
    <script type="text/javascript">
    
    function  addFocus(id) {
    	location.href = '<%=basePath%>user/addFocus/'+id
    	alert("已关注成功，查看关注列表~")
    	
    }
    
	/* 前往支付 */
    function  toPay(id) {
    	window.location.href = '<%=basePath%>goods/buyId/'+id
    }
	
    </script>
    
    
<body >
<!--

    描述：顶部
-->
<div ng-controller="headerController" class="header stark-components navbar-fixed ng-scope">
    <nav class="white nav1">
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
                        <a>${cur_user.username}</a>
                    </li>
                               <li class="dropdown">
                                <a class="dropdown-toggle" href="#" data-toggle="dropdown"><strong class="caret"></strong>&nbsp;Settings</a>
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
    </nav>
</div>
<section class="main">
                <div class="container">
                   

                    <div class="row">
                        <div class="col-md-8 col-sm-8">
                            <div class="row">
                                <div class="col-md-12">

                                    <div class="post">
                                        <div class="post-price">
                                            ${goodsExtend.goods.price}
                                        </div>
                                        <div class="post-title">
                                            <h2>${goodsExtend.goods.name}</h2>
                                        </div>
                                      
                                        <div class="flexslider post-images">
                                            <ul class="slides">
                                                <li data-thumb="<%=basePath%>upload/${goodsExtend.images[0].imgUrl}">
                                                    <img alt="" src="<%=basePath%>upload/${goodsExtend.images[0].imgUrl}" />
                                                </li>
                                             
                                            </ul>

                                        </div>
                                        <h2 class="publisher-info-title">原价：<span style="text-decoration:line-through;">${goodsExtend.goods.realPrice}</span></h2>
                                        <div class="post-body">
                                            <h2><strong>信息:</strong></h2>
                                            <ul>
                                                <li>发布时间: ${goodsExtend.goods.startTime}</li>
                                                <li>下架时间: ${goodsExtend.goods.endTime}</li>
                                                <li>地理位置: 福建农林大学</li>
                                                
                                            </ul>
                                            <h3><strong>描述:</strong></h4>
                                            <p>
                                                ${goodsExtend.goods.describle} 
                                            </p>
                                            
                                        </div>
                                        <div class="post-footer">
                                            <div class="row">
                                                <div class="col-xs-6">    
                                                    <div>
              <c:if test="${!empty cur_user}">
               <input type="button" value="加入关注" class="blue lighten-1 waves-effect waves-light btn" id="btn_cart" onclick="addFocus(${goodsExtend.goods.id})"></input>
               <c:if test="${cur_user.id==goodsExtend.goods.userId}">
               <input type="button" value="在线支付" data-toggle="tooltip"  title="不可以购买自己的东西哦~" disabled="disabled" class="blue lighten-1 waves-effect waves-light btn" id="btn_buy"></input>
                </c:if>
                <c:if test="${cur_user.id!=goodsExtend.goods.userId}">
               <input type="button" value="在线支付"  class="blue lighten-1 waves-effect waves-light btn" id="btn_buy" onclick="toPay(${goodsExtend.goods.id})"></input>
                </c:if>
                </c:if>
                </div>
                                                </div>
                                              
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                          
                        </div>
                        <div class="col-md-4 col-sm-4">
                            <div class="widget">
                                <div class="widget-header">
                                    <h3>发布者</h3>
                                </div>
                                <div class="widget-body text-center">
                                    <img alt="avatar" src="<%=basePath%>img/headpic3.jpg" class="seller-avatar img-responsive">
                                    <h2 class="seller-name">${seller.username}</h2>
                                    <p class="seller-detail">位置: <strong>福建农林大学</strong><br/>
                                                                         注册时间: <strong>${seller.createAt}</strong><br/>
                                                                         电话号码: <strong>${seller.phone}</strong>                                    
                                     </p>
                                </div>
                                <div class="widget-footer">
                                    <div class="row">
                                    <c:if test="${seller.qq!=null}">
                                        <div class="col-sm-6">    
                                            <button class="btn btn-info btn-block"><i class="fa fa-qq"></i> ${seller.qq}</button>
                                        </div>
                                     </c:if>
                                     <c:if test="${seller.qq==null}">
                                        <div class="col-sm-6">    
                                            <button class="btn btn-info btn-block"><i class="fa fa-qq"></i>没留下QQ</button>
                                        </div>
                                    </c:if>
                                        <div class="col-sm-6">
                                            <button class="btn btn-warning btn-block" data-target="#sendMessageModal" data-toggle="modal"><i class="fa fa-envelope"></i> 发邮件</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                         
                       
                        </div>
                        
                    </div>
                    <div class="row detail-area">
    <div class="clo s12">
        <div ng-controller="commentController" class="comment stark-components z-depth-1 ng-scope">
            <h1 class="title">评论</h1>
            <hr class="hr1" />
            <hr class="hr2" />
            <c:forEach var="item" items="${CommentExtend.comments}"  >
            <div class="comment-collection">
                <div class="comment-item ng-scope">
                    <div class="comment-main-content">
                         <em class="ng-binding">${item.user.username}:</em>
                         <em class="ng-binding">${item.content}</em>
                    </div>
                    <div class="comment-function">
                        <em class="time ng-biinding">${item.createAt}</em>
                       
                       <!--  <a class="reply-or-delete">删除</a>
                        <a class="reply-or-delete">回复</a> -->
                    </div>
                </div>
            </div>
             </c:forEach>
          <form id="addCommentForm" class="form-horizontal" >
            <div class="comment-add row">
                <div class="input-field col s12">
                    <i class="iconfont prefix"></i>
                    <input id="goodsId" name="goods.id" value="${goodsExtend.goods.id}" type="hidden"/>
                    <input id="commentbox" type="text" name="content" class="validate ng-pristine ng-untouched ng-valid ng-empty"/>
                    <label for="commentbox">这里写下评论</label>
                    <c:if test="${!empty cur_user}">
                    <button type="button" class="waves-effect wave-light btn comment-submit" onclick="addComments()">确认</button>
                    </c:if>
                   <%--   <c:if test="${!empty cur_user} && ${cur_user.id!=goodsExtend.comments.userId}">
                    <button type="submit" class="waves-effect wave-light btn comment-submit">确认</button>
                    </c:if>
                     <c:if test="${!empty cur_user} && ${cur_user.id==goodsExtend.comments.userId}">
                    <button data-toggle="tooltip"  title="您已经评论过了哦！" disabled="disabled"  class="waves-effect wave-light btn comment-submit">确认</button>
                    </c:if> --%>
                     <c:if test="${empty cur_user}">
                    <button href="javacript:void(0);" data-toggle="tooltip"  title="您需要先登录哦！" disabled="disabled" class="waves-effect wave-light btn comment-submit">确认</button>
                    </c:if>
                   
                </div>
            </div>
            </form>
        </div>
    </div>
</div>
</div>    
</section>
        
        </div>

        <!-- Send Message Modal -->
        <div aria-labelledby="sendMessageModalLabel" role="dialog" tabindex="-1" id="sendMessageModal" class="modal fade in">
            <div role="document" class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span></button>
                        <h4 id="sendMessageModalLabel" class="modal-title">发邮件r</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label class="control-label">姓名:</label>
                                <input type="text" class="form-control input-lg" placeholder="Your name" required>
                            </div>
                            <div class="form-group">
                                <label class="control-label">邮箱:</label>
                                <input type="email" class="form-control input-lg" placeholder="Your email" required>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="message-text">内容:</label>
                                <textarea id="message-text" class="form-control input-lg" placeholder="Your message" required></textarea>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                        <button class="btn btn-custom" type="button"><i class="fa fa-paper-plane"></i> 发送</button>
                    </div>
                </div>
            </div>
        </div>
        
        

</body>
<script type="text/javascript">
/* 评论 */
function addComments(){
	$.ajax({
		url:'<%=basePath%>goods/addComments',
		type:'POST',
		data:$('#addCommentForm').serialize(),// 序列化表单值  
		dataType:'json',
	/* 	success:function(json){
			alert(1)
			alert(json.msg)
		},
		error:function(){
			alert('请求超时或系统出错!');
		} */
	});
	alert("您已评论成功~")
	window.location.reload();
}
</script>
</html>