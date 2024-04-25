package poly.asm.utils;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;

public class XParam {
	public static String getString(String name) {
		HttpServletRequest req = RR.getRequest();
		return req.getParameter(name);
	}
	
	public static int getInt(String name) {
		return Integer.valueOf(getString(name));
	}
	
	public static double getDouble(String name) {
		return Double.valueOf(getString(name));
	}
	
	public static boolean getBoolean(String name) {
		return (getString(name) != null);
	}
	
	public static Date getDate(String name) {
		String pattern = "MM/dd/yyyy";
		SimpleDateFormat format = new SimpleDateFormat(pattern);
		try {
			Date date = format.parse(getString(name));
			return date;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public static File getFile(String name, String folder) {
		try {
			HttpServletRequest req = RR.getRequest();
			Part part = req.getPart(name);
			String dir = req.getServletContext().getRealPath(folder);
			File file = new File(dir, part.getSubmittedFileName());
			part.write(file.getAbsolutePath());
			return file;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public static <B> B getBean(Class<B> beanClass) {
		try {
			DateConverter converter = new DateConverter();
			converter.setPattern("MM/dd/yyyy");
			ConvertUtils.register(converter, Date.class);
			
			B bean = beanClass.getDeclaredConstructor().newInstance();
			HttpServletRequest req = RR.getRequest();
			BeanUtils.populate(bean, req.getParameterMap());
			return bean;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}