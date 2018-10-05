<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	List<Map<String, Object>> list1 = (List<Map<String, Object>>) request.getAttribute("ProjectFind1"); //개발
	List<Map<String, Object>> list2 = (List<Map<String, Object>>) request.getAttribute("ProjectFind2"); // 디자인
	//List<Map<String, Object>> list3 =(List<Map<String, Object>>) request.getAttribute("Project"); //프로젝트 전체 목록
	List<Map<String, Object>> list4 = (List<Map<String, Object>>) request.getAttribute("getProject_cateALL"); //프로젝트 전체 목록
	Map<String, Object> map = (Map<String, Object>) request.getAttribute("getAll");
	List<Map<String, Object>> list3 = (List<Map<String, Object>>) map.get("result");
	int count = (int) Math.ceil(Double.parseDouble(map.get("tablesize").toString()) / 10);
	out.print(count);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 찾기</title>
</head>
<body>
	<!----------------------------------------------------------------------- top 시작 -->
	<header class="header">
		<div class="ui">
			<!-- header 시작 -->
			<div class="ui">
				<jsp:include page="../common/menu/headerMenu.jsp" />
			</div>
			<!-- header 종료 -->

			<div class="ui">
				<!-- header와 navigation 여백 -->
			</div>

			<!-- navigation menu 시작 -->
			<div class="ui navigation">
				<jsp:include page="../common/menu/navigationClientMenu.jsp" />
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

		<div class="ui basicspace">
			<!-- login title와 main content 여백 -->
		</div>

		<!-- main 입력 시작-->
		<div class="ui container">
			<div class="content-middle-project">
				<div class="ui two column grid container" style="padding: 00px;">
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
										높은 순</a><br> <a class="h10" id="sort"
										onclick="setSortFilterValue(this)">금액 낮은 순</a><br>
								</div>
								<div class="column"
									style="padding-top: 5px; padding-bottom: 0px; padding-left: 5px; padding-right: 5px;">
									<a class="h10" id="sort" onclick="setSortFilterValue(this)">최신
										등록 순</a><br> <a class="h10" id="sort"
										onclick="setSortFilterValue(this)">마감 임박 순</a><br>
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
										<form name="develope">
											<div class="ui master checkbox">
												<input type="checkbox" id="dev" name="dev">
												<div class="h11">개발</div>
											</div>
											<div class="list">
												<%
													for (Map<String, Object> sub1 : list1) { //개발 DB 넣어주기
												%>
												<%-- <% for(String sb : map.get("sub1") { %> --%>
												<div class="item">
													<div class="ui child checkbox">
														<input type="checkbox" name="dev_List">
														<div class="h11"><%=sub1.get("CATE_SUB")%></div>
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
										<form name="develope">
											<div class="ui master checkbox">
												<input type="checkbox" id="design">
												<div class="h11">디자인</div>
											</div>
											<div class="list">
												<%
													for (Map<String, Object> sub2 : list2) { // 디자인 DB 넣어주기
												%>
												<div class="item">
													<div class="ui child checkbox">
														<input type="checkbox" name="design_List">
														<div class="h11"><%=sub2.get("CATE_SUB")%></div>
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
						<%
							for (Map<String, Object> Project : list3) {
								/*  for(Map<String, Object> Category : list4){		 */
						%>
					</div>
					<div class="column grid"
						style="padding-top: 0px; padding-bottom: 0px; padding-left: 10px; padding-right: 0px; width: 85%;">

						<!-- db 공통 코드===================================================================================================================================== -->
						<div class="ui raised segment" style="padding: 20px;">
							<div class="column" style="text-align: left;">
								<h3><%=Project.get("PRO_NAME")%></h3>
								<i class="fa fa-heart inactive-heart" onclick="toggle_interest(this);" project-id="41160" style="" title="'관심 프로젝트'에 추가하기"></i>
							</div>
							<div class="column"
								style="text-align: left; padding-top: 10px; padding-bottom: 0px; padding-left: 10px; padding-right: 0px;">
								예상금액<%=Project.get("PRO_PRICE")%>원 &nbsp; | &nbsp;예상기간
								<%=Project.get("PRO_PERIOD")%>
								&nbsp; | &nbsp; 등록일자
								<%=Project.get("PRO_START")%></div>
							<div class="ui container"
								style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">
								<hr style="" />
							</div>
							<div class="ui two column grid container"
								style="padding: 0px; height: 100px;">
								<div class="column grid"
									style="padding-top: 10px; padding-bottom: 10px; padding-left: 10px; padding-right: 5px; width: 80%; border-right: 1px solid grey; text-align: left"><%=Project.get("PRO_CONTENTS")%></div>
								<div class="column grid"
									style="padding-top: 10px; padding-bottom: 10px; padding-left: 10px; padding-right: 5px; width: 20%; font-size: 11px;">
									<div class="ui container"
										style="padding-top: 10px; padding-bottom: 0px; padding-left: 10px; padding-right: 5px;">
										마감
										<%=Project.get("PRO_PERIOD")%>전
									</div>
									<div class="ui container"
										style="padding-top: 0px; padding-bottom: 5px; padding-left: 20px; padding-right: 20px;">
										<hr style="" />
									</div>
									<div class="ui container"
										style="padding-top: 0px; padding-bottom: 0px; padding-left: 10px; padding-right: 5px;">
										총 <%=Project.get("SUP_NUM")%>명 지원
									</div>
									<div class="ui container"
										style="padding-top: 0px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px;">
										관련기술
										<%=Project.get("PRO_SKILL")%>
										<hr style="" />
									</div>
								</div>
							</div>
						</div>
						<div class="column"
							style="text-align: left; padding-top: 10px; padding-bottom: 0px; padding-left: 10px; padding-right: 0px;">

						</div>
						<%
							} //Project END
								// }//CATEGORY END
						%>
						<div class="ui container"
							style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">
						</div>
					</div>
					<div class="ui container"
						style="padding-top: 0px; padding-bottom: 10px; padding-left: 5px; padding-right: 5px;">
					</div>
				</div>
			</div>
			<div class="ui pagination menu">
				<%
					for (int i = 1; i < count + 1; i++) {
				%>
				<a class="active item" href="?pagenum=<%=i%>"> <%=i%>
				</a>
				<%
					}
				%>
			</div>
		</div>
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
	<!-- footer 끝-->
	/************************************************************ 프로젝트 찾기 -
	미팅지역선택 */
	<script type="text/javascript">
		/************************************************************ 프로젝트 찾기 - 프로젝트  카테고리  */
		$('.list .master.checkbox')
			.checkbox({
				// check all children
				onChecked : function() {
					var $childCheckbox = $(this).closest('.checkbox').siblings('.list').find('.checkbox');
					$childCheckbox.checkbox('check');
				},
				// uncheck all children
				onUnchecked : function() {
					var $childCheckbox = $(this).closest('.checkbox').siblings('.list').find('.checkbox');
					$childCheckbox.checkbox('uncheck');
				}
			});
		$('.list .child.checkbox')
			.checkbox({
				// Fire on load to set parent value
				fireOnInit : true,
				// Change parent state on each child checkbox change
				onChange : function() {
					var $listGroup = $(this).closest('.list'),
						$parentCheckbox = $listGroup.closest('.item').children('.checkbox'),
						$checkbox = $listGroup.find('.checkbox'),
						allChecked = true,
						allUnchecked = true;
					// check to see if all other siblings are checked or unchecked
					$checkbox.each(function() {
						if ($(this).checkbox('is checked')) {
							allUnchecked = false;
						} else {
							allChecked = false;
						}
					});
					// set parent checkbox state, but dont trigger its onChange callback
					if (allChecked) {
						$parentCheckbox.checkbox('set checked');
					} else if (allUnchecked) {
						$parentCheckbox.checkbox('set unchecked');
					} else {
						$parentCheckbox.checkbox('set indeterminate');
					}
				}
			});
			/************************************************************ 프로젝트 찾기 - 프로젝트  카테고리  */
			//프로젝트 카테고리 기능 구현
	</script>
	<script type="text/javascript">
		/*금액 정렬*/
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
			/* console.log($(this).prop('checked')); */
			if ($(this).prop('checked')) {
				$('.item.' + $(this).prop('id')).find('.child.checkbox').find('input').prop('checked', true);
				alert($(this).val() + " : " + $(this).prop('checked'));
			} else {
				$('.item.' + $(this).prop('id')).find('.child.checkbox').find('input').prop('checked', false);
				alert($(this).val() + " : " + $(this).prop('checked'));
			}
		})
	
		$('.child.checkbox').find('input').click(function() {
			/* console.log($(this).prop('checked')); */
			if ($(this).prop('checked')) {
				alert($(this).val() + " : " + $(this).prop('checked'));
			} else {
				alert($(this).val() + " : " + $(this).prop('checked'));
			}
		})
	</script>
</body>
</html>
