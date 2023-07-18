<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>campList</title>
</head>
<body>
<div>
	<div>
		<h1>내 캠핑장 목록</h1>
	</div>
	<div>
		<table>
			<thead>
				<tr>
					<th>이미지</th>
					<th>캠핑장 이름</th>
					<th>주소</th>
					<th>방 개수</th>
					<th>찜 개수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${campList }" var="list">
					<tr onclick="location.href='/campers/campInfoFormControl.do?cid=${list.campId}'">
						<td><img src="images/${list.campImage }" width="200px"></td>
						<td>${list.campName }</td>
						<td>${list.campAddr }</td>
						<td>${list.campRoomcnt }</td>
						<td>${list.campLike }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>