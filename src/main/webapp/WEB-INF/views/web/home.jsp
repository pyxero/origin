<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>户外交友_周边游_游记攻略_户外资源共享_乐为游</title>
<%@ include file="../common/web/lib.jsp"%>
<meta name="keywords" content="乐为游,以游为乐,慢游,周边游,装备租赁,自由行,游记,攻略,自助游 " />
<meta name="description" content="乐为游一个户外社交,周边自助游,活动攻略游记、资源共享的平台。" />
<meta name="author" content="levtrip.com" />
<meta name="copyright" content="2015" />
<meta name="robots" content="all" />
<!-- <link type="image/x-icon" href="favicon.ico" rel="icon"/>
<link rel="stylesheet" href="css/cssReset.css" />
<link rel="stylesheet" href="css/common.css" />
<link rel="stylesheet" href="css/levtripHeader.css" />
<link rel="stylesheet" href="css/index.css" />
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="js/levtripHeader.js"></script> -->
<script type="text/javascript" >
	$(function(){
		$('.picInfo_con').hover(function(e) {
            $(this).children().stop().toggle(600);
        });	
	})
</script>
</head>

<body style="background:url(resources/images/web/index_bg.png) no-repeat;background-size:cover;">
<div class="maskall hide">  
</div>
<div class="forie t_a_c hide">
	<p class="line1">即将上线，敬请期待！</p>
  <p class="line2"><a href="#">抢先注册</a></p>
</div>
<!-- 意见反馈窗口 -->
<div class="feedbackWrap hide">
  <textarea  placeholder="hi，你好！欢迎提出宝贵的意见和建议。我们会认真阅读，你的支持是对我们最大的鼓励"></textarea>
  <button class="btn">提交</button>
</div><!-- feedbackWrap -->
<!-- header开始------------------------------------------------------------------------ -->
<div class="header">
	<div class="header_box">
        <h1 class="logo fl"><a href="../index.html">户外交友_周边游_游记攻略_户外资源共享_乐为游</a></h1>
        <ul class="nav fl t_a_c">
          <li class="nav_item"><a href="../index.html">首页</a></li>
          <li class="nav_item"><a href="javascript:;" class="current">活动</a></li>
          <li class="nav_item p_r nav_resource">
          	<a href="javascript:;">资源<i class="iconfont">&#xe619;</i></a>
          	<ul class="nav_res p_a hide">
            	<li><a href="javascript:;">包车</a></li>
            	<li><a href="javascript:;">领队</a></li>
            	<li><a href="javascript:;">装备</a></li>
            	<li><a href="javascript:;">保险</a></li>
            </ul>
          </li>
          <li class="nav_item"><a href="javascript:;">攻略</a></li>
        </ul>
        <div class="login fr color_f">
            <p class=" wlogin fr hide"><a href="javascript:;">登录</a>|<a href="javascript:;">注册</a></p><!-- wlogin -->
            <div class="ylogin">
         				<div class="userimg fr p_r">
                	<a href="javascript:;"><img src="resources/images/web/levpic.png" alt="头像"  title="头像" class="fl" width="32"/><i class="iconfont color_f">&#xe619;</i></a>
                  <ul class="userimg_menu user_menu p_a bg_f hide">
                    <li><a href="javascript:;">我的乐为游</a></li>
                    <li><a href="javascript:;">我的活动</a></li>
                    <li><a href="javascript:;">我的资源</a></li>
                    <li><a href="javascript:;">我的攻略</a></li>
                    <li><a href="javascript:;">设置</a></li>
                    <li><a href="javascript:;">退出</a></li>
                  </ul>
                </div><!-- userimg -->
            		<div class="usermsg fr f14 p_r">
                  <a href="javascript:;" class="color_f  p_r"><span>消息<i class="iconfont">&#xe619;</i></span><b class="msgTip p_a">5</b></a>
                  <ul class="usermsg_menu user_menu p_a bg_f hide">
                    <li><a href="javascript:;">系统通知<b>1</b></a></li>
                    <li><a href="javascript:;">系统消息<b>4</b></a></li>
                    <li><a href="javascript:;">私信</a></li>
                  </ul>
                </div>
            </div><!-- ylogin -->
        </div><!-- login -->
        <p class="fr header_searchWrap p_r">
        	<input type="text" class="header_search fr" placeholder="您想找什么？"/>
          <a href="javascript:;" class="p_a zoom"><i class="iconfont color_b6">&#xe618;</i></a>
        </p>
    </div><!-- header_box -->
</div><!-- header -->
<!-- header结束 -->
<!-- 回到顶部和反馈开始 -->
<div class="rightline p_a">
</div>
<div class="toolbarFooter">
  	<a href="javascript:;" class="toolTop  show " title="回到顶部"><i class="iconfont">&#xe600;</i></a>
    <a href="javascript:;" class="toolFeedback  show " title="我要反馈"><i class="iconfont">&#xe608;</i></a>
</div> 
<!-- 回到顶部和反馈结束 -->
<div class="searchforie p_a">
	<div></div>
</div>
<div class="search p_a">
	<div class="search_box">
    	<h2>不在乎你走多远</h2>
        <div class="search_con">
        	<div class="search_con_top p_r">
            	<input type="text" placeholder="搜索目的地/攻略/资源" autofocus />
                <ul class="searchList p_a hide">
                	<li>门头沟京西古道马致远故居—灵山—妙峰山一日游！  <span>北京市</span></li>
                	<li>门头沟京西古道马致远故居—灵山—妙峰山一日游！  <span>北京市</span></li>
                	<li>门头沟京西古道马致远故居—灵山—妙峰山一日游！  <span>北京市</span></li>
                	<li class="searchList_last">如果没有找到您要找的内容,您可以<a href="javascript:;">创建活动</a></li>
                </ul>
                <button></button>
            </div><!-- search_con_top -->
            <div class="search_con_bom">
            	热门搜索：<a href="javascript:;">北京</a><a href="javascript:;">天津</a><a href="javascript:;">西安</a><a href="javascript:;">青岛</a><a href="javascript:;">山东</a>
            </div><!-- search_con_bom -->
        </div><!-- search_con -->
    </div><!-- search_box -->
</div><!-- search -->
<div class="picInfo p_a overf">
	<div class="picInfo_box color_f">
            <p class="i_txt fr"><a href="javascript:;">simon</a> 拍摄于 <a href="javascript:;">鼓浪屿，厦门</a></p>
    </div><!-- picInfo_box -->
</div>
<!-- footer开始------------------------------------------------- -->	
<div class="footer p_a t_a_c">
	乐为游（北京）科技有限公司 ©2015 乐为游 levtrip All rights reserved. Version v1.00 京ICP备15016170号
</div><!-- footer -->
<!-- footer结束 -->	
</html>
