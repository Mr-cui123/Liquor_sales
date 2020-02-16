<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

    <link href="${pageContext.request.contextPath}/css/layout.css"
          type="text/css" rel="stylesheet"/>

    <script language="JavaScript"
            src="${pageContext.request.contextPath}/js/public.js"
            type="text/javascript"></script>
    <script type="text/javascript">
        function back1() {
            window.history.go(-1);
        }

        function tijiao() {
            var o = document.getElementById("f");
            o.submit();
        }

        function displayInput() {
            var Pay=document.getElementById("Pay");
            var flag=Pay.options[Pay.selectedIndex].value;
            var bankNum=document.getElementById("bankNum");
            var bankPwd=document.getElementById("bankPwd");
            if (flag=='在线支付'){
                bankNum.style.display="";
                bankPwd.style.display="";
            } else {
                bankNum.style.display="none";
                bankPwd.style.display="none";
            }
        }

        setTimeout(
            function lose() {
                var lo = document.getElementById("lose1");
                var c = document.getElementById("click");
                if (c != null) {
                    lo.style.display = "block";
                    setTimeout(function () {
                        lo.style.display = "none";
                    }, 2000)
                }
            }, 0)
    </script>
</head>

<body>
<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"/>
<c:if test="${error eq 1}">
    <a href="javascript:void(0)" id="click" onclick="lose()"></a>
</c:if>
<div id="lose1" style="width: 200px;height:40px;background-color: red;position: absolute;z-index: 9999;
margin-left: 700px;margin-top: 150px;display: none">
    <c:choose>
        <c:when test="${zhuangtai eq 1}">
            <span style="line-height: 40px;font-weight: bold">会员卡号或密码错误</span>
        </c:when>
        <c:otherwise>
            <span style="line-height: 40px;font-weight: bold">您的余额不足，请前往充值</span>
        </c:otherwise>
    </c:choose>
</div>
<div class="page_row" style="border: #AFAFAF 1px solid;margin-left: 257px">
            <div class="list pic_news"  style="width: 1000px">
                <div class="list_bar">&nbsp;订单确认</div>
                <form
                        action="${pageContext.request.contextPath}/addOrder"
                        id="f" method="post">
                    <table width="99%" border="0" cellpadding="2" cellspacing="1"
                           bgcolor="#FFFFFF" align="center" style="margin-top:8px">
                        <tr bgcolor="#FFFFFF">
                            <td width="40%" height="40" style="font-size: 13px"  align='right'>收货人帐号：</td>
                            <td width="60%"><input type="text" readonly="readonly"
                                       value="${sessionScope.user.userName }" style="text-indent: 10px;width: 55%;height: 30px;border-radius: 5px;border: 1px solid #AFAFAF;margin-right: 250px"/></td>
                        </tr>
                        <tr   bgcolor="#FFFFFF">
                            <td height="40" style="font-size: 13px" align='right'>收货人姓名：</td>
                            <td><input type="text" readonly="readonly"
                                       value="${sessionScope.user.userRealname }" style="text-indent: 10px;width: 55%;height: 30px;border-radius: 5px;border: 1px solid #AFAFAF;margin-right: 250px"/></td>
                        </tr>
                        <tr   bgcolor="#FFFFFF">
                            <td height="40" style="font-size: 13px" align='right'>收货人联系电话：</td>
                            <td><input type="text" value="${sessionScope.user.userTel }" style="text-indent: 10px;width: 55%;height: 30px;border-radius: 5px;border: 1px solid #AFAFAF;margin-right: 250px"/></td>
                        </tr>

                        <tr   bgcolor="#FFFFFF">
                            <td height="40" style="font-size: 13px" align='right'>收货地址：</td>
                            <td><input type="text" name="orderAddress"
                                       value="${sessionScope.user.userAddress }" style="text-indent: 10px;width: 55%;height: 30px;border-radius: 5px;border: 1px solid #AFAFAF;margin-right: 250px"/></td>
                            <%--隐藏域，发货状态--%>
                            <input type="hidden" name="orderZhuangtai"
                                       value="0"/>
                        </tr>
                        <tr   bgcolor="#FFFFFF">
                            <td height="40" style="font-size: 13px" align='right'>付款方式(推荐在线支付)：</td>
                            <td><select name="orderPay" id="Pay" onchange="displayInput()" style="text-indent: 10px;width: 55%;height: 30px;border-radius: 5px;border: 1px solid #AFAFAF;margin-right: 250px">
                                <option value="货到付款">货到付款</option>
                                <option value="在线支付">在线支付</option>
                            </select> <!-- 隐藏域，存储订单的总金额，就是购物车的总金额 -->
                                <input type="hidden" name="orderJine" value="${sessionScope.car.totalPrice }"/>
                            </td>
                        </tr>
                        <tr   bgcolor="#FFFFFF" id="bankNum" style="display: none;">
                            <td height="40" width="40%" style="font-size: 13px;" align='right'>会员卡号：</td>
                            <td><input name="bankNum" type="text" style="text-indent: 10px;width: 55%;height: 30px;border-radius: 5px;border: 1px solid #AFAFAF;margin-right: 250px"/></td>
                        </tr>
                        <tr   bgcolor="#FFFFFF" id="bankPwd" style="display: none">
                            <td height="40" style="font-size: 13px" align='right'>支付密码：</td>
                            <td><input name="bankPwd" type="password" style="text-indent: 10px;width: 55%;height: 30px;border-radius: 5px;border: 1px solid #AFAFAF;margin-right: 250px"/></td>
                        </tr>
                    </table>
                    <table border="0" align="center" cellpadding="20">
                        <tr>
                            <td><a href="#" onclick="back1()"><img border="0"
                                                                   src="${pageContext.request.contextPath}/images/Car_icon_back.gif"/></a>
                            </td>
                            <!-- 点击提交订单，将表单提交到后台Servlet -->
                            <td><img border="0"
                                     src="${pageContext.request.contextPath}/images/Car_icon_06.gif"
                                     onclick="tijiao()"/></td>
                        </tr>
                    </table>
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
