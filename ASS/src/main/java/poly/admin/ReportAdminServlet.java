package poly.admin;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import poly.asm.entity.Favorite;
import poly.asm.entity.Report;
import poly.asm.entity.User;
import poly.asm.entity.Video;
import poly.asm.utils.JpaUtils;
import poly.asm.utils.XParam;
import poly.dao.FavoriteDAO;
import poly.dao.FavoriteDAOImpl;
import poly.dao.UserDAO;
import poly.dao.UserDAOImpl;
import poly.dao.VideoDAO;
import poly.dao.VideoDAOImpl;


@WebServlet("/poly/admin/report/index")
public class ReportAdminServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EntityManager em = null;
        try {
            em = JpaUtils.getEntityManager();
            String jpql = "SELECT new poly.asm.entity.Report(o.video.title, COUNT(o), MAX(o.likeDate), MIN(o.likeDate)) FROM Favorite o GROUP BY o.video.title";
            TypedQuery<Report> query = em.createQuery(jpql, Report.class);
            List<Report> reports = query.getResultList();
            req.setAttribute("reports", reports);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
        try {
			VideoDAO vdao = new VideoDAOImpl();
			FavoriteDAO fdao = new FavoriteDAOImpl();
			String id = XParam.getString("id");
			User user = new User();	
			List<Favorite> favorites = fdao.findByVideoId(id);
		    req.setAttribute("favorites", favorites);
			List<Video> videos = vdao.findAll();
			req.setAttribute("videos", videos);
        	

		} catch (Exception e) {
			// TODO: handle exception
		}
		req.getRequestDispatcher("/views/admin/report/index.jsp").forward(req, resp);
		
	}	
	
}