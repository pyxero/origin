<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	require([ 'ext/core' ], function(ext) {
		ext.gridx({
			id : 'G_user_F_S_G',
			url : 'hr/employee/list',
			style : 'height:250px;',
			structure_self : true,
			structure : [ {
				name : '员工号',
				field : 'no',
				width : '100px'
			}, {
				name : '员工姓名',
				field : 'name',
				width : '150px'
			}, {
				name : '部门',
				field : 'dept',
				width : '150px'
			} ]
		});
	});
</script>
<div id="G_user_F_S_G"></div>
<div class="dijitDialogPaneActionBar" style="background-color: #ffffff;">
	<button data-dojo-type="dijit/form/Button" type="button">
		选择
		<script type="dojo/on" data-dojo-event="click" data-dojo-args="evt">
			require([ 'ext/core' ], function(ext) {
				var id = ext.gridx.select({
					id : 'G_user_F_S_G'
				});
				if (typeof id != 'undefined' && id != '') {
					var callback = function(data) {
						var select = dijit.byId('G_user_F_S').ext.transmit;
						select.store = new dojo.store.Memory({
							data : [ data ]
						});
						select.setValue(id);
						dijit.byId('G_user_F_S').destroyRecursive();
					};
					ext.get({
						url : 'hr/employee/find',
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
			dijit.byId('G_user_F_S').destroyRecursive();
		</script>
	</button>
</div>