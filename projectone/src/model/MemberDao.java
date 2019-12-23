package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.MemberMapper;
 
public class MemberDao  {
	private Map<String, Object> map = new HashMap<String, Object>();
	private Class<MemberMapper> cls = MemberMapper.class;
	public Member selectOne(String id) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("id", id);
			List<Member> list = session.getMapper(cls).select(map);
			return list.get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
		
	}
	public int maxmemnum() {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).maxmemnum();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}
	public int insert(Member m) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).insert(m);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}
	public List<Member> list(int pageNum,int limit){
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("start", (pageNum-1)*limit);
			map.put("limit", limit);
			return session.getMapper(cls).select(map);
		}catch (Exception e){
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}  
		return null;
	}

	public int update(Member m) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).update(m);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}
	
	public int delete(String id) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).delete(id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}
	
	public int updatePass(String id,String pass) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).updatepass(id,pass);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}
	
	public String idSearch(String name,String tel) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).idSearch(name,tel);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}
	public String passSearch(String id, String name, String tel) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).passSearch(id,name,tel);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}
	public boolean deadmemup(String id) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).deadmemup(id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return false;
	}
	public boolean warncntup(String id) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).warncntup(id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return false;
	}
	public int membercount() {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).membercount();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0; 
	}
	public String selectnick(String nick) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("nick", nick);
			return session.getMapper(cls).selectnick(map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}
	public int select_memnum(String nick) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("nick", nick);
			return session.getMapper(cls).select_memnum(map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}
	public String select_id(int memnum) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("memnum", memnum);
			return session.getMapper(cls).select_id(map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}
	public String select_nick(int memnum) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("memnum", memnum);
			return session.getMapper(cls).select_nick(map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
	}
	public int select_memnum_id(String id) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("id", id);
			return session.getMapper(cls).select_memnum_id(map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}

}
