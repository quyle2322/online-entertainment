package poly.dao;

import java.util.List;

import poly.asm.entity.Video;

public interface VideoDAO {
	List<Video> findAll();
	Video findById(String id);
	void create(Video Video);
	void update(Video Video);
	void deleteById(String id);
	public List<Video> findAllbyName(String name);
}
