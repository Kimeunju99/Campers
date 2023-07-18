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
	<h3>${cid.campName}</h3>
		<input type="hidden" name="campId" value="${cid.campId }">
		<table class="table">
			<thead>
				<tr>
					<td colspan="10"><img src="images/${cid.campImage}"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="9">${cid.campAddr}</td>
				</tr>
				<tr>
					<th>상세정보</th>
					<td colspan="7">${cid.campInfo}</td>
					<th>방 갯수</th>
					<td>${cid.campRoomcnt}</td>
				</tr>
			</thead>
			<tbody id="tbody">
			<!-- foreach 룸 반복 -->
				<tr>
					<th>방 번호</th>
					<td>${rid.roomId}</td>
					<th>수용 인원</th>
					<td>${rid.roomPresonnel}</td>
					<th>방 이름</th>
					<td>${rid.roomName}</td>
					<th>평일 가격</th>
					<td>${rid.roomWeekday}</td>
					<th>주말 가격</th>
					<td>${rid.roomWeekend}</td>
				</tr>
			</tbody>
		</table>
		<div style="border: 2px solid #91C3CE; width: 140px; border-radius: 30px; color: #008481; display: inline-block; margin: 0 5px;  float: left;">
			<button type="button" id="likeBtn">좋아요&nbsp;
			<i class="fa-solid fa-heart fa-beat fa-xs" style="color: #f00054;"></i></button>
			<span class="likeCount"></span>
		</div>
		<c:if test="${cid.campOwner != logUser.userId }">
			<button onclick="location.href='/campers/newBook.do?cid=${cid.campId }'">예약</button>
		</c:if>
		<c:if test="${cid.campOwner == logUser.userId }">
			<button class="btn btn-primary" type="button" onclick="submit1(this.form);">수정</button>
		</c:if>
</div>

</body>

<script>
	
</script>
</html>