<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../common/ui.jsp"/>
<meta charset="UTF-8">
<title>계좌관리
</title>
<link rel="stylesheet" href="./css/cuffLink.css" />
<link rel="stylesheet" href="./css/login.css" />
</head>
<body>
<!----------------------------------------------------------------------- top 시작 -->
	<header class="header">
		<div class="ui">
	<!-- header 시작 -->
			<div class="ui">
				<jsp:include page="../../common/menu/headerMenu.jsp"/>
			</div>
	<!-- header 종료 -->
	
			<div class="ui"><!-- header와 navigation 여백 --></div>
	
	<!-- navigation menu 시작 -->
			<div class="ui navigation">
				<jsp:include page="../../common/menu/navigationClientMenu.jsp"/>
			</div>
	<!-- navigation menu 종료-->
		</div>
	</header>
<!----------------------------------------------------------------------- top 끝 -->

	<div class="ui basicspace"><!-- navigation menu와 여백 --></div>
	
<!--======================================================================================-->
<!----------------------------------------------------------------------- main content 시작 -->

	<div class="ui container" >
	
	<!-- main 입력 시작-->

		<div class="ui two column grid container" style="height: 720px">
			<div class="ui column" style="width: 20%;padding-top: 0px;padding-left: 0px;padding-right: 0px">
<!-- 로그인 정보 =================================================================================-->
				<div class="ui segment">
					<jsp:include page="../loginOk.jsp" />
				</div>
<!-- 로그인 정보 =================================================================================-->

<!-- 서브 메뉴 ===================================================================================-->
				<div class="ui fluid vertical menu" style="padding-right: 0px">
					<jsp:include page="./partnersProfileSubmenu.jsp" />
				</div>
<!-- 서브 메뉴 ===================================================================================-->
			</div>
			<div class="ui column" style="padding-left: 5px; padding-top: 0px; padding-bottom: 0px; padding-right: 10px; width: 80%;">
				<div class="ui container" style="padding-left: 20px; padding-top: 20px; padding-bottom: 10px; left: 5px; border: 1px solid #dedede;">
					<div>
						<h3 style="text-align: left">계좌 관리</h3>
					</div>
					<div class="ui two column grid container" style="padding-left: 0px; padding-top: 10px;">
						<div class="column" style="padding-left: 0px">
							<h5 style="text-align: left">프로젝트 대금을 지급받을 계좌 정보를 등록해주세요.</h5>
						</div>
						<div class="column" style="text-align:right; padding-bottom:0px;">
							<!-- 우측 빈공간 -->
						</div>
					</div>
				</div>
				<div style="height: 10px;"></div>
				<div class="ui container" style="padding-left: 20px; padding-right:20px; padding-top: 30px; padding-bottom: 25px; left: 5px; border: 1px solid #dedede; height:auto;">
					<div class="ui two column grid container" style="padding-top: 0px; border: 1px solid #dedede;">
						<div class="column" style="width: 10%; padding: 20px">
							<img class="ui medium circular image" style="width: 40px;" src="../../image/process-guide-warning.png">
						</div>
						<div class="column" style="width: 90%;text-align: left; padding-left: 5px ">
							[ 계좌 관리 가이드 ]<br>
							프로젝트 대금의 안전한 송금을 위해 정확한 계좌번호가 필요합니다.
						</div>
					</div>
					<div style="padding-top:30px;">
						<div class="ui two column grid container">
							<div class="center column container" style="padding: 17px; width: 30%; text-align: left;">
								<h5>기본 정보</h5>
							</div>
							<div class="column container" style="padding-left: 20px; padding-top: 10px; padding-bottom: 0px; width: 60%;">
								<!-- 빈공간 -->
							</div>
							<div class="center column container" style="padding: 17px; width: 30%;">
								<span>*</span>은행명
							</div>
							<div class="column container" style="padding: 10px; width: 60%;">
								<div>
									<script>
										$('.tag.example .ui.dropdown')
											.dropdown({
												allowAdditions : true
											});
									</script>
									<select name="skills" class="ui fluid search dropdown" style="width:73%;">
										<option value="1">은행선택</option>
										<option value="1">한국산업은행</option>
										<option value="2">기업은행</option>
										<option value="3">국민은행</option>
										<option value="4">우리은행</option>
										<option value="5">신한은행</option>
										<option value="6">하나은행</option>
										<option value="7">농협</option>
										<option value="8">단위농협</option>
										<option value="9">SC은행</option>
										<option value="10">외환은행</option>
										<option value="11">한국씨티은행</option>
										<option value="12">우체국</option>
										<option value="13">경남은행</option>
										<option value="14">광주은행</option>
										<option value="15">대구은행</option>
										<option value="16">도이치</option>
										<option value="17">부산은행</option>
										<option value="18">산림조합</option>
										<option value="19">산업은행</option>
										<option value="20">상호저축은행</option>
										<option value="21">새마을금고</option>
										<option value="22">수협</option>
										<option value="23">신협중앙회</option>
										<option value="24">전북은행</option>
										<option value="25">제주은행</option>
										<option value="26">BOA</option>
										<option value="27">HSBC</option>
										<option value="28">JP모간</option>
										<option value="29">교보증권</option>
										<option value="30">대신증권</option>
										<option value="31">대우증권</option>
										<option value="32">동부증권</option>
										<option value="33">동양증권</option>
										<option value="34">메리츠증권</option>
										<option value="35">미래에셋</option>
										<option value="36">부국증권</option>
										<option value="37">삼성증권</option>
										<option value="38">솔로몬투자증권</option>
										<option value="39">신영증권</option>
										<option value="40">신한금융투자</option>
										<option value="41">우리투자증권</option>
										<option value="42">유진투자은행</option>
										<option value="43">이트레이드증권</option>
										<option value="44">키움증권</option>
										<option value="45">하나대투</option>
										<option value="46">하이투자</option>
										<option value="47">한국투자</option>
										<option value="48">한화증권</option>
										<option value="49">현대증권</option>
										<option value="50">HMC증권</option>
										<option value="51">LIG투자증권</option>
										<option value="52">NH증권</option>
										<option value="53">SK증권</option>
										<option value="54">비엔비파리바은행</option>
										<option value="55">케이뱅크</option>
										<option value="56">카카오뱅크</option>	
									</select>
								</div>
							</div>
							<div class="center column container" style="padding: 17px; width: 30%;">
								<span>*</span>예금주
							</div>
							<div class="column container" style="padding: 10px; width: 60%;">
								<div class="ui input">
									<input type="text" placeholder="예금주를 입력하세요." size="45px">
								</div>
							</div>
							<div class="center column container" style="padding: 17px; width: 30%;">
								<span>*</span>계좌번호
							</div>
							<div class="column container" style="padding: 10px; width: 60%;">
								<div class="ui input">
									<input type="text" placeholder="계좌번호를 입력하세요." size="45px">
								</div>
								<div class="ui">
									<h11>'-'를 제외하고 입력해주세요.</h11>
								</div>
							</div>
							<div class="ui container" style="padding-right:30px; text-align:right;">
								<button class="ui blue button" >등록완료</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


	<!-- main 입력 끝-->

	</div>

<!----------------------------------------------------------------------- main content 끝 --->
<!--======================================================================================-->
	
	<div class="ui basicspace"><!-- login title와 main content 여백 -->	</div>
	
<!----------------------------------------------------------------------- footer content 시작 -->
	<!-- footer 시작-->
		<footer class="footer">
			<div class="ui inverted segment">
					<jsp:include page="../../common/menu/footerMenu.jsp"/>
			</div>
		</footer>
	<!-- footer 끝-->
<!----------------------------------------------------------------------- footer content 끝 -->
</body>
</html>