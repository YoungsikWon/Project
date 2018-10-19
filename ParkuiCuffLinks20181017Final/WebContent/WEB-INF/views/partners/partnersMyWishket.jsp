<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%
	List<Map<String, Object>> ing = (List<Map<String, Object>>) request.getAttribute("getStateProject_ing");
	List<Map<String, Object>> interest = (List<Map<String, Object>>) request.getAttribute("getStateProject_interest");
	List<Map<String, Object>> support = (List<Map<String, Object>>) request.getAttribute("getStateProject_support");
	List<Map<String, Object>> complete = (List<Map<String, Object>>) request.getAttribute("getStateProject_complete");

	int money = 0;
	for (Map<String, Object> map : complete) {
		int m = Integer.parseInt(map.get("PRO_PRICE").toString());
		money += m;
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>마이 커프링크</title>
</head>
<body>

	<!----------------------------------------------------------------------- top 시작 -->
	<header class="header">
		<div class="ui">
			<!-- header 시작 -->
			<div class="ui">
				<jsp:include page="../common/menu/PartnersHeaderMenu.jsp" />
			</div>
			<!-- header 종료 -->
		</div>
	</header>
	<!----------------------------------------------------------------------- top 끝 -->

	<script type="text/javascript">
		function news(title) {
			var Json2 = "";

			$.ajax({

				url : "../../../News/callNews.jsp",
				method : "post",
				data : {
					"title" : title
				},
				success : function(Data) {

					$.ajax({

						url : "../../../News/pagination.jsp",
						method : "post",
						data : {
							"Json2" : Data
						},
						success : function(data) {

							$("#News").html(data);

						},
						error : function(xhrObject) {

							alert(xhrObject.responseText);
						}

					});
				},
				error : function(xhrObject) {
					alert(xhrObject.responseText);
				}

			});
		}
		$(document).ready(function() {

			news("자바");

			$("#search").keydown(function(key) {

				if (key.keyCode == 13) {//키가 13이면 실행 (엔터는 13)

					news($("#search").val());
				}

			});
		});
	</script>

	<div class="ui basicspace">
		<!-- navigation menu와 여백 -->
	</div>

	<!--======================================================================================-->
	<!----------------------------------------------------------------------- main content 시작 -->

	<div class="ui container">

		<!-- main 입력 시작-->

		<div class="ui two column grid container" style="height: auto">
			<div class="ui column" style="padding-left: 0px; padding-top: 0px; padding-bottom: 0px; width: 80%;">
				<div id="partnersback" class="ui segment container" style="padding: 20px; padding-bottom: 20px; left: 0px; border: 1px solid #dedede;">
					<div style="padding-bottom: 0px;">
						<h3 style="text-align: left">마이 커프링크</h3>
					</div>
				</div>
				<!-- 상단 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
				<div class="ui segment container" style="padding: 20px; padding-bottom: 20px; left: 0px; border: 1px solid #dedede; background-color: #E6E6E6;">
					<div class="ui three column grid container">
						<div class="column" style="padding-top: 30px; width: 50%;">
							<h4 style="text-align: left">뉴스센터</h4>
						</div>
						<div class="column" style="padding-bottom: 00px; width: 50%; padding-right: 0;text-align: right;">
							<div class="ui left icon input" style="padding: 10px; padding-right: 0; width: 60%;" align="right">
								<input id="search" name="search" type="text" placeholder="검색" size="40px" style="text-align: right"> <i class="id badge icon"></i>
							</div>
						</div>

					</div>
					<div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px;">
						<hr class="garo" style="" />
					</div>

					<div id="News" style="background-color: #fff;"></div>
				</div>
				<!-- 중간 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
				<div class="ui segment container" style="padding: 20px; margin-bottom: 50px; padding-bottom: 20px; left: 0px; border: 1px solid #dedede; background-color: #E6E6E6; ">
					<div class="ui three column grid container">
						<div class="column" style="padding-bottom: 20px; width: 50%;">
							<h3 style="text-align: left">내 프로젝트</h3>
						</div>
						<div class="column" style="padding-left: 0px; padding-right: 0px; padding-top: 25px; padding-bottom: 20px; text-align: right; width: 40%;">
							<!-- 우측여백 -->
						</div>
						<div class="column" style="padding-left: 0px; padding-right: 0px; padding-top: 20px; padding-bottom: 20px; text-align: right; width: 10%;">
							<!-- 우측여백 -->
						</div>
					</div>
					<!-- <div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px;">
						<hr class="garo" style="" />
					</div> -->
					<div style="padding: 13px;"></div>
					<div class="ui" style="position: relative;padding-left: 5px; padding-right: 5px; padding-top: 0px; padding-bottom: 0px; text-align: left;">
						<div class="ui column segment" style="padding-top: 10px;">
							<!-- *********************************************************************************************************************************************20181013 수정요청사항 -->
							<div class="ui blue top left attached label" style="position: absolute; top: -10px;left: -10px;">
							
								<a href="../manage/partnersInterestProject">>>관심 중<<</a>
							
							</div>
							<div class="ui three column grid container" style="padding-left: 0px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; text-align: center;">
								<!-- *******************************************************************************************************20181014 삭제요청 -->
								<!-- <h3 class="ui  header">관심 프로젝트</h3> -->
								<!-- *******************************************************************************************************20181014 삭제요청 -->
								<table class="ui very basic table" style="padding-bottom: 20px;">
									<thead>
										<tr style="background-color: #dedede !important;">
											<th style="padding-top: 10px; padding-left: 10px;">프로젝트 제목</th>
											<th style="padding-top: 10px; padding-left: 10px; text-align:center">예상금액</th>
											<th style="padding-top: 10px; padding-left: 10px; text-align:center">예상기간</th>
											<th style="padding-top: 10px; padding-left: 10px; text-align:center">마감일자</th>
										</tr>
									</thead>
									<tbody>
										<%
											for (int i = 0; i < interest.size(); i++) {
										%>
										<tr style="background-color: #CEE3F6 !important;">
											<td style="padding-top: 10px; padding-left: 10px;"><a href=""><%=interest.get(i).get("PRO_NAME")%></a></td>
											<td style="padding-top: 10px; padding-left: 10px; text-align:center"><%=interest.get(i).get("PRO_PRICE")%></td>
											<td style="padding-top: 10px; padding-left: 10px; text-align:center"><%=interest.get(i).get("PRO_PERIOD")%></td>
											<td style="padding-top: 10px; padding-left: 10px; text-align:center"><%=interest.get(i).get("PRO_END")%></td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div style="padding: 13px;"></div>
					<div class="ui" style="position: relative;padding-left: 5px; padding-right: 5px; padding-top: 0px; padding-bottom: 0px; text-align: left;">
						<div class="ui column segment" style="padding-top: 10px;">
							<div class="ui orange top left attached label" style="position: absolute; top: -10px;left: -10px;">
								
								<a href="../manage/partnersSupportHistory">>>지원 중<<</a>
								
							</div>
							<div class="ui four column grid container" style="padding-left: 0px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; text-align: center;">
								<!-- *******************************************************************************************************20181014 삭제요청 -->
								<!-- <h3 class="ui  header">지원 내역</h3> -->
								<!-- *******************************************************************************************************20181014 삭제요청 -->
								<table class="ui very basic table">
									<thead>
										<tr style="background-color: #dedede !important;">
											<th style="padding-top: 10px; padding-left: 10px;">프로젝트 제목</th>
											<th style="padding-top: 10px; padding-left: 10px; text-align:center">지원금액</th>
											<th style="padding-top: 10px; padding-left: 10px; text-align:center">지원기간</th>
											<th style="padding-top: 10px; padding-left: 10px; text-align:center">제출일자</th>
										</tr>
									</thead>
									<tbody>
										<%
											for (int i = 0; i < support.size(); i++) {
										%>
										<tr style="background-color: #F6CECE !important;">
											<td style="padding-top: 10px; padding-left: 10px;"><a href=""><%=support.get(i).get("PRO_NAME")%> </a></td>
											<td style="padding-top: 10px; padding-left: 10px; text-align:center"><%=support.get(i).get("PRO_PRICE")%></td>
											<td style="padding-top: 10px; padding-left: 10px; text-align:center"><%=support.get(i).get("PRO_PERIOD")%></td>
											<td style="padding-top: 10px; padding-left: 10px; text-align:center"><%=support.get(i).get("PRO_END")%></td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
								<div class="column" style="padding-left: 20px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; text-align: center; width: 20%">
									<!-- 마감일자 -->
								</div>
								<div class="column" style="padding-left: 20px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; text-align: center; width: 20%">
									<!-- 지원자 수 -->
								</div>
								<div class="column" style="padding-left: 20px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; text-align: center; width: 20%">
									<!-- 도구 -->
								</div>
								<div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px;"></div>
							</div>
						</div>
					</div>
					<div style="padding: 13px;"></div>
					<div class="ui" style="position: relative;padding-left: 5px; padding-right: 5px; padding-top: 0px; padding-bottom: 0px; text-align: left;">
						<div class="ui column segment" style="padding-top: 10px;">
							<div class="ui green top left attached label" style="position: absolute; top: -10px;left: -10px;">
							
								<a href="../manage/partnersProject_ing">>>진행 중<<</a>
							
							</div>
							<div class="ui six column grid container" style="padding-left: 0px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; text-align: center;">
								<!-- *******************************************************************************************************20181014 삭제요청 -->
								<!-- <h3 class="ui header">프로젝트 진행중</h3> -->
								<!-- *******************************************************************************************************20181014 삭제요청 -->
								<table class="ui very basic table" >
									<thead>
										<tr style="background-color: #dedede !important;">
											<th style="padding-top: 10px; padding-left: 10px;">프로젝트 제목</th>
											<th style="padding-top: 10px; padding-left: 10px; text-align:center">금액</th>
											<th style="padding-top: 10px; padding-left: 10px; text-align:center">기간</th>
											<th style="padding-top: 10px; padding-left: 10px; text-align:center">마감기한</th>
										</tr>
									</thead>
									<tbody>
										<%
											for (int i = 0; i < ing.size(); i++) {
										%>
										<tr style="background-color: #D8F6CE !important;">
											<td style="padding-top: 10px; padding-left: 10px;"><a href=""><%=ing.get(i).get("PRO_NAME")%></a></td>
											<td style="padding-top: 10px; padding-left: 10px; text-align:center"><%=ing.get(i).get("PRO_PRICE")%></td>
											<td style="padding-top: 10px; padding-left: 10px; text-align:center"><%=ing.get(i).get("PRO_PERIOD")%></td>
											<td style="padding-top: 10px; padding-left: 10px; text-align:center"><%=ing.get(i).get("PRO_END")%></td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
								<div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px;">
									<hr class="garo" style="" />
								</div>

								<div class="column" style="padding-left: 20px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; text-align: center; width: 20%">
									<!-- 파트너 -->
								</div>
								<div class="column" style="padding-left: 20px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; text-align: center; width: 20%">
									<!-- 금액 수 -->
								</div>
								<div class="column" style="padding-left: 20px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; text-align: center; width: 20%">
									<!-- 기간 -->
								</div>
								<div class="column" style="padding-left: 20px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; text-align: center; width: 20%">
									<!-- 남은기간 -->
								</div>
								<div class="column" style="padding-left: 20px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; text-align: center; width: 20%">
									<!-- 도구 -->
								</div>
								<div class="ui container" style="padding-top: 0px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 우측메뉴 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
			<div class="ui column" style="width: 20%; padding-top: 0px; padding-left: 0px; padding-right: 0px">

				<!-- 로그인 정보 =================================================================================-->
				<div id="partnersback" class="ui segment">
					<jsp:include page="../auth/PartnersLoginOk.jsp" />
				</div>
				<!-- 로그인 정보 =================================================================================-->

				<div id="partnersback" class="ui fluid vertical menu" style="padding-left: 10px; padding-right: 10px; padding-bottom: 00px; text-align: center;">
					<div style="padding-top: 10px; text-align: left;">
						<h5>위시캣 히스토리</h5>
					</div>
					<div class="ui container" style="padding-top: 00px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px; width: 100%;">
						<hr class="dotted" style="width: 100%;" />
					</div>
					<div class="column" style="">
						<div class="ui two column grid">
							<div class="column h15" style="text-align: left; padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 0px; width: 60%">
								<b>지원한 프로젝트 </b>
							</div>
							<div class="column h15" style="padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px; text-align: right; width: 40%;">
								<b><%=support.size()%> 건</b>
							</div>
							<div class="column h15" style="text-align: left; padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 0px; width: 60%">
								<b>계약한 프로젝트</b>
							</div>
							<div class="column h15" style="padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px; text-align: right; width: 40%;">
								<b><%=ing.size()%> 건</b>
							</div>
							<div class="column h15" style="text-align: left; padding-top: 10px; padding-bottom: 10px; padding-left: 30px; padding-right: 0px; width: 60%">
								<b>완료한 프로젝트</b>
							</div>
							<div class="column h15" style="padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px; text-align: right; width: 40%;">
								<%=complete.size()%>건
							</div>

						</div>
						<div class="ui container" style="padding-top: 20px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px;">
							<hr class="dotted" style="" />
						</div>
						<div class="ui two column grid">
							<div class="column h15" style="text-align: left; padding-top: 10px; padding-bottom: 0px; padding-left: 20px; padding-right: 0px; width: 60%">
								<b>누적 완료 금액</b>
							</div>
							<div class="column h15" style="padding-top: 0px; padding-bottom: 0px; padding-left: 20px; padding-right: 20px; text-align: right; width: 40%;"></div>
							<div class="column h15" style="text-align: left; padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 0px; width: 60%">
								<b>￦</b>
							</div>
							<div class="column h15" style="padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px; text-align: right; width: 40%;">
								<b><%=money%> 원</b>
							</div>
						</div>
					</div>
					<div class="ui container" style="padding-top: 00px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px; width: 100%;">
						<hr class="dotted" style="width: 100%;" />
					</div>
				</div>
				<div id="partnersback" class="ui fluid vertical menu" style="padding-left: 10px; padding-right: 10px; padding-bottom: 00px; text-align: center;">
					<div style="padding-top: 10px; text-align: left;">
						<h5>새로운 소식</h5>
					</div>
					<div class="ui container" style="padding-top: 00px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px; width: 100%;">
						<hr class="dotted" style="width: 100%;" />
					</div>
					<div class="column" style="height: 100px;">
						<div class="ui container">새로운 소식이 없습니다.</div>
					</div>
					<div class="ui container" style="padding-top: 00px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px; width: 100%;">
						<hr class="dotted" style="width: 100%;" />
					</div>
				</div>
			</div>
		</div>

		<!-- main 입력 끝-->

	</div>

	<!----------------------------------------------------------------------- main content 끝 --->
	<!--======================================================================================-->

	<div class="ui basicspace">
		<!-- login title와 main content 여백 -->
	</div>

	<!----------------------------------------------------------------------- footer content 시작 -->
	<!-- footer 시작-->
	<footer class="footer">
		<div class="ui inverted segment">
			<jsp:include page="../common/menu/footerMenu.jsp" />
		</div>
	</footer>
	<!-- footer 끝-->
	<!----------------------------------------------------------------------- footer content 끝 -->
</body>
</html>