$(function(){
	var mapContainer = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var mapOption = { //지도를 생성할 때 필요한 기본 옵션
		center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 지도를 클릭했을때 클릭한 위치에 마커를 추가하도록 지도에 클릭이벤트를 등록합니다
	daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    // 클릭한 위치에 마커를 표시합니다 
	    addMarker(mouseEvent.latLng);
	    
	    if(markers.length==0) $('#btBack').prop('disabled', true);
	    else $('#btBack').prop('disabled', false);
	});
	
	// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
	var markers = [];
	var positions = [];
	
	// 마커를 생성하고 지도위에 표시하는 함수입니다
	function addMarker(position) {
	    
	    // 마커를 생성합니다
	    var marker = new daum.maps.Marker({
	    	map : map,
	        position: position
	    });

	    // 마커가 지도 위에 표시되도록 설정합니다
	    marker.setMap(map);
	    
	    // 생성된 마커를 배열에 추가합니다
	    markers.push(marker);
	    
	}
	
	// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
	function setMarkers(map) {
	    for (var i = 0; i < markers.length; i++) {
	        markers[i].setMap(map);
	    }
	}

	// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
	function showMarkers() {
	    setMarkers(map)
	}

	// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
	function hideMarkers() {
		setMarkers(null);			
	}
	
	// 되돌리기
	$('#btBack').click(function(){
		hideMarkers();
		markers.pop();
		showMarkers();
		if(markers.length==0) $('#btBack').prop('disabled', true);
		else $('#btBack').prop('disabled', false);
	})
	
	// 위경도 출력
	$('#btPrintLatLon').click(function(){
		for(var i=0; i<latLng.length; i++){
			console.log('위도 : ' + latLng[i].getLat() + ', 경도 : ' + latLng[i].getLng());
		}
	})
	
	// 마커 숨기기 보이기 지정
	$('#btShow').click(function(){showMarkers()});
	$('#btHide').click(function(){hideMarkers()});
	
})



function closeOverlay() {
    overlay.setMap(null);     
}