/**
 * 
 */

var goods = {};

goods.active = function(target, imgFile) {
	var img = document.createElement('img');
	var type = imgFile.name.substr(imgFile.name.substr(1).indexOf('.') + 2,
			imgFile.name.length + 1);
	$(img).attr('src', 'data:image/' + type + ';base64,' + imgFile.file);
	$(img).attr('style', 'width: 100%; height: 100%;');
	($(target)).append(img);
}

goods.show = function(target, info, imgFile) {

	var divFontP = document.createElement('div');
	$(divFontP).addClass('app-goods-div-font-p');
	divFontP.innerHTML = info;

	var divFont = document.createElement('div');
	$(divFont).addClass('app-goods-div-font-div');
	$(divFont).append($(divFontP));

	var img = document.createElement('img');
	$(img).addClass('app-goods-div-img');
	var type = imgFile.name.substr(imgFile.name.substr(1).indexOf('.') + 2,
			imgFile.name.length + 1);
	$(img).attr('src', 'data:image/' + type + ';base64,' + imgFile.file);

	var divBar = document.createElement('div');
	$(divBar).addClass('ui-bar ui-bar-a app-goods-div');
	$(divBar).append($(img));
	$(divBar).append($(divFont));

	var a = document.createElement('a');
	$(a).addClass('app-goods-div-a');
	$(a).append($(divBar));

	var div = document.createElement('div');
	var l = $('div[class^=ui-block-]:last', target)[0];
	if (typeof (l) != 'undefined' && l.className == 'ui-block-a') {
		$(div).addClass('ui-block-b');
	} else {
		$(div).addClass('ui-block-a');
	}

	$(div).append($(a));

	($(target)).append(div);

};