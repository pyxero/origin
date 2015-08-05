<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	require([ 'dijit/form/Form', 'ext/core' ], function(Form, ext) {
	});
</script>
<div data-dojo-id="G_goods_Q_F" data-dojo-type="dijit/form/Form"
	data-dojo-props="encType:'multipart/form-data'">
	<table class="dijitDialogPaneContentArea" cellspacing="8">
		<tr>
			<td><label>商品编号:</label></td>
			<td><input type="text" name="no" data-dojo-type="dijit/form/ValidationTextBox"
				data-dojo-props="required:false" /></td>
			<td><label>商品名称:</label></td>
			<td><input type="text" name="name" data-dojo-type="dijit/form/ValidationTextBox"
				data-dojo-props="required:false" /></td>
		</tr>
		<tr>
			<td><label>商品信息:</label></td>
			<td><input type="text" name="info" data-dojo-type="dijit/form/ValidationTextBox"
				data-dojo-props="required:false" /></td>
			<td><label>商品图片:</label></td>
			<td><input type="text" name="img" data-dojo-type="dijit/form/ValidationTextBox"
				data-dojo-props="required:false" /></td>
		</tr>
	</table>
	<div class="dijitDialogPaneActionBar" style="background-color: #ffffff;">
		<button data-dojo-type="dijit.form.Button" type="reset">清除</button>
		<button data-dojo-type="dijit/form/Button" type="button">
			搜索
			<script type="dojo/on" data-dojo-event="click" data-dojo-args="evt">
				require([ 'ext/core' ], function(ext) {
					ext.gridx.store({
						id : 'G_goods',
						url : 'b/goods/list',
						query : dojo.formToJson(G_goods_Q_F.id)
					});
					dijit.byId('G_goods_Q').hide();
				});
			</script>
		</button>
		<button data-dojo-type="dijit/form/Button" type="button">
			关闭
			<script type="dojo/on" data-dojo-event="click" data-dojo-args="evt">
				dijit.byId('G_goods_Q').hide();
			</script>
		</button>
	</div>
</div>