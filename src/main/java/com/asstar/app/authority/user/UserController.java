package com.asstar.app.authority.user;

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
public class UserController {

	@Autowired
	private UserService userService;

	@ResponseBody
	@RequestMapping(value = "/sys/user/list", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public HttpEntity<List<?>> list(HttpServletRequest request, PageEntity pEntity, User user) {
		Page<User> page = userService.page(user, pEntity);
		return HttpUtil.httpPage(page);
	}

	@ResponseBody
	@RequestMapping(value = "/sys/user/find", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public String find(User user) {
		String result = JsonUtil.toString(userService.findById(user.getId()));
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/sys/user/save", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public String save(User user) {
		return JsonUtil.toString(ResultUtil.set(userService.save(user)));
	}

	@ResponseBody
	@RequestMapping(value = "/sys/user/delete", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public String delete(User user) {
		return JsonUtil.toString(ResultUtil.set(userService.delete(userService.findById(user.getId()))));
	}

}
