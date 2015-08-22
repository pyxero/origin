package com.asstar.app.web.business;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.asstar.app.common.entity.PageEntity;
import com.asstar.app.common.util.FileUtil;
import com.asstar.app.common.util.JsonUtil;
import com.asstar.app.web.business.files.Files;
import com.asstar.app.web.business.files.FilesService;
import com.asstar.app.web.business.goods.Goods;
import com.asstar.app.web.business.goods.GoodsService;
import com.asstar.app.web.system.dict.Dict;

@Controller
public class BusinessController {
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private FilesService filesService;

	@ResponseBody
	@RequestMapping(value = "/show/goods/data", method = RequestMethod.GET, produces = "application/json;text/html;charset=UTF-8")
	public String Data(PageEntity pEntity, Goods goods) {
		Page<Goods> page = goodsService.page(goods, pEntity, Dict.class);
		return "{\"count\":" + page.getTotalElements() + ",\"data\":" + JsonUtil.toString(page.getContent()) + "}";
	}

	@ResponseBody
	@RequestMapping(value = "/b/goods/uploadedfile", method = RequestMethod.POST, produces = "application/json;text/html;charset=UTF-8")
	public boolean uploadedfile(@RequestParam(value = "files[]") MultipartFile[] files, MultipartFile file)
			throws IOException, Exception {
		if (file != null) {
			MultipartFile[] fs = { file };
			files = fs;
		}
		for (int i = 0; i < files.length; i++) {
			Files f = new Files();
			f.setName(files[i].getOriginalFilename());
			f.setFile(FileUtil.getByte(files[i].getInputStream()));
			filesService.save(f);
		}
		return true;
	}

}
