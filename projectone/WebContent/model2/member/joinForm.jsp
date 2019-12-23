<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- 
/WebContent/model2/member/joinForm.jsp 
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript">
	function checkValue(){
		f= document.f;
		if(f.id.value==""){
			alert("아이디를 입력하세요");
			f.id.focus();
			return false;
		}
		if(f.pass.value==""){
			alert("비밀번호를 입력하세요");
			f.pass.focus();
			return false;
		}
		if(f.name.value==""){
			alert("이름을 입력하세요");
			f.name.focus();
			return false;
		}
		if(f.nick.value==""){
			alert("닉네임을 입력하세요");
			f.nick.focus();
			return false;
		}
		if(f.tel.value==""){
			alert("전화번호를 입력하세요");
			f.tel.focus();
			return false;
		}
		if(f.answer.value==""){
			alert("질문에 답하세요");
			f.answer.focus();
			return false;
		}
		if(f.answer.value!='${a}'){
			alert("답이 틀렸습니다!");
			f.answer.value="";
			return false;
		}
		if(f.answer.value=='${a}'){
			f.chk.value=1;
		}
		
	}
</script>
<style type="text/css">  
	td, th {
	}
	th {
		border-right: 2px dashed grey;
	}
	#find{
		font-size: 20px;
		background-color: rgb(231,228,211);
		border: none;
	}
	.long{
		width: 100%;
		font-size: x-large;
	}
	.inputdb{
		width: 240px;
	} 
	caption{    
		font-size: 55px; 
	}
	table{   
		width : 640px;
		height: 300px;
	}
	#in {
 display: inline-block;
 }
</style> 
</head>
<body style="color: black;">
<div id="in" style="margin: auto; padding-top: 100px; ">
<form action="join.do" name="f" method="post" style="text-align: center" onsubmit="return checkValue()">
<input type="hidden" name="chk" value="0">
	<table border="1" style="border-collapse: collapse;  border-bottom: 3px solid rgb(155,112,104); border-left: hidden; border-right: hidden; border-top: 5px solid rgb(155,112,104);">
	<caption><h1 style="">회원 가입</h1></caption>
		<tr>
			<th style="font-size: 42px;">아이디</th>
			<td ><input class="long" type="text" name="id"></td>
			<!-- <td style="border-left: hidden;">
			<button id="find" onclick="openIdChk()">중복확인</button> 
			<input type="hidden" name="idDuplication" value="idUncheck" >
			</td>
			-->
		</tr>
		<tr>
			<th style="font-size: 42px;">비밀번호</th>
			<td ><input class="long" type="password" name="pass"></td>
		</tr>
		<tr>
			<th style="font-size:  42px;">이름</th>
			<td ><input class="long" type="text" name="name"></td>
		</tr>
		<tr>
			<th style="font-size:  42px;">닉네임</th>
			<td ><input class="long" type="text" name=nick></td>
			<!-- <td style="border-left: hidden;">
			<button id="find"  onclick="openIdChk()">중복확인</button>
			</td>
			 -->
		</tr>
		<tr>
			<th style="font-size:  42px;">전화번호</th>
			<td ><input class="long" type="text" name="tel"></td>
		</tr>
		<tr>
			<th rowspan="2" style="font-size:  42px;">질문</th>
			<td style="border-bottom: hidden; font-size: 28px;">Q : ${q }<br>(${fn:length(a)}글자)</td>
		</tr>
		<tr>
			<td><input class="long" type="text" name="answer" placeholder="공백및특수기호는제외하고입력하세요"></td>
		</tr>
	</table>
	<br> 
	<input style="font-size: 28px;  background-color: rgb(231,228,211);
		border: none;" type="submit" value="회원가입" >
	
</form>
</div>
</body>
</html>