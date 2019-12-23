package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.WarnMapper;


public class WarnDao {
	private Map<String, Object> map = new HashMap<String, Object>();
	private Class<WarnMapper> cls = WarnMapper.class;
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
	public boolean insert(Warn w) {
		SqlSession session = DBConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).insert(w);
			if(cnt > 0) return true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return false;
	}
	public List<Warn> boardlist(int memnumsort, int pageNum, int limit) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("start", (pageNum-1)*limit);
			map.put("limit", limit);
			map.put("memnumsort", memnumsort);
			return session.getMapper(cls).select(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}
	public int boardcount(int memnumsort) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("memnumsort", memnumsort);
			return session.getMapper(cls).boardcount(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0; 
	}
	public Warn selectOne(int warnnum) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("warnnum", warnnum);
			return session.getMapper(cls).select(map).get(0);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}
	public boolean stateadd(int warnnum) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("warnnum", warnnum);
			return session.getMapper(cls).stateadd(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return false;
	}

}
