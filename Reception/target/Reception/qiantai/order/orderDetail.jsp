<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!-- 引入核心标签库 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>小酒窝-前台销售系统</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link href="${pageContext.request.contextPath}/css/layout.css"
          type="text/css" rel="stylesheet"/>
    <style type="text/css">
        a:link {
            color: #000000;
            text-decoration: none
        }

        a:visited {
            color: #000000;
            text-decoration: none
        }

        a:active {
            color: #000000;
            text-decoration: none
        }

        a:hover {
            color: #ff0000;
            text-decoration: none;
            position: relative;
            right: 0px;
            top: 1px
        }

        .UserName input {
            width: 100px;
            border: 1px solid #666;
        }

        .UserRegster a, .UserRegster a:link, .UserRegster a:visited {
            color: #f50;
        }

        .UserRegster input {
            background: url(<%=path%>/images/button.gif) no-repeat;
            width: 73px;
            height: 23px;
            border: 0px;
            cursor: hand;
        }

        .Item01Menu a {
            padding: 2px 10px;
            background: url(<%=path%>/images/dot_main01.gif) no-repeat left;
        }

        .C_Item_Title a, .C_Item_Title a:link, .C_Item_Title a:visited {
            font-weight: bold;
            text-align: center;
            color: #fff;
        }

        .C_Sort_Title a, .C_Sort_Title a:link, .C_Sort_Title a:visited {
            color: #fff;
        }

        .C_Help_Title a {
            background: url(<%=path%>/images/icon_sell.gif) no-repeat center;
            font-weight: bold;
            color: #fff;
            height: 24px;
            padding-left: 15px;
            width: 175px;
            padding-top: 5px;
        }

        .C_Help_Title a, .C_Help_Title a:link, .C_Help_Title a:visited {
            color: #fff;
        }

        .Order_Table td {
            font-size: 14px;
        }

        .Onlinpay input {
            background: url(<%=path%>/images/Car_icon_07.gif) no-repeat center;
            width: 115px;
            height: 30px;
            border: 0px;
            cursor: hand;
            padding-bottom: 8px;
            padding-right: 8px;
        }

        .text {
            font-family: "宋体";
            font-size: 15px;
            line-height: 20px;
            color: #000000;
            text-decoration: none;
            height: 50px;
        }

        .body {
            margin-left: 0px;
            margin-top: 2px;
            margin-right: 0px;
            margin-bottom: 2px;
            background-image: url(<%=path%>/images/backGroup.gif);
        }

        .blackTitle {
            font-family: "宋体";
            font-size: 12px;
            font-weight: bold;
            line-height: 20px;
            color: #000000;
            text-decoration: none;
            height: 40px;
        }
    </style>


</head>

<body class="body" leftmargin="0" rightmargin="0">
<div id="top">
    <jsp:include flush="true" page="/qiantai/inc/incTop.jsp"/>
</div>
<div class="page_row" style="border: #AFAFAF 1px solid;margin-left: 257px">
    <div class="list pic_news" style="width: 1000px">
        <div class="list_bar">&nbsp;订单详情</div>
        <table cellpadding="1" width="98%" border="0" align="center"
               bgcolor="#F7F3F7">
            <tr>
                <td class="blackTitle" align="center">商品名称</td>
                <td class="blackTitle" align="center">单价</td>
                <td class="blackTitle" align="center">数量</td>
                <td class="blackTitle" align="center">总价</td>
            </tr>
            <c:forEach var="orderitem" items="${orderItem}">
                <tr class="text" align="center" bgcolor="#FFFFFF">
                    <td>${orderitem.good.goodsName }</td>
                    <td>${orderitem.good.mallPrice }</td>
                    <td>${orderitem.goodsNum }</td>
                    <td>${orderitem.good.mallPrice*orderitem.goodsNum }</td>
                </tr>
            </c:forEach>
        </table>
        <br><br>
        <a href="${pageContext.request.contextPath}/queryOrderByUserId?id=${sessionScope.user.userId}"><img src="${pageContext.request.contextPath}/images/Car_icon_back.gif" alt=""></a>
    </div>
</div>
<div>
    <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"/>
</div>
</body>
</html>
