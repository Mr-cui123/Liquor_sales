<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/pintuer.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/admin.css">
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/pintuer.js"></script>
</head>
<style type="text/css">
    #deleteCate:hover{
        color: #FFFFFF;
        background-color: red;
    }
    #deleteCate{
        color: red;
        border: red 1px solid;
    }
</style>
<script type="text/javascript">
    function deleteCatelog(id) {
        var flag=confirm("您确定删除此商品类别吗？");
        if (flag){
            location.href="${pageContext.request.contextPath}/deleteCate?id="+id;
        }
    }
</script>
<body>
<div class="panel admin-panel">
    <div class="panel-head">
        <strong class="icon-reorder">商品分类列表</strong>
    </div>
    <div class="padding border-bottom">
        <ul class="search" style="padding-left:10px;">
            <li><a class="button border-main icon-plus-square-o"
                   href="${pageContext.request.contextPath}/toaddCatelog">添加商品类别</a></li>

        </ul>
    </div>
    <table class="table table-hover text-center">
        <tr>
            <th width="10%">分类编号</th>
            <th>分类名称</th>
            <th>分类描述</th>
        </tr>
        <c:forEach var="catelog" items="${cate}">
            <tr>
                <td>${catelog.catelogId}</td>
                <td>${catelog.catelogName}</td>
                <td>${catelog.catelogMiaoshu}</td>
                <td><a class="button" href="#"  id="deleteCate" onclick="deleteCatelog()"><span
                        class="icon-align-center"></span>删除类别</a></td>
            </tr>
        </c:forEach>

    </table>
</div>
</body>
</html>