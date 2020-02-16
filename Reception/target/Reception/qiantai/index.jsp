<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!-- 导入核心标签库 -->
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>小酒窝-前台销售系统</title>
    <link href="${pageContext.request.contextPath}/css/layout.css"
          type="text/css" rel="stylesheet"/>

    <%--<script language="JavaScript"--%>
            <%--src="${pageContext.request.contextPath}/js/public.js"--%>
            <%--type="text/javascript">--%>

    <%--</script>--%>
    <script type="text/javascript">
        setTimeout(
            function lose() {
                var lo = document.getElementById("lose1");
                var c = document.getElementById("click");
                if (c != null) {
                    lo.style.display = "block";
                    setTimeout(function () {
                        lo.style.display = "none";
                    }, 3000)
                }
            }, 0)
    </script>
    <style type="text/css" media="screen">
        #tw img:hover {
            border: red 1.5px solid
        }
    </style>
</head>
<body>
<!-- 包含头部页面 -->
<jsp:include flush="true" page="inc/incTop.jsp"/>
<c:if test="${error eq 1}">
    <a href="javascript:void(0)" id="click" onclick="lose()"></a>
</c:if>
<div id="lose1" style="width: 200px;height:40px;background-color: red;position: absolute;z-index: 9999;
margin-left: 1050px;margin-top: 200px;display: none">
    <span style="line-height: 40px;font-weight: bold">用户名或密码错误</span>
</div>
<div class="page_row" style="border: #AFAFAF 1px solid; margin-left: 257px">
    <!--左边的 -->
    <c:choose>
        <c:when test="${empty sessionScope.user}">
            <div class="page_main_msg left">
                <!-- 新品上市 -->
                <div class="left_row">
                    <div class="list pic_news" style="border: #AFAFAF 1px solid">
                        <div class="list_bar">
                            <span style="float: left">新品上市</span> <span style="float: right">
						<a href="${pageContext.request.contextPath}/goodsByKeyword">更多</a>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        </div>
                        <div id="ttw" class="list_content">
                            <div style="width: 100%; overflow: hidden; white-space: nowrap;">
                                <table width="100%" align="left" cellpadding="0" cellspacing="0"
                                       border="0">
                                    <tr>
                                        <c:forEach var="gd" items="${good}">
                                            <td>
                                                <table width="100%" cellpadding="0" cellspacing="0"
                                                       border="0">
                                                    <tr>
                                                        <td sytle="height:60px;">
                                                            <dl
                                                                    style="width: 100%; height: 200px; padding-right: 10px;">
                                                                <dd style="margin-left: 0;">
                                                                    <a
                                                                            href="${pageContext.request.contextPath}/goodDetail?id=${gd.goodsId}">
                                                                        <img width="105" height="110"
                                                                             src="${pageContext.request.contextPath}/${gd.goodsPic}"/>
                                                                    </a>
                                                                </dd>
                                                                <dt style="margin-left: 0; width: 90%">
                                                                    <a
                                                                            href="${pageContext.request.contextPath}/goodDetail?id=${gd.goodsId}">
                                                                        <font size="2"> ${gd.goodsName } </font>
                                                                    </a>
                                                                </dt>
                                                                <dt>
                                                                    <font size="2">￥: ${gd.mallPrice }</font>
                                                                </dt>
                                                            </dl>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </c:forEach>
                                    </tr>
                                    <tr>
                                        <c:forEach var="gd" items="${good1}">
                                            <td>
                                                <table width="100%" cellpadding="0" cellspacing="0"
                                                       border="0">
                                                    <tr>
                                                        <td sytle="height:60px;">
                                                            <dl
                                                                    style="width: 100%; height: 200px; padding-right: 10px;">
                                                                <dd style="margin-left: 0;">
                                                                    <a
                                                                            href="${pageContext.request.contextPath}/goodDetail?id=${gd.goodsId}">
                                                                        <img width="105" height="110"
                                                                             src="${pageContext.request.contextPath}/${gd.goodsPic}"/>
                                                                    </a>
                                                                </dd>
                                                                <dt style="margin-left: 0; width: 90%">
                                                                    <a
                                                                            href="${pageContext.request.contextPath}/goodDetail?id=${gd.goodsId}">
                                                                        <font size="2"> ${gd.goodsName } </font>
                                                                    </a>
                                                                </dt>
                                                                <dt>
                                                                    <font size="2">￥: ${gd.mallPrice }</font>
                                                                </dt>
                                                            </dl>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </c:forEach>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 右边的用户登录。-->
            <div class="page_other_msg right">
                <div class="left_row">
                    <div class="list">
                        <div class="list_bar">用户登录</div>
                        <div class="list_content">
                            <div id="div">
                                <!-- 包含登录页面 -->
                                <jsp:include flush="true" page="userinfo/userlogin.jsp"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="left_row">
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="list pic_news" style="width: 1000px">
                <div class="list_bar" style="width: 1000px">
                    <span style="float: left">新品上市</span> <span style="float: right">
						<a href="${pageContext.request.contextPath}/goodsByKeyword">更多</a>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                </div>
                <div id="tw" class="list_content" style="width: 989px;height: 390px">
                    <div style="width: 100%; overflow: hidden; white-space: nowrap;">
                        <table width="100%" align="left" cellpadding="0" cellspacing="0"
                               border="0">
                            <tr>
                                <c:forEach var="gd" items="${good}">
                                    <td>
                                        <table width="100%" cellpadding="0" cellspacing="0"
                                               border="0">
                                            <tr>
                                                <td sytle="height:60px;">
                                                    <dl
                                                            style="width: 100%; height: 200px; padding-right: 10px;">
                                                        <dd style="margin-left: 0;">
                                                            <a
                                                                    href="${pageContext.request.contextPath}/goodDetail?id=${gd.goodsId}">
                                                                <img width="105" height="110"
                                                                     src="${pageContext.request.contextPath}/${gd.goodsPic}"/>
                                                            </a>
                                                        </dd>
                                                        <dt style="margin-left: 0; width: 90%">
                                                            <a
                                                                    href="${pageContext.request.contextPath}/goodDetail?id=${gd.goodsId}">
                                                                <font size="2"> ${gd.goodsName } </font>
                                                            </a>
                                                        </dt>
                                                        <dt>
                                                            <font size="2">￥: ${gd.mallPrice }</font>
                                                        </dt>
                                                    </dl>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </c:forEach>
                            </tr>
                            <tr>
                                <c:forEach var="gd" items="${good1}">
                                    <td>
                                        <table width="100%" cellpadding="0" cellspacing="0"
                                               border="0">
                                            <tr>
                                                <td sytle="height:60px;">
                                                    <dl
                                                            style="width: 100%; height: 200px; padding-right: 10px;">
                                                        <dd style="margin-left: 0;">
                                                            <a
                                                                    href="${pageContext.request.contextPath}/goodDetail?id=${gd.goodsId}">
                                                                <img width="105" height="110"
                                                                     src="${pageContext.request.contextPath}/${gd.goodsPic}"/>
                                                            </a>
                                                        </dd>
                                                        <dt style="margin-left: 0; width: 90%">
                                                            <a
                                                                    href="${pageContext.request.contextPath}/goodDetail?id=${gd.goodsId}">
                                                                <font size="2"> ${gd.goodsName } </font>
                                                            </a>
                                                        </dt>
                                                        <dt>
                                                            <font size="2">￥: ${gd.mallPrice }</font>
                                                        </dt>
                                                    </dl>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </c:forEach>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
    <div style="clear: both"></div>
    <!-- 右边的用户登录。-->
</div>


<!-- 包含尾部页面 -->

<jsp:include flush="true" page="inc/incFoot.jsp"/>

</body>
</html>