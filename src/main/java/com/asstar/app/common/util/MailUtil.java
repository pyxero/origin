package com.asstar.app.common.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtil {
	static String host = "smtp.126.com";
	static String user = "levtrip@126.com";
	static String password = "qxdnyoujbpouswub";
	static String from = "levtrip@126.com";

	public static int send(String to, String subject, String content,String passCode) {
		Properties props = new Properties();
		props.setProperty("mail.smtp.host", host);
		props.setProperty("mail.smtp.port", "25");
		props.setProperty("mail.smtp.auth", "true");
		try {
			Session mailSession = Session.getDefaultInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});
			Message message = new MimeMessage(mailSession);
			message.setFrom(new InternetAddress(from)); // 发件人
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to)); // 收件人
			message.setSubject(subject); // 邮件主题
			message.setText(passCode+"您的注册密码是: "+content); // 邮件内容
			message.saveChanges();
			Transport transport = mailSession.getTransport("smtp");
			transport.connect(host, user, password);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
			return 2;
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}
}
