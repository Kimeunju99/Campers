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
<h3>캠핑장 등록 상세화면</h3>
<form name="myfrm" action="" method="post">
		<input type="hidden" name="cname" value="${cid.campName}">
		<table class="table">
			<tbody>
				<tr>
					<td>캠핑장 이름</td>
					<td><input type="text" name="campName" value="${cid.campName }"></td>
				</tr>
				<tr>
					<td>캠핑장 주소</td>
					<td><input type="text" name="campAddr" value="${cid.campAddr }"></td>
				</tr>
				<tr>
					<td>캠핑장 위치</td>
					<td><input type="text" name="campLocation" value="${cid.campLocation }"></td>
				</tr>
				<tr>
					<td>이미지</td>
					<td><input type="file" name="campImg" value="${cid.campImage}"></td>
				</tr>
				<tr>
					<td>방 갯수</td>
					<td><input type="text" name="campRoomcnt" value="${cid.campRoomcnt}"></td>
				</tr>
				<tr>
					<td>방 번호</td>
					<td><input type="text" name="roomId" value="${rid.roomId}"></td>
				</tr>
				<tr>
					<td>방 이름</td>
					<td><input type="text" name="roomName" value="${rid.roomName}"></td>
				</tr>
				<tr>
					<td>평일 가격</td>
					<td><input type="text" name="roomWeekday" value="${rid.roomWeekday}"></td>
				</tr>
				<tr>
					<td>주말 가격</td>
					<td><input type="text" name="roomWeekend" value="${rid.roomWeekend}"></td>
				</tr>
				<tr>
					<td>수용 인원</td>
					<td><input type="text" name="roomPresonnel" value="${rid.roomPresonnel}"></td>
				</tr>
			</tbody>
		</table>
			<button class="btn btn-primary" type="button" onclick="submit1(this.form);">수정</button>
	</form>
</body>

<script>
	function submit1(frm) {
		frm.action = "CampModifyControl.do";
		frm.submit();
		return true;
	}
/*
	function submit2(frm) {
		frm.action = "CampDeleteControl.do?  =   " + ;
		frm.submit();
		return true;
	}
	*/
</script>

</html>