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
		border: hidden; 
		
	}
	#in {
 	display: inline-block;

 	}
 	.inputdb{
 		width: 100%;
 	} 
 	.img{ 
 		font-family: 'East Sea Dokdo', cursive;
 		float: right;
	    background-image: url("/projectone/imgs/combackground.jpg");                                                               
    	background-size: contain;
 	} 
	th { 
		border: hidden;
		font-size: 53px; 
		width: 10%;
	}
	td{
		font-size: 15px; 
		word-break:break-all;
	}
	#td_con{
		font-size: 32px;
		border: 8px solid rgb(192,165,154);
		background-color: rgb(231,228,211);
	}
	#button{
		font-size: 32px;
		background-color: rgb(231,228,211);
		border: hidden;
	}
	#comment_button{
		font-size: 32px;
		background-color: rgb(231,228,211);
		border: hidden;
		float: right;
	}
	.long{
		width: 333px;
		border: hidden;
	}
	.inputdb{
		width: 240px;
		border: hidden;
	} 
	caption{  
		text-align: left;  
		font-size: 30px; 
		border: hidden;
	}
	table{   
		width : 100%;
		border-collapse: collapse;  
		border: hidden;
	}
	#in {
 		display: inline-block;
 	 	text-align:center;
 	}
 		#pagebutton{
		font-size: 18px;
		border-radius: 12px;
		background-color: rgb(231,228,211);
		border: hidden;
	}
</style>
</head>
<body >
<div id="in" style="margin: auto; width: 100%; padding-top:64px; ">
<form name="f" action="delete.do">
<input type="hidden" name="boardtype" value="${b.boardtype }">
<input type="hidden" name="boardnum" value="${b.boardnum }">
<input type="hidden" name="boardcategory" value="${b.boardcategory }">
<table border ="1" >
	<tr >
	<th style="border: hidden;">
	<h1 style="font-size:80px; ">정보</h1>
	</th>
	</tr>
	<tr>
		<th width="20%">작성자</th>
		<td id="td_con" width="80%" style="text-align: left">${nick }(${b.id })</td>
	</tr>
	<tr>
		<th>제목</th>
		<td id="td_con" style="text-align: left">${b.title}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td id="td_con">
			<table style="width:100%; height:250px;">
				<tr>
					<td id="td_con" style="border-width: 0px; vertical-align: top; text-align: left">
					${b.content}
					</td>
				</tr>
			</table>
		</td>
	</tr>
		<c:if test="${empty b.file1 }">
		</c:if>
		<c:if test="${!empty b.file1 }">
	<tr>
		<th>첨부파일</th>
		<td><a href="file/${b.file1 }">${b.file1 }</a></td>
	</tr>
		</c:if>
	<tr>
		<th>&nbsp;</th>
	</tr>
	<tr style="border: hidden;"> 
		<td colspan="2">
		<c:if test="${sessionScope.login=='admin'||sessionScope.login != b.id}">
		<input type="button" id="button" value="신고하기" onclick="location.href ='${path }/model2/warnboard/writeForm.do?boardnum=${b.boardnum}&id=${b.id }&memnum=${memnum }'">
		</c:if>
		<c:if test="${sessionScope.login=='admin'||sessionScope.login == b.id}">
			<input type="button" id="button" value="수정" onclick="location.href ='updateForm.do?boardtype=${b.boardtype }&boardnum=${b.boardnum }&boardcategory=${b.boardcategory }'">
			<input type="button" id="button" value="삭제" onclick="delete_chk()">
		</c:if>
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
	<tr>
		
	</tr>
</table>
</form>
</div>
<%-- 
/WebCotent/model2/board/commentwrite.jsp 

--%>
	<script type="text/javascript">
		function inputcheck(){
			f= document.f;
			if(f.comment.value==""){
				alert("내용을 입력하세요");
				f.content.focus();
				return false; 
			} 
			return true;
		}
		function tag(id){
			document.sf.content.value="@"+id+"  ";
			return false;
		}		
	</script> 
		<div id="in" style="margin: auto; width: 100%; padding-top: 64px; padding-left: 64px;">
		<form action="commentwrite.do" method="post"  name="sf" onsubmit="return inputcheck()">
		<h1 style="text-align: left; font-size: 64px;">댓글</h1>
		<input type="hidden" name="boardnum" value="${b.boardnum }">
		<input type="hidden" name="boardtype" value="${b.boardtype }">
		<input type="hidden" name="boardcategory" value="${b.boardcategory }">
		<input type="hidden" name="id" value="${sessionScope.login}">
		<table border="1" style="border:hidden;">
			<tr style="border:hidden;">
			<td  style="font-size: 32px; width: 15%; 
			border-right: hidden;
			border-bottom: px soild rgb(155,112,104);
			border-radius: 100in;
			background-color: rgb(231,228,211);
			" >
			${sessionScope.login}
			</td> 
			<td  style="width: 95%; font-size: 20px; " >
			<textarea class="inputdb"  style="width: 85%; font-size: 32px;" 
			name="content" placeholder="내용을 입력하세요" ></textarea>
			<input style="width: 50px;"  type="submit" id="button" value="등록" >
			</td>
			</tr>
		</table>
		</form>
		</div>  
		<div id="in" style="margin: auto; width: 100%; padding-top: 64px; padding-left: 64px;">
	<table border="1" id="secondtable">
	<c:if test="${ccount==0 }">
	<tr style="border: hidden;"><td colspan="3"><h1>댓글이 없습니다.</h1></td></tr>
	</c:if>
	<c:if test="${ccount>0}">
	<c:forEach var="b" items="${list}" varStatus="status">    
	<tr style="border: hidden;"><td style="border: hidden;" >&nbsp;</td></tr>
	<tr style="border: hidden;"> 
		<td style="
		font-size: 32px;  width: 16%;
		"> 
		${nicklist[status.index] }<br>
		(<a href="javascript:tag('${idlist[status.index]}')" >${idlist[status.index]}</a>)
		</td>
		<td style="font-size: 32px;
				   background-color: rgb(231,228,211);
				   border: 5px solid rgb(192,165,154);
				   text-align: left;
				   border-left: hidden;
		">
			${b.content} 

		<c:if test="${sessionScope.login != idlist[status.index]}">
		<input type="button" id="comment_button" value="신고하기" onclick="location.href ='${path }/model2/warnboard/writeForm.do?boardnum=${b.boardnum}&id=${idlist[status.index]}&memnum=${memnum }'">
		</c:if>
		<c:if test="${sessionScope.login=='admin'}">
			<input type="button" id="comment_button" value="삭제" onclick="location.href ='commentdelete.do?commentnum?=${b.commentnum}'">
		</c:if>
		</td>
	</tr>
	<%-- </c:forEach> --%>
	</c:forEach>
	</c:if>
</table>
		</div>  
	</body>
</html>