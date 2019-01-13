<%@
   page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>지도테스트</title>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c36204e30027f76eb155fbd17afedf52&libraries=services,clusterer,drawing"></script>


<style>

/*///////////////////////////////////////////

      카테고리별 장소 검색하기 CSS 시작


///////////////////////////////////////////*/
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

#category {
	position: absolute;
	top: 10px;
	left: 10px;
	border-radius: 5px;
	border: 1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	overflow: hidden;
	z-index: 2;
}

#category li {
	float: left;
	list-style: none;
	width: 50px; px;
	border-right: 1px solid #acacac;
	padding: 6px 0;
	text-align: center;
	cursor: pointer;
}

#category li.on {
	background: #eee;
}

#category li:hover {
	background: #ffe6e6;
	border-left: 1px solid #acacac;
	margin-left: -1px;
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

#category li span {
	display: block;
	margin: 0 auto 3px;
	width: 27px;
	height: 28px;
}

#category li .category_bg {
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png)
		no-repeat;
}

#category li .bank {
	background-position: -10px 0;
}

#category li .mart {
	background-position: -10px -36px;
}

#category li .pharmacy {
	background-position: -10px -72px;
}

#category li .oil {
	background-position: -10px -108px;
}

#category li .cafe {
	background-position: -10px -144px;
}

#category li .store {
	background-position: -10px -180px;
}

#category li.on .category_bg {
	background-position-x: -46px;
}

.placeinfo_wrap {
	position: absolute;
	bottom: 28px;
	left: -150px;
	width: 300px;
}

.placeinfo {
	position: relative;
	width: 100%;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	background: #fff;
}

.placeinfo:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
	content: '';
	position: relative;
	margin-left: -12px;
	left: 50%;
	width: 22px;
	height: 12px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
	color: #fff;
	text-decoration: none;
}

.placeinfo a, .placeinfo span {
	display: block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.placeinfo span {
	margin: 5px 5px 0 5px;
	cursor: default;
	font-size: 13px;
}

.placeinfo .title {
	font-weight: bold;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding: 10px;
	color: #fff;
	background: #d95050;
	background: #d95050
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.placeinfo .tel {
	color: #0f7833;
}

.placeinfo .jibun {
	color: #999;
	font-size: 11px;
	margin-top: 0;
}

/*

      카테고리별 장소 검색하기 CSS 종료


*/
</style>



</head>
<body>
	<c:import url="/WEB-INF/views/common/exFile.jsp" />
	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp" />
		<h1>mapTest</h1>


		<!-- 지도  -->

		<div class="map_wrap">
			<!-- <div id="map" style="width: 1024px; height: 720px;"></div>  -->
			<div id="map"
				style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
			<ul id="category">
				<li id="BK9" data-order="0"><span class="category_bg bank"></span>
					은행</li>
				<li id="MT1" data-order="1"><span class="category_bg mart"></span>
					마트</li>
				<li id="PM9" data-order="2"><span class="category_bg pharmacy"></span>
					약국</li>
				<li id="OL7" data-order="3"><span class="category_bg oil"></span>
					주유소</li>
				<li id="CE7" data-order="4"><span class="category_bg cafe"></span>
					카페</li>
				<li id="CS2" data-order="5"><span class="category_bg store"></span>
					편의점</li>
			</ul>
		</div>



		<p>
			<button onclick="zoomIn()">지도레벨 - 1</button>
			<button onclick="zoomOut()">지도레벨 + 1</button>
			<span id="maplevel"></span>
		</p>

		<p>
			제주도 검색 란 <input type="text" id="search"> <input type="button"
				value="검색" id="btSearth" onclick="jejuSearch();">
		</p>
		<p>
			사용자 마커 글추가 <input type="text" id="userInputText"> <input
				type="button" value="글넣기" id="btUserInputText"
				onclick="personalInputText();">
		</p>

		<form>
			<fieldset>
				<legend>취미 선택하기</legend>
				<table>
					<tr>
						<td><input type="checkbox" name="sort" value="food">
							<label>맛집</label></td>
						<td><input type="checkbox" name="sort" value="hotel">
							<label>숙소</label></td>
						<td><input type="checkbox" name="sort" value="travel">
							<label>관광</label></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="sort" value="spot">
							<label>숨겨진스팟</label></td>
						<td><input type="checkbox" name="sort" value="etc"> <label>기타</label>
						</td>
						<td><input type="checkbox" name="sort" value="personal">
							<label>개인기록</label></td>
					</tr>
				</table>
			</fieldset>
		</form>


		<p>
			<button id=btBack>되돌리기</button>
			<button id=btShow>마커보이기</button>
			<button id=btHide>마커숨기기</button>


			<input type="button" value="저장하기" id="btn-add"
				onclick="transferSave();" /> 
				
				<input type="button" value="불러오기"
				id="btn-load" onclick="transferLoad();" />
		</p>



		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>


</body>



<script>
	// 전송할 기본 네게 //
	var transferLat = []; // 위도
	var transferLng =[]; // 경도
	var transferPersonalInputText=[]; // 사용자 글
	var transferSubject =[] ; // 취미전송
	







	///////////////////////////////////////////
	//                              ///
	//                              ///
	//             기본지도 설정             ///
	//                              ///
	//                              ///
	///////////////////////////////////////////

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(33.383389, 126.574087), // 지도의 중심좌표
		level : 10
	// 지도의 확대 레벨
	};

	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
	var placeOverlay = new daum.maps.CustomOverlay({
		zIndex : 1
	}), contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
	markers = [], markersSearch = [], // 검색 마커를 를 담을 배열입니다
	currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

	// 장소 검색 객체를 생성합니다
	var ps = new daum.maps.services.Places(map);

	///////////////////////////////////////////
	//                                //
	//                               //
	//            사용자 검색                 //
	//                               //
	//                               //
	///////////////////////////////////////////

	function jejuSearch() {
		var searchId = $('#search').val();
		console.log(searchId);

		// 처음시작할시 맵에 있는 마커삭제

		removeMarker();
		removeSearchMarker();
		// 키워드로 장소를 검색합니다 // 기본 설정 앞에 제주도 첨부함
		ps.keywordSearch('제주도' + searchId, placesSearchCB);

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === daum.maps.services.Status.OK) {

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				var bounds = new daum.maps.LatLngBounds();

				for (var i = 0; i < data.length; i++) {
					displayMarker(data[i]);
					bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
				}

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				map.setBounds(bounds);
			}
		}

		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(placeSearch) {

			// 마커를 생성하고 지도에 표시합니다
			var marker = new daum.maps.Marker({
				map : map,
				position : new daum.maps.LatLng(placeSearch.y, placeSearch.x)
			});
			// 매번들어오는 마커를 markers라는 배열에 삽입한다. 
			markersSearch.push(marker);

			// 마커에 클릭이벤트를 등록합니다
			daum.maps.event.addListener(marker, 'click', function() {
				// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				infowindow
						.setContent('<div style="padding:5px;font-size:12px;">'
								+ placeSearch.place_name + '</div>');
				infowindow.open(map, marker);
			});
		}

		// 마커 지워주기 
		function removeSearchMarker() {
			for (var i = 0; i < markersSearch.length; i++) {
				markersSearch[i].setMap(null);
			}
			markersSearch = [];
		}

	}

	///////////////////////////////////////////
	//                              ///
	//                              ///
	//              지도 레벨 관련             ///
	//                              ///
	//                              ///
	///////////////////////////////////////////

	// 지도 레벨을 표시합니다
	displayLevel();

	// 지도 레벨은 지도의 확대 수준을 의미합니다
	// 지도 레벨은 1부터 14레벨이 있으며 숫자가 작을수록 지도 확대 수준이 높습니다
	function zoomIn() {
		// 현재 지도의 레벨을 얻어옵니다
		var level = map.getLevel();

		// 지도를 1레벨 내립니다 (지도가 확대됩니다)
		map.setLevel(level - 1);

		// 지도 레벨을 표시합니다
		displayLevel();
	}

	function zoomOut() {
		// 현재 지도의 레벨을 얻어옵니다
		var level = map.getLevel();

		// 지도를 1레벨 올립니다 (지도가 축소됩니다)
		map.setLevel(level + 1);

		// 지도 레벨을 표시합니다
		displayLevel();
	}

	function displayLevel() {
		var levelEl = document.getElementById('maplevel');
		levelEl.innerHTML = '현재 지도 레벨은 ' + map.getLevel() + ' 레벨 입니다.';
	}

	///////////////////////////////////////////
	//                                //
	//                               //
	//            카테고리별  장소 검색           //
	//                               //
	//                               //
	///////////////////////////////////////////

	// 지도에 idle 이벤트를 등록합니다
	daum.maps.event.addListener(map, 'idle', searchPlaces);

	// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
	contentNode.className = 'placeinfo_wrap';

	// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
	// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 daum.maps.event.preventMap 메소드를 등록합니다 
	addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);
	addEventHandle(contentNode, 'touchstart', daum.maps.event.preventMap);

	// 커스텀 오버레이 컨텐츠를 설정합니다
	placeOverlay.setContent(contentNode);

	// 각 카테고리에 클릭 이벤트를 등록합니다
	addCategoryClickEvent();

	// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
	function addEventHandle(target, type, callback) {
		if (target.addEventListener) {
			target.addEventListener(type, callback);
		} else {
			target.attachEvent('on' + type, callback);
		}
	}

	// 카테고리 검색을 요청하는 함수입니다
	function searchPlaces() {
		if (!currCategory) {
			return;
		}

		// 커스텀 오버레이를 숨깁니다 
		placeOverlay.setMap(null);

		// 지도에 표시되고 있는 마커를 제거합니다
		removeMarker();

		ps.categorySearch(currCategory, placesSearchCB, {
			useMapBounds : true
		});
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
		if (status === daum.maps.services.Status.OK) {

			// 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
			displayPlaces(data);
		} else if (status === daum.maps.services.Status.ZERO_RESULT) {
			// 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

		} else if (status === daum.maps.services.Status.ERROR) {
			// 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요

		}
	}

	// 지도에 마커를 표출하는 함수입니다
	function displayPlaces(places) {

		// 몇번째 카테고리가 선택되어 있는지 얻어옵니다
		// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
		var order = document.getElementById(currCategory).getAttribute(
				'data-order');

		for (var i = 0; i < places.length; i++) {

			// 마커를 생성하고 지도에 표시합니다
			var marker = addMarker(new daum.maps.LatLng(places[i].y,
					places[i].x), order);

			// 마커와 검색결과 항목을 클릭 했을 때
			// 장소정보를 표출하도록 클릭 이벤트를 등록합니다
			(function(marker, place) {
				daum.maps.event.addListener(marker, 'click', function() {
					displayPlaceInfo(place);
				});
			})(marker, places[i]);
		}
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, order) {
		var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		imageSize = new daum.maps.Size(27, 28), // 마커 이미지의 크기
		imgOptions = {
			spriteSize : new daum.maps.Size(72, 208), // 스프라이트 이미지의 크기
			spriteOrigin : new daum.maps.Point(46, (order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			offset : new daum.maps.Point(11, 28)
		// 마커 좌표에 일치시킬 이미지 내에서의 좌표
		}, markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
				imgOptions), marker = new daum.maps.Marker({
			position : position, // 마커의 위치
			image : markerImage
		});

		marker.setMap(map); // 지도 위에 마커를 표출합니다
		markers.push(marker); // 배열에 생성된 마커를 추가합니다

		return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
		markers = [];
	}

	// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
	function displayPlaceInfo(place) {
		var content = '<div class="placeinfo">'
				+ '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">'
				+ place.place_name + '</a>';

		if (place.road_address_name) {
			content += '    <span title="' + place.road_address_name + '">'
					+ place.road_address_name
					+ '</span>'
					+ '  <span class="jibun" title="' + place.address_name + '">(지번 : '
					+ place.address_name + ')</span>';
		} else {
			content += '    <span title="' + place.address_name + '">'
					+ place.address_name + '</span>';
		}

		content += '    <span class="tel">' + place.phone + '</span>'
				+ '</div>' + '<div class="after"></div>';

		contentNode.innerHTML = content;
		placeOverlay.setPosition(new daum.maps.LatLng(place.y, place.x));
		placeOverlay.setMap(map);
	}

	// 각 카테고리에 클릭 이벤트를 등록합니다
	function addCategoryClickEvent() {
		var category = document.getElementById('category'), children = category.children;

		for (var i = 0; i < children.length; i++) {
			children[i].onclick = onClickCategory;
		}
	}

	// 카테고리를 클릭했을 때 호출되는 함수입니다
	function onClickCategory() {
		var id = this.id, className = this.className;

		placeOverlay.setMap(null);

		if (className === 'on') {
			currCategory = '';
			changeCategoryClass();
			removeMarker();
		} else {
			currCategory = id;
			changeCategoryClass(this);
			searchPlaces();
		}
	}

	// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
	function changeCategoryClass(el) {
		var category = document.getElementById('category'), children = category.children, i;

		for (i = 0; i < children.length; i++) {
			children[i].className = '';
		}

		if (el) {
			el.className = 'on';
		}
	}

	///////////////////////////////////////////
	//                                //
	//                               //
	//          사용자 마커 만들기 추가              //
	//                               //
	//                               //
	///////////////////////////////////////////
	// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
	var markersPersonal = [];
//	var positionsPersonal = [];
	
	// 전역변수에 넣어서 클릭시 넣을수있따.
	var latlng;
	var personalMarker;
	// 마커 이미지의 이미지 주소입니다
	var imageSrc1 = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

	daum.maps.event.addListener(map, 'click', function(mouseEvent) {
		// 클릭한 위치에 마커를 표시합니다 
		addPersonalMarker(mouseEvent.latLng);

		// latlang에 위도 경도 넣기 
		latlng = mouseEvent.latLng;
		var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		message += '경도는 ' + latlng.getLng() + ' 입니다';

		transferLat.push(latlng.getLat()); // 위도
		transferLng.push(latlng.getLng()); // 위도

		console.log(message)
		if (markersPersonal.length == 0)
			$('#btBack').prop('disabled', true);
		else
			$('#btBack').prop('disabled', false);
	});

	// 마커를 생성하고 지도위에 표시하는 함수입니다
	function addPersonalMarker(positionPersonal) {

		var imageSize1 = new daum.maps.Size(24, 35);

		// 마커 이미지를 생성합니다    
		var markerImage1 = new daum.maps.MarkerImage(imageSrc1, imageSize1);

		// 마커를 생성합니다
		personalMarker = new daum.maps.Marker({
			map : map,
			position : positionPersonal,
			image : markerImage1
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		personalMarker.setMap(map);
		// 생성된 마커를 배열에 추가합니다
		markersPersonal.push(personalMarker);

	}

	// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
	function setMarkers(map) {
		for (var i = 0; i < markersPersonal.length; i++) {
			markersPersonal[i].setMap(map);
		}
	}



	///////////////////////////////////////////
	//                                //
	//                               //
	//         개인이 만든 마커에 글넣기          //
	//                               //
	//                               //
	///////////////////////////////////////////
		var infowPersonal = [];
	function personalInputText() {

		var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		message += '경도는 ' + latlng.getLng() + ' 입니다';

		console.log(message)
		// 사용자 입력
		var userInputText = document.getElementById('userInputText');

		// 사용자 입력 넣기
		transferPersonalInputText.push(userInputText.value);
		console.log(userInputText.value);
		
		// 카테고리 분류   
		var sort = document.getElementsByName('sort');

		// 카테고리 체크된것만 넣기 
		var resultItem = "";

		for ( var i in sort) {
			if (sort[i].checked == true) {
				resultItem += "<br><b>" + sort[i].value + "</b><br>입니다.! ";
			}
		}
		// 카테고리 넣기
		transferSubject.push(resultItem); // 취미전송
		

		// 윈도우에 넣기 
		var iwContent = userInputText.value + resultItem;

		var iwPosition = latlng; //인포윈도우 표시 위치입니다
		//   var iwPosition = new daum.maps.LatLng(33.259645, 126.610898); //인포윈도우 표시 위치입니다

		// 윈도우 생성하기 
		createInfowindow(iwPosition, iwContent);
	}

	function createInfowindow(iwPosition, iwContent) {
		// 인포윈도우를 생성합니다
		var infowindow2 = new daum.maps.InfoWindow({
			position : iwPosition,
			content : iwContent
		});

		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow2.open(map, personalMarker);
		infowPersonal.push(infowindow2);		
	}
	
	function setInfowidow(map)
	{
		for (var i = 0; i < infowPersonal.length; i++) {
			// 각 마커에다 넣어야한다
			
			infowPersonal[i].open(map, markersPersonal[i]);
			console.log(infowPersonal[i]);
		}
	}
	


	///////////////////////////////////////////
	//                                //
	//                               //
	//        마커 & 인포윈도우 설정하기          //
	//                               //
	//                               //
	///////////////////////////////////////////	
	
	
	
	// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
	function showMarkers() {
		setMarkers(map);
		setInfowidow(map);
	}

	// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
	function hideMarkers() {
		setMarkers(null);
		setInfowidow(null);
		//infowindow2.close();   
	}
	var userId = ${member.mid};
	// 되돌리기
	$('#btBack').click(function() {
		console.log(userId);
		hideMarkers();
		markersPersonal.pop();
		infowPersonal.pop();
		showMarkers();
		if (markersPersonal.length == 0 && infowPersonal.length==0)
			$('#btBack').prop('disabled', true);
		else
			$('#btBack').prop('disabled', false);
	})

	// 마커 숨기기 보이기 지정
	$('#btShow').click(function() {
		showMarkers()
	});
	$('#btHide').click(function() {
		hideMarkers()
	});
	
	///////////////////////////////////////////
	//                                //
	//                               //
	//        저장하기 & 불러오기         //
	//                               //
	//                               //
	///////////////////////////////////////////	
	
	// 저장하기 
	function transferSave() {
	var tLat = transferLat+"";
	var tLng = transferLng+"";
	var tInText = transferPersonalInputText+"";
	var tInSubject = transferSubject+"";
	
	console.log(tLat); 
	console.log(tLng);
	console.log(tInText);
	$.ajax({
		url : "${pageContext.request.contextPath}/map/hoji.do",

		data : {
			tLat,
			tLng,
			tInText,
			tInSubject
		},
		/* dataType : "json", */
		success : function(data) {
			console.log(data);
		

		},
		error : function() {
			alert("ajax 실패");

		}

	});

	}
	
	
	
	// 불러오기
	function transferLoad() {
	var tLat = transferLat+"";
	var tLng = transferLng+"";
	var tInText = transferPersonalInputText+"";
	var tInSubject = transferSubject+"";
	
	console.log(tLat); 
	console.log(tLng);
	console.log(tInText);
	$.ajax({
		url : "${pageContext.request.contextPath}/map/hoji.do",

		data : {
			tLat,
			tLng,
			tInText,
			tInSubject
		},
		dataType : "json",
		success : function() {
			console.log("asd");
		

		},
		error : function() {
			alert("ajax 실패");

		}

	});

	}
	
	
</script>







<!-- <script type="text/javascript"
   src="${pageContext.request.contextPath}/resources/js/testMap.js"></script> -->
</html>