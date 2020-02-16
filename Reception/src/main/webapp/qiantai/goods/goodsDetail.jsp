<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 引入格式化标签库 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/layout.css" type="text/css" rel="stylesheet"/>

    <script language="JavaScript" src="${pageContext.request.contextPath}/js/public.js" type="text/javascript"></script>
    <!-- 引入jQuery库文件 -->
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script>
        function buy1() {
            // 判断用户是否登录了，如果没有登录，提示他去登录
            <c:if  test="${empty user}">
            alert("请去右边的登录板块去登录，登录后才能买宝贝！");
            return;
            </c:if>
            var num = document.getElementById("num").value;
            var stockNum =${good.stockNum};
            if (stockNum >= num) {
                //用户已登录且购买数量小于库存数量，允许表单提交
                $('#buyForm').submit();
            } else {
                setTimeout(
                    function lose() {
                        var lo = document.getElementById("lose1");
                        // var c = document.getElementById("click");
                        if (lo != null) {
                            lo.style.display = "block";
                            setTimeout(function () {
                                    lo.style.display = "none";
                                }, 2000
                            )
                        }
                    }, 0
                )
            }
        }

        function gotoBack(pageNum) {
            if (pageNum != 0) {
                location.href = "${pageContext.request.contextPath}/goodsByKeyword?pageNum=" + pageNum;
            } else {
                location.href = "${pageContext.request.contextPath}/index.jsp";
            }
        }

        setTimeout(
            function lose() {
                var lo = document.getElementById("lose2");
                var c = document.getElementById("click");
                if (c != null) {
                    lo.style.display = "block";
                    setTimeout(function () {
                            lo.style.display = "none";
                        }, 2000
                    )
                }
            }, 0
        )

    </script>
</head>

<body>
<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"/>
<c:if test="${display eq 1}">
<a href="javascript:void(0)" id="click" onclick="lose()"></a>
</c:if>
<div id="lose1" style="width: 200px;height:40px;background-color: red;position: absolute;z-index: 9999;
margin-left: 650px;margin-top: 300px;display: none"><span
        style="line-height: 40px;font-weight: bold">商品库存不足,请修改购买数量</span>
</div>
<div id="lose2" style="width: 200px;height:40px;background-color: greenyellow;position: absolute;z-index: 9999;
margin-left: 650px;margin-top: 300px;display: none"><span
        style="line-height: 40px;font-weight: bold">已成功加入购物车</span>
</div>
<div class="page_row" style="border: #AFAFAF 1px solid;margin-left: 257px">
    <div class="list pic_news" style="width: 1000px">
        <div class="list_bar">&nbsp;详情</div>
        <form action="${pageContext.request.contextPath}/addToCar" method="post" name="buy" id="buyForm">
            <center>
                <table border="0" cellpadding="6">
                    <tr>
                        <td width="30"></td>
                        <td style="font-size: 13px;">商品名：</td>
                        <td style="font-size: 13px;">${good.goodsName }</td>
                    </tr>
                    <tr>
                        <td width="30"></td>
                        <td style="font-size: 13px;">简介：</td>
                        <td style="font-size: 13px;">${good.goodsMiaoshu }</td>
                    </tr>
                    <tr>
                        <td width="30"></td>
                        <td style="font-size: 13px;">市场价：</td>
                        <td style="font-size: 13px;">${good.marketPrice }</td>
                    </tr>
                    <tr>
                        <td width="30"></td>
                        <td style="font-size: 13px;">商城价：</td>
                        <td style="font-size: 13px;color:red">${good.mallPrice }</td>
                    </tr>
                    <tr>
                        <td width="30"></td>
                        <td style="font-size: 13px;">图片：</td>
                        <td style="font-size: 13px;"><img width="140px" height="140px"
                                                          src="${pageContext.request.contextPath }/${good.goodsPic}"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="30"></td>
                        <td style="font-size: 13px;">产地：</td>
                        <td style="font-size: 13px;">${good.goodsAddress }</td>
                    </tr>
                    <tr>
                        <td width="30"></td>
                        <td style="font-size: 13px;">
                            上市时间：
                        </td>
                        <td style="font-size: 13px;">
                            <%--使用格式化标签将日期值格式化成年月日形式--%>
                            <fmt:formatDate value="${good.enterDate}" pattern="yyyy-MM-dd"/>
                        </td>
                    </tr>


                    <tr>
                        <td width="30"></td>
                        <td style="font-size: 13px;">购买数量：</td>
                        <td style="font-size: 11px;"><input type="text" id="num" name="quantity" value="1" size="2"
                                                            onkeyup="this.value=this.value.replace(/\D/g,'')"
                                                            onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="30"></td>
                        <td style="font-size: 11px;">
                            <!-- 隐藏域，保存当前商品的编号，传到购物车页面上 -->
                            <input type="hidden" name="goodsId" value="${good.goodsId }"/>
                            <!--隐藏域，保存商品名称 -->
                            <input type="hidden" name="goodsName" value="${good.goodsName }"/>
                            <!--隐藏域，保存商品价格 -->
                            <input type="hidden" name="goodsPrice" value="${good.mallPrice }"/>
                            <a href="javascript:void(0)" onclick="buy1()"><img
                                    src="${pageContext.request.contextPath}/images/icon_buy.gif"/></a></td>
                        <td><input type="button" value="返回" onclick="gotoBack(${pageNum})"></td>
                    </tr>
                </table>
            </center>
        </form>
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
