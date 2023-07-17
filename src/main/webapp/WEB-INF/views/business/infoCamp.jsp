<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>캠핑장 등록 상세화면</h3>
<form name="myfrm" action="" method="post">
		<input type="hidden" name="cname" value="${camp.campName}">
		<table class="table">
			<tbody>
				<tr>
					<td>캠핑장 이름</td>
					<td><input type="text" name="campName" value="${camp.campName }"></td>
				</tr>
				<tr>
					<td>캠핑장 주소</td>
					<td><input type="text" name="campAddr" value="${camp.campAddr }"></td>
				</tr>
				<tr>
					<td>캠핑장 위치</td>
					<td><input type="text" name="campLocation" value="${camp.campLocation }"></td>
				</tr>
				<tr>
					<td>이미지</td>
					<td><input type="file" name="campImg" value="${camp.campImg}"></td>
				</tr>
				<tr>
					<td>방 갯수</td>
					<td><input type="text" name="campRoomcnt" value="${camp.campRoomcnt}"></td>
				</tr>
				<tr>
					<td>방 번호</td>
					<td><input type="text" name="roomId" value="${room.roomId}"></td>
				</tr>
				<tr>
					<td>방 이름</td>
					<td><input type="text" name="roomName" value="${room.roomName}"></td>
				</tr>
				<tr>
					<td>평일 가격</td>
					<td><input type="text" name="roomWeekday" value="${room.roomWeekday}"></td>
				</tr>
				<tr>
					<td>주말 가격</td>
					<td><input type="text" name="roomWeekend" value="${room.roomWeekend}"></td>
				</tr>
				<tr>
					<td>수용 인원</td>
					<td><input type="text" name="roomPresonnel" value="${room.roomPresonnel}"></td>
				</tr>
			</tbody>
		</table>
			<button onclick="location.href='/campers/newBook.do?cid=${camp.campId }'">예약</button>
			<button class="btn btn-primary" type="button" onclick="submit1(this.form);">수정</button>
			<button class="btn btn-warning" type="button" onclick="submit2(this.form);">삭제</button>
	</form>
</body>

<script>
	function submit1(frm) {
		frm.action = "CampModifyControl.do";
		frm.submit();
		return true;
	}

	function submit2(frm) {
		frm.action = "CampDeleteControl.do?  =   " + '${}';
		frm.submit();
		return true;
	}
</script>

</html>