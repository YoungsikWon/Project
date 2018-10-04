<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
		 List<Map<String, Object>> list1 =(List<Map<String, Object>>) request.getAttribute("ProjectFind1"); //개발
		 List<Map<String, Object>> list2 =(List<Map<String, Object>>) request.getAttribute("ProjectFind2"); // 디자인
		 List<Map<String, Object>> list3 =(List<Map<String, Object>>) request.getAttribute("Project"); //프로젝트 전체 목록
%>
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
      </div>
   </header>
<!----------------------------------------------------------------------- top 끝 -->

   <!-- <div class="ui basicspace">navigation menu와 여백</div> -->
   
<!----------------------------------------------------------------------- main content 시작 -->
<!----------------------------------------------------------------------- main content 시작 -->
   <div class="ui container raised segment contentMain-project">
   
   <!-- title 시작-->
      <div class="ui container">
         <div class="content-header">
            <div class="ui two column grid container">
               <div class="column">
                  <h3 class="content-text" style="text-align:left;">프로젝트 찾기</h3>
                  <small class="small-text" style="text-align:left;">000,000개의 프로젝트가 있습니다.</small>
               </div>
               <div class="column" style="text-align:right;margin:10px 0px;">
                  <div class="ui icon input">
                     <input type="text" placeholder="Search..."> <i
                        class="inverted circular search link icon"></i>
                  </div>
               </div>
            </div>
         </div>
      </div>   
   <!-- title 끝-->

   <div class="ui basicspace"><!-- login title와 main content 여백 -->   </div>

   <!-- main 입력 시작-->
      <div class="ui container">
         <div class="content-middle-project">
            <form>
               <div class="ui two column grid container" style="padding:00px;">
                  <div class="column grid" style="vertical-align: middle; padding: 00px; width: 17%;">
                     <div class="ui raised segment" style="padding:10px;">
                        <div class="column" style="padding-left:10px; text-align: left; font-size:16px">프로젝트 정렬</div>
                        <div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">
                           <hr style="" />
                        </div>
                        <div class="ui two column grid container" style="padding: 0px;">
                           <div class="column"   style="padding-top: 5px; padding-bottom: 0px; padding-left: 5px; padding-right: 5px; border-right: 1px solid #dedede;">
                              <a class="h10"  href="#" id="sort-1" onclick="setSortFilterValue(this)">금액 높은 순</a><br> 
                              <a class="h10" href="#"  id="sort-2" onclick="setSortFilterValue(this)">금액 낮은 순</a><br>
                           </div>
                           <div class="column" style="padding-top: 5px; padding-bottom: 0px; padding-left: 5px; padding-right: 5px;">
                              <a class="h10" href="#" id="sort-3" onclick="setSortFilterValue(this)">최신 등록 순</a><br> 
                              <a class="h10" href="#" id="sort-4" onclick="setSortFilterValue(this)">마감 임박 순</a><br>
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
												<input type="checkbox" id="dev" name="dev"> <div class="h11">개발</div>
											</div>
											<div class="list">
											<% 
											for(Map<String, Object> sub1 : list1) {  //개발 DB 넣어주기
											%> 
											<%-- <% for(String sb : map.get("sub1") { %> --%>
												<div class="item">
													<div class="ui child checkbox">
														<input type="checkbox" name="dev_List"> <div class="h11"><%=sub1.get("CATE_SUB") %></div>
													</div>
												</div>
										 	<% } %> 
											</div>
										</form>
<!-- form 끝 ================================================================================================================================== -->		
									</div>
									<div class="item" style="text-align: left;"> 
									<form name="develope">
											<div class="ui master checkbox">
												<input type="checkbox" id="design"> <div class="h11">디자인</div>
											</div>
											<div class="list">
											<%
											for(Map<String, Object> sub2 : list2) { // 디자인 DB 넣어주기
											%>
												<div class="item">
													<div class="ui child checkbox">
														<input type="checkbox" name="design_List"> <div class="h11"><%=sub2.get("CATE_SUB") %></div>
													</div>
												</div>
												<% } %>
											</div>
										</form>
									</div>
								</div>
							</div>
							<div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">
							
							</div>
						</div>
                     <div class="ui raised segment" style="padding:10px;">
                        <div class="column" style="padding-left:10px; text-align: left; font-size:12px">미팅 진행 지역</div>
                        <div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">
                           <hr style="" />
                        </div>
                        <div class="column" style="font-size:9px;">
                           <select class="ui search selection dropdown" id="search-select">
                              <option value="0">지역선택</option>
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
                        <div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">
   
                        </div>
                     </div>
                  </div>
               </form>
               <div class="column grid" style="padding-top: 0px; padding-bottom: 0px; padding-left: 10px; padding-right: 0px; width: 83%;">
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
   
   <!-- <div class="ui basicspace">login title와 main content 여백   </div> -->
   
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

   $('#search-select').change(function(){
      alert($(this).children("option:selected").text());
   })

   </script>
   /************************************************************ 프로젝트 찾기 - 미팅지역선택   */
      
   <script type="text/javascript">

      $('.master.checkbox').find('input').click(function(){
           /* console.log($(this).prop('checked')); */
         if($(this).prop('checked')){
            $('.item.'+$(this).prop('id')).find('.child.checkbox').find('input').prop('checked',true);
            alert($(this).val()+" : "+$(this).prop('checked'));
         }else{
            $('.item.'+$(this).prop('id')).find('.child.checkbox').find('input').prop('checked',false);
            alert($(this).val()+" : "+$(this).prop('checked'));
         }
      })
      
      $('.child.checkbox').find('input').click(function(){
         /* console.log($(this).prop('checked')); */
         if($(this).prop('checked')){
            alert($(this).val()+" : "+$(this).prop('checked'));
         } else {
            alert($(this).val()+" : "+$(this).prop('checked'));
         }
      })
</script>

</body>
</html>