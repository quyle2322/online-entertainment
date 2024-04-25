package poly.dao;

import java.util.List;

import poly.asm.entity.Favorite;
import poly.asm.entity.User;

public interface FavoriteDAO {
	List<Favorite> findAll();
	Favorite findById(Integer id);
	void create(Favorite Favorite);
	void update(Favorite Favorite);
	void deleteById(Integer id);
	List<Favorite> findByUsername(String username);
	List<Favorite> findByUserId(String userId);
	List<Favorite> findByVideoId(String id);
}
