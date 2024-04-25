package poly.admin;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import poly.asm.entity.Video;
import poly.asm.utils.XParam;
import poly.dao.VideoDAO;
import poly.dao.VideoDAOImpl;

@MultipartConfig
@WebServlet({ "/poly/admin/video/index", "/poly/admin/video/create", "/poly/admin/video/update",
		"/poly/admin/video/edit/*", "/poly/admin/video/delete", "/poly/admin/video/reset" })
public class VideoAdminServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		VideoDAO dao = new VideoDAOImpl();
		Video video = XParam.getBean(Video.class);

		String path = req.getServletPath();
		if (path.contains("create") || path.contains("update")) {
			Part part = req.getPart("poster_file");
			String fname = part.getSubmittedFileName();
			if (fname != null && !fname.isEmpty()) {
				video.setPoster(fname);
				try {
					File file = XParam.getFile("poster_file", "/views/images/");
					video.setPoster(file.getName());
				} catch (Exception e) {
					System.out.println("Chưa upload file");
				}
			} else {
				String oldPoster = req.getParameter("poster");
				video.setPoster(oldPoster);
			}

			if (path.contains("create")) {
				dao.create(video);
			} else {
				dao.update(video);
			}
		} else if (path.contains("delete")) {
			dao.deleteById(video.getId());
		} else if (path.contains("edit")) {
			String id = req.getPathInfo().substring(1);
			video = dao.findById(id);
		} else if (path.contains("reset")) {
			video.reset();
		}

		List<Video> videos = dao.findAll();
		req.setAttribute("video", video);
		req.setAttribute("videos", videos);
//		System.out.println(Arrays.asList(videos).toString());
		req.getRequestDispatcher("/views/admin/layout/index.jsp").forward(req, resp);
	}
}