<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>projectList-(프로젝트 목록)</title>
</head>
<body>
<!----------------------------------------------------------------------- top 시작 -->
	<header class="header">
		<div class="ui">
	<!-- header 시작 -->
			<div class="ui">
				<jsp:include page="../common/menu/headerMenu.jsp"/>   
			</div>
	<!-- header 종료 -->
	
			<div class="ui"><!-- header와 navigation 여백 --></div>
	
	<!-- navigation menu 시작 -->
			<div class="ui navigation">
				<jsp:include page="../common/menu/navigationClientMenu.jsp"/>
			</div>
	<!-- navigation menu 종료-->
		</div>
	</header>
<!----------------------------------------------------------------------- top 끝 -->

<!----------------------------------------------------------------------- main content 시작 -->
<!----------------------------------------------------------------------- main content 시작 -->
	<div class="ui container raised segment content"  style="height:auto; margin-top: 10px; padding-bottom:20px;">
	
	<!-- title 시작-->
		<div class="ui container">
			<div class="content-header">
				<div class="ui two column grid container">
					<div class="column" style="text-align:left">
						<h3 class="content-text" style="text-align:left;">프로젝트 찾기</h3>
						<small class="small-text" style="text-align:left;">000,000개의 프로젝트가 있습니다.</small>
					</div>
					<div class="column" style="text-align:right;margin:10px 0px;">
<!-- form 시작 ================================================================================================================================== -->							
						<form name="p_search">
							<div class="ui icon input">
								<input type="text" placeholder="Search..."> <i
									class="inverted circular search link icon"></i>
							</div>
						</form>
<!-- form 끝 ================================================================================================================================== -->		
					</div>
				</div>
			</div> 
		</div>	
	<!-- title 끝-->

	<div class="ui basicspace"><!-- login title와 main content 여백 -->	</div>

	<!-- main 입력 시작-->
		<div class="ui container">
			<div class="content-middle-project">
				<div class="ui two column grid container" style="padding:00px;">
					<div class="column grid" style="vertical-align: middle; padding: 00px; width: 15%;">
						<div class="ui raised segment" style="padding:10px;">
							<div class="column" style="padding-left:10px; text-align: left; font-size:12px">프로젝트 정렬</div>
							<div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">
								<hr style="" />
							</div>
							<div class="ui two column grid container" style="padding: 0px;">
								<div class="column"	style="padding-top: 5px; padding-bottom: 0px; padding-left: 5px; padding-right: 5px; border-right: 1px solid #dedede;">
									<a class="h10" href="#">금액 높은 순</a><br> <a class="h10" href="#">금액 낮은 순</a><br>
								</div>
								<div class="column" style="padding-top: 5px; padding-bottom: 0px; padding-left: 5px; padding-right: 5px;">
									<a class="h10" href="#">최신 등록 순</a><br> <a class="h10" href="#">마감 임박 순</a><br>
								</div>
							</div>
							<div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">

							</div>
						</div>
						<div class="ui raised segment" style="padding:5px;">
							<div class="column" style="padding-left:10px; text-align: left; font-size:12px">프로젝트 카테고리</div>
							<div class="ui container" style="text-align: left; padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">
								<hr style="" />
							</div>
							<div class="ui two column grid container" style="padding-top: 10px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px;">
								<div class="ui relaxed list " style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">
									<div class="item" style="text-align: left; padding-top: 0px; padding-bottom: 10px; padding-left: 0px; padding-right: 5px;">
<!-- form 시작 ================================================================================================================================== -->		
										<form name="develope">
											<div class="ui master checkbox">
												<input type="checkbox" name="dev"> <div class="h11">개발</div>
											</div>
											<div class="list">
												<div class="item">
													<div class="ui child checkbox">
														<input type="checkbox" name="dev_web"> <div class="h11">웹</div>
													</div>
												</div>
												<div class="item">
													<div class="ui child checkbox">
														<input type="checkbox" name="dev_application"> <div class="h11">애플리케이션</div>
													</div>
												</div>
												<div class="item">
													<div class="ui child checkbox">
														<input type="checkbox" name="dev_wordPress"> <div class="h11">워드프레스</div>
													</div>
												</div>
												<div class="item">
													<div class="ui child checkbox">
														<input type="checkbox" name="dev_publishing"> <div class="h11">퍼블리싱</div>
													</div>
												</div>
												<div class="item">
													<div class="ui child checkbox">
														<input type="checkbox" name="dev_software"> <div class="h11">일반 소프트웨어</div>
													</div>
												</div>
												<div class="item">
													<div class="ui child checkbox">
														<input type="checkbox" name="dev_commerce"> <div class="h11">커머스,쇼핑몰</div>
													</div>
												</div>
												<div class="item">
													<div class="ui child checkbox">
														<input type="checkbox" name="dev_game"> <div class="h11">게임</div>
													</div>
												</div>
												<div class="item">
													<div class="ui child checkbox">
														<input type="checkbox" name="dev_embeded"> <div class="h11">임베디드</div>
													</div>
												</div>
												<div class="item">
													<div class="ui child checkbox">
														<input type="checkbox" name="dev_outside"> <div class="h11">기타</div>
													</div>
												</div>
											</div>
										</form>
<!-- form 끝 ================================================================================================================================== -->												
									</div>
									<div class="item" style="text-align: left;">
										<form name="develope">
											<div class="ui master checkbox">
												<input type="checkbox" name="design"> <div class="h11">디자인</div>
											</div>
											<div class="list">
												<div class="item">
													<div class="ui child checkbox">
														<input type="checkbox" name="design_web"> <div class="h11">웹</div>
													</div>
												</div>
												<div class="item">
													<div class="ui child checkbox">
														<input type="checkbox" name="design_application"> <div class="h11">애플리케이션</div>
													</div>
												</div>
												<div class="item">
													<div class="ui child checkbox">
														<input type="checkbox" name="design_product"> <div class="h11">제품</div>
													</div>
												</div>
												<div class="item">
													<div class="ui child checkbox">
														<input type="checkbox" name="design_presentation"> <div class="h11">프레젠테이션</div>
													</div>
												</div>
												<div class="item">
													<div class="ui child checkbox">
														<input type="checkbox" name="design_print"> <div class="h11">인쇄물</div>
													</div>
												</div>
												<div class="item">
													<div class="ui child checkbox">
														<input type="checkbox" name="design_commerce"> <div class="h11">커머스,쇼핑몰</div>
													</div>
												</div>
												<div class="item">
													<div class="ui child checkbox">
														<input type="checkbox" name="design_logo"> <div class="h11">로고</div>
													</div>
												</div>
												<div class="item">
													<div class="ui child checkbox">
														<input type="checkbox" name="design_graphics"> <div class="h11">그래픽</div>
													</div>
												</div>
												<div class="item">
													<div class="ui child checkbox">
														<input type="checkbox" name="design_vision"> <div class="h11">영상</div>
													</div>
												</div>
												<div class="item">
													<div class="ui child checkbox">
														<input type="checkbox" name="design_game"> <div class="h11">게임</div>
													</div>
												</div>
												<div class="item">
													<div class="ui child checkbox">
														<input type="checkbox" name="design_outside"> <div class="h11">기타</div>
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<div class="ui raised segment" style="padding:10px;">
							<div class="column" style="padding-left:10px; text-align: left; font-size:12px">미팅 진행 지역</div>
							<div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">
								<hr style="" />
							</div>
							<form name="meeting">	
								<div class="column" style="font-size:9px;">
									<select class="ui search selection dropdown" id="search-select">
										<option value="">지역선택</option>
										<option value="1">서울특별시</option>
										<option value="2">경기도</option>
										<option value="3">인천광역시</option>
										<option value="4">부산광역시</option>
										<option value="5">대구광역시</option>
										<option value="6">광주광역시</option>
										<option value="7">대전광역시</option>
										<option value="8">울산광역시</option>
										<option value="9">세종특별자치시</option>
										<option value="10">강원도</option>
										<option value="11">충청북도</option>
										<option value="12">충청남도</option>
										<option value="13">전라북도</option>
										<option value="14">전라남도</option>
										<option value="15">경상북도</option>
										<option value="16">경상남도</option>
										<option value="17">제주특별자치도</option>
									</select>
								</div>
							</form>
							<div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">

							</div>
						</div>
					</div>
					<div class="column grid" style="padding-top: 0px; padding-bottom: 0px; padding-left: 10px; padding-right: 0px; width: 85%;">
<!-- db 공통 코드================================== -->
						<div class="ui raised segment" style="padding:20px;">
							<div class="column" style="text-align: left;"><h3>해외 쇼핑몰 이미지 자동 번역 및 등록 솔루션 개발</h3></div>
							<div class="column" style="text-align: left; padding-top: 10px; padding-bottom: 0px; padding-left: 10px; padding-right: 0px;">예상금액 50,000,000원 &nbsp; | &nbsp; 예상기간 90일  &nbsp; |  &nbsp; 등록일자 2018.09.06</div>
							<div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">
								<hr style="" />
							</div>
							<div class="ui two column grid container" style="padding: 0px;  height:100px;">
								<div class="column grid" style="padding-top: 10px; padding-bottom: 10px; padding-left: 10px; padding-right: 5px; width: 80%; border-right: 1px solid grey; text-align: left">
								<프로젝트 진행 방식> 시작 시점에 오프라인 미팅 초기 업무 협의를 위한 잦은 오프라인 미팅을 요청드릴 수 있습니다. 이후 커뮤니케이션은 자유롭게 진행하고자 합니다. <프로젝트의 현재 상황> 자사 사이트가 구축되어 있으며, 필요한 사항에 대한 정리가 되어있습니다. <상세한 업무 내용> 필요 요소 : + 자동 수집 및 자동 등록 프로그 ...
								</div>
								<div class="column grid" style="padding-top: 10px; padding-bottom: 10px; padding-left: 10px; padding-right: 5px; width: 20%; font-size:11px;">
									<div class="ui container" style="padding-top: 10px; padding-bottom: 0px; padding-left: 10px; padding-right: 5px;">
										마감 1주 6일 전
									</div>
									<div class="ui container" style="padding-top: 0px; padding-bottom: 5px; padding-left: 20px; padding-right: 20px;">
										<hr style="" />
									</div>
									<div class="ui container" style="padding-top: 0px; padding-bottom: 0px; padding-left: 10px; padding-right: 5px;">
										총 5명 지원
									</div>
									<div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px;">
										<hr style="" />
									</div>
								</div>
							</div>
							<div class="column" style="text-align: left; padding-top: 10px; padding-bottom: 0px; padding-left: 10px; padding-right: 0px;">
								개발 > 웹관련 기술 HTML5 javascript SERVER ...
							</div>
							<div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">
							</div>
						</div>
<!-- db 공통 코드================================== -->
<!-- db 공통 코드 삭제할 코드================================== -->
						<div class="ui raised segment" style="padding:20px;">
							<div class="column" style="text-align: left;"><h3>해외 쇼핑몰 이미지 자동 번역 및 등록 솔루션 개발</h3></div>
							<div class="column" style="text-align: left; padding-top: 10px; padding-bottom: 0px; padding-left: 10px; padding-right: 0px;">예상금액 50,000,000원 &nbsp; | &nbsp; 예상기간 90일  &nbsp; |  &nbsp; 등록일자 2018.09.06</div>
							<div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">
								<hr style="" />
							</div>
							<div class="ui two column grid container" style="padding: 0px;  height:100px;">
								<div class="column grid" style="padding-top: 10px; padding-bottom: 10px; padding-left: 10px; padding-right: 5px; width: 80%; border-right: 1px solid grey; text-align: left">
								<프로젝트 진행 방식> 시작 시점에 오프라인 미팅 초기 업무 협의를 위한 잦은 오프라인 미팅을 요청드릴 수 있습니다. 이후 커뮤니케이션은 자유롭게 진행하고자 합니다. <프로젝트의 현재 상황> 자사 사이트가 구축되어 있으며, 필요한 사항에 대한 정리가 되어있습니다. <상세한 업무 내용> 필요 요소 : + 자동 수집 및 자동 등록 프로그 ...
								</div>
								<div class="column grid" style="padding-top: 10px; padding-bottom: 10px; padding-left: 10px; padding-right: 5px; width: 20%; font-size:11px;">
									<div class="ui container" style="padding-top: 10px; padding-bottom: 0px; padding-left: 10px; padding-right: 5px;">
										마감 1주 6일 전
									</div>
									<div class="ui container" style="padding-top: 0px; padding-bottom: 5px; padding-left: 20px; padding-right: 20px;">
										<hr style="" />
									</div>
									<div class="ui container" style="padding-top: 0px; padding-bottom: 0px; padding-left: 10px; padding-right: 5px;">
										총 5명 지원
									</div>
									<div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px;">
										<hr style="" />
									</div>
								</div>
							</div>
							<div class="column" style="text-align: left; padding-top: 10px; padding-bottom: 0px; padding-left: 10px; padding-right: 0px;">
								개발 > 웹관련 기술 HTML5 javascript SERVER ...
							</div>
							<div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">
							</div>
						</div>
						<div class="ui raised segment" style="padding:20px;">
							<div class="column" style="text-align: left;"><h3>해외 쇼핑몰 이미지 자동 번역 및 등록 솔루션 개발</h3></div>
							<div class="column" style="text-align: left; padding-top: 10px; padding-bottom: 0px; padding-left: 10px; padding-right: 0px;">예상금액 50,000,000원 &nbsp; | &nbsp; 예상기간 90일  &nbsp; |  &nbsp; 등록일자 2018.09.06</div>
							<div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">
								<hr style="" />
							</div>
							<div class="ui two column grid container" style="padding: 0px;  height:100px;">
								<div class="column grid" style="padding-top: 10px; padding-bottom: 10px; padding-left: 10px; padding-right: 5px; width: 80%; border-right: 1px solid grey; text-align: left">
								<프로젝트 진행 방식> 시작 시점에 오프라인 미팅 초기 업무 협의를 위한 잦은 오프라인 미팅을 요청드릴 수 있습니다. 이후 커뮤니케이션은 자유롭게 진행하고자 합니다. <프로젝트의 현재 상황> 자사 사이트가 구축되어 있으며, 필요한 사항에 대한 정리가 되어있습니다. <상세한 업무 내용> 필요 요소 : + 자동 수집 및 자동 등록 프로그 ...
								</div>
								<div class="column grid" style="padding-top: 10px; padding-bottom: 10px; padding-left: 10px; padding-right: 5px; width: 20%; font-size:11px;">
									<div class="ui container" style="padding-top: 10px; padding-bottom: 0px; padding-left: 10px; padding-right: 5px;">
										마감 1주 6일 전
									</div>
									<div class="ui container" style="padding-top: 0px; padding-bottom: 5px; padding-left: 20px; padding-right: 20px;">
										<hr style="" />
									</div>
									<div class="ui container" style="padding-top: 0px; padding-bottom: 0px; padding-left: 10px; padding-right: 5px;">
										총 5명 지원
									</div>
									<div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px;">
										<hr style="" />
									</div>
								</div>
							</div>
							<div class="column" style="text-align: left; padding-top: 10px; padding-bottom: 0px; padding-left: 10px; padding-right: 0px;">
								개발 > 웹관련 기술 HTML5 javascript SERVER ...
							</div>
							<div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">
							</div>
						</div>
<!-- db 공통 코드 삭제할 코드================================== -->
					</div>
				</div>
			</div>
		</div>
	<!-- main 입력 끝-->
	
	</div>
<!----------------------------------------------------------------------- main content 끝 -->
<!----------------------------------------------------------------------- main content 끝 -->
	
	<!-- <div class="ui basicspace">login title와 main content 여백	</div> -->
	
<!----------------------------------------------------------------------- footer content 시작 -->
	<!-- footer 시작-->
		<footer class="footer">
			<div class="ui inverted segment" style="height:200px; padding:25px; vertical-align:middle;">
				<jsp:include page="../common/menu/footerMenu.jsp"/>
			</div>
		</footer>
	<!-- footer 끝-->
<!----------------------------------------------------------------------- footer content 끝 -->
/************************************************************ 프로젝트 찾기 - 미팅지역선택  */
	<script type="text/javascript">
	$('#search-select')
	.dropdown();
	</script>
	/************************************************************ 프로젝트 찾기 - 미팅지역선택   */
		
	<script type="text/javascript">
	
	
	
	/************************************************************ 프로젝트 찾기 - 프로젝트  카테고리  */
	$('.list .master.checkbox')
	.checkbox({
	  // check all children
	  onChecked: function() {
	    var
	      $childCheckbox  = $(this).closest('.checkbox').siblings('.list').find('.checkbox')
	    ;
	    $childCheckbox.checkbox('check');
	  },
	  // uncheck all children
	  onUnchecked: function() {
	    var
	      $childCheckbox  = $(this).closest('.checkbox').siblings('.list').find('.checkbox')
	    ;
	    $childCheckbox.checkbox('uncheck');
	  }
	});
	$('.list .child.checkbox')
	  .checkbox({
	    // Fire on load to set parent value
	    fireOnInit : true,
	    // Change parent state on each child checkbox change
	    onChange   : function() {
	      var
	        $listGroup      = $(this).closest('.list'),
	        $parentCheckbox = $listGroup.closest('.item').children('.checkbox'),
	        $checkbox       = $listGroup.find('.checkbox'),
	        allChecked      = true,
	        allUnchecked    = true
	      ;
	      // check to see if all other siblings are checked or unchecked
	      $checkbox.each(function() {
	        if( $(this).checkbox('is checked') ) {
	          allUnchecked = false;
	        }
	        else {
	          allChecked = false;
	        }
	      });
	      // set parent checkbox state, but dont trigger its onChange callback
	      if(allChecked) {
	        $parentCheckbox.checkbox('set checked');
	      }
	      else if(allUnchecked) {
	        $parentCheckbox.checkbox('set unchecked');
	      }
	      else {
	        $parentCheckbox.checkbox('set indeterminate');
	      }
	    }
	  });
	/************************************************************ 프로젝트 찾기 - 프로젝트  카테고리  */
</script>
</body>
</html>
