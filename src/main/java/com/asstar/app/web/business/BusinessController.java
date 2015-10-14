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
import com.asstar.app.web.business.files.Files;
import com.asstar.app.web.business.files.FilesService;

@Controller
public class BusinessController {
	@Autowired
	private FilesService filesService;

	@ResponseBody
	@RequestMapping(value = "/b/goods/uploadedfile", method = RequestMethod.POST, produces = "application/json;text/html;charset=UTF-8")
	public Files[] uploadedfile(@RequestParam(value = "files[]") MultipartFile[] files, MultipartFile file)
			throws IOException, Exception {
		if (file != null) {
			MultipartFile[] fs = { file };
			files = fs;
		}
		Files[] result = new Files[files.length];
		for (int i = 0; i < files.length; i++) {
			Files f = new Files();
			f.setName(files[i].getOriginalFilename());
			f.setFile(FileUtil.getByte(files[i].getInputStream()));
			result[i] = filesService.save(f);
		}
		return result;
	}

}
