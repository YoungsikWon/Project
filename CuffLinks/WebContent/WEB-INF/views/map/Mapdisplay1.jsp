<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../common/ui.jsp" />
<title>Insert title here</title>
<style>
#cbtn {display: none;}
#namverMap.show {display: block;}
#namverMap {display: none;}



.btnalign {
   width: 100%;
   margin-right: 0 ;
}

button, button::after {
   -webkit-transition: all 0.3s;
   -moz-transition: all 0.3s;
   -o-transition: all 0.3s;
   transition: all 0.3s;
}

button.cbtn {
   width: 100%;
   height: 30px;
   background: none;
   border: 1px solid #000;
   border-radius: 5px;
   color: #dedede;
   display: block;
   /* font-size: 1.6em; */
   font-weight: bold;
   /* margin: 1em auto; */
   /* padding: 2em 6em; */
   position: relative;
   text-transform: uppercase;
   border: 0px;
}

button::before, button::after {
   background: #dedede;
   content: '';
   position: absolute;
   z-index: -1;

}

button:hover {
   color: #2ecc71;

}

.cbtn::before {
   height: 100%;
   left: 0;
   top: 0;
   width: 100%;


}

.cbtn::after {
   background: #2ecc71;
   height: 100%;
   left: 0;
   top: 0;
   width: 100%;

   
}

.cbtn:hover:after {
   height: 0;
   left: 50%;
   top: 50%;
   width: 0;

}

</style>
</head>
<body>
   
   <div id="map" style="width: 100%; height: 480px;"></div>
            
   <div id="namverMap">
      
      <div id="NaverRoardView" style=" top: 0; z-index: 1000;"></div>
      
      <div id="pano" style="width: 100%; height: 480px;"></div>
      <div id="btnalign" class="btnalign" align="center">
         <button id="cbtn" type="button" class="cbtn">닫기</button>
      </div>
   </div>

   <script>
      //전역변수---------------------------------------------------------------------
      var name = "";
      var title = "";
      var phone = "";
      var image = "";
      var y = 0;
      var x = 0;
      var mapContainer;
      var mapOption;
      var map;
      var searchcoords = "";
      var markers = [];
      var obj = '';

      mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
         center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
         level : 5
      // 지도의 확대 레벨
      };

      // 지도를 생성합니다    
      map = new daum.maps.Map(mapContainer, mapOption);

      //전역변수---------------------------------------------------------------------

      
      function initPanorama(y, x, s) {
         pano = new naver.maps.Panorama("pano", {
            position : new naver.maps.LatLng(y, x),
            pov : {
               pan : -135,
               tilt : 29,
               fov : 100
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
            position : new naver.maps.LatLng(y, x)
         });

         var contentString = [ 
            '<div class="ui segment" style="background: #fafafa; border-left: 2px solid rgb(118, 129, 168);border-right: 2px solid rgb(118, 129, 168);border-bottom: 2px solid rgb(118, 129, 168);">'
            + '<h3 align="center">'
            + obj[s].PRO_NAME
            + '</h3>'
            + '<div class = "ui segment">'
            + '<h5 align="center">'
            + obj[s].PRO_ADDR
            + '<br></br>'
            + obj[s].C_PHONE
            + '</h3>'
            + '</div>' ].join('');

         var infowindow = new naver.maps.InfoWindow({
            content : contentString
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

      function roadView(y, x, s) {
         
         $("#map").hide();
         $("#namverMap").show();
         $(".cbtn").show();
         
         initPanorama(y, x, s)

         naver.maps.onJSContentLoaded = initPanorama;

      }

      function getAddress(name, i) {

         var geocoder = new daum.maps.services.Geocoder();
         // 주소로 좌표를 검색합니다
         geocoder
               .addressSearch(
                     name[i].PRO_ADDR,
                     function(result, status) {

                        // 정상적으로 검색이 완료됐으면 
                        if (status === daum.maps.services.Status.OK) {

                           var coords = new daum.maps.LatLng(
                                 result[0].y, result[0].x);

                           y = result[0].y;
                           x = result[0].x;
                           var imageSrc = '../image/Location1.png', // 마커이미지의 주소입니다    
                           imageSize = new daum.maps.Size(64, 69), // 마커이미지의 크기입니다
                           imageOption = {
                              offset : new daum.maps.Point(27, 69)
                           }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

                           // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
                           var markerImage = new daum.maps.MarkerImage(
                                 imageSrc, imageSize, imageOption)
                           // 결과값으로 받은 위치를 마커로 표시합니다

                           var marker = new daum.maps.Marker({
                              map : map,
                              position : coords,
                              clickable : true
                           });
                           var iwContent = '<div class="ui segment" style="background: #fafafa; border-left: 2px solid rgb(118, 129, 168);border-right: 2px solid rgb(118, 129, 168);border-bottom: 2px solid rgb(118, 129, 168);">'
                                 + '<h3 align="center">'
                                 + obj[i].PRO_NAME
                                 + '</h3>'
                                 + '<div class = "ui segment">'
                                 + '<h5 align="center">'
                                 + obj[i].PRO_ADDR
                                 + '<br></br>'
                                 + obj[i].C_PHONE
                                 + '</h3>'
                                 + '</div>'
                                 + '<div class="ui buttons" style = "margin-top:10px;">'
                                 + '<button onClick = "road('+i+','+y+','+x+')" class="ui button" style="margin-left: 55px;">길찾기</button>'
                           /*       + i
                                 + ','
                                 + y
                                 + ','
                                 + x
                                 + '" class="ui button">길찾기</button>' */
                                 + '<div class="or"></div>'
                                 + '<button onClick = "roadView('
                                 + y
                                 + ','
                                 + x
                                 + ','
                                 + i
                                 + ')" class="ui positive button roadView">로드뷰</button>'
                                 + '</div></div>';
                           // 인포윈도우로 장소에 대한 설명을 표시합니다
                           var infowindow = new daum.maps.InfoWindow({
                              content : iwContent,
                              removable : true
                           });
                           infowindow.close();

                           daum.maps.event.addListener(marker,
                              'click', function() {
                                 // 마커 위에 인포윈도우를 표시합니다
                                 infowindow.open(map, marker);
                              });
                           if (navigator.geolocation) { // GPS를 지원하면
                              navigator.geolocation
                                    .getCurrentPosition(
                                          function(position) {
                                             coords = new daum.maps.LatLng(
                                                   position.coords.latitude,
                                                   position.coords.longitude);

                                             var marker = new daum.maps.Marker(
                                                   {
                                                      map : map,
                                                      position : coords,
                                                      clickable : true,
                                                      image : markerImage
                                                   });

                                             map
                                                   .setCenter(coords);
                                             var moveLatLon = new daum.maps.LatLng(
                                                   position.coords.latitude,
                                                   position.coords.longitude);

                                             // 지도 중심을 이동 시킵니다
                                             map
                                                   .setCenter(moveLatLon);
                                          },
                                          function(error) {
                                             console
                                                   .error(error);
                                          },
                                          {
                                             enableHighAccuracy : false,
                                             maximumAge : 0,
                                             timeout : Infinity
                                          });

                           } else {
                              alert('GPS를 지원하지 않습니다');
                           }

                        }
                     });

      }
      function road(i, y, x) {
         
         /* 새창띄우기 */
         var openNewWindow = window.open("about:blank");
         
         openNewWindow.location.href = "http://map.daum.net/link/to/" + obj[i].PRO_ADDR + "," + y + "," + x
      }
      $(document).ready(function() {
         
         $(".cbtn").click(function(){
            
            $("#pano").hide(); 
            $("#map").show();
            $(".cbtn").hide();
         });
         
         $("#NaverRoardView").click(function() {
            $(".cbtn").hide();
            $("#namverMap").hide();

         });

         $("#MapSearch").keydown(function(event) {

            if (event.keyCode == '13') {
               MapSearch($("#MapSearch").val());
               $("#MapSearch").val("");
            }

         });

         $.ajax({

            url : "/naver/onMapReady",
            method : "post",
            success : function(data) {

               obj = JSON.parse(data);
               for (var i = 0; i < obj.length; i++) {
                  getAddress(obj, i);
               }
            },
            error : function(xhrObject) {
               alert(xhrObject, responseText);
            }

         });

      });
      function setMarkers(map) {
         for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(map);
         }
      }

      function MapSearch(value) {

         MapSearchName = value;
         var imageSrc = '../image/searchMarker.png', // 마커이미지의 주소입니다    
         imageSize = new daum.maps.Size(64, 69), // 마커이미지의 크기입니다
         imageOption = {
            offset : new daum.maps.Point(27, 69)
         }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

         // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
         var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
               imageOption)

         // 주소-좌표 변환 객체를 생성합니다
         var geocoder = new daum.maps.services.Geocoder();

         /*    var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

          */

         // 주소로 좌표를 검색합니다
         geocoder.addressSearch(MapSearchName, function(result, status) {

            // 정상적으로 검색이 완료됐으면 
            if (status === daum.maps.services.Status.OK) {
               y = result[0].y;
               x = result[0].x;
               searchcoords = new daum.maps.LatLng(result[0].y,
                     result[0].x);
               // 마커를 생성합니다
               setMarkers(null);
               // 결과값으로 받은 위치를 마커로 표시합니다
               var marker = new daum.maps.Marker({
                  map : map,
                  position : searchcoords,
                  clickable : true,
                  image : markerImage
               // 마커이미지 설정 
               });

               // 인포윈도우로 장소에 대한 설명을 표시합니다

               // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
               markers.push(marker);
               map.setCenter(searchcoords);
            }
            //정상적으로 검색이 완료되지 않았을때 
            else {
               alert("주소를 자세히 입력해주세요");

               var marker = new daum.maps.Marker({
                  map : map,
                  position : searchcoords,
                  clickable : true

               });
               markers.push(marker);
               map.setCenter(searchcoords);
            }
         });
      }
   </script>

</body>
</html>