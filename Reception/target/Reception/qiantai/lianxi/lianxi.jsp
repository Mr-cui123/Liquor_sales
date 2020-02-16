<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="${pageContext.request.contextPath}/css/layout.css" type="text/css" rel="stylesheet"/>

    <script language="JavaScript" src="${pageContext.request.contextPath}/js/public.js"
            type="text/javascript"></script>
    <script type="text/javascript">

    </script>
    <title>小酒窝-前台销售系统</title>
</head>

<body>
<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"/>
<div class="page_row" style="border: #AFAFAF 1px solid;margin-left: 257px">
    <div class="list pic_news" style="width: 1000px">
        <div class="list_bar">&nbsp;联系我们</div>
        <div class="ctitle ctitle1">联系方式</div>
        <div class="ctitleinfo"></div>
        <center>
            <div class="pbox" style="font-size: 15px;width: 180px">
                小酒窝网上销售系统 <br><br> 电话：17371413283<br><br> 联系人：小崔先生 <br><br>
                邮编：000000<br><br>
            </div>
        </center>
        <div class="page_no">
            <div class="pg-3">
                <%--分页--%>
            </div>
        </div>
        <div class="arti_ref"></div>
    </div>
</div>
<div style="clear: both"></div>

<div>
    <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"/>
</div>
</body>
</html>
