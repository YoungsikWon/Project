<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코인충전</title>
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
			<div class="ui column" style="width: 20%; padding-top: 0px; padding-left: 0px; padding-right: 0px">
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
<!-- ********************************************************************************************************************************************************우측내용 높이설정수정  -->			
			<div class="ui column" style="padding-left: 5px; padding-top: 0px; padding-bottom: 0px; width: 80%; min-height: 670px; height: auto">
				<div class="ui container" style="padding: 20px; padding-bottom: 20px; left: 5px; border: 1px solid #dedede; height: 100%;">
<!-- ********************************************************************************************************************************************************우측내용 높이설정수정  -->
					<div style="padding-bottom: 20px;">
						<h3 style="text-align: left">코인충전</h3>
					</div>
					<div class="ui container" style="padding-top: 0px; padding-bottom: 30px; padding-left: 0px; padding-right: 20px;">
						<hr class="dotted" style="" />
					</div>
					<div style="text-align: center;">
						<h4>
							현 코인 : <span id="myCoin"></span>
						</h4>
						<div class="ui action input">
							<input type="text" placeholder="입금할 금액" id='coin'>
							<button class="ui button" onclick="transaction()">입금</button>
						</div>
					</div>
					<p></p>
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
	<script>
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
	
		setInterval(() => {
			$.ajax({
				url : '/blockchain/myCoin',
				method : 'post',
				data : {
					email : '${email}'
				},
				success : function(data) {
					$('#myCoin').text(data)
				}
			})
		}, 500);
	
		function transaction() {
			mining()
			$.ajax({
				url : '/blockchain/createTransaction',
				method : 'post',
				data : {
					from : 'Master',
					to : '${email}',
					amount : $('#coin').val()
				},
				success : function(data) {
					if (data) {
					} else {
						alert('소지한 금액을 보내세요')
					}
				}
			})
			$('#coin').val('')
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
						$('#trans').append('</tr>')
					} 
				}
			})
		}, 500)
	</script>
</body>
</html>