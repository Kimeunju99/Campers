<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="css/addCamp.css"/>
<title>Insert title here</title>
</head>
<body>
<div id="addCampDiv">
<h2>캠핑장 등록 화면</h2>
<form name="addCampForm">
	<input type = "hidden" id="cowner" name = "cowner" value = "${id}">
	<table>
		<thead>
			<tr>
				<th colspan="5">캠핑장 이름</th>
				<td colspan="5"><input type="text" name="cname" id="cname"></td>
				</tr>
			<tr>
				<th colspan="5">이미지</th>
				<td colspan="5"><input type="file" name="img" id="img"></td>
			</tr>
			<tr>
				<th colspan="5">방 갯수</th>
				<td colspan="5"><input type="number" name="ccnt" id="ccnt"></td>
			</tr>
			<tr>
				<th colspan="5">캠핑장 주소</th>
				<td colspan="5"><input type="text" name="caddr" id="caddr"></td>
			</tr>
			
			<tr>
				<th colspan="5">캠핑장 정보 및 소개글</th>
				<td colspan="5"><input type="text" name="cinfo" id="cinfo"></td>
			</tr>
		</thead>
		
		<tbody id="tbody"></tbody>
	</table>
	
	<input type="button" id="sub" value = "등록" >
	<input type="reset" value = "초기화">
	<input type="button" value="취소" onclick="history.back()">
</form>
</div>

<script>
document.getElementById("sub").addEventListener('click', function(e){
	if( (( $('#cname').val() || $('#ccnt').val() ||
			$('#caddr').val() || $('#cinfo').val() ) == "") || $('#img').val() == null){
		alert("빈칸을 모두 채워주세요.");
	}else{//널이 아니면 실행
		var form = $('form[name="addCampForm"]')[0];
		var formData = new FormData(form);
		//formData.append("objList", objList);
		console.log(formData);
		$.ajax({
			url: "addCamp.do",
			method: 'post',
			data: formData,
			processData: false,
            contentType: false,
            enctype:'multipart/form-data',
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
	$('#tbody').html("");
	let cnt = document.getElementById("ccnt").value;
 	for(let i=0;i<cnt;i++){
 		let tr = $('<tr/>').html(
 				'<th >방 번호</th><td ><input class="rno" type="text" name="roomNo'+i+'"></td>'+
				'<th >방 이름</th><td ><input class="rname" type="text" name="roomName'+i+'"></td>'+
				'<th >평일 가격</th><td ><input class="rday" type="text" name="roomWeekday'+i+'"></td>'+
				'<th >주말 가격</th><td ><input class="rday" type="text" name="roomWeekend'+i+'"></td>'+
				'<th >수용 인원</th><td ><input class="rcnt" type="text" name="roomPersonnel'+i+'"></td>'
 		);
		$('#tbody').append(tr);
 	}
});//방 정보 입력 칸 출력
</script>
</body>
</html>