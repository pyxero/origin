package com.asstar.app.common.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicHeader;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

import sun.misc.BASE64Encoder;

public class MsgUtil {

	@SuppressWarnings("unchecked")
	public static int send(String phone, String subject, String verify) throws UnsupportedEncodingException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String stamp = sdf.format(new Date());
		String hash = Md5Util
				.string2MD5("8a48b551505b4af001505c32930903e6" + "350c7afbf11345d89b0b1c2e7ef4f42a" + stamp);
		String url = "https://sandboxapp.cloopen.com:8883/2013-12-26/Accounts/8a48b551505b4af001505c32930903e6/SMS/TemplateSMS?sig="
				+ hash;
		String code = "8a48b551505b4af001505c32930903e6" + ":" + stamp;
		String authorization = (new BASE64Encoder()).encode(code.getBytes());
		// Map map = new HashMap();
		// map.put("to", "13980553316");
		// map.put("datas", "[8888,3]");
		// map.put("templateId", 1);
		// map.put("appId", "8a48b551505b4af001505c33115003e8");
		// System.out.println(JsonUtil.toString(map));
		StringEntity entity = new StringEntity("{datas:['ÄúµÄ×¢²áÃÜÂëÊÇ:" + verify + "',30],templateId:1,to:" + phone
				+ ",appId:8a48b551505b4af001505c33115003e8}", "utf-8");
		entity.setContentEncoding(new BasicHeader(HTTP.CONTENT_TYPE, "application/json"));

		CloseableHttpClient httpclient = HttpClientBuilder.create().build();
		HttpPost httpPost = new HttpPost(url);
		try {
			httpPost.setHeader("Accept", "application/json;");
			httpPost.setHeader("Content-Type", "application/json;charset=utf-8;");
			httpPost.setHeader("Authorization", authorization);
			httpPost.setEntity(entity);
			CloseableHttpResponse response = httpclient.execute(httpPost);
			HttpEntity resultEntity = response.getEntity();
			String result = EntityUtils.toString(resultEntity, "UTF-8");
			System.out.println(result);
			httpPost.releaseConnection();
			return 1;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return 0;
	}
}