<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="zh">
<meta charset="utf-8">
<title></title>
<%@ include file="../common/web/lib.jsp"%>
<script>
	require(['dojo', 'dojo/_base/fx', 'dojo/dom-style', 'dojo/data/ItemFileReadStore', 'dijit/tree/ForestStoreModel', 'dijit/Tree', 'dojox/layout/ContentPane', 'ext/core', 'dojo/parser', 'dojo/ready'],
					function(dojo, baseFx, domStyle, ItemFileReadStore, ForestStoreModel, Tree, ContentPane, ext, parser, ready) {
						  ready(function() {
						    parser.parse().then(function() {
						      baseFx.fadeOut({
						        node: 'preloader',
						        onEnd: function() {
						          var tree = function(node, children) {
						            var store = ItemFileReadStore({
						              data: {
						                identifier: 'id',
						                label: 'name',
						                items: children
						              }
						            });

						            var treeModel = new ForestStoreModel({
						              store: store
						            });

						            var tree = new Tree({
						              id: node.no + '_Tree',
						              title: node.name,
						              model: treeModel,
						              showRoot: false,
						              onClick: function(item) {
						                if (item.url != '') {
						                  ext.session();
						                  if (!dijit.byId('ContentPane_' + item.id)) {
						                    cp = new ContentPane({
						                      id: 'ContentPane_' + item.id,
						                      title: item.name,
						                      closable: true,
						                      href: item.url
						                    });
						                    dijit.byId('mainTabContainer').addChild(cp);
						                    dijit.byId('mainTabContainer').selectChild(cp);
						                  } else {
						                    dijit.byId('mainTabContainer').selectChild(dijit.byId('ContentPane_' + item.id));
						                  }
						                }
						              }
						            });

						            var contentPane = new ContentPane({
						              title: node.name
						            });
						            contentPane.addChild(tree);
						            dijit.byId('leftAccordion').addChild(contentPane);
						            dijit.byId('leftAccordion').removeChild(dijit.byId('menu_ContentPane'));
						          }

						          sortFun = function(order, sortBy) {
						            var ordAlpah = (order == 'asc') ? '>': '<';
						            var sortFun = new Function('a', 'b', 'return a.' + sortBy + ordAlpah + 'b.' + sortBy + '?1:-1');
						            return sortFun;
						          }

						          level = function(obj, array) {
						            for (var i in array) {
						              if (array[i].menu != null && array[i].menu.id == obj.id) {
						                if (typeof obj.children == 'undefined') {
						                  obj.children = new Array();
						                }
						                obj.children.push({
						                  id: array[i].id,
						                  no: array[i].no,
						                  name: array[i].name,
						                  sort: array[i].sort,
						                  url: array[i].url
						                });
						                level(obj.children[obj.children.length - 1], array);
						              }
						            }
						          }

						          child = function(obj, array, children) {
						            for (var i in array) {
						              if (array[i].menu != null && array[i].menu.id == obj.id) {
						                children.push({
						                  id: array[i].id,
						                  no: array[i].no,
						                  name: array[i].name,
						                  sort: array[i].sort,
						                  url: array[i].url
						                });
						                level(children[children.length - 1], array);
						              }
						            }
						            children.sort(sortFun('asc', 'sort'));
						          }

						          var callback = function(array) {
						            panel = new Array();
						            for (var i in array) {
						              if (array[i].dict != null && array[i].dict.no == '0') {
						                panel.push({
						                  id: array[i].id,
						                  no: array[i].no,
						                  name: array[i].name,
						                  sort: array[i].sort
						                });
						              }
						            }
						            panel.sort(sortFun('asc', 'sort'));
						            for (var i in panel) {
						              children = new Array();
						              child(panel[i], array, children);
						              tree(panel[i], children);
						            }
						          }

						          ext.get({
						            url: 's/menu/data',
						            callback: callback
						          });
						          domStyle.set('preloader', 'display', 'none');
						        }
						      }).play();
						    });
						  });
	});
</script>
</head>
<body class=claro>
	<div id="preloader">加载中...</div>
	<div data-dojo-type="dijit/layout/BorderContainer" id="mainContainer" data-dojo-props="gutters:true">
		<div data-dojo-type="dijit/layout/ContentPane" id="headerPane" data-dojo-props="splitter:false, region:'top'">
			<table style="width: 100%;">
				<tr>
					<td style="width: 98%;"></td>
					<td style="width: 2%;">
						<button data-dojo-id="jsid" data-dojo-type="dijit/form/Button" type="button" style="font-size: 12px; font-weight: normal;">
							退出
							<script type="dojo/on" data-dojo-event="click" data-dojo-args="evt">
								pathname = document.location.pathname;
								location.href = pathname.substr(0, pathname.substr(1).indexOf('/') + 1) + '/logout';
							</script>
						</button>
					</td>
				</tr>
			</table>
		</div>
		<div data-dojo-type="dijit/layout/BorderContainer" id="mainSplitter" data-dojo-props="liveSplitters: false, design: 'sidebar', region: 'center'">
			<div data-dojo-type="dijit/layout/AccordionContainer" id="leftAccordion" data-dojo-props="splitter: true,minSize: 100, region: 'leading'">
				<div data-dojo-type="dijit/layout/ContentPane" id="menu_ContentPane" data-dojo-props="title: ''">
					<img id="loading" alt="loading" src="<%=request.getContextPath()%>/resources/ui/web/dojo/gridx/resources/images/loadingAnimation.gif">
				</div>
			</div>
			<div data-dojo-type="dijit/layout/TabContainer" id="mainTabContainer" data-dojo-props="region: 'center'">
				<div data-dojo-type="dijit/layout/ContentPane" id="welcome_ContentPane" data-dojo-props="title: '首页'"></div>
			</div>
		</div>
	</div>
</body>
</html>