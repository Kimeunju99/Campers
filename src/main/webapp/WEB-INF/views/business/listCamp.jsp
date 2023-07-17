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
	<div align="center">
		<div>
			<h1>내 캠핑장 현황</h1>
		</div>
		<div>
			<table border="1">
				<thead>
					<tr>
						<th width="200">캠핑장 이름</th>
						<th width="200">주소</th>
						<th width="200">위치</th>
						<th width="200">이미지</th>
						<th width="200">방 갯수</th>
					</tr>
				</thead>
				<tbody>
						<c:forEach items="${list }" var="l">
							<tr>
								<td align="center"><a href="campInfoFormControl.do?cid=${l.campId}">${l.campName }</a></td>
								<td>${l.campAddr }</td>
								<td align="center">${l.campLocation }</td>
								<td align="center">${l.campImage }</td>
								<td align="center">${l.campRoomcnt }</td>
							</tr>
						</c:forEach>
				</tbody>
			</table>
		</div>
</body>
</html>