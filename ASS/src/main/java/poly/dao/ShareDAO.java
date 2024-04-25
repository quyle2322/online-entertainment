package poly.dao;

import java.util.List;

import poly.asm.entity.Share;

public interface ShareDAO {
	List<Share> findAll();
	Share findById(Integer id);
	void create(Share Share);
	void update(Share Share);
	void deleteById(Integer id);
}
