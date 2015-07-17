package com.asstar.app.common.util;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;

import com.asstar.app.common.entity.PageEntity;

public class HttpUtil {

	public static HttpEntity<List<?>> httpPage(Page<?> page) {
		int total = page.getContent().size();
		StringBuilder value = new StringBuilder("items=" + 0 + "-");
		if (total == 0) {
			value.append("0");
		} else {
			value.append(0 + total - 1);
		}
		value.append("/" + page.getTotalElements());
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Range", value.toString());
		return new HttpEntity<List<?>>(page.getContent(), headers);
	}

	public static HttpEntity<List<?>> httpList(PageEntity page) {
		int total = page.getContent().size();
		StringBuilder value = new StringBuilder("items=" + 0 + "-");
		if (total == 0) {
			value.append("0");
		} else {
			value.append(0 + total - 1);
		}
		value.append("/" + page.getTotal());
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Range", value.toString());
		return new HttpEntity<List<?>>(page.getContent(), headers);
	}
}
