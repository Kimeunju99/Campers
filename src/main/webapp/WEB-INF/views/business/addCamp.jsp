<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery-3.7.0.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div>
<h2>캠핑장 등록 화면.</h2>
<form name="addCampForm">
	<input type = "hidden" id="cowner" name = "cowner" value = "${id}">
	
	<table border = "1" class = "table">
		<thead>
			<tr>
				<th>캠핑장 이름</th>
				<td colspan="3"><input type = "text" name="cname" id="cname"></td>
				<th>이미지</th>
				<td  colspan="3"><input type = "file" name="img" id="img"></td>
				<th>방 갯수</th>
				<td><input type = "text" name="ccnt" id="ccnt"></td>
			</tr>
			<tr>
				<th>캠핑장 주소</th>
				<td colspan="9"><input type = "text" name="caddr" id="caddr"></td>
			</tr>
			<tr>
				<th>캠핑장 정보</th>
				<td colspan="9"><input type = "text" name="cinfo" id="cinfo"></td>
			</tr>
		</thead>
		<tbody id="tdoby"></tbody>
	</table>
	
	<input type="button" id="sub" value = "등록" >
	<input type="reset" value = "초기화">
	<input type="button" value="취소" onclick="history.back()">
</form>
</div>

<script>
document.getElementById("sub").addEventListener('click', function(e){
	if( ( $('#cname').val() || $('#img').val() || $('#ccnt').val() ||
			$('#caddr').val() || $('#cinfo').val() ) == ""){
		alert("빈칸을 모두 채워주세요.");
	}else{//널이 아니면 실행
		$.ajax({
			url: "addCamp.do",
			method: 'post',
			data: $('form[name="addCampForm"]').serialize(),
			success: function(result){
				if(result =="true"){
					alert("등록이 완료되었습니다. 확인은 마이페이지에서 가능합니다.");
					location.href = "/campers/main.do";
				}else{
					alert("등록에 실패했습니다.")
					document.getElementById("addCampForm").reset();
				}
			},
			error: function(err){	console.log(err);	}	
		});//ajax
	}
});//등록 버튼
	
	
document.getElementById("ccnt").addEventListener('change', function(e){
	$('#tdoby').html("");
	let cnt = document.getElementById("ccnt").value;
 	for(let i=0;i<cnt;i++){
 		let tr = $('<tr/>').html(
 				'<th>방 번호</th><td><input type="text" id="roomCnt'+i+'"></td>'+
				'<th>방 이름</th><td colspan="3"><input type="text" id="roomName'+i+'"></td>'+
				'<th>평일 가격</th><td><input type="text" id="roomWeekday'+i+'"></td>'+
				'<th>주말 가격</th><td><input type="text" id="roomWeekend'+i+'"></td>'+
				'<th>수용 인원</th><td><input type="text" id="roomPersonnel'+i+'"></td>'
 		);
		$('#tdoby').append(tr);
 	}
});
</script>
</body>
</html>