<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!-- 导入核心标签库 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/layout.css"
          type="text/css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/js/public.js"
            type="text/javascript"></script>
    <script>
        function deleteItem(goodid) {
            var flag = confirm("确定要删除此购物项吗？");
            if (flag) {
                location.href = "${pageContext.request.contextPath}/deleteItem?goodsid=" + goodid
            }
        }

        function clearCart() {
            var flag = confirm("确定要清空购物车吗？");
            if (flag) {
                location.href = "${pageContext.request.contextPath}/clearCar"
            }
        }
    </script>
    <title>小酒窝-前台销售系统</title>
</head>

<body>
<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"/>
<div class="page_row" style="border: #AFAFAF 1px solid;margin-left: 257px">
    <div class="list pic_news" style="width: 1000px">
        <div class="list_bar">&nbsp;我的购物车</div>
        <!-- 判断session中是否有购物车数据，如果没有，显示“您的购物车空空如也”，否则就显示购物车的数据到表格中 -->
        <c:choose>
            <c:when test="${empty  car}">
                <h2>您的购物车空空如也</h2>
                <!-- 显示继续购物的图片 -->
                <a href="${pageContext.request.contextPath}/goodsByKeyword"><img
                        border="0"
                        src="${pageContext.request.contextPath}/images/Car_icon_02.gif"/></a>
            </c:when>
            <c:when test="${empty  sessionScope.car.map}">
                <h2>您的购物车空空如也</h2>
                <!-- 显示继续购物的图片 -->
                <a href="${pageContext.request.contextPath}/goodsByKeyword"><img
                        border="0"
                        src="${pageContext.request.contextPath}/images/Car_icon_02.gif"/></a>
            </c:when>
            <c:otherwise>
                <table width="99%" border="0" cellpadding="2" cellspacing="1"
                       bgcolor="#FFFFFF" align="center" style="margin-top:8px">
                    <tr align="center" bgcolor="#FAFAF1" height="22">
                        <td>商品名称</td>
                        <td>价格</td>
                        <td>数量</td>
                        <td>金额</td>
                        <td>删除</td>
                    </tr>
                    <c:forEach var="entry" items="${sessionScope.car.map }">
                        <tr align='center' bgcolor="#FFFFFF" height="22">
                            <td>${entry.value.goods.goodsName }</td>
                            <td>${entry.value.goods.mallPrice }<br/></td>
                            <td>${entry.value.num}</td>
                            <td>￥${entry.value.money }</td>
                            <td><input type="image"
                                       src="${pageContext.request.contextPath}/images/delete_01.gif"
                                       border="0" onclick="deleteItem(${entry.key})"/></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="6" class="Order_Total"><img hspace="5"
                                                                 src="${pageContext.request.contextPath}/images/me03.gif"/>
                            总金额：￥<span id="totalMoney">${sessionScope.car.totalPrice }</span>
                        </td>
                    </tr>
                </table>
                <table align="center" cellpadding="20">
                    <br>
                    <tr>
                        <td>
                            <a href="javascript:void(0)" onclick="clearCart()"><img border="0"
                                                                                    src="${pageContext.request.contextPath}/images/Car_icon_01.gif"/></a>
                        </td>
                        <td><a
                                href="${pageContext.request.contextPath}/goodsByKeyword"><img
                                border="0"
                                src="${pageContext.request.contextPath}/images/Car_icon_02.gif"/></a></td>
                        <td>
                            <!-- 点击“下一步”，直接跳转到订单确认的页面 -->
                            <a
                                    href="${pageContext.request.contextPath}/qiantai/order/orderQueren.jsp"><img
                                    border="0"
                                    src="${pageContext.request.contextPath}/images/Car_icon_03.gif"/></a></td>
                    </tr>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<div style="clear: both"></div>
<div>
    <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"/>
</div>
</body>
</html>
