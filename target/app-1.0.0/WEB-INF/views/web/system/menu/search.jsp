<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	require([ 'dijit/form/Form', 'ext/core' ], function(Form, ext) {
		var ds = ext.form.dSelect({
			name : 'dict.id'
		}, dojo.query('input[name=\'dict.id\']', dijit.byId('G_menu_Q').domNode)[0]);
		ds.store = new dojo.store.Memory({
			data : [ {
				id : 1,
				name : 'root'
			}, {
				id : 2,
				name : 'node'
			} ]
		});
	});
</script>
<div data-dojo-id="G_menu_Q_F" data-dojo-type="dijit/form/Form" data-dojo-props="encType:'multipart/form-data'">
	<table class="dijitDialogPaneContentArea" cellspacing="8">
		<tr>
			<td><label>菜单编号:</label></td>
			<td><input type="text" name="no" required="false" data-dojo-type="dijit/form/ValidationTextBox" /></td>
			<td><label>菜单名称:</label></td>
			<td><input type="text" name="name" required="false" data-dojo-type="dijit/form/ValidationTextBox" /></td>
		</tr>
		<tr>
			<td><label>菜单类型:</label></td>
			<td><input name="dict.id"></td>
			<td><label>上级菜单:</label></td>
			<td><input type="text" name="menu.name" required="false" data-dojo-type="dijit/form/ValidationTextBox"></td>
		</tr>
	</table>
	<div class="dijitDialogPaneActionBar" style="background-color: #ffffff;">
		<button data-dojo-type="dijit.form.Button" type="reset">清除</button>
		<button data-dojo-type="dijit/form/Button" type="button">
			搜索
			<script type="dojo/on" data-dojo-event="click" data-dojo-args="evt">
				require([ 'ext/core' ], function(ext) {
					ext.gridx.store({
						id : 'G_menu',
						url : 'sys/menu/list',
						query : dojo.formToJson(G_menu_Q_F.id)
					});
					dijit.byId('G_menu_Q').hide();
				});
			</script>
		</button>
		<button data-dojo-type="dijit/form/Button" type="button">
			关闭
			<script type="dojo/on" data-dojo-event="click" data-dojo-args="evt">
				dijit.byId('G_menu_Q').hide();
			</script>
		</button>
	</div>
</div>