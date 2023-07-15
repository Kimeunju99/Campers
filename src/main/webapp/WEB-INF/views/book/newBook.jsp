<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.7.0.min.js"></script>
</head>
<body>
<h1>예약하기</h1>
<form id="bookForm">
	<table>
		<tr>
			<th>업체명</th>
			<td><input type="text" name="manager" id="manager" value="${campOwner}" readonly></td>
			<th>주소</th>
			<td><input type="text" name="addr" id="addr" value="${campAddr}" readonly></td>
		</tr>
		<tr>
			<th>방번호</th>
			<td><input type="text" name="manager" id="manager" value="${RoomId}" readonly></td>
			<th>인원</th>
			<td><input type="text" name="manager" id="manager" value="${campPersonnel}" readonly></td>
		</tr>
		<tr>
			<th>일시</th>
			<td>
				<input type="date" class="date" name="startDate" id="startDate" readonly>
				
			</td>
			<td colspan="2">
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
				<button type="submit" id="bookBtn">예약</button>
				<button type="button" id="backBtn">뒤로가기</button>
			</td>
		</tr>
	</table>
</form>

<script>
let cost = document.getElementById("cost");
document.getElementById("backBtn").addEventListener('click', function(e){
	location.href = document.referrer;
});//뒤로가기

document.getElementById("bookBtn").addEventListener('click', function(e){
	if(cost.value != null){
		$.ajax({
			url: "newBookControl.do",
			method: 'post',
			data: $('form[name="bookForm"]').serialize(),
			success: function(result){
				alert(result);
				location.href = "/campers/main.do";
			},
			error: function(err){	console.log(err);	}	
		});//ajax
	}else{
		alert('예약 정보를 다 채우지 않았습니다.');
	}
});//예약버튼

//let firstday = "";
//let lastday ="";
document.quarySelectorAll(".date").addEventListener('change', function(e){
	let weekday = 0, weekend = 0, night = 0; //평일, 주말 , n박
	/*
	for(let i=firstday; i<=lastday; i++){
		night++; // n박
		if(i가 주말이면){ //주말
			weekend++;
		}else{ //평일
			weekday++;
		}
	}
	*/
	
	cost.value = ""; // (${campWeekday} * weekday) + (${campWeekend} * weekend) ;
}//날짜 변동에 따른 가격 동적 변화

//Calender 몸체
calHTML(startDate);
calHTML(endDate);
function calHTML(id){
	let html = `
		 <div><table class="Calendar">
	     	<thead><tr>
	        	<td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
	            <td colspan="5">
	            	<span id="calYear"></span>년
	                <span id="calMonth"></span>월
	            </td>
	            <td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
	        </tr>
	        <tr>
	            <td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td>
	        </tr></thead>
	    	<tbody></tbody>
	    </table></div>
	`;
	id.append(html);
}

let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
let today = new Date();     // 페이지를 로드한 날짜를 저장
today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화

//Calendar 작업
function drowCal(){
    let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
    let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날
    let tbody_Calendar = document.querySelector(".Calendar > tbody");
    document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
    document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신

    while (tbody_Calendar.rows.length > 0) {                        // 이전 출력결과가 남아있는 경우 초기화
        tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
    }

    let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가           

    for (let j = 0; j < firstDate.getDay(); j++) {  // 이번달 1일의 요일만큼
        let nowColumn = nowRow.insertCell();        // 열 추가
    }

    for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  
        let nowColumn = nowRow.insertCell();        // 새 열을 추가하고

        let newDIV = document.createElement("p");
        newDIV.innerHTML = leftPad(nowDay.getDate());        // 추가한 열에 날짜 입력
        nowColumn.appendChild(newDIV);

        if (nowDay.getDay() == 6) {                 // 토요일인 경우
            nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
        }

        if (nowDay < today) {                       // 지난날인 경우
            newDIV.className = "pastDay";
        }
        else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우           
            newDIV.className = "today";
            newDIV.onclick = function () { choiceDate(this); }
        }
        else {                                      // 미래인 경우
            newDIV.className = "futureDay";
            newDIV.onclick = function () { choiceDate(this); }
        }
    }
}

// 날짜 선택
function choiceDate(newDIV) {
    if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
        document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
    }
    newDIV.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class 추가
}


function prevCalendar() {
    nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
    drowCal();    // 달력 다시 생성
}// 이전달 버튼 클릭

function nextCalendar() {
    nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
    drowCal();    // 달력 다시 생성
}// 다음달 버튼 클릭

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