<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../common/ui.jsp"/>
<meta charset="UTF-8">
<title>계정설정(기본수정)
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

		<div class="ui two column grid container" style="padding:5px;height: auto">
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
						<h3 style="text-align: left">기본 정보 수정</h3>
					</div>
					<div class="ui two column grid container" style="padding-left: 0px; padding-top: 10px;">
						<div class="column" style="padding-left: 0px">
							<h5 style="text-align: left">계정의 기본 정보들을 수정할 수 있습니다.</h5>
						</div>
						<div class="column" style="text-align:right; padding-bottom: 0px;">
							<h11 style="text-align: right; padding-right:10px;"><a href="">클라이언트 정보 수정하기 ></a></h6>
						</div>
					</div>
				</div>
				<div style="height: 10px;"></div>
				<div class="ui container" style="padding-left: 20px; padding-top: 20px; padding-bottom: 20px; left: 5px; border: 1px solid #dedede; height:auto;">
					<div class="ui two column grid container">
						<div class="center column container" style="padding: 17px; width: 30%; text-align: left;">
							<h5>계정 정보</h5>
						</div>
						<div class="column container" style="padding-left: 20px; padding-top: 10px; padding-bottom: 0px; width: 70%;">
							<!-- 빈공간 -->
						</div>
						<div class="center column container" style="padding-left: 20px; padding-top: 10px; padding-bottom: 0px; width: 30%;">
							아이디
						</div>
						<div class="column container" style="padding-left: 20px; padding-top: 10px; padding-bottom: 0px; width: 70%;">
							twins0313
						</div>
						<div class="center column container" style="padding-left: 20px; padding-top: 10px; padding-bottom: 0px; width: 30%;">
							이메일
						</div>
						<div class="column container" style="padding-left: 20px; padding-top: 10px; padding-bottom: 0px; width: 70%;">
							twins0313@naver.com
						</div>
						<div class="ui one column container" style="padding-left: 10px; padding-top:10px; padding-bottom:0px; padding-right:30px; width: 100%;">
							<hr class="dotted"/>
						</div>
						<div class="center column container" style="padding: 17px; width: 30%; text-align: left;">
							<h5>기본 정보</h5>
						</div>
						<div class="column container" style="padding-left: 20px; padding-top: 10px; padding-bottom: 0px; width: 70%;">
							<!-- 빈공간 -->
						</div>
						<div class="center column container" style="padding: 17px; width: 30%;">
							<span>*</span>프로필 사진
						</div>
						<div class="column container" style="padding: 10px; width: 70%;">
							<div class="ui input">
								<input type="text" placeholder="제출된 '프로필 이미지'가 없습니다." size="44px">
							</div>
							<div class="ui input">
								<button class="ui basic button">
										 <i class="icon user"></i>
										  이미지 등록
								</button>
							</div>
							<div class="ui input">
								<p>이미지 파일(.jpg, .jpeg, .png, .gif 등)만 업로드할 수 있습니다.<br>
								등록한 이미지는 위시켓에서 프로필 사진으로 사용됩니다.<br>
								신원 인증 서류는 [신원 인증]에서 등록할 수 있습니다.</p>
							</div>
						</div>
						<div class="center column container" style="padding: 17px; width: 30%;">
							<span>*</span>클라이언트 형태
						</div>
						<div class="column container" style="padding: 10px; width: 70%;">
							<div>
								<script>
									$('.tag.example .ui.dropdown')
										.dropdown({
											allowAdditions : true
										});
								</script>
								<select name="skills" class="ui fluid search dropdown" style="width:60.5%;">
									<option value="">개인</option>
									<option value="angular">팀</option>
									<option value="css">개인 사업자</option>
									<option value="design">법인 사업자</option>
								</select>
							</div>
						</div>
						<div class="center column container" style="padding: 17px; width: 30%;">
							<span>*</span>이름
						</div>
						<div class="column container" style="padding: 10px; width: 70%;">
							<div class="ui input">
								<input type="text" placeholder="이름을 입력하세요." size="45px">
							</div>
						</div>
						<div class="center column container" style="padding: 17px; width: 30%;">
							<span>*</span>성별
						</div>
						<div class="column container" style="padding: 10px; width: 70%;">
							<div class="ui input">
								<div class="ui form">
								  <div class="grouped fields">
								    <div class="field">
								      <div class="ui radio checkbox">
								        <input type="radio" name="example2" checked="checked">
								        <label>남</label>
								      </div>
								    </div>
								    <div class="field">
								      <div class="ui radio checkbox">
								        <input type="radio" name="example2">
								        <label>여</label>
								      </div>
								    </div>
								  </div>
								</div>
							</div>
						</div>
						<div class="center column container" style="padding: 17px; width: 30%;">
							<span>*</span>생년월일
						</div>
						<div class="column container" style="padding: 10px; width: 70%;">
							<div class="ui input">
								<select name="skills" class="ui search dropdown">
									<option value="">2018</option>
								</select>
								<i class="window minimize outline icon" style="padding:5px; color:gray;"></i><input type="text" size="5px"><i class="window minimize outline icon" style="padding:5px; color:gray;"></i><input type="text" size="5px">
							</div>
						</div>
						<div class="center column container" style="padding: 17px; width: 30%;">
							<span>*</span>지역 - 시, 도
						</div>
						<div class="column container" style="padding: 10px; width: 70%;">
							<select name="skills" class="ui fluid search dropdown" style="width:60%;">
								<option value="">시도</option>
								<option value="angular">서울</option>
								<option value="css">광주</option>
								<option value="design">해외</option>
							</select>
						</div>
						<div class="center column container" style="padding: 17px; width: 30%;">
							<span>*</span>세부 지역 - 시, 군, 구
						</div>
						<div class="column container" style="padding: 10px; width: 70%;">
							<select name="skills" class="ui fluid search dropdown" style="width:60%;">
								<option value="">선택</option>
							</select>
						</div>
						<div class="center column container" style="padding: 17px; width: 30%;">
							<span>*</span>나머지 주소
						</div>
						<div class="column container" style="padding: 10px; width: 70%;">
							<div class="ui input">
								<input type="text" size="44px">
							</div>
						</div>
						<div class="center column container" style="padding: 17px; width: 30%;">
							<span>*</span>세금계산서용 이메일
						</div>
						<div class="column container" style="padding: 10px; width: 70%;">
							<div class="ui input">
								<input type="text" size="44px">
							</div>
							<div style="padding-right:20px; text-align:right;">
								<button class="ui blue button" >등록완료</button>
							</div>
						</div>
						<div class="ui one column container" style="padding-left: 10px; padding-top:10px; padding-bottom:0px; padding-right:30px; width: 100%;">
							<hr class="dotted"/>
						</div>
						<div class="center column container" style="padding: 17px; width: 30%; text-align: left;">
							<h5>연락처 정보</h5>
						</div>
						<div class="column container" style="padding-left: 20px; padding-top: 10px; padding-bottom: 0px; width: 70%;">
							<!-- 빈공간 -->
						</div>
						<div class="center column container" style="padding: 17px; width: 30%;">
							<span>*</span>담당자 핸드폰
						</div>
						<div class="column container" style="padding: 10px; width: 70%;">
							<div class="ui input">
								<select name="skills" class="ui search dropdown">
									<option value="010">국내</option>
									<option value="011">해외</option>
								</select>&nbsp;&nbsp;&nbsp;
								<select name="skills" class="ui search dropdown">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
									<option value="foreign">해외</option>
								</select>
								<i class="window minimize outline icon" style="padding:5px; color:gray;"></i><input type="text" size="7px"><i class="window minimize outline icon" style="padding:5px; color:gray;"></i><input type="text" size="6px">
							</div>
						</div>
						<div class="center column container" style="padding: 17px; width: 30%;">
							<span>*</span>전화번호
						</div>
						<div class="column container" style="padding: 10px; width: 70%;">
							<div class="ui input">
								<select name="skills" class="ui search dropdown">
									<option value="010">국내</option>
									<option value="011">해외</option>
								</select>&nbsp;&nbsp;&nbsp;
								<select name="skills" class="ui search dropdown">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
									<option value="foreign">해외</option>
								</select>
								<i class="window minimize outline icon" style="padding:5px; color:gray;"></i><input type="text" size="22px">
							</div>
						</div>
						<div class="center column container" style="padding: 17px; width: 30%;">
							<span>*</span>팩스번호
						</div>
						<div class="column container" style="padding: 10px; width: 70%;">
							<div class="ui input">
								<input type="text" size="45px">
							</div>
							<div style="padding-right:20px; text-align:right;">
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