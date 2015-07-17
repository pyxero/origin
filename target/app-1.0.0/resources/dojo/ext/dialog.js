define('ext/dialog', [ 'dojox/widget/DialogSimple' ], function(Dialog) {

	var dialog = {};

	dialog = function(model) {
		_session();
		var build = function(model) {
			d = new Dialog({
				id : model.id || '',
				title : model.title || '',
				style : model.style || '',
				closable : model.closable || true,
				executeScripts : model.executeScripts || true,
				href : model.href || '',
				ext : model.ext || {}
			});
			d.show();
			return d;
		}
		var d = dijit.byId(model.id);
		if (typeof d != 'undefined') {
			if (typeof d.ext != 'undefined') {
				d.ext = model.ext;
			}
			if (typeof model.reload == 'undefined' || model.reload == true) {
				d.destroyRecursive();
				return build(model);
			} else {
				d.show();
				return;
			}
		}
		return build(model);
	}

	return dialog;
});