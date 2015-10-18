<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>乐为游_注册</title>
<%@ include file="../common/web/lib.jsp"%>;
<style>


	.reg_btn2{height:35px;color:#fff;border-radius:3px;}
	.reg_btn3 { display: block;  line-height: 35px;  color: #fff;  margin-top: -14px;  border-radius: 3px; 
</style>
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
		//	if(!blurCheck('#mailCode')){return ;}
		//	if(!blurCheck('#timeMail')){return ;}
			
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
	//		if(!blurCheck('#phoneCode')){return ;}
	//		if(!blurCheck('#timePhone')){return ;}
			
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
		if($(".reg_btn2").val().indexOf("重新获取") >0 ){
			if(typeof $("#mailTimeLiness").val() !='undefined' && !(($("#mailTimeLiness").val() == ""))){
				
				data = {timeCode:$("#mailTimeLiness").val(),mail:$("#mailAdress").val()}
				//给完成注册 按钮添加 click，save 
				$.ajax({
					url : "reg/checkCode",
					type : "post",
					async: false,
					data : data,
					success : function(res){
						var str =  res.toString().split(",");
						var status = str[0];
					// 验证码输入不正确	
						if(status.indexOf("0") > 0){
							blurInput('#mailTimeLiness', '抱歉,输入验证码有误!');	
							return ;
					// 验证码超时		
						}else if(status.indexOf("2") > 0){
							blurInput('#mailTimeLiness', '抱歉,验证码已超时!！');
							return ;
						}
					},error:function(res){} 
				});
				return ;
			}else if(typeof $("#phoneTimeLiness").val() !='undefined'&& !($("#phoneTimeLiness").val() == "") ){
				//给完成注册 按钮添加 click，save 
				data = {timeCode:$("#phoneTimeLiness").val(),phone:$("#phoneNo").val()}
				$.ajax({
					url : "reg/checkCode",
					type : "post",
					async: false,
					data : data,
					success : function(res) {
						var str =  res.toString().split(",");
						var status = str[0];
					// 验证码输入不正确	
						if(status.indexOf("0") > 0){
							blurInput('#phoneTimeLiness', '抱歉,输入验证码有误!');	
							return ;
					// 验证码超时		
						}else if(status.indexOf("2") > 0){
							blurInput('#phoneTimeLiness', '抱歉,验证码已超时!！');
							return ;
						}
					},error:function(res){
					}
				});
					return ;
			}else{ 
				blurInput('#phoneTimeLiness',"验证码不能为空");
				blurInput('#mailTimeLiness',"验证码不能为空");
				return ;
			}
		}
		// 先去 比对 图片验证码， 返回状态
		$.ajax({
			url : "reg/info",
			type : "post",
			data : data,
			success : function(res) {
					var str =  res.split(",");
					var status = str[0];
					var msg = str[1];
					if(status.indexOf("0") >0){	
						if(msg.indexOf("mail") > 0){
							blurInput("#mailCode","您输入验证码有误!");		
							return ;
						}
						if(msg.indexOf("phone") >0){
							blurInput("#phoneCode","您输入验证码有误!");	
							return ;
						}
					}else if (status.indexOf("2") >0){
						if(msg.indexOf("mail") > 0){
							
							$("#overfMail").hide();// 隐藏图片验证码	
							$(".mailLiness").show();// 显示获取验证码
							$("#mailReg").text("完成注册");
							
							if($("#reg_phone").val().indexOf("获取手机验证码")>0){
								timeSpace("    获取手机验证码     ");
							}else if($("#reg_mail").val().indexOf("获取邮箱验证码")>0){
								timeSpace("    获取邮箱验证码     ");
							}
							
							$("#mailAdress").attr("disabled",true);
							$("#phoneNo").attr("disabled",true);
							$("#phoneCode").attr("disabled",true);
							$("#phoneReg").removeAttr('href');
							return ;
						}
						if(msg.indexOf("phone") >0){
							
							$("#overfPhone").hide();
							$(".phoneLiness").show();
							$("#phoneReg").text("完成注册");
							$("#phoneNo").attr("disabled",true);
							
							$("#mailAdress").attr("disabled",true);
							$("#mailCode").attr("disabled",true);
							$('#mailReg').removeAttr('href');
							
							if($("#reg_phone").val().indexOf("获取手机验证码")>0){
									timeSpace("    获取手机验证码     ");
							}else if($("#reg_mail").val().indexOf("获取邮箱验证码")>0){
								timeSpace("    获取邮箱验证码     ");
							}
							return ;
						}
					}
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
//		blurInput('.phone', '! 请输入手机号码');
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
				<p class="overf" id='overfMail'>
					<input id="mailCode" type="text" class="yz fl" onBlur="blurCheck('#mailCode','0');"
						style="width: 150px;" placeholder="图片验证码"   maxlength="4"/> <a
						href="javascript:next();" class="yzpic fl" title="看不清，换一张"><img
						src="code" height="35" id ='imger1' alt="验证码图片" /></a><br />
				</p>
				<p class="mailLiness timeLiness" >
					<input id ='mailTimeLiness' type='text' maxlength="6" id ='timeMail' onBlur="blurCheck('#timeMail','1');" style="width: 125px;" placeholder="请输入邮箱验证码" class="useremail" />
					&nbsp;
					<input type='button' id ='reg_mail'   class='reg_btn2 t_a_c bg_orange' onClick='time("mail");' value='    获取邮箱验证码     ' />
				</p>
				<br />	
					<a href="javascript:reg();" id='mailReg'  class="reg_btn3 t_a_c bg_orange" >下一步</a>
					<p class="d_login">
						已有账号，<a href="login.html">直接登录</a>
					</p>
			</div>
			<div class="reg_body reg_phone current">
				<p>
					<input id="phoneNo" type="text" placeholder="请输入手机号码"
						class="userphone phone"  onBlur="check('phone')"/>
				</p>
				<p class="overf" id='overfPhone'>
					<input id="phoneCode" type="text" class="yz fl" onBlur="blurCheck('#phoneCode','0');"
						style="width: 155px;" placeholder="图片验证码" maxlength="4" /> <a
						href="javascript:next();;" class="yzpic fl" title="看不清，换一张"><img
						src="code" height="35" id ='imger1' alt="验证码图片" /></a><br />
				</p>
				
			<p class="phoneLiness timeLiness" >
					<input id ='phoneTimeLiness' id ='timePhone'  onBlur="blurCheck('#timePhone','1');" type='text'  maxlength="6"  style="width: 125px;" placeholder="请输入手机验证码" class="userphone" />
					&nbsp;
					<input type='button' id ='reg_phone'  class='reg_btn2 t_a_c bg_orange' onClick='time("phone");' value='    获取手机验证码     ' />
				</p>
				<br />
				<a href="javascript:reg();" id='phoneReg' class="reg_btn3 t_a_c bg_orange">下一步</a>
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
		 $(".timeLiness").hide();
	//正则校验
		function check(str){
		
				if(str == 'mail'){
					var  val = $("#mailAdress").val().trim();
				// 校验空	
					if(!val){
						blurInput(".useremail","您好，邮箱还未填写喔！");
						return ;
					}
					var mailReg = val.match(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/);
		 			if(mailReg){
						blurInput(".useremail","格式正确");
						return true;
					}else{
						blurInput(".useremail","您好，您的邮箱格式输入有误!");
						return false;
					}
				}else if(str == 'phone'){
					var val = $(".phone").val().trim();
				// 校验空	
					if(!val){
						blurInput(".phone","您好，手机号还未填写喔！");
						return ;
					}
					var phoneReg = val.match(/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/);
					if(phoneReg){
						blurInput(".phone","格式正确");
						return true;
					}else{
						blurInput(".phone","您好，您的手机号码格式输入有误!");
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
				$(object).removeClass('blur');
				$parent.find('.onError').remove();
			}
			
		};
		
		// 更换验证码 图片	
		function next(){
			$(".yzpic>img").attr("src","http://localhost:8080/app/code?t="+Math.random());
		}	
		
	 // 验证码 匹配
	 	function blurCheck(id,status){
		 		if(status == '0'){
			 		var mailCode = $(id).val().trim();
		 		}else{
			 		var mailCode = $(id).val();
		 		}
		 		if(!mailCode){
		 			blurInput(id,"验证码不能为空");
		 			return false;
		 		}else{
		 			blurInput(id,"格式正确");
		 			reg();
		 			return true;
		 		}
		};
		
	// 发送验证码
		function time(obj){
			if(obj =='mail'){
				if($("#reg_mail").val().indexOf("获取邮箱验证码")>0){
					reg();
					timeSpace("获取邮箱验证码");
				}else{
				}
			}else{
				if($("#reg_phone").val().indexOf("获取手机验证码")>0){
					reg();
					timeSpace("获取手机验证码");
				}else{}
			}
			
		};
// 60倒计时
		var wait=60;
    	function timeSpace(obj) {
    	        if (wait == 0) {
    	        	$(".reg_btn2").removeAttr('disabled');  // 可用
    	        	$(".reg_btn2").addClass("bg_orange");   //恢复原样式
    	            $(".reg_btn2").val(obj);  //回复原文字
    	            $(".reg_btn3").removeAttr('disabled'); 
    	            wait = 60;
    	        } else {
    	        	$(".reg_btn2").attr('disabled',"true");	
    	        	$(".reg_btn3").attr('disabled',"true");	
    	        	$(".reg_btn2").removeClass("bg_orange");
    	        	$(".reg_btn2").val("    重新获取  ( " + wait + " )      ");
    	            wait--;
    	            setTimeout(function() {
    	            	timeSpace();
    	            },
    	            1000);
    	        }
    	    };
</script>
</html>
