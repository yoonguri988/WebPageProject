<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
/WebContent/model2/member/list.jsp
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 보기</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap&subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style type="text/css">  
	th {
		font-family: 'Nanum Pen Script', cursive;
		border-right: 2px dashed grey;
		font-size: 40px; 
	}
	td{
	font-family: 'Nanum Pen Script', cursive;
	font-size: 32px; 
	border-right: 2px dashed grey;
	word-break:break-all;
	}
	#button{
		font-size: 32px;
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
	table{   
		width : 100%;
		
		border-collapse: collapse;  
		
		border-left: hidden; border-right: hidden; 
		border-top: 5px solid rgb(155,112,104);
		
	}
	#in {
 		display: inline-block;
 	 	text-align:center;
 	}
</style>
<script type="text/javascript">
function listdo(page){
	document.sf.pageNum.value=page;
	document.sf.submit();
}
</script>
</head> 
<body style="color: black;">
<div id="in" style="margin: auto; padding-top: 128px; width: 100%;">
<form name="sf" method="post" style="">
<input type="hidden" name="pageNum" value="1">
<table border="1" >
		<caption><h1 style="font-size: 70px;">MEMBER MANAGEMENT</h1></caption>
		<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>닉네임</th>
		<th>전화</th>
		<th>경고횟수</th>
		<th>관리</th>
		</tr>
		<c:forEach var="m" items="${list}">
		<tr >
		<td>
		<a href="mypageForm.do?id=${m.id }">${m.id }</a>
		</td>
		<td>${m.name }</td>
		<td>${m.nick}</td>
		<td>${m.tel}</td>
		<td>${m.warncnt}</td>
		<td>
			<input type="button" id="button" onclick="location.href='updateForm.do?id=${m.id}'" value="수정">
			<c:if test="${m.id != 'admin'}">
			<input type="button" id="button" onclick="location.href='delete.do?id=${m.id}'" value="강제탈퇴">
			<input type="button" id="button" onclick="location.href='warn.do?id=${m.id}'" value="경고하기">
			</c:if>
		</td>
		</tr> 
		</c:forEach>
		<tr style="border-top: 3px solid rgb(155,112,104); border-bottom: hidden;">
		<td colspan="6">&nbsp;</td>
		</tr>
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
	</table>
</form>
</div>
</body>
</html>
