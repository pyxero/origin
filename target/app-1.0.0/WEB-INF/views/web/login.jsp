<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>DEMO</title>
<%@ include file="../common/web/lib.jsp"%>
<script type="text/javascript">
	require([ 'dijit/Dialog', 'dojo/parser', 'dojo/ready' ], function(Dialog,
			parser, ready) {
		ready(function() {
			parser.parse().then(function() {
				dialog_login.show();
				dojo.byId('loading').style.display = 'none';
			});
		});
	});
</script>
</head>
<body class="claro">
	<div data-dojo-id="dialog_login" data-dojo-type="dijit/Dialog"
		data-dojo-props="title:'DEMO',closable:false" style="display: none">
		<form data-dojo-id="form_login" data-dojo-type="dijit/form/Form">
			<div class="dijitDialogPaneContentArea">
				<table>
					<tr>
						<td><label>用户名:</label></td>
						<td><input data-dojo-id="no" type="text" name="no"
							value="admin" required="true"
							data-dojo-type="dijit/form/ValidationTextBox" /></td>
					</tr>
					<tr>
						<td><label>密&nbsp;&nbsp;&nbsp;码:</label></td>
						<td><input data-dojo-id="password" type="password"
							name="password" value="admin" required="true"
							data-dojo-type="dijit/form/ValidationTextBox" /></td>
					</tr>
				</table>
			</div>
			<div class="dijitDialogPaneActionBar">
				<table>
					<tr>
						<td width="80%"><img id="loading" alt="loading"
							src="<%=request.getContextPath()%>/resources/dojo/gridx/resources/images/loadingAnimation.gif">
							<div id="message" style="color: red; text-align: left;"></div></td>
						<td><button data-dojo-id="submit"
								data-dojo-type="dijit/form/Button" type="button">
								登陆
								<script  type="dojo/on" data-dojo-event="click" data-dojo-args="evt">
									if (form_login.isValid()) {
										var values = form_login.getValues();
										dojo.forEach([ no, password, submit ],
												function(obj) {
													obj.setDisabled(true);
												});
										dojo.byId('message').style.display = 'none';
										dojo.byId('loading').style.display = 'block';
										dojo.xhrGet({
													url : 'login',
													handleAs : 'json',
													preventCache : true,
													content : values,
													load : function(data) {
														if (data.flag) {
															pathname = document.location.pathname;
															path = pathname.substr(0,pathname.substr(1).indexOf('/') + 1);
															if (path == '') {
																path = '/'
															}
															location.href = path;
														} else {
															dojo.byId('loading').style.display = 'none';
															dojo.byId('message').style.display = 'block';
															dojo.byId('message').innerHTML = data.msg;
															dojo.forEach([no,password,submit ],
																			function(obj) {
																				obj.setDisabled(false);
																			});
															return;
														}
													},
													error : function(error) {
													}
												});

									} else {
										dojo.byId('message').innerHTML = 'Please check required';
										return;
									}
								</script>
							</button></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>