<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>乐为游_注册</title>
<%@ include file="../common/web/lib.jsp"%>
<script type="text/javascript">
	$(function() {
		$('.picInfo_con').hover(function(e) {
			$(this).children().stop().toggle(600);
		});
	})
	function reg() {
		var cur = $(".reg_body.reg_email.current");
		var mailAdress, mailCode, phoneNo, phoneCode, data;
		if (cur.length > 0) {
			mailAdress = $("#mailAdress").val();
	// 表单提交  邮箱校验	
			if(!check("mail")){	return ;}
			if(!blurCheck("mail")){	return ;	}
			
			mailCode = $("#mailCode").val();
			if (typeof mailAdress == 'undefined' || mailAdress == ''
					|| typeof mailCode == 'undefined' || mailCode == '') {
				alert("null");
				return;
			}
			data = {
				mail : mailAdress,
				code : mailCode
			};
		} else {
			phoneNo = $("#phoneNo").val();
			phoneCode = $("#phoneCode").val();
		
	 // 表单提交  手机、验证码校验	 
			if(!check("phone")){return ;}
			if(!blurCheck("phone")){return ;}
			
			if (typeof phoneNo == 'undefined' || phoneNo == ''
					|| typeof phoneCode == 'undefined' || phoneCode == '') {
				alert("null");
				return;
			}
			data = {
				phone : phoneNo,
				code : phoneCode
			};
		}
		
		$.ajax({
			url : "reg/info",
			type : "post",
			data : data,
			success : function(res) {
			},
			error : function(res) {
			}
		});
	}
</script>
<script type="text/javascript">
	$(function() {
		//点击切换注册方式
		$('.reg_head a').click(
				function(e) {
					$(this).addClass('current').siblings('a').removeClass(
							'current');
					$('.i_reg_box div').eq($(this).index()).addClass('current')
							.siblings('div').removeClass('current');
				// 切换注册方式， 清楚错误提示.	
					$('#spanOra').remove();
				});
		
		//邮箱的验证
	//	blurInput('.yz', '! 请输入验证码');
	//	blurInput('.useremail', '! 请输入邮箱');
		blurInput('.emailPassword input:first', '! 密码长度8~16位，数字、字母、字符至少包含两种');
		blurInput('.emailPassword input:last', '! 请确认密码');
		//手机的验证
//		blurInput('.userphone', '! 请输入手机号码');
		blurInput('.phonePassword input:first', '! 密码长度8~16位，数字、字母、字符至少包含两种');
		blurInput('.phonePassword input:last', '! 请确认密码');
	
		//此函数表示  点击某个按钮，某div显示  某div隐藏 且某标签填充某值
		function showHide(object, showObt, label, valueObt) {
			$(object).click(function(e) {
				$(this).closest('.i_login_box').stop().hide();
				$(showObt).stop().show();
				$(label).html($(valueObt).val());
			})
		};
		//点击注册,即邮箱验证第二步
		showHide('.reg_email .reg_btn', '.emailYz', '.emailYz h3 span',
				'.useremail');
		//激活邮箱之后，点击下一步
		showHide('.emailYz .next', '.emailPassword', '.emailPassword h3 span',
				'.useremail');
		//激活邮箱失败，返回上一步 修改信息
		showHide('.emailYz .return', '.reg_step1');
		//点击提交
		showHide('.submit', '.regSuccess');

		//点击注册,即手机验证第二步
		showHide('.reg_phone .reg_btn', '.phoneYz', '.phoneYz h3 span',
				'.userphone');
		//手机验证完之后，点击下一步
		showHide('.phoneYz .next', '.phonePassword', '.phonePassword h3 span',
				'.userphone');
		//手机验证失败，返回上一步 修改信息
		showHide('.phoneYz .return', '.reg_step1');
	})
</script>
</head>

<body>
	<!-- header开始------------------------------------------------------------------------ -->
	<div class="header">
		<div class="header_box">
			<h1 class="logo fl">
				<a href="javascript:;">户外交友_周边游_游记攻略_户外资源共享_乐为游</a>
			</h1>
			<p class="login fr f16 color_f">
				已有账号,直接<a href="login.html">登录</a>
			</p>
		</div>
		<!-- header_box -->
	</div>
	<!-- header -->
	<div class="i_reg p_a">
		<div class="i_reg_box reg_step1">
			<p class="reg_head">
				<a href="javascript:;" class="fl">电子邮箱注册</a> <a href="javascript:;"
					class="fr current">手机号码注册</a>
			</p>
			<div class="reg_body reg_email">
				<p>
					<input id="mailAdress" type="text" placeholder="请输入常用邮箱"
						class="useremail" onBlur="check('mail');" />
				</p>
				<p class="overf">
					<input id="mailCode" type="text" class="yz fl" onBlur="blurCheck('mail');"
						style="width: 150px;" placeholder="图片验证码" /> <a
						href="javascript:next();" class="yzpic fl" title="看不清，换一张"><img
						src="code" height="35" id ='imger1' alt="验证码图片" /></a><br />
				</p>
				<a href="javascript:reg();" class="reg_btn t_a_c bg_orange">立即注册</a>
				<p class="d_login">
					已有账号，<a href="login.html">直接登录</a>
				</p>
			</div>
			<div class="reg_body reg_phone current">
				<p>
					<input id="phoneNo" type="text" placeholder="请输入手机号码"
						class="userphone"  onBlur="check('phone')"/>
				</p>
				<p class="overf">
					<input id="phoneCode" type="text" class="yz fl" onBlur="blurCheck('phone');"
						style="width: 155px;" placeholder="图片验证码" /> <a
						href="javascript:next();;" class="yzpic fl" title="看不清，换一张"><img
						src="code" height="35" id ='imger1' alt="验证码图片" /></a><br />
				</p>
				<a href="javascript:reg();" class="reg_btn t_a_c bg_orange">立即注册</a>
				<p class="d_login">
					已有账号，<a href="login.html">直接登录</a>
				</p>
			</div>
		</div>
		<!-- i_login_box -->
	</div>
	<!-- i_login -->
	<div class="picInfo p_a overf">
		<div class="picInfo_box">
			<div class="picInfo_con">
				<p class="i_icon"></p>
				<p class="i_txt">
					<a href="javascript:;">simon</a> 拍摄于 <a href="javascript:;">鼓浪屿，厦门</a>
				</p>
			</div>
			<!-- picInfo_con -->
		</div>
		<!-- picInfo_box -->
	</div>
</body>
<script type="text/javascript">

	//正则校验
		function check(str){
		
				if(str == 'mail'){
					var  val = $("#mailAdress").val().trim();
					var mailReg = val.match(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/);
		 			if(mailReg){
						blurInput(".useremail","格式正确");
						return true;
					}else{
						blurInput(".useremail","您好，您的邮箱格式输入有误!");
						return false;
					}
				}else if(str == 'phone'){
					var val = $(".userphone").val().trim();
					var phoneReg = val.match(/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/);
					if(phoneReg){
						blurInput(".userphone","格式正确");
						return true;
					}else{
						blurInput(".userphone","您好，您的手机号码格式输入有误!");
						return false;
					}
				}
		   }
				
	//提示错误信息
		function blurInput(object, msg) {
			$(".color_orange").remove();
			var $parent = $(object).parent();
			if (!$(".color_orange").text()) {
				if(msg =='格式正确'){
					$(object).removeClass('blur');
					$parent.find('.onError').remove();
					return;
				}					
				var errorMsg = msg;
				$parent
						.append('<span class="formtips onError color_orange"><br/>'
								+ errorMsg + '</span>');
				$(object).addClass('blur');
			// 消除错误提示
			} else if(msg =='格式正确'){
				alert("1111");
				$(object).removeClass('blur');
				$parent.find('.onError').remove();
			}
			
		};
		
		// 更换验证码 图片	
		function next(){
			$(".yzpic>img").attr("src","http://localhost:8080/app/code?t="+Math.random());
		}	
		
	 // 验证码 匹配
	 	function blurCheck(obj){
	 		var code = $("#imger1").val();
		 	if(obj=='mail'){
		 		
		 		var mailCode = $("#mailCode").val().trim();
		 		// 校验邮箱 验证码
		 		if(mailCode!=null && mailCode!="" && mailCode!="null" && mailCode==code){
		 			blurInput("#mailCode","格式正确");
		 			return true;
		 		}else{
		 			blurInput("#mailCode","您输入验证码有误!");
		 			return false;
		 		}
		 		
		 	}else if(obj=='phone'){
		 		
		 		var phoneCode = $("#phoneCode").val().trim();
		 		// 校验手机 验证码
		 		if(phoneCode!=null && phoneCode!="" && phoneCode!="null" && phoneCode==code){
		 			blurInput("#phoneCode","格式正确");
		 			return true;
		 		}else{
		 			blurInput("#phoneCode","您输入验证码有误!");
		 			return false;
		 		}
		 	}
		};
	
	// 检验当前手机号 邮箱是否已经注册	sadsadsa
   /**  function numCheck(value){
		data = {
				phone : phoneNo,
				code : phoneCode
			};
		
		$.ajax({
			url : "reg/chk",
			type : "post",
			data : data,
			success : function(res) {
			},
			error : function(res) {
			}
		});
	} */	
</script>
</html>
