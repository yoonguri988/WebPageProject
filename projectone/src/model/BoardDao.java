package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.BoardMapper;

public class BoardDao {
	private Map<String, Object> map = new HashMap<String, Object>();
	private Class<BoardMapper> cls = BoardMapper.class;

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
	
	public boolean insert(Board board) {
		SqlSession session = DBConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).insert(board);
			if(cnt > 0) return true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return false;
	}

	public int boardcount(int boardtype,int boardcategory) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("boardtype", boardtype);
			map.put("boardcategory", boardcategory);
			return session.getMapper(cls).boardcount(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0; 
	} 
	
	public List<Board> boardlist(int boardtype,int boardcategory, int pageNum, int limit) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("boardtype", boardtype);
			map.put("boardcategory", boardcategory);
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
	
	public Board selectOne(int boardnum,int boardtype,int boardcategory) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("boardnum", boardnum);
			map.put("boardtype", boardtype);
			map.put("boardcategory", boardcategory);
			return session.getMapper(cls).select(map).get(0);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}
	
	public void readcntadd(int boardnum) {
		SqlSession session = DBConnection.getConnection();
		try {
			session.getMapper(cls).readcntadd(boardnum);		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
	}
	
	public boolean update(Board board) {
		SqlSession session = DBConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).update(board);
			if(cnt>0) return true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return false;
	}
	
	public boolean delete(int boardnum) {
		SqlSession session = DBConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).delete(boardnum);
			if(cnt>0) return true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return false;
	}

	public String boardlist_id(int boardnum) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("boardnum", boardnum);
			return session.getMapper(cls).select_id(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}
}
