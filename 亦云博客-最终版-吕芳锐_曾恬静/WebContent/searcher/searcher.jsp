<%@page import="tool.Tool"%>
<%@page import="Bean.Article"%>
<%@page import="Impl.ArticleImpl"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
	pageContext.setAttribute("basePath", basePath);
	//接收从上个页面传过来的关键词key
	String key = request.getParameter("key");
	String sortId = request.getParameter("sortId");
	
	if(sortId==null){
		sortId="0";
	}else{
		
	}
	Article[] as;
	if(key==null){
		//response.sendRedirect(basePath+"/index.jsp");
		as = ArticleImpl.getArticles(10);
	}else{
		//这里将key放到sql语句中查出不同的结果
		//如查到的是一篇文章
		as = ArticleImpl.getArticles(key,sortId);
		
	}
	
	
	System.out.println(key);
	

%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>searcher</title>

    <!-- Bootstrap -->
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../css/header_and_footer.css" rel="stylesheet" />
    <link href="../css/searcher_show_style1.css" rel="stylesheet" />
    <link href="../css/searcher_show_style_common.css" rel="stylesheet" />
    <link href="../css/searcher.css" rel="stylesheet" />


    <!--javascript-->

    <script src="../js/jquery-3.3.1.js"></script>
    <script src="../js/header-and-footer.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/searcher.js"></script>


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- <link href="css/header_and_footer.css" rel="stylesheet" /> -->
</head>

<body style="padding-top:50px; margin:8px 0 0 0;">
    <jsp:include page="../header_and_footer/header.jsp" flush="true"/>

    <div class="container <!--hidden-xs--> searcher-searcher">
        <!-- 搜索栏 -->
        <div class="row" style="height:100%">
            <div class="col-md-1 hidden-sm"><br /></div>
            <div class="col-xs-3" style="height:100%">
                <img src="../image/header_brand_image.png" />
                <span id="searcher-searcher-brand">Brand</span>
            </div>
            <div class="col-xs-7">
                <div class="input-group searcher-searcher-form">
                    <!---->
                    <input type="text" class="form-control" placeholder="搜索">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                    </button>
                    </span>
                </div>
                <!-- /input-group -->
            </div>
        </div>
    </div>
    <!-- 搜索栏 -->

    <div class="container searcher-selecter">
        <!-- 选项 -->
        <div class="searcher-selecter-content">
            <!-- 课程 -->

            <h4>排序:</h4>

            <a href="${basePath}/searcher/searcher.jsp?key=<%=key%>&sortId=1" class="list-group-item">
                 热度
            </a>
            <a href="${basePath}/searcher/searcher.jsp?key=<%=key%>&sortId=0" class="list-group-item">
                时间
            </a>
            <a href="${basePath}/searcher/searcher.jsp?key=<%=key%>&sortId=2" class=list-group-item ">
                转发
            </a>
        </div>
        <!-- 课程 -->

        
    </div>
    <!-- 选项 -->


    
    <div class="container searcher-show">
        <!-- 课程展示 -->
    
   <%
    for(int i=0;i<as.length;i++){%>
    	
    	
    	
        <div class="searcher-show-course">
            <!-- 课程1 -->
            <div class=" view view-first searcher-myview">
                <img src="../image/course-info-test.jpg">
                <div class="mask">
                <h2>
                <%=Tool.duelString(as[i].getTitle())%>
                </h2>
                    <p><%=as[i].getContent()%>...</p>
                    <a href="../PersonalCenter/article.jsp?articleid=<%=as[i].getId() %>" class="info">Read More</a>
                </div>
            </div>

            <div class="searcher-show-info">
                <h3><%=as[i].getTitle() %></h3>
                <p style="margin: 0 0 30px;">
                 <%=Tool.duelString(as[i].getContent())%>
                 </p>
                <div>
                    <span style="float:left;color:#777"><%=as[i].getUsername() %></span>
                    <span style="float:right;color:#777">
                            <span>
                                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span><%=as[i].getClick() %>
                    </span>
                    &ensp;
                    <span onclick="red_it(this)" style="cursor:pointer">
                                    <span class="glyphicon glyphicon-heart-empty"  aria-hidden="true"></span><%=as[i].getFlag() %>
                    </span>
                    </span>
                </div>
                <br/>
                <div style="padding-top:0.5em">
                    <span style="float:right;">
                        <a style="color:#777;" href="../PersonalCenter/article.jsp?articleid=<%=as[i].getId() %>">更多信息</a>
                    </span>
                </div>
            </div>
        </div>
        <!-- 课程1 -->
    
    	
    	
   <%  }
    
    
    %>
	</div>
    <!-- 课程展示 -->



    <iframe src="../header_and_footer/footer.html" id="iframe-footer"></iframe>
</body>

</html>