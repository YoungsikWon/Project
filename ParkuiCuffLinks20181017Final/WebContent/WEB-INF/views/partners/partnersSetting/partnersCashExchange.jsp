<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현금교환</title>
</head>
<body>
	<!----------------------------------------------------------------------- top 시작 -->
	
	<!----------------------------------------------------------------------- top 끝 -->

	<div class="ui basicspace">
		<!-- navigation menu와 여백 -->
	</div>

	<!--======================================================================================-->
	<!----------------------------------------------------------------------- main content 시작 -->

	<div class="ui container">

		<!-- main 입력 시작-->

		<div class="ui two column grid container" style="height: auto">
			
				<!-- 로그인 정보 =================================================================================-->
				
				<!-- 로그인 정보 =================================================================================-->

				<!-- 서브 메뉴 ===================================================================================-->
				
				<!-- 서브 메뉴 ===================================================================================-->

			<div class="ui column"
				style="padding-left: 5px; padding-top: 0px; padding-bottom: 0px; width: 100%;">
				<div class="ui container"
					style="padding: 20px; padding-bottom: 20px; left: 5px; border: 1px solid #dedede; min-height: 600px ;height: auto;">
					<div style="padding-bottom: 20px;">
						<h3 style="text-align: left">현금교환</h3>
					</div>
					<div class="ui container"
						style="padding-top: 0px; padding-bottom: 30px; padding-left: 0px; padding-right: 20px;">
						<hr class="dotted" style="" />
					</div>
					<div style="text-align: center;">
						<h4>
							현 코인 : <span id="myCoin"></span>
						</h4>
						<div class="ui action input">
							<input type="text" placeholder="교환할 금액" id='coin'>
							<button class="ui button" onclick="transaction()">교환</button>
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
	
	<!-- footer 끝-->
	<!----------------------------------------------------------------------- footer content 끝 -->
	
</body>
</html>