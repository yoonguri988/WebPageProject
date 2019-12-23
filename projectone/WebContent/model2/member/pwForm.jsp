<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style type="text/css">
	body{
		font-family: 'Nanum Pen Script', cursive;
	}
</style>
</head>
<body>
<div style="width: 100%; margin:0 auto;">
<form action="pw.do" name="f" method="post">
	<table style="width: 100%; text-align: center;">
	<caption style="font-size: 30px;">비밀번호 찾기</caption>
		<tr>
		<td style="width: 20%; font-size: 25px;">아이디</td>
		<td><input type="text" name="id"
		style="width: 100%; font-size: 25px;"></td>
		</tr>
		<tr>
		<td style="width: 20%; font-size: 25px;">이름</td>
		<td><input type="text" name="name"
		style="width: 100%; font-size: 25px;"></td>
		</tr>
		<tr>
		<td style="width: 20%; font-size: 25px;">전화번호</td>
		<td><input type="text" name="tel"
		style="width: 100%; font-size: 25px;"></td>
		</tr>
		<tr>
		<td colspan="2"><input type="submit" value="비밀번호 찾기"
		style="width: 100%; font-size: 25px;
			   border: hidden; background-color: rgb(231,228,211);"></td>
		</tr>
	</table>
</form>
</div>
</body>
</html>