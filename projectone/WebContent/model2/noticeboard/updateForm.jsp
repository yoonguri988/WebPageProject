<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
/WebContent/model1/board/updateForm.jsp
1. num 값의 게시물을 db에서 조회하여 화면 출력하기 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap&subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
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
		border: none;
		font-size: 24px; 
		width: 10%;
	}
	td{
		font-size: 15px; 
		word-break:break-all;
		border: none;
	}
	#td_con{
		border: 5px solid rgb(192,165,154);
		background-color: rgb(231,228,211);
	}
	button{
		font-size: 48px;
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
		border: hidden;
	}
	#in {
 		display: inline-block;
 	 	text-align:center;
 	}
</style>
</head>
<body>
<div id="in" style="margin: auto; width: 100%; padding-top:64px; ">
<input type="hidden" name="boardtype" value="1">
<form action="update.do?boardnum=${b.boardnum }&boardtype=${b.boardtype}&boardcategory=${boardcategory}" method="post" enctype="multipart/form-data" name="f">
<input type="hidden" name="boardnum" value="${b.boardnum}" >
<input type="hidden" name="boardtype" value="${b.boardtype}" >
<input type="hidden" name="boardcategory" value="${b.boardcategory}" >
<table border ="1" >
	<tr><td><h1 style="font-size: 76px;">글 수정</h1></td></tr>
	<tr>
		<th style="font-size: 50px;" >작성자</th>
		<td><input style="width: 100%; font-size: 32px;" type="text" name="id" value="${b.id}" disabled="disabled"></td>
	</tr>
	<tr>
		<th style="font-size: 50px;" >제목</th>
		<td><input style="width: 100%; font-size: 32px;" type="text" name="title" value="${b.title}"></td>
	</tr>
	<tr>
		<th style="font-size: 50px;" >내용</th>
		<td><textarea style="width: 100%; font-size: 32px;" class="inputdb" rows="10" name="content" id="content1">${b.content}</textarea></td>
	</tr>
	<tr>
		<td colspan="2">
		<button onclick = "javascript:document.f.submit()">수정</button>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>
