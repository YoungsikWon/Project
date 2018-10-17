<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<Map<String, Object>> list1 = (List<Map<String, Object>>) request.getAttribute("ProjectFind1"); //개발
	List<Map<String, Object>> list2 = (List<Map<String, Object>>) request.getAttribute("ProjectFind2"); // 디자인

	List<Map<String, Object>> list4 = (List<Map<String, Object>>) request.getAttribute("getProject_cateALL"); //프로젝트 전체 목록
	List<Map<String, Object>> list5 = (List<Map<String, Object>>) request.getAttribute("Projectseach"); //검색기능

	Map<String, Object> view = (Map<String, Object>) request.getAttribute("view");// 프로젝트 상세보기 목록 뿌리기   

	//Map<String, Object> map = (Map<String, Object>) request.getAttribute("getAll"); // 페이지 네이션 및 프로젝트 목록 뿌리기
	//List<Map<String, Object>> list3 = (List<Map<String, Object>>) map.get("result");
	//int count = (int) Math.ceil(Double.parseDouble(map.get("tablesize").toString()) / 10);
	//List<Map<String, Object>> list5 = (List<Map<String, Object>>) map.get("result");
	//Map<String, Object> view =  (Map<String, Object>)request.getAttribute("view");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 찾기</title>
<link rel="stylesheet" href="/css/cuffLink.css" />
<link rel="stylesheet" href="/css/login.css" />
</head>
<body>
	<!----------------------------------------------------------------------- top 시작 -->
	<header class="header">
		<div class="ui">
			<!-- header 시작 -->
			<div class="ui">
				<%
					if (request.getAttribute("kind") == null) {
				%>
				<jsp:include page="../common/menu/headerMenuLogout.jsp" />
				<%
					} else {
				%>
				<%
					if ("클라이언트".equals(request.getAttribute("kind").toString())) {
				%>
				<jsp:include page="../common/menu/headerMenu.jsp" />
				<%
					} else {
				%>
				<jsp:include page="../common/menu/PartnersHeaderMenu.jsp" />
				<%
					}
				%>
				<%
					}
				%>
			</div>
			<!-- header 종료 -->

			<div class="ui">
				<!-- header와 navigation 여백 -->
			</div>

			<!-- navigation menu 종료-->
		</div>
	</header>
	<!----------------------------------------------------------------------- top 끝 -->

	<!----------------------------------------------------------------------- main content 시작 -->
	<!----------------------------------------------------------------------- main content 시작 -->
	<div class="ui container raised segment content"
		style="height: auto; margin-top: 10px; padding-bottom: 20px;">
		<!-- title 시작-->
		<div class="ui container">
			<div class="content-header">
				<div class="ui two column grid container">
					<div class="column" style="text-align: left">
						<h3 class="content-text" style="text-align: left;">프로젝트 찾기</h3>
						<small class="small-text" style="text-align: left;">000,000개의
							프로젝트가 있습니다.</small>
					</div>
					<div class="column" style="text-align: right; margin: 10px 0px;">
						<!-- form 시작 ================================================================================================================================== -->
						<div class="ui search">
							<div class="ui icon input">
								<input class="prompt" type="text"
									placeholder="Search countries..." onkeyup="cateHandler(categoryList(),1,this.value)">
								<i class="search icon"></i>
							</div>
							<div class="results"></div>
						</div>
						<!-- form 끝 ================================================================================================================================== -->
					</div>
				</div>
			</div>
		</div>
		<!-- title 끝-->

		<div class="ui basicspace">
			<!-- login title와 main content 여백 -->
		</div>
		<!-- main 입력 시작-->
		<div class="ui container">
			<div class="content-middle-project">
				<div class="ui two column grid container"
					style="padding: 00px; overflow: hidden;">
					<div class="column grid"
						style="vertical-align: middle; padding: 00px; width: 15%;">
						<div class="ui raised segment" style="padding: 10px;">
							<div class="column"
								style="padding-left: 10px; text-align: left; font-size: 12px">프로젝트
								정렬</div>
							<div class="ui container"
								style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">
								<hr style="" />
							</div>
							<div class="ui two column grid container" style="padding: 0px;">
								<div class="column"
									style="padding-top: 5px; padding-bottom: 0px; padding-left: 5px; padding-right: 5px; border-right: 1px solid #dedede;">
									<a class="h10" id="sort" onclick="setSortFilterValue(this)">금액
										높은 순</a>
									<br>
									<a class="h10" id="sort" onclick="setSortFilterValue(this)">금액
										낮은 순</a>
									<br>
								</div>
								<div class="column"
									style="padding-top: 5px; padding-bottom: 0px; padding-left: 5px; padding-right: 5px;">
									<a class="h10" id="sort" onclick="setSortFilterValue(this)">최신
										등록 순</a>
									<br>
									<a class="h10" id="sort" onclick="setSortFilterValue(this)">마감
										임박 순</a>
									<br>
								</div>
							</div>
							<div class="ui container"
								style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">
							</div>
						</div>
						<div class="ui raised segment" style="padding: 5px;">
							<div class="column"
								style="padding-left: 10px; text-align: left; font-size: 12px">프로젝트
								카테고리</div>
							<div class="ui container"
								style="text-align: left; padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">
								<hr style="" />
							</div>
							<div class="ui two column grid container"
								style="padding-top: 10px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px;">
								<div class="ui relaxed list "
									style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">
									<div class="item"
										style="text-align: left; padding-top: 0px; padding-bottom: 10px; padding-left: 0px; padding-right: 5px;">
										<!-- form 시작 ================================================================================================================================== -->
										<form name="develope" id='devs'>
											<div class="ui master checkbox">
												<input type="checkbox" id="dev" value='개발'>
												<label class="h11">개발</label>
											</div>
											<div class="list">
												<%
													for (Map<String, Object> sub1 : list1) { //개발 DB 넣어주기
												%>
												<%-- <% for(String sb : map.get("sub1") { %> --%>
												<div class="item dev">
													<div class="ui child checkbox">
														<input type="hidden" value="개발" />
														<input type="checkbox" value='<%=sub1.get("CATE_SUB")%>'>
														<label class="h11"><%=sub1.get("CATE_SUB")%></label>
													</div>
												</div>
												<%
													}
												%>
											</div>
										</form>
										<!-- form 끝 ================================================================================================================================== -->
									</div>
									<div class="item" style="text-align: left;">
										<form name="design" id='designs'>
											<div class="ui master checkbox">
												<input type="checkbox" id='design' value='디자인'>
												<label class="h11">디자인</label>
											</div>
											<div class="list">
												<%
													for (Map<String, Object> sub2 : list2) { // 디자인 DB 넣어주기
												%>
												<div class="item design">
													<div class="ui child checkbox">
														<input type="hidden" value="디자인" />
														<input type="checkbox" name="design_List"
															value='<%=sub2.get("CATE_SUB")%>'>
														<label class="h11"><%=sub2.get("CATE_SUB")%></label>
													</div>
												</div>
												<%
													}
												%>
											</div>
										</form>
									</div>
								</div>
							</div>
							<div class="ui container"
								style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">

							</div>
						</div>

					</div>
					<div class="column grid" id='body'
						style="padding-top: 0px; padding-bottom: 0px; padding-left: 10px; padding-right: 0px; width: 85%;">

						<!-- db 공통 코드===================================================================================================================================== -->
						<div class="column"
							style="text-align: left; padding-top: 10px; padding-bottom: 0px; padding-left: 10px; padding-right: 0px;">

						</div>
						<div class="ui container"
							style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">
						</div>
					</div>
					<div class="ui container"
						style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">
					</div>
				</div>
					<div class="ui divider"></div>
					<!---------------------- 수정 20181017 시작 ------------------->
					<div class="ui pagination menu">
						<a class="active item"
							href="javascript:cateHandler(categoryList(),1)">1 </a>
						<a class="item" href="javascript:cateHandler(categoryList(),2,$('.prompt').val())">2
						</a>
						<a class="item" href="javascript:cateHandler(categoryList(),3,$('.prompt').val())">3
						</a>
						<a class="item" href="javascript:cateHandler(categoryList(),4,$('.prompt').val())">4
						</a>
						<a class="item" href="javascript:cateHandler(categoryList(),5,$('.prompt').val())">5
						</a>
						<a class="item" href="javascript:cateHandler(categoryList(),6,$('.prompt').val())">6
						</a>
						<a class="item" href="javascript:cateHandler(categoryList(),7,$('.prompt').val())">7
						</a>
						<a class="item" href="javascript:cateHandler(categoryList(),8,$('.prompt').val())">8
						</a>
						<a class="item" href="javascript:cateHandler(categoryList(),9,$('.prompt').val())">9
						</a>
						<a class="item" href="javascript:cateHandler(categoryList(),10,$('.prompt').val())">10
						</a>
						<a class="item" href="javascript:cateHandler(categoryList(),11,$('.prompt').val())">11</a>
						<a class="item" href="javascript:cateHandler(categoryList(),12,$('.prompt').val())">12
						</a>
						<a class="item" href="javascript:cateHandler(categoryList(),13,$('.prompt').val())">13
						</a>
						<a class="item" href="javascript:cateHandler(categoryList(),14,$('.prompt').val())">14
						</a>
						<a class="item" href="javascript:cateHandler(categoryList(),15,$('.prompt').val())">15
						</a>
						<a class="item" href="javascript:cateHandler(categoryList(),16,$('.prompt').val())">16
						</a>
						<a class="item" href="javascript:cateHandler(categoryList(),17,$('.prompt').val())">17
						</a>
						<a class="item" href="javascript:cateHandler(categoryList(),18,$('.prompt').val())">18
						</a>
						<a class="item" href="javascript:cateHandler(categoryList(),19,$('.prompt').val())">19
						</a>
						<a class="item" href="javascript:cateHandler(categoryList(),20,$('.prompt').val())">20
						</a>
					</div>
					<!---------------------- 수정 20181017 시작 ------------------->
			</div>
		</div>
	</div>
	<!----------------------------------------------------------------------- footer content 시작 -->
	<!-- footer 시작-->
	<footer class="footer">
		<div class="ui inverted segment"
			style="height: 200px; padding: 25px; vertical-align: middle;">
			<jsp:include page="../common/menu/footerMenu.jsp" />
		</div>
	</footer>
	<input type="hidden" class="json" />
	<!-- footer 끝-->
	/************************************************************ 프로젝트 찾기 -
	미팅지역선택 */
	<script type="text/javascript">
   </script>
	<script type="text/javascript">
		cateHandler(categoryList(), 1)
		function setSortFilterValue(obj) {
			var id = obj.id,
				filterset = $("input[id='sort']"),
				all_div = $('.h10');
	
			for (var i = 0; i < all_div.length; i++) {
				all_div[i].className = 'h10';
			}
			var id_value = id.split('-')[1];
			filterset.val(id_value);
			obj.className = 'h10';
			$('#sort').val(1);
	
			submitList();
		}
	
		$('.master.checkbox').find('input').click(function() {
			console.log($(this).prop('checked'));
			if ($(this).prop('checked')) { //체크 됬을 경우 $(this).val() = main category / $(this).prop('checked') = true / 체크 안됬을 경우  $(this).val() = main category / $(this).prop('checked') = false 
				$('.item.' + $(this).prop('id')).find('.child.checkbox').find('input').prop('checked', true);
				var categoryList = [{
						cate_main: $(this).val(),
						cate_sub:null
				}]
				categoryList = JSON.stringify(categoryList);
				cateHandler(categoryList, 1)
			} else {
				$('.item.' + $(this).prop('id')).find('.child.checkbox').find('input').prop('checked', false);
				var categoryList = [{
						cate_main: null,
						cate_sub:null
				}]
				categoryList = JSON.stringify(categoryList);
				cateHandler(categoryList, 1)
			}
		})
		
		function getPageNum(){
			return $('.ui.pagination').find('a').text();
		}
		
		function categoryList() {
			var child = document.querySelectorAll('.child.checkbox');
			var categoryList = [];
			for (ch of child) {
				var cate_main = ch.children[0].value;
				var cate_sub = ch.children[1].value;
				if (ch.children[1].checked) {
					var category = {
						cate_main : cate_main,
						cate_sub : cate_sub
					}
					categoryList.push(category);
				} }
			categoryList = JSON.stringify(categoryList);
			return categoryList;
		}
	
		$('.child.checkbox').find('input').click(function() {
			/* console.log($(this).prop('checked')); */
			if ($(this).prop('checked')) {
				cateHandler(categoryList(), 1)
			} else {
				cateHandler(categoryList(), 1)
			}
		})
	
		//페이지네이션 처리 함수
		function pagination(pageNum) {
		}
		//category에 대한 처리 함수
		function cateHandler(categoryList, pageNum, search) {
			$.ajax({
				url : '../ProjectRest/projectList',
				method : 'post',
				dataType : 'json',
				data : {
					categoryList : categoryList,
					pageNum : pageNum,
					search:search
				},
				success : function(data) {
					$('#body').html('')
					for (d of data) {
						projectAppendHTML(d.CATE_MAIN, d.CATE_SUB, d.PRO_NO, d.PRO_NAME, d.PRO_PRICE, d.PRO_PERIOD, d.PRO_START, d.PRO_END, d.PRO_SKILL, d.PRO_CONTENTS) 
					}
				}
			});
		}
	
		//html로 되어있는 project 넣기
		function projectAppendHTML(cate_main, cate_sub, pro_no, pro_name, pro_price, pro_period, pro_start, pro_end, pro_skill, pro_contents) {
			$('#body').append(`<div class="ui raised segment" style="padding: 20px;">
						<div class="column" style="text-align: left;">
						<h3>
							<a href="<% if (request.getAttribute("kind") != null) {%>./View?pro_no=` + pro_no + `"<% } else { %> /auth/login"<% } %>>` + pro_name + `</a>
						</h3>
						<i class="fa fa-heart inactive-heart" onclick="toggle_interest(this);"
							project-id="41160" style="" title="'관심 프로젝트'에 추가하기"></i>
					</div>
					<div class="column"
						style="text-align: left; padding-top: 10px; padding-bottom: 0px; padding-left: 10px; padding-right: 0px;">
						예상금액 $` + pro_price + `원 &nbsp; | &nbsp;예상기간 ` + pro_period + ` &nbsp; | &nbsp; 등록일자 ` + pro_start + `</div>
					<div class="ui container"
						style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">
						<hr style="" />
					</div>
					<div class="ui two column grid container"
						style="padding: 0px; height: 100px;">
						<div class="column grid"
							style="padding-top: 10px; padding-bottom: 10px; padding-left: 10px; padding-right: 5px; width: 80%; border-right: 1px solid grey; text-align: left">
						<div>` + pro_contents + `</div>
						<span>`+cate_main+`</span><i class="angle right icon"></i><span>`+cate_sub+`</span>
						</div>
						<div class="column grid"
							style="padding-top: 10px; padding-bottom: 10px; padding-left: 10px; padding-right: 5px; width: 20%; font-size: 11px;">
							<div class="ui container"
								style="padding-top: 10px; padding-bottom: 0px; padding-left: 10px; padding-right: 5px;">
								마감날짜 ` + pro_end + `
							</div>
							<div class="ui container"
								style="padding-top: 0px; padding-bottom: 5px; padding-left: 20px; padding-right: 20px;">
								<hr style="" />
							</div>
							<div class="ui container"
								style="padding-top: 0px; padding-bottom: 0px; padding-left: 10px; padding-right: 5px;">
								총 100명 지원</div>
							<div class="ui container"
								style="padding-top: 0px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px;">
								관련기술 ` + pro_skill + `
								<hr style="" />
							</div>
						</div>
					</div>
				</div>`)
		}
		/*******프로젝트 검색 기능************/
	</script>
</body>
</html>

