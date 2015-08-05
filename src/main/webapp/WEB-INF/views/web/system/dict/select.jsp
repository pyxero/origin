<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	require([ 'ext/core' ], function(ext) {
		ext.gridx({
			id : 'G_dict_F_S_G',
			url : 's/dict/list',
			style : 'height:250px;',
			structure_self : true,
			structure : [ {
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
				name : "上级字典",
				field : "dict",
				width : "100px",
				decorator : function(cellData, rowId, rowIndex) {
					data = cellData == null ? '' : cellData.name;
					return data;
				}
			} ]
		});
	});
</script>
<div id="G_dict_F_S_G"></div>
<div class="dijitDialogPaneActionBar" style="background-color: #ffffff;">
	<button data-dojo-type="dijit/form/Button" type="button">
		清除
		<script type="dojo/on" data-dojo-event="click" data-dojo-args="evt">
			dijit.byId('G_dict_F_S').ext.transmit.reset();
			dijit.byId('G_dict_F_S').destroyRecursive();
		</script>
	</button>
	<button data-dojo-type="dijit/form/Button" type="button">
		选择
		<script type="dojo/on" data-dojo-event="click" data-dojo-args="evt">
			require([ 'ext/core' ], function(ext) {
				var id = ext.gridx.select({
					id : 'G_dict_F_S_G'
				});
				if (typeof id != 'undefined' && id != '') {
					var callback = function(data) {
						var select = dijit.byId('G_dict_F_S').ext.transmit;
						select.store = new dojo.store.Memory({
							data : [ data ]
						});
						select.setValue(id);
						dijit.byId('G_dict_F_S').destroyRecursive();
					};
					ext.get({
						url : 's/dict/find',
						content : {
							id : id
						},
						callback : callback
					});
				}
			});
		</script>
	</button>
	<button data-dojo-type="dijit/form/Button" type="button">
		关闭
		<script type="dojo/on" data-dojo-event="click" data-dojo-args="evt">
			dijit.byId('G_dict_F_S').destroyRecursive();
		</script>
	</button>
</div>