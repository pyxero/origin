package com.asstar.app.web.business.goods;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asstar.app.common.entity.PageEntity;
import com.asstar.app.common.util.HttpUtil;
import com.asstar.app.common.util.JsonUtil;
import com.asstar.app.common.util.ResultUtil;

@Controller
public class GoodsController {

	@Autowired
	private GoodsService goodsService;

	@ResponseBody
	@RequestMapping(value = "/b/goods/list", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public HttpEntity<List<?>> list(HttpServletRequest request, PageEntity pEntity, Goods goods) {
		Page<Goods> page = goodsService.page(goods, pEntity);
		return HttpUtil.httpPage(page);
	}

	@ResponseBody
	@RequestMapping(value = "/b/goods/find", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public String find(Goods goods) {
		String result = JsonUtil.toString(goodsService.findById(goods.getId()));
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/b/goods/save", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public String save(Goods goods) {
		return JsonUtil.toString(ResultUtil.set(goodsService.save(goods)));
	}

	@ResponseBody
	@RequestMapping(value = "/b/goods/delete", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public String delete(Goods goods) {
		return JsonUtil.toString(ResultUtil.set(goodsService.delete(goodsService.findById(goods.getId()))));
	}

}
