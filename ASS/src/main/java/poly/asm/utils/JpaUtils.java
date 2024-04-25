package poly.asm.utils;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;



public class JpaUtils {
	static EntityManagerFactory factory;

	public static EntityManager getEntityManager() {
		if(factory == null || !factory.isOpen()) {
			factory = Persistence.createEntityManagerFactory("MySqlPU");
		}
		return factory.createEntityManager();
	}
	
	public static void close() {
		factory.close();
	}
}
