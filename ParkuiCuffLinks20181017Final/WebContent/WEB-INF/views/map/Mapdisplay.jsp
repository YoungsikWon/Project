<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/ui.jsp" />
</head>
<body>
<div id="map" style="width:600px;height:480px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8e91bf2951ff7ac21938e4a240554ea4&libraries=services"></script>
<script>
var name = "";
var y    = 0;
var x    = 0;
function road(){

	 location.href ="http://map.daum.net/link/to/"+name+","+y+","+x
}
function map(value){
	
	name = value;
	
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(name, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {
    	 y = result[0].y;
    	 x = result[0].x;
        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords,
            clickable: true
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div class="ui segment" style="width: 270px;height: 190px;padding-top: 0px;padding-left: 0px;padding-bottom: 0px;padding-right: 0px;margin-bottom: 0px;">'+
                     '<p><h3 style="margin-top: 0px;margin-left: 15px;"align="center">CuffLink</h3><div class="ui divider" style=" margin-top: 0px;"></div>'+
                     '<div class = "ui grid"><div class="center aligned two column row" style="height: 89px;padding-bottom: 0px;"><div class="column" style=" height: 60px;">'+
                     '<img src = "./Test.png" style=" height: 60px;"></div><div class="column" style="height: 60px;">'+
                     '주소<br></br>연락처<br></br></div></div></div><div class="ui buttons" style = "margin-top:10px;">'+
                     '<button onClick = "road()" class="ui button" style="margin-left: 55px;">길찾기</button><div class="or"></div><button class="ui positive button">로드뷰</button>'+
                     '</div></p></div>',
            removable:true
        });
            infowindow.open(map, marker);  
        daum.maps.event.addListener(marker, 'click', function() {
            // 마커 위에 인포윈도우를 표시합니다
            infowindow.open(map, marker);  
         });

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
}
$(document).ready(function(){

	$.ajax({
		
		url:""
	   ,method:"post"
	   ,success:function(data){
		   
			map("광명");
			
	   }
       ,error:function(xhrObject){
    	   alert(xhrObject,responseText);
       }
		
	});

	
});

</script>

</body>
</html>