package poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import poly.asm.entity.User;
import poly.asm.entity.Video;
import poly.asm.utils.JpaUtils;

public class VideoDAOImpl implements VideoDAO{
	EntityManager em = JpaUtils.getEntityManager();
	@Override
	public List<Video> findAll() {
		String jpql = "SELECT o FROM Video o";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		return query.getResultList();
	}

	@Override
	public Video findById(String id) {
		return em.find(Video.class, id);
	}

	@Override
	public void create(Video video) {
		try {
			em.getTransaction().begin();
			em.persist(video);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}

	@Override
	public void update(Video video) {
		try {
			em.getTransaction().begin();
			em.merge(video);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}

	@Override
	public void deleteById(String id) {
		Video video = em.find(Video.class, id);
		try {
			em.getTransaction().begin();
			em.remove(video);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}
	@Override
	public List<Video> findAllbyName(String name) {
		String jpql = "SELECT DISTINCT o.video FROM Favorite o "
				+ " WHERE o.video.title LIKE :keyword";
				TypedQuery<Video> query = em.createQuery(jpql, Video.class);
				query.setParameter("keyword", "%" + name + "%");
		return query.getResultList();
	}


	
}
