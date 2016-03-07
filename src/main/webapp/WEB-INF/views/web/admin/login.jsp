<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML>
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
<title>聚享平台</title>
<meta name="keywords" content="聚享平台">
<meta name="description" content="聚享平台">
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
    <form class="form form-horizontal" action="login" method="get">
    	<br />
      <div class="row cl">
        <label class="form-label col-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-8">
          <input id="username" name="username" type="text" placeholder="账户" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-8">
          <input id="password" name="password" type="password" placeholder="密码" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-8 col-offset-3">
          <input id="verifycode" class="input-text size-L" type="text" placeholder="验证码" onblur="if(this.value==''){this.value=''}" onclick="if(this.value=='验证码'){this.value='';}" value="" style="width:150px;">
          <img src="code" id="vCode"> <a id="kanbuq" href="javascript:next();">看不清，换一张</a> </div>
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
          <input name=""  type="button" onclick="subLog();" class="btn btn-success radius size-L"  value="登&nbsp;&nbsp;&nbsp;录">
          <input name="" type="reset" class="btn btn-default radius size-L" value="取&nbsp;&nbsp;&nbsp;消">
          <input name="" type="button" class="btn btn-default radius size-L" value="注&nbsp;&nbsp;&nbsp;册">
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


<script  type="text/javascript" >
	function subLog(){
		var user = $("#username").val();
		var pass =  $("#password").val();
		var code = $("#verifycode").val();
		$.ajax({
			url : "verify?username=+"+user+"+&password="+pass+"&code="+code+"",
			data:user,
			dataType : "json",
			success : function(res) {
				console.log(res);
				if(!res.flag){
					alert(res.msg);
				}else{
					window.location.href = "admin";
				}
			}
		});
		
	};
	// 更换验证码 图片	
	function next() {
		$("#vCode").attr("src", "code?t=" + Math.random());
	}
</script>
</body>
</html>