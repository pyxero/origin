<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	require([ 'ext/core' ], function(ext) {
		ext.gridx({
			id : 'G_menu_F_S_G',
			url : 'sys/menu/list',
			style : 'height:250px;',
			structure_self : true,
			structure : [ {
				name : "菜单编号",
				field : "id",
				width : "130px"
			}, {
				name : "菜单名称",
				field : "name",
				width : "130px"
			}, {
				name : "菜单类型",
				field : "type",
				width : "130px"
			}, {
				name : "上级菜单",
				field : "parent",
				width : "130px"
			} ]
		});
	});
</script>
<div id="G_menu_F_S_G"></div>
<div class="dijitDialogPaneActionBar" style="background-color: #ffffff;">
	<button data-dojo-type="dijit/form/Button" type="button">
		选择
		<script type="dojo/on" data-dojo-event="click" data-dojo-args="evt">
			require([ 'ext/core' ], function(ext) {
				var id = ext.gridx.select({
					id : 'G_menu_F_S_G'
				});
				if (typeof id != 'undefined' && id != '') {
					var callback = function(data) {
						select = dijit.byId('G_menu_F_S').ext.transmit;
						select.store = new dojo.store.Memory({
							data : [ data ]
						});
						select.setValue(id);
						dijit.byId('G_menu_F_S').destroyRecursive();
					};
					ext.get({
						url : 'sys/menu/find',
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
			dijit.byId('G_menu_F_S').destroyRecursive();
		</script>
	</button>
</div>