<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="description" content="overview &amp; stats">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=basePath%>font-awesome/4.5.0/css/font-awesome.min.css">

		<!-- page specific plugin styles -->

		<!-- text fonts -->
		<link rel="stylesheet" href="<%=basePath%>css/fonts.googleapis.com.css">

		<!-- ace styles -->
		<link rel="stylesheet" href="<%=basePath%>css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style">

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="<%=basePath%>css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
		<link rel="stylesheet" href="<%=basePath%>css/ace-skins.min.css">
		<link rel="stylesheet" href="<%=basePath%>css/ace-rtl.min.css">

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="<%=basePath%>css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		<script src="<%=basePath%>js/ace-extra.min.js"></script><style>@keyframes nodeInserted{from{outline-color:#fff}to{outline-color:#000}}@-moz-keyframes nodeInserted{from{outline-color:#fff}to{outline-color:#000}}@-webkit-keyframes nodeInserted{from{outline-color:#fff}to{outline-color:#000}}@-ms-keyframes nodeInserted{from{outline-color:#fff}to{outline-color:#000}}@-o-keyframes nodeInserted{from{outline-color:#fff}to{outline-color:#000}}.ace-save-state{animation-duration:10ms;-o-animation-duration:10ms;-ms-animation-duration:10ms;-moz-animation-duration:10ms;-webkit-animation-duration:10ms;animation-delay:0s;-o-animation-delay:0s;-ms-animation-delay:0s;-moz-animation-delay:0s;-webkit-animation-delay:0s;animation-name:nodeInserted;-o-animation-name:nodeInserted;-ms-animation-name:nodeInserted;-moz-animation-name:nodeInserted;-webkit-animation-name:nodeInserted}</style>

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="<%=basePath%>js/html5shiv.min.js"></script>
		<script src="<%=basePath%>js/respond.min.js"></script>
		<![endif]-->
	<style type="text/css">
	/* .page-content{ max-width: 960px} */
	.jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}</style><link type="text/css" rel="stylesheet" charset="UTF-8" href="./仪表板 - Ace管理员_files/translateelement.css"></head>

</head>
<body>
<div class="main-content">
		<div class="main-content-inner" >
		<!--=============================================================================================================================================================================-->
			<!--main-container-part-->
			<div id="content" class="page-content" width="100%" >
			<div style="max-width: 960px;height:638px " >
	<div class="alert alert-block alert-success" >
		<button type="button" class="close" data-dismiss="alert">
			<i class="ace-icon fa fa-times"></i>
		</button>

		<i class="ace-icon fa fa-check green"></i>
		<font
			style="vertical-align: inherit;">
			<font
			style="vertical-align: inherit;"> 欢迎来到 </font>
			</font><strong class="green">
			<font
			style="vertical-align: inherit;">
			<font
				style="vertical-align: inherit;"> Fafu 二手交易平台管理系统 </font>
				</font>
				<small><font
				style="vertical-align: inherit;"></font>
	</div>
	<div class="row">
		<div class="space-6"></div>

		<div class="col-sm-7 infobox-container">
			<div class="infobox infobox-green">
				<div class="infobox-icon">
					<i class="ace-icon fa fa-comments"></i>
				</div>

				<div class="infobox-data">
					<span class="infobox-data-number"><font
						style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">32</font></font></span>
					<div class="infobox-content">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">评论+ 2评论</font></font>
					</div>
				</div>

				<div class="stat stat-success">
					<font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">8％</font></font>
				</div>
			</div>

			<div class="infobox infobox-blue">
				<div class="infobox-icon">
					<i class="ace-icon fa fa-twitter"></i>
				</div>

				<div class="infobox-data">
					<span class="infobox-data-number"><font
						style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">11</font></font></span>
					<div class="infobox-content">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">新的追随者</font></font>
					</div>
				</div>

				<div class="badge badge-success">
					<font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"> + 32％ </font></font><i
						class="ace-icon fa fa-arrow-up"></i>
				</div>
			</div>

			<div class="infobox infobox-pink">
				<div class="infobox-icon">
					<i class="ace-icon fa fa-shopping-cart"></i>
				</div>

				<div class="infobox-data">
					<span class="infobox-data-number"><font
						style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">8</font></font></span>
					<div class="infobox-content">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">新订单</font></font>
					</div>
				</div>
				<div class="stat stat-important">
					<font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">4％</font></font>
				</div>
			</div>

			<div class="infobox infobox-red">
				<div class="infobox-icon">
					<i class="ace-icon fa fa-flask"></i>
				</div>

				<div class="infobox-data">
					<span class="infobox-data-number"><font
						style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">7</font></font></span>
					<div class="infobox-content">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">实验</font></font>
					</div>
				</div>
			</div>

			<div class="infobox infobox-orange2">
				<div class="infobox-chart">
					<span class="sparkline"
						data-values="196,128,202,177,154,94,100,170,224"><canvas
							width="44" height="33"
							style="display: inline-block; width: 44px; height: 33px; vertical-align: top;"></canvas></span>
				</div>

				<div class="infobox-data">
					<span class="infobox-data-number"><font
						style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">6,251</font></font></span>
					<div class="infobox-content">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">浏览量</font></font>
					</div>
				</div>

				<div class="badge badge-success">
					<font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"> 7.2％ </font></font><i
						class="ace-icon fa fa-arrow-up"></i>
				</div>
			</div>

			<div class="infobox infobox-blue2">
				<div class="infobox-progress">
					<div class="easy-pie-chart percentage" data-percent="42"
						data-size="46"
						style="height: 46px; width: 46px; line-height: 45px;">
						<span class="percent"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">42</font></font></span><font
							style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">％ </font></font>
						<canvas height="46" width="46"></canvas>
					</div>
				</div>

				<div class="infobox-data">
					<span class="infobox-text"><font
						style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">使用的流量</font></font></span>

					<div class="infobox-content">
						<span class="bigger-110"><font
							style="vertical-align: inherit;"></font></span><font
							style="vertical-align: inherit;"><font
							style="vertical-align: inherit;"> 剩下</font><span
							class="bigger-110"><font style="vertical-align: inherit;">~</font></span><font
							style="vertical-align: inherit;"> 58GB </font></font>
					</div>
				</div>
			</div>

			<div class="space-6"></div>

			<div class="infobox infobox-green infobox-small infobox-dark">
				<div class="infobox-progress">
					<div class="easy-pie-chart percentage" data-percent="61"
						data-size="39"
						style="height: 39px; width: 39px; line-height: 38px;">
						<span class="percent"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">61</font></font></span><font
							style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">％ </font></font>
						<canvas height="39" width="39"></canvas>
					</div>
				</div>

				<div class="infobox-data">
					<div class="infobox-content">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">任务</font></font>
					</div>
					<div class="infobox-content">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">完成</font></font>
					</div>
				</div>
			</div>

			<div class="infobox infobox-blue infobox-small infobox-dark">
				<div class="infobox-chart">
					<span class="sparkline" data-values="3,4,2,3,4,4,2,2"><canvas
							width="39" height="19"
							style="display: inline-block; width: 39px; height: 19px; vertical-align: top;"></canvas></span>
				</div>

				<div class="infobox-data">
					<div class="infobox-content">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">收益</font></font>
					</div>
					<div class="infobox-content">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">$ 32,000个</font></font>
					</div>
				</div>
			</div>

			<div class="infobox infobox-grey infobox-small infobox-dark">
				<div class="infobox-icon">
					<i class="ace-icon fa fa-download"></i>
				</div>

				<div class="infobox-data">
					<div class="infobox-content">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">下载</font></font>
					</div>
					<div class="infobox-content">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">1205</font></font>
					</div>
				</div>
			</div>
		</div>

		<div class="vspace-12-sm"></div>

		<div class="col-sm-5">
			<div class="widget-box">
				<div class="widget-header widget-header-flat widget-header-small">
					<h5 class="widget-title">
						<i class="ace-icon fa fa-signal"></i><font
							style="vertical-align: inherit;"><font
							style="vertical-align: inherit;"> 流量来源 </font></font>
					</h5>

					<div class="widget-toolbar no-border">
						<div class="inline dropdown-hover">
							<button class="btn btn-minier btn-primary">
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;"> 本星期 </font></font><i
									class="ace-icon fa fa-angle-down icon-on-right bigger-110"></i>
							</button>

							<ul
								class="dropdown-menu dropdown-menu-right dropdown-125 dropdown-lighter dropdown-close dropdown-caret">
								<li class="active"><a
									href="file:///Volumes/Transcend/%E5%AE%9E%E8%AE%AD/%E5%AE%9E%E8%AE%AD2/git%E4%B8%8B%E8%BD%BD%E7%9A%84%E8%B5%84%E6%BA%90%E5%8C%85/ace/index.html#"
									class="blue"> <i
										class="ace-icon fa fa-caret-right bigger-110">&nbsp;</i> This
										Week
								</a></li>

								<li><a
									href="file:///Volumes/Transcend/%E5%AE%9E%E8%AE%AD/%E5%AE%9E%E8%AE%AD2/git%E4%B8%8B%E8%BD%BD%E7%9A%84%E8%B5%84%E6%BA%90%E5%8C%85/ace/index.html#">
										<i class="ace-icon fa fa-caret-right bigger-110 invisible">&nbsp;</i>
										Last Week
								</a></li>

								<li><a
									href="file:///Volumes/Transcend/%E5%AE%9E%E8%AE%AD/%E5%AE%9E%E8%AE%AD2/git%E4%B8%8B%E8%BD%BD%E7%9A%84%E8%B5%84%E6%BA%90%E5%8C%85/ace/index.html#">
										<i class="ace-icon fa fa-caret-right bigger-110 invisible">&nbsp;</i>
										This Month
								</a></li>

								<li><a
									href="file:///Volumes/Transcend/%E5%AE%9E%E8%AE%AD/%E5%AE%9E%E8%AE%AD2/git%E4%B8%8B%E8%BD%BD%E7%9A%84%E8%B5%84%E6%BA%90%E5%8C%85/ace/index.html#">
										<i class="ace-icon fa fa-caret-right bigger-110 invisible">&nbsp;</i>
										Last Month
								</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="widget-body">
					<div class="widget-main">
						<div id="piechart-placeholder"
							style="width: 90%; min-height: 150px; padding: 0px; position: relative;">
							<canvas class="flot-base" width="244" height="150"
								style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 244px; height: 150px;"></canvas>
							<canvas class="flot-overlay" width="244" height="150"
								style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 244px; height: 150px;"></canvas>
							<div class="legend">
								<div
									style="position: absolute; width: 105px; height: 110px; top: 15px; right: -30px; background-color: rgb(255, 255, 255); opacity: 0.85;">
								</div>
								<table
									style="position: absolute; top: 15px; right: -30px;; font-size: smaller; color: #545454">
									<tbody>
										<tr>
											<td class="legendColorBox"><div
													style="border: 1px solid null; padding: 1px">
													<div
														style="width: 4px; height: 0; border: 5px solid #68BC31; overflow: hidden"></div>
												</div></td>
											<td class="legendLabel"><font
												style="vertical-align: inherit;"><font
													style="vertical-align: inherit;">社交网络</font></font></td>
										</tr>
										<tr>
											<td class="legendColorBox"><div
													style="border: 1px solid null; padding: 1px">
													<div
														style="width: 4px; height: 0; border: 5px solid #2091CF; overflow: hidden"></div>
												</div></td>
											<td class="legendLabel"><font
												style="vertical-align: inherit;"><font
													style="vertical-align: inherit;">搜索引擎</font></font></td>
										</tr>
										<tr>
											<td class="legendColorBox"><div
													style="border: 1px solid null; padding: 1px">
													<div
														style="width: 4px; height: 0; border: 5px solid #AF4E96; overflow: hidden"></div>
												</div></td>
											<td class="legendLabel"><font
												style="vertical-align: inherit;"><font
													style="vertical-align: inherit;">广告系列</font></font></td>
										</tr>
										<tr>
											<td class="legendColorBox"><div
													style="border: 1px solid null; padding: 1px">
													<div
														style="width: 4px; height: 0; border: 5px solid #DA5430; overflow: hidden"></div>
												</div></td>
											<td class="legendLabel"><font
												style="vertical-align: inherit;"><font
													style="vertical-align: inherit;">直接交通</font></font></td>
										</tr>
										<tr>
											<td class="legendColorBox"><div
													style="border: 1px solid null; padding: 1px">
													<div
														style="width: 4px; height: 0; border: 5px solid #FEE074; overflow: hidden"></div>
												</div></td>
											<td class="legendLabel"><font
												style="vertical-align: inherit;"><font
													style="vertical-align: inherit;">其他</font></font></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<div class="hr hr8 hr-double"></div>

						<div class="clearfix">
							<div class="grid3">
								<span class="grey"> <i
									class="ace-icon fa fa-facebook-square fa-2x blue"></i><font
									style="vertical-align: inherit;"><font
										style="vertical-align: inherit;"> &nbsp; 喜欢 </font></font></span>
								<h4 class="bigger pull-right">
									<font style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">1,255</font></font>
								</h4>
							</div>

							<div class="grid3">
								<span class="grey"> <i
									class="ace-icon fa fa-twitter-square fa-2x purple"></i><font
									style="vertical-align: inherit;"><font
										style="vertical-align: inherit;"> &nbsp; 微博 </font></font></span>
								<h4 class="bigger pull-right">
									<font style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">941</font></font>
								</h4>
							</div>

							<div class="grid3">
								<span class="grey"> <i
									class="ace-icon fa fa-pinterest-square fa-2x red"></i><font
									style="vertical-align: inherit;"><font
										style="vertical-align: inherit;"> &nbsp; 销 </font></font></span>
								<h4 class="bigger pull-right">
									<font style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">1050</font></font>
								</h4>
							</div>
						</div>
					</div>
					<!-- /.widget-main -->
				</div>
				<!-- /.widget-body -->
			</div>
			<!-- /.widget-box -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
</div>
</div>
</body>
</html>