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
    <meta charset="UTF-8">
    <title>个人设置</title>
    <link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon"/>
    <link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css" />
    <link rel="stylesheet" href="<%=basePath%>css/userhome.css" />
    <link rel="stylesheet" href="<%=basePath%>css/user.css" />
    <link id="theme_style" type="text/css" href="<%=basePath%>assets/css/style1.css" rel="stylesheet" media="screen">
     <!-- bootstrap -->
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
    <script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
</head>
<body>
<div class="pre-2" id="big_img">
    <img src="http://findfun.oss-cn-shanghai.aliyuncs.com/images/head_loading.gif" class="jcrop-preview jcrop_preview_s">
</div>
<div id="cover" style="min-height: 639px;">
    <div id="user_area">
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
        <!--

            描述：左侧个人中心栏
        -->
        <div id="user_nav">
            <div class="user_info">
                <div class="head_img">
                    <img src="<%=basePath%>img/photo.jpg">
                </div>
                <div class="big_headimg">
                    <img src="">
                </div>
                <span class="name">${cur_user.username}</span><hr>
              <!--   <span class="school">东华大学</span> -->
                  <a class="btn" style="width: 98%;background-color: rgb(79, 190, 246);color:rgba(255, 255, 255, 1);" href="<%=basePath%>user/myPurse">我的钱包：￥${myPurse.balance}</a>
                <input type="hidden" value="${myPurse.recharge}" id="recharge"/>
                <input type="hidden" value="${myPurse.withdrawals}" id="withdrawals"/>
                <span class="btn" data-toggle="modal" data-target="#myModal" style="width: 98%;background-color: rgb(79, 190, 246); color:rgba(255, 255, 255, 1);margin-top:0.5cm;">我的信用积分：${cur_user.power}</span>
                
            </div>
            <div class="home_nav">
                <ul>
                    <a href="<%=basePath%>orders/myOrders">
                        <li class="notice">
                            <div></div>
                            <span>订单中心</span>
                            <strong></strong>
                        </li>
                    </a>
                    <a href="<%=basePath%>user/allFocus">
                        <li class="fri">
                            <div></div>
                            <span>关注列表</span>
                            <strong></strong>
                        </li>
                    </a>
                    <a href="<%=basePath%>goods/publishGoods">
                        <li class="store">
                            <div></div>
                            <span>发布物品</span>
                            <strong></strong>
                        </li>
                    </a>
                    <a href="<%=basePath%>user/allGoods">
                        <li class="second">
                            <div></div>
                            <span>我的闲置</span>
                            <strong></strong>
                        </li>
                    </a>
                     <a href="<%=basePath%>user/basic">
                        <li class="set">
                            <div></div>
                            <span>个人设置</span>
                            <strong></strong>
                        </li>
                    </a>
                </ul>
            </div>
        </div>
        <!--

            描述：右侧内容区域
        -->
        <div id="user_content">
            <div class="basic">
                <form:form action="../user/updateInfo" method="post" commandName="user" role="form">
                    <h1>完善与修改个人信息</h1><hr />
                    <div class="changeinfo">
                        <span>昵称：</span>
                        <input class="in_info" type="text" name="username" placeholder="请输入昵称" value="${cur_user.username}"/>
                    </div><hr />
                    <div class="changeinfo">
                        <span>开通时间：</span>
                        <input class="in_info" type="text" name="createAt" value="${cur_user.createAt}" readonly="true"/>
                    </div><hr />
                    <div class="changeinfo">
                        <span>手机号码：</span>
                        <input class="in_info" type="text" name="phone" value="${cur_user.phone}" readonly="true"/>
                        <span id="checkphone">已验证</span>
                    </div><hr />
                    <div class="changeinfo">
                        <span>QQ：</span>
                        <input class="in_info" type="text" name="qq" placeholder="请输入QQ" value="${cur_user.qq}"/>
                    </div>
                    <input type="submit" class="setting-save" value="保存修改信息" />
                </form:form>
            </div>
            <!--

                描述：最右侧，可能认识的人
           
            <div class="recommend">
                <div class="title">
                    <span class="text">可能认识的人</span>
                    <span class="change">换一组</span>
                    <span class="underline"></span>
                </div>
                <ul>
                    <li>
                        <a href="" class="head_img">
                            <img src="<%=basePath%>img/photo1.jpg">
                        </a>
                        <span>Brudce</span>
                        <div class="fa fa-plus-square"></div>
                    </li>
                    <li>
                        <a href="" class="head_img">
                            <img src="<%=basePath%>img/photo2.jpg">
                        </a>
                        <span>Graham</span>
                        <div class="fa fa-plus-square"></div>
                    </li>
                    <li>
                        <a href="" class="head_img">
                            <img src="<%=basePath%>img/photo3.jpg">
                        </a>
                        <span>策马奔腾hly</span>
                        <div class="fa fa-plus-square"></div>
                    </li>
                    <li>
                        <a href="" class="head_img">
                            <img src="<%=basePath%>img/photo4.jpg">
                        </a>
                        <span>Danger-XFH</span>
                        <div class="fa fa-plus-square"></div>
                    </li>
                    <li>
                        <a href="" class="head_img">
                            <img src="<%=basePath%>img/photo5.jpg">
                        </a>
                        <span>Keithw</span>
                        <div class="fa fa-plus-square"></div>
                    </li>
                </ul>
            </div>
             -->
        </div>
    </div>
</div>

</body>
</html>