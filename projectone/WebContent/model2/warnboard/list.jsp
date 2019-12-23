<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
/WebCotent/model2/warnboard/list.jsp 
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>yellow CARD</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap&subset=korean" rel="stylesheet">

<style type="text/css">
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
	    background-image: url("/projectone/imgs/yellowcard.jpg");                                                               
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
		font-size: 32px;
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
	#in {
 		display: inline-block;
 	 	text-align:center;
 	}
</style>
  
</head>  
<body>

<div id="in" style="margin: auto; width: 100%; padding-top:64px; ">
<span class="img" style="width: 100%; height:200px; font-size:55px; ">
<h1 style="font-size:80px; font-family: 'East Sea Dokdo', cursive;">yellow CARD</h1>
</span>
<form action="list.do" method="post" name="sf">
<input type="hidden" name="pageNum" value="1">
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
<c:if test="${sessionScope.login != 'admin' }">
<table style="width: 100%; border-right: hidden;">
<tr style="border-right: hidden;"> 
	<td style="text-align: left; font-size: 48px;">
		<input type="radio" name="memnumsort" value="0" 
		onclick="listdo(null,this.value)" checked>전체 신고 내역
		<input type="radio" name="memnumsort" value="${mymemnum}"
		onclick="listdo(null,this.value)" <c:if test="${param.memnumsort==mymemnum}">checked</c:if>>내가 신고한 내역
		<script>
			function listdo(page,value){
			   	if(page!=null){
					document.sf.pageNum.value=page;
				}
				document.sf.submit();
			}
		</script>
	</td>
</tr>
</table>
</c:if>
</form>
</div>

<table border="1" id="secondtable" style="border-right: hidden;">
	<c:if test="${warncount==0 }">
	<tr><td colspan="5">등록된 게시물이 없습니다.</td></tr>
	</c:if>
	<c:if test="${warncount>0 }">
	<tr>
	<th width="8%">접수번호</th>
	<th width="50%">신고제목</th>
	<th width="11%">진행내용</th>
	
	</tr>
	<c:forEach var="b" items="${list}">
	<tr> 
		<td>
		${warnnum}<%-- 원래는 boardnum-- 였음 --%>
		<c:set var="warnnum" value="${warnnum-1 }"/>
		</td>
		<td>
		<c:if test="${sessionScope.login == 'admin' }">
		<a href ="info.do?warnnum=${b.warnnum }">${b.title}</a>
		</c:if>
		<c:if test="${sessionScope.login != 'admin' }">
		${b.title }
		</c:if>
		</td>
		<td>
		<c:if test="${b.state==0}">접수 및 진행중</c:if>
		<c:if test="${b.state==1}">완료</c:if>
		</td>
	</tr>
	</c:forEach>
	<tr style="border-top: 3px solid rgb(155,112,104); border-bottom: hidden;">
		<td colspan="6">&nbsp;</td>
		</tr>
	<tr style="border-top: 3px solid rgb(155,112,104); border-bottom: hidden;">
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
	<tr>
</table>
</body>
</html>