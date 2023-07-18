<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="table table-hover table-responsive mb-0">
	<thead>
		<tr>
			<th scope="row">글번호</th>
			<th class="th-lg"><a>제목</a></th>
			<th class="th-lg">작성자</th>
			<th class="th-lg">작성일</th>
			<th class="th-lg">조회수</th>
		</tr>
	</thead>
	<tbody id="boardTbody">
		<c:forEach var="vo" items="${boardList}">
		<tr>
			<td><c:out value="${vo.brdId}" /></td>
			<td><a
				href="/campers/boardInfo.do?bid=${vo.brdId}"
				style="text-decoration: none; color: black;"> <c:out
						value="${vo.brdTitle}" /></a></td>
			<td><c:out value="${vo.userName}" /></td>
			<td><c:out value="${vo.brdDate}" /></td>
			<td><c:out value="${vo.brdRead}" /></td>
		</tr>
		</c:forEach>
	</tbody>
	<!--Table body-->
	</table>
</body>
</html>