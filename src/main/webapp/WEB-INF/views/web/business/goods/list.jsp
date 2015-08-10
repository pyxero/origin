<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	require([ 'ext/core' ], function(ext) {
		var model = {
			id : 'G_goods',
			url : 'b/goods/list'
		};
		model.structure = [ {
			name : "商品编号",
			field : "no",
			width : "100px"
		}, {
			name : "商品名称",
			field : "name",
			width : "300px"
		}, {
			name : "商品信息",
			field : "info",
			width : "300px"
		}, {
			name : "商品图片",
			field : "show",
			width : "300px",
			decorator : function(cellData, rowId, rowIndex) {
				return cellData.id;
			}
		} ];
		model.toolbar = new dijit.Toolbar({});
		var labels = {
			'Search' : '搜索',
			'Task' : '新增',
			'Edit' : '编辑',
			'Delete' : '删除'
		};
		dojo.forEach([ 'Search', 'Task', 'Edit', 'Delete' ], function(label) {
			var button = new dijit.form.Button({
				label : labels[label],
				showLabel : true,
				iconClass : 'dijitIcon dijitIcon' + label,
				onclick : 'G_goods_click(\'' + label + '\')'
			});
			model.toolbar.addChild(button);
		});
		ext.gridx(model);
	});

	function G_goods_click(type) {
		require([ 'ext/core' ], function(ext) {
			if (type == 'Delete') {
				var id = ext.gridx.select({
					id : 'G_goods'
				});
				if (typeof id != 'undefined' && id != '') {
					if (confirm('确定要删除数据?')) {
						var callback = function(data) {
							ext.gridx.store({
								id : 'G_goods',
								url : 'b/goods/list'
							});
						};
						ext.get({
							url : 'b/goods/delete',
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
				id : 'G_goods_D',
				title : '商品',
				style : 'width:auto;height:auto;',
				ext : {
					type : 0
				}
			};
			if (type == 'Search') {
				model.id = 'G_goods_Q';
				model.href = 'path?url=business/goods/search';
				model.reload = false;
			}
			if (type == 'Task') {
				model.href = 'path?url=business/goods/form';
				model.ext = {
					type : 0
				}
			}
			if (type == 'Edit') {
				var id = ext.gridx.select({
					id : 'G_goods'
				});
				if (typeof id == 'undefined' || id == '') {
					return;
				}
				model.href = 'path?url=business/goods/form';
				model.ext = {
					type : 1,
					select : id
				}
			}
			ext.dialog(model);
		});
	}
</script>
<div id="G_goods"></div>