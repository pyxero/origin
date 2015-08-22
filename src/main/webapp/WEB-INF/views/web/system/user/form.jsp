<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<div data-dojo-id="G_user_F" data-dojo-type="dijit/form/Form" encType="multipart/form-data">
	<table class="dijitDialogPaneContentArea" cellspacing="8">
		<tr>
			<td><label>用户编号:</label></td>
			<input type="hidden" name="id" data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:false" />
			<input type="hidden" name="version" data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="value:0" />
			<td><input type="text" name="no" data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:true" /></td>
			<td><label>用户姓名:</label></td>
			<td><input type="text" name="username" data-dojo-type="dijit/form/ValidationTextBox"
				data-dojo-props="required:true" /></td>
		</tr>
		<tr>
			<td><label>账户可用:</label></td>
			<td><input type="text" name="enabled" data-dojo-type="dijit/form/FilteringSelect"
				data-dojo-props="required:false" /></td>
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
							url : 's/user/save',
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
<script type="text/javascript">
	$().ready(
			function() {
				require([ 'dijit/form/Form', 'ext/core' ], function(Form, ext) {
					dojo.forEach([ 'enabled', 'credentialsNonExpired',
							'accountNonLocked', 'accountNonExpired' ],
							function(w) {
								var ds = ext.form.dSelect({
									name : w
								}, dojo.query('input[name=\'' + w + '\']',
										dijit.byId('G_user_D').domNode)[0]);
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
					var dialog = dijit.byId('G_user_D');
					if (dialog.ext.type == 1) {
						var callback = function(data) {
							G_user_F.setValues(data);
						};
						ext.get({
							url : 's/user/find',
							content : {
								id : dijit.byId('G_user_D').ext.select
							},
							callback : callback
						});
					}
				});
			});
</script>