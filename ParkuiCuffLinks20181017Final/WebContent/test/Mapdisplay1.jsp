<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.3/dist/semantic.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.3/dist/semantic.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.3/dist/semantic.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.3/dist/semantic.min.css">
</head>
<body>
<div class="ui search">
  <div class="ui icon input">
    <input class="prompt" id = "MapSearch" type="text" placeholder="Search countries...">
    <i class="search icon"></i>
  </div>
  <div class="results"></div>
</div>
<div id="map" style="width:600px;height:480px;"></div>
<div id = "namverMap"><Button id = "NaverRoardView"></Button><div id="pano" style="width:600px;height:480px;"></div></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e2732ac11811f296aee0dfeb99caa81e&libraries=services"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=BUuozqDteU__6q25Dpo7&submodules=panorama"></script></head>
<script>
//전역변수---------------------------------------------------------------------
var name  = "";
var title = "";
var phone = "";
var image = "";
var y    = 0;
var x    = 0;
var mapContainer;
var mapOption;
var map;
var searchcoords = "";
var markers = [];
var json = '[{"name":"역곡"},{"name":"서울"},{"name":"안산"}]';
var obj = '';


//전역변수---------------------------------------------------------------------

function close(){
	$("#pano").hide();
}

function initPanorama(y,x) {
    pano = new naver.maps.Panorama("pano", {
        position: new naver.maps.LatLng(y, x),
        pov: {
            pan: -135,
            tilt: 29,
            fov: 100
        }
    });

    naver.maps.Event.addListener(pano, "init", function() {
        marker.setMap(pano);

        var proj = pano.getProjection();
        var lookAtPov = proj.fromCoordToPov(marker.getPosition());
        if (lookAtPov) {
            pano.setPov(lookAtPov);
        }
    });
    
    
    var marker = new naver.maps.Marker({
	    position: new naver.maps.LatLng(y, x)
	});

	var contentString = [
		'<div class="ui segment" style="width: 270px;height: 190px;padding-top: 0px;padding-left: 0px;padding-bottom: 0px;padding-right: 0px;margin-bottom: 0px;">'+
        '<p><h3 style="margin-top: 0px;margin-left: 15px;"align="center">CuffLink33</h3><div class="ui divider" style=" margin-top: 0px;"></div>'+
        '<div class = "ui grid"><div class="center aligned two column row" style="height: 89px;padding-bottom: 0px;"><div class="column" style=" height: 60px;">'+
        '<img src = "./Test.png" style=" height: 60px;"></div><div class="column" style="height: 60px;">'+
        '주소<br></br>연락처<br></br></div></div></div><div class="ui buttons" style = "margin-top:10px;">'+
        '</div></p></div>'
	].join('');

	var infowindow = new naver.maps.InfoWindow({
	    content: contentString
	});

	naver.maps.Event.addListener(marker, "click", function(e) {
	    e = e || window.event;

	    if (e.stopPropagation) {
	        e.stopPropagation();
	    }

	    e.cancelBubble = true;

	    if (infowindow.getMap()) {
	        infowindow.close();
	    } else {
	        infowindow.open(pano, marker);
	    }
	});
    
    
}



function roadView(y,x){
	
	$("#namverMap").show();
	initPanorama(y,x)

	naver.maps.onJSContentLoaded = initPanorama;

}
function road(){

	 location.href ="http://map.daum.net/link/to/"+name+","+y+","+x
}
function map(value){
	
	name = value;

	
mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();
obj = JSON.parse(value);
// 주소로 좌표를 검색합니다
var a = 0;
for(var i = 0; i<obj.length;i++){

	name  = obj[i].PRO_START;
/* 	title = obj[i].PRO_NAME;
	phone = obj[i].C_BUSINESSNUMBER;
	image = obj[i].PRO_FILE; */

geocoder.addressSearch(name, function(result, status) {

	a++;

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {
    	
    	 y = result[0].y;
    	 x = result[0].x;
        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

    	var imageSrc = '../image/Location.jpg', // 마커이미지의 주소입니다    
        imageSize = new daum.maps.Size(64, 69), // 마커이미지의 크기입니다
        imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
          
    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
        var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption)
        // 결과값으로 받은 위치를 마커로 표시합니다
        
        var marker = new daum.maps.Marker({
            map: map,
            position: coords,
            clickable: true
        });
        var iwContent = '<div class="ui segment" style="width: 270px;height: 190px;padding-top: 0px;padding-left: 0px;padding-bottom: 0px;padding-right: 0px;margin-bottom: 0px;">'+
        '<p><h3 style="margin-top: 0px;margin-left: 15px;"align="center">'+obj[a].PRO_NAME+'</h3><div class="ui divider" style=" margin-top: 0px;"></div>'+
        '<div class = "ui grid"><div class="center aligned two column row" style="height: 89px;padding-bottom: 0px;"><div class="column" style=" height: 60px;">'+
        '<img src = "'+obj[a].PRO_FILE+'" style=" height: 60px;"></div><div class="column" style="height: 60px;">'+
        ''+obj[a].PRO_START+'<br></br>'+obj[a].C_BUSINESSNUMBER+'<br></br></div></div></div><div class="ui buttons" style = "margin-top:10px;">'+
        '<button onClick = "road()" class="ui button" style="margin-left: 55px;">길찾기</button><div class="or"></div><button onClick = "roadView('+y+','+x+')" class="ui positive button">로드뷰</button>'+
        '</div></p></div>';
        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: iwContent,
            removable:true
        });
        infowindow.close();
        
        daum.maps.event.addListener(marker, 'click', function() {
            // 마커 위에 인포윈도우를 표시합니다
            infowindow.open(map, marker);  
         });

        
        if (navigator.geolocation) { // GPS를 지원하면
    	    navigator.geolocation.getCurrentPosition(function(position) {
    	      coords = new daum.maps.LatLng(position.coords.latitude+0.006, position.coords.longitude+0.00004);
    	      
    	      var marker = new daum.maps.Marker({
    	            map: map,
    	            position: coords,
    	            clickable: true,
    	            image: markerImage 
    	        });

    	      map.setCenter(coords);
    	      
    	    }, function(error) {
    	      console.error(error);
    	    }, {
    	      enableHighAccuracy: false,
    	      maximumAge: 0,
    	      timeout: Infinity
    	    });
    	  } else {
    	    alert('GPS를 지원하지 않습니다');
    	  }

        
        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
       
    } 
});    
}
}
$(document).ready(function(){
	
	$("#NaverRoardView").click(function(){
		
		$("#namverMap").hide();
		
	});

    $("#MapSearch").keydown(function(event){
		
		if(event.keyCode == '13'){
			MapSearch($("#MapSearch").val());
			$("#MapSearch").val("");
		}
		
	});
	

	$.ajax({
		
		url:"/naver/onMapReady"
	   ,method:"post"
	   ,success:function(data){

			map(data);

	   }
       ,error:function(xhrObject){
    	   alert(xhrObject,responseText);
       }
		
	});


	
});
function setMarkers(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
    }            
}

function MapSearch(value){
	
	
	MapSearchName = value;
	var imageSrc = '../image/searchMarker.png', // 마커이미지의 주소입니다    
    imageSize = new daum.maps.Size(64, 69), // 마커이미지의 크기입니다
    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption)

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

/* 	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

 */

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(MapSearchName, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {
	    	 y = result[0].y;
	    	 x = result[0].x;
	    	 searchcoords = new daum.maps.LatLng(result[0].y, result[0].x);
	    		// 마커를 생성합니다
	    	 setMarkers(null);
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: searchcoords,
	            clickable: true,
	            image: markerImage 
	            // 마커이미지 설정 
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            markers.push(marker);
            map.setCenter(searchcoords);
	    } 
	    //정상적으로 검색이 완료되지 않았을때 
	     else{
	    	 alert("주소를 자세히 입력해주세요");
	    	 
	    	  var marker = new daum.maps.Marker({
		            map: map,
		            position: searchcoords,
		            clickable: true
		   
		        });
	    	  markers.push(marker);
              map.setCenter(searchcoords);
	     }
	});    
}

</script>

</body>
</html>