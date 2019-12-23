package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import model.MyList;

public interface MyListMapper {

	@Select("select ifnull(max(mylistnum),0) from mylist")
	int maxnum();

	@Insert( "insert into mylist "
			+ " (mylistnum,memnum,listnum) "
			+ " values(#{mylistnum},#{memnum},#{listnum}) ")
	int insert(MyList ml);

	@Select({"<script>",
	     "select * from mylist where memnum = #{memnum}",
	     " <if test='listnum != null'> and listnum = #{listnum}</if>",
	     " <if test='start != null'>",
    	 " order by boardnum desc limit ${start},${limit}</if>",
        " </script>"})
	List<MyList> select(Map<String, Object> map);

	@Delete("delete from mylist"
			+ " where memnum=#{memnum} and listnum = #{listnum}")
	int delete(Map<String, Object> map);

	@Select({"<script>",
		"select listnum from mylist where memnum = #{memnum}",
	" </script>"})
	List<Integer> select_listnum(Map<String, Object> map);

	@Select({"<script>",
	     "select * from mylist where memnum = #{memnum}",
	     " <if test='start != null'>",
    	 " order by mylistnum desc limit ${start},${limit}</if>",
	" </script>"})
	List<MyList> select_memnum(Map<String, Object> map);

	@Select("SELECT COUNT(*) FROM mylist WHERE memnum=#{memnum}")
	int mlcount(Map<String, Object> map);

}
