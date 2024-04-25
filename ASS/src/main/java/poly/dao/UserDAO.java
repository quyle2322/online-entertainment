package poly.dao;

import java.util.List;

import poly.asm.entity.User;

public interface UserDAO {
	List<User> findAll();
	User findById(String id);
	void create(User user);
	void update(User user);
	void deleteById(String id);
	List<User> findByVideoID(String id);
}
