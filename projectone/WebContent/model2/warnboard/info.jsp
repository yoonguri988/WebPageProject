<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
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
		font-size: 50px; 
		width: 10%;
	}
	td{
		font-size: 32px; 
		word-break:break-all;
	}
	#td_con{
		border: 5px solid rgb(192,165,154);
		background-color: rgb(231,228,211);
	}
	#button{
		font-size: 32px;
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
<input type="hidden" name="warnnum" value="${param.warnnum }">
<table border ="1" >
	<tr >
	<th style="border: hidden;">
	<h1 style="font-size:80px; ">정보</h1>
	</th>
	</tr>
	<tr>
		<th width="20%">작성자</th>
		<td id="td_con" width="80%" style="text-align: left">${nick}(${id })</td>
	</tr>
	<tr>
		<th>제목</th>
		<td id="td_con" style="text-align: left">${w.title}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td id="td_con">
			<table style="width:100%; height:250px;">
				<tr>
					<td  style="border-width: 0px; vertical-align: top; text-align: left">
					${w.content}
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr style="border: hidden;"> 
		<td colspan="2" style="font-size: 32px;">
		<c:if test="${sessionScope.login=='admin'}">
			<input type="button" id="button" value="완료" onclick="location.href='state.do?warnnum=${param.warnnum }'">
		</c:if>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>