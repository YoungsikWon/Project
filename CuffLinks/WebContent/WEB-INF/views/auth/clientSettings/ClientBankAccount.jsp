<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<Map<String, Object>> projectList = (List<Map<String, Object>>) request.getAttribute("projectList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입금관리</title>
</head>
<body>

	<!----------------------------------------------------------------------- top 시작 -->
	<header class="header">
		<div class="ui">
			<!-- header 시작 -->
			<div class="ui">
				<jsp:include page="../../common/menu/headerMenu.jsp" />
			</div>
			<!-- header 종료 -->
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

		<div class="ui two column grid container" style="height: auto">
			<div class="ui column"
				style="width: 20%; padding-top: 0px; padding-left: 0px; padding-right: 0px">
				<!-- 로그인 정보 =================================================================================-->
				<div class="ui segment">
					<jsp:include page="../loginOk.jsp" />
				</div>
				<!-- 로그인 정보 =================================================================================-->

				<!-- 서브 메뉴 ===================================================================================-->
				<div class="ui fluid vertical menu" style="padding-right: 0px">
					<jsp:include page="./ClientProfileSubmenu.jsp" />
				</div>
				<!-- 서브 메뉴 ===================================================================================-->
			</div>
			<div class="ui column"
				style="padding-left: 5px; padding-top: 0px; padding-bottom: 0px; padding-right: 10px; width: 80%;">
				<div class="ui container"
					style="padding-left: 20px; padding-top: 20px; padding-bottom: 10px; left: 5px; border: 1px solid #dedede;">
					<div>
						<h3 style="text-align: left">입금 관리</h3>
					</div>
					<div class="ui two column grid container"
						style="padding-left: 0px; padding-top: 10px;">
						<div class="column" style="padding-left: 0px">
							<h5 style="text-align: left">프로젝트 대금을 입금해 주세요</h5>
						</div>
						<div class="column"
							style="text-align: right; padding-bottom: 0px;">
							<!-- 우측 빈공간 -->
						</div>
					</div>
				</div>
				<div style="height: 10px;"></div>
				<div class="ui container"
					style="padding-left: 20px; padding-right: 20px; padding-top: 30px; padding-bottom: 25px; left: 5px; border: 1px solid #dedede; height: auto;">
					<div class="ui two column grid container"
						style="padding-top: 0px; border: 1px solid #dedede;">
						<div class="column" style="width: 10%; padding: 20px">
							<img class="ui medium circular image" style="width: 40px;"
								src="../../image/process-guide-warning.png">
						</div>
						<div class="column"
							style="width: 90%; text-align: left; padding-left: 5px">
							[ 입금 관리 가이드 ]<br> 프로젝트 대금의 안전한 송금을 위해 정확한 이메일 확인이 필요합니다.
						</div>
					</div>
					<div style="padding-top: 30px;">
						<div class="ui two column grid container">
							<div class="center column container"
								style="padding: 17px; width: 30%; text-align: left;">
								<h5>기본 정보</h5>
							</div>
							<div class="column container"
								style="padding-left: 20px; padding-top: 10px; padding-bottom: 0px; width: 60%;">
								<!-- 빈공간 -->
							</div>
							<div class="center column container"
								style="padding: 17px; width: 30%;">
								<span>*</span>완료된 프로젝트 목록
							</div>
							<div class="column container" style="padding: 10px; width: 60%;">
								<div>
									<script>
										$('.tag.example .ui.dropdown')
											.dropdown({
												allowAdditions : true
											});
									</script>
									<select name="skills" class="ui fluid search dropdown"
										style="width: 73%;">
										<!-- 프로젝트 목록 표시 -->
										<option value="1">프로젝트 목록</option>
										<%
											for (Map<String, Object> project : projectList) {
										%>
										<option value="<%=project.get("PRO_NO")%>"><%=project.get("PRO_NAME")%></option>
										<%
											}
										%>
									</select>

								</div>
							</div>
							<div class="center column container"
								style="padding: 17px; width: 30%;">
								<span>*</span>입금 받을 이메일
							</div>
							<div class="column container" style="padding: 10px; width: 60%;">
								<select id='emailList' name="skills"
									class="ui fluid search dropdown" style="width: 73%;">
									<!-- 프로젝트 목록 표시 -->
									<option value="1">이메일 목록</option>
								</select>
							</div>
							<div class="center column container"
								style="padding: 17px; width: 30%;">
								<span>*</span>입금코인
							</div>
							<div class="column container" style="padding: 10px; width: 60%;">
								<div class="ui input">
									<input id="coin" type="text" placeholder="입금코인을 입력하세요."
										size="45px">
								</div>
								<div class="ui">
									<h11>','를 제외하고 입력하세요 </h11>
								</div>
							</div>
							<div class="ui container"
								style="padding-right: 30px; text-align: right;">
								<button id='insertCoin' class="ui blue button"
									onclick="insertCoin()">입금완료</button>
							</div>
							<p></p>
						</div>
						<div class="text ui container">
							<div class="ui segment">
								<table class="ui celled table">
									<thead>
										<tr>
											<th>보낸계정</th>
											<th>받은계정</th>
											<th>거래코인</th>
											<th>거래일시</th>
											<th>잔여코인</th>
										</tr>
									</thead>
									<tbody id='trans'>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<script>
			$('select').change(function() {
				emailList($(this).val())
			})
			function emailList(pro_no) {
				$.ajax({
					url : '/AuthRest/emailList',
					method : 'post',
					data : {
						pro_no : pro_no
					},
					success : function(data) {
						console.log(data)
						$('#emailList').html('<option value="1">이메일 목록</option>')
						for (d of data) {
							$('#emailList').append('<option value="' + d.S_EMAIL + '">' + d.S_EMAIL + '</option>') }
					},
					error : function(e) {
						console.log(e)
					}
				})
			}
			function insertCoin() {
				$.ajax({
					url : '/blockchain/createTransaction',
					method : 'post',
					data : {
						from : '<%=request.getAttribute("email")%>',
						to : $('#emailList').val(),
						amount : $('#coin').val()
					},
					success : function(data) {
						console.log(data)
					}
				})
				$('#coin').val('')
				mining()
			}
			function mining() {
				$.ajax({
					url : '/blockchain/mining',
					method : 'post',
					success : function(e) {
						console.log(e)
					},
					error : function(e) {
						console.log(e)
					}
				})
			}
			setInterval(function() {
				$.ajax({
					url : '/blockchain/trans',
					method : 'post',
					data : {
						address : '${email}'
					},
					dataType : 'json',
					success : function(data) {
						$('#trans').html('')
						for (d of data) {
							$('#trans').append('<tr>')
							$('#trans').append('<td>' + d.from + '</td>')
							$('#trans').append('<td>' + d.to + '</td>')
							$('#trans').append('<td>' + d.amount + '</td>')
							$('#trans').append('<td>' + d.date + '</td>')
							$('#trans').append('<td>' + d.balance + '</td>')
							$('#trans').append('</tr>') }
					}
				})
			}, 500)
		</script>

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
			<jsp:include page="../../common/menu/footerMenu.jsp" />
		</div>
	</footer>
	<!-- footer 끝-->
	<!----------------------------------------------------------------------- footer content 끝 -->
</body>
</html>