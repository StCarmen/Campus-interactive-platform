<%@page import="Bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//获取项目根地址
	String basePath = request.getContextPath();
	//将根地址假如页面级变量方便之后通过EL表达式调用
	pageContext.setAttribute("basePath", basePath);
	//通过session中的user获取登录状态
	User user = (User)session.getAttribute("user");
	
	//也把变量放入pageContext 方便使用EL表达式
	pageContext.setAttribute("user", user);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>显示登录状态的页面</title>

<!-- 引入前端框架jquery -->
<script src="${basePath}/static/js/jquery-3.3.1.js"></script>
<script>
function login(){
	var basePath = '<%=basePath%>'
	location.href=basePath+"/login.jsp";
}
function exit(){
	var basePath = '<%=basePath%>'
	$.post(basePath+'/UserAction',{type:"exit"},function(result){
		if(result){
			location.reload();
		}else{
			alert("退出失败")
		}
	})
}
</script>
</head>
<body>
<%
	if(user==null){
		%>
		<p>用户未成功登录</p>
		<%
	}else{
		%>
		<p>用户名:<%=user.getUsername()%></p>
		<p>密码:<%=user.getPassword() %></p>
		<img src="${basePath}/static/image/female_student.png"/>
		<%
	}
%>
<p>通过EL表达式显示状态信息：</p>
<p>账号:${user.getUsername()}</p>
<p>密码:${user.getPassword()}</p>

<button onclick="login()">前往登录页面进行登录</button>
<button onclick="exit()">退出登录</button>
</body>
</html>