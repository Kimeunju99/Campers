<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<th width="200">방 번호</th>
						<th width="200">방 이름</th>
						<th width="200">평일 가격</th>
						<th width="200">주말 가격</th>
						<th width="200">수용 인원</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="l">
						<tr>
							<td align="center"><a href="CampInfoFormControl.do?name=${l.campName}&rid=${l.roomId}">${l.campName }</a></td>
							<td>${l.campAddr }</td>
							<td align="center">${l.campLocation }</td>
							<td align="center">${l.campImg }</td>
							<td align="center">${l.campRoomcnt }</td>
							<td align="center">${l.roomId }</td>
							<td align="center">${l.roomName }</td>
							<td align="center">${l.roomWeekday }</td>
							<td align="center">${l.roomWeekend }</td>
							<td align="center">${l.roomPersonnel }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
</body>
</html>