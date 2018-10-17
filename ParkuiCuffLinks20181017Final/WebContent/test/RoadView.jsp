<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=BUuozqDteU__6q25Dpo7&submodules=panorama"></script></head>
<body>
<div id="pano" style="width:100%;height:400px;"></div>
<script>
var pano = null;

function initPanorama() {
    pano = new naver.maps.Panorama("pano", {
        position: new naver.maps.LatLng(37.3599605, 127.1058814),
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
}

var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(37.3689782, 127.1059397)
});

var contentString = [
    '<div class="iw_inner">',
    '   <h3>서울특별시청</h3>',
    '   <p>서울특별시 중구 태평로1가 31 | 서울특별시 중구 세종대로 110 서울특별시청<br />',
    '       <img src="./img/example/hi-seoul.jpg" width="55" height="55" alt="서울시청" class="thumb" /><br />',
    '       02-120 | 공공,사회기관 &gt; 특별,광역시청<br />',
    '       <a href="http://www.seoul.go.kr" target="_blank">www.seoul.go.kr/</a>',
    '   </p>',
    '</div>'
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

naver.maps.onJSContentLoaded = initPanorama;
</script>
</body>
</html>