<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>mobile</title>
<%@ include file="../common/mobile/lib.jsp"%>
</head>
<body>
	<div id="app-page" data-role="page"
		style="background-color: white; width: 100%; height: 100%;">
		<div data-role="header" data-position="fixed" data-tap-toggle="false"
			style="width: 100%; height: 8%; background: none; border: 0px;">
			<input id="app-page-search" type="search" value="" style="width: 100%; height: 100%;">
		</div>
		<div role="main"
			style="width: 100%; height: 82%; position: absolute; z-index: 999; top: 0; bottom: 0;">
			<div class="slider-wrapper theme-default">
				<div id="app-active" class="nivoSlider"></div>
			</div>
			<div id="app-show" class="ui-grid-a" style="padding: 1 1 1 1;"></div>
			<button id="app-more" style="height: 40px; width: 100%; display: none; color: #9D9D9D;"
				class="show-page-loading-msg" data-textonly="false" data-textvisible="false"
				data-msgtext="" data-inline="true" onclick="more('#app-show')">加载更多</button>
			<div style="height: 70px;">&nbsp;</div>
		</div>
		<div data-role="footer" data-position="fixed" data-tap-toggle="false"
			style="height: 10%;" data-theme="b">
			<div data-role="navbar" class="ui-navbar" role="navigation">
				<ul class="ui-grid-b">
					<li class="ui-block-a">
						<a href="<%=request.getContextPath()%>/" target="_top" data-icon="home"
							class="ui-link ui-btn ui-icon-home ui-btn-icon-top" style="font-size: 16px;">首页</a>
					</li>
					<!-- ui-btn-active -->
					<li class="ui-block-b">
						<a href="path?url=favorites" target="_top" data-icon="star"
							class="ui-link ui-btn ui-icon-star ui-btn-icon-top" style="font-size: 16px;">收藏</a>
					</li>
					<li class="ui-block-c">
						<a href="path?url=trolleys" target="_top" data-icon="grid"
							class="ui-link ui-btn ui-icon-grid ui-btn-icon-top" style="font-size: 16px;">购物车</a>
					</li>
					<li class="ui-block-d">
						<a href="path?url=center" target="_top" data-icon="user"
							class="ui-link ui-btn ui-icon-user ui-btn-icon-top" style="font-size: 16px;">我的</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div id="app-hote" data-role="page" style="width: 100%; height: 100%;">
		<div data-role="header" data-position="fixed" data-tap-toggle="false"
			style="width: 100%; height: 40px; background: none; border: 0px;">
			<input id="app-hote-search" type="search" value="" style="width: 100%; height: 100%;">
		</div>
		<div role="main" style="width: 100%;">
			<p>热门搜索</p>
			<p>电器、化妆品</p>
		</div>
	</div>
	<script type="text/javascript">
	function more(target) {
	    var count = $('div[class^=ui-block-]', target).length;
	    var start = 1;
	    if (count > 6) {
		start = (count % 6);
	    }
	    $
		    .ajax({
			url : 'show/goods/data?count=6&start=' + start,
			dataType : 'json',
			success : function(response) {
			    for (var int = 0; int < response.data.length; int++) {
				goods.show('#app-show',
					response.data[int].show,
					response.data[int].info,
					response.data[int].price);
			    }
			    console
				    .log($('div[class^=ui-block-]', target).length);
			    console.log(response.count);
			    if ($('div[class^=ui-block-]', target).length == response.count) {
				$('#app-more').css('display', 'none');
			    } else {
				$('#app-more').css('display', 'block');
			    }
			}
		    });
	}
	$()
		.ready(
			function() {
			    $
				    .ajax({
					url : 'show/goods/data?dict.id=4&count=6&start=0',
					dataType : 'json',
					success : function(response) {
					    for (var int = 0; int < response.data.length; int++) {
						goods
							.active(
								'#app-active',
								response.data[int].active);
					    }
					    $('#app-active').nivoSlider({
						directionNav : false,
						controlNav : false
					    });
					}
				    });
			    $
				    .ajax({
					url : 'show/goods/data?count=6&start=0',
					dataType : 'json',
					success : function(response) {
					    for (var int = 0; int < response.data.length; int++) {
						goods
							.show(
								'#app-show',
								response.data[int].show,
								response.data[int].info,
								response.data[int].price);
					    }
					    if ($('div[class^=ui-block-]',
						    '#app-show').length == response.count) {
						$('#app-more').css('display',
							'none');
					    } else {
						$('#app-more').css('display',
							'block');
					    }
					}
				    });
			    $('#app-page-search').parent().removeClass(
				    'ui-body-inherit');
			    $('#app-page-search').parent().addClass(
				    'app-search-alpha');
			    $('#app-page-search').focus(function() {
				$('#app-page').hide();
				$('#app-hote').show();
				$('#app-hote-search').focus();
			    });
			    $("#app-hote-search").keydown(function(event) {
				if (event.keyCode == 13) {
				    $('#app-page').show();
				    $('#app-hote').hide();
				}
			    });
			    $('#app-hote-search').blur(function() {
				$('#app-page').show();
				$('#app-hote').hide();
			    });
			});
    </script>
</body>
</html>