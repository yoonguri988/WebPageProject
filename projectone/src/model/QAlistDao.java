package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.QAlistMapper;

public class QAlistDao {
	private Map<String, Object> map = new HashMap<String, Object>();
	private Class<QAlistMapper> cls = QAlistMapper.class;
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
	public QAlist selectOne(int qanum) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("qanum", qanum);
			return session.getMapper(cls).select(map).get(0);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}
	public boolean insert(QAlist qa) {
		SqlSession session = DBConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).insert(qa);
			if(cnt > 0) return true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return false;
	}
	public boolean update(QAlist qa) {
		SqlSession session = DBConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).update(qa);
			if(cnt>0) return true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return false;
	}
	public int qacount() {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			return session.getMapper(cls).boardcount();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0; 
	}
	public List<QAlist> qalist(int pageNum, int limit) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
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

}
