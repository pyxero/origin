<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	require([ 'dijit/form/Form', 'ext/core' ], function(form, ext) {

		var dialog = dijit.byId('G_goods_D');
		if (dialog.ext.type == 1) {
			var callback = function(data) {
				G_goods_F.setValues(data);
			};
			ext.get({
				url : 'b/goods/find',
				content : {
					id : dijit.byId('G_goods_D').ext.select
				},
				callback : callback
			});
		}
	});
</script>
<div data-dojo-id="G_goods_F" data-dojo-type="dijit/form/Form"
	encType="multipart/form-data">
	<table class="dijitDialogPaneContentArea" cellspacing="8">
		<input type="hidden" name="id" data-dojo-type="dijit/form/ValidationTextBox" />
		<tr>
			<td><label>商品编号:</label></td>
			<td><input type="text" name="no" data-dojo-type="dijit/form/ValidationTextBox"
				data-dojo-props="required:true" /></td>
			<td><label>商品名称:</label></td>
			<td><input type="text" name="name" data-dojo-type="dijit/form/ValidationTextBox"
				data-dojo-props="required:true" /></td>
		</tr>
		<tr>
			<td><label>商品信息:</label></td>
			<td><input type="text" name="info" data-dojo-type="dijit/form/ValidationTextBox"
				data-dojo-props="required:true" /></td>
			<td><label>商品图片:</label></td>
			<td><input type="text" name="img" data-dojo-type="dijit/form/ValidationTextBox"
				data-dojo-props="required:true" /></td>
		</tr>
		<input type="hidden" name="version" data-dojo-type="dijit/form/ValidationTextBox"
			data-dojo-props="value:0" />
	</table>
	<div class="dijitDialogPaneActionBar" style="background-color: #ffffff;">
		<button data-dojo-type="dijit/form/Button" type="button">
			保存
			<script type="dojo/on" data-dojo-event="click" data-dojo-args="evt">
				require([ 'ext/core' ], function(ext) {
					if (G_goods_F.validate()) {
						var callback = function(data) {
							if (data.flag) {
								ext.gridx.store({
									id : 'G_goods'
								});
								dijit.byId('G_goods_D').hide();
							} else {
								alert(data.msg);
							}
						};
						ext.form.submit({
							url : 'b/goods/save',
							form : G_goods_F.domNode,
							callback : callback,
						});
					}
				});
			</script>
		</button>
		<button data-dojo-type="dijit/form/Button" type="button">
			关闭
			<script type="dojo/on" data-dojo-event="click" data-dojo-args="evt">
				dijit.byId('G_goods_D').hide();
			</script>
		</button>
	</div>
</div>