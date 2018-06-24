<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
	pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>edit</title>

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
    <style type="text/css">
        .toolbar {
            border: 1px solid #ccc;
        }
        .text {
            border: 1px solid #ccc;
            height: 400px;
        }
    </style>
    <script src="${basePath}/static/js/jquery-3.3.1.js"></script>
    <script>
    function getContent(){
    	var content = $('#content').html();
    	alert(content);
    }
    
    function send(){
    	var basePath='<%=basePath%>'
    	var title = $('#title').val();
    	var content = $('#content').html()
    	$.post(basePath+'/ArticleAction',{type:"add"
    		,title:title
    		,content:content},function(result){
    			alert(result)
    			//出错通常是字数超长，就忽略吧~
    		});
    }
    </script>
    
</head>
<body>
<div class="container">
	<div style="height:100px"></div>
	标题:<input type="text" id="title" class="form-control" placeholder="Text input"/>
	<!-- 富文本编辑器wangEditor,详细说明见https://www.kancloud.cn/wangfupeng/wangeditor3/335769 -->
	<div id="toolbar" class="toolbar">
    </div>
    <div style="padding: 5px 0; color: #ccc"></div>
     <!--可使用 min-height 实现编辑区域自动增加高度-->
     <textarea id="content" class="form-control" rows="3"></textarea>
    <script type="text/javascript" src="${basePath}/static/js/wangEditor.min.js"></script>
    <script type="text/javascript">
        var E = window.wangEditor
        var editor = new E('#toolbar','#content')
        // 或者 var editor = new E( document.getElementById('editor') )
        editor.create()
    </script>
    <!-- 富文本编辑器结束 -->

    <button onclick="getContent()">点击获取文本框内容</button><br/>
    <button onclick="send()">点击将文章标题和内容都发送给后台</button>
    </div>
</body>
</html>