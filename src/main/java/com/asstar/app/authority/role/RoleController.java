package com.asstar.app.authority.role;

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
public class RoleController {

	@Autowired
	private RoleService roleService;

	@ResponseBody
	@RequestMapping(value = "/s/role/list", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public HttpEntity<List<?>> list(HttpServletRequest request, PageEntity pEntity, Role role) {
		Page<Role> page = roleService.page(role, pEntity);
		return HttpUtil.httpPage(page);
	}

	@ResponseBody
	@RequestMapping(value = "/s/role/find", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public String find(Role role) {
		String result = JsonUtil.toString(roleService.findById(role.getId()));
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/s/role/save", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public String save(Role role) {
		return JsonUtil.toString(ResultUtil.set(roleService.save(role)));
	}

	@ResponseBody
	@RequestMapping(value = "/s/role/delete", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public String delete(Role role) {
		return JsonUtil.toString(ResultUtil.set(roleService.delete(roleService.findById(role.getId()))));
	}

}
