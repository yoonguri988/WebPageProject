package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import model.Comment;

public interface CommentMapper {
	@Select("select ifnull(max(commentnum),0) from comment")
	int maxnum();
	
	@Insert( "insert into comment "
			+ " (commentnum,boardnum,memnum,content) "
			+ " values(#{commentnum},#{boardnum},#{memnum},#{content})")
	int insert(Comment Comment);

	@Select({"<script>",
	        " select count(*) from comment where boardnum=#{boardnum} ",
	        " </script>"})
	int commentcount(Map<String, Object> map);

	@Select({"<script>",
		     " select * from comment ",
			 " <if test='commentnum != null'>",
		     " where commentnum=#{commentnum}</if> ",
		     " <if test='boardnum != null'>",
		     " where boardnum=#{boardnum}</if> ",
		     " <if test='start != null'>",
	    	 " order by commentnum desc limit ${start},${limit}</if>",
	    	 " order by commentnum desc",
	         " </script>"})
	List<Comment> select(Map<String, Object> map);

	@Delete("delete from comment"
			+ " where commentnum=#{commentnum}")
	int delete(int commentnum);
}
