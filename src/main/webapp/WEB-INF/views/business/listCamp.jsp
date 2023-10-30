<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/listCamp.css"/>
</head>
<body>
	<div id="container">
		<div>
			<h3>예약 가능 캠핑장 현황</h3><hr>
		</div>
		<c:forEach items="${list }" var="l">
			<div id="camp-list-all-div" onclick="location.href='/campers/campInfoFormControl.do?cid=${l.campId}'">
				<div class="img-div">
					<img src="images/${l.campImage }" width="200px">
				</div>
				
				<table>
					<tr>
						<th>캠핑장 이름</th><td colspan="3">${l.campName }</td>
					</tr>
					<tr>
						<th>캠핑장 특징</th><td colspan="3">${l.campInfo }</td>
					</tr>
					<tr>
						<th>주소</th><td colspan="3">${l.campAddr }</td>
					</tr>
					<tr>
						<th>방 개수</th><td>${l.campRoomcnt }</td><th>좋아요</th><td>${l.campLike }</td>
					</tr>
				</table><br>
			</div>
		</c:forEach>
	</div>
</body>
</html>