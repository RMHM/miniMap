package com.kh.mhm.common;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {

	public void sendMail(String getUser, String getTitle, String getContent) {

		final String spendUser = "miniMapMNG@gmail.com";
		final String userPass = "admintest1234";

		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(spendUser, userPass);
			}
		});

		try {
			MimeMessage email = new MimeMessage(session);
			email.setFrom(new InternetAddress(spendUser));
			// 수신자 주소
			email.addRecipient(Message.RecipientType.TO, new InternetAddress(getUser));
			// 제목
			email.setSubject(getTitle);
			// 내용
			email.setText(getContent);

			// 보내기
			Transport.send(email);
		} catch (Exception e) {
			e.getMessage();
		}

	}

}
