package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Board;

public interface BoardMapper {
	@Select("select ifnull(max(boardnum),0) from board")
	int maxnum();
	
	@Insert( "insert into board "
			+ " (boardnum,id,boardtype,boardcategory, "
			+ " title, content, file1, readcnt) "
			+ " values(#{boardnum},#{id},#{boardtype},#{boardcategory},"
			+ "  #{title}, #{content}, #{file1},0) ")
	int insert(Board board);
	@Select({"<script>",
	         " select count(*) from board where boardtype = #{boardtype}",
	         " <if test='boardcategory != 0'> and boardcategory = #{boardcategory}</if>",
	         " </script>"})
	int boardcount(Map<String, Object> map);

	@Select({"<script>",
		     "select * from board where boardtype = #{boardtype}",
		     " <if test='boardnum != null'> and boardnum = #{boardnum}</if>",
		     " <if test='boardcategory != 0'> ",
		     " <if test='boardcategory != null'> ",
		     " and boardcategory = #{boardcategory}",
		     " </if>",
		     " </if>",
		     " <if test='start != null'>",
	     	 " order by boardnum desc limit ${start},${limit}</if>",
	         " </script>"})
	List<Board> select(Map<String, Object> map);

	@Update("update board"
			+ " set readcnt=readcnt+1"
			+ " where boardnum=#{boardnum}")
	void readcntadd(int boardnum);
	

	@Update({"<script>",
			 " update board set boardtype=#{boardtype},",
			 " boardcategory=#{boardcategory}, title=#{title}, content=#{content} ",
			 " <if test='file1 != null'> , file1 = #{file1}</if>",
			 " where boardnum=#{boardnum}",
			 "</script>"})
	int update(Board board);

	@Delete("delete from board"
				+ " where boardnum=#{boardnum}")
	int delete(int num);

	@Select({"<script>",
	     "select id from board",
	     " <if test='boardnum != null'> where boardnum = #{boardnum}</if>",
        " </script>"})
	String select_id(Map<String, Object> map);

	

}
