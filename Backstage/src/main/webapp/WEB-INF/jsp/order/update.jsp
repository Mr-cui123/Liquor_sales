<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
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
			<strong><span class="icon-pencil-square-o"></span>修改新闻</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x"
				action="${pageContext.request.contextPath}/jsp/news/list.jsp">
				<div class="form-group">
					<div class="label">
						<label>新闻编号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w80" name="newsId" value="1"
							readonly="readonly" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>新闻标题：</label>
					</div>
					<div class="field">
						<input type="text" class="input w80" name="newsTitle"
							value="尚学堂荣膺最佳教育机构" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>新闻类型：</label>
					</div>
					<div class="field">
						<select name="ejg" class="input w80" style="line-height:17px;">
							<option value="1">公司动态</option>
							<option value="2">行业动态</option>
							<option value="3">技术动态</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>内容：</label>
					</div>
					<div class="field">
						<textarea name="context" class="input w80"
							style="width:500px;height:300px;padding: 0px"> 2017-11-20日，在北京尚学堂公司举行隆重的庆典活动...
					      </textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="submit">
							提交</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
