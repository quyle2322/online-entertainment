package poly.asm.utils;

import java.util.Base64;

import javax.servlet.http.Cookie;

public class XCookie {
	public static Cookie add(String name, String value, int maxAge) {
		return XCookie.add(name, value, maxAge, false);
	}
	
	public static Cookie add(String name, String value, int maxAge, boolean encoded) {
		if(encoded) {
			value = Base64.getEncoder().encodeToString(value.getBytes());
		}
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(maxAge);
		cookie.setPath("/");
		RR.getResponse().addCookie(cookie);
		return cookie;
	}
	
	public static void remove(String name) {
		XCookie.add(name, "", 0);
	}
	
	public static Cookie get(String name) {
		Cookie[] cookies = RR.getRequest().getCookies();
		if(cookies != null) {
			for(Cookie cookie: cookies) {
				if(cookie.getName().equalsIgnoreCase(name)) {
					return cookie;
				}
			}
		}
		return null;
	}
	
	public static String getValue(String name) {
		return XCookie.getValue(name, false);
	}
	
	public static String getValue(String name, boolean decoded) {
		Cookie cookie = XCookie.get(name);
		if(cookie != null) {
			String value = cookie.getValue();
			if(decoded) {
				value = new String(Base64.getDecoder().decode(value));
			}
			return value;
		}
		return null;
	}
}