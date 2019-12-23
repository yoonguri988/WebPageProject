<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%-- 
/WebContent/model2/member/loginForm.jsp 
--%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="EUC-KR">
<title>로그인 화면</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
	function win_open(page){
		var op = "width=500, height=300, left=50, top=150";
		open(page+".do","",op);
	}
	function input_chk(){
		f= document.f;
		if(f.id.value==""||f.pass.value==""){
			alert("아이디 및 비밀번호를 입력하세요");
			f.id.focus();
			return;
		}
		f.submit();
	}
	
</script> 
<style type="text/css">  
	td, th {
	}
	#login{
		font-size: 32px;
		width: 100px;
		background-color: rgb(231,228,211);
		border: none;
	}
	#find{
		font-size: 32px;
		background-color: rgb(231,228,211);
		border: none;
	}
	.inputdb{
		width: 300px;
		font-size: 32px;
		
	}
	caption{    
		font-size: 55px; 
	} 
	table{   
		width:600px; 
	}
	#in {
 display: inline-block;
 }
</style>   
</head>  
<body>    
<div id="in" style="margin: auto; color:black; padding-top:256px;">
	<form action="login.do" method="post" name="f" style="text-align: center;"  >
		<table border="1" style="border-collapse: collapse;  border-bottom: 3px solid rgb(155,112,104); border-left: hidden; border-right: hidden; border-top: 5px solid rgb(155,112,104);" > 
		<caption >LOGIN</caption>
			<tr style=" border-bottom: 2px dashed grey;">
				<td style="width:100%; font-size: 32px; background-color: rgb(231,228,211);">아이디</td>
				<td style=" border-left: 2px dashed grey;">
				<input class="inputdb" type="text" id="id" name="id" placeholder="아이디를 입력하세요" >
				</td>
				<td rowspan="2" style="border-left: 2px dashed grey; background-color: rgb(231,228,211);" >
				<input type="button" id="login" style="font-size: 32px;" value="로그인" onclick="input_chk()">
				</td>
			</tr> 
			<tr>
				<td style="font-size: 32px; background-color: rgb(231,228,211);" >비밀번호</td>
				<td style="border-left: 2px dashed grey; width: 120%;">
				<input class="inputdb" type="password" name="pass" placeholder="비밀번호를 입력하세요">
				</td>
			</tr>
		</table>
		<br>
				<input id="find" type="button" value="아이디 찾기" onclick="win_open('idForm')">
				&nbsp; &nbsp; &nbsp; &nbsp;
				<input id="find" style="" type="button" value="비밀번호 찾기" onclick="win_open('pwForm')">
	</form>
	</div>
</body>
</html>