package com.asstar.app;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mobile.device.site.SitePreference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

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
			logger.info("Site preference is normal");
		} else if (sitePreference == SitePreference.MOBILE) {
			logger.info("Site preference is mobile");
		} else if (sitePreference == SitePreference.TABLET) {
			logger.info("Site preference is tablet");
		} else {
			logger.info("no site preference");
		}
		return "app";
	}

	@RequestMapping(value = "/path", method = RequestMethod.GET)
	public String path(Locale locale, String url) {
		return url;
	}

}
