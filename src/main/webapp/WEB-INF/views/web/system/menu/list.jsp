<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	require([ 'ext/core' ], function(ext) {
		var model = {
			id : 'G_menu',
			url : 'sys/menu/list'
		};
		model.structure = [ {
			name : "菜单编号",
			field : "no",
			width : "100px"
		}, {
			name : "菜单名称",
			field : "name",
			width : "150px"
		}, {
			name : "是否显示",
			field : "display",
			width : "100px"
		}, {
			name : "菜单类型",
			field : "dict",
			width : "100px",
			decorator : function(cellData, rowId, rowIndex) {
				var data = cellData == null ? "" : cellData.name;
				return data;
			}
		}, {
			name : "顺序",
			field : "sort",
			width : "100px"
		}, {
			name : "上级菜单",
			field : "menu",
			width : "150px",
			decorator : function(cellData, rowId, rowIndex) {
				var data = cellData == null ? "" : cellData.name;
				return data;
			}
		}, {
			name : "路径",
			field : "url",
			width : "250px"
		} ];
		model.toolbar = new dijit.Toolbar({});
		var labels = {
			'Search' : '搜索',
			'Task' : '新增',
			'Edit' : '编辑',
			'Delete' : '删除'
		};
		dojo.forEach([ 'Search', 'Task', 'Edit', 'Delete' ], function(label) {
			button = new dijit.form.Button({
				label : labels[label],
				showLabel : true,
				iconClass : 'dijitIcon dijitIcon' + label,
				onclick : 'G_menu_click(\'' + label + '\')'
			});
			model.toolbar.addChild(button);
		});
		ext.gridx(model);
	});

	function G_menu_click(type) {
		require([ 'ext/core' ], function(ext) {
			if (type == 'Delete') {
				var id = ext.gridx.select({
					id : 'G_menu'
				});
				if (typeof id != 'undefined' && id != '') {
					if (confirm('确定要删除数据?')) {
						var callback = function(data) {
							ext.gridx.store({
								id : 'G_menu',
								url : 'sys/menu/list'
							});
						};
						ext.get({
							url : 'sys/menu/delete',
							content : {
								id : id
							},
							callback : callback
						});
					}
				}
				return;
			}
			var model = {
				id : 'G_menu_D',
				title : '用户',
				style : 'width:auto;height:auto;',
				ext : {
					type : 0
				}
			};
			if (type == 'Search') {
				model.id = 'G_menu_Q';
				model.href = 'path?url=system/menu/search';
				model.reload = false;
			}
			if (type == 'Task') {
				model.href = 'path?url=system/menu/form';
				model.ext = {
					type : 0
				}
			}
			if (type == 'Edit') {
				var id = ext.gridx.select({
					id : 'G_menu'
				});
				if (typeof id == 'undefined' || id == '') {
					return;
				}
				model.href = 'path?url=system/menu/form';
				model.ext = {
					type : 1,
					select : id
				}
			}
			ext.dialog(model);
		});
	}
</script>
<div id="G_menu"></div>