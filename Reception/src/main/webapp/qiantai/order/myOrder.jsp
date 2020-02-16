<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="pragma" content="no-cache"/>
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
    <meta http-equiv="description" content="This is my page"/>

    <link href="<%=path%>/css/layout.css" type="text/css" rel="stylesheet"/>

    <script language="JavaScript" src="<%=path%>/js/public.js"
            type="text/javascript">
    </script>
    <style type="text/css">
        .orderTitle {
            font-family: "宋体";
            font-size: 14px;
            font-weight: bold;
            line-height: 20px;
            color: #000000;
            text-decoration: none;
            height: 30px;
        }

        .order {
            font-size: 13px;
            line-height: 20px;
            color: #000000;
            text-decoration: none;
            height: 50px;
        }

        button {
            color: ;
        }
    </style>
    <!-- 删除页面自带的script标签 -->

    <title>小酒窝-前台销售系统</title>
</head>

<body>
<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"/>
<div class="page_row" style="border: #AFAFAF 1px solid;margin-left: 257px">
    <div class="list pic_news" style="width: 1000px">
        <div class="list_bar">&nbsp;我的订单</div>
        <center>
            <table width="99%" border="1" cellpadding="0" cellspacing="0"
                   bgcolor="#FFFFFF" align="center" style="margin-top: 8px;border-color: #AFAFAF">
                <tr align="center" bgcolor="#FAFAF1">
                    <td class="orderTitle">订单编号</td>
                    <td class="orderTitle">金额</td>
                    <td class="orderTitle">下单时间</td>
                    <td class="orderTitle">支付方式</td>
                    <td class="orderTitle">订单状态</td>
                    <td class="orderTitle">编辑</td>
                </tr>
                <c:forEach var="od" items="${orders }">
                    <tr align='center' bgcolor="#f5f5f5">
                        <td width="30%" class="order">${od.orderId }</td>
                        <td width="10%" class="order">￥ ${od.orderJine }</td>
                        <td width="15%" class="order"><fmt:formatDate value="${od.orderTime}"
                                                                      pattern="yyyy-MM-dd"/></td>
                        <td width="10%" class="order">${od.orderPay }</td>
                        <td width="15%" class="order"><c:choose>
                            <c:when test="${od.orderZhuangtai eq 0}">待发货</c:when>
                            <c:when test="${od.orderZhuangtai eq 1}">已发货&nbsp;|&nbsp;<a href="${pageContext.request.contextPath}/updateOrder?id=${od.orderId}&user=${od.user.userId}" style="color: #00ee00">收货</a> </c:when>
                            <c:when test="${od.orderZhuangtai eq 2}">已收货</c:when>
                            <c:otherwise>已完成</c:otherwise>
                        </c:choose></td>
                        <td width="10%" class="order"><a
                                href="${pageContext.request.contextPath}/getOrderItem?orderid=${od.orderId }">
                            订单明细</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </center>
    </div>
</div>
<div style="clear: both"></div>

<div>
    <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"/>
</div>
</body>
</html>
