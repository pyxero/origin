/**
 * 
 */

var goods = {};

goods.active = function(target, imgFile) {
	var img = document.createElement('img');
	var type = imgFile.name.substr(imgFile.name.substr(1).indexOf('.') + 2,
			imgFile.name.length + 1);
	$(img).attr('src', 'data:image/' + type + ';base64,' + imgFile.file);
	($(target)).prepend(img);
}

goods.show = function(target, imgFile, info, price) {

	var divDescribe = document.createElement('div');
	$(divDescribe).addClass('app-goods-div-info-describe');
	divDescribe.innerHTML = info;

	var divPrice = document.createElement('div');
	$(divPrice).addClass('app-goods-div-info-price');
	divPrice.innerHTML = price == null ? '预售' : '￥' + price.toFixed(2);

	var divInfo = document.createElement('div');
	$(divInfo).addClass('app-goods-div-info');
	$(divInfo).append($(divDescribe));
	$(divInfo).append($(divPrice));

	var img = document.createElement('img');
	$(img).addClass('app-goods-div-img');
	var type = imgFile.name.substr(imgFile.name.substr(1).indexOf('.') + 2,
			imgFile.name.length + 1);
	$(img).attr('src', 'data:image/' + type + ';base64,' + imgFile.file);

	var divBar = document.createElement('div');
	$(divBar).addClass('ui-bar ui-bar-a app-goods-div');
	$(divBar).append($(img));
	$(divBar).append($(divInfo));

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