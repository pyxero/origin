package com.asstar.app.web.system;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asstar.app.authority.user.User;
import com.asstar.app.common.util.JsonUtil;
import com.asstar.app.common.util.ResultUtil;
import com.asstar.app.web.system.menu.MenuService;

@Controller
public class SystemController {

	@Autowired
	@Qualifier("authenticationManager")
	protected AuthenticationManager authenticationManager;
	@Autowired
	private MenuService menuService;

	@ResponseBody
	@RequestMapping(value = "/session", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public String session(HttpServletRequest request) {
		if (!SecurityContextHolder.getContext().getAuthentication().getName().equals("anonymousUser")) {
			return JsonUtil.toString(ResultUtil.set(true));
		} else {
			return JsonUtil.toString(ResultUtil.set(false));
		}

	}

	@ResponseBody
	@RequestMapping(value = "/s/menu/data", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public String menu() {
		return JsonUtil.toString(menuService.findAll());
	}
}
