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
		String verify = (String) map.get("verify");
		MailUtil.send(target, subject, verify);
	}
}
