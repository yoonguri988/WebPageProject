package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.PlayListMapper;

public class PlayListDao {
	private Map<String, Object> map = new HashMap<String, Object>();
	private Class<PlayListMapper> cls = PlayListMapper.class;
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
	
	public int boardcount() {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).boardcount();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0; 
	} 
	
	public List<PlayList> boardlist(int memnum, int pageNum, int limit) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("start", (pageNum-1)*limit);
			map.put("limit", limit);
			map.put("memnum", memnum);
			return session.getMapper(cls).select(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}

	public List<PlayList> youtubeimg() {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			return session.getMapper(cls).youtubeimgselect();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}

	public boolean insert(PlayList pl) {
		SqlSession session = DBConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).insert(pl);
			if(cnt > 0) return true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return false;
	}

	public PlayList select_info(int listnum) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("listnum", listnum);
			return session.getMapper(cls).select_info(map).get(0);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}
	public PlayList selectOne(int listnum) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("listnum", listnum);
			return session.getMapper(cls).select(map).get(0);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}

	public boolean update(PlayList pl) {
		SqlSession session = DBConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).update(pl);
			if(cnt>0) return true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return false;
	}

	public boolean delete(int listnum) {
		SqlSession session = DBConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).delete(listnum);
			if(cnt>0) return true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return false;
	}
}
