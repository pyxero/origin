package com.asstar.app.web.system.menu;

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
import com.asstar.app.web.system.dict.Dict;

@Controller
public class MenuController {

	@Autowired
	private MenuService menuService;

	@ResponseBody
	@RequestMapping(value = "/sys/menu/list", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public HttpEntity<List<?>> list(HttpServletRequest request, PageEntity pEntity, Menu menu) {
		Page<Menu> page = menuService.page(menu, pEntity, Menu.class, Dict.class);
		return HttpUtil.httpPage(page);
	}

	@ResponseBody
	@RequestMapping(value = "/sys/menu/find", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public String find(Menu menu) {

		String result = JsonUtil.toString(menuService.findById(menu.getId()));
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/sys/menu/save", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public void save(Menu menu) {

		if (menu.getMenu().getId() == null) {
			menu.setMenu(null);
		}
		menuService.save(menu);
	}

	@ResponseBody
	@RequestMapping(value = "/sys/menu/delete", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public void delete(Menu menu) {

		menuService.delete(menuService.findById(menu.getId()));
	}

}
