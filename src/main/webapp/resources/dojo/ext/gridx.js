define('ext/gridx', [ 'dojo/store/JsonRest', 'dojo/store/Observable', 'gridx/Grid', 'gridx/core/model/cache/Async', 'gridx/allModules' ], function(JsonRest,
		Observable, Gridx, Cache) {

	var gridx = {};

	gridx = function(model) {
		_session();
		var modules = [ 'gridx/modules/HiddenColumns', 'gridx/modules/Bar', 'gridx/modules/select/Cell', 'gridx/modules/IndirectSelect',
				'gridx/modules/extendedSelect/Row', 'gridx/modules/ColumnResizer', 'gridx/modules/RowHeader', 'gridx/modules/VirtualVScroller',
				'gridx/modules/SingleSort', {
					moduleClass : 'gridx/modules/select/Row',
					multiple : false
				}, {
					moduleClass : 'gridx/modules/pagination/PaginationBar',
					sizes : [ '20', '50', '100', 'All' ],
					sizeSeparator : '|'
				}, {
					moduleClass : 'gridx/modules/Pagination',
					initialPageSize : model.initialPageSize || 20
				} ];
		model.modules = model.modules || modules;

		var structures = [];
		if (typeof model.structure_self == 'undefined' || model.structure_self != true) {
			structures.push({
				name : 'ID',
				field : 'id'
			});
			for ( var i in model.structure) {
				structures.push(model.structure[i]);
			}
			model.structure = structures;
			model.structure.push({
				name : '创建人员',
				field : 'creater',
				width : '120px'
			}, {
				name : '创建时间',
				field : 'createTime',
				width : '145px'
			}, {
				name : '修改人员',
				field : 'modifier',
				width : '120px'
			}, {
				name : '修改时间',
				field : 'modifyTime',
				width : '145px'
			})
		}

		var store = new Observable(new JsonRest({
			target : model.url,
			query : function(query, options) {
				options.start = 0, options.count = 20;
				options.timestamp = Math.random();
				return JsonRest.prototype.query.call(this, options);
			}
		}));

		var grid = new Gridx({
			id : model.id,
			style : model.style || 'height:99%;',
			cacheClass : Cache,
			url : model.url,
			store : store,
			structure : model.structure,
			barTop : [ model.toolbar || {} ],
			selectRowTriggerOnCell : true,
			modules : model.modules,
			vScrollerBuffSize : model.vScrollerBuffSize || 20,
			paginationBarShowRange : true,
			pageSize : model.pageSize || 20
		}, model.id);

		grid.pagination.onChangePageSize = function(cPageSize, oPageSize) {
			_session();
			grid.model._cache.pageSize = cPageSize;
			var store = new Observable(new JsonRest({
				target : model.url,
				query : function(query, options) {
					options.start = 0, options.count = cPageSize;
					query.start = options.start, query.count = options.count, query.parentId = options.parentId, query.queryOptions = options.queryOptions;
					query.timestamp = Math.random();
					return JsonRest.prototype.query.call(this, query);
				}
			}));
			grid.setStore(store);
		};

		grid.pagination.onSwitchPage = function(cPage, oPage) {
			_session();
			var store = new Observable(new JsonRest({
				target : model.url,
				query : function(query, options) {
					options.start = cPage;
					options.count = grid.model._cache.pageSize;
					query.start = options.start, query.count = options.count, query.parentId = options.parentId, query.queryOptions = options.queryOptions;
					grid.model._cache._struct = {
						"" : new Array()
					};
					grid.model._cache._priority = [];
					grid.model._cache._cache = {};
					query.timestamp = Math.random();
					return JsonRest.prototype.query.call(this, query);
				}
			}));
			grid.model._cache.store = store;
			grid.paginationBar.refresh();
		};

		if (typeof model.structure_self == 'undefined' || model.structure_self != true) {
			grid.hiddenColumns.add(grid.column(0));
		}

		return grid;
	}

	gridx.store = function(model) {

		_session();
		var grid = dijit.byId(model.id);
		var t = typeof model.query != 'undefined' && typeof model.query != 'object' ? JSON.parse(model.query) : model.query;
		var treeNodeID;
		if (typeof grid.model._cache.options.query != 'undefined' && typeof grid.model._cache.options.query.treeNodeID != 'undefined') {
			if (typeof model.isSearch == 'undefined' || model.isSearch) {
				treeNodeID = grid.model._cache.options.query.treeNodeID;
			}
		}
		var q = null;
		for ( var i in t) {
			if (typeof t[i] != 'undefined' && t[i] != null && t[i] != 'null' && t[i] != '') {
				if (q != null) {
					q[i] = t[i];
				} else {
					q = {};
					q[i] = t[i];
				}
			}
		}
		if (typeof model.query != 'undefined' && q != null) {
			if (typeof q.treeNodeID == 'undefined' && typeof treeNodeID != 'undefined') {
				q.treeNodeID = treeNodeID;
			}
			grid.model._cache.options.query = q;
		}
		if (typeof model.query != 'undefined' && q == null) {
			grid.model._cache.options.query = undefined;
			if (typeof treeNodeID != 'undefined') {
				grid.model._cache.options.query = {};
				grid.model._cache.options.query.treeNodeID = treeNodeID;
			}
		}

		var store = new Observable(new JsonRest({
			target : model.url || grid.url,
			query : function(query, options) {
				options.start = grid.pagination._page;
				options.count = grid.model._cache.pageSize;
				query.start = options.start, query.count = options.count, query.parentId = options.parentId, query.queryOptions = options.queryOptions;
				query.timestamp = Math.random();
				return JsonRest.prototype.query.call(this, query);
			}
		}));
		grid.setStore(store);
	}

	gridx.select = function(model) {
		_session();
		var rowsSel = dijit.byId(model.id).select.row.getSelected();
		if (rowsSel.length == 1) {
			return rowsSel;
		} else {
			alert(model.warn || '请选择行');
			return undefined;
		}
	}

	return gridx;
});