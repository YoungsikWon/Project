<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%
    Cookie[]    cs          = request.getCookies();
    HttpSession infoSession = request.getSession();
    Map<String,Object> info = null;
    int      login_cnt = 0;
    for(int i = 0; i<cs.length;i++){
   
   String cName = cs[i].getName();
     if("id".equals(cName)){
      
        info = (Map<String,Object>)infoSession.getAttribute(cs[i].getValue());
      
     }
    }
    String email = info.get("S_EMAIL").toString();
    System.out.print("email: "+email);
%>
<%
   // DB에서 가져온 값 -> java servlet(정보) 값 여기에다가 받아 
   // 글고 변수를 for문을 돌려서 여려개를 처리햐ㅐ도 되겅 
   //list.get(0).get("프로시저의 OUT키")
   List<Map<String,Object>> grade      = (List<Map<String,Object>>)request.getAttribute("e_grade");
   List<Map<String,Object>> pro        =(List<Map<String,Object>>)request.getAttribute("e_pro");
   List<Map<String,Object>> avg        =(List<Map<String,Object>>)request.getAttribute("e_avg");
   List<Map<String,Object>> cate       =(List<Map<String,Object>>)request.getAttribute("e_cate");
   List<Map<String,Object>> intro      =(List<Map<String,Object>>)request.getAttribute("e_intro");
                                         
   //list.get(1).get("프로시저의 OUT키")        (List<Map<String,Object>>)request.getAttribute(
   List<Map<String,Object>> port       =(List<Map<String,Object>>)request.getAttribute("e_port");
   List<Map<String,Object>> back_car   =(List<Map<String,Object>>)request.getAttribute("e_back_car");
   List<Map<String,Object>> back_lic   =(List<Map<String,Object>>)request.getAttribute("e_back_lic");
   List<Map<String,Object>> back_edu   =(List<Map<String,Object>>)request.getAttribute("e_back_edu");
   List<Map<String,Object>> skill      =(List<Map<String,Object>>)request.getAttribute("e_skill");
                                          
   //list.get(2).get("프로시저의 OUT키")        (List<Map<String,Object>>)request.getAttribute(
   List<Map<String,Object>> c_eval_grade =(List<Map<String,Object>>)request.getAttribute("c_eval_grade");
   List<Map<String,Object>> c_eval_cate  =(List<Map<String,Object>>)request.getAttribute("c_eval_cate");
   List<Map<String,Object>> c_eval_pro   =(List<Map<String,Object>>)request.getAttribute("c_eval_pro");
   List<Map<String,Object>> c_eval_info  =(List<Map<String,Object>>)request.getAttribute("c_eval_info");
   
   //Gson gson = new Gson();s
   /* out.print(list.get(0).get("e_cate").get(0).get("CATE_SUB"));
   
   out.print(list.get(0).get("e_cate").get(0).get("CATE_MAIN")); */
   /******************************************************************************************************
   list.get(0) - 파트너스 자기소개, 정보 
        partnersIntroduction  p_name,p_operator, p_aboutme, s_email,p_addr, p_activity, p_phone
                   
   list.get(0) - 전체평균(별), 진행한 카테고리 진행한 프로젝트 건수, 포트폴리오 갯수 , 전체평점(세부사항), 진행한 카테고리 진행한 프로젝트 건수, 포트폴리오 갯수 
       grade         - AVG_ALLPRO,eval_count
       pro             - COUNT_PRO, COUNT_PORT
       avg           - AVG_PROF(전문성), AVG_SATI(결과물만족도), AVG_COMM(의사소통), AVG_COMP(일정준수), AVG_ACTI(적극성)
       cate         - cate_no, cate_main, cate_sub 
        
   list.get(1) - 포트폴리오, 경력, 학력, 자격증, 보유기술  
      port(포폴)      - port_no, port_file, port_date, port_contents, port_name,   
       back_car(경력)  - ca_name, ca_dept, ca_spot, ca_date
       back_lic(자격증) - lic_name,lic_agency, lic_date, lic_code
       back_edu(학력)  - edu_name, edu_major, edu_process, edu_condition, edu_indate, edu_outdate
      skill(기술)     - skill_tec, skill_pro, skill_edu
      
   list.get(2) - 클라이언트 평가 세부사항 : 포트폴리오 1건 평균, 별점, 카테고리, 프로젝트, 클라이언트 정보
       c_eval_grade    C_AVG_PRO,pro_no, p_no, sup_no, su_state, su_prof, su_sati, su_comm, su_comp, su_acti, su_cont, su_money
                     1,2,3,4,5 (별점 비율)
       c_eval_cate        cate_main, cate_sub, cate_no
       c_eval_pro        pro_no, pro_name, pro_period, pro_price, pro_plan, pro_skill, pro_addr, pro_end 
                        ,pro_start, pro_management, pro_contents, c_no
       c_eval_info      c_no, c_name, c_phone 
   ********************************************************************************************************/
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>파트너스 목록 전체보기</title>

</head>
<body style="margin-left: 14px; margin-right: 14px;">
   <!--=== title =========================================-->
   <div class="ui internally celled grid">
      <div id="partnersback" class="row">
         <div class="fifteen wide column" style="padding-bottom: 20px;">
            <h1 style="float: left; margin-bottom: 0px;padding-right:10px;"><%=intro.get(0).get("P_NAME").toString()%> </h1>
            <%
               if ("활동중".equals(intro.get(0).get("P_ACTIVITY"))) {
            %>
            <div class="ui green label"
               style="border-top-width: 0px; margin-top: 5px; margin-left: 7px;">활동가능</div>
            <%
               } else if ("활동불가능".equals(intro.get(0).get("P_ACTIVITY"))) {
            %>
            <div class="ui gray label"
               style="border-top-width: 0px; margin-top: 5px; margin-left: 7px;">활동가능</div>
            <%
               }
            %>
            <p style="padding-bottom: 10px;"></p>
            <div class="floated right">
               <%
                  if ("디자인".equals( cate.get(0).get("CATE_MAIN").toString())) {
               %>
               <i class="laptop icon"></i>디자인
               <%=cate.get(0).get("CATE_MAIN").toString()%>
               &nbsp;&nbsp;
               <%
                  } else if ("개발".equals(cate.get(0).get("CATE_MAIN").toString())) {
               %>
               <i class="keyboard icon"></i>개발 &nbsp;&nbsp;
               <%
                  }
               %>
               <%
                  if ("개인사업자".equals(intro.get(0).get("P_OPERATOR").toString())) {
               %>
               <i class="user outline icon"></i>
               <%
                  } else if ("법인사업자".equals(intro.get(0).get("P_OPERATOR").toString())) {
               %>
               <i class="building outline icon"></i>
               <%
                  } else if ("팀".equals(intro.get(0).get("P_OPERATOR").toString())) {
               %>
               <i class="users icon"></i>팀
               <%
                  }
               %>
               <%=intro.get(0).get("P_OPERATOR").toString()%>
               &nbsp;&nbsp;
               <%
                  if (intro.get(0).get("P_PHONE").toString() != null) {
               %>
               <i class="phone icon"></i> 연락처 등록
               <%}else{%>
               <i class="phone gray icon"></i> 연락처 미등록
               <%} %>
            </div>
         </div>
      </div>
      <!----- 활동요약 정보 ----->
<div class="row" style="width: 100%; height:350px; padding: 10px;">
			<div class="column" style="width: 30%;">
				<h3>활동 요약 정보</h3>
				<div class="ui grid">
					<div class="ui two column row" style="padding-top: 30px; margin-left: 0px; margin-right: 0px;">
						<div class="left aligned column" style="font-size: 14px;padding-top: 5px; padding-right: 0px;">계약한 프로젝트</div>
						<div class="right aligned column" style="margin-right: 0px;">
							<strong style="font-size: 1.5em;"><%=pro.get(0).get("COUNT_PRO")%></strong>건
						</div>
					</div>
					<div class="ui two column row" style="padding-top: 20px; margin-left: 0px; margin-right: 0px;">
						<div class="left aligned column" style="padding-top: 5px; padding-right: 0px;">포트폴리오</div>
						<div class="right aligned column" style="padding-left: 0px; margin-right: 0px;">
							<strong style="font-size: 1.5em"><%=pro.get(0).get("COUNT_PORT")%></strong>개
						</div>
					</div>
					<div class="ui two column row" style="padding-top: 20px; margin-left: 0px; margin-right: 0px;">
						<div class="left aligned column" style="padding-top: 5px; padding-right: 0px;">평균 평점</div>
						<div class="right aligned column" style="padding-left: 0px; margin-right: 0px;">
							<strong style="right: 0px;font-size: 1.5em"> <%=grade.get(0).get("AVG_ALLPRO")%>	</strong>점
						</div>
					</div>
					
						<%-- <div class="right aligned column" style="padding-left: 0px;">
							평가
							<%=grade.get(0).get("EVAL_COUNT")%>개
						</div> --%>
					
					<div class="ui aligned column" style="width: 100%;margin-top: 20px;" align="center">
						<div id="p_ratingAvg" class="ui massive star rating" style="margin-bottom: 10px;"></div>
					</div>
					

				</div>
				<!-- grid -->
			</div>
			<!-- five wide column -->
			<!----- 세부 항목 평가 ----->
			<div class="column" style="width: 32%;">
				<h3 style="margin-top: 0px;">세부 항목 평가</h3>
				<br>
				<canvas id="chartjs-3" class="chartjs" width="50%" height="50vh" style="display: block; width: 770px; height: 385px;"></canvas>
				<script type="text/javascript">
					new Chart(document.getElementById("chartjs-3"), {
						"type" : "radar",
						"data" : {
							"labels" : [ "전문성", "적극성", "만족도", "일정준수", "의사소통" ],
							"datasets" : [ {
								"data" : [
				<%=avg.get(0).get("AVG_PROF")%>
					,
				<%=avg.get(0).get("AVG_ACTI")%>
					,
				<%=avg.get(0).get("AVG_SATI")%>
					,
				<%=avg.get(0).get("AVG_COMP")%>
					,
				<%=avg.get(0).get("AVG_COMM")%>
					],
								"fill" : true,
								"backgroundColor" : "rgba(255, 99, 132, 0.2)",
								"borderColor" : "rgb(255, 99, 132)",
								"pointBackgroundColor" : "rgb(255, 99, 132)",
								"pointBorderColor" : "#fff",
								"pointHoverBackgroundColor" : "#fff",
								"pointHoverBorderColor" : "rgb(255, 99, 132)"
							} ]
						},
						"options" : {
							"elements" : {
								"line" : {
									"tension" : 0,
									"borderWidth" : 3
								}
							},
							"scales" : {
								"display" : false
							}
						}

					});
				</script>
			</div>

			<!----- 진행한  카테고리 ----->
			<div class="column" style="width: 38%;">
				<h3>진행한 카테고리</h3>
				<br>
				<div data-tooltip="위시캣에서 진행한 프로젝트입니다." data-position="top center">
					<div class="profile-main-category">
						<!-- <h5>
							<a href="#" style="text-decoration: none; color: #333"></a> 
						</h5> -->
						<div class="chart-box" style="display:block; margin-bottom: 30px;margin-left: 00px;">
							<canvas id="myChart" width="100%" height="80px">
								<div id="doughnut_tooltip" class="above" style="opacity: 0; left: 0px;  font-family:" "HelveticaNeue", Helvetica, Arial, sans-serif; font-size: 10px; font-style:normal; font-weight:bold;">"디자인 > 웹: 32"</div>
								
								<ul class="doughnut-legend" style="margin-top: 30px;">
									<li><span style="background-color: #05835E;"></span>"디자인 > 애플리케이션"</li>
									<li><span style="background-color: #19906D;"></span>"디자인 > 웹"</li>
									<li><span style="background-color: #2E9D7D;"></span>"디자인 > 인쇄물"</li>
									<li><span style="background-color: #42AB8C;"></span>"디자인 > 커머스,쇼핑몰"</li>
									<li><span style="background-color: #57B89C;"></span>"디자인 > 로고"</li>
									<li><span style="background-color: #6BC6AB;"></span>"디자인 > 그래픽"</li>
									<li><span style="background-color: #80D3BB;"></span>"디자인 > 기타"</li>
								</ul>
							</canvas>
						</div>
						<script>
							new Chart(document.getElementById("myChart"), {
								"type" : "doughnut",
								"data" : {
									"labels" : [ "애플리케이션", "웹", "그래픽" ],
									"datasets" : [ {
										"label" : "My First Dataset",
										"data" : [ 300, 50, 100 ],
										"backgroundColor" : [
												"rgb(255, 99, 132)",
												"rgb(54, 162, 235)",
												"rgb(255, 205, 86)" ]
									} ]
								}
							});
						</script>
					</div>
					<!------  -->
				</div>
			</div>
			<!--five wide column 끝 -->
		</div>
      <!--활동요약정보 row끝 -->
   <!--=== 자기소개 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
      <div class="row">
			<div class="sixteen wide column" style="width: 100%; margin-top: 20px;">
				<div style="background-color: #DEDEDE; height: 25px;">
					<h3>자기소개</h3>
				</div>
				<br>
				<div class="p-intro" style="background-color: #DEDEDE; padding: 10px;">

					<%=intro.get(0).get("P_ABOUTME").toString()%>

				</div>
			</div>
			<div style="width: 100%; text-align: right; margin-right: 20px;">
				<h5>
					<a href="./partnersIntroduction?s_email=<%=email %>">자기소개 더 보기 ></a>
				</h5>
			</div>
		</div>
	</div>

   <!--=== 포트폴리오 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
   <div class="ui inverted divider"></div>
	<div style="background-color: #DEDEDE; height: 25px; margin-left: 15px; margin-right: 15px; margin-top: 20px;">
		<h3>포트폴리오</h3>
	</div>
	<br>
	<div class="ui grid" style="padding-left: 14px; padding-right: 14px; margin-left: 10px; margin-right: 10px;">
		<div class="row">
			<div class="ui container" style="height: 100%;">
				<div class="ui three column grid" style="height: 100%;">
					<%
						for (int i = 0; i < 3; i++) {
					%>
					<div class="column">
						<div class="ui segment">
							<div class="ui card" style="background-color: #F5ECCE;">
								<div class="image">
									<!-- <img src="../image/anonymous.png" onclick="location.href='#'"> -->
								</div>
								<div class="content">
									<a class="header"><span class="txt"><%=port.get(i).get("PORT_NAME").toString()%></span> <span class="ui orange label" style="margin-left: 3px; padding-bottom: 6px; padding-top: 6px;">대표작품</span> </a>
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
											<div data-tooltip="위시캣에서 진행한 프로젝트입니다." data-position="top center">
												<!-- <img src="../image/logo.png" style="height: 15px; width: 15px;"> -->
												커프링크 프로젝트 포트폴리오
											</div>
										</a>
									</center>
								</div>
							</div>
						</div>
					</div>
					<%
						}
					%>
					<!-- column -->
				</div>
				<!-- three column grid -->
			</div>
			<!-- container -->
		</div>
		<!-- row 1 -->
		<div style="width: 100%; text-align: right; margin-right: 0px; margin-bottom: 10px;">
			<h5>
				<a href="./partnersPortfolio?s_email=<%=email %>" class="ui right aligned">포트폴리오 더 보기 ></a>
			</h5>
		</div>
		<!-- row 2 -->
	</div>
	<!-- grid -->

   <!-- === 보유기술 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
   <div class="ui inverted divider"></div>
	<div style="background-color: #DEDEDE; height: 25px; margin-left: 15px; margin-right: 15px; margin-top: 20px;">
		<h3>보유기술</h3>
	</div>
	<br>
	<div class="ui grid" style="padding-left: 14px; padding-right: 14px;">
		<div class="ui row">
			<table class="ui selectable celled table" style="margin-left: 15px; margin-right: 15px;">
				<thead>
					<tr>
						<th id="partnersmytablehead">종류</th>
						<th id="partnersmytablehead">숙련도</th>
						<th id="partnersmytablehead">경험</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (int i = 0; i < 5; i++) {
					%>
					<tr>
						<td><%=skill.get(i).get("SKILL_TEC")%> <%
 	if (i < 3) {
 %>
							<div class="ui orange label" style="padding-top: 10px pa; margin-left: 10px; padding-top: 5px; padding-bottom: 5px;">대표보유기술</div></td>
						<%
							}
						%>
						<td><%=skill.get(i).get("SKILL_PRO")%></td>
						<td><%=skill.get(i).get("SKILL_EDU")%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
		<!-- row1 -->
		<div style="width: 100%; text-align: right; margin-right: 0px; margin-bottom: 10px;">
			<h5>
				<a href="./partnersSkill?s_email=<%=email %>" class="ui right aligned">보유 기술 더 보기 ></a>
			</h5>
		</div>
	</div>
	<!-- grid -->
   <!-- === 경력 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
   <div class="ui inverted divider"></div>
	<div style="background-color: #DEDEDE; height: 25px; margin-left: 15px; margin-right: 15px; margin-top: 20px;">
		<h3>경력</h3>
	</div>
	<br>
	<div class="ui grid" style="padding-left: 14px; padding-right: 14px;">
		<div class="ui row">
			<table class="ui selectable celled table" style="margin-bottom: 0px; margin-left: 15px; margin-right: 15px;">
				<thead>
					<tr>
						<th id="partnersmytablehead">회사명</th>
						<th id="partnersmytablehead">근무부서</th>
						<th id="partnersmytablehead">직위</th>
						<th id="partnersmytablehead">근무기간</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (int i = 0; i < 3; i++) {
					%>
					<tr>
						<td><%=back_car.get(i).get("CA_NAME").toString()%></td>
						<td><%=back_car.get(i).get("CA_DEPT").toString()%></td>
						<td><%=back_car.get(i).get("CA_SPOT").toString()%></td>
						<td><%=back_car.get(i).get("CA_DATE").toString()%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<!-- === 학력 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
			<div class="ui inverted divider"></div>
			<div style="width: 100%; background-color: #DEDEDE; height: 25px; margin-left: 15px; margin-right: 15px; margin-top: 0px;">
				<h3>학력</h3>
			</div>
			<br>
			<table class="ui selectable celled table" style="margin-top: 0;margin-bottom: 0px; margin-left: 15px; margin-right: 15px; ">
				<thead>
					<tr>
						<th id="partnersmytablehead">학교명</th>
						<th id="partnersmytablehead">전공</th>
						<th id="partnersmytablehead">분류</th>
						<th id="partnersmytablehead">상태</th>
						<th id="partnersmytablehead">입학일</th>
						<th id="partnersmytablehead">졸업일</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (int i = 0; i < 1; i++) {
					%>
					<tr>
						<td><%=back_edu.get(i).get("EDU_NAME").toString()%></td>
						<td><%=back_edu.get(i).get("EDU_MAJOR").toString()%></td>
						<td><%=back_edu.get(i).get("EDU_PROCESS").toString()%></td>
						<td><%=back_edu.get(i).get("EDU_CONDITION").toString()%></td>
						<td><%=back_edu.get(i).get("EDU_INDATE").toString()%></td>
						<td><%=back_edu.get(i).get("EDU_OUTDATE").toString()%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
		<div style="width: 100%; text-align: right; margin-right: 0px; margin-bottom: 10px;">
			<h5>
				<a href="./partnersBackground?s_email=<%=email %>" class="ui right aligned">경력,학력,자격증 더 보기 ></a>
			</h5>
		</div>
		<!-- row 2 -->
	</div>
	<p></p>
<!-- 
   <!-- === 평가@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
<div class="ui inverted divider"></div>
	<div style="background-color: #DEDEDE; height: 25px; margin-left: 15px; margin-right: 15px; margin-top: 20px;">
		<h3>평가</h3>
	</div>
	<br>
	<%-- <%
		System.out.println("pro 크기" + c_eval_pro.size());
		System.out.println("grade 크기" + c_eval_grade.size());
		System.out.println("cate 크기" + c_eval_cate.size());
		System.out.println("info 크기" + c_eval_info.size());
		for (int i = 0; i < c_eval_info.size(); i++) {

			System.out.println("시이발나와라" + c_eval_info.get(i).toString());
			//System.out.println(c_eval_pro.get(i).get("SU_PROF").toString());
	%> --%>
	<div class="ui" style="width: 100%;">
		<div style="width: 100%;">
			<div id="partnersmytablehead" class="ui segment" style=" margin-left: 10px; margin-right: 10px;">
				<div class="sixteen wide column" style="margin-bottom: 0px;">
				<h4 class="card-title">
					<a href="/project/View?pro_no=<%=c_eval_pro.get(0).get("PRO_NO").toString() %>"> <%=c_eval_pro.get(0).get("PRO_NAME").toString() %></a>
				</h4>
				<%=c_eval_cate.get(0).get("CATE_MAIN").toString() %>
					>
					<%=c_eval_cate.get(0).get("CATE_SUB").toString() %>
					| 클라이언트 TeamEveryWhere
				</div>
			</div>		
					<!-----계약금액 | 계약기간 | 계약일자------------------------->
				<div style=" margin-left: 10px; margin-right: 10px;">
					<table class="ui selectable celled table" style="margin-bottom: 10px; margin-left: 0px; margin-right: 10px;">
						<thead>
							<tr>
								<th id="partnersmytablehead">계약금액</th>
								<td><%=c_eval_pro.get(0).get("PRO_PRICE").toString()%></td>
								<%System.out.print("1번 디버깅:"+c_eval_pro.get(0).get("PRO_PRICE").toString()); %>
								<th id="partnersmytablehead">계약기간</th>
								<td><%=c_eval_pro.get(0).get("PRO_PERIOD").toString()%></td>
								<%System.out.print("1번 디버깅:"+c_eval_pro.get(0).get("PRO_PERIOD").toString()); %>
								<th id="partnersmytablehead">계약일자</th>
								<td><%=c_eval_pro.get(0).get("PRO_START").toString()%></td>
								<%System.out.print("1번 디버깅:"+c_eval_pro.get(0).get("PRO_START").toString()); %>
							</tr>
						</thead>
					</table>
				
				<!----전문성|결과물만족도|의사소통|일정 준수|적극성-  -->
				<div class="ui column segment container" style="width: 100%;padding-bottom: 7px; padding-top: 7px; background-color: #F5ECCE; ;margin-bottom: 0;">
					<div class="ui five column grid container" style="width: 100%; padding-bottom: 10px;">
						<div class="column" style="width: 20%;" align="center">
							전문성<br>
							<div class="ui star rating su_prof" style="margin-top: 10px;"><%=c_eval_grade.get(0).get("SU_PROF").toString()%></div>
							
						</div>
						<div class="column" style="width: 20%;" align="center">
							결과물 만족도<br>
							<div class="ui star rating su_sati" style="margin-top: 10px;"><%=c_eval_grade.get(0).get("SU_SATI").toString()%></div>
							
						</div>
						<div class="column" style="width: 20%;" align="center">
							의사소통<br>
							<div class="ui star rating su_comm" style="margin-top: 10px;"><%=c_eval_grade.get(0).get("SU_COMM").toString()%></div>
							
						</div>
						<div class="column" style="width: 20%;" align="center">
							일정 준수<br>
							<div class="ui star rating su_comp" style="margin-top: 10px;"><%=c_eval_grade.get(0).get("SU_COMP").toString()%></div>
							
						</div>
						<div class="column" style="width: 20%;" align="center">
							적극성<br>
							<div class="ui star rating su_acti" style="margin-top: 10px;"><%=c_eval_grade.get(0).get("SU_ACTI").toString()%></div>
							
						</div>
						<div style="width: 100%;">
							<hr style="border: solid #BDBDBD; border-width: 1px 0 0;">
						</div>
						<!-----클라이언트 코멘트---------------------------------->
						<div class="ui unstackable items" >
							<div class="ui three column grid container" style="margin-left: 20px;">
								<div class="column" style="width: 10%; padding: 0;">
									<img src="/image/partners1.png" height="50" width="50">
								</div>
								<div class="column" style="padding-left: 10px; padding-top: 5px; width: 10%;">
									<a class="header" style="margin-top: 0px;"><span class="ui black label">클라이언트</span></a>
									<div class="meta">
										<span><%=c_eval_info.get(0).get("C_NAME").toString() %></span>
									</div>
									<p></p>
									<%-- <div class="description">
										<div class="evaluation_txt">
											<%=c_eval_grade.get(0).get("SU_CONT").toString()%>
											<a href="#">자세히 보기</a>
		
										</div>
									</div> --%>
								</div>
								<!-----평점---------------------------------------------->
								<div class="column" style="width: 80%; margin-bottom: 15px;">
									<div class="ui column" style="padding-bottom: 0px; padding-right: 20px; box-sizing: border-box;" align="center">
										<div class="ui three column grid container">
											<div class="column" style="width: 27%;"></div>
											<div class="column" style="width: 15%;">
												<h4>총 평점</h4>
											</div>
											<div class="column" style="width: 22%;">
												<div class="ui massive star rating c_avg_pro">
													 <%=c_eval_grade.get(0).get("C_AVG_PRO").toString()%>
												</div>
												<div class="description" align="right" style="margin-top: 5px;">
							                        <div class="evaluation_txt" style="display: inline-block; background-color: #08298A; ">
							                           <%-- <%=c_eval_grade.get(0).get("SU_CONT").toString()%> --%>
							                           <a href="/project/View?pro_no=<%=c_eval_pro.get(0).get("PRO_NO").toString() %>">자세히 보기</a>
							
							                        </div>
							                     </div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div style="width: 100%; text-align: right; margin-right: 0px; margin-top: 20px;margin-bottom: 20px;">
				<h5>
					<a href="./partnersEvaluation?s_email=<%=email %>" class="ui right aligned">평가 더 보기 ></a>
				</h5>
				</div>
			</div>
		</div>
	</div>
   <!--==========================================================================================-->
   <!--==========================================================================================-->

 <%-- <%
      }
   
      System.out.println("포문 끝");
   %>  --%>

   <script type="text/javascript">
  	 //개인 평균
	   $('.c_avg_pro')
	     .rating({
	       initialRating:  parseInt(<%=c_eval_grade.get(0).get("C_AVG_PRO").toString()%>),
	       maxRating: 5
	     });
	   $('.c_avg_pro').rating('disable')
	   
	   //전문성
	   $('.su_prof')
	     .rating({
	       initialRating:  parseInt(<%=c_eval_grade.get(0).get("SU_PROF")%>),
	       maxRating: 5
	     });
	   $('.su_prof').rating('disable')
	   //결과물만족도
	   $('.su_sati')
	     .rating({
	       initialRating:  parseInt(<%=c_eval_grade.get(0).get("SU_SATI")%>),
	       maxRating: 5
	     });
	   $('.su_sati').rating('disable')
	   
	   //일정준수
	   $('.su_comp')
	     .rating({
	       initialRating:  parseInt(<%=c_eval_grade.get(0).get("SU_COMP")%>),
	       maxRating: 5
	     });
	   $('.su_comp').rating('disable')
	   
	   //의사소통
	   $('.su_comm')
	     .rating({
	       initialRating:  parseInt(<%=c_eval_grade.get(0).get("SU_COMM")%>),
	       maxRating: 5
	     });
	   $('.su_comm').rating('disable')
	   
	   //적극성
	   $('.su_acti')
	     .rating({
	       initialRating:  parseInt(<%=c_eval_grade.get(0).get("SU_ACTI")%>),
	       maxRating: 5
	     });
	   $('.su_acti').rating('disable')
	   
   </script>
    <script type="text/javascript">
   //평가 - 평균 평점
      $('#p_ratingAvg')
         .rating({
            initialRating : parseInt(<%=grade.get(0).get("AVG_ALLPRO")%>),
            maxRating : 5
         })
      $('#p_ratingAvg').rating('disable')
   </script>
   
</body>
</html>