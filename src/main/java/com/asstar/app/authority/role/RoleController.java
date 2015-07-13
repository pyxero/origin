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

import com.asstar.app.common.page.PageEntity;
import com.asstar.app.common.util.HttpUtil;
import com.asstar.app.common.util.JsonUtil;

@Controller
public class RoleController {

	@Autowired
	private RoleService roleService;

	@ResponseBody
	@RequestMapping(value = "/sys/role/list", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public HttpEntity<List<?>> list(HttpServletRequest request, PageEntity pEntity, Role role) {
		Page<Role> page = roleService.page(role, pEntity);
		return HttpUtil.httpPage(page);
	}

	@ResponseBody
	@RequestMapping(value = "/sys/role/find", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public String find(Role role) {
		String result = JsonUtil.toString(roleService.findById(role.getId()));
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/sys/role/save", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public void save(Role role) {
		roleService.save(role);
	}

	@ResponseBody
	@RequestMapping(value = "/sys/role/delete", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public void delete(Role role) {
		roleService.delete(roleService.findById(role.getId()));
	}

}
