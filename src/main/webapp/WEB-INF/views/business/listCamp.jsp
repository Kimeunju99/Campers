<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<div>
			<h1>예약 가능 캠핑장 현황</h1>
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
				<tbody id="tbody">
					<c:forEach items="${list }" var="l">
						<tr onclick="location.href='/campers/campInfoFormControl.do?cid=${l.campId}'">
							<td><img src="images/${l.campImage }" width="200px"></td>
							<td>${l.campName }</td>
							<td>${l.campAddr }</td>
							<td>${l.campRoomcnt }</td>
							<td>${l.campLike }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>