<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="board/boardEdit" name="myFrm" method="post">
		<h3>상세 게시판</h3>
		<h2 align="left">제목: ${brd.brdTitle}</h2>
		<table border="1" width="400">
			<tbody>
				<tr width="450" height="50" align="left">
					<td>작성자: ${brd.brdWriter}</td>
				</tr>
				<tr width="450" height="450" align="left">
					<td>${brd.brdContent}</td>
				</tr>
			</tbody>
		</table>
		<br>
		<button type="submit">수정</button>
		<button type="button">삭제</button>
	</form>
	<script>
		document.querySelector('form[name=myFrm] button[type]').addEventListener('click', function(e){
			document.forms[0].action = "boardDelete.do";
			document.forms[0].submit();
		});
	</script>
</body>
</html>