define('ext/core', [ 'ext/gridx', 'ext/dialog', 'ext/form', 'ext/tree' ],
		function(Gridx, Dialog, Form, Tree) {

			var core = {};

			core.post = function(model) {
				_session();
				dojo.xhrPost({
					url : model.url,
					handleAs : 'json',
					preventCache : model.preventCache || true,
					content : model.content,
					load : function(result) {
						typeof model.callback != 'undefined' ? model
								.callback(result) : '';
					},
					error : function(error) {
					}
				});
			}

			core.get = function(model) {
				_session();
				dojo.xhrGet({
					url : model.url,
					handleAs : 'json',
					preventCache : model.preventCache || true,
					content : model.content,
					load : function(result) {
						typeof model.callback != 'undefined' ? model
								.callback(result) : '';
					},
					error : function(error) {
					}
				});
			}

			_session = function() {
				dojo.xhrGet({
					url : 'session',
					handleAs : 'json',
					preventCache : true,
					load : function(result) {
						if (!result.flag) {
							pathname = document.location.pathname;
							path = pathname.substr(0, pathname.substr(1)
									.indexOf('/') + 1);
							if (path == '') {
								path = '/'
							}
							alert('登陆超时');
							top.location.href = path;
						}
					}
				});
			}

			core.session = function() {
				_session();
			}

			core.gridx = Gridx;
			core.dialog = Dialog;
			core.form = Form;
			core.tree = Tree;

			return core;
		});
