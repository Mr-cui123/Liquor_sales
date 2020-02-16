<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'detail.jsp' starting page</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/pintuer.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin.css" />
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/pintuer.js"></script>
</head>
  
  <body>
   <div class="panel admin-panel margin-top">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>订单明细</strong>
		</div>
		<div class="body-content"  styie="text-align:center">
			<table class="table table-hover text-center">
				<tr>
					<th width="15%">明细编号</th>
					<th width="10%">商品名</th>
					<th width="10%">商品价格</th>
					<th width="20%">购买数量</th>
					<th width="10%">金额</th>
				</tr>
				<c:forEach var="oitem" items="${orderitem}">
					<tr>
						<td>${oitem.orderitemId}</td>
						<td>${oitem.good.goodsName}</td>
						<td>${oitem.good.mallPrice}</td>
						<td>${oitem.goodsNum}</td>
						<td>${oitem.good.mallPrice*oitem.goodsNum}</td>
					</tr>
				</c:forEach>
			</table>
			<div class="form-group">
				<div class="field">
					<button class="button bg-main icon-check-square-o" style="margin-left: 40%;margin-top: 100px"
						onclick="back()">返回</button>
				</div>
			</div>
		</div>
	</div>
   <script type="text/javascript">
     function back(){
    	 //document.referrer为上次访问页面的地址
    	 window.location.href=document.referrer;
     }
   </script>
  </body>
</html>
