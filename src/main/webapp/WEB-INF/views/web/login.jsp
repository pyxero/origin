<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>乐为游_登录</title>
<%@ include file="../common/web/lib.jsp"%>
<!-- <link type="image/x-icon" href="favicon.ico" rel="icon"/>
<link rel="stylesheet" href="css/cssReset.css" />
<link rel="stylesheet" href="css/common.css" />
<link rel="stylesheet" href="css/levtripHeader.css" />
<link rel="stylesheet" href="css/login.css" /> -->
<!-- <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="js/levtripHeader.js"></script>
<script type="text/javascript" src="layer/layer.js"></script> -->
<script type="text/javascript" >

		//提示错误信息
		function blurInput(object, msg) {
			$(".onError").remove();
			var $parent = $(object).parent();
			if (!$(".onError").text()) {
				if (msg == '格式正确') {
					$(object).removeClass('blur');
					$parent.find('.onError').remove();
					return;
				}
				var errorMsg = msg;
				$parent.append('<span class="formtips onError color_orange"><br/>'
						+ errorMsg + '</span>');
				$(object).addClass('blur');
				// 消除错误提示
			} else if (msg == '格式正确') {
				$(object).removeClass('blur');
				$parent.find('.onError').remove();
			}

		};
		//邮箱的验证
		blurInput('.username','! 请输入账号');
		blurInput('.password','! 密码长度8~16位，数字、字母、字符至少包含两种');
		blurInput('.yz','! 请输入验证码');
		blurInput('.useremail','! 请输入邮箱');
		blurInput('.password:first','! 密码长度8~16位，数字、字母、字符至少包含两种');
		blurInput('.password:last','! 请确认密码');
			//此函数表示  点击某个按钮，某div显示  某div隐藏 且某标签填充某值
		function showHide(object,showObt,label,valueObt){
			$(object).click(function(e) {
				$(this).closest('.i_login_box').stop().hide();
				$(showObt).stop().show();
				$(label).html($(valueObt).val());
			})
		};
		//点击忘记密码
		showHide('.forgetPw','.resetPw');
		//确定重置密码，点击下一步
		showHide('.resetPw .next_btn','.resetPw2_phone','.resetPw2_phone p span','.resetPw .username');
		showHide('.resetPw .next_btn','.resetPw2_email','.resetPw2_email p span','.resetPw .username');
		//点击发送短信或链接
		showHide('.resetPw2_phone .send_btn','.resetPw3_phone','.resetPw3_phone h3 span','.resetPw .username');
		showHide('.resetPw2_email .send_btn','.resetPw3_email','.resetPw3_email h3 span','.resetPw .username');
		//验证完短信或者链接之后 确定
		showHide('.resetPw3_phone .confirm_btn','.resetPw4');
		showHide('.resetPw3_email .confirm_btn','.resetPw4');
		//点击提交
		showHide('.resetPw4 .submit_btn','.resetPw5');
		//点击重新登录
		showHide('.resetPw5 .relog_btn','.i_login_box:first');
		
		
		
		function subLog(){
			var user = $(".username").val();
			var pass =  $(".password").val();
			var code = $("#verifycode").val();
			$.ajax({
				url : "verify?username=+"+user+"+&password="+pass+"&no="+user+"",
				data:user,
				dataType : "json",
				success : function(res) {
					console.log(res);
					if(!res.flag || res.status =='0'){
						blurInput(".password","! 用户名密码输入错误~");
					}else{
						window.location.href = "home";
					}
				}
			});
			
		};
	
		// 验证码 匹配
		function blurCheck(id, status) {
			if (status == '0') {
				var mailCode = $(id).val().trim();
			} else {
				var mailCode = $(id).val();
			}
			if (!mailCode) {
				blurInput(id, "! 不能为空");
				return false;
			} else {
				blurInput(id, "格式正确");
				return true;
			}
		};
</script>

</head>

<body>
<!-- header开始------------------------------------------------------------------------ -->
<div class="header">
	<div class="header_box">
        <h1 class="logo fl"><a href="/">户外交友_周边游_游记攻略_户外资源共享_乐为游</a></h1>
        <p class="login fr f16 color_f">
            没有账号,立即<a href="reg">注册</a>
        </p>
    </div><!-- header_box -->
</div><!-- header -->
<div class="i_login p_a">
	<div class="i_login_box">
		<from action="verify" id = 'fromSub' method = 'get'>
	    	<p><input type="text" name = "user.username" onBlur ="blurCheck('.username','0');" placeholder="手机号码/邮箱" class="username" /></p>
	    	<p><input type="password" name = "user.password" onBlur =" blurCheck('.password','1');" placeholder="密码" class="password"/></p>
	    	<p id="lyzp" class="overf"><input name="verifycode"  onBlur =" blurCheck('#verifycode','0');" id = 'verifycode' type="text" class="yz fl" style="width: 150px;" placeholder="图片验证码"/>
		        	<a href="javascript:next();" class="yzpic fl"><img src="code" height="35" alt="验证码图片" /></a><br/></p>
	        <div class="m_t_5 overf">
	        	<p class="fl"><input type="checkbox" checked="checked" id="autologin" class="autologin fl"/><label for="autologin" class="color_5">自动登录</label></p>
	            <a href="fpwd.html" target="_blank" class="forgetPw color_orange fr" >忘记密码?</a>
	        </div>
	        <a href="javascript:subLog();" class="login_btn t_a_c bg_orange">登录</a>
	        <p class="d_reg">还没有账号？<a class="color_blue hUline" href="reg">立即注册</a></p>
	        <p class="otherway">
	        	<a href="javascript:;" class="qq fl" title="以qq方式登录"></a>
	            <a href="javascript:;" class="wb fr" title="以微博方式登录"></a>
	        </p>
       </from> 
    </div><!-- i_login_box -->
</div><!-- i_login -->
<div class="picInfo p_a overf">
	<div class="picInfo_box">
    	<div class="picInfo_con">
        	<p class="i_icon"></p>
            <p class="i_txt"><a href="javascript:;">simon</a> 拍摄于 <a href="javascript:;">鼓浪屿，厦门</a></p>
        </div><!-- picInfo_con -->
    </div><!-- picInfo_box -->
</div>
<!-- footer开始------------------------------------------------- -->	
<div class="footer p_a t_a_c">
	乐为游（北京）科技有限公司 ©2015 乐为游 levtrip All rights reserved. Version v1.00 京ICP备15016170号
</div><!-- footer -->
<!-- footer结束 -->	
<script  type="text/javascript" >
	// 更换验证码 图片	
	function next() {
		$(".yzpic>img").attr("src", "code?t=" + Math.random());
	}

</script>
</body>
</html>
