<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	function checkinput(f){
		self.close();
		return false;
	}
</script>
<form name="f" action="loginForm.do" onsubmit="return checkinput(this)">
<table style="width: 100%; text-align: center;">
<tr>
	<td style="width: 30%; font-size: 25px;">��й�ȣ�� ����Ǿ����ϴ�</td>
</tr>
<tr>
	<td><input type="submit" value="�ݱ�"
	style="width: 100%; font-size: 25px;
			   border: hidden; background-color: rgb(231,228,211);
		">
</tr>
</table>
</form>
</body>
</html>