<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	/WebContent/model2/member/idForm.jsp
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
</head>
<style type="text/css">
	body{
		font-family: 'Nanum Pen Script', cursive;
	}
	table{
	}
	caption{
		font-size: 34px;
	}
</style>
<body>
<div style="width: 100%; margin:0 auto;">
<form action="id.do" method="post" name="f" >
<table style="width: 100%; text-align: center;">
	<caption style="font-size: 30px;">아이디 찾기</caption>
	<tr>
		<td style="width: 20%; font-size: 25px;">이름</td>
		<td><input type="text" name="name" 
		style="width: 100%; font-size: 25px;" ></td>
	</tr>
	<tr>
		<td style="width: 20%; font-size: 25px;">전화번호</td>
		<td><input type="text" name="tel" 
		style="width: 100%; font-size: 25px;"></td>
	</tr>
	<tr>
		<td colspan="2">
		<input type="submit" value="아이디 찾기" 
		style="width: 100%; font-size: 25px;
			   border: hidden; background-color: rgb(231,228,211);
		">
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>