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
	
	
	if(session.getAttribute("user")!=null){
		System.out.println(session.getAttribute("user"));
	}
	
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>like</title>

    <!-- css -->
    <link href="../css/PC.css" rel="stylesheet" />
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../css/header_and_footer.css" rel="stylesheet" />
    <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

    <!--javascript-->



    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


    <link href="../css/header_and_footer.css" rel="stylesheet" />
	<style>
	.geshu{
	z-index:100;
	}
	.geshu a{
	font-size:20px;
	width:100px;
	text-align:center;
	float:left;
	color:white;
	z-index:100;
	margin-top:-40px;
	}
	.leftpart{
	margin-top:20px;
	padding:2px;
	display: inline-block;
    letter-spacing: normal;
    word-spacing: normal;
    vertical-align: top;
    font-size: 12px;
    box-shadow: 0 0 2px rgba(0,0,0,0.2);
    border-radius: 2px;
	background-color:white;
	}
	ul{
	padding:0;
	margin:0;
	list-style: none;
	text-shadow: none;
	letter-spacing: normal;
    word-spacing: normal;
	font-size:16px;
	}
	li{
	list-style: none;
	text-shadow: none;
	text-align:center;
	margin:12px auto;
	}
	li a,li a:visited{
	color:black;
	font-size: 18px;	
	}
	li a:hover,li a:active,li a:link{
	color:#ab3234;
	text-decoration:none;
	}
	hr{
	margin:0;
	}
	.rightpart{
	margin-top:20px;
    padding-right: 20px;
	padding:2px;
	display: inline-block;
    letter-spacing: normal;
    word-spacing: normal;
    vertical-align: top;
    font-size: 12px;
    box-shadow: 0 0 2px rgba(0,0,0,0.2);
    border-radius: 2px;
	background-color:white;
	}
	.xiaotx{
	height:80px;
	width:80px;
	border-radius:50%;
	border:3px solid #fff;
	overflow:hidden;
	float:left;
	margin:5px 0 5px 40px;
	}

	.xiaotx img{
	width:80px;
	height:auto;
	}
	.name{
	color: #333;
	text-decoration: none;
	font-size: 16px;
	font-weight:700;
	float:left;
	margin:5px 0 5px 20px;
	width:500px;
	text-align:left;
	}
	.ifguanzhu {
	float:right;
    letter-spacing: normal;
    word-spacing: normal;
	margin:5px 5px;
	font-size:14px;
	}
	.numbers{
	width:500px;
	text-align:left;
	float:left;
	font-size:12px;	
	color:rgba(0,0,0,0.8);
	margin-left:20px;
	}
	#guanzhushu,#fensishu,#wenzhang{
	display:inline;
	color:#ab3234;
	text-decoration:none;
	font-size:12px;
	margin:0 2px;
	}
	.qianming{
	font-size:14px;
	text-align:left;
	margin-left:20px;
	margin-top:8px;
	float:left;
	}
	
	.nosee{
	display:none;
	}
	.cansee{
	display:block;
	}
	
	</style>
	<script type="text/javascript">
	function xianshi(){
		var a=document.getElementById("guanzhulan");
		a.style.display='block';
		
	}
	
	</script>
</head>
<body style="padding-top:50px; margin:8px 0 0 0;">
    <iframe src="../header_and_footer/header.html" id="iframe-header"></iframe>
  <div class="jskapian chengse">
  <br/><br/>
		<div class="touxiang"><img src="../image/sivan.jpg"/>
		</div>
		<div style="position:absolute;left:50%;margin:0 20px;width:220px;">
		<h1><%=user.getUsername() %></h1>
		<div class="guanzhu"onclick="xianshi()">关注TA</div></div>
		<p>。。。。。。。。。。个性签名。。。。。。。。。。。</p>
		<div class="triangle1"></div>
		<div class="triangle2"></div>		
		<div class="hang">
		<div class="geshu"></div>
		<div class="geshu"style="margin-left:85px;"></div>
		<div class="geshu"style="margin-left:170px;"></div></div>
		<div class="hang">
		<div class="geshu"style=""><a href="#">关注</a></div>
		<div class="geshu"style="margin-left:85px;"><a href="#">粉丝</a></div>
		<div class="geshu"style="margin-left:170px;"><a href="#">文章</a></div></div>

</div>
<div class="container">
   <div class="row">	
<div class="col-lg-3 col-md-3 leftpart">
<ul>
<li>
<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
<a href="#">TA的关注</a>
<div style="font-size:14px;display:inline;"></div>
</li>
<hr>
<li>
<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
<a href="#">TA的粉丝</a>
<div style="font-size:14px;display:inline;"></div>
</li>
</ul>
</div>
<div class="col-lg-1 col-md-1 ">
</div>
<div class="col-lg-8 col-md-8 rightpart">
<ul>
<li class="nosee" style="height:100px;border-bottom:solid 1px rgba(0,0,0,0.2);" name="guanzhulan" id="guanzhulan">
<div class="xiaotx"><img src="../image/sivan.jpg"/></div>
<div class="name"><%=user.getUsername() %></div>
<button type="submit" class="btn btn-default ifguanzhhu"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&ensp;已关注</button>
<div class="numbers">关注 <div id="guanzhushu">1</div> | 粉丝 <div id="fensishu">1</div> | 文章 <div id="wenzhang">1</div></div>
<div class="qianming"> ..............个性签名............</div>
</li>

</ul>
</div>
</div>
</div>


<br/><br/><br/>
    <iframe src="../header_and_footer/footer.html" id="iframe-footer"></iframe>
	
	<script type="text/javascript" src="../js/jquery-1.8.3.min.js" charset="UTF-8"></script>
		<script src="../js/bootstrap-datetimepicker.js"></script>
	<script src="../js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="../js/require.js"></script>
    <script src="../js/bootstrap.js"></script>
	<script type="text/javascript" src="../js/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
	    <script type="text/javascript">
    $('.form_datetime').datetimepicker({
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });
	$('.form_date').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
	$('.form_time').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 1,
		minView: 0,
		maxView: 1,
		forceParse: 0
    });
 
    </script>
</body>

</html>
