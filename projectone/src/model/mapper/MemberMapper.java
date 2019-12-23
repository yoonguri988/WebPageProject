package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Member;
 
public interface MemberMapper {
	@Select({"<script>",
			 " select * from member ",
			 " where binary deadmem=0 ",
			 " <if test='id != null'> and binary id=#{id} </if>",
			 " <if test='limit != null'> order by memnum limit ${start},${limit} </if>",
			 "</script>"})
	List<Member> select(Map<String, Object> map);
	
	@Select({"select count(*) from member"})
	int membercount();

	@Insert("insert into member"+
			" (memnum, id, pass, name, nick, tel, chk)"+
			" values ( #{memnum},#{id}, #{pass}, #{name}, #{nick},"+
			        " #{tel}, #{chk})")
	int insert(Member m);

	@Update("update member set name=#{name}, "+
			" nick=#{nick}, tel=#{tel}"+
			" where id=#{id}")
	int update(Member m);

	@Delete("delete from member where id=#{id}")
	int delete(String id);

	@Update( "update member"+
		     " set pass= #{pass}"+
		     " where id=#{id}")
	int updatepass(@Param("id") String id, @Param("pass") String pass);

	@Select("select id from member"+
			" where name=#{name} and tel=#{tel}")
	String idSearch(@Param("name")String name, @Param("tel")String tel);

	@Select("select pass from member"+
			" where name=#{name} and tel=#{tel} and id=#{id}")
	String passSearch(@Param("id")String id, @Param("name")String name, @Param("tel")String tel);
	
	@Select("select max(memnum) from member")
	int maxmemnum();

	@Update("update member set"+
			" deadmem=deadmem+1 where id=#{id}")
	boolean deadmemup(String id);

	@Update("update member set"+
			" warncnt=warncnt+1 where id=#{id}")
	boolean warncntup(String id);

	@Select("select id from member where nick=#{nick}")
	String selectnick(Map<String, Object> map);

	@Select("select memnum from member where nick=#{nick}")
	int select_memnum(Map<String, Object> map);
	
	@Select("select id from member where memnum=#{memnum}")
	String select_id(Map<String, Object> map);
	
	@Select("select nick from member where memnum=#{memnum}")
	String select_nick(Map<String, Object> map);
	
	@Select("select memnum from member where id=#{id}")
	int select_memnum_id(Map<String, Object> map);

	
}
