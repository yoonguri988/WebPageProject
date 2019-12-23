<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<%-- 
/WebContent/model2/member/mypageForm.jsp
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>마이페이지</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap&subset=korean" rel="stylesheet">
<style type="text/css">  
	th {
		border-right: 2px dashed grey;
		font-size: 24px; 
	}
	#button{
		font-size: 20px;
		background-color: rgb(231,228,211);
		border: none;
	}
	#leftbutton{
		font-size: 20px;
		background-color: rgb(231,228,211);
		border: none;
	}
	#pagebutton{
		font-size: 20px;
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
		font-size: 55px; 
	}
	table{   
		width : 450px;
		height: 300px;
		border-collapse: collapse;  
		
		border-left: hidden; border-right: hidden; 
		border-top: 5px solid rgb(155,112,104);
	}
	#in {
 		display: inline-block;
 	}
</style>
	<script type="text/javascript">
	function delete_chk(){
		var result = confirm("정말 탈퇴하시겠습니까? ㅠㅠ");
		if(!result){
			return false;
		}
	}
	function listdo(page){
		document.sf.pageNum.value=page;
		document.sf.submit();
	}
	</script>
</head>
<body style="color: black;">
<div id="in" style="margin: auto; padding-top: 128px; float: right;">
<form name="f" method="post" action="delete.do?id=${info.id }" style="text-align: center" onsubmit="return delete_chk()">
<table border="1" style="margin-right: 32px;">
	<h1  style="font-size: 74px;">내 정보</h1>
	<tr>
	<th colspan="2" style="font-size: 32px;">아이디</th>
	<td colspan="4" style="font-size: 28px;">${info.id }</td>
	</tr>
	<tr>
	<th colspan="2" style="font-size: 32px;">이름</th>
	<td colspan="4" style="font-size: 28px;" >${info.name }</td>
	</tr>
	<tr>
	<th colspan="2" style="font-size: 32px;">닉네임</th>
	<td colspan="4" style="font-size: 28px;">${info.nick }</td>
	</tr>
	<tr>
	<th colspan="2" style="font-size: 32px;">전화</th>
	<td colspan="4" style="font-size: 28px;">${info.tel }</td>
	</tr>
	<tr style="border-bottom: 3px solid rgb(155,112,104); ">
	<th colspan="2" style="font-size: 32px;">경고횟수</th>
	<td colspan="4" style="font-size: 28px;">${info.warncnt } 회</td> 
	</tr>
	<tr>
	<th style="border-bottom: hidden; border-right: hidden; border-left: hidden;"> &nbsp;</th>
	<td colspan="2" style="text-align: right; border-bottom: hidden;">
	<c:if test="${info.id=='admin'}">
	<td style="border: hidden">
	<input  type="button" value="공지사항 작성" style="float: left;" id="leftbutton"
	onclick="location.href='${path}/model2/noticeboard/writeForm.do'">
	</td>
	<td style="border: hidden">
	<input  type="button" value="가입질문&정답 작성" style="float: left;" id="leftbutton"
	onclick="location.href='${path}/model2/QAlistboard/writeForm.do'">
	</td>
	<td style="border: hidden">
	<input  type="button" value="회원관리" style="float: left;" id="leftbutton"
	onclick="location.href='list.do'">
	</td>
	</c:if>
	</td>
	</tr>
	<tr>
	<td colspan="6" style="border-bottom: hidden; border-right: hidden;">
	 <br>
	<input id="leftbutton" type="button" value="수정" onclick="location.href='updateForm.do?id=${info.id}'">
	<c:if test="${info.id!='admin' && sessionScope.login != 'admin' }">
	<input id="leftbutton"  type="submit" value="탈퇴" >
	</c:if>
	</td>
	</tr>
	</table>
	</form>
	</div>
<div id="in" style="margin: auto; padding-top: 128px; float: left;">
<form name="sf" action="mypageForm.do?id=${param.id }" method="post" style="text-align: center">
<input type="hidden" name="pageNum" value="1">
	<table border="1" style="margin-left: 32px;">
	<h1 style="font-size: 74px;">MY PLAYLIST</h1>
	<tr>
	<th style="font-size: 32px;" >번호</th>
	<th style="font-size: 32px; border-right: hidden;" >음악목록</th>
	</tr>
	<c:forEach var="li" items="${mylist }">
	<tr>
	<td style="font-size: 24px; border-right: 2px dashed grey;">${mlnum }</td>
	<c:set var="mlnum" value="${mlnum-1 }"/>
	<td style="font-size: 24px; border-right: hidden;">
	<a href="../playboard/info.do?listnum=${li.listnum }">${li.listnum }</a>
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