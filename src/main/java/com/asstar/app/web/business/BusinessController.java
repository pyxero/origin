package com.asstar.app.web.business;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.asstar.app.common.util.FileUtil;
import com.asstar.app.common.util.JsonUtil;
import com.asstar.app.web.business.files.Files;
import com.asstar.app.web.business.files.FilesService;
import com.asstar.app.web.business.goods.GoodsService;

@Controller
public class BusinessController {
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private FilesService filesService;

	@ResponseBody
	@RequestMapping(value = "/b/goods/data", method = RequestMethod.GET)
	public String Data() {
		return JsonUtil.toString(goodsService.findAll());
	}

	@ResponseBody
	@RequestMapping(value = "/b/goods/uploadedfile", method = RequestMethod.POST)
	public boolean uploadedfile(@RequestParam(value = "files[]") MultipartFile[] files) throws IOException, Exception {
		for (int i = 0; i < files.length; i++) {
			Files file = new Files();
			file.setName(files[i].getOriginalFilename());
			file.setFile(FileUtil.getByte(files[i].getInputStream()));
			filesService.save(file);
		}
		return true;
	}

}
