<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title>登录</title>
    <%String path = request.getContextPath();%>
    <link rel="stylesheet" href="<%=path%>/css/pintuer.css">
    <link rel="stylesheet" href="<%=path%>/css/admin.css">
    <script src="<%=path%>/js/jquery.js"></script>
    <script src="<%=path%>/js/pintuer.js"></script>
</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom"></div>
            <form action="login" method="post">
                <div class="panel loginbox">
                    <div class="text-center margin-big padding-big-top">
                        <img src="<%=path%>/images/20191215132110105.jpg"
                             style="width: 50px;height: 40px;position: relative;top: 40px;left: -130px">
                        <h1 style="color: #FFFFFF;margin-left: 80px;">小酒窝后台管理系统</h1>
                    </div>
                    <div class="panel-body"
                         style="padding:30px; padding-bottom:10px; padding-top:10px;">
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="text" class="input input-big" name="username"
                                       placeholder="登录账号"
                                /> <span
                                    data-validate="required:请填写账号"
                                    class="icon icon-user margin-small"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="password" class="input input-big" name="userpwd"
                                       placeholder="登录密码"
                                /> <span
                                    data-validate="required:请填写密码"
                                    class="icon icon-key margin-small"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field">
                                <input type="text" class="input input-big" name="code"
                                       placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码"/>
                                <img src="authCode" alt="" width="100" height="32"
                                     class="passcode" style="height:43px;cursor:pointer;"
                                     onclick="this.src=this.src+'?'">
                            </div>
                            <%--回显错误信息--%>
                            <span style="color:red">${errorMsg}</span>
                        </div>
                    </div>
                    <div style="padding:30px;">

                        <input type="submit"
                               class="button button-block bg-main text-big input-big"
                               value="登录">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>