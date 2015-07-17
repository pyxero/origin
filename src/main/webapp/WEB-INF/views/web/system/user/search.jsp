<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	require([ 'ext/core' ], function(ext) {
		dojo.forEach([ 'enabled', 'credentialsNonExpired', 'accountNonLocked', 'accountNonExpired' ], function(w) {
			var ds = ext.form.dSelect({
				name : w
			}, dojo.query('input[name=\'' + w + '\']', dijit.byId('G_user_Q').domNode)[0]);
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
	});
</script>
<div data-dojo-id="G_user_Q_F" data-dojo-type="dijit/form/Form" data-dojo-props="encType:'multipart/form-data'">
	<table class="dijitDialogPaneContentArea" cellspacing="8">
		<tr>
			<td><label>用户编号:</label></td>
			<td><input type="text" name="no" data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:false" /></td>
			<td><label>用户姓名:</label></td>
			<td><input type="text" name="username" data-dojo-type="dijit/form/ValidationTextBox" data-dojo-props="required:true" /></td>
		</tr>
		<tr>
		<td><label>账户可用:</label></td>
			<td><input type="text" name="enabled" data-dojo-type="dijit/form/FilteringSelect" /></td>
			<td><label>账户过期:</label></td>
			<td><input type="text" name="accountNonExpired" data-dojo-type="dijit/form/FilteringSelect" /></td>
		</tr>
		<tr>
			<td><label>账户锁定:</label></td>
			<td><input type="text" name="accountNonLocked" data-dojo-type="dijit/form/FilteringSelect" /></td>
			<td><label>凭据过期:</label></td>
			<td><input type="text" name="credentialsNonExpired" data-dojo-type="dijit/form/FilteringSelect" /></td>
		</tr>
	</table>
	<div class="dijitDialogPaneActionBar" style="background-color: #ffffff;">
		<button data-dojo-type="dijit.form.Button" type="reset">清除</button>
		<button data-dojo-type="dijit/form/Button" type="button">
			搜索
			<script type="dojo/on" data-dojo-event="click" data-dojo-args="evt">
				require([ 'ext/core' ], function(ext) {
					ext.gridx.store({
						id : 'G_user',
						url : 'sys/user/list',
						query : dojo.formToJson(G_user_Q_F.id),
						search : G_user_Q_F.getValues()
					});
					dijit.byId('G_user_Q').hide();
				});
			</script>
		</button>
		<button data-dojo-type="dijit/form/Button" type="button">
			关闭
			<script type="dojo/on" data-dojo-event="click" data-dojo-args="evt">
				dijit.byId('G_user_Q').hide();
			</script>
		</button>
	</div>
</div>