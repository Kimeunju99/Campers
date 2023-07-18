<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/38655e7b9d.js" crossorigin="anonymous"></script>
<script src="js/jquery-3.7.0.min.js"></script>
</head>
<body>
<div id="container">
	<h3>${cid.campName}</h3>
		<input type="hidden" name="campId" value="${cid.campId }">
		<table class="table">
			<thead>
				<tr>
					<td colspan="11"><img src="images/${cid.campImage}"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="10">${cid.campAddr}</td>
				</tr>
				<tr>
					<th>상세정보</th>
					<td colspan="7">${cid.campInfo}</td>
					<th>방 갯수</th>
					<td>${cid.campRoomcnt}</td>
					<th>예약</th>
				</tr>
			</thead>
			<tbody id="tbody">
			<!-- foreach 룸 반복 -->
				<c:forEach items="${rid }" var="rid">
				<tr>
					<th>방 번호</th>
					<td>${rid.roomId}</td>
					<th>수용 인원</th>
					<td>${rid.roomPersonnel}</td>
					<th>방 이름</th>
					<td>${rid.roomName}</td>
					<th>평일 가격</th>
					<td>${rid.roomWeekday}</td>
					<th>주말 가격</th>
					<td>${rid.roomWeekend}</td>
					<c:if test="${logUser.userAuth != 'business' }">
					<td>
						<button onclick="location.href='/campers/newBook.do?cid=${cid.campId }&rid=${rid.roomId }'">예약</button>
					</td>
					</c:if>
					<c:if test="${logUser.userAuth == 'business' }">
					<td>
						<p>비고</p>
					</td>
					</c:if>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<button type="button" id="likeBtn">좋아요&nbsp;
			<i class="fa-solid fa-heart fa-beat fa-xs" style="color: #f00054;"></i>
			<span class="likeCount"></span>
			</button>
		</div>
		<c:if test="${cid.campOwner == logUser.userId }">
			<button type="button" id="modBtn" onclick="location.href='/campers/campModify.do?cid=${cid.campId }'">수정</button>
		</c:if>
		<button type="button" onclick="history.back()">뒤로가기</button>
		
</div>
</body>

<script>
$('#likeBtn').on("click",function() {
	$.ajax({
		url: "campLike.do",
		method: "POST",
		data: {
			campId: ${cid.campId}
		},
		success: function(result) {
			if(result =="true"){
				recCount();						
			}else{
				alert('로그인 후 사용하세요.');
			}
		},
		
	})
})

function recCount() {
	$.ajax({
		url: "campLikeCount.do",
		type: "POST",
		data: {	campId: ${cid.campId} },
		success: function(count) {
			$(".likeCount").text(count);
		},
	});
};

recCount();
</script>
</html>