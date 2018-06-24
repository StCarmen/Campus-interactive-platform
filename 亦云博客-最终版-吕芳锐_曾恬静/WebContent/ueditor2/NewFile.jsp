<%@page import="java.sql.SQLException"%>
<%@page import="Impl.ArticleImpl"%>
<%@page import="Bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%//获取项目根地址
	String basePath = request.getContextPath();
	//将根地址假如页面级变量方便之后通过EL表达式调用
	pageContext.setAttribute("basePath", basePath); 
	
	//通过session中的user获取登录状态
		User user = (User)session.getAttribute("user");
		
		//也把变量放入pageContext 方便使用EL表达式
		pageContext.setAttribute("user", user);
		
		if(user==null)
		{
			user=new User();
			user.setUserid(1);
		}
		
		/*String title=request.getParameter("title");
		String content=request.getParameter("content");
		System.out.println("t="+title);
		System.out.println("c="+content);
		System.out.println("c="+user.getUserid());
		if(title!=null&&content!=null){
			boolean b = false;
			try {
				//ArticleImpl.addArticle(title,content,user.getUserid());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}*/
		
		
	
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="CONTENT-TYPE" content="text/html;charest=utf-8">
<script type="text/javascript" charset="utf-8" src="./ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="./ueditor.all.js"></script>
<link href="./themes/default/css/ueditor.css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="./lang/zh-cn/zh-cn.js"></script>

<!-- Custom styles for this template -->
    <link href="../css/signin.css" rel="stylesheet">
    <script src="../js/jquery-3.3.1.js"></script>
    <script src="../js/require.js"></script>
    <script src="../js/bootstrap.js"></script>


<title>Insert title here</title>
<script>
    function getContent(){
    	var content = $('#content').html();
    	alert(content);
    }
    
    function send(){
    	var basePath='<%=basePath%>';
    	var userid=<%=user.getUserid()%>
    	var title = $('#title').val();
    	alert(title);
    	var content = $('#content').text();
    	alert(content);
    	$.post(basePath+'/ArticleAction',{type:"add"
    		,title:title
    		,content:content
    		,userid:userid},function(result){
    			alert(result)
    			//出错通常是字数超长，就忽略吧~
    		});
    }
    </script>

</head>
<body>
<jsp:include page="../header_and_footer/header.jsp" flush="true"/>
<br/>
<br/>
<br/>
<div class="containor">

<form action="">

<span>标题</span>
<input type="text" name="title" id="title"class="form-control" placeholder="Text input">
<br/><br/>
<textarea id="editor" name="content" id="content" type="text/plain" style="width: 1000px ; height: 500px">
   这里可以书写
 </textarea>
<br/>
<input class="btn btn-default" type="submit" value="Submit"onclick="windows.open('../homepage.jsp')" >

</form>

</div>



 
 
 
 
 
 <script type="text/javascript">
    UE.getEditor('editor');
</script>


</body>
</html>