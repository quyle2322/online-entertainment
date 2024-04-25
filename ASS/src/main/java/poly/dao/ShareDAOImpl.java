package poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import poly.asm.entity.Share;
import poly.asm.utils.JpaUtils;

public class ShareDAOImpl implements ShareDAO{
	EntityManager em = JpaUtils.getEntityManager();
	
	@Override
	public List<Share> findAll() {
		String jpql = "SELECT o FROM Share o";
		TypedQuery<Share> query = em.createQuery(jpql, Share.class);
		return query.getResultList();
	}

	@Override
	public Share findById(Integer id) {
		return em.find(Share.class, id);
	}

	@Override
	public void create(Share share) {
		try {
			em.getTransaction().begin();
			em.persist(share);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}

	@Override
	public void update(Share share) {
		try {
			em.getTransaction().begin();
			em.merge(share);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}

	@Override
	public void deleteById(Integer id) {
		Share share = em.find(Share.class, id);
		try {
			em.getTransaction().begin();
			em.remove(share);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}
}
