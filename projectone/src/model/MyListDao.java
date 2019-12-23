package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.MyListMapper;

public class MyListDao {
	private Map<String, Object> map = new HashMap<String, Object>();
	private Class<MyListMapper> cls = MyListMapper.class;
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
	public boolean insert(MyList ml) {
		SqlSession session = DBConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).insert(ml);
			if(cnt > 0) return true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return false;
	}
	public MyList selectOne(int listnum, int memnum) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("listnum", listnum);
			map.put("memnum", memnum);
			return session.getMapper(cls).select(map).get(0);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}
	public boolean delete(int listnum, int memnum) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("listnum", listnum);
			map.put("memnum", memnum);
			int cnt = session.getMapper(cls).delete(map);
			if(cnt>0) return true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return false;
	}
	public Integer selete_listnum(int memnum) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("memnum", memnum);
			return session.getMapper(cls).select_listnum(map).get(0);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}
	public List<MyList> selectOne_memnum(int memnum, int pageNum, int limit) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("memnum", memnum);
			map.put("start", (pageNum-1)*limit);
			map.put("limit", limit);
			return session.getMapper(cls).select_memnum(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}
	public int mlcount(int memnum) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("memnum",memnum);
			return session.getMapper(cls).mlcount(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}

}
