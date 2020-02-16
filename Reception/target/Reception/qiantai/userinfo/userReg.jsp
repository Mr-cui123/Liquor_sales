<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base target="_self"/>
    <meta http-equiv="pragma" content="no-cache"/>
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
    <meta http-equiv="description" content="This is my page"/>
    <link href="${pageContext.request.contextPath}/css/layout.css"
          type="text/css" rel="stylesheet"/>
    <script language="javascript">
        function closeOpen() {
            window.history.back(-1);
        }

        function check1() {
            var username=document.getElementById("userName").value;
            var userPwd=document.getElementById("userPwd").value;
            var userPw1=document.getElementById("userPw1").value;
            var userRealname=document.getElementById("userRealname").value;
            var userAddress=document.getElementById("userAddress").value;
            var userTel=document.getElementById("userTel").value;
            var userEmail=document.getElementById("userEmail").value;
            var userQq=document.getElementById("userQq").value;
            var nameMessage=document.getElementById("nameMessage");
            if (!/^[a-zA-Z0-9_-]{4,16}$/gi.test(username)) {
                nameMessage.style.display="block";
                return false;
            }else{
                nameMessage.style.display="none";
            }
            var pwdMessage=document.getElementById("pwdMessage");
            if (!/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$/gi.test(userPwd)) {
                pwdMessage.style.display="block";
                return false;
            }else{
                pwdMessage.style.display="none";
            }
            var repwdMessage=document.getElementById("repwdMessage");
            if (userPwd !==userPw1) {
                alert("1111");
                repwdMessage.style.display="block";
                return false;
            }else{
                repwdMessage.style.display="none";
            }
            var realnameMessage=document.getElementById("realnameMessage");
            if (!/[\u4E00-\u9FA5]/gi.test(userRealname)) {
                realnameMessage.style.display="block";
                return false;
            }else{
                realnameMessage.style.display="none";
            }
            var addressMessage=document.getElementById("addressMessage");
            if (!/[\u4E00-\u9FA5]/gi.test(userAddress)) {
                addressMessage.style.display="block";
                return false;
            }else{
                addressMessage.style.display="none";
            }

            var telMessage=document.getElementById("telMessage");
            if (!/^1[34578]\d{9}$/gi.test(userTel)) {
                telMessage.style.display="block";
                return false;
            }else{
                telMessage.style.display="none";
            }
            var emailMessage=document.getElementById("emailMessage");
            if (!/^\w+@[a-z0-9]+\.[a-z]{2,4}$/gi.test(userEmail)) {
                emailMessage.style.display="block";
                return false;
            }else{
                emailMessage.style.display="none";
            }
            var qqMessage=document.getElementById("qqMessage");
            if (!/^[1-9][0-9]{4,11}$/gi.test(userQq)) {
                qqMessage.style.display="block";
                return false;
            }else{
                qqMessage.style.display="none";
            }
            //提交表单
            document.form1.submit();
        }
    </script>
    <style type="text/css">
        .hiddenMessage{
            color: red;
            position: absolute;
            left: 1030px;
            display: none;
        }
    </style>
    <title>小酒窝-个人账户注册</title>
</head>
<body>
<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"/>
<div class="page_row" style="border: #AFAFAF 1px solid; margin-left: 257px;">
    <div class="list_bar">用户注册</div>
    <form action="${pageContext.request.contextPath}/addUser" name="form1" method="post">
        <table width="100%" align="center" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC" style="border: 1px solid #AFAFAF">
            <tr>
                <td width="35%" height="40" align="right" bgcolor="#FFFFFF" style="font-size: 13px;">
                    用户名：
                </td>
                <td width="65%" bgcolor="#FFFFFF">
                    &nbsp;
                    <input type="text" name="userName" id="userName" placeholder="字母或字母+数字" style="text-indent: 10px;width: 55%;height: 30px;border-radius: 5px;border: 1px solid #AFAFAF;margin-right: 250px"/>
                    <div class="hiddenMessage" id="nameMessage" style="position: absolute;top: 350px">用户名未填或者格式不正确</div>
                </td>
            </tr>
            <tr>
                <td height="40" align="right" bgcolor="#FFFFFF" style="font-size: 13px;">
                    密 码：
                </td>
                <td bgcolor="#FFFFFF">
                    &nbsp;
                    <input type="password" name="userPwd" id="userPwd" placeholder="包含大小写字母及数字，不低于6位" style="text-indent: 10px;width: 55%;height: 30px;border-radius: 5px;border: 1px solid #AFAFAF;margin-right: 250px"/>
                    <div class="hiddenMessage" id="pwdMessage" style="position: absolute;top: 390px">密码未填或者格式不正确</div>
                </td>
            </tr>
            <tr>
                <td height="40" align="right" bgcolor="#FFFFFF" style="font-size: 13px;">
                    密码确认：
                </td>
                <td bgcolor="#FFFFFF">
                    &nbsp;
                    <input type="password" name="userPw1" id="userPw1" placeholder="请再次输入密码" style="text-indent: 10px;width: 55%;height: 30px;border-radius: 5px;border: 1px solid #AFAFAF;margin-right: 250px"/>
                    <div class="hiddenMessage" id="repwdMessage" style="position: absolute;top: 430px">密码两次输入不一致</div>
                </td>
            </tr>
            <tr>
                <td height="40" align="right" bgcolor="#FFFFFF" style="font-size: 13px;">
                    真实姓名：
                </td>
                <td bgcolor="#FFFFFF">
                    &nbsp;
                    <input type="text" name="userRealname" id="userRealname" placeholder="请输入姓名" style="text-indent: 10px;width: 55%;height: 30px;border-radius: 5px;border: 1px solid #AFAFAF;margin-right: 250px"/>
                    <div class="hiddenMessage" id="realnameMessage" style="position: absolute;top: 470px">姓名未填或者格式不正确</div>
                </td>
            </tr>
            <tr>
                <td height="40" align="right" bgcolor="#FFFFFF" style="font-size: 13px;">
                    地址：
                </td>
                <td bgcolor="#FFFFFF">
                    &nbsp;
                    <input type="text" name="userAddress" id="userAddress" placeholder="请填写地址" style="text-indent: 10px;width: 55%;height: 30px;border-radius: 5px;border: 1px solid #AFAFAF;margin-right: 250px"/>
                    <div class="hiddenMessage" id="addressMessage" style="position: absolute;top: 510px">地址未填或者格式不正确</div>
                </td>
            </tr>
            <tr>
                <td height="40" align="right" bgcolor="#FFFFFF" style="font-size: 13px;">
                    性别：
                </td>
                <td bgcolor="#FFFFFF" style="text-align: left;padding-left: 20px">
                    &nbsp;
                    <input type="radio" name="userSex" value="男" checked="checked"/>男
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="userSex" value="女"/>女
                </td>
            </tr>
            <tr>
                <td height="40" align="right" bgcolor="#FFFFFF" style="font-size: 13px;">
                    电话：
                </td>
                <td bgcolor="#FFFFFF">
                    &nbsp;
                    <input type="text" name="userTel" id="userTel" placeholder="11位手机号码" style="text-indent: 10px;width: 55%;height: 30px;border-radius: 5px;border: 1px solid #AFAFAF;margin-right: 250px"/>
                    <div class="hiddenMessage" id="telMessage" style="position: absolute;top: 590px">电话未填或者格式不正确</div>
                </td>
            </tr>
            <tr>
                <td height="40" align="right" bgcolor="#FFFFFF" style="font-size: 13px;">
                    E-mail：
                </td>
                <td bgcolor="#FFFFFF">
                    &nbsp;
                    <input type="text" name="userEmail" id="userEmail" placeholder="请填写邮箱" style="text-indent: 10px;width: 55%;height: 30px;border-radius: 5px;border: 1px solid #AFAFAF;margin-right: 250px"/>
                    <div class="hiddenMessage" id="emailMessage" style="position: absolute;top: 630px">邮箱未填或者格式不正确</div>
                </td>
            </tr>
            <tr>
                <td height="40" align="right" bgcolor="#FFFFFF" style="font-size: 13px;">
                    QQ：
                </td>
                <td bgcolor="#FFFFFF">
                    &nbsp;
                    <input type="text" name="userQq" id="userQq" placeholder="请填写QQ号码" style="text-indent: 10px;width: 55%;height: 30px;border-radius: 5px;border: 1px solid #AFAFAF;margin-right: 250px"/>
                    <div class="hiddenMessage" id="qqMessage" style="position: absolute;top: 670px">QQ未填或者格式不正确</div>
                </td>
            </tr>
            <tr>
                <td height="40" align="right" bgcolor="#FFFFFF">
                    &nbsp;
                </td>
                <td bgcolor="#FFFFFF" style="text-align: left;padding-left: 70px">
                    &nbsp;
                    <input type="button" value="注册" onclick="check1();" style="width: 80px;height: 30px"/>
                    <input type="button" value="取消" onclick="closeOpen()" style="width: 80px;height: 30px;"/>
                </td>
            </tr>
        </table>
    </form>
</div>
<div>
    <jsp:include page="/qiantai/inc/incFoot.jsp" flush="true"/>
</div>
</body>
</html>
