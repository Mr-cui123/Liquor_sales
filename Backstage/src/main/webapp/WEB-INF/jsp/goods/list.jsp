<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <script type="text/javascript">
        function onpageNum(pageNum) {
            $("#currentPage").val(pageNum);
            $("#searchForm").submit();
        }

        function deleteGood(id,name) {
            var flag=confirm("确定要下架  "+name+"  吗？");
            if (flag){
                location.href="${pageContext.request.contextPath}/deleteGood?id="+id;
            }
        }
    </script>

    <style type="text/css">
        #xiajia:hover{
            color: #FFFFFF;
            background-color: red;
        }
        #xiajia{
            color: red;
            border: red 1px solid;
        }
    </style>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head">
        <strong class="icon-reorder">商品列表</strong>
    </div>
    <div class="padding border-bottom">
        <ul class="search" style="padding-left:10px;">
            <li><a class="button border-main icon-plus-square-o"
                   href="${pageContext.request.contextPath}/toaddGood"> 添加商品</a></li>
            <li>
                <form action="${pageContext.request.contextPath}/goods" id="searchForm" method="post">
                    <input id="currentPage" type="hidden" name="pageNum" value="1">
                    请输入商品名称关键字：<input type="text" name="keyword"
                                        id="keyword" class="input"
                                        style="width:200px; line-height:17px;display:inline-block" value="${keyword}"/> <a
                        href="javascript:void(0)" class="button border-main icon-search"
                        onclick="onpageNum(1)"> 搜索</a>
                </form>
            </li>
        </ul>
    </div>
    <table class="table table-hover text-center">
        <tr>
            <th width="10%">编号</th>
            <th>商品名称</th>
            <th>图片</th>
            <th>商品描述</th>
            <th>类别</th>
            <th>市场价</th>
            <th>商城价</th>
            <th>库存量</th>
            <th>上市时间</th>
            <th width="310">操作</th>
        </tr>
        <c:forEach var="gd" items="${pageInfo.list}">
            <tr>
                <td>${gd.goodsId}</td>
                <td><font color="#00CC99"> ${gd.goodsName}</font></td>
                <td><img src="${pageContext.request.contextPath}/${gd.goodsPic}" width="60" height="60"
                         border="0"></td>
                <td>${gd.goodsMiaoshu}</td>
                <td>${gd.catelog.catelogName}</td>
                <td>${gd.marketPrice}</td>
                <td>${gd.mallPrice}</td>
                <td>${gd.stockNum}</td>
                <td><fmt:formatDate value="${gd.enterDate}" pattern="yyyy-MM-dd"/> </td>
                <td>
                    <div class="button-group">
                        <a class="button border-main"
                           href="${pageContext.request.contextPath}/toupdateGood?id=${gd.goodsId}&pageNum=${pageInfo.pageNum}"><span
                                class="icon-edit"></span> 修改</a>
                        <a class="button" href="#"  id="xiajia" onclick="deleteGood(${gd.goodsId},'${gd.goodsName}')"><span
                                class="icon-align-center"></span>商品下架</a>
                    </div>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="80">
                <div class="pagelist">
                    <c:choose>
                        <c:when test="${!pageInfo.hasPreviousPage}">
                            <a class="nocls">首页</a><a class="nocls">上一页</a>
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:void(0)" onclick="onpageNum(1)">首页</a>
                            <a href="javascript:void(0)" onclick="onpageNum(${pageInfo.prePage})">上一页</a>
                        </c:otherwise>
                    </c:choose>
                    <c:forEach var="sn" items="${pageInfo.navigatepageNums}">
                        <c:choose>
                            <c:when test="${sn eq pageInfo.pageNum}">
                                <!-- 当前页显示在span里面,其它页点击后跳转页面 -->
                                </a> <span class="current">${sn}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="javascript:void(0)" onclick="onpageNum(${sn})">${sn}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${!pageInfo.hasNextPage}">
                            <a class="nocls">下一页</a><a class="nocls">尾页</a>
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:void(0)" onclick="onpageNum(${pageInfo.nextPage})">下一页</a>
                            <a href="javascript:void(0)" onclick="onpageNum(${pageInfo.pages})">尾页</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </td>
        </tr>
    </table>
</div>
</body>
</html>