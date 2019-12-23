<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	/WebContent/model1/member/id.jsp
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id 찾기</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript">
	function idsend(id){
		opener.document.f.id.value=id;
		self.close();
	}
</script>
</head>
<body>
<div style=" vertical-align: middle;">
<table style="width: 100%; text-align: center;">
	<tr>
	<td style="width: 20%; font-size: 25px;">아이디</td>
	<td style="width: 20%; font-size: 25px;">${id}**</td>
	</tr>
	<tr>
	<td colspan="2">
	<input type="button" value="아이디 전송"  
			style="width: 100%; font-size: 25px;
			   border: hidden; background-color: rgb(231,228,211);"
	onclick="idsend('${id}')">
	</td>
	</tr>
</table>
</div>
</body>
</html>
