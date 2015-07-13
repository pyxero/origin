package com.asstar.app.web.system;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asstar.app.authority.user.User;
import com.asstar.app.common.util.JsonUtil;
import com.asstar.app.web.system.menu.MenuService;

@Controller
public class SystemController {

	@Autowired
	@Qualifier("authenticationManager")
	protected AuthenticationManager authenticationManager;
	@Autowired
	private MenuService menuService;

	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request, Model model, User user) {
		HttpSession session = request.getSession();
		try {
			UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(user.getNo(),
					user.getPassword());
			Authentication authentication = authenticationManager.authenticate(authRequest);
			SecurityContextHolder.getContext().setAuthentication(authentication);
			session.setAttribute("SPRING_SECURITY_CONTEXT", SecurityContextHolder.getContext());
			return "{flag:true,msg:''}";
		} catch (AuthenticationException ex) {
			return "{flag:false,msg:'" + ex.getMessage() + "'}";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/session", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public String session(HttpServletRequest request) {
		HttpSession session = request.getSession();
		SecurityContext securityContext = (org.springframework.security.core.context.SecurityContext) session
				.getAttribute("SPRING_SECURITY_CONTEXT");
		if (securityContext != null) {
			return JsonUtil.toString("{flag:" + securityContext.getAuthentication().isAuthenticated() + "}");
		} else {
			return JsonUtil.toString("{flag:false}");
		}

	}

	@ResponseBody
	@RequestMapping(value = "/sys/menu/data", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public String menu() {
		return JsonUtil.toString(menuService.findAll());
	}
}
