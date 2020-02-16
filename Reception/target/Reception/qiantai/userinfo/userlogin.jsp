<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@  taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
	<script type="text/javascript">
	        function reg()
	        {
	                location.href="${pageContext.request.contextPath}/qiantai/userinfo/userReg.jsp";
	        }
	         //点登录按钮后调用login函数
	        function login()
	        {
	            var name=document.getElementById("userName").value;
	            var pwd=document.getElementById("userPw").value;
	            var login=document.getElementById("userLogin");
	           //验证用户名是否为空，为空就return
	            if(name==""){
	            	alert("用户名不能为空");
	            	return;
	            }
	            //验证密码是否为空，为空就return
	            if(pwd==""){
	            	alert("密码不能为空");
	            	return;
	            }
	            //提交表单
	            login.submit();
	        }
	         //安全退出
	         function logOut(){
	        	      //弹出一个是否确认退出的对话框
	        	  var flag=    confirm("是否真的要退出");
	        	     if(flag){
	        	    	  //请求后台logout.action，实现安全退出 
	        	    	  location.href="${pageContext.request.contextPath}/logout";
	        	     }
	         }
	     
	</script>
        <c:choose>
             <c:when test="${empty sessionScope.user }">
                  	<form action="${pageContext.request.contextPath}/userLogin" name="userLogin" id="userLogin" method="post">
			      <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
			          <tr>
			            <td align="center" colspan="2" height="10"></td>
			          </tr>
			          <tr>
			            <td align="right" width="30%" height="30" style="font-size: 11px;">用户名：</td>
			            <td align="left" width="69%"><input class="input" id="userName" title="用户名不能为空" size="16" name="userName" type="text" /></td>
			          </tr>
			          <tr>
			            <td align="right" height="30" style="font-size: 11px;">密　码：</td>
			            <td align="left"><input class="input" title="密码不能为空" type="password" size="16" id="userPw" name="userPwd"/></td>
			          </tr>
			          <tr>
			            <td align="center" colspan="2" height="10"><font color="red"></font></td>
			          </tr>
			          <tr>
			            <td align="center" colspan="2" height="30">
			               
			               <input type="button" value="登  录" onclick="login()" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;" />
						   &nbsp;
						   <input type="button" value="注  册" onclick="reg()" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;" />
			            </td>
			          </tr>
			      </table>
		    </form>
             </c:when>
             <c:otherwise>
                     欢迎您：${sessionScope.user.userName } &nbsp;&nbsp;&nbsp;&nbsp;
			    <a href="javascript:void(0)" onclick="logOut()">安全退出</a> &nbsp;&nbsp;&nbsp;&nbsp;
			    <br/><br/><br/>
             </c:otherwise>
        </c:choose>
     
			
		