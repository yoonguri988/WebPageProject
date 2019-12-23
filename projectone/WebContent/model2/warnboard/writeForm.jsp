<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
/WebCotent/model2/comboard/writeForm.jsp 

--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>게시판 글쓰기</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">  
	td {
		border: hidden;
		font-size: 32px;

	}
	#find{
		
		background-color: rgb(231,228,211);
		border: none;
		
	}
	h1{    
		color: rgb(155,112,104);  
		font-size: 55px; 
	}
	#in {
 	display: inline-block;
 	 text-align:left;
 	}
 	.inputdb{
 	width: 100%;
 	}
</style>  
<script type="text/javascript">
	function inputcheck(){
		f= document.f;
		if(f.title.value==""){
			alert("신고 제목을 입력하세요");
			f.title.focus();
			return false; 
		} 
		if(f.content.value==""){
			alert("신고 내용를 입력하세요");
			f.content.focus();
			return false; 
		} 
	}
</script> 
</head>
<body>
<div id="in" style="margin: auto; width: 100%; padding-top: 64px;">
<form action="write.do" method="post" name="f" onsubmit="return inputcheck()">
<input type="hidden" name="id" value="${param.id}">
<input type="hidden" name="memnum" value="${param.memnum }">
<input type="hidden" name="boardnum" value="${param.boardnum }">
<h1>신고하기 글쓰기</h1>
<table border="1" style="border:hidden;  width: 100%; collapse; ">
	<tr>
	<td>
	</td>
	</tr>
	<tr>
	<td>
	<input type="text" name="title" placeholder="신고제목을 입력해주세요" value="${param.id}를 신고합니다.">
	</td>
	</tr>
	<tr>
	<td>
	<textarea class="inputdb" rows="10" name="content" id="content1" placeholder="신고 내용를 입력해주세요"></textarea>
	</td></tr>
	<tr >
	<td colspan="2" style="text-align: right; font-size: 48px;"><input type="submit" style="font-size: 32px;" id="find" value="게시물 등록" ></td>
	</tr>
</table>
</form>
</div>  
</body>
</html>