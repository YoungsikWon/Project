// 상단 버튼에 대한 페이지별 active효과
$(document).ready(function() {
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
});

// 상단 버튼에 대한 페이지별 active효과

	//현재 화면의 파일이름 가져오기	
  	var thisfilefullname = document.URL.substring(document.URL.lastIndexOf("/")+1, document.URL.length);

  	//  검수중 하위관련	메뉴
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
  		/*alert("프로젝트등록 메인선택 : "+thisfilefullname);*/
  	
  	//이외의 상단메뉴 모두
  	} else {
  		$('.'+thisfilefullname).addClass("active");
  		/*alert("프로젝트등록 메인선택 : "+thisfilefullname);*/
  	}
