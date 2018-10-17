// 상단 버튼에 대한 페이지별 active효과
$(document).ready(function() {

	
	//음성인식 아이콘클릭시 보여질화면
   $(".icon-font").click(function (e){
      $('.mrc .mrc-win').show();
   })
    
   //채팅문의시작
   
   $(".chatbtn").click(function (e){
      e.preventDefault();
      $(".chatbtn").hide('fast');
      $(".chatwin").slideToggle("show");
   })
   
   //채팅문의종료
   
   $(".t-right").click(function (e){
      e.preventDefault();
      $(".chatbtn").slideToggle("show");
      $(".chatwin").slideToggle("hide");
   })
   
   //드랍다운 메뉴
  $('.ui.menu .ui.dropdown').dropdown({
   action : 'hide',
   on: 'hover',
  });
  $('.ui.menu a.item')
    .on('click', function() {
      $(this)
        .addClass('active')
        .siblings()
        .removeClass('active');
    });


// 상단 버튼에 대한 페이지별 active효과

   //현재 화면의 파일이름 가져오기   
     var thisfilefullname = document.URL.substring(document.URL.lastIndexOf("/")+1, document.URL.length);
/*     alert(thisfilefullname);*/
     //	 프로젝트 파인트 메뉴효과
     var pfind = thisfilefullname.substr(0,4);
     /*alert("pfind : "+pfind);*/
     
     /*alert("파일명을 알려줘:"+thisfilefullname);*/
     //  검수중 하위관련   메뉴
     if(thisfilefullname=="projectSaved"||thisfilefullname=="projectRejected"){
        $("#projectSubmitted").addClass("active");
        $('.'+thisfilefullname).addClass("active");
     } 
     
     //  종료된 프로젝트 하위관련 메뉴
     else if(thisfilefullname=="projectCompletedContract"||thisfilefullname=="projectCancelledProject"){
        $("#projectReviewContract").addClass("active");
        $('.'+thisfilefullname).addClass("active");
     }
     
     // 클라이언트 정보 하위관련 메뉴
     else if(thisfilefullname=="ClientInfoUpdate"){
        $("#ClientInfo").addClass("active");
        $('.'+thisfilefullname).addClass("active");
        /*alert("프로젝트 하위관련 메인선택 : "+thisfilefullname);*/
     }
     
     // 클라이언트 프로젝트 등록 메뉴
     else if(thisfilefullname=="projectRegister"||thisfilefullname=="projectRegisterDetail"){
        $("#projectRegister").addClass("active");
       /* $('.'+thisfilefullname).addClass("active");*/
        /*alert("프로젝트등록 메인선택 : "+thisfilefullname);*/
     }
     
     // 클라이언트 프로젝트 평가완료 메뉴
     else if(thisfilefullname=="projectReviewContract"){
        $("#projectReviewContract").addClass("active");
        $('.'+thisfilefullname).addClass("active");
        /*alert("프로젝트
     // 클라이언트 프로젝트 평가완료 메인선택 : "+thisfilefullname);*/
     }

     // 클라이언트 정보 하위관련 메뉴
     else if(pfind=="page"){
       $("#projectFind").addClass("active");
      /* $('.'+thisfilefullname).addClass("active");*/
       /*alert("프로젝트찾기호출");*/
      }
     
     //이외의 상단메뉴 모두
     else {
	    $('.'+thisfilefullname).addClass("active");
	    /*alert("프로젝트등록 메인선택 : "+thisfilefullname);*/
     }
});