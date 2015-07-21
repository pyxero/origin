package com.asstar.app.common.util;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonUtil {

	public static String toString(Object arg0) {
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(arg0);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public static <T> T toObject(String arg0, Class<?> object) {
		ObjectMapper mapper = new ObjectMapper();
		try {
			return (T) mapper.readValue(arg0, object);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
