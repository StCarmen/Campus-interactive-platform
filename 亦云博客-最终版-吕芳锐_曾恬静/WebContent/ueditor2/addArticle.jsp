<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.mysql.fabric.xmlrpc.base.Data"%>
<%@page import="tool.Tool" %>
<%@page import="Bean.Article"%>
<%@page import="Impl.ArticleImpl"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
	pageContext.setAttribute("basePath", basePath);
	//接收从上个页面传过来的关键词key
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String userid=request.getParameter("userid");
	 
	
	
	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>