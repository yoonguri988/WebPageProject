<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
/WebCotent/model2/comboard/list.jsp 
--%>
<!DOCTYPE html>
<html  style="overflow-x:scroll;">
<head>
<meta charset="UTF-8">
<title>응원과 위로의 말</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap&subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style type="text/css">  
/* 	
	td {
		color: rgb(155,112,104);  
		border: hidden;
		font-size: 15px;
	}
*/
body{
	color:black;  
	font-size: 15px;
}
	#btn{
		font-size: 20px;
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
	    background-image: url("/projectone/imgs/combackground.jpg");                                                               
    	background-size: contain;
 	} 
	th {
		background-color:rgb(231,228,211);
		border-right: hidden;
		font-size: 50px; 
	}
	td{
		font-size: 32px; 
		border-right: hidden;
		word-break:break-all;
	}
	#button{
		font-size: 16px;
		background-color: rgb(231,228,211);
		border: none;
	}
	#pagebutton{
		font-size: 18px;
		border-radius: 12px;
		background-color: rgb(231,228,211);
		border: none;
	}
	.long{
		width: 333px;
	}
	.inputdb{
		width: 240px;
	} 
	caption{  
		text-align: left;  
		font-size: 30px; 
	}
	#secondtable{   
		width : 100%;
		border-collapse: collapse;  
		border-left: hidden; border-right: hidden; 
		border-top: 5px solid rgb(155,112,104);
		border-right: hidden;
		
	}
	#css_ra{
		font-size: 60px; 
	}
	#in {
 		display: inline-block;
 	 	text-align:center;
 	}
</style>

  
</head>  
<body>

<div id="in" style="margin: auto; width: 100%; padding-top:64px; ">
<span class="img" style="width: 100%; height:200px; font-size:80px; ">응원과 위로의 글</span>
<form action="list.do" method="post" name="sf">
<input type="hidden" name="pageNum" value="1">
<input type="hidden" name="boardtype" value="1">
<%-- <table style="margin-left: auto; margin-right: auto; width: 100%;s border: 3px solid black;">
	<tr>
		<td style="font-size: 20px;">
		<select name="column" style="height: 44px;">
			<option value="">선택하세요</option>
			<option value="subject">제목</option>
			<option value="name">작성자</option>
			<option value="content">내용</option>
			<option value="subject,content">제목+내용</option>
			<option value="name,content">작성자+내용</option>
		</select>
		<script>
			document.sf.column.value="${param.column}";
		</script>
		<input class="inputdb" type="text" name="find" value="${param.find }">
		<input id="btn" type="submit" value="검색">
		</td>
	</tr>
</table> --%>
<table style="width: 100%; border-right: hidden;">
<tr style="border-right: hidden;">
	<td style="text-align: left; font-size: 50px; border-right: hidden;">
<%-- 	
		<c:set var="checked_1" ></c:set>
	
	<c:if test="${boardcategory==2 }">
		<c:set var="checked_2" value="checked"></c:set>
	</c:if>
	<c:if test="${boardcategory==3 }">
		<c:set var="checked_3" value="checked"></c:set>
	</c:if>
	<c:if test="${boardcategory==4 }">
		<c:set var="checked_4" value="checked"></c:set>
	</c:if>
	<c:if test="${boardcategory==5 }">
		<c:set var="checked_5" value="checked"></c:set>
	</c:if>--%>
		<input type="radio" name="boardcategory" value="0" 
		 onclick="listdo(null,this.value)" <c:if test="${param.boardcategory==0 }">checked</c:if>>전체
		<input type="radio" name="boardcategory" value="1" 
		 onclick="listdo(null,this.value)" <c:if test="${param.boardcategory==1 }">checked</c:if>>드라마
		<input type="radio" name="boardcategory" value="2" onclick="listdo(null,this.value)" 
		 <c:if test="${param.boardcategory==2 }">checked</c:if>>영화
		<input type="radio" name="boardcategory" value="3" onclick="listdo(null,this.value)" 
		<c:if test="${param.boardcategory==3 }">checked</c:if>>노래
		<input type="radio" name="boardcategory" value="4" onclick="listdo(null,this.value)" 
		<c:if test="${param.boardcategory==4 }">checked</c:if>>콘서트
		<input type="radio" name="boardcategory" value="5" onclick="listdo(null,this.value)" 
		<c:if test="${param.boardcategory==5 }">checked</c:if>>팬싸
		<script>
			function listdo(page,value){
				if(page!=null){
				document.sf.pageNum.value=page;
				}
			   	document.sf.boardcategory.value=value;
			   	if(value==0){
			   		document.sf.boardtype=0;
			   	}
				document.sf.submit();
			}
		</script>
	</td>
</tr>
</table>
</form>
</div>
	<c:if test="${param.boardcategory==null}">
	<h1>장르를 선택해주세요</h1>
	<table border="1" id="secondtable" style="border-right: hidden; border-bottom: 2px solid rgb(155,112,104);">
	<tr>
	<th width="8%">번호</th>
	<th width="8%">장르</th>
	<th width="50%">제목</th>
	<th width="14%">작성자</th>
	<th width="11%">조회수</th>
	</tr>
	<c:set var="number" value="8"/>
	<c:forEach var="b" items="${list}" varStatus="status">    
	<tr> 
		<td>
		${number}
		<c:set var="number" value="${number-1 }"/>
		</td>
		<td>
		<c:choose>
			<c:when test="${b.boardcategory ==0}">
			공지사항
			</c:when>
		</c:choose>
		</td>
		<td>
		<a href="../noticeboard/info.do?boardtype=${b.boardtype }&boardnum=${b.boardnum }&boardcategory=${b.boardcategory }">
		${b.title }
		</a>
		</td>
		<td>${nicklist[status.index] }(${b.id})</td>
		<td>${b.readcnt}</td>
	</tr>
	</c:forEach>
	</table>
	</c:if>
<table border="1" id="secondtable" style="border-right: hidden; border-bottom: 2px solid rgb(155,112,104);">
	<c:if test="${param.boardcategory!=null &&boardcount==0 }">
	<tr style="border-bottom: 2px solid rgb(155,112,104);"><td colspan="5">게시물이 없습니다.</td></tr>
	</c:if>
	<c:if test="${boardcount>0 && param.boardcategory!=null }">
	<tr>
	<th width="8%">번호</th>
	<th width="8%">장르</th>
	<th width="50%">제목</th>
	<th width="14%">작성자</th>
	<th width="11%">조회수</th>
	</tr>
	<c:forEach var="b" items="${list}" varStatus="status">    
	<tr> 
		<td>
		${boardnum}
		<c:set var="boardnum" value="${boardnum-1 }"/>
		</td> 
		<td>
		<c:choose>
			<c:when test="${b.boardcategory ==1}">
			드라마
			</c:when>
			<c:when test="${b.boardcategory ==2}">
			영화
			</c:when>
			<c:when test="${b.boardcategory ==3}">
			노래
			</c:when>
			<c:when test="${b.boardcategory ==4}">
			콘서트
			</c:when>
			<c:otherwise>
			팬싸
			</c:otherwise>
		</c:choose>
		</td>
		<td>
		<a href="commentlist.do?boardtype=${b.boardtype }&boardnum=${b.boardnum }&boardcategory=${b.boardcategory }">
		${b.title }
		</a>
		</td>
		<td>${nicklist[status.index] }(${b.id})</td>
		<td>${b.readcnt}</td>
	</tr>
	<%-- </c:forEach> --%>
	</c:forEach>
		<tr style="border-top: 2px solid rgb(155,112,104); border-bottom: hidden;">
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
	<tr style="border-bottom: hidden; border-right: hidden;">
		<td colspan="5" style="text-align: right; ">
			<button id="button" style="font-size: 32px; " onclick="location.href='writeForm.do'">게시</button>
		</td>
	</tr>
</table>
</body>
</html>