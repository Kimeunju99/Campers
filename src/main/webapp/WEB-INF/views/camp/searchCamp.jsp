<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2323fd290c2578022ec9ddc839994259"></script>

<h4>캠핑장 검색</h4>

<div>
	지역명 
	<select id="locationSido">
		<option value="locationAll">전체</option>
	</select>
	키워드 
	<select id="keyWord">
		<option value="keywordAll">전체</option>
	</select><br>
	시설명 <input type="text" id="campName" width="200px">
	<input type="button" value="검색" onclick="searchList()">
</div>

<!-- 지도 -->
<div id="map" style="width:600px; height:800px;">

</div>

<!-- 조회목록 -->
<div id="mainDiv" style="overflow:scroll; width:500px; height:800px;">

</div>

<script>
//-------------------------------------------------------------------------------------------

	campListAll();
	let campData;
	
	$('#map').css('display', 'inline-block');
	$('#mainDiv').css('display', 'inline-block');
	
	let arrSido = new Set();
	let arrKeyword = new Set();
	let searchCampList = new Set();
	
	$.ajax({		// select의 option 생성
		type: "get",
		url: "https://api.odcloud.kr/api/15111395/v1/uddi:8c528230-eda4-4d83-855a-bee73605e49f?page=1&perPage=64&serviceKey=ijjFxtQ421IxkCgrbClzoUeKkPef8dZ86r2uQ7mftWOavlMJzJAto4fcAeqS0L2qRNWhva5XsR9FYf5RMD1rlg%3D%3D",
		data: JSON,
		success: function(data) {
			for(let i=0; i<data.data.length; i++){	//select가 되는 값 중복되지 않게 넣기
				arrSido.add(data.data[i]['시도 명칭']);
				
				let str = data.data[i]['카테고리3'];
				let arry = str.split(',');
				for(let j=0; j<arry.length; j++){
					arrKeyword.add(arry[j]);
				}
			}
			for(let item of arrSido){
				let sidoList = "<option value=\"" + item + "\">" + item + "</option>"
				$('#locationSido').append(sidoList)
			}
			for(let item of arrKeyword){
				let keywordList = "<option value=\"" + item + "\">" + item + "</option>"
				$('#keyWord').append(keywordList)
			}
		},
		error: function(e){
			console.log(e)
		}
	})
//-------------------------------------------------------------------------------------------
	
	function searchList(){
		$('#mainDiv').html("");	// 기존 화면 비우기
		searchCampList = new Set();	// 함수 호출할때마다 리스트 초기화 필요
		
		let getSido = $('#locationSido').val();
		let getKeyword = $('#keyWord').val();
		let getCampName = $('#campName').val();
		
		if (getSido == "locationAll" && getKeyword == "keywordAll" && getCampName == ""){	//전체 검색
			campListAll()
		}
		if (getSido != "locationAll" && getKeyword == "keywordAll" && getCampName == ""){	//지역
			for(let i=0; i<campData.length; i++){
				if(campData[i]['시도 명칭'].search(getSido) != -1){
					searchCampList.add(campData[i]);
				}
			}
			//화면에 리스트 생성
			makeList();
		}
		
		if (getSido == "locationAll" && getKeyword != "keywordAll" && getCampName == ""){	//키워드
			for(let i=0; i<campData.length; i++){
				if(campData[i]['카테고리3'].search(getKeyword) != -1){
					searchCampList.add(campData[i]);
				}
			}
			//화면에 리스트 생성
			makeList();
		}
		
		if (getSido == "locationAll" && getKeyword == "keywordAll" && getCampName != ""){	//이름
			for(let i=0; i<campData.length; i++){
				if(campData[i]['시설명'].search(getCampName) != -1){
					searchCampList.add(campData[i]);
				}
			}
			//화면에 리스트 생성
			makeList();
		}
		
		if (getSido != "locationAll" && getKeyword != "keywordAll" && getCampName != ""){	//지역,키워드
			for(let i=0; i<campData.length; i++){
				if(campData[i]['시도 명칭'].search(getSido) != -1 && campData[i]['카테고리3'].search(getKeyword) != -1){
					searchCampList.add(campData[i]);
				}
			}
			//화면에 리스트 생성
			makeList();
		}
		
		if (getSido != "locationAll" && getKeyword != "keywordAll" && getCampName != ""){	//지역,이름
			for(let i=0; i<campData.length; i++){
				if(campData[i]['시도 명칭'].search(getSido) != -1 && campData[i]['시설명'].search(getCampName) != -1){
					searchCampList.add(campData[i]);
				}
			}
			//화면에 리스트 생성
			makeList();
		}
		
		if (getSido != "locationAll" && getKeyword != "keywordAll" && getCampName != ""){	//키워드,이름
			for(let i=0; i<campData.length; i++){
				if(campData[i]['카테고리3'].search(getKeyword) != -1 && campData[i]['시설명'].search(getCampName) != -1){
					searchCampList.add(campData[i]);
				}
			}
			//화면에 리스트 생성
			makeList();
		}

		if (getSido != "locationAll" && getKeyword == "keywordAll" && getCampName == ""){	//지역,키워드,이름
			for(let i=0; i<campData.length; i++){
				
			}
			//화면에 리스트 생성
			makeList();
		}

	}
	
	function makeList(){
		for(let item of searchCampList){

			let add = "<div><b>" + item['시설명'] +"</b>"
				add += "<table><tr><th>카테고리</th><td>" + item['카테고리3'] + "</td></tr>";
				add += "<tr><th>운영기간</th><td>" + item['봄 운영 여부'] + ", " + item['여름 운영 여부'] + ", " + item['가을 운영 여부'] + ", " + item['겨울 운영 여부'] + "</td></tr>";
				add += "<tr><th>운영일</th><td>" + item['평일 운영 여부'] + ", " + item['주말 운영 여부'] + "</td></tr>";
				add += "<tr><th>위치</th><td>[ " + item['시도 명칭'] + ", " + item['시군구 명칭'] + " ] " + item['도로명주소'] + "</td></tr>";
				add += "<tr><th>시설 특징</th><td>" + item['시설 특징'] + "</td></tr>";
				add += "<tr><th>전화번호</th><td>" + item['전화번호'] + "</td></tr>";
				add += "<tr><th>홈페이지</th><td><a href=\"" + item['홈페이지'] + "\" target=\"_blank\" >" + item['홈페이지']  + "</a></td></tr></table></div>";
				
				$('#mainDiv').append(add)
		}
	}

	function campListAll(){	//모든 캠핑장 조회
		$.ajax({
			type: "get",
			url: "https://api.odcloud.kr/api/15111395/v1/uddi:8c528230-eda4-4d83-855a-bee73605e49f?page=1&perPage=64&serviceKey=ijjFxtQ421IxkCgrbClzoUeKkPef8dZ86r2uQ7mftWOavlMJzJAto4fcAeqS0L2qRNWhva5XsR9FYf5RMD1rlg%3D%3D",
			data: JSON,
			success: function(data){
				campData = data.data;
				console.log(campData);
				for(let i=0; i<data.data.length; i++){
					//console.log(data.data[i].시설명)
					let add = "<div><b>" + data.data[i].시설명 +"</b>"
					add += "<table><tr><th>카테고리</th><td>" + data.data[i].카테고리3 + "</td></tr>";
					add += "<tr><th>운영기간</th><td>" + data.data[i]['봄 운영 여부'] + ", " + data.data[i]['여름 운영 여부'] + ", " + data.data[i]['가을 운영 여부'] + ", " + data.data[i]['겨울 운영 여부'] + "</td></tr>";
					add += "<tr><th>운영일</th><td>" + data.data[i]['평일 운영 여부'] + ", " + data.data[i]['주말 운영 여부'] + "</td></tr>";
					add += "<tr><th>위치</th><td>[ " + data.data[i]['시도 명칭'] + ", " + data.data[i]['시군구 명칭'] + " ] " + data.data[i]['도로명주소'] + "</td></tr>";
					add += "<tr><th>시설 특징</th><td>" + data.data[i]['시설 특징'] + "</td></tr>";
					add += "<tr><th>전화번호</th><td>" + data.data[i]['전화번호'] + "</td></tr>";
					add += "<tr><th>홈페이지</th><td><a href=\"" + data.data[i]['홈페이지'] + "\" target=\"_blank\" >" + data.data[i]['홈페이지']  + "</a></td></tr></table></div>";
					
					$('#mainDiv').append(add)
				}			
				
				$('th').css('width', '120px');
				$('td').css('width', '500px');
			},
			error: function(e){
				console.log(e)
			}
		});
	}
	
//-------------------------------------------------------------------------------------------
// 다음 지도 API
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
    {
        content: '<div>카카오</div>', 
        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
    },
    {
        content: '<div>생태연못</div>', 
        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
    },
    {
        content: '<div>텃밭</div>', 
        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
    },
    {
        content: '<div>근린공원</div>',
        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
    }
];

for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}

/* 아래와 같이도 할 수 있습니다 */
/*
for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });

    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    (function(marker, infowindow) {
        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
        kakao.maps.event.addListener(marker, 'mouseover', function() {
            infowindow.open(map, marker);
        });

        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
        kakao.maps.event.addListener(marker, 'mouseout', function() {
            infowindow.close();
        });
    })(marker, infowindow);
}
*/

</script>