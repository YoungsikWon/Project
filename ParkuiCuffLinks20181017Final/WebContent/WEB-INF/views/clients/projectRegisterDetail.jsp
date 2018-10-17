<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%


	int[] DayArray = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	String today = "";

	Calendar cal = Calendar.getInstance();

	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy:MM:dd-hh:mm:ss");
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;
	int day = cal.get(Calendar.DAY_OF_MONTH);
	int day2 = cal.get(Calendar.DAY_OF_MONTH);
	int index = month + 1;
	int start = 14;
	int cnt = 0;
	int cnt2 = 0;
	int end = 30;
	int over = 0;

	today = String.valueOf(year) + "-" + String.valueOf(month) + "-" + String.valueOf(day);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>projectRegister-(프로젝트 등록)</title>
</head>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>
body {
	padding: 1em;
}

.ui.action.input input[type="file"] {
	display: none;
}
</style>
<body>
	<!----------------------------------------------------------------------- top 시작 -->
	<header class="header">
		<div class="ui">
			<!-- header 시작 -->
			<div class="ui">
				<jsp:include page="../common/menu/headerMenu.jsp" />
			</div>
			<!-- header 종료 -->
		</div>
	</header>
	<script type="text/javascript">
	
		$(document).ready(function() {
			$("#pro_partners").show();
			$("#pro_partners2").hide();
		
			$("#pro_skill").click(function(){
				
				if($("#pro_skill").val()=='개발'){
					$("#pro_partners").show();
					$("#pro_partners2").hide();
				}
				else{
					$("#pro_partners").hide();
					$("#pro_partners2").show();
				}
			});
		
			
			$("#ProjectRegisterDetailButton").click(function() {
			

				if($("#pro_name").val()==""){
					alert("프로젝트 제목을 입력하세요");
					$("#pro_name").focus();
				}
				else if($("#pro_period").val()==""){
					alert("기간을 입력하세요");
					$("#pro_period").focus();
				}
				else if($("#pro_price").val()==""){
					alert("가격을 입력하세요");
					$("#pro_price").focus();
				}
				else if($("#pro_contents").val()==""){
					alert("내용을 입력하세요");
					$("#pro_contents").focus();
				}
				else if($("#pro_addr").val()==""){
					alert("주소을 입력하세요");
					$("#pro_addr").focus();
				}
				else{
					$("#ClientProjectRegiste").attr("action","/client/projectRegister");
					$("#ClientProjectRegiste").submit();
				}
			
			});
	
			$("input:text").click(function() {
				$(this).parent().find("input:file").click();
			});
	
			$('input:file', '.ui.action.input')
				.on('change', function(e) {
					var name = e.target.files[0].name;
					$('input:text', $(e.target).parent()).val(name);
				});
	
			$('#Add_address').click(function() {
				///PartnersImages
				new daum.Postcode({
					oncomplete : function(data) {
						//지번
						$("#pro_addr").val(data.jibunAddress);
						$("#pro_addr").val(data.roadAddress);
		
					}
				}).open();
		
			});
		});
		

		
		
	</script>
	<!----------------------------------------------------------------------- top 끝 -->

	<!----------------------------------------------------------------------- main content 시작 -->
	<!----------------------------------------------------------------------- main content 시작 -->
	<div class="ui container raised segment content">

		<!-- title 시작-->
		<div class="ui container">
			<div class="content-header">
				<div class="ui two column grid container">
					<div class="column" style="text-align: left; width: 80%;">
						<h3 class="content-text">프로젝트 상세내용 등록</h3>
						<small class="small-text">상세하게 작성해주실수록 더 적합한 파트너스를 만날 수
							있습니다.</small>
					</div>
					<div class="column"
						style="text-align: right; margin: 10px 0px; width: 20%;">
						<!-- 우측에 입력할 수 있는 공간 확보 -->
					</div>
				</div>
			</div>
		</div>
		<!-- title 끝-->

		<div class="ui basicspace">
			<!-- login title와 main content 여백 -->
		</div>

		<!-- main 입력 시작-->
		<div class="ui container">
			<div class="content-middle-join">
				<form id = "ClientProjectRegiste" method = "post" enctype="multipart/form-data">
					<div class="ui two column grid container" style="padding: 0px;">
			
						<div class="column grid"
							style="border-right: 0px solid #dedede; vertical-align: middle; padding: 20px; width: 100%;">
							<div class="ui two column grid container">
								<div class="center column container"
									style="padding: 17px; width: 25%;">
									<span>*</span>카테고리
								</div>
								<div class="column container"
									style="padding: 10px; padding-bottom: 5px; width: 75%;">
									<div style="width: 25%; float: left;">
										<select id="pro_skill" name="pro_skill"
											class="ui fluid search dropdown">
											<option value="개발">개발</option>
											<option value="디자인">디자인</option>
										</select>
									</div>
									<div style="width: 50%; float: left; margin-left: 20px;">
										<select id="pro_partners" name="pro_partners"
											class="ui fluid search dropdown">
											<option value="웹">웹</option>
											<option value="애플리케이션">애플리케이션</option>
											<option value="워드프레스">워드프레스</option>
											<option value="퍼블리싱">퍼블리싱</option>
											<option value="일반소프트웨어">일반소프트웨어</option>
											<option value="커머스, 쇼핑몰">커머스, 쇼핑몰</option>
											<option value="게임">게임</option>
											<option value="임베디드">임베디드</option>

										</select>
										<select id="pro_partners2" name="pro_partners2"
											class="ui fluid search dropdown">

											<option value="웹">웹</option>
											<option value="애플리케이션">애플리케이션</option>
											<option value="제품">제품</option>
											<option value="프레젠테이션">프레젠테이션</option>
											<option value="인쇄물">인쇄물</option>
									        <option value="커머스, 쇼핑몰">커머스, 쇼핑몰</option>
											<option value="로고">로고</option>
											<option value="그래픽">그래픽</option>
									        <option value="영상">영상</option>
											<option value="게임">게임</option>
											<option value="기타">기타</option>

										</select>
									</div>
								</div>
								<div class="column container"
									style="padding-left: 10px; padding-top: 0px; padding-bottom: 0px; width: 25%;"></div>
								<div class="column container"
									style="padding-left: 10px; padding-top: 0px; padding-bottom: 5px; width: 75%; text-align: left;">
									<p>프로젝트 카테고리를 선택해 주세요.</p>
								</div>
								<div class="center column container"
									style="padding: 17px; width: 25%;">
									<span>*</span>프로젝트 제목
								</div>
								<div class="column container"
									style="padding: 10px; padding-bottom: 5px; width: 75%; text-align: left;">
									<div class="ui input">
										<input id="pro_name" name="pro_name" type="text"
											placeholder="프로젝트 제목을 입력하세요." size="60px">
									</div>
								</div>
								<div class="column container"
									style="padding-left: 10px; padding-top: 0px; padding-bottom: 0px; width: 25%;"></div>
								<div class="column container"
									style="padding-left: 10px; padding-top: 0px; padding-bottom: 5px; width: 75%; text-align: left;">
									<p>프로젝트 제목을 입력해 주세요. (30자 이내)</p>
								</div>
								<div class="center column container"
									style="padding: 17px; width: 25%;">
									<span>*</span>예상 기간
								</div>
								<div class="column container"
									style="padding: 10px; padding-bottom: 0px; width: 75%; text-align: left;">
									<div class="ui input" style="float: left;">
										<input id="pro_period" name="pro_period" type="text"
											size="20px">
									</div>
									<div
										style="width: 40px; height: 38px; border: 1px solid #dedede; float: left; padding: 9px; background-color: #dedede;">일
									</div>
								</div>
								<div class="column container"
									style="padding-left: 10px; padding-top: 0px; padding-bottom: 0px; width: 25%;"></div>
								<div class="column container"
									style="padding-left: 10px; padding-top: 0px; padding-bottom: 5px; width: 75%; text-align: left;">
									<p>프로젝트를 진행할 기간을 일 단위로 입력해 주세요. (최대 3자리)</p>
								</div>
								<div class="center column container"
									style="padding: 17px; width: 25%;">
									<span>*</span>지출 가능 예산
								</div>
								<div class="column container"
									style="padding: 10px; padding-bottom: 0px; width: 75%; text-align: left;">
									<div class="ui input" style="float: left;">
										<input id="pro_price" name="pro_price" type="text" size="20px">
									</div>
									<div
										style="width: 40px; height: 38px; border: 1px solid #dedede; float: left; padding: 9px; background-color: #dedede;">원
									</div>
								</div>
								<div class="column container"
									style="padding-left: 10px; padding-top: 0px; padding-bottom: 0px; width: 25%;"></div>
								<div class="column container"
									style="padding-left: 10px; padding-top: 0px; padding-bottom: 5px; width: 75%; text-align: left;">
									<p>
										지출 가능한 예산을 입력해 주세요.<br> (부가세 별도, 예 : 100,000,000)
									</p>
								</div>

								<div class="center column container"
									style="padding: 17px; width: 25%;">
									<span>*</span>기획 상태
								</div>
								<div class="column container"
									style="padding-left: 2px; padding-top: 10px; padding-bottom: 5px; width: 75%; text-align: center;">
									<div class="column container" style="padding: 10px;">
										<div class="ui two column grid container"
											style="padding: 10px; padding-left: 0; text-align: center;">
											<div class="column container"
												style="margin-right: 5px; padding: 10px; width: 32%; margin-left: 0px; text-align: center; vertical-align: middle; outline: dotted gray 0.5px;">
												<div class="ui image">
													<img src="/image/p1.png" width=75px height=75px
														style="padding: 10px">
												</div>
												<div>
													<input type="radio" id="pro_plan" name="pro_plan"
														checked="checked" value="아이디어만 있습니다.">
												</div>
												<div>
													<p>아이디어만 있습니다.</p>
												</div>
											</div>
											<div class="column container"
												style="margin-right: 5px; padding: 10px; width: 32%; text-align: center; vertical-align: middle; outline: dotted gray 0.5px;">

												<div class="ui image">
													<img src="/image/p2.png" width=75px height=75px
														style="padding: 10px">
												</div>
												<div>
													<input type="radio" id="pro_plan" name="pro_plan"
														checked="checked" value="필요한 내용들을 간단히 정리해두었습니다.">
												</div>
												<div>
													<p>필요한 내용들을 간단히 정리해두었습니다.</p>
												</div>
											</div>
											<div class="column container"
												style="padding: 10px; width: 32%; text-align: center; vertical-align: middle; outline: dotted gray 0.5px;">

												<div class="ui image">
													<img src="/image/p3.png" width=75px height=75px
														style="padding: 10px">
												</div>
												<div>
													<input type="radio" name="pro_plan" checked="checked"
														value="상세한 기획 문서가 존재합니다.">
												</div>
												<div>
													<p>
														상세한 기획 문서가 <br>존재합니다.
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="center column container"
									style="padding: 17px; width: 25%;">
									<span>*</span>프로젝트 내용<br> <br> <br> <br> <br>
									<br>
								</div>
								<div class="column container"
									style="padding-top: 0px; width: 75%; padding-left: 10px;">
									<div class="ui comments">
										<div class="field">
											<textarea id="pro_contents" name="pro_contents"
												style="margin-top: 0px; margin-bottom: 0px; width: 100%; height: 170px;"></textarea>
										</div>
									</div>
								</div>

		<!-- 						<div class="center column container"
									style="padding: 17px; width: 25%;">
									<span>*</span>관련 기술
								</div>
								<div class="column container"
									style="padding: 10px; padding-bottom: 5px; width: 75%; text-align: left;">
									<div class="ui input">
										<input id = "pro_" type="text" placeholder="프로젝트 제목을 입력하세요." size="60px">
									</div>
								</div> -->
								<div class="column container"
									style="padding-left: 10px; padding-top: 0px; padding-bottom: 0px; width: 25%;"></div>
								<div class="column container"
									style="padding-left: 10px; padding-top: 0px; padding-bottom: 5px; width: 75%; text-align: left;">
									<p>
										프로젝트와 관련된 기술을 입력해주세요. <br> 예) Photoshop, Android, HTML5,
										Python, Django
									</p>
								</div>

								<div class="center column container"
									style="padding: 17px; width: 25%;">
									<span>*</span>기획 관련 파일
								</div>
								<div class="column container"
									style="padding: 10px; padding-bottom: 5px; width: 75%; text-align: left;">
								<div class="ui action input">
										<input  type="text"
											placeholder="파일첨부창" readonly> <input id="pro_file" name="pro_file" type="file">
										<div class="ui icon button">
											<i class="attach icon"></i>
										</div>
									</div> 
	                   <!--            <input id="pro_file" name="pro_file" type="file" class="inputfile" /> -->
                                  
								</div>
								<div class="column container"
									style="padding-left: 10px; padding-top: 0px; padding-bottom: 0px; width: 25%;"></div>
								<div class="column container"
									style="padding-left: 10px; padding-top: 0px; padding-bottom: 5px; width: 75%; text-align: left;">
									<p>
										첨부 파일은 파트너들에게 공개되지 않습니다.<br> 첨부 파일은 프로젝트 금액 및 기간 산정을 위한
										검수 자료로만 사용됩니다.
									</p>
								</div>

								<div class="center column container"
									style="padding: 17px; width: 25%;">
									<span>*</span>모집 마감일자
								</div>
								<div class="column container"
									style="padding: 10px; padding-bottom: 5px; width: 75%; text-align: left;">
									<div class="ui input">
										<select name="pro_end" id="pro_end"
											class="ui fluid search dropdown">
											<option value="0">마감일선택</option>
											<%
												for (int i = month; i < end; i++) {

													for (int j = day; j < day + end; j++) {
														cnt++;
											%>
											<option value=<%="2018-" + i + "-" + j%>><%="2018-" + i + "-" + j%></option>
											<%
												if (j == DayArray[month - 1]) {
															month = month + 1;
															day = 1;
															over++;

														}

														if (cnt == end) {
															end = month;

														}
													}
												}
											%>
										</select>
									</div>
								</div>
								<div class="column container"
									style="padding-left: 10px; padding-top: 0px; padding-bottom: 0px; width: 25%;"></div>
								<div class="column container"
									style="padding-left: 10px; padding-top: 0px; padding-bottom: 5px; width: 75%; text-align: left;">
									<p>지원자를 모집하는 기간입니다. 최소 1일에서 최대 14일까지 가능합니다.</p>
								</div>

								<div class="center column container"
									style="padding: 17px; width: 25%;">
									<span>*</span>클라이언트 위치
								</div>

								<div class="column container"
									style="padding: 5px; padding-bottom: 5px; width: 75%; text-align: left;">
							
										<div class="column container" style="padding: 10px; width: 70%;">
								<div class="ui input">
									<input id = "pro_addr" name = "pro_addr" type="text" size="44px">
										<div class="ui input">
											<button id="Add_address" type="button"
												class="ui basic button">
												<i class="icon user"></i> 주소등록
											</button>
										</div>
								</div>
							</div>
								</div>
								<div class="column container"
									style="padding-left: 10px; padding-top: 0px; padding-bottom: 0px; width: 25%;"></div>
								<div class="column container"
									style="padding-left: 10px; padding-top: 0px; padding-bottom: 5px; width: 75%; text-align: left;">
									<p>클라이언트님이 계신 지역을 선택해 주세요..</p>
								</div>

								<div class="center column container"
									style="padding: 17px; width: 25%;">
									<span>*</span>예상 시작일
								</div>
								<div class="column container"
									style="padding: 10px; padding-bottom: 5px; width: 75%; text-align: left;">
									<div class="ui input">
										<select name="pro_start" id="pro_start"
											class="ui fluid search dropdown">
											<option value="0">시작일선택</option>
											<%
												month = month - over;

												for (int i = month; i < start; i++) {

													for (int j = day2; j < day2 + start; j++) {
														cnt2++;
											%>
											<option value=<%="2018-" + i + "-" + j%>><%="2018-" + i + "-" + j%></option>
											<%
												if (j == DayArray[month - 1]) {
															month = month + 1;
															day2 = 1;
														}

														if (cnt2 == start) {
															start = month;
														}
													}
												}
											%>
										</select>
									</div>
								</div>
								<div class="column container"
									style="padding-left: 10px; padding-top: 0px; padding-bottom: 0px; width: 25%;"></div>
								<div class="column container"
									style="padding-left: 10px; padding-top: 0px; padding-bottom: 5px; width: 75%; text-align: left;">
									<p>프로젝트 시작예정일을 입력해주세요.</p>
								</div>
								<div class="column container"
									style="padding-left: 10px; padding-top: 0px; padding-bottom: 0px; width: 25%;"></div>
								<div class="column container"
									style="padding-left: 10px; padding-top: 0px; padding-bottom: 5px; width: 75%; text-align: left;">
									<hr class="garo" />
								</div>

								<div class="center column container"
									style="padding: 17px; width: 25%;">
									<span>*</span>프로젝트 매니징 경험
								</div>
								<div class="column container"
									style="padding: 10px; padding-bottom: 5px; padding-top: 20px; width: 75%; text-align: left;">
									<input type="radio"  name="pro_management" class="r1" value = "있음" checked="checked"/>&nbsp;&nbsp;예,
									매니징 경험이 있습니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
										type="radio"  name="pro_management" class="r2"value = "없다" checked="checked"/>&nbsp;&nbsp; 아니오,
									없습니다.
								</div>

								<div class="center column container"
									style="padding: 17px; width: 25%;">
									<span>*</span>선호하는 파트너 형태
								</div>
								<div class="column container"
									style="padding: 10px; padding-bottom: 5px; padding-top: 20px; width: 75%; text-align: left;">
									<input type="radio"  name="pro_partner" class="r3" value = "상관없음." checked="checked" />&nbsp;&nbsp;상관
									없음.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
										  name="pro_partner" class="r4" value = "범인사업자." checked="checked"/>&nbsp;&nbsp;법인
									사업자&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <input type="radio"
										 name="pro_partner" class="r4" value = "개인사업자" checked="checked"/>&nbsp;&nbsp;개인
									사업자.&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <input type="radio"
										 name="pro_partner" class="r4" value = "개인" checked="checked"/>&nbsp;&nbsp;팀&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp; <input type="radio" name="pro_partner" class="r4" checked="checked"/>&nbsp;&nbsp;개인
								</div>
								<div class="column container"
									style="padding-left: 10px; padding-top: 0px; padding-bottom: 0px; width: 25%;"></div>
								<div class="column container"
									style="padding-left: 10px; padding-top: 20px; padding-bottom: 5px; width: 75%; text-align: right;">
									<div id="ProjectRegisterDetailButton"
										class="ui blue labeled submit icon button ">
										<i class="icon edit"></i> 프로젝트 정보 등록완료
									</div>
								</div>
							</div>
						</div>
						<div class="column grid" style="padding: 10px; width: 00%;">
							<!-- 우측 내용입력할수 있는 공간 -->
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- main 입력 끝-->

	</div>
	<!----------------------------------------------------------------------- main content 끝 -->
	<!----------------------------------------------------------------------- main content 끝 -->

	<!----------------------------------------------------------------------- footer content 시작 -->
	<!-- footer 시작-->
	<footer class="footer">
		<div class="ui inverted segment"
			style="height: 200px; padding: 25px; vertical-align: middle;">
			<jsp:include page="../common/menu/footerMenu.jsp" />
		</div>
	</footer>
	<!-- footer 끝-->
	<!----------------------------------------------------------------------- footer content 끝 -->
	<script>
		$('.tag.example .ui.dropdown')
			.dropdown({
				allowAdditions : true
			});
	</script>
</body>
</html>