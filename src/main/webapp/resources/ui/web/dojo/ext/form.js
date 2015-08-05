define('ext/form', [ 'dojo/store/Memory' ], function(Store) {

	var form = {};

	form.submit = function(model) {
		_session();
		dojo.xhrGet({
			url : model.url,
			handleAs : 'json',
			preventCache : model.preventCache || true,
			form : model.form,
			load : function(result) {
				typeof model.callback != 'undefined' ? model.callback(result) : '';
			}
		});
	}

	form.dSelect = function(model, widget) {
		_session();
		var filteringSelect = new dijit.form.FilteringSelect({
			name : model.name || 'name',
			value : model.value || 0,
			store : new dojo.store.Memory({
				data : []
			}),
			required : model.required || false,
			searchAttr : model.searchAttr || 'name'
		}, typeof widget != 'string' ? widget : dojo.query('input[name=' + widget + ']')[0]);
		if (typeof model.url != 'undefined') {
			dojo.xhrGet({
				url : model.url,
				handleAs : 'json',
				preventCache : model.preventCache || true,
				content : model.data || [],
				load : function(data) {
					stateStore = new dojo.store.Memory({
						data : data
					});
					filteringSelect.store = stateStore;
					typeof model.callback != 'undefined' ? model.callback(data) : '';
				}
			});
		}
		return filteringSelect;
	}

	form.dSelectUpdate = function(model) {
		_session();
		dojo.xhrGet({
			url : model.url,
			handleAs : 'json',
			preventCache : model.preventCache || true,
			content : model.data || [],
			load : function(data) {
				var stateStore = new dojo.store.Memory({
					data : data
				});
				var select = dijit.byId(model.id);
				var old = select.getValue();
				select.store = stateStore;
				select.reset();
				dojo.forEach(data, function(kv) {
					if (kv.id == old) {
						select.setValue(old);
					}
				});
			}
		});
	}

	form.pSelect = function(model, widget) {
		_session();
		var select = new dijit.form.FilteringSelect({
			name : model.name,
			store : new Store({
				data : []
			}),
			readOnly : true,
			required : model.required || false,
			searchAttr : model.searchAttr || 'name'
		}, typeof widget != 'string' ? widget : dojo.query('input[name=' + widget + ']')[0]);
		return select;
	}

	return form;
});