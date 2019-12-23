<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

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
	#in {
 	display: inline-block;

 	}
 	.img{ 
 		font-family: 'East Sea Dokdo', cursive;
 		float: right;
	    background-image: url("/projectone/imgs/combackground.jpg");                                                               
    	background-size: contain;
 	} 
	th {
		font-size: 48px;
	}
	td{
		font-size: 32px; 
		word-break:break-all;
	}
	#td_con{
		border: 5px solid rgb(192,165,154);
		background-color: rgb(231,228,211);
		 word-break:break-all;
	}
	#button{
		font-size: 48px;
		float: right;
		background-color: rgb(231,228,211);
		border: none;
	}
	table{   
		width: 100%;
		border-collapse: collapse;  
		
	}
	table, th, tr{
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
<input type="hidden" name="boardtype" value="${b.boardtype }" >
<input type="hidden" name="boardcategory" value="${b.boardcategory }" >
<table border ="1" >
	<tr ><td colspan="3" style="text-align: left;"><h1 style="font-size: 80px;">글 수정</h1></td></tr> 
	<tr>  
		<td rowspan="4" style="width: 40%; height: "><img height="930" width="600" src="${path }/model2/imageboard/file/${b.file1}"></td>
		<th width="12%">작성자</th>
		<td><input style="width: 100%;" type="text" name="nick" value="${nick}" disabled="disabled"></td>
	</tr>
	<tr> 
		<th>제목</th>
		<td><input style="width: 100%;" name="title" value="${b.title}"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td ><textarea style="width: 100%; size: auto;"  rows="10" name="content" id="content1">${b.content}</textarea></td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td style="text-align: left">
		<input type="file" name="file1" value="${b.file1 }">
	    </td>
	</tr>
	<tr> 
		<td colspan="3">
		<input id="button" type="submit" value="수정">
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>
