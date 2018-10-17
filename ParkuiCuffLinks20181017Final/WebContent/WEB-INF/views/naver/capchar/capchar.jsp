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

<script type="text/javascript">

var key = "";

function Reload(){
	$.ajax({
		method : "post",
		url : "/capcharImage"
		,
		success : function(captchaIMG) {

            key = captchaIMG.replace(/\s/g, "");
			var view = "<img id='captchaIMG' src='https://openapi.naver.com/v1/captcha/ncaptcha.bin?key="+key+"' width='200px' height='75px'>";
			$("#d_captchaIMG").html(view);
			
		},
		error : function(xhrObject) {
			alert(xhrObject.responseTest);
		}

	});
}
function capchar(value){
	
	var value =  $("#I_image").val();

	$.ajax({
		method : "post",
		url : "/capcharValue"
		,data : {
			"key" : key,
			"value":value
		},
		success : function(captchaIMG) {

          if(captchaIMG ==5){
        	  alert("틀렸습니다.");
        	  Reload();
        	  
          }
          else if(captchaIMG ==4){
        	  Csuccess();
          }
			

		},
		error : function(xhrObject) {
			alert(xhrObject.responseTest);
		}

	});
}

	$(document).ready(function() {

        $.ajax({
			method : "post",
			url : "/capcharImage"
			,
			success : function(captchaIMG) {

				key = captchaIMG.replace(/\s/g, "");
		
				var view = "<img id='captchaIMG' src='https://openapi.naver.com/v1/captcha/ncaptcha.bin?key="+key+"' width='200px' height='75px'>";
				 
				$("#d_captchaIMG").html(view);
			
				
			},
			error : function(xhrObject) {
				alert(xhrObject.responseTest);
			}

		});


});
</script>

</head>
<body>
	<div class="" style="width: 92%; ">
	  <div class="" style="overflow: hidden;margin: 0; padding: 0;">
	  	<div style="background-color: #F8E0E6;">아래 이미지를 보이는 대로 입력해주세요.</div>
	    <div class="" style="float: left; height: 48px;margin: 0; padding: 0;">
	      <div id = "d_captchaIMG" style=""></div>
	    </div>
	    <div class="" style="margin: 0; padding: 0;">
	      	<button class="" style="width: 41%; height: 37px;" onClick="Reload()"> 새로고침 </button>
	    </div>
	    <div class="" style="margin: 0; padding: 0;">
	    	<button class="" style="width: 41%; height: 38px;" onClick="capchar()"> 확인 </button>
	    </div>
	    <div class="" style="margin-top:0px;margin: 0; padding: 0;">
	      <input id="I_image" type="text" style="width: 100%; height: 24px; color: #444; border: 1px solid #bebebe padding: 0px 2px 0px 4px; margin-top: 0px;" placeholder="자동입력 방지 문자">
	    </div>
	  </div>
	</div>


	<!-- <div class="ui raised segment" style="width: 350px;height: auto;">
	  <div class="ui grid">
	    <div class="ten wide column" style="height: 50px;margin-bottom:0px;">
	      <div id = "d_captchaIMG"></div>
	    </div>
	    <div class="six wide column" style="background-color: white;height: auto;">
	      <button class="ui button" style="margin-top: 0;margin-left: 0;height: 42px;width: 102px;margin-bottom: 5px;border-bottom-width: 5px;" onClick="Reload()"> 새로고침 </button>
	      <button class="ui button" style="margin-top: 0;margin-left: 0;height: 42px;width: 102px;" onClick="capchar()"> 확인 </button>
	    </div>
	    <div class="ui input" style="margin-top:0px;">
	      <input id="I_image" type="text" style="width: 185px;margin-top: 5px;margin-bottom: 5px;" placeholder="자동입력 방지 문자">
	    </div>
	  </div>
	</div> -->
</body>
</html>