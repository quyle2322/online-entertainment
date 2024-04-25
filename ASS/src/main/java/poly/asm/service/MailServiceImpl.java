package poly.asm.service;

import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;


public class MailServiceImpl implements MailService{
	@Override
	public void send(String to, String subject, String body, Map<String, String> others) {
		Properties props = new Properties();
		props.setProperty("mail.smtp.host", "smtp.gmail.com");
		props.setProperty("mail.smtp.port", "587");
		props.setProperty("mail.smtp.auth", "true");
		props.setProperty("mail.smtp.starttls.enable", "true");
		props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
		
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				String username = "truongnxps27633@fpt.edu.vn";
				String password = "fajt mzox ofbg lkpr";
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			MimeMessage mail = new MimeMessage(session);
			
			String from = others.get("from");
			mail.setFrom(new InternetAddress(from));
			mail.setReplyTo(mail.getFrom());
			
			mail.setRecipients(RecipientType.TO, to);
			mail.setRecipients(RecipientType.CC, others.get("cc"));
			mail.setRecipients(RecipientType.BCC, others.get("bcc"));
			mail.setSubject(subject, "utf-8");
			mail.setText(body, "utf-8", "html");

			Transport.send(mail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}