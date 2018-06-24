<%@page import="Bean.User"%>
<%@page import="Action.UserAction"%>
<%@page import="Impl.UserImpl" %>

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
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>header</title>

    <!-- css -->
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../css/header_and_footer.css" rel="stylesheet" />

    <!--javascript-->
    <script src="../js/jquery-3.3.1.js"></script>
    <script src="../js/require.js"></script>
    <script src="../js/bootstrap.js"></script>

    <script src="../js/header-and-footer.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body id="header-body">
    <nav class="header-nav navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" id="header_brand" href="../homepage.jsp" >
                    <img alt="Brand" id="brand_img" style="height :140%;display:inline;float:left;margin-top:-6px;" src="../image/header_brand_image.png">
                    <span style="float:left;padding:10px 10px;margin-left:10px;">亦云</span>

                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                	<li><a href="../homepage.jsp">首页</a></li>

                    <li><a href="#">热门</a></li>
                    <li><a href="../PersonalCenter/guanzhu.jsp">发布</a></li>
                    

                </ul>



                <ul class="nav navbar-nav navbar-right">

                    <li>
                        <!-- Button trigger modal -->
                        <%
                        if(session.getAttribute("user")==null ){
                        %>
                        
                        <a href="#" onclick="window.open('../login_and_signup/sign_up.html')">
                            登录|注册
                        </a>
                        
                        <%
                        }else{
                        %>
                        <a href="../PersonalCenter/PersonalCenter.jsp" >
                            <%=user.getUsername() %>
                        </a>
                        <%
                        }
                        %>
                        
                    </li>
                    <li><a href="#">帮助</a></li>
                </ul>

                <form id="footer-searcher" class="navbar-form navbar-left navbar-right" action="../searcher/searcher.jsp" method="post">
                    <span class="form-group">
                        <input id="footer-searcher-input" type="text" name="key" class="form-control" placeholder="搜索">
                    </span>
                    <button type="submit" id="footer-searcher-button" class="btn btn-default" >
                        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                    </button>
                </form>




            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">登录|注册</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="exampleInputEmail1">账号</label>
                            <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">密码</label>
                            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                        </div>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> 保存7天登录
                            </label>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">注册</button>
                            <button type="submit" class="btn btn-primary">登录</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!--<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>-->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <!--  <script src="js/bootstrap.js"></script>-->
</body>

</html>