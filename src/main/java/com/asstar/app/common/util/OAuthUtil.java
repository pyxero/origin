package com.asstar.app.common.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

import com.asstar.app.common.entity.OAuthEntity;

public class OAuthUtil {

	public static OAuthEntity getAccessToken() {
		String requestUrl = "https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=wx2f809e24ddde3a42&corpsecret=fO-M1MRmAA_riqkj-m9RRmjb1zKLI4p6JSIn4KxEpZOR8HQsLs3puAjp_r6vif1v";
		try {
			return JsonUtil.toObject(httpRequest(requestUrl), OAuthEntity.class);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public static OAuthEntity getUserInfo(String code) {
		String requestUrl = "https://qyapi.weixin.qq.com/cgi-bin/user/getuserinfo?access_token="
				+ getAccessToken().getAccess_token() + "&code=" + code;
		try {
			String s = httpRequest(requestUrl).replace("UserId", "userId");
			s = s.replace("DeviceId", "deviceId");
			return JsonUtil.toObject(s, OAuthEntity.class);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public synchronized static String httpRequest(String requestUrl) throws IOException {
		StringBuffer buffer = new StringBuffer();
		URL url = new URL(requestUrl);
		HttpsURLConnection httpUrlConn = (HttpsURLConnection) url.openConnection();
		httpUrlConn.setDoOutput(true);
		httpUrlConn.setDoInput(true);
		httpUrlConn.setUseCaches(false);
		httpUrlConn.setRequestMethod("GET");
		httpUrlConn.connect();
		InputStream inputStream = httpUrlConn.getInputStream();
		InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
		BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
		String str = null;
		while ((str = bufferedReader.readLine()) != null) {
			buffer.append(str);
		}
		bufferedReader.close();
		inputStreamReader.close();
		inputStream.close();
		inputStream = null;
		httpUrlConn.disconnect();
		return buffer.toString();
	}
}
