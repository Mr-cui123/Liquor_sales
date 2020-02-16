<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/pintuer.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/admin.css">
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/pintuer.js"></script>
    <script type="text/javascript">
        setTimeout(function () {
            var ro = document.getElementById("error");
                ro.style.display = 'block';
            setTimeout(function () {
                ro.style.display = 'none';
            },4000)
        },0);

        function sub1() {
            var pwd=document.getElementById("pass").value;
            var frm=document.getElementById("from111");
            if (pwd==${sessionScope.admin.userpwd}) {
                frm.setAttribute("target","_parent")
            }
            frm.submit();
        }
    </script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head">
        <strong><span class="icon-key"></span> 修改账户密码</strong>
    </div>
    <div class="body-content">
        <form method="post" id="from111" class="form-x" action="${pageContext.request.contextPath}/updatePassword">
            <div class="form-group">
                <input type="hidden" name="userid" value="">
                <div>
                    <label style="margin-left: 150px;font-weight: bolder;">管理员帐号：${sessionScope.admin.username} &nbsp;&nbsp;<span id="error" style="color:red;display: none;margin-left: 150px">${errorMsg}</span>
                         </label>
                    <input type="hidden" name="username" value="${sessionScope.admin.username}">
                </div>
                <div class="field">
                    <label style="line-height:33px;">

                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>原始密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" id="pass" name="userpwd" size="50" placeholder="请输入原始密码"
                           data-validate="required:请输入原始密码"/>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>新密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" name="newpass" size="50" placeholder="请输入新密码"
                           data-validate="required:请输入新密码,length#>=5:新密码不能小于5位"/>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>确认新密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" name="rnewpass" size="50" placeholder="请再次输入新密码"
                           data-validate="required:请再次输入新密码,repeat#newpass:两次输入的密码不一致"/>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <!-- 可以在这里给出修改成功或失败的提示 -->
                    <%--回显错误消息--%>
                    <button class="button bg-main icon-check-square-o" type="button" onclick="sub1()"> 提交</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>