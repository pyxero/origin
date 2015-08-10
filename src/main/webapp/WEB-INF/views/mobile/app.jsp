<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>mobile</title>
<%@ include file="../common/mobile/lib.jsp"%>
<script type="text/javascript">
	$().ready(
			function() {
				$('#search').parent().removeClass('ui-body-inherit');
				$('#search').parent().addClass('app-search-alpha');
				$.ajax({
					url : 'b/goods/data?dict.id=4',
					dataType : 'json',
					success : function(response) {
						for (var int = 0; int < response.length; int++) {
							goods.active('#app-active', response[int].active);
						}
					}
				});
				$.ajax({
					url : 'b/goods/data?',
					dataType : 'json',
					success : function(response) {
						for (var int = 0; int < response.length; int++) {
							goods.show('#app-show', response[int].info,
									response[int].show);
						}
					}
				});

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
			style="width: 100%; height: 82%; position: absolute; z-index: 999; top: 0; bottom: 0;">
			<div id="app-active" style="width: 100%; height: 50%;"></div>
			<div id="app-show" class="ui-grid-a" style="padding: 1 1 1 1;"></div>
			<div style="height: 90px; background-color: white;">&nbsp;</div>
		</div>
		<div data-role="footer" data-position="fixed" data-tap-toggle="false" data-theme="b"
			style="height: 10%;">
			<div data-role="navbar" class="ui-navbar" role="navigation">
				<ul class="ui-grid-b">
					<li class="ui-block-a">
						<a href="#" data-icon="home" class="ui-link ui-btn ui-icon-home ui-btn-icon-top"
							style="font-size: 16px;">首页</a>
					</li>
					<!-- ui-btn-active -->
					<li class="ui-block-b">
						<a href="#" data-icon="star" class="ui-link ui-btn ui-icon-star ui-btn-icon-top"
							style="font-size: 16px;">收藏</a>
					</li>
					<li class="ui-block-c">
						<a href="#" data-icon="grid" class="ui-link ui-btn ui-icon-grid ui-btn-icon-top"
							style="font-size: 16px;">购物车</a>
					</li>
					<li class="ui-block-d">
						<a href="#" data-icon="user" class="ui-link ui-btn ui-icon-user ui-btn-icon-top"
							style="font-size: 16px;">我的</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>