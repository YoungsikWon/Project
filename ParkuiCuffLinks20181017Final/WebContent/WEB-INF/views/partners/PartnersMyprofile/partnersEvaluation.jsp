<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>클라이언트 평가</title>
</head>
<body>

	<div class="ui container" style="padding-left: 14px;">

		<!-- main 입력 시작-->

		<div class="ui column"
			style=" padding-top: 20px; padding-bottom: 0px;">
			<h2 style="text-align: left;padding-bottom: 10px;"><%=intro.get(0).get("P_NAME").toString() %>의 평가</h2>
			<hr class="dotted" style="" />
			<div class="ui container" style="padding-top: 10px;">
				<div class="sixteen wide column">
				<table class="ui selectable celled table">
					<thead style="align-content: center;">
						<tr>
							<th><strong>계약한 프로젝트</strong></th>
							<td>
								<strong><%=pro.get(0).get("COUNT_PRO").toString()%></strong>개/
								평가 <%= grade.get(0).get("EVAL_COUNT")%>개
							</td>
							<th>프로젝트 평균평점</th>   
							<td>
								<div class="ui massive star rating" style=""></div>
								<%=grade.get(0).get("AVG_ALLPRO").toString()%>
							</td>
						</tr>
					</thead>
				</table>
			</div>
			</div>
			
		</div>
		<div class="ui grid">
			<div class="ui row" style="margin-left: 14px;margin-top: 10px">
				<div class="three wide column" style="padding-left: 0px;padding-right: 0px;margin-top: 5px;">
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
				<div class="five wide column"style="padding-left: 0px;padding-right: 0px;margin-top: 15px;">
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
				<div class=" six wide column" style="padding-left: 0px;padding-right: 0px;">
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
				</div><!-- three column grid -->
				<div class=" two wide column" style="padding-left: 0px;padding-right: 0px;margin-top: 5px;">
					<table>
						<tr>
							<td><strong>평점 분포</strong></td>
						</tr>
						<tr>
							<td style="text-align: right;"><div class="ui small star rating" data-rating="5"></div>
							<%=grade.get(0).get("5")%>명
							</td>
						</tr>
						<tr>
							<td style="text-align: right;"><div class="ui small star rating r_four"></div>
							<%=grade.get(0).get("4")%>명
							</td>
						</tr>
						<tr>
							<td style="text-align: right;"><div class="ui small star rating r_three"></div>
							<%=grade.get(0).get("3")%>명
							</td>
						</tr>
						<tr>
							<td style="text-align: right;"><div class="ui small star rating r_two"></div>
							<%=grade.get(0).get("2")%>명
							</td>
						</tr>
						<tr>
							<td style="text-align: right;"><div class="ui small star rating r_one"></div>
							<%=grade.get(0).get("1")%>명
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		
		<hr class="dotted" style="" />
		
	 <%
      for(int i=0;i<c_eval_info.size();i++){
   %>
   <div class="ui segment" style="height: 500px;text-align: left !important;">
      <h3 class="card-title">
         <a href="#"> <%=c_eval_pro.get(i).get("PRO_NAME").toString() %></a>
      </h3>
      <div class="ui grid">
         <div class="fifteen wide column"><%=c_eval_cate.get(i).get("CATE_MAIN").toString() %> > <%=c_eval_cate.get(i).get("CATE_SUB").toString() %> | 클라이언트
            TeamEveryWhere</div>
         <!-----계약금액 | 계약기간 | 계약일자------------------------->
         <div class="sixteen wide column">
            <table class="ui select able celled table">
               <thead style="align-content: center;">
                  <tr>
                     <th>계약금액</th>
                     <td><%=c_eval_pro.get(i).get("PRO_PRICE").toString()%></td>
                     <th>계약기간</th>   
                     <td><%=c_eval_pro.get(i).get("PRO_PERIOD").toString()%></td>
                     <th>계약일자</th>   
                     <td><%=c_eval_pro.get(i).get("PRO_START").toString()%></td>
                  </tr>
               </thead>
            </table>
         </div>
         <!-----평점---------------------------------------------->
         <div class="sixteen wide column " style="padding-bottom: 21px; text-align: center !important;" >
               <div class="ui massive star rating c_avg_pro" style=""></div><span style="font-size:10em"><%=c_eval_grade.get(i).get("C_AVG_PRO").toString()%></span>
         </div>
         <!----전문성|결과물만족도|의사소통|일정 준수|적극성-  -->
         <div class="sixteen wide column"
            style="padding-bottom: 7px; padding-top: 7px;">
            <div class="ui center aligned ">
               <div class="ui center five column doubling grid"
                  style="padding-bottom: 10px; padding-left: 30px;">
                  <div class="three wide column"
                     style="border-right: solid thin; padding-bottom: 2px; padding-top: 2px;">
                     <center style="padding-bottom: 5px;">전문성</center>
                     <center>
                        <div class="ui star rating su_prof"></div><%=c_eval_grade.get(i).get("SU_PROF").toString()%>
                     </center>
                  </div>
                  <div class="three wide column"
                     style="border-right: solid thin; padding-bottom: 2px; padding-top: 2px;">
                     <center style="padding-bottom: 5px;">결과물 만족도</center>
                     <center>
                        <div class="ui star rating su_sati"></div><%=c_eval_grade.get(i).get("SU_SATI").toString()%>
                     </center>
                  </div>
                  <div class="three wide column"
                     style="border-right: solid thin; padding-bottom: 2px; padding-top: 2px;">
                     <center style="padding-bottom: 5px;">의사소통</center>
                     <center>
                        <div class="ui star rating su_comm"></div><%=c_eval_grade.get(i).get("SU_COMM").toString()%>
                     </center>
                  </div>
                  <div class="three wide column"
                     style="border-right: solid thin; padding-bottom: 2px; padding-top: 2px;">
                     <center style="padding-bottom: 5px;">일정 준수</center>
                     <center>
                        <div class="ui star rating su_comp"></div><%=c_eval_grade.get(i).get("SU_COMP").toString()%>
                     </center>
                  </div>
                  <div class="three wide column"
                     style="padding-bottom: 2px; padding-top: 2px;">
                     <center style="padding-bottom: 5px;">적극성</center>
                     <center>
                        <div class="ui star rating su_acti"></div><%=c_eval_grade.get(i).get("SU_ACTI").toString()%>
                     </center>
                  </div>
               </div>
            </div>
         </div>
         <p></p>
         <!-----클라이언트 코멘트---------------------------------->
         <div class="sixteen wide column">
            <div class="ui unstackable items">
               <div class="item" style="margin-left: 30px;">
                  <div class="ui small circular rotate reveal image">
                     <img class="ui hidden content" src="../image/partnersImg/partners1.png">
                     <img class="ui visible content" src="../image/wishket.png">
                  </div>
                  <div class="content" style="padding-left: 30px;">
                     <a class="header" style="margin-top: 5px;"><span
                        class="ui gray label">클라이언트</span></a>
                     <div class="meta">
                        <span><%=c_eval_info.get(i).get("C_NAME").toString()%></span>
                     </div>
                     <p></p>
                     <div class="description">
                        <div class="evaluation_txt">
                           <%=c_eval_grade.get(i).get("SU_CONT").toString()%>
                           <a href="#">자세히 보기</a>

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
   <a href="./partnersEvaluation?s_email=<%=email %>" class="ui right aligned">평가 더 보기 ></a>

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