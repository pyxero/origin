<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="zh">
<meta charset="UTF-8">
<title></title>
<%@ include file="../common/web/lib.jsp"%>
<script>
	require(
			[ "dojo/_base/fx", "dijit/registry", "dojo/parser", "dijit/layout/BorderContainer",
					"dijit/layout/TabContainer", "dojox/layout/ContentPane", "dijit/form/Button", "ext/core",
					"dojo/domReady!" ], function(fx, registry, parser, BorderContainer, TabContainer, ContentPane,
					Button, ext) {

				// create the BorderContainer and attach it to our appLayout div
				var appLayout = new BorderContainer({}, "appLayout");

				// create the TabContainer
				var contentTabs = new TabContainer({
					region : "center",
					id : "contentTabs",
				});

				// add the TabContainer as a child of the BorderContainer
				appLayout.addChild(contentTabs);

				// create and add the BorderContainer edge regions
				appLayout.addChild(new ContentPane({
					region : "top",
					"style" : "text-align:right;",
					content : new Button({
						label : "退出",
						onClick : function() {
							pathname = document.location.pathname;
							location.href = pathname.substr(0, pathname.substr(1).indexOf('/') + 1) + '/logout';
						}
					})
				}));
				var img = 'resources/ui/web/dojo/gridx/resources/images/loadingAnimation.gif';
				appLayout.addChild(new ContentPane({
					region : "left",
					id : "leftCol",
					splitter : true,
					content : "<img name='m_loading' src='"+img+"'><div name='m_tree'></div>"
				}));

				// Add initial content to the TabContainer
				contentTabs.addChild(new ContentPane({
					href : "path?url=home",
					title : "首页"
				}));

				// start up and do layout
				appLayout.startup();

				fx.fadeOut({
					node : "preloader",
					onEnd : function() {
						var callback = function(tree, result) {
							$($('img[name=m_loading]')[0]).hide();
						}
						var click = function(item) {
							if (item.url != '') {
								ext.session();
								if (!dijit.byId("tabs_" + item.id)) {
									cp = new ContentPane({
										id : "tabs_" + item.id,
										title : item.name,
										closable : true,
										href : item.url
									});
									contentTabs.addChild(cp);
									contentTabs.selectChild(cp);
								} else {
									contentTabs.selectChild(dijit.byId("tabs_" + item.id));
								}
							}
						}
						ext.tree({
							name : 'menu',
							url : 's/menu/data',
							callback : callback,
							click : click
						}, 'm_tree');
						$(dojo.byId("preloader")).hide();
					}
				}).play();
			});
</script>
</head>
<body class=claro>
	<div id="preloader">加载中...</div>
	<div id="appLayout"></div>
</body>
</html>