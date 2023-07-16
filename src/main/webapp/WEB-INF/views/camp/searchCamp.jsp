<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2323fd290c2578022ec9ddc839994259"></script>

<h4>캠핑장 검색</h4>

<div>
	지역명 
	<select id="locationSido" name="locationSido">
		<option value="locationAll">전체</option>
	</select>
	키워드 
	<select id="keyWord" name="keyWord">
		<option value="keywordAll">전체</option>
	</select><br>
	시설명 <input type="text" id="campName" name="campName" width="200px">
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

	$('#map').css('display', 'inline-block');
	$('#mainDiv').css('display', 'inline-block');
	
	let campData;	//ajax로 불러온 모든 캠핑장의 데이터 저장
	let searchCampList = new Set();	//검색된 캠핑장의 데이터를 저장
	let arrSido = new Set();
	let arrKeyword = new Set();
	
//-------------------------------------------------------------------------------------------	

	$.ajax({	// 캠핑장 리스트 불러오기
		type: "get",
		url: "https://api.odcloud.kr/api/15111395/v1/uddi:8c528230-eda4-4d83-855a-bee73605e49f?page=1&perPage=64&serviceKey=ijjFxtQ421IxkCgrbClzoUeKkPef8dZ86r2uQ7mftWOavlMJzJAto4fcAeqS0L2qRNWhva5XsR9FYf5RMD1rlg%3D%3D",
		data: JSON,
		success: function(data){
			campData = data.data;
			campListAll();
		},
		error: function(e){
			console.log(e)
		}
	});



//-------------------------------------------------------------------------------------------		
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
	
	function searchList(){	// 캠핑장 검색
		$('#mainDiv').html("");	// 기존 화면 비우기
		searchCampList = new Set();	// 함수 호출할때마다 리스트 초기화 필요
		
		let getSido = $('#locationSido').val();
		let getKeyword = $('#keyWord').val();
		let getCampName = $('#campName').val();
		
		if (getSido == "locationAll" && getKeyword == "keywordAll" && getCampName == ""){	//전체 검색
			for(let i=0; i<campData.length; i++){
				searchCampList.add(campData[i]);
			}
			SearchListView();
		}
		
		if (getSido != "locationAll" && getKeyword == "keywordAll" && getCampName == ""){	//지역
			for(let i=0; i<campData.length; i++){
				if(campData[i]['시도 명칭'].search(getSido) != -1){
					searchCampList.add(campData[i]);
				}
			}
			SearchListView();
		}
		
		if (getSido == "locationAll" && getKeyword != "keywordAll" && getCampName == ""){	//키워드
			for(let i=0; i<campData.length; i++){
				if(campData[i]['카테고리3'].search(getKeyword) != -1){
					searchCampList.add(campData[i]);
				}
			}
			SearchListView();
		}
		
		if (getSido == "locationAll" && getKeyword == "keywordAll" && getCampName != ""){	//이름

			for(let i=0; i<campData.length; i++){
				if(campData[i]['시설명'].search(getCampName) != -1){
					searchCampList.add(campData[i]);
				}
			}
			SearchListView();
		}
		
		if (getSido != "locationAll" && getKeyword != "keywordAll" && getCampName == ""){	//지역,키워드
			for(let i=0; i<campData.length; i++){
				if(campData[i]['시도 명칭'].search(getSido) != -1 && campData[i]['카테고리3'].search(getKeyword) != -1){
					searchCampList.add(campData[i]);
				}
			}
			SearchListView();
		}
		
		if (getSido != "locationAll" && getKeyword == "keywordAll" && getCampName != ""){	//지역,이름
			for(let i=0; i<campData.length; i++){
				if(campData[i]['시도 명칭'].search(getSido) != -1 && campData[i]['시설명'].search(getCampName) != -1){
					searchCampList.add(campData[i]);
				}
			}
			SearchListView();
		}
		
		if (getSido == "locationAll" && getKeyword != "keywordAll" && getCampName != ""){	//키워드,이름
			for(let i=0; i<campData.length; i++){
				if(campData[i]['카테고리3'].search(getKeyword) != -1 && campData[i]['시설명'].search(getCampName) != -1){
					searchCampList.add(campData[i]);
				}
			}
			SearchListView();
		}

		if (getSido != "locationAll" && getKeyword != "keywordAll" && getCampName != ""){	//지역,키워드,이름
			for(let i=0; i<campData.length; i++){
				if(campData[i]['시도 명칭'].search(getSido) != -1 && campData[i]['카테고리3'].search(getKeyword) != -1 && campData[i]['시설명'].search(getCampName) != -1){
					searchCampList.add(campData[i]);
				}
			}
			SearchListView();
		}
		console.log(campData);
	}
	
	function makeList(){	// 검색된 리스트 생성하기
		for(let item of searchCampList){

			let add = "<div class=\"campInfo\"><div  class=\"campInfoName\"><b>" + item['시설명'] +"</b></div>"
				add += "<table><tr><th>카테고리</th><td>" + item['카테고리3'] + "</td></tr>";
				add += "<tr><th>운영기간</th><td>" + item['봄 운영 여부'] + ", " + item['여름 운영 여부'] + ", " + item['가을 운영 여부'] + ", " + item['겨울 운영 여부'] + "</td></tr>";
				add += "<tr><th>운영일</th><td>" + item['평일 운영 여부'] + ", " + item['주말 운영 여부'] + "</td></tr>";
				add += "<tr><th>위치</th><td>[ " + item['시도 명칭'] + ", " + item['시군구 명칭'] + " ] " + item['도로명주소'] + "</td></tr>";
				add += "<tr><th>시설 특징</th><td>" + item['시설 특징'] + "</td></tr>";
				add += "<tr><th>전화번호</th><td>" + item['전화번호'] + "</td></tr>";
				add += "<tr><th>홈페이지</th><td><a href=\"" + item['홈페이지'] + "\" target=\"_blank\" >" + item['홈페이지']  + "</a></td></tr></table></div>";
				
				$('#mainDiv').append(add)
		}
		$('th').css('width', '100px');
		$('td').css('width', '400px');
		$('.campInfo').css('padding', '10px');
		$('.campInfoName').css('background-color', 'lightgrey');
	}
	
	function SearchListView(){	// 겸색 결과 표시
		if(searchCampList.size < 1){
			let add = "<p>검색 결과가 없습니다.</p>"
			$('#mainDiv').append(add);
		} else {
			makeList();	// 리스트 생성
			viewMap();	// 맵 생성
		}
	}
	
	function campListAll(){		// 첫 페이지에서 보여줄 모든 캠핑장 목록
		console.log(campData);
		for(let i=0; i<campData.length; i++){
			searchCampList.add(campData[i]);
		}
		makeList();	// 리스트 생성
		viewMap();	// 맵 생성
	}
	

	// 메인 검색을 이용해서 접근
	let getMain = '${getMain}';
	if (getMain == 'getMain'){
		let paramSido = '${locationSido}';
		let paramKeyword = '${keyWord}';
		let paramCampName = '${campName}';
		
		$('#locationSido').val("강원도").attr('selected', 'selected');
		console.log($("#locationSido").val());
		
	}

	
//-------------------------------------------------------------------------------------------



function viewMap(){	// 화면에 지도 표시
	// 지도의 중심 좌표
	let avrLat = 0;
	let avrLot = 0;
	let totalCamp = 0;
	
	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	var positions = [];
	
	// 지도에 표시될 정보
	for (let item of searchCampList){
		let name = item['시설명'];
		let lat = Number(item['위도']);
		let lon = Number(item['경도']);
		let obj = {
			content: '<div>' + name + '</div>', 
			latlng: new kakao.maps.LatLng(lat, lon)
		}
		totalCamp ++;
		avrLat += lat;
		avrLot += lon;
		positions.push(obj);
	}
	
	// 중심좌표가 될 평균값
	avrLat = avrLat/totalCamp;
	avrLot = avrLot/totalCamp;

	// 다음 지도 API
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(avrLat, avrLot), // 지도의 중심좌표
	        level: 13 // 지도의 확대 레벨 (기본:4, 전국:13)
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
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

}

</script>