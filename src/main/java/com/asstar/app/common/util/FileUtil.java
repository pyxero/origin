package com.asstar.app.common.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

import org.apache.commons.configuration.Configuration;
import org.apache.commons.configuration.PropertiesConfiguration;
import org.springframework.web.multipart.MultipartFile;

public class FileUtil {

	public static boolean save(MultipartFile file) throws Exception {
		InputStream inStream = file.getInputStream();
		ByteArrayOutputStream readStream = new ByteArrayOutputStream();
		byte[] buffer = new byte[1024];
		int length = 0;
		while ((length = inStream.read(buffer)) != -1) {
			readStream.write(buffer, 0, length);
		}
		byte[] data = readStream.toByteArray();
		Configuration property = new PropertiesConfiguration("application.properties");
		File f = new File(property.getString("default.path") + file.getOriginalFilename());
		if (!f.getParentFile().exists()) {
			f.getParentFile().mkdirs();
		}
		FileOutputStream outStream = new FileOutputStream(f);
		outStream.write(data);
		outStream.close();
		readStream.close();
		inStream.close();
		return true;
	}

	public static byte[] getByte(InputStream inStream) throws Exception {
		ByteArrayOutputStream readStream = new ByteArrayOutputStream();
		byte[] buffer = new byte[1024];
		int length = 0;
		while ((length = inStream.read(buffer)) != -1) {
			readStream.write(buffer, 0, length);
		}
		byte[] data = readStream.toByteArray();
		readStream.close();
		inStream.close();
		return data;
	}
}
