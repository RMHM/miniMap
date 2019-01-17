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




</head>
<body>
	<c:import url="/WEB-INF/views/common/exFile.jsp" />
	<div id="wrapper">
		<c:import url="/WEB-INF/views/common/header.jsp" />


		<h1>개인지도 기록 불러오기</h1>

	<div id="map" style="width:100%;height:350px;"></div>


		<input type="button" value="불러오기" id="btn-load"
			onclick="transferLoad();" /> <input type="hidden"
			value=${member.mid } id="userId" />


		<c:import url="/WEB-INF/views/common/footer.jsp" />
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
	//        저장하기 & 불러오기         //
	//                               //
	//                               //
	///////////////////////////////////////////	
	
	
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