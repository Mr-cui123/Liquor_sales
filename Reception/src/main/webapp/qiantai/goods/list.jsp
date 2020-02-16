<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!-- 导入核心标签库 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="${pageContext.request.contextPath}/css/layout.css"
          type="text/css" rel="stylesheet"/>

    <script language="JavaScript"
            src="${pageContext.request.contextPath}/js/public.js"
            type="text/javascript"></script>

    <!-- 引入jQuery库文件 -->
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript">
        function buy1(id, name, price, num) {
            <c:choose>
            <c:when test="${empty sessionScope.user}">
            alert("请去右边的登录板块去登录，登录后才能买宝贝！");
            </c:when>
            <c:otherwise>
            location.href = "addToCar?goodsId=" + id + "&goodsName=" + name + "&goodsPrice=" + price + "&pageNum=" + num;
            </c:otherwise>
            </c:choose>
        }

        setTimeout(function () {
            var car1 = document.getElementById("addcar1");
            var car2 = document.getElementById("addcar2");
            if (car1 != null) {
                car1.style.display = 'none';
                car2.style.display = 'block';
            }
        }, 2000)
    </script>
    <style type="text/css">

    </style>
    <title>小酒窝-前台销售系统</title>
</head>

<body>
<div id="top">
    <jsp:include flush="true" page="/qiantai/inc/incTop.jsp"/>
</div>
<div class="page_row" style="border: #AFAFAF 1px solid;margin-left: 257px">
    <!--左边的 -->
    <div class="list pic_news" style="width: 1000px">
        <div class="list_bar">&nbsp;所有商品</div>
        <c:choose>
            <c:when test="${empty pageInfo.list }">
                <h2>当前没有任何商品</h2>
            </c:when>
            <c:otherwise>
                <table width="100%" border="0" cellpadding="2" cellspacing="1"
                       bgcolor="#FFFFFF" align="center" style="margin-top:8px">
                    <tr align="center" bgcolor="#FAFAF1" height="22">
                        <td>商品名称</td>
                        <td>商城价</td>
                        <td>商品图片</td>
                        <td>状态</td>
                        <td>操作</td>
                    </tr>
                    <c:forEach var="gd" items="${pageInfo.list }">
                        <tr align='center' bgcolor="#FFFFFF" height="22">
                            <td width="20%">${gd.goodsName }</td>
                            <td width="10%">￥${gd.mallPrice } <br/></td>
                            <td width="15%"><a
                                    href="${pageContext.request.contextPath}/goodDetail?id=${gd.goodsId}&pageNum=${pageInfo.pageNum}">
                                <img
                                        src="${pageContext.request.contextPath}/${gd.goodsPic}"
                                        width="60" height="60" border="0"/>
                            </a></td>
                            <td width="25%">
                                <c:choose>
                                    <c:when test="${sessionScope.name eq gd.goodsName}">
                                        <c:choose>
                                            <c:when test="${grow eq 0}">
                                                <div id="addcar1"><span
                                                        style="color: red;font-size: 12px">【已加入到购物车】</span></div>
                                                <div id="addcar2" style="display: none">
                                                    <c:choose>
                                                        <c:when test="${gd.stockNum gt 20}">
                                                            <span style="font-size: 12px">库存充足</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span style="font-size: 12px;color: red">仅存${gd.stockNum}件</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <c:choose>
                                                    <c:when test="${gd.stockNum gt 20}">
                                                        库存充足
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span style="color: red;font-size: 12px">仅存${gd.stockNum}件</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <c:when test="${gd.stockNum gt 20}">
                                                库存充足
                                            </c:when>
                                            <c:otherwise>
                                                <span style="color: red">仅存${gd.stockNum}件</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td width="20%"><a
                                    href="#"
                                    onclick="buy1(${gd.goodsId},'${gd.goodsName}',${gd.mallPrice},${pageInfo.pageNum})"><img
                                    alt=""
                                    src="${pageContext.request.contextPath}/images/icon_buy.gif"
                                    border=0/></a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <br>
                当前第<font color="red">${pageInfo.pageNum}</font>页，每页<font color="red">${pageInfo.pageSize}</font>条/共<font
                color="red">${pageInfo.total }</font>条记录&nbsp;&nbsp;
                <!-- 当前页号>1时，给用户提供上一页超链接；否则直接显示“上一页” -->
                <c:choose>
                    <c:when test="${pageInfo.pageNum gt 1}">
                        <a href="javascript:void(0)"
                           onclick="changePageNum(1)">首页</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="javascript:void(0)"
                           onclick="changePageNum(${pageInfo.pageNum-1})">上一页</a>
                    </c:when>
                    <c:otherwise>首页&nbsp;&nbsp;&nbsp;&nbsp;上一页</c:otherwise>
                </c:choose>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <!-- 遍历所有的页号 -->
                <c:forEach var="sn" items="${pageInfo.navigatepageNums}">
                    <c:choose>
                        <c:when test="${pageInfo.pageNum eq sn}">
                            <a href="javascript:void(0)" onclick="changePageNum(${sn})" style="color: red">${sn}</a>&nbsp;&nbsp;
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:void(0)" onclick="changePageNum(${sn})">${sn}</a>&nbsp;&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <!-- 当前页号<总页数时，给用户提供下一页超链接；否则直接显示“下一页” -->
                <c:choose>
                    <c:when test="${pageInfo.pageNum lt pageInfo.pages}">
                        <a href="javascript:void(0)"
                           onclick="changePageNum(${pageInfo.pageNum+1})">下一页</a>
                        <!-- 尾页 -->
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="javascript:void(0)"
                           onclick="changePageNum(${pageInfo.pages})">尾页</a>
                    </c:when>
                    <c:otherwise>下一页&nbsp;&nbsp;&nbsp;&nbsp;尾页</c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<div style="clear: both"></div>

</div>

<div>
    <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"/>
</div>

<script>
    // 点击超链接的单击事件调用的函数，参数是要查询的页号
    function changePageNum(num) {
        location.href = "goodsByKeyword?pageNum=" + num;
    }
</script>
</body>
</html>
