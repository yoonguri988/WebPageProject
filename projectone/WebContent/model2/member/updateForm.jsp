<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
/WebContent/model2/member/updateForm.jsp  
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap&subset=korean" rel="stylesheet">
<style type="text/css">  
	th {
		border-right: 2px dashed grey;
		font-size: 42px; 
	}
	#find{
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
		font-size: 55px; 
	}
	table{   
		width : 450px;
		height: 300px;
		border-collapse: collapse;  
		border-bottom: 3px solid rgb(155,112,104); 
		border-left: hidden; border-right: hidden; 
		border-top: 5px solid rgb(155,112,104);
	}
	#in {
 		display: inline-block;
 	}
</style>
<script>
	function win_passchg(){
		var op = "width=500, height=300, left=50, top=150";
		open("passwordForm.do","",op);
	}
	function inputcheck(){ 
		<c:if test="${sessionScope.login!='admin'}">
		//로그인정보가 admin이 아닐때 실행
		if(f.pass.value==""){
			alert("비밀번호를 입력하세요")
			f.pass.focus();
			return false;
		}
		</c:if>
	}
</script>
</head>
<body style="color: black;">
<div id="in" style="margin: auto; padding-top: 128px; ">
<form action="update.do" name="f" method="post" style="text-align: center" onsubmit="return inputcheck()">
<table border="1">
			<tr>
				<th>아이디</th>
				<td><input style="width: 90%; font-size: 32px;" type="text" name="id" value="${info.id}" readonly></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input style="width: 90%; font-size: 32px;" type="password" name="pass"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input style="width: 90%; font-size: 32px;" type="text" name="name" value="${info.name }"></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input style="width: 90%; font-size: 32px;" type="text" name="nick" value="${info.nick }"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input style="width: 90%; font-size: 32px;" type="text" name="tel" value="${info.tel }"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input id="find" type="submit" value="회원수정">
				<input id="find" type="button" value="비밀번호 수정" onclick="win_passchg()">
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>