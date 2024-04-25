package poly.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Patch;

import poly.asm.entity.User;
import poly.asm.utils.XCookie;
import poly.asm.utils.XParam;
import poly.dao.UserDAO;
import poly.dao.UserDAOImpl;

@WebServlet({
	"/poly/user/login",
	"/poly/user/register",
	"/poly/user/change-password",
	"/poly/user/forgot-password",
	"/poly/user/update-account",
	"/poly/user/sign-out"})
public class AccountServlet extends HttpServlet{
	UserDAO dao = new UserDAOImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		if(path.contains("sign-out")) {
			req.getSession().removeAttribute("user");
			resp.sendRedirect(req.getContextPath() + "/poly/user/index");
			return;
		} 
		if(path.endsWith("login")) {
//			String value = XCookie.getValue("user", true);
//			if(value != null) {
//				String[] vals = value.split(",");
//				req.setAttribute("username", vals[0]);
//				req.setAttribute("password", vals[1]);
//			}
			req.getRequestDispatcher("/views/user/account/login.jsp").forward(req, resp);
		}
		else if(path.endsWith("register")) {
			req.getRequestDispatcher("/views/user/account/register.jsp").forward(req, resp);
		}
		else if(path.endsWith("change-password")) {
			req.getRequestDispatcher("/views/user/account/change-password.jsp").forward(req, resp);
		}
		else if(path.endsWith("forgot-password")) {
			req.getRequestDispatcher("/views/user/account/forgot-password.jsp").forward(req, resp);
		}
		else if(path.endsWith("update-account")) {
			req.getRequestDispatcher("/views/user/account/update-account.jsp").forward(req, resp);
		}
		
		
	}	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		if(path.endsWith("login")) {
			String username = XParam.getString("username");
			String password = XParam.getString("password");
			boolean remember = XParam.getBoolean("remember");
			User user = dao.findById(username);
			if(user == null) {
				req.setAttribute("message", "Invalid username!");
				req.getRequestDispatcher("/views/user/account/login.jsp").forward(req, resp);
			} else if(!user.getPassword().equals(password)) {
				req.setAttribute("message", "Invalid password!");
				req.getRequestDispatcher("/views/user/account/login.jsp").forward(req, resp);
			} else {
				if(remember) {
					XCookie.add("user", username + "," + password, 3*24*60*60, true);
				} else {
					XCookie.remove("user");
				}
				req.getSession().setAttribute("user", user);
				
				String backUrl = (String) req.getSession().getAttribute("backUrl");
				if(backUrl != null) {
					resp.sendRedirect(backUrl);
					return ;
				} else {
					req.setAttribute("message", "Login successfully!");
				}
			}
			req.setAttribute("page", "account/login.jsp");
		}
		if(path.endsWith("register")) {
			String id = XParam.getString("id");
			String password = XParam.getString("password");
			String fullname = XParam.getString("fullname");
			String email = XParam.getString("email");
			User user =new User();
			user.setAdmin(false);
			user.setEmail(email);
			user.setFullname(fullname);
			user.setId(id);
			user.setPassword(password);
			
			if(!id.equalsIgnoreCase(user.getId())) {
				req.setAttribute("message", "Username đã tồn tại");
				req.getRequestDispatcher("/views/user/account/register.jsp").forward(req, resp);
				return;
			}
			else {
				dao.create(user);
				req.setAttribute("message", "Đăng ký thành công");
				req.getRequestDispatcher("/views/user/account/register.jsp").forward(req, resp);
			}
		}
		if(path.endsWith("change-password")) {
			String username = XParam.getString("username");
			String password = XParam.getString("password");
			boolean remember = XParam.getBoolean("remember");
			String newpass = XParam.getString("newpass");
			String confirm = XParam.getString("confirm");
				User user = (User) req.getSession().getAttribute("user");
				req.setAttribute("user", user);
				if(!username.equalsIgnoreCase(user.getId())) {
					req.setAttribute("message", "Sai tên đăng nhập!");
					req.getRequestDispatcher("/views/user/account/change-password.jsp").forward(req, resp);
				} else if(!password.equals(user.getPassword())) {
					req.setAttribute("message", "Sai mật khẩu!");
					req.getRequestDispatcher("/views/user/account/change-password.jsp").forward(req, resp);
				} else {
					user.setPassword(newpass);
					dao.update(user);
					req.setAttribute("message", "Đổi mật khẩu thành công!");
					req.getRequestDispatcher("/views/user/account/change-password.jsp").forward(req, resp);
				}
			}
		if(path.endsWith("update-account")) {
			String username =  XParam.getString("username");
	        String fullname =  XParam.getString("fullname");
	        String password =  XParam.getString("password");
	        String email =  XParam.getString("email");
			User user = (User) req.getSession().getAttribute("user");
			 System.out.println(user.getPassword());
			 if (fullname.isEmpty() || password.isEmpty() || email.isEmpty()) {
		            req.setAttribute("message", "Vui lòng nhập đầy đủ thông tin.");
		            req.getRequestDispatcher("/views/user/account/update-account.jsp").forward(req, resp);
		            return;
		        };
		        if (!user.getPassword().equals(password)) {
		            req.setAttribute("message", "Mật khẩu không chính xác.");
		            req.getRequestDispatcher("/views/user/account/update-account.jsp").forward(req, resp);
		            return;
		        }
			 	user.setId(user.getId());
		        user.setFullname(fullname);
		        user.setPassword(password);
		        user.setEmail(email);
		        UserDAO userDAO = new UserDAOImpl();
		        userDAO.update(user);

		        req.setAttribute("user", user);
		       
		        req.setAttribute("message", "Cập nhật thông tin tài khoản thành công.");
		        req.getRequestDispatcher("/views/user/account/update-account.jsp").forward(req, resp);	
			}
	}
}