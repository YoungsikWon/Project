<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
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
			<h2 style="text-align: left;padding-bottom: 10px;"><%=intro.get(0).get("P_NAME") %>의 평가</h2>
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
				<div class="three wide column" style="padding-left: 0px;padding-right: 0px;">
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
							,"datasets":[{"data":[<%=avg.get(0).get("AVG_PROF") %>,<%=avg.get(0).get("AVG_ACTI") %>,<%=avg.get(0).get("AVG_SATI") %>
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
				<div class="three wide column" style="padding-left: 0px;padding-right: 0px;">
					<table>
						<tr>
							<td><strong>평점 분포</strong></td>
						</tr>
						<tr>
							<td><div class="ui small star rating" data-rating="5"></div>
							<%=avg.get(0).get("AVG_PROF") %>
							</td>
						</tr>
						<tr>
							<td><div class="ui small star rating r_four"></div>
							<%=avg.get(0).get("AVG_SATI") %></td>
						</tr>
						<tr>
							<td><div class="ui small star rating r_three"></div>
							<%=avg.get(0).get("AVG_COMM") %></td>
						</tr>
						<tr>
							<td><div class="ui small star rating r_two"></div>
							<%=avg.get(0).get("AVG_COMP") %></td>
						</tr>
						<tr>
							<td><div class="ui small star rating r_one"></div>
							<%=avg.get(0).get("AVG_ACTI") %></td>
						</tr>
					</table>
					
				</div>
				<div class="column">
				</div>
			</div>
		</div>
		
		<hr class="dotted" style="" />
		<h2 align="left">클라이언트의 평가</h2>
	<div class="ui segment" style="height: 500px;">
		<h3 class="card-title">
			<a href="#"> 모바일 어플리케이션 GUI 디자인 및 아이콘 디자인 작업</a>
		</h3>
		<div class="ui grid">
			<div class="fifteen wide column">디자인 > 어플리케이션 | 클라이언트
				TeamEveryWhere</div>
			<!-----계약금액 | 계약기간 | 계약일자------------------------->
			<div class="sixteen wide column">
				<table class="ui selectable celled table">
					<thead style="align-content: center;">
						<tr>
							<th>계약금액</th>
							<td><%=c_eval_pro.get(0).get("SU_MONEY").toString()%></td>
							<th>계약기간</th>   
							<td><%=c_eval_pro.get(0).get("PRO_PERIOD").toString()%></td>
							<th>계약일자</th>   
							<td><%=c_eval_pro.get(0).get("PRO_START").toString()%></td>
						</tr>
					</thead>
				</table>
			</div>
			<!-----평점---------------------------------------------->
			<div class="sixteen wide column " style="padding-bottom: 21px;">
				<div class="ui center aligned header">
					<div class="ui massive star rating" style=""><%=c_eval_grade.get(0).get("C_AVG_PRO").toString()%></div>
				</div>
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
								<div class="ui star rating su_prof"><%=c_eval_pro.get(0).get("SU_RPOF").toString()%></div>
							</center>
						</div>
						<div class="three wide column"
							style="border-right: solid thin; padding-bottom: 2px; padding-top: 2px;">
							<center style="padding-bottom: 5px;">결과물 만족도</center>
							<center>
								<div class="ui star rating su_sati"><%=c_eval_pro.get(0).get("SU_SATI").toString()%></div>
							</center>
						</div>
						<div class="three wide column"
							style="border-right: solid thin; padding-bottom: 2px; padding-top: 2px;">
							<center style="padding-bottom: 5px;">의사소통</center>
							<center>
								<div class="ui star rating su_comm"><%=c_eval_pro.get(0).get("SU_COMM").toString()%></div>
							</center>
						</div>
						<div class="three wide column"
							style="border-right: solid thin; padding-bottom: 2px; padding-top: 2px;">
							<center style="padding-bottom: 5px;">일정 준수</center>
							<center>
								<div class="ui star rating su_comp"><%=c_eval_pro.get(0).get("SU_COMP").toString()%></div>
							</center>
						</div>
						<div class="three wide column"
							style="padding-bottom: 2px; padding-top: 2px;">
							<center style="padding-bottom: 5px;">적극성</center>
							<center>
								<div class="ui star rating su_acti"><%=c_eval_pro.get(0).get("SU_ACTI").toString()%></div>
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
							<img class="ui hidden content" src="../image/anonymous.png">
							<img class="ui visible content" src="../image/wishket.png">
						</div>
						<div class="content" style="padding-left: 30px;">
							<a class="header" style="margin-top: 5px;"><span
								class="ui gray label">클라이언트</span></a>
							<div class="meta">
								<span><%=c_eval_info.get(0).get("C_NAME").toString()%></span>
							</div>
							<p></p>
							<div class="description">
								<div class="evaluation_txt">
									<%=c_eval_pro.get(0).get("SU_CONT").toString()%>
									<a href="#">자세히 보기</a>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
		 
		<!-- main 입력 끝-->
	</div>
	<!-- main 입력 끝-->
	

</body>
</html>