package com.asstar.app.common.util;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;

public class TaskUtil implements Runnable {

	private HashMap<String, String> map;

	public TaskUtil(HashMap<String, String> hashMap) {
		this.map = hashMap;
	}

	public void run() {
		String type = (String) map.get("type");
		String target = (String) map.get("target");
		String subject = (String) map.get("subject");
		String verify = (String) map.get("verify");
		if (type.equals("mail")) {
			MailUtil.send(target, subject, verify);
		} else {
			try {
				MsgUtil.send(target, subject, verify);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
