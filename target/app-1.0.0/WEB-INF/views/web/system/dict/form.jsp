<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	require([ 'dijit/form/Form', 'ext/core' ], function(form, ext) {
		dojo.forEach([ 'display', 'edit' ], function(w) {
			var ds = ext.form.dSelect({
				name : w
			}, dojo.query('input[name=\'' + w + '\']', dijit.byId('G_dict_D').domNode)[0]);
			ds.store = new dojo.store.Memory({
				data : [ {
					id : true,
					name : '是'
				}, {
					id : false,
					name : '否'
				} ]
			});

		})

		var ps = ext.form.pSelect({
			name : 'dict.id',
			required : true
		}, dojo.query('input[name=\'dict.id\']', dijit.byId('G_dict_D').domNode)[0]);
		dojo.connect(ps, 'onClick', function() {
			ext.dialog({
				id : 'G_dict_F_S',
				title : '字典选择',
				href : 'path?url=system/dict/select',
				style : 'width:570px;height:350px;',
				ext : {
					transmit : ps
				}
			}).show();
		});

		var dialog = dijit.byId('G_dict_D');
		if (dialog.ext.type == 1) {
			var callback = function(data) {
				ps.store = new dojo.store.Memory({
					data : [ data.dict || '' ]
				});
				G_dict_F.setValues(data);
			};
			ext.get({
				url : 'sys/dict/find',
				content : {
					id : dijit.byId('G_dict_D').ext.select
				},
				callback : callback
			});
		}
	});
</script>
<div data-dojo-id="G_dict_F" data-dojo-type="dijit/form/Form" encType="multipart/form-data">
	<table class="dijitDialogPaneContentArea" cellspacing="8">
		<input type="hidden" name="id" data-dojo-type="dijit/form/ValidationTextBox" />
		<tr>
			<td><label>区分编号:</label></td>
			<td><input type="text" name="segment" data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:true" /></td>
			<td><label>区分名称:</label></td>
			<td><input type="text" name="type" data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:true" /></td>
		</tr>
		<tr>
			<td><label>字典编号:</label></td>
			<td><input type="text" name="no" data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:true" /></td>
			<td><label>字典名称:</label></td>
			<td><input type="text" name="name" data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:true" /></td>
		</tr>
		<tr>
			<td><label>字典简称:</label></td>
			<td><input type="text" name="shortName" data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:false" /></td>
			<td><label>排列顺序:</label></td>
			<td><input type="text" name="sort" data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:false" /></td>

		</tr>
		<tr>
			<td><label>是否可见:</label></td>
			<td><input type="text" name="display"></td>
			<td><label>可否编辑:</label></td>
			<td><input type="text" name="edit"></td>
		</tr>
		<tr>
			<td><label>上级字典:</label></td>
			<td><input type="text" name="dict.id"></td>
		</tr>
		<input type="hidden" name="version" data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="value:0" />
	</table>
	<div class="dijitDialogPaneActionBar" style="background-color: #ffffff;">
		<button data-dojo-type="dijit/form/Button" type="button">
			保存
			<script type="dojo/on" data-dojo-event="click" data-dojo-args="evt">
				require([ 'ext/core' ], function(ext) {
					if (G_dict_F.validate()) {
						var callback = function(data) {
							if (data.flag) {
								ext.gridx.store({
									id : 'G_dict'
								});
								dijit.byId('G_dict_D').hide();
							} else {
								alert(data.msg);
							}
						};
						ext.form.submit({
							url : 'sys/dict/save',
							form : G_dict_F.domNode,
							callback : callback,
						});
					}
				});
			</script>
		</button>
		<button data-dojo-type="dijit/form/Button" type="button">
			关闭
			<script type="dojo/on" data-dojo-event="click" data-dojo-args="evt">
				dijit.byId('G_dict_D').hide();
			</script>
		</button>
	</div>
</div>