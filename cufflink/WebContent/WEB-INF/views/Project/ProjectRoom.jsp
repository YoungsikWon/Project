<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Map<String, Map> map = (Map<String, Map>) request.getAttribute("Project");
	Map<String, Object> view = (Map<String, Object>) request.getAttribute("view");// 프로젝트 상세보기 목록 뿌리기
	Map<String, Object> p1 = map.get("P_Project"); // 클라이언트  / 계약률, 진행중인 프로젝트, 완료한 프로젝트를 넣어줄 것.
	Map<String, Object> p2 = map.get("Partners_aboutme"); // 클라이언트  소개글
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

	<div class="ui basicspace">
		<!-- navigation menu와 여백 -->
	</div>

	<!--======================================================================================-->
	<!----------------------------------------------------------------------- main content 시작 -->

	<div class="ui container">
		<div class="column" style="text-align: left">
			<h3 class="content-text" style="text-align: left;">프로젝트</h3>
			<div class="ui two column grid container" style="height: 860px">
				<div class="ui column"
					style="padding-left: 0px; padding-top: 0px; padding-bottom: 0px; width: 80%;">
					<div class="ui container">
						<div class="content-header">
							<div class="ui two column grid container">
								<div class="column" style="text-align: left">

									<div class="ui container"
										style="padding-top: 00px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px; width: 200%;">
										<hr class="dotted" style="width: 218%;" />
									</div>
									<h4 class="ui horizontal divider header">
										<i class="tag icon"></i> <%=view.get("PRO_NAME")%>
									</h4>
									<h4 class="ui horizontal divider header">
										<i class="bar chart icon"></i>  <%="PRO_SKILL"%>
									</h4>
									<table class="ui definition table">
										<tbody>
											<tr>
												<td class="three wide column">금액</td>
												<td>$ <%=view.get("PRO_PRICE")%>원</td>
											</tr>
											<tr>
												<td>등록일</td>
												<td><%=view.get("PRO_START")%></td>
											</tr>
											<tr>
												<td>마감일</td>
												<td><%=view.get("PRO_END")%></td>
											</tr>
											<tr>
												<td>기획</td>
												<td><%=view.get("PRO_PLAN")%></td>
											</tr>
											<tr>
												<td>위치</td>
												<td><%=view.get("PRO_ADDR")%></td>
											</tr>
										</tbody>
									</table>


									<!-- form 끝 ================================================================================================================================== -->
								</div>
							</div>
						</div>
					</div>
					<!-- 상단 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
					<div class="ui column segment" style="padding-top: 10px;">
						<div class="column"
							style="padding-left: 0px; padding-right: 0px; padding-top: 10px; padding-bottom: 10px; text-align: right; width: 10%;">
							<!-- 우측여백 -->
						</div>

						<div class="ui four column grid container">
							<div class="column" style="padding-bottom: 20px; width: 50%;">
								<h3 style="text-align: left">프로젝트 내용</h3>

							</div>
							<div class="column"
								style="padding-left: 0px; padding-right: 0px; padding-top: 20px; padding-bottom: 20px; text-align: right; width: 10%;">
								<!-- 우측여백 -->
							</div>
							<p>
							<h5><%=view.get("PRO_CONTENTS")%></h5>
							</p>
						</div>
						<div class="column"
							style="padding-left: 0px; padding-right: 0px; padding-top: 15px; padding-bottom: 15px; text-align: right; width: 10%;">
							<!-- 우측여백 -->
						</div>
						</table>
					</div>
				</div>
				<div class="ui column"
					style="width: 20%; padding-top: 0px; padding-left: 0px; padding-right: 0px">
					<div class="ui black labeled submit icon button"
						onclick="location.href='/projectSubmitted'"
						style="padding-left: 10px">
						<i class="icon edit"></i> <a>관심프로젝트 추가</a>
					</div>


					<div class="ui fluid vertical menu"
						style="padding-left: 10px; padding-right: 10px; padding-bottom: 00px; text-align: center">
						<div style="padding-top: 10px; text-align: left;">
							<div class="ui card">
								<div class="image">
									<img src="/image/user.jpg">
								</div>
								<div class="content">
									<a class="header"><font style="vertical-align: inherit;"><font
											style="vertical-align: inherit;"><%=p2.get("C_NAME")%></font></font></a>

									<div class="description">
										<font style="vertical-align: inherit;"><font
											style="vertical-align: inherit;"><%=p2.get("C_ABOUTME")%></font></font>
									</div>
								</div>
								<div class="ui container"
									style="padding-top: 00px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px; width: 100%;">
									<hr class="dotted" style="width: 100%;" />
								</div>
								<div class="column" style="">
									<div class="ui two column grid">
										<div class="column h15"
											style="text-align: left; padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 0px; width: 60%">
											<b>계약한 프로젝트</b>
										</div>
										<div class="column h15"
											style="padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px; text-align: right; width: 40%;">
											<b><%=p1.get("A")%> 건</b>
										</div>
										<div class="column h15"
											style="text-align: left; padding-top: 10px; padding-bottom: 10px; padding-left: 30px; padding-right: 0px; width: 60%">
											계약률</div>
										<div class="column h15"
											style="padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px; text-align: right; width: 40%;">
											<%=p1.get("D")%>%
										</div>
										<div class="column h15"
											style="text-align: left; padding-top: 10px; padding-bottom: 10px; padding-left: 30px; padding-right: 0px; width: 60%">
											진행중인 프로젝트</div>
										<div class="column h15"
											style="padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px; text-align: right; width: 40%;">
											<%=p1.get("B")%>
											건
										</div>
										<div class="column h15"
											style="text-align: left; padding-top: 10px; padding-bottom: 10px; padding-left: 30px; padding-right: 0px; width: 60%">
											완료한 프로젝트</div>
										<div class="column h15"
											style="padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px; text-align: right; width: 40%;">
											<%=p1.get("C")%>
											건
										</div>
									</div>
								</div>
								<div class="ui container"
									style="padding-top: 00px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px; width: 100%;">
									<hr class="dotted" style="width: 100%;" />
								</div>
							</div>
						</div>
					</div>

					<!-- main 입력 끝-->

				</div>
				<!-- 중간 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
				<div class="ui segment container"
					style="padding: 20px; padding-bottom: 20px; left: 0px; border: 1px solid #dedede;">

					<div class="ui container"
						style="padding-top: 0px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px;">
						<hr class="garo" style="" />
					</div>



					<div style="padding: 5px;"></div>
					<div class="ui"
						style="padding-left: 10px; padding-right: 10px; padding-top: 0px; padding-bottom: 0px; text-align: left;">
					</div>
					<div style="padding: 5px;"></div>
					<!--  프로젝트 댓글 -->
					<div class="column" style="padding-bottom: 20px; width: 50%;">
						<h3 style="text-align: left">프로젝트 문의</h3>

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
						Please enable JavaScript to view the <a
							href="https://disqus.com/?ref_noscript">comments powered by
							Disqus.</a>
					</noscript>
				</div>
				<footer class="footer">
					<div class="ui inverted segment">
						<jsp:include page="../common/menu/footerMenu.jsp" />
					</div>
				</footer>
			</div>
			<!-- 우측메뉴 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->


			<!----------------------------------------------------------------------- main content 끝 --->
			<!--======================================================================================-->


			<!----------------------------------------------------------------------- footer content 시작 -->
			<!-- footer 시작-->

			<!-- footer 끝-->
			<!----------------------------------------------------------------------- footer content 끝 -->
</body>
</html>