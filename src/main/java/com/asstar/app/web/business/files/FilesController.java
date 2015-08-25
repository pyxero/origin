package com.asstar.app.web.business.files;

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
public class FilesController {

	@Autowired
	private FilesService filesService;

	@ResponseBody
	@RequestMapping(value = "/b/files/list", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public HttpEntity<List<?>> list(HttpServletRequest request, PageEntity pEntity, Files files) {
		Page<Files> page = filesService.page(files, pEntity);
		return HttpUtil.httpPage(page);
	}

	@ResponseBody
	@RequestMapping(value = "/b/files/find", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public String find(Files files) {
		String result = JsonUtil.toString(filesService.findById(files.getId()));
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/b/files/save", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public String save(Files files) {
		return JsonUtil.toString(ResultUtil.set(filesService.save(files) != null ? true : false));
	}

	@ResponseBody
	@RequestMapping(value = "/b/files/delete", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public String delete(Files files) {
		return JsonUtil.toString(ResultUtil.set(filesService.delete(filesService.findById(files.getId()))));
	}

}
