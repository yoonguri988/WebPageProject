<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ ����</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap" rel="stylesheet">

</head>
<script type="text/javascript">
function inchk(f){
	if(f.chgpass.value!=f.chgpass2.value){
		alert("���� ��й�ȣ �� ���� ��й�ȣ ���Է��� �ٸ��ϴ�.");
		f.chgpass2.value="";
		f.chgpass2.focus();
		return false;
	}
	return true;
}
</script> 
<body>
<form action="password.do" method="post" name="f" onsubmit="return inchk(this)" >
	<table style="width: 100%; text-align: center;">
	<caption style="font-size: 30px;">��й�ȣ ����</caption>
	<tr>
	<td style="width: 40%; font-size: 25px;">���� ��й�ȣ</td>
	<td><input type="password" name="pass" 
	style="width: 100%; font-size: 25px;"></td>
	</tr>
	<tr>
	<td style="width: 40%; font-size: 25px;">���� ��й�ȣ</td>
	<td><input type="password" name="chgpass"
	style="width: 100%; font-size: 25px;"></td>
	</tr>
	<tr>
	<td style="width: 40%; font-size: 25px;">���� ��й�ȣ ���Է�</td>
	<td><input type="password" name="chgpass2"
	style="width: 100%; font-size: 25px;"></td>
	</tr>
	<tr>
	<td colspan="2"><input type="submit" value="��� ��ȣ ����"
	style="width: 100%; font-size: 25px;
			   border: hidden; background-color: rgb(231,228,211);"></td>
	</tr>
</table>
</form>
</body>
</html>