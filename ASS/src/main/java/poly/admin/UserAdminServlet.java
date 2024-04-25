package poly.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import poly.asm.entity.User;
import poly.asm.utils.XParam;
import poly.dao.UserDAO;
import poly.dao.UserDAOImpl;

@WebServlet({
	"/poly/admin/user/index",
	"/poly/admin/user/create",
	"/poly/admin/user/update",
	"/poly/admin/user/delete",
	"/poly/admin/user/edit/*"
})
public class UserAdminServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDAO dao = new UserDAOImpl();
		
		User user = XParam.getBean(User.class);
		
		String path = req.getServletPath();
		if(path.contains("create")) {
			dao.create(user);
		} else if(path.contains("update")) {
			dao.update(user);
		} else if(path.contains("delete")) {
			dao.deleteById(user.getId());
		} else if(path.contains("edit")) {
			String id = req.getPathInfo().substring(1);
			user = dao.findById(id);
		}
		
		List<User> users = dao.findAll();
		req.setAttribute("user", user);
		req.setAttribute("users", users);
		
		req.getRequestDispatcher("/views/admin/account/index.jsp").forward(req, resp);
	}
}