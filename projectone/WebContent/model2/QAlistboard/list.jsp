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
<style type="text/css">  
	th {
		border-right: 2px dashed grey;
		font-size: 48px; 
	}
	td{
	font-size: 32px; 
	border-right: 2px dashed grey;
	word-break:break-all;
	}
	#button{
		font-size: 16px;
		background-color: rgb(231,228,211);
		border: none;
	}
	#pagebutton{
		font-size: 24px;
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
<input type="hidden" name="qanum" value="${qa.qanum}">
<table border="1" >
		<caption><h1>Q & A 가입 절차 질문 목록</h1></caption>
		<tr>
		<th>번호</th>
		<th>질문</th>
		<th style="border-right: hidden;">정답</th>
		</tr>
		<c:forEach var="qa" items="${list}">
		<tr >
		<td>
		${qacount}
		<c:set var="qacount" value="${qacount-1 }"/>
		</td>
		<td><a href="updateForm.do?qanum=${qa.qanum}">${qa.question}</a></td>
		<td style="border-right: hidden;">${qa.answer}</td>
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
