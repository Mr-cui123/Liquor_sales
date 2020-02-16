<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <link href="<%=path %>/css/layout.css" type="text/css" rel="stylesheet"/>

    <script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
    <script type="text/javascript">
        function back1() {
            window.history.go(-1);
        }
    </script>
</head>

<body>
<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"/>
<div class="page_row" style="border: #AFAFAF 1px solid;margin-left: 257px">
    <div class="list pic_news" style="width: 1000px">
        <div class="list_bar">&nbsp;订单提交完成</div>
        <table width="99%" border="0" cellpadding="10" cellspacing="1" bgcolor="#FFFFFF" align="center"
               style="margin-top:8px">
            <tr>
                <td align="center" style="color: red;font-size: 15px">${sessionScope.user.userName}
                    <c:choose>
                        <c:when test="${sessionScope.user.userSex == '男'}">
                            先生恭喜您，订单提交成功！
                        </c:when>
                        <c:otherwise>
                            女士恭喜您，订单提交成功！
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <td style="font-size: 15px">订单编号：${order.orderId }</td>
            </tr>

            <tr>
                <td style="font-size: 15px">总金额：${order.orderJine }</td>
            </tr>
            <tr>
                <td style="font-size: 15px">下单日期:<fmt:formatDate value="${order.orderTime }" pattern="yyyy-MM-dd"/></td>
            </tr>
            <tr>
                <td style="font-size: 15px">送货地址:${order.orderAddress }</td>
            </tr>
            <tr>
                <td style="font-size: 15px">付款方式:${order.orderPay }</td>
            </tr>
        </table>
    </div>
</div>
</div>
<div style="clear: both"></div>
</div>

<div>
    <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"/>
</div>
</body>
</html>
