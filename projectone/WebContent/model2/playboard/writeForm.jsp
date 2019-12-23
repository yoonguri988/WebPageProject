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
		if(f.youtubeurl.value==""){
			alert("유튜브 소스코드를 입력하세요");
			f.youtubeurl.focus();
			return false; 
		} 
	}
</script> 
</head>
<body>
<div id="in" style="margin: auto; width: 100%; padding-top: 64px;">
<form action="write.do" method="post" name="f" onsubmit="return inputcheck()">
<h1>음악목록 글쓰기</h1>
<input type="hidden" name="id" value="${sessionScope.login }">
<table border="1" style="border:hidden;  width: 100%; collapse; ">
	<tr>
	<td>
	<textarea class="inputdb" rows="10" name="youtubeurl" id="youtubeurl1" placeholder="유튜브 소스코드를 입력하세요" ></textarea>
	</td>
	<tr >
	<td colspan="2" style="text-align: right;"><input type="submit" id="find" value="게시물 등록" ></td>
	</tr>
</table>
</form>
</div>  
</body>
</html>