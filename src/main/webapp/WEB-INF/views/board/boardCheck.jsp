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
	<form action="boardEdit.do">
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
		<button>삭제</button>
	</form>
</body>
</html>