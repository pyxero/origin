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

	public static int send(String to, String subject, String content) {
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
			message.setFrom(new InternetAddress(from)); // ������
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to)); // �ռ���
			message.setSubject(subject); // �ʼ�����
			message.setText(content); // �ʼ�����
			message.saveChanges();
			Transport transport = mailSession.getTransport("smtp");
			transport.connect(host, user, password);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
			return 1;
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}
}