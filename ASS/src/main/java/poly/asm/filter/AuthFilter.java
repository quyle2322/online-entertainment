package poly.asm.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import poly.asm.entity.User;

@WebFilter({
	"/poly/user/change-password",
	"/poly/user/update-account",
	"/poly/user/log-out",
	"/poly/user/share",
	"/poly/user/like/*",
	"/poly/user/favorite",
	"/poly/admin/*"
})
public class AuthFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		if(user == null) {
			System.out.println(req.getRequestURI());
			session.setAttribute("backUrl", req.getRequestURI());
			req.setAttribute("message", "Vui lòng đăng nhập");
			req.getRequestDispatcher("/poly/user/login").forward(request, response);
		
		} else {
			String path = req.getServletPath();
			if(path.startsWith("/poly/admin") && !user.isAdmin()) {
				session.setAttribute("backUrl", req.getServletPath());
				req.setAttribute("message", "Vui lòng đăng nhập với vai trò admin");
				req.getRequestDispatcher("/poly/user/login").forward(request, response);
			}else {
				chain.doFilter(request, response);
			}
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}
	
	@Override
	public void destroy() {
	}
}