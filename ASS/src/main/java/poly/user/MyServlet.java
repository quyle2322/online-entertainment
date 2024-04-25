package poly.user;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import poly.asm.entity.Video;
import poly.dao.UserDAO;
import poly.dao.VideoDAO;
import poly.dao.VideoDAOImpl;

@WebServlet("/poly/user/index")
public class MyServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		VideoDAO vdao = new VideoDAOImpl();
		List<Video> videos = vdao.findAll();
		req.setAttribute("videos", videos);
		req.getRequestDispatcher("/views/user/layout/index.jsp").forward(req, resp);	
	}	
	
}