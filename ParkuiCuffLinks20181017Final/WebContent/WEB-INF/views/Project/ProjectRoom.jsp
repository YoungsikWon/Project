<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Map<String, Map> map = (Map<String, Map>) request.getAttribute("Project");
	//Map<String, Object> view = (Map<String, Object>) request.getAttribute("view");// 프로젝트 상세보기 목록 뿌리기
	Map<String, Object> p1 = map.get("P_Project"); // 클라이언트  / 계약률, 진행중인 프로젝트, 완료한 프로젝트를 넣어줄 것.
	Map<String, Object> p2 = map.get("Partners_aboutme"); // 클라이언트  소개글
	int Pronumber = (int) request.getAttribute("Pronumber");
	Map<String, Object> pro = map.get("Project"); // 프로젝트 상세보기 목록 뿌리기
	Map<String, Object> view = (Map<String, Object>) request.getAttribute("view");
	Cookie[] cs = request.getCookies();
	HttpSession infoSession = request.getSession();
	Map<String, Object> info = null;
	int login_cnt = 0;
	for (int i = 0; i < cs.length; i++) {

		String cName = cs[i].getName();
		if ("id".equals(cName)) {

			info = (Map<String, Object>) infoSession.getAttribute(cs[i].getValue());

		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/ui.jsp" />
<meta charset="UTF-8">
<title>프로젝트 상세페이지</title>
<link rel="stylesheet" href="../css/cuffLink.css" />
<script id="dsq-count-scr" src="//cufflink-1.disqus.com/count.js" async></script>
<link rel="stylesheet" href="../css/login.css" />
</head>
<body>
	<form id="f_attention" action="/project/projectAttention">
		<input type="hidden" name="s_email" value="<%=info.get("S_EMAIL")%>">
		<input type="hidden" name="pro_no" value=<%=Pronumber%>>
		<input type="hidden" name="su_money" value=<%=pro.get("PRO_PRICE")%>>
		<input type="hidden" name="su_state" value="관심">
	</form>
	<form id="f_jiwon" action="/project/projectAttention">
		<input type="hidden" name="s_email" value="<%=info.get("S_EMAIL")%>">
		<input type="hidden" name="pro_no" value=<%=Pronumber%>>
		<input type="hidden" name="su_money" value=<%=pro.get("PRO_PRICE")%>>
		<input type="hidden" name="su_state" value="지원">
	</form>
	<form id="f_cancel">
		<input type="hidden" name="s_email" value="<%=info.get("S_EMAIL")%>">
		<input type="hidden" name="pro_no" value=<%=Pronumber%>>
	</form>
	<!----------------------------------------------------------------------- top 시작 -->
	<header class="header">
		<div class="ui">
			<!-- header 시작 -->
			<div class="ui">
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
			</div>
			<!-- header 종료 -->

			<div class="ui">
				<!-- header와 navigation 여백 -->
			</div>

			<!-- navigation menu 종료-->
		</div>
	</header>
	<!----------------------------------------------------------------------- top 끝 -->

	<div class="ui basicspace">
		<!-- navigation menu와 여백 -->
	</div>

	<!--======================================================================================-->
	<!----------------------------------------------------------------------- main content 시작 -->

	<div class="ui container">
		<div class="column" style="text-align: left; margin-bottom: 50px;">
			<div class="ui two column grid container"
				style="min-height: 860px; height: auto; margin-bottom: 50px;">
				<div class="ui column"
					style="padding-left: 0px; padding-top: 0px; padding-bottom: 0px; width: 80%; margin-bottom: 50px;">
					<div class="ui container" style="margin-top: 14px;">
						<div class="content-header">
							<div class="column" style="text-align: left">
								<h3>
									<i class="tag icon"></i>
									<%=view.get("PRO_NAME")%>
								</h3>
								<h3 class="ui horizontal divider header"
									style="margin-bottom: 20px;]">
									<i class="bar chart icon"></i>
									<%=view.get("PRO_SKILL")%>
								</h3>
								<table class="ui select able celled table">
									<thead style="align-content: center;">
										<tr>
											<th>
												<i class="won sign icon"></i>
												&nbsp;&nbsp;예상금액
											</th>
											<th><%=view.get("PRO_PRICE")%>원
											</th>
											<th>
												<i class="clock outline icon"></i>
												&nbsp;&nbsp;예상기간
											</th>
											<th><%=view.get("PRO_PERIOD")%></th>
											<th>
												<i class="pencil alternate icon"></i>
												&nbsp;&nbsp;모집마감
											</th>
											<th><%=view.get("PRO_END")%></th>
										</tr>
									</thead>
								</table>
								<p></p>
								<table class="ui select able celled table"
									style="border-left-width: 0px; border-right-width: 0px;">
									<thead style="align-content: center;">
										<tr>
											<th>기획상태</th>
											<td><%=view.get("PRO_PLAN")%></td>
											<th>매니징경험</th>
											<td><%=view.get("PRO_MANAGEMENT")%></td>
											<th>등록일자</th>
											<td><%=view.get("PRO_START")%></td>
										</tr>
										<tr>
											<th>예상시작일</th>
											<td><%=view.get("PRO_START")%></td>
											<th>필요기술</th>
											<td><%=view.get("PRO_SKILL")%></td>
											<th>위치</th>
											<td><%=view.get("PRO_ADDR")%></td>
										</tr>
									</thead>
								</table>

								<!-- form 끝 ================================================================================================================================== -->
							</div>
						</div>
					</div>
					<!-- 상단 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
					<div class="ui column segment"
						style="padding-top: 10px; margin-top: 10px; margin-bottom: 10px;">
						<div class="column"
							style="padding-left: 0px; padding-right: 0px; padding-top: 10px; padding-bottom: 10px; text-align: right; width: 10%;">
							<!-- 우측여백 -->
						</div>

						<div class="ui four column grid container"
							style="text-align: left; padding-left: 14px;">
							<div class="column" style="width: 50%; padding-left: 0px;">
								<h4 style="text-align: left">프로젝트 내용</h4>
							</div>
							<p style="margin-bottom: 10px;"></p>
							<div class="column"
								style="padding-left: 0px; padding-right: 0px; padding-top: 10px; padding-bottom: 20px; text-align: right; width: 10%;">
								<!-- 우측여백 -->
							</div>
							<%=view.get("PRO_CONTENTS")%>
						</div>
						<div class="column"
							style="padding-left: 0px; padding-right: 0px; padding-top: 15px; padding-bottom: 15px; text-align: right; width: 10%;">
							<!-- 우측여백 -->
						</div>
					</div>
					<div class="ui segment container"
						style="padding-left: 30px; padding-bottom: 20px; left: 0px; border: 1px solid #dedede;">
						<div class="ui"
							style="padding-left: 10px; padding-right: 10px; padding-top: 0px; padding-bottom: 0px; text-align: left;">
						</div>
						<div style="padding: 5px;"></div>
						<!--  프로젝트 댓글 -->
						<div class="column" style="padding-bottom: 20px; width: 50%;">
							<h4 style="text-align: left">프로젝트 문의</h4>

						</div>
						<div id="disqus_thread"></div>
						<script>
                     
                        var disqus_config = function() {
                           this.page.url = PAGE_URL; // Replace PAGE_URL with your page's canonical URL variable
                           this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
                        };
                     
                        (function() { // DON'T EDIT BELOW THIS LINE
                           var d = document,
                              s = d.createElement('script');
                           s.src = 'https://cufflink-1.disqus.com/embed.js';
                           s.setAttribute('data-timestamp', +new Date());
                           (d.head || d.body).appendChild(s);
                        })();
                     </script>
						<noscript>
							Please enable JavaScript to view the
							<a href="https://disqus.com/?ref_noscript">comments powered
								by Disqus.</a>
						</noscript>
					</div>
				</div>
				<div class="ui column"
					style="width: 20%; padding-top: 0px; padding-left: 0px; padding-right: 0px">
					<div class="ui fluid vertical menu"
						style="padding-left: 10px; padding-right: 10px; padding-bottom: 10px; text-align: center; margin-top: 14px; padding-top: 10px;">
						<!-- 수정시작 -->
						<%
							if ("클라이언트".equals(request.getAttribute("kind").toString())) {
						%>
						<div class="ui orange labeled submit icon button"
							onclick="location.href='/project/deleteProject?pro_no=<%=Pronumber%>'" style="">
							<i class="icon edit"></i>
							<a style="color: white;">프로젝트 삭제</a>
						</div>
						<p></p>
						<div class="ui orange labeled submit icon button"
							onclick="" style="">
							<i class="icon edit"></i>
							<a style="color: white;">프로젝트 수정</a>
						</div>
						<%
							} else {
						%>
						<div class="ui orange labeled submit icon button"
							onclick="attention()" style="">
							<i class="icon edit"></i>
							<a style="color: white;">관심프로젝트 추가</a>
						</div>
						<p></p>
						<div class="ui orange labeled submit icon button"
							onclick="jiwon()" style="">
							<i class="icon edit"></i>
							<a style="color: white;">프로젝트 지원</a>
						</div>
						<%
							}
						%>
						<!-- 수정 끝 -->

					</div>

					<div class="ui fluid vertical menu"
						style="padding-left: 10px; padding-right: 10px; padding-bottom: 10px; text-align: center">
						<div style="padding-top: 10px; text-align: left;">
							<div class="ui card">
								<div class="image">
								<!-- 수정시작 -->
									<img
										src="/image/partnersImg/<%if (p2.get("C_FILE") != null) {%><%=p2.get("C_FILE")%><%} else {%>partners16.png<%}%>">
								<!-- 수정끝 -->
								</div>
								<div class="content">
									<a class="header">
										<font style="vertical-align: inherit;">
											<font style="vertical-align: inherit;"><%=p2.get("C_NAME")%></font>
										</font>
									</a>

									<div class="description">
										<font style="vertical-align: inherit;">
											<font style="vertical-align: inherit;"><%=p2.get("C_ABOUTME")%></font>
										</font>
									</div>
								</div>
								<div class="ui container"
									style="padding-top: 00px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px; width: 100%;">
									<hr class="dotted" style="width: 90%;" />
								</div>
								<div class="column"
									style="padding-left: 5px; padding-right: 5px; padding-bottom: 10px;">
									<div class="ui two column grid">
										<div class="column h15"
											style="text-align: left; padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 0px; width: 60%">
											<strong>계약한 프로젝트</strong>
										</div>
										<div class="column h15"
											style="padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px; text-align: right; width: 40%;">
											<b><%=p1.get("A")%>
												건
											</b>
										</div>
										<div class="column h15"
											style="text-align: left; padding-top: 10px; padding-bottom: 10px; padding-left: 30px; padding-right: 0px; width: 60%">
											<strong>계약률</strong>
										</div>
										<div class="column h15"
											style="padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px; text-align: right; width: 40%;">
											<%=p1.get("D")%>%
										</div>
										<div class="column h15"
											style="text-align: left; padding-top: 10px; padding-bottom: 10px; padding-left: 30px; padding-right: 0px; width: 60%">
											<strong>진행중인 프로젝트</strong>
										</div>
										<div class="column h15"
											style="padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px; text-align: right; width: 40%;">
											<%=p1.get("B")%>
											건
										</div>
										<div class="column h15"
											style="text-align: left; padding-top: 10px; padding-bottom: 10px; padding-left: 30px; padding-right: 0px; width: 60%">
											<strong>완료한 프로젝트</strong>
										</div>
										<div class="column h15"
											style="padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px; text-align: right; width: 40%;">
											<%=p1.get("C")%>
											건
										</div>
									</div>
								</div>
								<div class="ui container"
									style="padding-top: 00px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px; width: 100%;">
									<hr class="dotted" style="width: 90%;" />
								</div>
							</div>
						</div>
					</div>

					<!-- main 입력 끝-->

				</div>
				<!-- 중간 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

			</div>
		</div>
	</div>
	<footer class="footer">
		<div class="ui inverted segment" style="margin-top: 50px;">
			<jsp:include page="../common/menu/footerMenu.jsp" />
		</div>
	</footer>
	<!-- 우측메뉴 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
	<!-- 수정시작 -->
	<script>
		function attention(){
			$('#f_attention').submit();
		}
		function jiwon(){
			$('#f_jiwon').submit();
		}
		function deleteProject(){
		}
	</script>
	<!-- 수정끝 -->

	<!----------------------------------------------------------------------- main content 끝 --->
	<!--======================================================================================-->


	<!----------------------------------------------------------------------- footer content 시작 -->
	<!-- footer 시작-->

	<!-- footer 끝-->
	<!----------------------------------------------------------------------- footer content 끝 -->
</body>
</html>