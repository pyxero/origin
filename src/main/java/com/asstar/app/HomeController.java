package com.asstar.app;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
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
import com.asstar.app.common.util.MailUtil;
import com.asstar.app.common.util.MsgUtil;
import com.asstar.app.common.util.OAuthUtil;
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
		// MailUtil.send("2928512493@qq.com", "aaa", "bbb");
		return "reg";
	}

	@ResponseBody
	@RequestMapping(value = "/reg/info", method = RequestMethod.POST)
	public String registInfo(HttpServletRequest req,String mail, String phone, String code, Model model) throws IOException {
		HttpSession session = req.getSession();
		int status = 0;
		String msg = "验证码不正确";
		if(code==null||code.equals("")||!code.equals(session.getAttribute("code"))){
			return "{status:"+String.valueOf(status)+",msg:"+msg+"}";
		}
		String verifyCode = ValidateUtil.createVerifyCode(req,0, 6);
		if (mail != null) {
			status=MailUtil.send(mail, "乐为游注册", verifyCode);
		}else{
			status=MsgUtil.send(phone,verifyCode);
		}
		return "{status:"+String.valueOf(status)+"}";
	}

	@RequestMapping(value = "/code", method = RequestMethod.GET)
	public void code(HttpServletRequest req, HttpServletResponse resp, String code, Model model) throws IOException {
		ValidateUtil.getCode(req, resp);
	}
}
