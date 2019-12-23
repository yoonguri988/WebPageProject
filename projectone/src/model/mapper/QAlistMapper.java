package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Board;
import model.QAlist;

public interface QAlistMapper {

	@Select("select ifnull(max(qanum),0) from qalist")
	int maxnum();

	@Select({"<script>",
	     " select * from qalist ",
	     " <if test='qanum != null'>",
	     " where qanum=#{qanum}</if>",
	     " <if test='start != null'>",
     	 " order by qanum desc limit ${start},${limit}</if>",
         " </script>"})
	List<QAlist> select(Map<String, Object> map);

	@Insert( "insert into qalist"
			+ " (qanum, question, answer) "
			+ " values(#{qanum}, #{question}, #{answer})")
	int insert(QAlist qa);

	@Update({"<script>",
		 " update qalist set question=#{question}, ",
		 " answer=#{answer} ",
		 " where qanum=#{qanum} ",
		 "</script>"})
	int update(QAlist qa);

	@Select({"<script>",
        " select count(*) from qalist",
        " </script>"})
	int boardcount();
	
	

	
	
}
