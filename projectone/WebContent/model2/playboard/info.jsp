<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보</title>
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
	}
	#td_con{
		border: 5px solid rgb(192,165,154);
		background-color: rgb(231,228,211);
	}
	#button{
		font-size: 42px;
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
		border: none;
	}
	#in {
 		display: inline-block;
 	 	text-align:center;
 	}
</style>
</head>
<body >
<div id="in" style="margin: auto; width: 100%; padding-top:64px; ">
<form name="f" action="delete.do"> 
<input type="hidden" name="listnum" value="${pl.listnum }">
<table border ="1" >
	<tr >
	<th style="border: hidden;">
	<h1 style="font-size: 80px;">정보</h1>
	</th>
	</tr>
	<tr>
		<th width="20%" style="font-size: 40px;">번호</th>
		<td id="td_con" width="80%" style="text-align: center; font-size: 48px;">${pl.listnum}</td>
	</tr>
	<tr>
		<th style="font-size: 40px;">리스트 내용</th>
		<td id="td_con" style="text-align: center;">
					${pl.youtubeurl}
		</td>
	</tr>
	<tr>
		<th>&nbsp;</th>
	</tr>
	<c:if test="${sessionScope.login=='admin'}">
	<tr style="border: hidden;"> 
		<td colspan="2">
			<input type="button" id="button" value="수정" onclick="location.href ='updateForm.do?listnum=${pl.listnum }'">
			<input type="button" id="button" value="삭제" onclick="delete_chk()">
		</td>
		<script>
			function delete_chk(){
				 if(confirm('정말로 삭제하시겠습니까?')){
					 document.f.submit();
				 }else{
					return;	 
				 }
			}
		</script>
	</tr>
	</c:if>
</table>
</form>
</div>
</body>
</html>