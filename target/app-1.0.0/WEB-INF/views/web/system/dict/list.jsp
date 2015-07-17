<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	require([ 'ext/core' ], function(ext) {
		var model = {
			id : 'G_dict',
			url : 'sys/dict/list'
		};
		model.structure = [ {
			name : "区分编号",
			field : "segment",
			width : "100px"
		}, {
			name : "区分名称",
			field : "type",
			width : "100px"
		}, {
			name : "字典编号",
			field : "no",
			width : "100px"
		}, {
			name : "字典名称",
			field : "name",
			width : "100px"
		}, {
			name : "字典简称",
			field : "shortName",
			width : "100px"
		}, {
			name : "排列顺序",
			field : "sort",
			width : "100px"
		}, {
			name : "是否可见",
			field : "display",
			width : "100px",
			decorator : function(cellData, rowId, rowIndex) {
				data = cellData == true ? '是' : '否';
				return data;
			}
		}, {
			name : "可否编辑",
			field : "edit",
			width : "100px",
			decorator : function(cellData, rowId, rowIndex) {
				data = cellData == true ? '是' : '否';
				return data;
			}
		}, {
			name : "上级字典",
			field : "dict",
			width : "100px",
			decorator : function(cellData, rowId, rowIndex) {
				data = cellData == null ? '' : cellData.name;
				return data;
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
				onclick : 'G_dict_click(\'' + label + '\')'
			});
			model.toolbar.addChild(button);
		});
		ext.gridx(model);
	});

	function G_dict_click(type) {
		require([ 'ext/core' ], function(ext) {
			if (type == 'Delete') {
				var id = ext.gridx.select({
					id : 'G_dict'
				});
				if (typeof id != 'undefined' && id != '') {
					if (confirm('确定要删除数据?')) {
						var callback = function(data) {
							ext.gridx.store({
								id : 'G_dict',
								url : 'sys/dict/list'
							});
						};
						ext.get({
							url : 'sys/dict/delete',
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
				id : 'G_dict_D',
				title : '用户',
				style : 'width:auto;height:auto;',
				ext : {
					type : 0
				}
			};
			if (type == 'Search') {
				model.id = 'G_dict_Q';
				model.href = 'path?url=system/dict/search';
				model.reload = false;
			}
			if (type == 'Task') {
				model.href = 'path?url=system/dict/form';
				model.ext = {
					type : 0
				}
			}
			if (type == 'Edit') {
				var id = ext.gridx.select({
					id : 'G_dict'
				});
				if (typeof id == 'undefined' || id == '') {
					return;
				}
				model.href = 'path?url=system/dict/form';
				model.ext = {
					type : 1,
					select : id
				}
			}
			ext.dialog(model);
		});
	}
</script>
<div id="G_dict"></div>