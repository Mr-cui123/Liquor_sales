<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title>登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/pintuer.js"></script>
</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">
            </div>
                <div class="panel loginbox">
                    <div class="text-center margin-big padding-big-top" style="color: #FFFFFF"><h2>欢迎使用小酒窝-后台管理系统</h2>
                    </div>
                    <div class="panel-body"
                         style="padding:30px; padding-bottom:10px; padding-top:10px;color: #FFFFFF;margin-left: 70px;width: 300px">
                	<span style="margin-left: 50px">
                    您好：${admin.username}<br/>
                    </span>
                        登陆时间: <%=new Date().toLocaleString()%>
                    </div>
                </div>
        </div>
    </div>
</div>

</body>
</html>