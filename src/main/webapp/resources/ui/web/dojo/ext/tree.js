define('ext/tree', [ 'dojo/data/ItemFileReadStore',
		'dijit/tree/ForestStoreModel', 'dijit/Tree' ], function(
		ItemFileReadStore, ForestStoreModel, Tree) {

	var tree = {};

	var child = function child(n, list) {
		for (var int = 0; int < list.length; int++) {
			var o = list[int];
			if (o.organization != null && o.organization.id == n.id) {
				var t = {};
				t.id = o.id, t.no = o.no, t.name = o.name;
				if (n.children == null) {
					n.children = new Array();
				}
				n.children.push(child(t, list));
			}
		}
		return n;
	}

	var root = function(list) {
		var array = new Array();
		for (var int = 0; int < list.length; int++) {
			var org = list[int];
			if (org.organization == null || org.organization.id == null) {
				var node = {};
				node.id = org.id, node.no = org.no, node.name = org.name,
						node.url = org.url;
				array.push(child(node, list));
			}
		}
		return array;
	}

	tree = function(model, widget) {
		_session();
		dojo.xhrGet({
			url : model.url,
			handleAs : 'json',
			preventCache : model.preventCache || true,
			form : model.form,
			load : function(result) {
				var items = root(result);
				var store = ItemFileReadStore({
					data : {
						identifier : 'id',
						label : 'name',
						items : items
					}
				});

				var treeModel = new ForestStoreModel({
					store : store
				});

				var tree = new Tree({
					title : model.name || '',
					model : treeModel,
					showRoot : false,
					name : model.name,
					onClick : function(item) {
						model.click(item);
					}
				});
				var div = typeof widget != 'string' ? widget : dojo
						.query('div[name=' + widget + ']')[0];
				div.innerHTML = '<div></div>';
				tree.placeAt((div.childNodes)[0], 'replace').startup();
				typeof model.callback != 'undefined' ? model.callback(tree,
						result) : '';
			}
		});
	}

	return tree;
});