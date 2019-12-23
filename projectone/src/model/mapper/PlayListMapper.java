package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.PlayList;

public interface PlayListMapper {
	@Select("select ifnull(max(listnum),0) from playlist")
	int maxnum();
	
	@Select(" select count(*) from playlist")
	int boardcount();

	@Select({"<script>",
		     " SELECT * ",
		     " <if test='memnum != null'> ",
		     " ,(SELECT count(*) FROM mylist m WHERE memnum=#{memnum} </if>",
		     " AND m.listnum = p.listnum) chkcnt ", 
		     " from playlist p " ,
		     " <if test='listnum != null'>",
		     " where listnum=${listnum} </if>",
		     " <if test='start != null'>",
	    	 " order by listnum desc limit ${start},${limit} </if>",
	        " </script>"})
	List<PlayList> select(Map<String, Object> map);
	
	@Select({"<script>",
		" SELECT *  from playlist",
		" <if test='listnum != null'>",
		" where listnum=${listnum} </if>",
		" <if test='start != null'>",
		" order by listnum desc limit ${start},${limit} </if>",
	" </script>"})
	List<PlayList> select_info(Map<String, Object> map);

	@Select(" select youtubeurl from playlist")
	List<PlayList> youtubeimgselect();

	@Insert( "insert into playlist "
			+ " (listnum, youtubeurl) "
			+ " values(#{listnum},#{youtubeurl}) ")
	int insert(PlayList pl);

	@Update({"<script>",
		 " update playlist set youtubeurl=#{youtubeurl}",
		 " where listnum=#{listnum}",
		 "</script>"})
	int update(PlayList pl);

	@Delete("delete from playlist"
			+ " where listnum=#{listnum}")
	int delete(int listnum);
}
