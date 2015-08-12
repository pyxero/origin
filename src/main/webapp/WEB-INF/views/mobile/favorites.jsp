<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>favorites</title>
<%@ include file="../common/mobile/lib.jsp"%>
</head>
<body>
	<div data-role="page" style="background-color: white; width: 100%; height: 100%;">
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
</body>
</html>