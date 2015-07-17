<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	require([ 'dijit/form/Form', 'ext/core' ], function(Form, ext) {
		dojo.forEach([ 'enabled', 'credentialsNonExpired', 'accountNonLocked', 'accountNonExpired' ], function(w) {
			var ds = ext.form.dSelect({
				name : w
			}, dojo.query('input[name=\'' + w + '\']', dijit.byId('G_user_D').domNode)[0]);
			var data = w == 'enabled' ? [ {
				id : true,
				name : '是'
			}, {
				id : false,
				name : '否'
			} ] : [ {
				id : false,
				name : '是'
			}, {
				id : true,
				name : '否'
			} ];
			ds.store = new dojo.store.Memory({
				data : data
			});
		});
		var employeeSelect = ext.form.pSelect({
			name : 'employee.id',
			required : true
		}, dojo.query('input[name=\'employee.id\']', dijit.byId('G_user_D').domNode)[0]);

		dojo.connect(employeeSelect, 'onClick', function() {
			ext.dialog({
				id : 'G_user_F_S',
				title : '员工选择',
				href : 'path?url=system/user/select',
				style : 'width:570px;height:350px;',
				ext : {
					transmit : employeeSelect
				}
			}).show();
		});
		var dialog = dijit.byId('G_user_D');
		if (dialog.ext.type == 1) {
			var callback = function(data) {
				employeeSelect.store = new dojo.store.Memory({
					data : [ data.employee ]
				});
				G_user_F.setValues(data);
			};
			ext.get({
				url : 'sys/user/find',
				content : {
					id : dijit.byId('G_user_D').ext.select
				},
				callback : callback
			});
		}
	});
</script>
<div data-dojo-id="G_user_F" data-dojo-type="dijit/form/Form" encType="multipart/form-data">
	<table class="dijitDialogPaneContentArea" cellspacing="8">
		<tr>
			<td><label>用户编号:</label></td>
			<input type="hidden" name="id" data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:false" />
			<input type="hidden" name="version" data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="value:0" />
			<td><input type="text" name="no" data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:true" /></td>
			<td><label>员工</label></td>
			<td><input type="text" name="employee.id" data-dojo-type="dijit/form/FilteringSelect" data-dojo-props="required:false" /></td>
		</tr>
		<tr>
			<td><label>账户可用:</label></td>
			<td><input type="text" name="enabled" data-dojo-type="dijit/form/FilteringSelect" data-dojo-props="required:false" /></td>
			<td><label>账户过期:</label></td>
			<td><input type="text" name="accountNonExpired" data-dojo-type="dijit/form/FilteringSelect"
				data-dojo-props="required:false" /></td>
		</tr>
		<tr>
			<td><label>账户锁定:</label></td>
			<td><input type="text" name="accountNonLocked" data-dojo-type="dijit/form/FilteringSelect"
				data-dojo-props="required:false" /></td>
			<td><label>凭据过期:</label></td>
			<td><input type="text" name="credentialsNonExpired" data-dojo-type="dijit/form/FilteringSelect"
				data-dojo-props="required:false" /></td>
		</tr>
	</table>
	<div class="dijitDialogPaneActionBar" style="background-color: #ffffff;">
		<button data-dojo-type="dijit/form/Button" type="button">
			保存
			<script type="dojo/on" data-dojo-event="click" data-dojo-args="evt">
				require([ 'ext/core' ], function(ext) {
					if (G_user_F.validate()) {
						var callback = function(data) {
							if (data.flag) {
								ext.gridx.store({
									id : 'G_user'
								});
								dijit.byId('G_user_D').hide();
							} else {
								alert(data.msg);
							}
						};
						ext.form.submit({
							url : 'sys/user/save',
							form : G_user_F.domNode,
							callback : callback,
						});
					}
				});
			</script>
		</button>
		<button data-dojo-type="dijit/form/Button" type="button">
			关闭
			<script type="dojo/on" data-dojo-event="click" data-dojo-args="evt">
				dijit.byId('G_user_D').hide();
			</script>
		</button>
	</div>
</div>