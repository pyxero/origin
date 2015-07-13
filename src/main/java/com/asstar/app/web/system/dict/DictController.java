package com.asstar.app.web.system.dict;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asstar.app.common.page.PageEntity;
import com.asstar.app.common.util.HttpUtil;
import com.asstar.app.common.util.JsonUtil;

@Controller
public class DictController {

	@Autowired
	private DictService dictService;

	@ResponseBody
	@RequestMapping(value = "/sys/dict/list", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public HttpEntity<List<?>> list(HttpServletRequest request, PageEntity pEntity, Dict dict) {
		Page<Dict> page = dictService.page(dict, pEntity);
		return HttpUtil.httpPage(page);
	}

	@ResponseBody
	@RequestMapping(value = "/sys/dict/find", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public String find(Dict dict) {
		String result = JsonUtil.toString(dictService.findById(dict.getId()));
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/sys/dict/save", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public void save(Dict dict) {
		dictService.save(dict);
	}

	@ResponseBody
	@RequestMapping(value = "/sys/dict/delete", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public void delete(Dict dict) {
		dictService.delete(dictService.findById(dict.getId()));
	}

}
