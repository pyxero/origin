package com.asstar.app;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mobile.device.site.SitePreference;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asstar.app.authority.user.User;
import com.asstar.app.authority.user.UserService;
import com.asstar.app.common.entity.OAuthEntity;
import com.asstar.app.common.util.JsonUtil;
import com.asstar.app.common.util.OAuthUtil;
import com.asstar.app.common.util.ResultUtil;
import com.asstar.app.common.util.TaskUtil;
import com.asstar.app.common.util.ValidateUtil;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	@Qualifier("authenticationManager")
	protected AuthenticationManager authenticationManager;
	@Autowired
	private UserService userService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(SitePreference sitePreference, Locale locale, Model model) {

		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("device", sitePreference);

		if (sitePreference == SitePreference.NORMAL) {
			return "login";
		} else if (sitePreference == SitePreference.MOBILE) {
			return "app";
		} else if (sitePreference == SitePreference.TABLET) {
			return "app";
		} else {
			return "app";
		}

	}

	@RequestMapping(value = "/smcp", method = RequestMethod.GET)
	public String smcp(SitePreference sitePreference, Locale locale, Model model) {

		if (sitePreference == SitePreference.NORMAL) {
			return "app";
		} else {
			return "login";
		}

	}

	@RequestMapping(value = "/path", method = RequestMethod.GET)
	public String path(Locale locale, String url) {
		return url;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(String code, Model model) {
		if (code != null) {
			OAuthEntity oAuth = OAuthUtil.getUserInfo(code);
			logger.info("login user: " + oAuth.getUserId());
			User user = userService.findByNo(oAuth.getUserId());
			String password = "";
			if (user != null) {
				password = user.getPassword();
			} else {
				return "login";
			}
			UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(oAuth.getUserId(),
					password);
			Authentication authentication = authenticationManager.authenticate(authRequest);
			SecurityContextHolder.getContext().setAuthentication(authentication);
			return "app";
		} else {
			return "login";
		}

	}

	@RequestMapping(value = "/reg", method = RequestMethod.GET)
	public String regist(String code, Model model) throws IOException {
		return "reg";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(String code, Model model) throws IOException {
		return "home";
	}

	@ResponseBody
	@RequestMapping(value = "/reg/info", method = RequestMethod.POST)
	public String registInfo(HttpServletRequest req, String mail, String phone, String code, Model model)
			throws IOException {
		HttpSession session = req.getSession();
		HashMap<String, String> map = new HashMap<String, String>();
		boolean flag = false;
		String msg = "��֤�����";
		if (code == null || code.equals("")
				|| !code.trim().toLowerCase().equals(session.getAttribute("code").toString().toLowerCase())) {
			return JsonUtil.toString(ResultUtil.set(flag, msg));
		} else {
			flag = true;
			msg = "��֤����ȷ";
			if (mail != null && !mail.equals("")) {
				map.put("target", mail);
			} else {
				map.put("target", phone);
			}
		}
		String verifyCode = ValidateUtil.createVerifyCode(req, 0, 6);
		map.put("subject", "��֤����Ϣ");
		map.put("verifyCode", verifyCode);
		TaskUtil task = new TaskUtil(map);
		Thread thread = new Thread(task);
		thread.start();
		return JsonUtil.toString(ResultUtil.set(flag, msg));
	}

	@RequestMapping(value = "/code", method = RequestMethod.GET)
	public void code(HttpServletRequest req, HttpServletResponse resp, String code, Model model) throws IOException {
		ValidateUtil.getCode(req, resp);
	}

	@ResponseBody
	@RequestMapping(value = "/reg/checkCode", method = RequestMethod.POST)
	public String checkCode(HttpServletRequest req, String mail, String verify, String phone, Model model)
			throws IOException {
		int status = ValidateUtil.checkVerifyCode(req, verify);
		boolean flag = false;
		String msg = "��֤ʧ��";
		if (status == 0 || status == 2) {
			return JsonUtil.toString(ResultUtil.set(flag, msg, status));
		} else {
			String password = ValidateUtil.createVerifyCode(req, 0, 6);
			User user = new User();
			if (mail != null) {
				user.setNo(mail);
				user.setUsername(mail);
				user.setPassword(password);
			} else {
				user.setNo(phone);
				user.setUsername(phone);
				user.setPassword(password);
			}
			user.setEnabled(true);
			user.setAccountNonExpired(true);
			user.setAccountNonLocked(true);
			user.setCredentialsNonExpired(true);
			user.setVersion(0);
			userService.save(user);
			status = 1;
			flag = true;
			msg = "��֤�ɹ�";
			return JsonUtil.toString(ResultUtil.set(flag, msg, status));
		}
	}

}
