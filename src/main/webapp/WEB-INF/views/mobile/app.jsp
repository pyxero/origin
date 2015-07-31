<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>mobile</title>
<%@ include file="../common/mobile/lib.jsp"%>
<style type="text/css">
.alpha {
	background-color: #eee;
	border-color: #ddd;
	opacity: 0.5;
	filter: alpha(opacity : 50);
}
</style>
<script type="text/javascript">
	$().ready(function() {
		$('#search').parent().removeClass('ui-body-inherit');
		$('#search').parent().addClass('alpha')
	});
</script>
</head>
<body>
	<div data-role="page" style="background-color: white; width: 100%; height: 100%;">
		<div data-role="header" data-position="fixed" data-tap-toggle="false"
			style="width: 100%; height: 8%; background: none; border: 0px;">
			<input id="search" type="search" value="" style="width: 100%; height: 100%;">
		</div>
		<div role="main"
			style="background-color: #ddd; position: absolute; z-index: 999; top: 0; bottom: 0;">
			<img src="resources/img/goods/salesmore/559cf2aeN2ea5ba05.jpg"
				style="width: 100%; height: 50%;" />
			<div class="ui-grid-a" style="padding: 1 1 1 1;">
				<div class="ui-block-a">
					<a href="#" style="text-decoration: none;">
						<div class="ui-bar ui-bar-a"
							style="height: 100%; background: white; text-align: center;">
							<img alt="" src="resources/img/goods/winepress.jpg"
								style="width: 100%; height: 80%;">
							<div style="width: 100%; height: 20%; text-align: center;">
								<p
									style="margin: 0 0 0 0; font-size: 20px; font: 22px/24px Arial, Helvetica, sans-serif; color: #9D9D9D;">美的WJS1241E
									料理原汁机多功能果汁机慢速榨汁机</p>
							</div>
						</div>
					</a>
				</div>
				<div class="ui-block-b">
					<a href="#" style="text-decoration: none;">
						<div class="ui-bar ui-bar-a"
							style="height: 100%; background: white; text-align: center;">
							<img alt="" src="resources/img/goods/purifier.jpg"
								style="width: 100%; height: 80%;">
							<div style="width: 100%; height: 20%; text-align: center;">
								<p
									style="margin: 0 0 0 0; font-size: 20px; font: 22px/24px Arial, Helvetica, sans-serif; color: #9D9D9D;">瑞典布鲁雅尔303
									空气净化器[CADR:280立方米/小时]</p>
							</div>
						</div>
					</a>
				</div>
				<div class="ui-block-a">
					<a href="#" style="text-decoration: none;">
						<div class="ui-bar ui-bar-a"
							style="height: 100%; background: white; text-align: center;">
							<img alt="" src="resources/img/goods/earphone.jpg"
								style="width: 100%; height: 80%;">
							<div style="width: 100%; height: 20%; text-align: center;">
								<p
									style="margin: 0 0 0 0; font-size: 20px; font: 22px/24px Arial, Helvetica, sans-serif; color: #9D9D9D;">Beats
									Mixr混音师 头戴贴耳监听耳机 Hi-Fi版 黄色带麦</p>
							</div>
						</div>
					</a>
				</div>
				<div class="ui-block-b">
					<a href="#" style="text-decoration: none;">
						<div class="ui-bar ui-bar-a"
							style="height: 100%; background: white; text-align: center;">
							<img alt="" src="resources/img/goods/televisor.jpg"
								style="width: 100%; height: 80%;">
							<div style="width: 100%; height: 20%; text-align: center;">
								<p
									style="margin: 0 0 0 0; font-size: 20px; font: 22px/24px Arial, Helvetica, sans-serif; color: #9D9D9D;">飞利浦55PFF3655/T3
									55英寸全高清LED液晶电视(黑色)</p>
							</div>
						</div>
					</a>
				</div>
				<div class="ui-block-a" style="height: 20%;"></div>
				<div class="ui-block-b" style="height: 20%;"></div>
			</div>
		</div>
		<div data-role="footer" data-position="fixed" data-tap-toggle="false" data-theme="b"
			style="height: 10%;">
			<div data-role="navbar" class="ui-navbar" role="navigation">
				<ul class="ui-grid-b">
					<li class="ui-block-a"><a href="#" data-icon="home"
						class="ui-link ui-btn ui-icon-home ui-btn-icon-top" style="font-size: 16px;">首页</a></li>
					<!-- ui-btn-active -->
					<li class="ui-block-b"><a href="#" data-icon="star"
						class="ui-link ui-btn ui-icon-star ui-btn-icon-top" style="font-size: 16px;">收藏</a></li>
					<li class="ui-block-c"><a href="#" data-icon="grid"
						class="ui-link ui-btn ui-icon-grid ui-btn-icon-top" style="font-size: 16px;">购物车</a></li>
					<li class="ui-block-d"><a href="#" data-icon="user"
						class="ui-link ui-btn ui-icon-user ui-btn-icon-top" style="font-size: 16px;">我的</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>