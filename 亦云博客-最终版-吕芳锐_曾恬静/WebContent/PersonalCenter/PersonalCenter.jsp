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
	
	
	String beginDate=request.getParameter("begin");
	String stopDate=request.getParameter("stop");
	
	
	
	
	
	
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>PC_student</title>

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
	</style>
</head>
<body style="padding-top:50px; margin:8px 0 0 0;">
    
    <jsp:include page="../header_and_footer/header.jsp" flush="true"/>
    
  <div class="jskapian chengse">
  <br/><br/>
		<div class="touxiang"><img src="../image/sivan.jpg"/>
		</div>
		<div style="position:absolute;left:50%;margin:0 20px;width:220px;">
		<h1><%=user.getUsername() %></h1>
		<div class="guanzhu">关注TA</div></div>
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

	<div class="biaoti">全部文章</div>
	<div class="container">
	    <form action="" class="form-horizontal"  role="form">
		        <fieldset>
	<div class="form-group">
		<label for="dtp_input2" class="col-md-3 control-label">查询某段时间内的文章</label>
		<div class="input-group date form_date col-md-3" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd"style="float:left;">
			<input class="form-control" size="10" type="text" value="" readonly>
			<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
			<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		</div>
		<input type="hidden" id="dtp_input2" value="" />
		<div style="float:left;margin:0 20px;">--</div>
			<div class="input-group date form_date col-md-3" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd"style="float:left">
			<input class="form-control" size="10" type="text" value="" readonly>
			<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
			<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		</div>
		<input type="hidden" id="dtp_input2" value="" />
		<button type="submit"style="float:left;margin-left:20px;" class="btn btn-default">提交</button>
		<button onclick="windows.open(artedit.jsp)"type="submit"style="float:left;margin-left:20px;" class="btn btn-default">写文章</button>
	</div>
	        </fieldset>
    </form>
	</div>
	
	<div class="text-center">
	  	<div class="baikapian wenzhang"> 
	<div class="shouji"><span class="glyphicon glyphicon-book"></span>&ensp;手记文章</div>
	<div class="wentopic">MyCat 启蒙：分布式系统的数据库架构演变</div>
		<div class="hotpic">
	<img src="../image/wenzhang1.jpg"/>
	</div>
	<div class="hotcontent">单数据库架构 一个项目在初期的时候，为了尽可能快地验证市场，其对业务系统的最大要求是快速实现。在这个阶段，代码开发人员为了能快速实现业务系统，一般都是将所有层级（MVC）的业务代码都写在同一个项目中，所有的业务数据都存放在同一个数据库中。此时，项目的整体架构图如下所示...</div>
	<div class="hotcontent">浏览</div>
	<div class="hotcontent">366</div>
	<div class="hotcontent">推荐</div>
	<div class="hotcontent">6</div>
	<a href="./arshow.html">	<div class="tiaozhuan">
	阅读全文<span class="glyphicon glyphicon-arrow-right"></span>
	</div></a>
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
