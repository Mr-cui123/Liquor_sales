<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            location.href = "${pageContext.request.contextPath}/user?pageNum=" + pageNum;
        }

        function deleteUser(id) {
            var flag=confirm("您确定删除该会员吗？（此操作不可逆）");
            if (flag){
                location.href="${pageContext.request.contextPath}/deleteUser?id="+id;
            }
        }
    </script>
</head>
<style type="text/css">
    #deleteUser:hover{
        color: #FFFFFF;
        background-color: red;
    }
    #deleteUser{
        color: red;
        border: red 1px solid;
    }
</style>
<body>
<div class="panel admin-panel">
    <div class="panel-head">
        <strong class="icon-reorder">前台用户列表</strong>
    </div>
    <table class="table table-hover text-center">
        <tr>
            <th width="10%">用户编号</th>
            <th>用户名</th>
            <th>密码</th>
            <th>姓名</th>
            <th>地址</th>
            <th>性别</th>
            <th>联系电话</th>
            <th>邮箱</th>
            <th>QQ</th>
            <th>操作</th>
        </tr>
        <c:forEach var="user" items="${pageInfo.list}">
            <tr>
                <td>${user.userId}</td>
                <td>${user.userName}</td>
                <td>${user.userPwd}</td>
                <td>${user.userRealname}</td>
                <td>${user.userAddress}</td>
                <td>${user.userSex}</td>
                <td>${user.userTel}</td>
                <td>${user.userEmail}</td>
                <td>${user.userQq}</td>
                <td><a class="button" href="#"  id="deleteUser" onclick="deleteUser(${user.userId})"><span
                        class="icon-align-center"></span>删除会员</a></td>
            </tr>
        </c:forEach>

        <tr>
            <td colspan="80">
                <div class="pagelist">
                    <c:choose>
                        <c:when test="${pageInfo.pageNum eq 1}">
                            <a class="nocls">首页</a><a class="nocls">上一页</a>
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:void(0)" onclick="onpageNum(1)">首页</a>
                            <a href="javascript:void(0)" onclick="onpageNum(${pageInfo.pageNum-1})">上一页</a>
                        </c:otherwise>
                    </c:choose>
                    <c:forEach var="sn" begin="1" end="${pageInfo.pages}">
                        <c:choose>
                            <c:when test="${sn eq pageInfo.pageNum}">
                                <!-- 当前页显示在span里面,其它页点击后跳转页面 -->
                                </a> <span class="current">${sn}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="javascript:void(0)" onclick="onpageNum(${sn})">${sn}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${pageInfo.pageNum eq pageInfo.pages}">
                            <a class="nocls">下一页</a><a class="nocls">尾页</a>
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:void(0)" onclick="onpageNum(${pageInfo.pageNum+1})">下一页</a>
                            <a href="javascript:void(0)" onclick="onpageNum(${pageInfo.pages})">尾页</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </td>
        </tr>
    </table>
</div>
</body>
</html>