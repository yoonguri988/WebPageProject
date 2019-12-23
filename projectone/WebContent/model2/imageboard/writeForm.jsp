<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
/WebCotent/model2/imgboard/writeForm.jsp 

--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>이미지게시판</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">  
	td {
		border: hidden;
		font-size: 32px;

	}
	#find{
		font-size: 32px;
		background-color: rgb(231,228,211);
		border: none;
		
	}
	h1{    
		font-size: 80px; 
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
		if(f.subject.value==""){
			alert("제목를 입력하세요");
			f.subject.focus();
			return false;
		}
		if(f.content.value==""){
			alert("내용을 입력하세요");
			f.content.focus();
			return false;
		} 
		if(f.file1.value==""){
			alert("파일을 첨부하세요");
			return false;
		} 
	}
</script> 
</head>
<body>
<div id="in" style="margin: auto; width: 100%; padding-top: 64px;">
<form action="write.do" method="post" enctype="multipart/form-data" name="f" onsubmit="return inputcheck()">
<h1>이미지 글쓰기</h1>
<input type="hidden" name="id" value="${sessionScope.login }">
<input type="hidden" name="boardtype" value="2">
<table border="1" style="border:hidden;  width: 100%; collapse; ">
	<tr>
	<td colspan="2" style="font-size: 30px">
	</td>
	</tr>
	<tr>
	<td><input class="inputdb" type="text" name="title" placeholder="제목을 입력하세요" ></td>
	</tr>
	<tr>
	<td>
	<textarea class="inputdb" rows="10" name="content" id="content1" placeholder="내용을 입력하세요" ></textarea>
	</td>
	<tr>
	<td><input type="file" name="file1"></td>
	</tr>
	<tr >
	<td colspan="2" style="text-align: right;">
	<input type="submit" id="find" value="게시물 등록">
	</td>
	</tr>
</table>
</form>
</div>  
</body>
</html>