<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세 보기</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
th {
	font-size: 48px;
}

td {
	border: 5px solid rgb(192, 165, 154);
	background-color: rgb(231, 228, 211);
}

#td_none {
	font-size: 25px;
	background-color: rgb(192, 165, 154);
}

#td_con {
	font-size: 32px;
	border: 5px solid rgb(192, 165, 154);
	background-color: rgb(231, 228, 211);
	word-break: break-all;
}

#find {
	font-size: 48px;
	background-color: rgb(231, 228, 211);
	border: none;
}

table {
	border-collapse: collapse;
}

table, th, tr {
	border: none;
	word-break: break-all;
}

#in {
	display: inline-block;
}
</style>
</head>
<body>
	<div id="in" style="margin: 0 auto; padding-top: 64px; width: 100%;">
		<input type="hidden" name="filename" value="${b.file1 }">
			<table border="1">
				<tr>
					<th style="text-align: left; font-size: 80px;"><h1 style="font-size: 80px;">정보</h1></th>
				</tr>
				<tr>
					<td id="td_con" rowspan="4"><img height="930" width="600"
						src="${path }/model2/imageboard/file/${b.file1}"></td>
				</tr>
				<tr>
					<th width="18%">작성자</th>
					<td id="td_con" width="82%"
						style="text-align: left; height: 100px; width: 100%;">${nick }(${b.id})</td>
				</tr>
				<tr>
					<th>제목</th>
					<td id="td_con" style="text-align: left; height: 100px;">${b.title}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td id="td_con" style="vertical-align: top; text-align: left">
						${b.content}</td>
				</tr>
				<tr>
					<th>&nbsp;</th>
				</tr>
				<tr>
					<th colspan="2">&nbsp;</th>
					<td align="left" id="td_none">
							<form action="fileDown.do" name="sf" method="POST">
								<span style="float: left;">
								<input type="hidden" name="filename" value="${b.file1 }">
								<input type="submit" id="find" value="다운로드">
								</span> 
							</form>
						<c:if test="${sessionScope.login=='admin'||sessionScope.login==b.id }">
		<form name="f" action="delete.do" method="post">
			<input type="hidden" name="boardtype" value="${b.boardtype }">
			<input type="hidden" name="boardnum" value="${b.boardnum }">
			<input type="hidden" name="boardcategory" value="${b.boardcategory }">
			<span style="float: right;"> 
			<input type="button" id="find" value="수정" onclick="location.href='updateForm.do?boardtype=${b.boardtype}&boardnum=${b.boardnum }&boardcategory=${b.boardcategory }'">&nbsp;&nbsp;
			<input type="button" id="find" value="삭제" onclick="delete_chk()">
								<script>
									function delete_chk() {
										if (confirm('정말로 삭제하시겠습니까?')) {
											document.f.submit();
										} else {
											return;
										}
									}
								</script> <%-- 		<c:if test="${empty b.file1 }">
			&nbsp;
		</c:if>
		<c:if test="${!empty b.file1 }">
			<a href="file/${b.file1 }">${b.file1 }</a>
		</c:if> --%>
							</span>
							</form>
						</c:if>
					</td>
				</tr>
			</table>


	</div>
</body>
</html>