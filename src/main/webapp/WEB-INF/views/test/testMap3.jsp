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
	<div id="wrapper">
		

	<div id="map" style="width:100%;height:350px;"></div>


		<form>
			<fieldset>
				<legend></legend>
				<p>
					사용자 마커 글추가 <input type="text" id="userInputText"> <input
						type="button" value="글넣기" id="btUserInputText"
						onclick="personalInputText();">
				</p>
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
		<hr>

		<p>
			<button id=btBack>되돌리기</button>
			<button id=btShow>마커보이기</button>
			<button id=btHide>마커숨기기</button>


			<input type="button" value="저장하기" id="btn-add"
				onclick="transferSave();" /> 
		</p>


		<input type="hidden" value=${member.mid } id="userId" />


	</div>


</body>



<script>
	// 전송할 기본 네게 //
	var transferLat = []; // 위도
	var transferLng =[]; // 경도
	var transferPersonalInputText=[]; // 사용자 글
	var transferSubject =[] ; // 취미전송
	
	var userId2 = document.getElementById("userId").value;
	var tUserId = userId2;
	console.log(userId2);
	console.log(tUserId);
	//var userId = ${member.mid};






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
	//var userId = ${member.mid};
	// 되돌리기
	$('#btBack').click(function() {
		//console.log(userId);
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
	console.log(tUserId);
	console.log(tInText);
	$.ajax({
		url : "${pageContext.request.contextPath}/map/hoji.do",

		data : {
			tUserId,
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
	var lLat = [];
	var lLng = [];
	var lInText ;
	var lInSubject;

	
	$.ajax({
		url : "${pageContext.request.contextPath}/map/hoji2.do",

		data : {
			tUserId
		},
		/* dataType : "json", */
		success : function(data) {
			console.log(data[0]);
			console.log(data[1]);
			console.log(data[2]);
			console.log(data[3]);
			console.log(data[4]);
			console.log(data[5]);
			console.log(data[6]);
			console.log(data[7]);
			console.log(data[8]);
			console.log(data[9]);
			console.log(data[10]);
			console.log(data[11]);
			console.log(data[12]);
			console.log(data[13]);
			console.log(data[14]);
			console.log(data[15]);
			
			 var personalMarker2=[];
		var positions = [
		    {
		        title: '카카오', 
		        latlng: new daum.maps.LatLng(data[0], data[1]),
		        iwContent : data[2] + data[3]
		    },
		    {
		        title: '생태연못', 
		        latlng: new daum.maps.LatLng(data[4], data[5]),
		        iwContent : data[6] + data[7]
		    },
		    {
		        title: '텃밭', 
		        latlng: new daum.maps.LatLng(data[8], data[9]),
		        iwContent : data[10] + data[11]
		    },
		    {
		        title: '근린공원',
		        latlng: new daum.maps.LatLng(data[12], data[13]),
		        iwContent : data[14] + data[15]
		    }
		];

		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		    
		for (var i = 0; i < positions.length; i ++) {
		    
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new daum.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
			personalMarker2 = new daum.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		    
			var infowindow2 = new daum.maps.InfoWindow({
				position : positions[i].latlng,
				content : positions[i].iwContent
			});

			infowindow2.open(map, personalMarker2);
		}



	
		
		
		},
		error : function() {
			alert("ajax 실패");

		}

	});

	
	


	// 사용자 입력

	// 사용자 입력 넣기
	
	// 카테고리 넣기
	
	// 윈도우에 넣기 

	
	
	
	
	
	
	
	}
	
	
</script>







<!-- <script type="text/javascript"
   src="${pageContext.request.contextPath}/resources/js/testMap.js"></script> -->
</html>