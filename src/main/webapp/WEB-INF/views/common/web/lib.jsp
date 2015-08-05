<link type="image/x-icon" rel="icon" href="<%=request.getContextPath()%>/resources/img/favicon.ico">
<link type="image/x-icon" rel="shortcut icon" href="<%=request.getContextPath()%>/resources/img/favicon.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/web/style.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/ui/web/dojo/dijit/themes/claro/claro.css">
<script>
	dojoConfig = {
		has : {
			'dojo-firebug' : true
		},
		async : true
	};
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/ui/web/dojo/dojo/dojo.js"></script>
<script type="text/javascript">
	require([ 'dojo' ], function(dojo) {
		pathname = document.location.pathname;
		path = pathname.substr(0, pathname.substr(1).indexOf('/') + 1) + '/resources/ui/web/dojo/ext'
		dojo.registerModulePath('ext', path);
	});
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery/jquery-2.1.4.min.js"></script>