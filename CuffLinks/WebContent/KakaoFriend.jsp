<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-title">
[플러스친구] 동적으로 친구 추가하기
</h3>
</div>
<div class="panel-body">
<a id="plusfriend-add-button" href="#" onclick=" void addPlusFriend();">
<img src="/assets/img/about/logos/plusfriend/friendadd_large_yellow_rect.png"/>
</a>
</div>
</div>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('c9262f3c9786d9f105ca22e032533d74');
    // 스토리 공유 버튼을 생성합니다.
    function addPlusFriend() {
    	Kakao.PlusFriend.addFriend({
    		plusFriendId: '_Mxhhuj'
    	});
    }
  //]]>
</script>

</body>
</html>