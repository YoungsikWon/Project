<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%
	List<Map<String,Object>> port =(List<Map<String,Object>>)request.getAttribute("e_port");
	List<Map<String,Object>> cate  =(List<Map<String,Object>>)request.getAttribute("e_cate");
	List<Map<String,Object>> intro =(List<Map<String,Object>>)request.getAttribute("e_intro");
%>
<html>
<head>
<jsp:include page="../../common/ui.jsp"/>
<meta charset="UTF-8">
<title>파트너스 포트폴리오</title>
<link rel="stylesheet" href="./css/partners.css" />
<link rel="stylesheet" href="./css/login.css" />
</head>
<body>
<h2 align="left" style="margin-left: 14px;"><%=intro.get(0).get("P_NAME") %>의 포트폴리오</h2>
	<p></p>
	<div class="ui grid" style="padding-left: 14px;padding-right: 14px;">
		<div class="row">
			<div class="ui container" style="padding-left: 14px;">
			<hr class="dotted" />
			<p></p>
				<h3 >대표 포트폴리오</h3>
				<div class="ui three column grid" style="padding-top: 14px;" >
					<%for(int i=0;i<11 ;i++){ %>
					<div class="column">
						<div class="ui segment">
							<div class="ui card">
								<div class="image">
									<img src="../image/anonymous.png" onclick="location.href='#'">
								</div>
								<div class="content">
									<a class="header"><span class="txt"><%=port.get(i).get("PORT_NAME").toString()%></span>
										<span class="ui orange label"
										style="margin-left: 3px; padding-bottom: 6px; padding-top: 6px;">대표작품</span>
									</a>
									<div class="meta">
										<span class="date"><%=cate.get(i).get("CATE_MAIN").toString()%> > <%=cate.get(i).get("CATE_SUB").toString()%></span>
									</div>
									<div class="description">
										<%=port.get(i).get("PORT_CONTENTS").toString()%>
									</div>
								</div>
								<div class="extra content">
									<center>
										<a>
											<div data-tooltip="위시캣에서 진행한 프로젝트입니다."data-position="top center">
												<img src="../image/logo.png"style="height: 15px; width: 15px;"> 위시캣 프로젝트 포트폴리오
											</div>
										</a>
									</center>
								</div>
							</div>
						</div>
					</div>
					<%} %>
					<!-- column -->
				</div>
				<!-- three column grid -->
			</div>
		<!-- container -->
		</div><!-- row 1 -->
		<div class="ui row">
			<div class="sixteen wide right aligned column">
				<!-- <h4><a href="#" class="ui right aligned">포트폴리오 더 보기 ></a></h4> -->
			</div>
		</div><!-- row 2 -->
	</div><!-- grid -->
</body>
</html>