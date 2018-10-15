<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
	Map<String,Map> map= (Map<String,Map>)request.getAttribute("Project");
	
	Map<String, Object> pro = map.get("Project"); // 프로젝트 상세보기 목록 뿌리기
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
				<% if("클라이언트".equals(request.getAttribute("kind").toString())) {%>
	            	<jsp:include page="../common/menu/headerMenu.jsp" />
	            <% } else { %>
	           		<jsp:include page="../common/menu/PartnersHeaderMenu.jsp" />
	            <% } %>
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

		<!-- main 입력 시작-->

		<div class="ui two column grid container" style="height: 860px">
			<div class="ui column"	style="padding-left: 0px; padding-top: 0px; padding-bottom: 0px; width: 80%;">
				<div class="ui container"> 
					<div class="content-header">
						<div class="ui two column grid container">
							<div class="column" style="text-align: left">
								<h5 class="content-text" style="text-align: left;">
									프로필 정보 등록하기
									</h5>
									<div class="ui buttons">
										<button class="ui button"
										onclick="location.href='/PartnersProfile'">
											<font style="vertical-align: inherit;"><font
												style="vertical-align: inherit;">기본정보등록</font></font>
										</button>
										<button class="ui button"
										onclick="location.href='/PartnersInfo'">
											<font style="vertical-align: inherit;"><font
												style="vertical-align: inherit;">파트너스 정보 등록</font></font>
										</button>
										<button class="ui button"
										onclick="location.href='/projectSubmitted'">
											<font style="vertical-align: inherit;"><font
												style="vertical-align: inherit;">자기소개 등록</font></font>
										</button>
										<button class="ui button"
										onclick="location.href='/projectSubmitted'">
											<font style="vertical-align: inherit;"><font
												style="vertical-align: inherit;">보유기술 등록</font></font>
										</button>
										<button class="ui button"
										onclick="location.href='/projectSubmitted'">
											<font style="vertical-align: inherit;"><font
												style="vertical-align: inherit;">포트폴리오 등록</font></font>
										</button>
									</div>

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
							<div class="ui column" style="padding-left: 5px; padding-top: 0px; padding-bottom: 0px; width: 80%;">
							
					<h2 class="ui header"><%=pro.get("PRO_NAME") %></h2>
							</div>
					<table class="ui single line table">
					<thead>
					<tr>
						<th><span>예상금액</span></th>
						<th><span>등록 일</span></th>
						<th><span>마감 일</span></th>
						<th><span>기획</span></th>
						<th><span>매니징 경험</span></th>
						<th><span>위치</span></th>
							<div class="column"
							style="padding-left: 0px; padding-right: 0px; padding-top: 5px; padding-bottom: 5px; text-align: right; width: 10%;">
							<!-- 우측여백 -->
						</div>
					</tr>
					</thead>
					<tbody>
						<tr>
							<td data-label="예상금액"><b>$ <%=pro.get("PRO_PRICE")%></b></td>
							<td><b> <%=pro.get("PRO_START")%></b> </td>
							<td><b> <%=pro.get("PRO_END")%></b> </td>
							<td><b> <%=pro.get("PRO_PLAN")%></b> </td>
							<td><b> <%=pro.get("PRO_MANAGEMENT")%></b> </td>
							<td><b> <%=pro.get("PRO_ADDR")%></b> </td>
						</tr>
					</tbody>
					</table>
						
								<div class="ui four column grid container">
						<div class="column" style="padding-bottom: 20px; width: 50%;">
							<h3 style="text-align: left">프로젝트 내용</h3>
						
						</div>
						<div class="ui blue top right attached label">
								<a href="ProjectSubmitted">관련 기술 <%="PRO_SKILL" %></a>
							</div>
						<div class="column"
							style="padding-left: 0px; padding-right: 0px; padding-top: 20px; padding-bottom: 20px; text-align: right; width: 10%;">
							<!-- 우측여백 -->
						</div>
							<p style="text-center";><h4><%=pro.get("PRO_CONTENTS")%></h4></p>
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
						onclick="location.href='/projectSubmitted'" style="padding-left: 10px">
						<i class="icon edit"></i> 관심프로젝트<br> 추가하기
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
										<b><%=p1.get("A") %> 건</b>
									</div>
									<div class="column h15"
										style="text-align: left; padding-top: 10px; padding-bottom: 10px; padding-left: 30px; padding-right: 0px; width: 60%">
										계약률
										</div>
									<div class="column h15"
										style="padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px; text-align: right; width: 40%;">
										<%=p1.get("D")%>%
										</div>
									<div class="column h15"
										style="text-align: left; padding-top: 10px; padding-bottom: 10px; padding-left: 30px; padding-right: 0px; width: 60%">
										진행중인 프로젝트
										</div>
									<div class="column h15"
										style="padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px; text-align: right; width: 40%;">
										<%=p1.get("B") %> 건</div>
									<div class="column h15"
										style="text-align: left; padding-top: 10px; padding-bottom: 10px; padding-left: 30px; padding-right: 0px; width: 60%">
										완료한 프로젝트</div>
									<div class="column h15"
										style="padding-top: 10px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px; text-align: right; width: 40%;">
										<%=p1.get("C") %> 건</div>
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

			<div class="ui basicspace">
				<!-- login title와 main content 여백 -->
			</div>

			<!----------------------------------------------------------------------- footer content 시작 -->
			<!-- footer 시작-->
		
			<!-- footer 끝-->
			<!----------------------------------------------------------------------- footer content 끝 -->

</body>
</html>