package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Warn;

public interface WarnMapper {

	@Select("select ifnull(max(warnnum),0) from warnboard")
	int maxnum();
	
	@Insert( "insert into warnboard "
			+ " (warnnum, memnum, boardnum, title, content, state) "
			+ " values(#{warnnum}, #{memnum}, #{boardnum}, #{title}, #{content}, 0)")
	int insert(Warn w);

	@Select({"<script>",
			 " select count(*) from warnboard ",
			 " <if test='memnumsort != 0'> ",
			 " where memnum = #{memnumsort}",
			 " </if>",
			 " </script>"})
	int boardcount(Map<String, Object> map);

	@Select({"<script>",
	     "select * from warnboard",
	     " <if test='warnnum != null'> where warnnum = #{warnnum}</if>",
	     " <if test='memnumsort != 0'>",
	     " <if test='memnumsort != null'>",
	     " where memnum = #{memnumsort}",
	     " </if>",
	     " </if>",
	     " <if test='start != null'>",
    	 " order by boardnum desc limit ${start},${limit}</if>",
        " </script>"})
	List<Warn> select(Map<String, Object> map);

	@Update("update warnboard set state=1 where warnnum=#{warnnum}")
	boolean stateadd(Map<String, Object> map);

	

}
