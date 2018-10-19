<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
var recognizing = false;
var two_line = /\n\n/g;
var one_line = /\n/g;
var first_char = /\S/;
var final_transcript = '';

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

  var recognition = new webkitSpeechRecognition();
  recognition.continuous = true;
  recognition.interimResults = true;
  recognition.onstart = function() {
    recognizing = true;
  
  };
  recognition.onend = function() {
    recognizing = false;


    if (!final_transcript) {
      $("#mrc-win").hide();
      return;
    }
    $("#mrc-win").hide();
  };

  recognition.onresult = function(event) {
      
    var interim_transcript = '';
    var final_transcript   = '';
    for (var i = event.resultIndex; i < event.results.length; ++i) {
      if (event.results[i].isFinal) {
        final_transcript += event.results[i][0].transcript;
        
        var answer = final_transcript;
        var v_news   = answer.replace(/\s/gi, "");
        var newsTitle = v_news.substring(2,v_news.length-2);
        v_news = v_news.substring(0,2)+v_news.substring(v_news.length-2,v_news.length);
  
        var v_naver = answer.replace(/\s/gi, "");
        var naverTitle = v_naver.substring(3,v_naver.length-2);
        v_naver = v_naver.substring(0,3)+v_naver.substring(v_naver.length-2,v_naver.length);
        
        var v_daum = answer.replace(/\s/gi, "");
        var daumTitle = v_naver.substring(2,v_daum.length-2);
        v_daum = v_daum.substring(0,2)+v_daum.substring(v_daum.length-2,v_daum.length);
        
        var v_google = answer.replace(/\s/gi, "");
        var googleTitle = v_google.substring(2,v_google.length-2);
        v_google = v_google.substring(0,2)+v_google.substring(v_google.length-2,v_google.length);
        
        var v_youtube = answer.replace(/\s/gi, "");
        var youtubeTitle = v_youtube.substring(3,v_youtube.length-2);
        v_youtube = v_youtube.substring(0,3)+v_youtube.substring(v_youtube.length-2,v_youtube.length);
        
        
        
        
        if(answer.replace(/\s/gi, "") == "뉴스검색"){
        	v_news = '';
        }
        else if(answer.replace(/\s/gi, "") == "자기소개"){
         	answer = "";
        	speak("안녕하세요 저는 음성 서비스 ai 내비 입니다.");
        }
        else if(answer.replace(/\s/gi, "") == "사이트에대해서소개해줘"){
        	answer = "";
        	speak("커프링크는 클라이언트가 프로젝트를 등록하며 파트너스가 그 프로젝트를 신청하여 일을 수행하는 사이트입니다.");
        }
        else if(answer.replace(/\s/gi, "") == "고마워"){
        	answer = "";
        	speak("별말씀을요");
        }
        else if(answer.replace(/\s/gi, "") == "사이트에대해소개해줘"){
        	answer = "";
        	speak("커프링크는 클라이언트가 프로젝트를 등록하며 파트너스가 그 프로젝트를 신청하여 일을 수행하는 사이트입니다.");
        }
        else if(answer.replace(/\s/gi, "") == "다음들어가"){
        	answer = "";
        	window.open('http://www.daum.net ', '_blank');
        }
        else if(answer.replace(/\s/gi, "") == "네이버들어가"){
      
        	answer = "";
        	window.open('https://www.naver.com', '_blank');
        }
        else if(answer.replace(/\s/gi, "") == "구글들어가"){
        	answer = "";
        	window.open('https://www.google.co.kr/', '_blank');
        }
        else if(answer.replace(/\s/gi, "") == "유튜브들어가"){
        	answer = "";
        	window.open('https://www.youtube.com/?gl=KR&hl=ko', '_blank');
        }
        else if(answer.replace(/\s/gi, "") == "마이크꺼"){
        	startButton(event);
        }
        else if(answer.replace(/\s/gi, "") == "마이크꺼"){
        	startButton(event);
        }
        else if(answer.replace(/\s/gi, "") == "마이크다운"){
        	startButton(event);
        }
        else if(v_news == "뉴스검색"){

        	$("#search").val(newsTitle);
         	news(newsTitle); 
        	speak(newsTitle+"를 검색하였습니다."); 
        }
        else if (v_naver == "네이버검색"){
        	answer = "";
        	window.open('https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query='+naverTitle, '_blank');
        	speak("검색을 완료하였습니다.");
        }
        else if (v_daum == "다음검색"){
        	answer = "";
        	window.open('https://search.daum.net/search?w=tot&DA=YZR&t__nil_searchbox=btn&sug=&sugo=&q='+daumTitle, '_blank');
        	speak("검색을 완료하였습니다.");
        }
        else if (v_google == "구글검색"){
        	answer = "";
        	window.open('https://www.google.co.kr/search?source=hp&ei=K1i8W-6QLszW-QafrJuICg&q='+googleTitle, '_blank');
        	speak("검색을 완료하였습니다.");
        }
        else if (v_youtube == "유튜브검색"){
        	answer = "";
        	window.open('https://www.youtube.com/results?search_query='+youtubeTitle, '_blank');
        	speak("검색을 완료하였습니다.");
        }
        else if(answer.replace(/\s/gi, "") == "계정설정"){
        	location.href='../auth/ClientProfile';
        	speak("계정설정에 들어왔습니다.");
        }
        else if(answer.replace(/\s/gi, "") == "프로젝트등록"){
        	location.href='http://localhost:8080/clients/projectRegisterDetail';
        	speak("프로젝트등록에 들어왔습니다.");
        }
        else if(answer.replace(/\s/gi, "") == "프로젝트찾기"){
        	location.href='http://localhost:8080/clients/projectFind';
        	speak("프로젝트찾기에 들어왔습니다.");
        }
        else if(answer.replace(/\s/gi, "") == "파트너스목록"){
        	location.href=' http://localhost:8080/partners/partnersList';
        	speak("파트너스목록에 들어왔습니다.");
        }
        else if(answer.replace(/\s/gi, "") == "메인페이지"){
        	location.href='/';
        	speak("메인페이지에 들어왔습니다.");
        }
        else if(answer.replace(/\s/gi, "") == "마이페이지"){
        	location.href='http://localhost:8080/clients/ClientMyCufflink';
        	speak("마이페이지에 들어왔습니다.");
        }
        else if(answer.replace(/\s/gi, "") == "로그아웃"){
        	location.href='../client/logout';
        	speak("로그아웃이 완료 되었습니다.");
        }
   
       
        
      } else {
        interim_transcript += event.results[i][0].transcript;
      }
  

      
    }
   
    $("#mrc-win").html(final_transcript);
    $("#mrc-win").html(interim_transcript);


  };

}
function startButton(event) {
  if (recognizing) {
    recognition.stop();
    return;
  }
  final_transcript = '';
  recognition.lang = 'ko-KR';
  recognition.start();

}
</script>
