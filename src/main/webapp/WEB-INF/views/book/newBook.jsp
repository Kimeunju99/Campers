<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="css/newBook.css"/>
</head>
<body>
<div id="container">
	<h1>예약하기</h1>	
	<form id="bookForm" name="bookForm">
	<input type="hidden" name="campId" id="campId" value="${camp.campId}" readonly>
		<table>
			<tr>
				<th>업체명</th>
				<td><input type="text" name="manager" id="manager" value="${camp.campOwner}" readonly></td>
				<th>주소</th>
				<td><input type="text" name="addr" id="addr" value="${camp.campAddr}" readonly></td>
			</tr>
			<tr>
				<th>방번호</th>
				<td><input type="text" name="roomId" id="roomId" value="${room.roomId}" readonly></td>
				<th>인원</th>
				<td><input type="text" name="personnel" id="personnel" value="${room.roomPersonnel}" readonly></td>
			</tr>
			<tr>
				<th>일시</th>
				<td>
					<div><table class="Calendar">
		     			<thead><tr>
				        	<td class="prev" style="cursor:pointer;">&#60;</td>
				            <td colspan="5">
				            	<span class="calYear" id="calYear"></span>년
		                		<span class="calMonth" id="calMonth"></span>월
				            </td>
				            <td class="next"  style="cursor:pointer;">&#62;</td>
				        </tr>
				        <tr>
				            <td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td>
				        </tr></thead>
				    	<tbody></tbody>
				    </table></div>
				    <input type="date" class="date" name="startDate" id="startDate" readonly>
				</td>
				<th>~</th>
				<td>
					<div><table class="Calendar">
				     	<thead><tr>
				        	<td class="prev" style="cursor:pointer;">&#60;</td>
				            <td colspan="5">
				            	<span class="calYear" id="calYear"></span>년
		                		<span class="calMonth" id="calMonth"></span>월
				            </td>
				            <td class="next" style="cursor:pointer;">&#62;</td>
				        </tr>
				        <tr>
				            <td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td>
				        </tr></thead>
				    	<tbody></tbody>
				    </table></div>
				    <input type="date" class="date" name="endDate" id="endDate" readonly>
				</td>
			</tr>
			<tr>
				<th>가격</th><td><input type="text" name="cost" id="cost" readonly></td>
				<th>예약자</th>
				<td><input type="text" name="client" id="client" value="${logUser.userId}" readonly></td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<button type="button" id="bookBtn">예약</button>
					<button type="button" id="backBtn" onclick="history.back()">뒤로가기</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<script>
document.getElementById("backBtn").addEventListener('click', function(e){
	location.href = document.referrer;
});//뒤로가기

let cost = $("#cost");
document.getElementById("bookBtn").addEventListener('click', function(e){
	if( $('#startDate').val() > $('#endDate').val()){
		alert('마지막날은 첫날보다 이후의 날이어야 합니다.');
	}else{	
		if(cost.val() != ""){
			$.ajax({
				url: "newBookControl.do",
				method: 'post',
				data: $('form[name="bookForm"]').serialize(),
				success: function(result){
					if(result =="true"){
						alert("예약이 완료되었습니다. 예약 확인은 마이페이지에서 가능합니다.");
						location.href = "/campers/main.do";
					}else{
						alert("예약에 실패했습니다.")
						document.getElementById("bookForm").reset();
					}
				},
				error: function(err){	console.log(err);	}	
			});//ajax
		}else{
			alert('예약 정보를 다 채우지 않았습니다.');
		}
	}
});//예약버튼

let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
let today = new Date();     // 페이지를 로드한 날짜를 저장
today.setHours(0, 0, 0, 0);    // today의 시간을 초기화

document.querySelectorAll(".Calendar").forEach(function(item){
	item.addEventListener('DOMContentLoaded', drowCal(item));
});
//Calendar 작업
function drowCal(item){ //item: "table.Calendar"
	let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
    let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날
    let tbody_Calendar = $(item).find("tbody");
    $(item).find(".calYear").text(nowMonth.getFullYear()); // 연도 갱신
    $(item).find(".calMonth").text(leftPad(nowMonth.getMonth() + 1)); // 월 갱신
   	if(tbody_Calendar.innerHTML != "") { // 이전 출력결과가 남아있는 경우 초기화
        tbody_Calendar.text("");
    }

    let nowRow = tbody_Calendar.append('<tr/>'); // 첫번째 행 추가           
    for (let j = 0; j < firstDate.getDay(); j++) {
        let td = $('<td/>')
    	let nowColumn = nowRow.append(td);
    }// 이번달 1일의 요일만큼 열 추가

    for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {
		let newDIV = $('<p/>').text(leftPad(nowDay.getDate())); //날짜 입력
        let nowColumn = nowRow.append($('<td/>').append(newDIV)); // 새 열을 추가
        if (nowDay.getDay() == 6) { // 토요일인 경우 새로운 행 추가
            nowRow = tbody_Calendar.append('<tr/>');
        }

        if (nowDay < today) { // 오늘 이전
            newDIV.className = "pastDay";
        }
        else if (nowDay.getFullYear() == today.getFullYear() && 
        		nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘           
            newDIV.className = "today";
            newDIV.on('click', function () { 
            	dateSet(newDIV);
            });
        }
        else { // 오늘 이후
            newDIV.className = "futureDay";
            newDIV.on('click', function () { 
            	choiceDate(this);
            	dateSet(newDIV);
            });
        }
    }
}//drowCal

function dateSet(pTag){
	let td = pTag.parent().parent().parent().parent().parent();
	let selDate = td.find(".calYear").text() + "-" + td.find(".calMonth").text() + "-" + pTag.text();
	td.find($(".date")).val(selDate); //input 태그에 선택 날짜 저장
	
	let first = new Date($("#startDate").val());
	let last =  new Date($("#endDate").val());
	let weekday = 0, weekend = 0 //평일, 주말	

	for(let i=first; i<last; i.setDate(i.getDate() + 1)){
		console.log(i);
		if(i.getDay() == 0 || i.getDay() == 6){ //주말
			weekend++;
		}else{ //평일
			weekday++;
		}
	}
	if(first != "" && last != "")//startdate와 enddate가 null이 아님
		cost.val(((${room.roomWeekday} * weekday) + (${room.roomWeekend} * weekend)));
	
};

function choiceDate(newDIV) {
    if (document.getElementsByClassName("choiceDay")[0]) {
        document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");
    }// 기존에 선택한 날짜가 있으면 해당 날짜의 "choiceDay" class 제거
    newDIV.classList.add("choiceDay"); // 선택된 날짜에 "choiceDay" class 추가
}// 날짜 선택


// 다음달 버튼 클릭
document.querySelectorAll('.next').forEach(function(item){
	item.addEventListener('click', nextCalendar);
});
function nextCalendar() {
    nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
    drowCal(this.parentElement.parentElement.parentElement);    // 달력 다시 생성
}

// 이전달 버튼 클릭
document.querySelectorAll('.prev').forEach(function(item){
	item.addEventListener('click', prevCalendar);
});
function prevCalendar() {
    nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
    drowCal(this.parentElement.parentElement.parentElement);    // 달력 다시 생성
}

// input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
function leftPad(value) {
    if (value < 10) {
        value = "0" + value;
        return value;
    }
    return value;
}
</script>
</body>
</html>