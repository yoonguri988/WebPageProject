<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<%--
/WebCotent/model2/imgboard/list.jsp 
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작은 순간을 예쁜 물감으로</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap&subset=korean" rel="stylesheet">
<script>
	function listdo(page){
		document.sf.pageNum.value=page;
		document.sf.submit();
	}
</script>
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
	#pagebutton{
		font-size: 32px;
		border-radius: 12px;
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
	    background-image: url("/projectone/imgs/palette.png");                                                               
    	background-size: contain;
 	} 
 	table{
 		border-collapse: collapse;
 	}
 	table, tr, td, th{
 		border: hidden;
 	}
</style>  
  
</head>  
<body>

<div id="in" style="margin: auto; width: 100%; padding-top:64px; ">
<span class="img" style="width: 100%; height:200px; font-size:80px;">작은 순간을 예쁜 물감으로</span>
<form action="list.do" method="post" name="sf">
<input type="hidden" name="pageNum" value="1">
<input type="hidden" name="boardtype" value="${b.boardtype }">
<input type="hidden" name="boardnum" value="${b.boardnum }">
</form>
</div>

<table border="1" style="text-align: center; width: 100%;">
	<c:if test="${boardcount==0 }">
	<tr><td colspan="5">등록된 게시물이 없습니다.</td></tr>
	</c:if>
	<tr> 
		<c:forEach var="b" items="${list}" begin="0" end="3">
		<td>
			<img src="${path }/model2/imageboard/file/sm_${b.file1 }" onclick="location.href='info.do?boardtype=${b.boardtype }&boardnum=${b.boardnum }&boardcategory=0'">
		</td>
		</c:forEach>
	</tr>
	<tr> 
		<c:forEach var="b" items="${list}" begin="4" end="7">
		<td>
			<img src="${path }/model2/imageboard/file/sm_${b.file1 }" onclick="location.href='info.do?boardtype=${b.boardtype }&boardnum=${b.boardnum }&boardcategory=0'">
		</td>
		</c:forEach>
	</tr> 
	<tr><td colspan="4">&nbsp;</td></tr>
	<tr >
		<td colspan="6" style="border-bottom: hidden;">
		<c:if test="${pageNum<=1 }">
		<button id="pagebutton" >이전</button>
		</c:if>
		<c:if test="${pageNum>1 }">
			<button  id="pagebutton" onclick="javascript:listdo(${pageNum-1})">이전</button>
		</c:if>
		<c:forEach var="a" begin="${startpage }" end="${endpage }">
			<c:if test="${a==pageNum }">
			<button id="pagebutton" >${a }</button>
			</c:if>
			<c:if test="${a!=pageNum }">
				<button  id="pagebutton"  onclick="javascript:listdo(${a })"> ${a }</button>
			</c:if>
		</c:forEach>
		<c:if test="${pageNum>=maxpage }">
		<button id="pagebutton">다음</button>
		</c:if>
		<c:if test="${pageNum<maxpage }">
			<button id="pagebutton" onclick="javascript:listdo(${pageNum+1})">다음</button>
		</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="5" style="text-align: right">
			<button id="pagebutton" onclick="location.href='writeForm.do'">글쓰기</button>
		</td>
</table>
</body>
</html>