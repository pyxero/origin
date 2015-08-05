/**
 * 
 */

var goods = {};

goods.load = function(grid, info, url) {

	var divFontP = document.createElement('div');
	$(divFontP).addClass('app-goods-div-font-p');
	divFontP.innerHTML = info;

	var divFont = document.createElement('div');
	$(divFont).addClass('app-goods-div-font-div');
	$(divFont).append($(divFontP));

	var img = document.createElement('img');
	$(img).addClass('app-goods-div-img');
	$(img).attr('src', url);

	var divBar = document.createElement('div');
	$(divBar).addClass('ui-bar ui-bar-a app-goods-div');
	$(divBar).append($(img));
	$(divBar).append($(divFont));

	var a = document.createElement('a');
	$(a).addClass('app-goods-div-a');
	$(a).append($(divBar));

	var div = document.createElement('div');
	var l = $('div[class^=ui-block-]:last', grid)[0];
	if (typeof (l) != 'undefined' && l.className == 'ui-block-a') {
		$(div).addClass('ui-block-b');
	} else {
		$(div).addClass('ui-block-a');
	}

	$(div).append($(a));

	($(grid)).append(div);

};