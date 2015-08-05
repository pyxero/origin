package com.asstar.app.web.business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asstar.app.common.util.JsonUtil;
import com.asstar.app.web.business.goods.GoodsService;

@Controller
public class BusinessController {
	@Autowired
	private GoodsService goodsService;

	@ResponseBody
	@RequestMapping(value = "/b/goods/data", method = RequestMethod.GET)
	public String Data() {
		System.out.println(JsonUtil.toString(goodsService.findAll()));
		return JsonUtil.toString(goodsService.findAll());
	}
}
