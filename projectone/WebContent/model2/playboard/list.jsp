<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
/WebCotent/model2/playboard/list.jsp 
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이 밤 잠 못 들게</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap&subset=korean" rel="stylesheet">
<script type="text/javascript" 
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script >
	function listdo(page){
		document.sf.pageNum.value=page;
		document.sf.submit();
	}
	$(document).ready(function() {
		$("input:checkbox").on('click', function() {
			if ( $(this).prop('checked') ) { 
				var listnum = $(this).val();
				$.ajax("mylist_select.do?id=${sessionScope.login}&listnum="+$(this).val(),{
					success : function(data){//콜백함수
						alert("나의 리스트에 저장하였습니다.")
					},
					error : function(e){
						alert("나의 리스트에 저장하는 것에 실패하였습니다.")
					}
				})
			} else {
				var listnum = $(this).val();
				$.ajax("mylist_delete.do?id=${sessionScope.login}&listnum="+$(this).val(),{
					success : function(data){//콜백함수
						alert("나의 리스트에서 삭제하였습니다.")
					},
					error : function(e){
						alert("나의 리스트에 삭제하는 것에 실패하였습니다.")
					}
				})
			} 
		}); 
	});
/* 
	$.ajax("ajax1-1.jsp",{
		success : function(data){//콜백함수
			$("body").append(data);
		},
		error : function(e){
			alert("서버 오류 : "+e.status);
		}
	})
	 */
		/* mylist.do?id=${sessionscope.login}&num=value */
</script>
<style type="text/css">  
	body{
		color:black;  
		font-size: 15px;
	}
	#btn{
		width: 100%;
		font-size: 20px;
		background-color: rgb(192,165,154);
		border: none; 
		
	}
	#button{
		font-size: 16px;
		background-color: rgb(231,228,211);
		border: none;
	}
	#in {
 	display: inline-block;

 	}
 	.inputdb{
 		width: 50%;
 	} 
 	.img{ 
 		font-family: 'East Sea Dokdo', cursive;
 		float: right;
	    background-image: url("/projectone/imgs/playlist.png");                                                               
    	background-size: contain;
 	} 
  	table{
 		border-collapse: collapse;
 		width: 100%;
 	} 
 	table, tr, td {
 		border: hidden;
 	}
 	#pagebutton{
		font-size: 18px;
		border-radius: 12px;
		background-color: rgb(231,228,211);
		border: none;
	}

</style>  
   
</head>  
<body>

<div id="in" style="margin: auto; width: 100%; padding-top:64px; ">
<span class="img" style="width: 100%; height:200px; font-size:80px; ">이 밤 잠 못 들게</span>
<form action="list.do" method="post" name="sf" style="width: 100%;">
<input type="hidden" name="pageNum" value="1">
</form>
</div>
<table border="1" >
	<c:if test="${listcount==0 }">
	<tr><td colspan="5">등록된 게시물이 없습니다.</td></tr>
	</c:if>
	<c:if test="${listcount>0 }">
	<tr> 
	<c:forEach var="pl" items="${list}" varStatus="status" begin="0" end="3">
		<td >
		<button id="btn" onclick="javascript:location.href='info.do?listnum=${pl.listnum}'">
		<c:set var="after" value="${fn:substringAfter(pl.youtubeurl,'embed')}"></c:set>
		<img width="320" height="240" src="https://i.ytimg.com/vi${fn:substringBefore(after,'\"')}/maxresdefault.jpg">
		</button>
		</td>
	</c:forEach>
	</tr>
	<tr> 
	<c:forEach var="pl" items="${list}" varStatus="status" begin="0" end="3"> 
		<td style="text-align: center; font-size: 42px;">
		<input type="checkbox" id="checkBoxId" name="listnum"
		value="${pl.listnum}" 
		<c:if test="${pl.chkcnt>0}" >checked= "ckecked"</c:if> >
		${listnumber }
		<c:set var="listnumber" value="${listnumber-1 }"/>
		</td>
	</c:forEach>
	</tr>
	<tr> 
	<c:forEach var="pl" items="${list}" varStatus="status" begin="4" end="8">
		<td >
		<button id="btn" onclick="javascript:location.href='info.do?listnum=${pl.listnum}'">
		<c:set var="after" value="${fn:substringAfter(pl.youtubeurl,'embed')}"></c:set>
		<img width="320" height="240" src="https://i.ytimg.com/vi${fn:substringBefore(after,'\"')}/maxresdefault.jpg">
		</button>
		</td>
	</c:forEach>
	</tr>
	<tr> 
	<c:forEach var="pl" items="${list}" varStatus="status" begin="4" end="8"> 
		<td style="text-align: center; font-size: 42px;">
		<input type="checkbox" id="checkBoxId" name="listnum"
		value="${pl.listnum}" 
		<c:if test="${pl.chkcnt>0}" >checked= "ckecked"</c:if> >
		${listnumber }
		<c:set var="listnumber" value="${listnumber-1 }"/>
		</td>
	</c:forEach>
	</tr>
	<tr style="border-top: 3px solid rgb(155,112,104); border-bottom: hidden;">
		<td colspan="6">&nbsp;</td>
		</tr>
		<tr >
		<td colspan="6" style="border-bottom: hidden;">
		<c:if test="${pageNum<=1 }">
		<button id="pagebutton" >이전</button>
		</c:if>
		<c:if test="${pageNum>1 }">
			<button  id="pagebutton" onclick="javascript:listdo(${pageNum-1},null)">이전</button>
		</c:if>
		<c:forEach var="a" begin="${startpage }" end="${endpage }">
			<c:if test="${a==pageNum }">
			<button id="pagebutton" >${a }</button>
			</c:if>
			<c:if test="${a!=pageNum }">
				<button  id="pagebutton"  onclick="javascript:listdo(${a },null)"> ${a }</button>
			</c:if>
		</c:forEach>
		<c:if test="${pageNum>=maxpage }">
		<button id="pagebutton">다음</button>
		</c:if>
		<c:if test="${pageNum<maxpage }">
			<button id="pagebutton" onclick="javascript:listdo(${pageNum+1},null)">다음</button>
		</c:if>
		</td>
	</tr>
	</c:if>
	<c:if test="${sessionScope.login=='admin' }">
	<tr>
		<td colspan="5" style="text-align: right">
			<button id="button" onclick="javascript:location.href='writeForm.do'">글쓰기</button>
		</td>
	</tr>
	</c:if>
</table>
</body>
</html>