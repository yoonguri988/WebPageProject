<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
/WebCotent/model2/notice/writeForm.jsp 

--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>질문 만들기</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">  
	td {
		border: hidden;
		font-size: 15px;

	}
	#find{
		font-size: 20px;
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
		if(f.question.value==""){
			alert("가입 질문을 입력해주세요");
			f.question.focus();
			return false; 
		} 
		if(f.answer.value==""){
			alert("질문에 대한 답을 입력해주세요");
			f.answer.focus();
			return false; 
		} 
	}
</script> 
</head>
<body>
<div id="in" style="margin: auto; width: 100%; padding-top: 64px;">
<form action="write.do" method="post" name="f" onsubmit="return inputcheck()">
<h1>질문 만들기</h1>
<table border="1" style="border:hidden;  width: 100%; collapse; ">
	<tr>
	<td>
	</td>
	</tr>
	<tr>
	<td>
	<input style=" width: 100%; font-size: 32px;" type="text" name="question" placeholder="가입 질문을 입력해주세요">
	</td>
	</tr>
	<tr>
	<td>
	<input style=" width: 100%; font-size: 32px;"  class="inputdb" name="answer" id="content1" placeholder="질문에 대한 답을 입력해주세요">
	</td></tr>
	<tr >
	<td colspan="2" style="text-align: right;"><input type="submit" style="font-size: 34px;" id="find" value="게시물 등록" ></td>
	</tr>
</table>
</form>
</div>  
</body>
</html>