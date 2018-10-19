<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.google.gson.Gson"%>
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
	List<Map<String,Object>> intro        =(List<Map<String,Object>>)request.getAttribute("e_intro");
	List<Map<String,Object>> grade        = (List<Map<String,Object>>)request.getAttribute("e_grade");
	List<Map<String,Object>> avg          =(List<Map<String,Object>>)request.getAttribute("e_avg");
	List<Map<String,Object>> pro          =(List<Map<String,Object>>)request.getAttribute("e_pro");
	List<Map<String,Object>> c_eval_grade =(List<Map<String,Object>>)request.getAttribute("c_eval_grade");
	List<Map<String,Object>> c_eval_cate  =(List<Map<String,Object>>)request.getAttribute("c_eval_cate");
	List<Map<String,Object>> c_eval_pro   =(List<Map<String,Object>>)request.getAttribute("c_eval_pro");
	List<Map<String,Object>> c_eval_info  =(List<Map<String,Object>>)request.getAttribute("c_eval_info");
	//e_avg           - AVG_PROF(전문성), AVG_SATI(결과물만족도), AVG_COMM(의사소통), AVG_COMP(일정준수), AVG_ACTI(적극성)
	/* Gson gson = new Gson();
	String g_intro = gson.toJson(intro);
	String g_grade = gson.toJson(grade);
	String g_avg = gson.toJson(avg);
	String g_pro = gson.toJson(pro);
	String g_c_eval_grade = gson.toJson(c_eval_grade);
	String g_c_eval_cate = gson.toJson(c_eval_cate);
	String g_c_eval_pro = gson.toJson(c_eval_pro);
	String g_ = gson.toJson(c_eval_info); */
	
	System.out.println("intro: "+intro);
	System.out.println("grade: "+grade);
	System.out.println("avg :"+avg);
	System.out.println("pro : "+pro);
	System.out.println("c_eval_grade :"+c_eval_grade);
	System.out.println("c_eval_cate:"+c_eval_cate);
	System.out.println("c_eval_pro :"+c_eval_pro);
	System.out.println("c_eval_info :"+c_eval_info);

%>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>클라이언트 평가</title>
</head>
<body>

	<div class="ui container">

		<!-- main 입력 시작-->
		<div class="ui column" style="width: 100%; padding-top: 20px; padding-bottom: 0px;">
			<div style="width: 100%; height: 30px; background-color: #dedede; margin-bottom: 15px;">
				<h3 style="text-align: left; padding-bottom: 10px;"><%=intro.get(0).get("P_NAME")%>의 평가
				</h3>
			</div>
			<p></p>

			<div class="ui container" style="padding-top: 10px;">
				<div class="sixteen wide column" style="margin-left: 10px; margin-right: 10px; margin-bottom: 20px;">
					<table class="ui selectable celled table">
						<thead style="align-content: center;">
							<tr>
								<th><strong>계약한 프로젝트</strong></th>
								<td><strong><%=pro.get(0).get("COUNT_PRO").toString()%></strong>개/ 평가 <%=grade.get(0).get("EVAL_COUNT")%>개</td>
								<th>프로젝트 평균평점</th>
								<td>
									<div class="ui massive star rating" style=""></div> <%=grade.get(0).get("AVG_ALLPRO").toString()%>
								</td>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
		
		<div class="ui grid container" style="margin-bottom: 10px;">
			<div class="ui row" style="padding: 10px;margin-left: 10px; margin-right: 10px;margin-bottom: 10px; border:1px solid #dedede;">
				<div class="three wide column" style="padding-left: 10px; padding-right: 20px; margin-top: 5px; border-right:1px solid #dedede;">
					<table>
						<tr>
							<td><strong>세부항목 평가</strong></td>
						</tr>
						<tr>
							<td>전문성</td>
							<td><%=avg.get(0).get("AVG_PROF") %>점</td>
						</tr>
						<tr>
							<td>만족도</td>
							<td><%=avg.get(0).get("AVG_SATI") %>점</td>
						</tr>
						<tr>
							<td>의사소통</td>
							<td><%=avg.get(0).get("AVG_COMM") %>점</td>
						</tr>
						<tr>
							<td>일정준수</td>
							<td><%=avg.get(0).get("AVG_COMP") %>점</td>
						</tr>
						<tr>
							<td>적극성</td>
							<td><%=avg.get(0).get("AVG_ACTI") %>점</td>
						</tr>
					</table>
				</div>
				<div class="five wide column" style="padding-left: 0px; padding-right: 0px; margin-top: 15px; border-right:1px solid #dedede;">
					<canvas id="chartjs-3" class="chartjs" width="770" height="385" style="display: block; width: 770px; height: 385px;"></canvas>
					<script type="text/javascript">
						new Chart(document.getElementById("chartjs-3"),{
							"type":"radar"
							,"data":{"labels":["전문성","적극성","만족도","일정준수","의사소통"]
							,"datasets":[{
								"label":"세부항목 평가",
								"data":[<%=avg.get(0).get("AVG_PROF") %>,<%=avg.get(0).get("AVG_ACTI") %>,<%=avg.get(0).get("AVG_SATI") %>
									             ,<%=avg.get(0).get("AVG_COMP") %>,<%=avg.get(0).get("AVG_COMM") %>]
										 ,"fill":true
										 ,"backgroundColor":"rgba(255, 99, 132, 0.2)"
										 ,"borderColor":"rgb(255, 99, 132)"
										 ,"pointBackgroundColor":"rgb(255, 99, 132)"
										 ,"pointBorderColor":"#fff"
										 ,"pointHoverBackgroundColor":"#fff"
										 ,"pointHoverBorderColor":"rgb(255, 99, 132)"}]}
						    ,"options":{"elements":{"line":{"tension":0,"borderWidth":3}}
										,"scales":{"display":false}}
		
						    });
						</script>
					<div class="ui mini star rating"></div>
				</div>
				<div class=" six wide column" style="padding-left: 30px; padding-right: 0px;">
					<canvas id="chartjs-2" class="chartjs" width="763" height="381" style="display: block; width: 763px; height: 381px;"></canvas>
					<script type="text/javascript">
					new Chart(document.getElementById("chartjs-2"),{
						"type":"horizontalBar",
						"data":{"labels":["5","4","3","2","1"
							],
					    "datasets":[{
					    	"label":"평균 평점 ",
					    	"data":[<%=grade.get(0).get("5")%>,<%=grade.get(0).get("4")%>,<%=grade.get(0).get("3")%>,<%=grade.get(0).get("2")%>,<%=grade.get(0).get("1")%>],
					    "fill":false,"backgroundColor":["rgba(255, 99, 132, 0.2)",
					    "rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)", "rgba(201, 203, 207, 0.2)"],
					    "borderColor":["rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)"],
					    "borderWidth":1}]}
					,"options":{"scales":{"xAxes":[{"ticks":{"beginAtZero":true}}]}}});
					
					</script>
				</div>
				<!-- three column grid -->
				<div class=" two wide column" style="padding-left: 0px; padding-right: 0px; margin-top: 5px;">
					<table>
						<tr>
							<td><strong>평점 분포</strong></td>
						</tr>
						<tr>
							<td style="text-align: right;"><div class="ui small star rating" data-rating="5"></div> <%=grade.get(0).get("5")%>명</td>
						</tr>
						<tr>
							<td style="text-align: right;"><div class="ui small star rating r_four"></div> <%=grade.get(0).get("4")%>명</td>
						</tr>
						<tr>
							<td style="text-align: right;"><div class="ui small star rating r_three"></div> <%=grade.get(0).get("3")%>명</td>
						</tr>
						<tr>
							<td style="text-align: right;"><div class="ui small star rating r_two"></div> <%=grade.get(0).get("2")%>명</td>
						</tr>
						<tr>
							<td style="text-align: right;"><div class="ui small star rating r_one"></div> <%=grade.get(0).get("1")%>명</td>
						</tr>
					</table>
				</div>
			</div>
		</div>

		<%
      for(int i=0;i<c_eval_info.size();i++){
  		 %>
		<div class="ui" style="width: 100%;">
			<div style="width: 100%;">
				<div  id="partnersmytablehead" class="ui segment" style="margin-left: 10px; margin-right: 10px;">
					<div class="sixteen wide column" style="margin-bottom: 0px;">
						<h4 class="card-title">
							<a href="#"> <%=c_eval_pro.get(i).get("PRO_NAME").toString()%></a>
						</h4>
						<%=c_eval_cate.get(i).get("CATE_MAIN").toString()%>
						>
						<%=c_eval_cate.get(i).get("CATE_SUB").toString()%>
						| 클라이언트 TeamEveryWhere
					</div>
				</div>
				<!-----계약금액 | 계약기간 | 계약일자------------------------->
				<div style="margin-left: 10px; margin-right: 10px;">
					<table class="ui selectable celled table" style="margin-bottom: 10px; margin-left: 0px; margin-right: 10px;">
						<thead>
							<tr>
								<th id="partnersmytablehead">계약금액</th>
								<td><%=c_eval_pro.get(i).get("PRO_PRICE").toString()%></td>
								<%
									System.out.print("1번 디버깅:" + c_eval_pro.get(i).get("PRO_PRICE").toString());
								%>
								<th id="partnersmytablehead">계약기간</th>
								<td><%=c_eval_pro.get(i).get("PRO_PERIOD").toString()%></td>
								<%
									System.out.print("1번 디버깅:" + c_eval_pro.get(i).get("PRO_PERIOD").toString());
								%>
								<th id="partnersmytablehead">계약일자</th>
								<td><%=c_eval_pro.get(i).get("PRO_START").toString()%></td>
								<%
									System.out.print("1번 디버깅:" + c_eval_pro.get(i).get("PRO_START").toString());
								%>
							</tr>
						</thead>
					</table>
				<%-- <!-----평점---------------------------------------------->
				<div class="sixteen wide column " style="padding-bottom: 21px; text-align: center !important;">
					<div class="ui massive star rating c_avg_pro" style=""></div>
					<span style="font-size: 10em"><%=c_eval_grade.get(i).get("C_AVG_PRO").toString()%></span>
				</div> --%>
				<!----전문성|결과물만족도|의사소통|일정 준수|적극성-  -->
				<div class="ui column segment container" style="width: 100%; padding-bottom: 7px; padding-top: 7px; background-color: #E0ECF8; margin-bottom: 30px;">
						<div class="ui five column grid container" style="width: 100%; padding-bottom: 10px;">
							<div class="column" style="width: 20%;" align="center">
								전문성<br>
								<div class="ui star rating su_prof" style="margin-top: 10px;"><%=c_eval_grade.get(i).get("SU_PROF").toString()%></div>

							</div>
							<div class="column" style="width: 20%;" align="center">
								결과물 만족도<br>
								<div class="ui star rating su_sati" style="margin-top: 10px;"><%=c_eval_grade.get(i).get("SU_SATI").toString()%></div>

							</div>
							<div class="column" style="width: 20%;" align="center">
								의사소통<br>
								<div class="ui star rating su_comm" style="margin-top: 10px;"><%=c_eval_grade.get(i).get("SU_COMM").toString()%></div>

							</div>
							<div class="column" style="width: 20%;" align="center">
								일정 준수<br>
								<div class="ui star rating su_comp" style="margin-top: 10px;"><%=c_eval_grade.get(i).get("SU_COMP").toString()%></div>

							</div>
							<div class="column" style="width: 20%;" align="center">
								적극성<br>
								<div class="ui star rating su_acti" style="margin-top: 10px;"><%=c_eval_grade.get(i).get("SU_ACTI").toString()%></div>

							</div>
							<div style="width: 100%;">
								<hr style="border: solid #BDBDBD; border-width: 1px 0 0;">
							</div>
							<!-----클라이언트 코멘트---------------------------------->
							<div class="ui unstackable items">
								<div class="ui three column grid container" style="margin-left: 20px;">
									<div class="column" style="width: 10%; padding: 0;">
										<img src="/image/partners1.png" height="50" width="50">
									</div>
									<div class="column" style="padding-left: 10px; padding-top: 5px; width: 10%;">
										<a class="header" style="margin-top: 0px;"><span class="ui black label">클라이언트</span></a>
										<div class="meta">
											<span><%=c_eval_info.get(i).get("C_NAME").toString()%></span>
										</div>
										<p></p>
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
														<%=c_eval_grade.get(i).get("C_AVG_PRO").toString()%>
													</div>
													<div class="description" align="right" style="margin-top: 5px;">
														<div class="evaluation_txt" style="display: inline-block; background-color: #F5A9BC;">
															<%-- <%=c_eval_grade.get(0).get("SU_CONT").toString()%> --%>
															<a href="/project/View?pro_no=<%=c_eval_pro.get(i).get("PRO_NO").toString()%>">자세히 보기</a>
			
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
				</div>
			</div>
		</div>

		<!--==========================================================================================-->
		<!--==========================================================================================-->

		<%
      }
   
      System.out.println("포문 끝");
   %>
		<%-- <a href="./partnersEvaluation?s_email=<%=email %>" class="ui right aligned">평가 더 보기 ></a> --%>

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

		<!-- main 입력 끝-->
	</div>
	<!-- main 입력 끝-->


</body>
</html>