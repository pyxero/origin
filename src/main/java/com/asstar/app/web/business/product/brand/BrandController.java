package com.asstar.app.web.business.product.brand;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class BrandController {

	@Autowired
	private BrandService brandService;

	@ResponseBody
	@RequestMapping(value = "/b/brand/list", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public String list(HttpServletRequest request, PageEntity pEntity, Brand dict) {
		List<Brand> list = brandService.findAll();//(dict, pEntity);
		Map map = new HashMap<Object, Object>();
//		map.put("iTotalRecords", "1");
//		map.put("sEcho",1);
//		map.put("iTotalDisplayRecords", "1");
//		map.put("aaData", list);
		Map mapq = new HashMap<Object, Object>();
		
		map.put("data", list);
		return JsonUtil.toString(map);//HttpUtil.httpPage(page);
	}

	@ResponseBody
	@RequestMapping(value = "/b/brand/find", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public String find(Brand dict) {
		String result = JsonUtil.toString(brandService.findById(dict.getId()));
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/b/brand/save", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public String save(Brand brand) {
		return JsonUtil.toString(ResultUtil.set(brandService.save(brand) != null ? true : false));
	}

	@ResponseBody
	@RequestMapping(value = "/b/brand/delete", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public String delete(Brand dict) {
		return JsonUtil.toString(ResultUtil.set(brandService.delete(brandService.findById(dict.getId()))));
	}

}
