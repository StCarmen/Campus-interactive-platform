<%@page import="Impl.ArticleImpl"%>
<%@page import="Bean.Article"%>
<%@page import="Bean.User" %>
<%@page import="java.text.SimpleDateFormat"%>  
<%@page import="java.util.*"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
	pageContext.setAttribute("basePath", basePath);
	
	//接收从上个页面传过来的关键词key
	String articleId = request.getParameter("articleid");
	if(articleId==null)articleId="1";
	Article as=ArticleImpl.getArticlesById(articleId);
	System.out.println("1111"+as.getContent()+"111");
	User user = (User)session.getAttribute("user");
	pageContext.setAttribute("user", user);

    Date d = new Date();  
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
    String now = df.format(d); 

	
%>  
      
 
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>text</title>

    <!-- css -->
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../css/header_and_footer.css" rel="stylesheet" />
    <link rel="stylesheet" href="../css/note.css">
    <link rel="stylesheet" href="../css/article.css">
    <!--javascript-->
    <script src="../js/jquery-3.3.1.js"></script>
    <script src="../js/require.js"></script>
    <script src="../js/bootstrap.js"></script>

<script>
	function subcomment(){
		var comments=$('#my_comments').val()
		var basePath = '<%=basePath%>';  //js中不能使用EL表达式
		
		//通过ajax向服务器发起请求查询数据库
		//第一个参数为ajax请求地址,本项目中为自己写的servlet类
		//第二个参数为{XXX} 类型的JSON字符串，关于JSON 可自行Baidu
		//第三个参数为回调函数，即ajax请求完成后执行的函数，result为服务器返回的参数
		$.post(basePath+'/ArticleActin',{type:'addmycomments',
			username:<%=user.getUsername()%>,
			comments:comments,articleid:<%=articleId%>,publishtime:<%=now%>,userid:<%=user.getUserid()%>},function(result){
				if(result=="success"){
					alert("login success");
				}else{
					alert("login failed;Maybe is error password");
				}
			})
	}
	
	
</script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style>
	
    </style>
    <link href="../css/header_and_footer.css" rel="stylesheet" />
</head>
<body style="padding-top:50px; margin:8px 0 0 0;">
    <jsp:include page="../header_and_footer/header.jsp" flush="true"/>
        
	<div class="container"  style="margin-top:50px;">
   <div class="row">
  <div class="col-md-9 col-lg-9  col-sm-12 col-xs-12  ">	
		
		<div class="note-header note-header-container">
        <h1><%=as.getTitle() %></h1>

    
    <div>
        <a href="#"><img class="note_author_avatar" width="24" height="24" src="../image/sivan.jpg" alt="<%=as.getUsername()%>"></a>
        <a href="#" class="note-author"><%=as.getUsername()%></a>
        <span class="pub-date"><%=as.getPublishtime() %></span>
    </div>
    </div>

	<br/>
    
    <div class="note" style="display:none;"></div>
    <div>
            
            <div class="note" id="link-report">
           <!--  
            2015年下半年并不是民谣的丰收季节，比起上半年甚至有些惨淡，有些专辑发出来之后，似乎石沉大海，而且很多民谣跟风严重，继续深陷无病呻吟、粗制滥造的泥沼，以至于没有几个人会去认真聆听，听与不听，听，那无疑就是沙里淘金，入围最佳的这些专辑质量参差不齐，风格各异，至少了代表一种执拗的声音，以及创作人强烈的表达欲，所以还是听一听吧，他们有很多瑕疵，但也有闪光。<br><br>1、赵牧阳《风行水上·回家》<br><div class="cc"><table><tbody><tr><td><img src="../image/p32524656.jpg" alt=""></td></tr><tr><td align="center" class="wr pl"></td></tr></tbody></table></div><br><br>点评：赵牧阳从乐手到歌手，从未别人服务，为自己服务，其实他一直唱的是一种淳朴的情感，来自西北黄河流域的苍凉与丰沛，像一味药方或者一壶土酒，这其中有一种不可忽视的文献作用。秦腔与三弦琴的简单组合里，赵牧阳像是来自古代的先民，呼号哀鸣，都关乎自己心心念念的故乡，不忍离去的对西北故土隔空惦记，即便是老歌新唱都自成一格。<br><br>推荐曲目：《 天下黄河几十几道弯》<br><br>2、黄子轩与山平快《异乡人》<br><div class="cc"><table><tbody><tr><td><img src="../image/p32524668.jpg" alt=""></td></tr><tr><td align="center" class="wr pl"></td></tr></tbody></table></div><br><br>点评：滚石唱片发行的这张客家语的黄子轩与山平快《异乡人》专辑，竟然被很多人忽视，其音乐制作的工整，早川徹、陈建骐、柯智豪等人贡献了各自的功力，一点点摇滚、电子、雷鬼、放克、蓝调等曲风的加入，使得民谣了有现代色彩，但是唱其实倒不晦涩，都是日常事物、寻常遭遇，所以这是一张穿着时髦外衣，却是讲土里土气情思专辑，好听，有趣，思索等情绪都有了。<br><br>推荐曲目：《阿姨的黑椅子》<br><br>3、吴昊恩 &amp; The Daniel Ho Trio《洄游》<br><div class="cc"><table><tbody><tr><td><img src="../image/p32524672.jpg" alt=""></td></tr><tr><td align="center" class="wr pl"></td></tr></tbody></table></div><br><br>点评：《洄游》专辑从技术上，还是情感上，都是无可挑剔，吴昊恩的吉他加上钢琴，端庄而大气。听不懂台湾山地民族语言的外人，听很多民族的歌曲似乎都很接近，但是吴昊恩的吉他一出来，就知道这是一道招牌。他的声音，讲着故事，说着情感，像一个行者，一边走着一边说着，抱着吉他，顺着故乡方向最高峰而去，唱着稻穗与田野的诗情。<br><br>推荐曲目：《想念的歌》<br><br>4、轻日记《好好过生活》<br><div class="cc"><table><tbody><tr><td><img src="../image/p32524674.jpg" alt=""></td></tr><tr><td align="center" class="wr pl"></td></tr></tbody></table></div><br><br>点评：在灵动的小女生腔调里，率真的流行民谣底色慢慢铺陈，轻日记里的轻快，日记的私密属性，尽情挥洒。小清新必须是发自真心，来自生活，而不是矫揉造作的编造，生掰硬拽的拼贴，这是很多台湾女生给人启示，轻日记的一男一女两个人，再次做了示范。<br><br>推荐曲目：《我想变成我》<br><br><br>5、图利古尔《风·草·声》<br><div class="cc"><table><tbody><tr><td><img src="../image/p32524793.jpg" alt=""></td></tr><tr><td align="center" class="wr pl"></td></tr></tbody></table></div><br><br>点评：似乎很多蒙古族乐队，天生有一种对音乐的领悟能力，一开嗓就惊人，一出来就范儿十足。图利古尔的对自然与神灵的敬畏，对音乐形式的掌握，在杭盖、HAYA等成熟乐队之后，在蒙古音乐人队伍里，又增加了新的惊喜。<br><br>推荐曲目：《蓝天，草地，羊群，狗》<br><br><br><br>6、马帮《马帮》<br><div class="cc"><table><tbody><tr><td><img src="../image/p32524795.jpg" alt=""></td></tr><tr><td align="center" class="wr pl"></td></tr></tbody></table></div><br><br>点评：从米粉到马帮，马帮乐队成员之间的配合更加默契，现场演绎爆发力十足，作为第一张专辑《马帮》的创作灵感取材自广西的根源，他们热衷于提炼于土地上的哲思，融化乡土民歌的现代性，热情、大胆地把关于故乡远远近近的传唱之歌，以新曲式、新编排去演唱，对“马帮”这个概念完善得很到位。<br><br>推荐曲目：《不改变河流的方向》<br><br>&nbsp;<br>7、李德筠《价值观 Vol.01》<br><div class="cc"><table><tbody><tr><td><img src="../image/p32524762.jpg" alt=""></td></tr><tr><td align="center" class="wr pl"></td></tr></tbody></table></div><br><br>点评：一个创作人的价值观，可能就是音乐观，李德筠的创作显然受了民歌时代前辈的影响，简单朴素却洋溢真挚的个人情怀，声音清澈温煦，有治愈系的色彩，而李德筠的生活态度就像她这张专辑一样，简化繁杂的东西，只呈现凉爽的真情实感，人和音乐一样开朗通透，散发着一股明亮的帅气。<br><br>推荐曲目：《海尼根情歌》<br><br><br>8、蒋明《空山》<br><div class="cc"><table><tbody><tr><td><img src="../image/p32524749.jpg" alt=""></td></tr><tr><td align="center" class="wr pl"></td></tr></tbody></table></div><br><br>点评：空山之空其实是蒋明内心的放空，从朝九晚五的工作里解脱，成为一个闲云野鹤一样的民谣歌者，其心，似信马由缰，其志，悠游山水田园。唱歌成为人生主业，游走成为一个随时可以出发的事情。所以《空山》专辑映射出的松弛和旷达，正是“空”的表征，放空身心的歌者，终于可以接纳更多风花雪月磨砺出的岁月之歌，让唱歌成为一种发乎情理的职业。<br><br>推荐曲目：《给老六写首歌》、《时间简史》<br><br><br>9、秋林《大岭脚下》<br><div class="cc"><table><tbody><tr><td><img src="../image/p32524745.jpg" alt=""></td></tr><tr><td align="center" class="wr pl"></td></tr></tbody></table></div><br><br>点评：方言民谣基本上都在唱故土，唱个人经历，秋林的《大岭脚下》就是一个村庄里的侧影素描，乡土中国的一个缩影，生于斯长于斯，重情如斯，一草一木自带呼吸，每字每句包含情义，客家语没有阻碍专辑的传播性，相反，听专辑的人会非常想知道歌词里写了什么东西，这也许就是乡土情思对每个人的魔力。<br><br>推荐曲目：《风吹田间》<br>&nbsp;<br><br>10、秘密后院《人世间》<br><div class="cc"><table><tbody><tr><td><img src="../image/p32524722.jpg" alt=""></td></tr><tr><td align="center" class="wr pl"></td></tr></tbody></table></div><br><br>点评：每次听秘密后院的专辑，就像听一场仙风道骨的表演。《人世间》专辑继续他们笙箫和鸣的古风与禅意，超然物外的自由心态，在人人都说故乡沦陷，每个人都焦虑着寻找出路和出口的时候，他们身在现代，心意却早早归隐于秋山明月夜苍苍的古代，身后不见来者。<br><br>推荐曲目：《空城计》<br>&nbsp;<br><br>11、末小皮《潘卡西》<br><div class="cc"><table><tbody><tr><td><img src="../image/p32524718.jpg" alt=""></td></tr><tr><td align="center" class="wr pl"></td></tr></tbody></table></div><br><br>点评：末小皮有一副很治愈系的嗓音，唱什么都是舒服自在的质感，《潘卡西》专辑里，末小皮像逆光照中的女生，在发呆在私语，音乐本属于城市民谣流派，却鲜少浮华情绪，简单干脆背后，全然一个女生在日记里寥寥几语的片段，有自说自话的絮叨，有轻轻巧巧的故事，所谓“末氏小调.由繁归简”，可能就是这样。<br><br>推荐曲目：《来北方和我看雪》<br><br><br>12、张三李四《张三李四》<br><div class="cc"><table><tbody><tr><td><img src="../image/p32524710.jpg" alt=""></td></tr><tr><td align="center" class="wr pl"></td></tr></tbody></table></div><br><br>点评：宝岛组合张三李四的同名专辑，不仅仅是民谣，还涉及了摇滚等元素，鉴于没法看到完整的歌词，只能被他们歌声中所带来的热情感染，这个组合继承了台语组合，活泼、大方、怪味的性格，多声部和声、说唱、器乐SOLO，都非常漂亮，张三李四是一个鲜明的组合，他们的音乐“不三不四”却很有特色。<br><br>推荐曲目：《鬼岛诗》<br><br><br>13、巴赖《古老的透明》<br><div class="cc"><table><tbody><tr><td><img src="../image/p32524707.jpg" alt=""></td></tr><tr><td align="center" class="wr pl"></td></tr></tbody></table></div><br><br>点评：台湾原住民歌手已经不算少，每个人都在用自己的视角抒发对故乡、大地、母族的骄傲与荣誉，《古老的透明》概莫能外，是巴赖眼中的乡音乡情，雷鬼、摇滚、放克、民谣按照他的想法完整结合，似曾相识又陌生。关于原住民，他们唱不厌，关于原住民，我们也听不腻。<br><br>推荐曲目：《看得到海的地方》<br><br><br>14、尧十三《飞船，宇航员》<br><div class="cc"><table><tbody><tr><td><img src="../image/p32524692.jpg" alt=""></td></tr><tr><td align="center" class="wr pl"></td></tr></tbody></table></div><br><br>点评：唱普通话不是尧十三的专长，《飞船，宇航员》里一唱方言马上转换语言系统，就把人带入活泼、酥脆的生活现场，见子打子，自得一派，可是还没坚持到底，尧十三骨子里还是麻油叶其他成员一样的斯文流氓型歌者，比起生活，更爱想象，比起乡村更喜欢城市，比起女人，更喜欢文艺女青年，这些才是他的缪斯之神，他的北方女王。<br><br>推荐曲目：《二孃》<br><br><br>15、石小飞《愚者的信仰》<br><div class="cc"><table><tbody><tr><td><img src="../image/p32524679.jpg" alt=""></td></tr><tr><td align="center" class="wr pl"></td></tr></tbody></table></div><br><br>点评：石小飞的这张专辑有个很好的形式感，可听性不弱，制作上邀了台湾团队，流行民谣的基础上兑上一些城市民谣味道，又有一些些电子成色，稍微遗憾的是，收歌有些简单，专辑6首歌标题都取得很好，但是听完没能留下太多印象，也许这和她的写歌方式略显程式化，词曲有些粘合度不高，唱腔上较为传统、不够自由有关，再放开一些可能会更好。<br><br>推荐曲目：《愚者的信仰》<br><br>延伸阅读：2015年上半年华语民谣15佳专辑 <a rel="nofollow" href="#"></a>
            -->
            <%=as.getContent() %>
            
            </div>
            
    		

            <div id="link-report_note">
            </div>
            

    </div>
    
	<div id="comments" class="">

<div class="comment-item" id="44584161" data-cid="44584161" data-target_id="545907448" data-target_kind="1015">
    
    <div class="pic">
        <a href="#"><img width="48" height="48" class="" src="../image/u32397230-16.jpg" alt="ZHAOYI"></a>
    </div>
    <div class="content report-comment">
        <div class="author">
            <span class="">2016-03-18 15:12:52</span>
            <a href="#" class="  ">ZHAOYI</a> 
        </div>


        
        <p class="">哪里能听？
<br></p>

        <div class="op-lnks">
        

        <a href="#" class="lnk-reply hidden">回应</a>

        <a rel="#" class="j a_confirm_link lnk-delete lnk-delete-44584161 hidden" title="删除ZHAOYI的留言?">删除</a>

        <a rel="#" class="j a_confirm_link lnk-admin-delete lnk-admin-delete-44584161 hidden" title="删除ZHAOYI的留言?">删除</a>

        </div>

        <div class="group_banned">
            <span class="gact hidden p_u32397230 p_admin p_intern fright">&gt;
                <a rel="#" class="j a_confirm_link" title="删除ZHAOYI的发言?">删除</a>
            </span>
        </div>
    </div>
</div>


<div id="last"></div>
    <br><span class="pl2" align="right"><a class="j a_show_login" href="#">&gt; 我来回应</a></span>
	<textarea class="form-control"style="margin-top:5px;" rows="3"id="my_comments"></textarea>
	<button type="submit" onclick="subcomment()" class="btn btn-default"style="margin-top:5px;float:right;">提交</button>
</div>
	</div>
	  <div class="col-md-3 col-lg-3  col-sm-0 col-xs-0">
	  	<div class="HOT baikapian">
	<div class="remen" style="text-align:center;">热门话题</div>	
	<div class="hottopic">
	<a href="#">
	#【花式填坑】第23期#<br/>
	运维进化篇：成为Python <br/>
	DevOps工程师有哪些必备条件？
	</a>
	</div>
	<div class="hotpic">
	<img src="../image/hot1.jpg"/>
	</div>
	<div class="hotcontent">	当越来越多的人想要成为牛x的运维开发，但缺乏掌握全面的技术与实战能力时，怎么办呢？如果有一天领导要你去负责一个运维项目，你知道你还欠缺些什么吗？如果一个运维没有扎实的开发基础，如何更好的实现一套系统化平台？参与本话题，让大牛老师替你解答！
	</div>
	<a href="#">
	<div class="tiaozhuan">
	了解详情<span class="glyphicon glyphicon-arrow-right"></span>
	</div></a>
	<div class="wangqi">往期回顾</div>
	<div class="zuowenzi">#【花式填坑】第22期#
	<br/>金三银四到来之前，你得学会如何面试</div>
	<div class="hotpic">
	<img src="../image/hot2.jpg"/>
	</div>	
	<div class="zuowenzi">#【花式填坑】第21期#
	<br/>对于现代前端必备技能Node.js，有什么想说的吗</div>
	<div class="hotpic">
	<img src="../image/hot3.jpg"/>
	</div>	
	<div class="zuowenzi">#【花式填坑】第20期#
	<br/>是时候说说 #挨踢狗们の国庆假期#了</div>
	<div class="hotpic">
	<img src="../image/hot4.jpg"/>
	</div>	
	</div>
  </div>
	  </div>
	  </div>
	  <br/><br/><br/>
	
	<iframe src="../header_and_footer/footer.html" id="iframe-footer"></iframe>
</body>
</html>
