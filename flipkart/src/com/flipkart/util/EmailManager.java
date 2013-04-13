package com.flipkart.util;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailManager {

	static Properties properties = new Properties();
	static {
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.socketFactory.port", "25");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.port", "25");
	}

	public static boolean sendMail(String receiverEmailID,
			String messageSubject, String messageBody, String senderEmailID,
			String senderPassword) {

		final String from = new String(senderEmailID);
		final String pwd = new String(senderPassword);
		String subject = new String(messageSubject);
		String body = new String(messageBody);

		try {
			Session sessionemail = Session.getDefaultInstance(properties,
					new javax.mail.Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(from, pwd);
						}
					});

			Message message = new MimeMessage(sessionemail);
			message.setFrom(new InternetAddress(from));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(receiverEmailID));
			message.setSubject(subject);
			message.setText(body);
			Transport.send(message);
			return true;
		} catch (Exception e) {

			e.printStackTrace();
			return false;
		}

	}

	public static boolean sendHTMLEmail(String receiverEmailID,
			String messageSubject, String messageBody, String senderEmailID,
			String senderPassword) throws MessagingException{
		final String from = new String(senderEmailID);
		final String pwd = new String(senderPassword);
		String subject = new String(messageSubject);
		String body = new String(messageBody);

		try {
			Session sessionemail = Session.getDefaultInstance(properties,
					new javax.mail.Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(from, pwd);
						}
					});

			Message message = new MimeMessage(sessionemail);
			message.setFrom(new InternetAddress(from));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(receiverEmailID));
			message.setSubject(subject);
			message.setContent(body, "text/html");
			Transport.send(message);
			return true;
		} catch (Exception e) {

			e.printStackTrace();
			return false;
		}
	}
}
