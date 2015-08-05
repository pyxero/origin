<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	require([ 'dijit/form/Form', 'ext/core' ], function(form, ext) {
		var dictDs = ext.form.dSelect({
			name : 'dict.id'
		}, dojo.query('input[name=\'dict.id\']', dijit.byId('G_menu_D').domNode)[0]);
		dictDs.store = new dojo.store.Memory({
			data : [ {
				id : 1,
				name : 'root'
			}, {
				id : 2,
				name : 'node'
			} ]
		});
		var displayDs = ext.form.dSelect({
			name : 'display'
		}, dojo.query('input[name=\'display\']', dijit.byId('G_menu_D').domNode)[0]);
		displayDs.store = new dojo.store.Memory({
			data : [ {
				id : true,
				name : '是'
			}, {
				id : false,
				name : '否'
			} ]
		});
		ps = ext.form.pSelect({
			name : 'menu.id',
			required : false
		}, dojo.query('input[name=\'menu.id\']', dijit.byId('G_menu_D').domNode)[0]);
		dojo.connect(ps, 'onClick', function() {
			ext.dialog({
				id : 'G_menu_F_S',
				title : '菜单选择',
				href : 'path?url=system/menu/select',
				style : 'width:570px;height:350px;',
				ext : {
					transmit : ps
				}
			}).show();
		});

		var dialog = dijit.byId('G_menu_D');
		if (dialog.ext.type == 1) {
			var callback = function(data) {
				ps.store = new dojo.store.Memory({
					data : data.menu == null ? [] : [ data.menu ]
				});
				dictDs.setValue(data.dict.id);
				G_menu_F.setValues(data);
			};
			ext.get({
				url : 's/menu/find',
				content : {
					id : dijit.byId('G_menu_D').ext.select
				},
				callback : callback
			});
		}
	});
</script>
<div data-dojo-id="G_menu_F" data-dojo-type="dijit/form/Form" encType="multipart/form-data">
	<table class="dijitDialogPaneContentArea" cellspacing="8">
		<tr>
			<td><label>菜单编号:</label></td>
			<input type="hidden" name="id" data-dojo-type="dijit/form/ValidationTextBox" />
			<input type="hidden" name="version" data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="value:0" />
			<td><input type="text" name="no" data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:true" /></td>
			<td><label>菜单名称:</label></td>
			<td><input type="text" name="name" data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:true" /></td>
		</tr>
		<tr>
			<td><label>菜单类型:</label></td>
			<td><input type="text" name="dict.id"></td>
			<td><label>显示顺序:</label></td>
			<td><input type="text" name="sort" data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:false" /></td>
		</tr>
		<tr>
			<td><label>上级菜单:</label></td>
			<td><input type="text" name="menu.id"></td>
			<td><label>是否显示:</label></td>
			<td><input type="text" name="display"></td>
		</tr>
		<tr>
			<td><label>路径:</label></td>
			<td><input type="text" name="url" data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:false"></td>
		</tr>
	</table>
	<div class="dijitDialogPaneActionBar" style="background-color: #ffffff;">
		<button data-dojo-type="dijit/form/Button" type="button">
			保存
			<script type="dojo/on" data-dojo-event="click" data-dojo-args="evt">
				require([ 'ext/core' ], function(ext) {
					if (G_menu_F.validate()) {
						var callback = function(data) {
							if (data.flag) {
								ext.gridx.store({
									id : 'G_menu'
								});
								dijit.byId('G_menu_D').hide();
							} else {
								alert(data.msg);
							}
						};
						ext.form.submit({
							url : 's/menu/save',
							form : G_menu_F.domNode,
							callback : callback,
						});
					}
				});
			</script>
		</button>
		<button data-dojo-type="dijit/form/Button" type="button">
			关闭
			<script type="dojo/on" data-dojo-event="click" data-dojo-args="evt">
				dijit.byId('G_menu_D').hide();
			</script>
		</button>
	</div>
</div>