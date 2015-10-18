package com.asstar.app.common.util;

import java.util.HashMap;

public class TaskUtil implements Runnable {

	private HashMap<String, String> map;

	public TaskUtil(HashMap<String, String> hashMap) {
		this.map = hashMap;
	}

	public void run() {
		String target = (String) map.get("target");
		String subject = (String) map.get("subject");
		String verifyCode = (String) map.get("verifyCode");
		MailUtil.send(target, subject, verifyCode);
	}
}
