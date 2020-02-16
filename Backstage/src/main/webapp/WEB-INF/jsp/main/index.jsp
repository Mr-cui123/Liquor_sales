<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>小酒窝-管理中心</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/pintuer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/admin.css">
<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
</head>
<body style="background-color:#f2f9fd;">
	<div class="header bg-main">
		<div class="logo margin-big-left fadein-top">
			<h1>
				<img src="${pageContext.request.contextPath }/images/y.jpg"
					class="radius-circle rotate-hover" height="50" alt="" />小酒窝-后台管理中心
			</h1>
		</div>
		<div class="head-l">
			<a class="button button-little bg-green" href="/rece" target="_blank"><span
				class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;<a class="button button-little bg-red"
				href=" ${pageContext.request.contextPath}/loginPage"><span
				class="icon-power-off"></span> 退出登录</a>
		</div>
	</div>
	<div class="leftnav">
		<div class="leftnav-title">
			<strong><span class="icon-list"></span>操作菜单</strong>
		</div>
		<h2>
			<span class="icon-user"></span>系统管理
		</h2>
		<ul style="display:block">
			<li><a
				href="${pageContext.request.contextPath}/user"
				target="right"><span class="icon-caret-right"></span>会员管理</a></li>
			<li><a
				href="${pageContext.request.contextPath}/catelog"
				target="right"><span class="icon-caret-right"></span>商品类别管理</a></li>
			<li><a
				href="${pageContext.request.contextPath}/goods"
				target="right"><span class="icon-caret-right"></span>商品管理</a></li>
			<li><a
				href="${pageContext.request.contextPath}/Orders"
				target="right"><span class="icon-caret-right"></span>订单管理</a></li>
		</ul>
		<h2>
			<span class="icon-pencil-square-o"></span>个人管理
		</h2>
		<ul>
			<li><a
				href="${pageContext.request.contextPath}/toupdatePassword"
				target="right"><span class="icon-caret-right"></span>修改密码</a></li>
		</ul>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".leftnav h2").click(function() {
				$(this).next().slideToggle(200);
				$(this).toggleClass("on");
			});
			$(".leftnav ul li a").click(function() {
				$("#a_leader_txt").text($(this).text());
				$(".leftnav ul li a").removeClass("on");
				$(this).addClass("on");
			})
		});
	</script>
	<ul class="bread">
		<li><a href="${pageContext.request.contextPath}/toInfo" target="right" class="icon-home">
				首页</a></li>
		<li><a href="#" id="a_leader_txt">网站信息</a></li>
		<%--<li><b>当前语言：</b><span style="color:red;">中文</span>--%>
			<%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;切换语言：<a href="#">中文</a> &nbsp;&nbsp;<a--%>
			<%--href="#">英文</a></li>--%>
	</ul>
	<div class="admin">
		<%-- 修改iframe的请求路径，请求toInfo.action--%>
		<iframe scrolling="auto" frameborder="0"
			src="${pageContext.request.contextPath}/toInfo" name="right"
			width="100%" height="100%"></iframe>
	</div>
</body>
</html>