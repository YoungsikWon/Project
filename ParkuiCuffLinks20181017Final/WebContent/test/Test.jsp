<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<meta charset="EUC-KR">
<title>Web Speech API Demo</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.3/dist/semantic.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.3/dist/semantic.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.3/dist/semantic.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.3.3/dist/semantic.min.css">
<input id = "Tests" style="width: 304px;height: 406px;">
<div class="right">
  <button id="start_button" onclick="startButton(event)">
    <img id="start_img" src="mic.gif" alt="Start"></button>
     <button onclick = "Test()"></button>
</div>
<input id = "Tests2">
<script>
var recognizing = false;
var two_line = /\n\n/g;
var one_line = /\n/g;
var first_char = /\S/;
var final_transcript = '';
var ignore_onend;
var start_timestamp;
var final_span;
var interim_span;

function speak(text) {
	  if (typeof SpeechSynthesisUtterance === 'undefined' || typeof speechSynthesis === 'undefined') {
	    alert('This browser does not support speech API');
	    return;
	  }

	  const message = new SpeechSynthesisUtterance(text);
	  const voices = speechSynthesis.getVoices();

	  message.voice = voices[0];
	  speechSynthesis.speak(message);
	}

if(('webkitSpeechRecognition' in window)) {
  start_button.style.display = 'inline-block';
  var recognition = new webkitSpeechRecognition();
  recognition.continuous = true;
  recognition.interimResults = true;
  recognition.onstart = function() {
    recognizing = true;
    alert("녹음중~");
    start_img.src = 'mic-animate.gif';
  };
  recognition.onend = function() {
    recognizing = false;
    if (ignore_onend) {
      return;
    }
    start_img.src = 'mic.gif';
    if (!final_transcript) {
      alert("마이크끔");
      return;
    }
    alert("마이크끔");
  };

  recognition.onresult = function(event) {
      
    var interim_transcript = '';
    var final_transcript   = '';
    for (var i = event.resultIndex; i < event.results.length; ++i) {
      if (event.results[i].isFinal) {
        final_transcript += event.results[i][0].transcript;
        
        var answer = final_transcript;

        if(answer.replace(/\s/gi, "") == "재현자기소개"){
         	answer = "";
        	speak("안녕하세요 저는 지니에요");
        }
        else if(answer.replace(/\s/gi, "") == "재현사이트에대해서소개해줘"){
        	answer = "";
        	speak("커프링크는 파트너스가 프로젝트를 등록하고 개발자가 신청하여");
        }
        else if(answer.replace(/\s/gi, "") == "재현사이트에대해소개해줘"){
        	answer = "";
        	speak("커프링크는 파트너스가 프로젝트를 등록하고 개발자가 신청하여");
        }
        else if(answer.replace(/\s/gi, "") == "재현오늘날씨"){
        	answer = "";
        	location.href = "https://weather.naver.com/rgn/townWetr.nhn?naverRgnCd=02190790";
        	
        }
        else if(answer.replace(/\s/gi, "") == "재현네이버들어가"){
        	answer = "";
        	location.href = "https://www.naver.com/";
        }
        else if(answer.replace(/\s/gi, "") == "아영아"){
        	answer = "";
        	speak("오빠 나는 오빠없으면 안돼 내 평생 있어줘 ");
        }
       
        
      } else {
        interim_transcript += event.results[i][0].transcript;
      }
  
      
    }
    final_transcript = capitalize(final_transcript);
    $("#Tests").val(linebreak(final_transcript));
    $("#Tests").val(linebreak(interim_transcript));ㅋ
  
    

  };

}
function linebreak(s) {
  return s.replace(two_line, '<p></p>').replace(one_line, '<br>');
}
function capitalize(s) {
  return s.replace(first_char, function(m) { return m.toUpperCase(); });
}
function startButton(event) {
  alert("마이크누름");
  if (recognizing) {
    recognition.stop();
    return;
  }
  final_transcript = '';
  recognition.lang = 'ko-KR';
  recognition.start();
  ignore_onend = false;
  final_span.innerHTML = '';
  interim_span.innerHTML = '';
  start_img.src = 'mic-slash.gif';
  showButtons('none');
  start_timestamp = event.timeStamp;
}
</script>
</head>
<body>
</body>
</html>