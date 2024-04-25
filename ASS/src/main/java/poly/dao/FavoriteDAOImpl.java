package poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import poly.asm.entity.Favorite;
import poly.asm.entity.User;
import poly.asm.utils.JpaUtils;

public class FavoriteDAOImpl implements FavoriteDAO{
	EntityManager em = JpaUtils.getEntityManager();
	
	@Override
	public List<Favorite> findAll() {
		String jpql = "SELECT o FROM Favorite o";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		return query.getResultList();
	}

	@Override
	public Favorite findById(Integer id) {
		return em.find(Favorite.class, id);
	}

	@Override
	public void create(Favorite favorite) {
		try {
			em.getTransaction().begin();
			em.persist(favorite);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}

	@Override
	public void update(Favorite favorite) {
		try {
			em.getTransaction().begin();
			em.merge(favorite);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}

	@Override
	public void deleteById(Integer id) {
		Favorite favorite = em.find(Favorite.class, id);
		try {
			em.getTransaction().begin();
			em.remove(favorite);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}

	@Override
	public List<Favorite> findByUsername(String username) {
		String jpql = "SELECT o FROM Favorite o WHERE o.user.id=?0";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		query.setParameter(0, username);
		return query.getResultList();
	}
	 @Override
	    public List<Favorite> findByUserId(String userId) {
	        String jpql = "SELECT f FROM Favorite f WHERE f.user.id = :userId";
	        TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
	        query.setParameter("userId", userId);
	        return query.getResultList();
	    }

	@Override
	public List<Favorite> findByVideoId(String id) {
	    String jpql = "SELECT o FROM Favorite o WHERE o.video.id = :videoId";
	    TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
	    query.setParameter("videoId", id);
	    return query.getResultList();
	}

}
