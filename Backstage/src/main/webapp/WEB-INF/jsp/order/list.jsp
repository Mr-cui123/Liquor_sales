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

    <script>
        function onpageNum(pageNum) {
            location.href = "${pageContext.request.contextPath}/order.action?method=queryByPage&pageNum=" + pageNum;
        }

        function deleteorder(id) {
            var flag = confirm("确定要删除此订单吗？");
            if (flag) {
                location.href = "${pageContext.request.contextPath}/deleteOrder?id=" + id;
            }
        }
    </script>

</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head">
        <strong class="icon-reorder">订单列表</strong> <a href=""
                                                      style="float:right; display:none;">添加字段</a>
    </div>

    <table class="table table-hover text-center" width="100%">
        <tr>
            <th width="15%">编号</th>
            <th width="10%">订单金额</th>
            <th width="10%">下单日期</th>
            <th width="20%">收货地址</th>
            <th width="10%">订单状态</th>
            <th>操作</th>
        </tr>
        <c:forEach var="oder" items="${pb.list}">
            <tr>
                <td>${oder.orderId}</td>
                <td>${oder.orderJine}</td>
                <td><fmt:formatDate value="${oder.orderTime}" pattern="yyyy-MM-dd"/></td>
                <td>${oder.orderAddress}</td>
                <td>
                    <c:choose>
                        <c:when test="${oder.orderZhuangtai eq 0}">待发货</c:when>
                        <c:when test="${oder.orderZhuangtai eq 1}">已发货</c:when>
                        <c:when test="${oder.orderZhuangtai eq 2}">已收货</c:when>
                        <c:otherwise>已完成</c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <c:if test="${oder.orderZhuangtai eq 0}">
                        <a class="button border-main"
                           href="${pageContext.request.contextPath}/updateOrder?zt=1&id=${oder.orderId}"><span
                                class="icon-edit"></span>发货</a>
                    </c:if>
                    <c:if test="${oder.orderZhuangtai eq 2}">
                        <a class="button border-main"
                           href="${pageContext.request.contextPath}/updateOrder?zt=3&id=${oder.orderId}"><span
                                class="icon-edit"></span>完成</a>
                    </c:if>
                    <a class="button border-red"
                       href="${pageContext.request.contextPath}/orderItem?id=${oder.orderId}"><span
                            class="icon-trash-o"></span>订单明细</a>
                    <!-- 已完成的订单才显示删除超链接 -->
                    <c:if test="${oder.orderZhuangtai eq 3}">
                        <a class="button border-red"
                           href="javascript:void(0)" onclick="deleteorder('${oder.orderId}')"><span
                                class="icon-trash-o"></span>删除</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="80">
                <div class="pagelist">
                    <c:choose>
                        <c:when test="${!pb.hasPreviousPage}">
                            <a class="nocls">首页</a><a class="nocls">上一页</a>
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:void(0)" onclick="onpageNum(1)">首页</a>
                            <a href="javascript:void(0)" onclick="onpageNum(${pb.prePage})">上一页</a>
                        </c:otherwise>
                    </c:choose>
                    <c:forEach var="sn" items="${pb.navigatepageNums}">
                        <c:choose>
                            <c:when test="${sn eq pb.pageNum}">
                                <!-- 当前页显示在span里面,其它页点击后跳转页面 -->
                                </a> <span class="current">${sn}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="javascript:void(0)" onclick="onpageNum(${sn})">${sn}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${!pb.hasNextPage}">
                            <a class="nocls">下一页</a><a class="nocls">尾页</a>
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:void(0)" onclick="onpageNum(${pb.nextPage})">下一页</a>
                            <a href="javascript:void(0)" onclick="onpageNum(${pb.pages})">尾页</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
