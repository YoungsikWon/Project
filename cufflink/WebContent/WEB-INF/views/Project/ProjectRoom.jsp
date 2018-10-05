<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
	Map<String,Map> map= (Map<String,Map>)request.getAttribute("Project");
	
	Map<String, Object> pro = map.get("Project"); // 프로젝트 상세보기 목록 뿌리기
	Map<String, Object> p1 = map.get("P_Project"); // 클라이언트  / 계약률, 진행중인 프로젝트, 완료한 프로젝트를 넣어줄 것.
	%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/ui.jsp" />
<meta charset="UTF-8">
<title>마이 커프링크</title>
<link rel="stylesheet" href="../css/cuffLink.css" />
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

		<!-- main 입력 시작-->

		<div class="ui two column grid container" style="height: 860px">
			<div class="ui column"	style="padding-left: 0px; padding-top: 0px; padding-bottom: 0px; width: 80%;">
				<div class="ui container"> 
					<div class="content-header">
						<div class="ui two column grid container">
							<div class="column" style="text-align: left">
								<h5 class="content-text" style="text-align: left;">
									프로필 정보 등록하기
									</h4>
									<div class="ui buttons">
										<button class="ui button">
											<font style="vertical-align: inherit;"><font
												style="vertical-align: inherit;">기본정보등록</font></font>
										</button>
										<button class="ui button">
											<font style="vertical-align: inherit;"><font
												style="vertical-align: inherit;">파트너스 정보 등록</font></font>
										</button>
										<button class="ui button">
											<font style="vertical-align: inherit;"><font
												style="vertical-align: inherit;">자기소개 등록</font></font>
										</button>
										<button class="ui button">
											<font style="vertical-align: inherit;"><font
												style="vertical-align: inherit;">보유기술 등록</font></font>
										</button>
										<button class="ui button">
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
					<div class="ui column segment" style="padding-top: 0px;">
					<div class="ui three column doubling stackable grid container">
						<div class="column">
							<div class="ui segment"><h3>예상금액</h3> <%=pro.get("PRO_PRICE") %> </div>
						</div>
						<div class="column">
							<div class="ui segment"><h3>등록일</h3> <%=pro.get("PRO_START") %></div>
						</div>
						<div class="column">
							<div class="ui segment"><h3>마감일</h3> <%=pro.get("PRO_END") %></div>
						</div>
						<div class="column">
							<div class="ui segment"><h3>기획 상태</h3> <%=pro.get("PRO_PLAN") %></div>
						</div>
						<div class="column">
							<div class="ui segment"><h3>매니징 경험</h3> <%=pro.get("PRO_MANAGEMENT") %></div>
						</div>
						<div class="column">
							<div class="ui segment"><h3>주소</h3><%=pro.get("PRO_ADDR") %></div>
						</div>
					</div>
				</div>
				<!-- 중간 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
				<div class="ui segment container"
					style="padding: 20px; padding-bottom: 20px; left: 0px; border: 1px solid #dedede;">
					<div class="ui four column grid container">
						<div class="column" style="padding-bottom: 20px; width: 50%;">
							<h4 style="text-align: left">프로젝트 내용</h4>
							<p><%=pro.get("PRO_CONTENTS")%><br></p>
						</div>
						<div class="ui blue top right attached label">
								<a href="ProjectSubmitted">관련 기술 <%="PRO_SKILL" %></a>
							</div>
						<div class="column"
							style="padding-left: 0px; padding-right: 0px; padding-top: 25px; padding-bottom: 20px; text-align: right; width: 40%;">
							<!-- 우측여백 -->
						</div>
						<div class="column"
							style="padding-left: 0px; padding-right: 0px; padding-top: 20px; padding-bottom: 20px; text-align: right; width: 10%;">
							<!-- 우측여백 -->
						</div>
					</div>
					<div class="ui container"
						style="padding-top: 0px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px;">
						<hr class="garo" style="" />
					</div>
					<!-- 프로젝트 관련 기술 넣기 -->
	
					<div style="padding: 13px;"></div>
					<div class="ui"
						style="padding-left: 20px; padding-right: 20px; padding-top: 0px; padding-bottom: 0px; text-align: left;">
					</div>
					<div style="padding: 13px;"></div>
					<div class="ui"
						style="padding-left: 20px; padding-right: 20px; padding-top: 0px; padding-bottom: 0px; text-align: left;">
						<div class="ui comments">
							<h3 class="ui dividing header">프로젝트 문의</h3>
							<div class="comment">
								<a class="avatar"> <img src="/image/matt.jpg">
								</a>
								<div class="content">
									<a class="author">Matt</a>
									<div class="metadata">
										<span class="date">Today at 5:42PM</span>
									</div>
									<div class="text">How artistic!</div>
									<div class="actions">
										<a class="reply">Reply</a>
									</div>
								</div>
							</div>
							<div class="comment">
								<a class="avatar"> <img src="/image/elliot.jpg">
								</a>
								<div class="content">
									<a class="author">Elliot Fu</a>
									<div class="metadata">
										<span class="date">Yesterday at 12:30AM</span>
									</div>
									<div class="text">
										<p>This has been very useful for my research. Thanks as
											well!</p>
									</div>
									<div class="actions">
										<a class="reply">Reply</a>
									</div>
								</div>
								<div class="comments">
									<div class="comment">
										<a class="avatar"> <img src="/image/jenny.jpg">
										</a>
										<div class="content">
											<a class="author">Jenny Hess</a>
											<div class="metadata">
												<span class="date">Just now</span>
											</div>
											<div class="text">Elliot you are always so right :)</div>
											<div class="actions">
												<a class="reply">Reply</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="comment">
								<a class="avatar"> <img src="/image/joe.jpg">
								</a>
								<div class="content">
									<a class="author">Joe Henderson</a>
									<div class="metadata">
										<span class="date">5 days ago</span>
									</div>
									<div class="text">Dude, this is awesome. Thanks so much</div>
									<div class="actions">
										<a class="reply">Reply</a>
									</div>
								</div>
							</div>
							<form class="ui reply form">
								<div class="field">
									<textarea></textarea>
								</div>
								<div class="ui blue labeled submit icon button">
									<i class="icon edit"></i> Add Reply
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 우측메뉴 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
			<div class="ui column"
				style="width: 20%; padding-top: 0px; padding-left: 0px; padding-right: 0px">


				<div class="ui fluid vertical menu"
					style="padding-left: 10px; padding-right: 10px; padding-bottom: 10px; text-align: center">
					<div style="padding: 10px; text-align: center;">
						<b>프로젝트 지원 불가</b>
					</div>
					<div class="ui container"
						style="padding-top: 10px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px; width: 100%;">
						<hr class="dotted" style="width: 100%;" />
					</div>
					<div class="ui blue labeled submit icon button"
						onclick="location.href='/projectSubmitted'" style="padding: 5px;">
						<i class="icon edit"></i> 관심프로젝트<br> 추가하기
					</div>

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
										style="vertical-align: inherit;">크리스티</font></font></a>
								<div class="meta">
									<span class="date"><font
										style="vertical-align: inherit;"><font
											style="vertical-align: inherit;">2013 년 가입</font></font></span>
								</div>
								<div class="description">
									<font style="vertical-align: inherit;"><font
										style="vertical-align: inherit;"> Kristy는 뉴욕에 사는 미술
											감독입니다. </font></font>
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