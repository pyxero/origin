<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<%@ include file="../common/mobile/lib.jsp"%>
<style type="text/css">
</style>
<script type="text/javascript">
	$().ready(function() {
	});
	function submit() {
		var data = 'no=' + $('input[name=no]')[0].value + '&password='
				+ $('input[name=password]')[0].value;
		$.ajax({
			url : 'verify',
			data : data,
			dataType : 'json',
			success : function(response) {
				if (response.flag) {
					pathname = document.location.pathname;
					path = pathname.substr(0,
							pathname.substr(1).indexOf('/') + 1);
					if (path == '') {
						path = '/'
					}
					location.href = path;
				} else {
					$('#error').html(response.msg);
					return;
				}
			}
		});
	}
</script>
</head>
<body>
	<div data-role="page" data-dialog="true" data-url="" data-external-page="true" tabindex="0" data-close-btn="none" class="ui-page ui-page-theme-a ui-dialog ui-page-active">
		<div data-role="header" role="banner" class="ui-header ui-bar-b">
			<h1 class="ui-title" role="heading" aria-level="1">登录</h1>
		</div>
		<div role="main" class="ui-content">
			<p>
				<label for="text-basic">用户:</label> <input type="text" name="no" id="text-basic" value="">
			</p>
			<p>
				<label for="text-basic">名称:</label> <input type="password" name="password" id="text-basic" value="">
			</p>
			<p>
				<label id="error"></label>
			</p>
			<a href="javascript:submit();" class="ui-btn ui-shadow ui-corner-all ui-btn-a">登录</a>
		</div>
	</div>
</body>
</html>
