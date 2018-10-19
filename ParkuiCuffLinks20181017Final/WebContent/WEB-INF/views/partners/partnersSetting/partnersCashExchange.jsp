<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현금교환</title>
</head>
<body>
	<!----------------------------------------------------------------------- top 시작 -->

	<!----------------------------------------------------------------------- top 끝 -->

	<!-- <div class="ui basicspace">
		navigation menu와 여백
	</div> -->

	<!--======================================================================================-->
	<!----------------------------------------------------------------------- main content 시작 -->

	<div class="ui container">

		<!-- main 입력 시작-->

		<div class="ui two column grid container" style="height: auto">

			<!-- 로그인 정보 =================================================================================-->

			<!-- 로그인 정보 =================================================================================-->

			<!-- 서브 메뉴 ===================================================================================-->

			<!-- 서브 메뉴 ===================================================================================-->

			<div class="ui column" style="padding-left: 0px; padding-top: 15px; padding-bottom: 0px; width: 100%;">
				<div id="partnersback" class="ui container" style="margin-bottom: 10px; padding-left: 20px; padding-top: 20px; padding-bottom: 10px; left: 5px; border: 1px solid #dedede;">
					<div>
						<h3 style="text-align: left">현금교환</h3>
					</div>
					<div class="ui two column grid container" style="padding-left: 0px; padding-top: 10px;">
						<div class="column" style="padding-left: 0px">
							<h5 style="text-align: left">현금교환을 할 수 있습니다.</h5>
						</div>
						<div class="column" style="text-align: right; padding-bottom: 0px;">
							<!-- 우측 빈공간 -->
						</div>
					</div>
				</div>
				<div class="ui container" style="padding: 10px; padding-bottom: 20px; left: 5px; border: 1px solid #dedede; min-height:562px; background-color: #E6E6E6;" align="center">
					<div class="ui" style="margin-top: 20px;margin-bottom: 20px; padding-top: 7px; height: 40px; width: 50%; border-radius: 5px; background-color: #F7819F;">
						<h4>
							현재 코인 : <span id="myCoin"></span>
						</h4>
					</div>
					<div class="ui action input" style="margin-top: 20px;">
						<input type="text" placeholder="교환할 금액" id='coin'>
						<button class="ui red button" onclick="transaction()">교환</button>
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