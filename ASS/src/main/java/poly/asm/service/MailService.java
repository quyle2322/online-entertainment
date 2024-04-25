package poly.asm.service;

import java.util.Map;

import poly.asm.entity.Share;
import poly.asm.entity.User;

public interface MailService {
	default void sendWelcome(User user) {
		String to = user.getEmail();
		String subject = "Welcome to eStore!";
		String body = "...";
		this.send(to, subject, body);
	}
	default void sendPassword(User user) {
		String to = user.getEmail();
		String subject = "Your password!";
		String body = "...";
		this.send(to, subject, body);
	}
	default void sendOrder(Share order) {
		String to = order.getUser().getEmail();
		String subject = "Your order!";
		String body = "...";
		this.send(to, subject, body);
	}
	default void send(String to, String subject, String body) {
		this.send(to, subject, body, Map.of("from", "eStore <estore@gmail.com>"));
	}
	void send(String to, String subject, String body, Map<String, String> others);
}
