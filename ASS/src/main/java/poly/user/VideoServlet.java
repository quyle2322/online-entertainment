package poly.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import poly.asm.entity.Favorite;
import poly.asm.entity.User;
import poly.asm.entity.Video;
import poly.dao.FavoriteDAO;
import poly.dao.FavoriteDAOImpl;
import poly.dao.UserDAO;
import poly.dao.UserDAOImpl;
import poly.dao.VideoDAO;
import poly.dao.VideoDAOImpl;

@WebServlet({
	"/oe/video/list", 
	"/poly/user/detail/*", // videoId
	"/poly/user/favorite", // username
	"/poly/user/like/*", // videoId
	"/poly/user/unlike/*", // favoriteId
	"/poly/user/share"
})
public class VideoServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		VideoDAO vdao = new VideoDAOImpl();
		FavoriteDAO fdao = new FavoriteDAOImpl();
		
		User user = (User) req.getSession().getAttribute("user");
		
		String path = req.getServletPath();
		if(path.contains("list")) {
			List<Video> videos = vdao.findAll();
			req.setAttribute("videos", videos);
			req.setAttribute("page", "video/list.jsp");
		} else if(path.contains("detail")) {
			String videoId = req.getPathInfo().substring(1);
			Video video = vdao.findById(videoId);
			
			List<Video> videos = vdao.findAll();
			
			videos.removeIf(v -> v.getId().equals(videoId));

			req.setAttribute("video", video);
			req.setAttribute("videos", videos);
			req.setAttribute("page", "video/detail.jsp");
		} 
		else if(path.contains("unlike")) {
			Integer favoriteId = Integer.valueOf(req.getPathInfo().substring(1));
			fdao.deleteById(favoriteId);
			resp.sendRedirect(req.getContextPath()+"/poly/user/favorite");
			return;
		} else if(path.contains("like")) {
			String videoId = req.getPathInfo().substring(1);
			req.setAttribute("videoidd", videoId);
			Favorite favorite = new Favorite();
			favorite.getVideo().setId(videoId);
			favorite.setUser(user);
			UserDAO udao = new UserDAOImpl();	
			fdao.create(favorite);
			resp.sendRedirect(req.getContextPath() + "/poly/user/detail/" + videoId);
			
//			resp.sendRedirect(req.getContextPath()+"/oe/video/list");
			return;
		} else if(path.contains("favorite")) {
			List<Favorite> favorites = fdao.findByUsername(user.getId());
			req.setAttribute("favorites", favorites);
			req.getRequestDispatcher("/views/user/video/favorites.jsp").forward(req, resp);
		} 
		else if(path.contains("share")) {
			
			req.getRequestDispatcher("/views/user/video/share.jsp").forward(req, resp);
		} 
		req.getRequestDispatcher("/views/user/video/detail.jsp").forward(req, resp);
	}
}
