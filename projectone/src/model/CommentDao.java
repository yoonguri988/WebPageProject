package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.CommentMapper;

public class CommentDao {
	private Map<String, Object> map = new HashMap<String, Object>();
	private Class<CommentMapper> cls = CommentMapper.class;
	public int maxnum() {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).maxnum();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}
	
	public boolean insert(Comment comment) {
		SqlSession session = DBConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).insert(comment);
			if(cnt > 0) return true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return false;
	}
	public int commentcount(int boardnum) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("boardnum", boardnum);
			return session.getMapper(cls).commentcount(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0; 
	} 
	
	public List<Comment> commentlist(int boardnum,int pageNum, int limit) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("boardnum", boardnum);
			map.put("start", (pageNum-1)*limit);
			map.put("limit", limit);
			return session.getMapper(cls).select(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}

	public Comment selectOne(int commentnum) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("commentnum", commentnum);
			return session.getMapper(cls).select(map).get(0);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}

	public boolean delete(int commentnum) {
		SqlSession session = DBConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).delete(commentnum);
			if(cnt>0) return true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return false;
	}

	public List<Comment> commentlist_select(int boardnum) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("boardnum", boardnum);
			return session.getMapper(cls).select(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}

}
