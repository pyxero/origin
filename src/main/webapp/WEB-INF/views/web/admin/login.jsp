﻿<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="resources/ui/hi-u/lib/html5.js"></script>
<script type="text/javascript" src="resources/ui/hi-u/lib/respond.min.js"></script>
<script type="text/javascript" src="resources/ui/hi-u/lib/PIE_IE678.js"></script>
<![endif]-->
<link href="resources/ui/hi-u/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="resources/ui/hi-u/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="resources/ui/hi-u/css/style.css" rel="stylesheet" type="text/css" />
<link href="resources/ui/hi-u/lib/Hui-iconfont/1.0.6/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>后台登录 - H-ui.admin v2.3</title>
<meta name="keywords" content="H-ui.admin v2.3,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v2.3，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
<style>
.header {
    top: 0;
    height: 60px;
    background: #426374  no-repeat 0 center;
    width: 100%;
}
 #logo-img {
       width: 8%;
    height: 60%;
    margin-left: 5%;
    margin-top: 10px;
}
#logo-div {
     margin-left: 15%;
    margin-top: -33px;
}
	
#logo-text {
       font-size: 22px;
    font-weight: bold;
    color: #fff;
    letter-spacing: 5px;
}	
	
	.input-text, .textarea{
		width: 80%;
	}
	body{
		width:100%;
	}
	.form-horizontal .row{
		width:90%;
	}
	.footer {
    width: 100%;
    }
    .loginWraper {
    width: 100%;
    }
    .loginBox{ position:absolute; width:800px;height:480px; background:url(resources/ui/hi-u/images/admin-loginform-bg.png) no-repeat;  top:30%;left:25%; }
    .col-3 {
    width: 15%;
	}
	.col-offset-3 {
    margin-left: 15%;
}	
	.btn.size-L {
    height: 42px;
    }
</style>
</head>
	<script type="text/javascript">
	function target(){
		alert("target");	
	
	}
	</script>
<body >
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header">
	<img src="resources/page_img/jx-02.png" id="logo-img" alt="logo" width="64" />
	<div id="logo-div"><span id="logo-text">聚享平台</span></div>
</div>
<div class="loginWraper">
  <div id="loginform" class="loginBox">
    <form class="form form-horizontal" action="index.html" method="post">
    	<br />
      <div class="row cl">
        <label class="form-label col-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-8">
          <input id="" name="" type="text" placeholder="账户" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-8">
          <input id="" name="" type="password" placeholder="密码" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-8 col-offset-3">
          <input class="input-text size-L" type="text" placeholder="验证码" onblur="if(this.value==''){this.value='验证码:'}" onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:150px;">
          <img src="images/VerifyCode.aspx.png"> <a id="kanbuq" href="javascript:;">看不清，换一张</a> </div>
      </div>
      <div class="row">
        <div class="formControls col-8 col-offset-3">
          <label for="online">
            <input type="checkbox" name="online" id="online" value="">
            使我保持登录状态</label>
        </div>
      </div>
      <div class="row">
        <div class="formControls col-8 col-offset-3">
          <a href="resources/page/H-UI/H-ui.admin.html" ><input name=""  class="btn btn-success radius size-L"  value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;"></a>
          <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
        </div>
      </div>
    </form>
  </div>
</div>
<div class="footer">
	<img src="resources/page_img/jx-02.png"  alt="logo" width="5%" height="50%" width="64" />
	聚享平台提供
</div>
<script type="text/javascript" src="resources/ui/hi-u/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="resources/ui/hi-u/js/H-ui.js"></script> 
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F080836300300be57b7f34f4b3e97d911' type='text/javascript'%3E%3C/script%3E"));
</script>
</body>
</html>