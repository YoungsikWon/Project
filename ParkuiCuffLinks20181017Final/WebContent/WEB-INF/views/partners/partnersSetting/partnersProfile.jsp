<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Map<String, Object> info = (Map<String, Object>) request.getAttribute("info");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정설정(기본수정)</title>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
	<!----------------------------------------------------------------------- top 시작 -->
	<header class="header">
		<div class="ui">
			<!-- header 시작 -->
			<div class="ui">
				<jsp:include page="../../common/menu/PartnersHeaderMenu.jsp" />
			</div>
			<!-- header 종료 -->
		</div>
	</header>
	<script type="text/javascript">
	
	  function addPlusFriend() {
	    	Kakao.PlusFriend.addFriend({
	    		plusFriendId: '_Mxhhuj'
	    	});
	    }
	
	$(document).ready(function(){
	
		<%-- <%=info.get("S_EMAIL")%> --%>
		$.ajax({
			
			url:"/client/modify"
		   ,method:"post"
		   ,data:{s_email:"<%=info.get("S_EMAIL")%>"}
		   ,success:function(data){
	 		   var obj = JSON.parse(data);
	   

			   $("#f_name").val(obj[0].C_NAME);
			   $("#address").val(obj[0].C_ADDR);
			   $("#email").val(obj[0].S_EMAIL);
	
	
			
			   if(obj[0].C_OPERATOR == "개인"){
					$("#f_dropdown").val("개인").prop("selected", true);
			   }
			   else if(obj[0].C_OPERATOR == "팀"){
					$("#f_dropdown").val("팀").prop("selected", true);
			   }
			   else if(obj[0].C_OPERATOR == "개인 사업자"){
					$("#f_dropdown").val("개인 사업자").prop("selected", true);
			   }
			   else if(obj[0].C_OPERATOR == "법인 사업자"){
					$("#f_dropdown").val("법인 사업자").prop("selected", true);
			   }
			   
			   if(obj[0].C_GENDER == "남자"){
				   $("#gender1").attr("checked",true);
			   }
			   else{
				   $("#gender2").attr("checked",true);
			   }
			   var phone = obj[0].C_PHONE;
			   var first = phone.substr(0,3);
			   var second = phone.substr(4,4);
			   var three = phone.substr(9,14);
	
			   $("#skills1").val(first).prop("selected", true);
			   $("#second").val(second);
			   $("#three").val(three);
			   
			   var c_phone = obj[0].C_BUSINESSNUMBER;
			   var c_first = c_phone.substr(0,4);
			   var c_second = c_phone.substr(5,c_phone.length);

			   $("#skills2").val(c_first).prop("selected", true);
			   $("#SecondT").val(c_second);
			   
			   
			   
		   }
		   ,error:function(xhrObject){
			   alert(xhrObject.responseText);
		   }
			
		});

		Kakao.init('8e91bf2951ff7ac21938e4a240554ea4');
		
		$("#plusfriend").click(function(){
			addPlusFriend();
		});
		
		$('#userInfo1').click(function(){
			

			$("#f_dropdown").val($("#f_dropdown").find(":selected").val())
			$("#years").val($("#years").find(":selected").val())
			
			$("#f_UserInfo1").attr("action","/PartnersImages");
			$("#f_UserInfo1").attr("method","post");
			$("#f_UserInfo1").submit();
			
			alert("등록완료");
			
		});

		$('#Add_address').click(function(){
			///PartnersImages
			 new daum.Postcode({
			      oncomplete: function(data) {
			          //지번
			          $("#address").val(data.jibunAddress);
			          $("#address").val(data.roadAddress);
			
			      }
			  }).open();
			
		});
       
	});
	
	</script>
	<!-- -------------------------------------------------------------------------- -->




	<!----------------------------------------------------------------------- top 끝 -->




	<!-- 	<div class="ui basicspace">
		navigation menu와 여백
	</div> -->

	<!--======================================================================================-->
	<!----------------------------------------------------------------------- main content 시작 -->

	<div class="ui container">

		<!-- main 입력 시작-->

		<div class="ui two column grid container" style="padding: 5px; height: auto; margin-top: 0px; margin-bottom: 0px;">
			<div class="ui column" style="width: 20%; padding-top: 0px; padding-left: 0px; padding-right: 0px">
				<!-- 로그인 정보 =================================================================================-->
				<div id="partnersback" class="ui segment">
					<jsp:include page="../../auth/PartnersLoginOk.jsp" />
				</div>
				<!-- 로그인 정보 =================================================================================-->

				<!-- 서브 메뉴 ===================================================================================-->
				<div id="partnersback" class="ui fluid vertical menu" style="padding-right: 0px">
					<a id="partnersProfile" class="partnersProfile teal item" href='javascript:location.reload();'> <font style="vertical-align: inherit;"> 기본 정보 수정 </font>
					</a> <a id="partnersCashExchange" href='javascript:changePage("./partnersCashExchange")' class="partnersCashExchange teal item"> <font style="vertical-align: inherit;"> 현금교환 </font>
					</a> <a id="partnersReLogin" class="partnersReLogin teal item" href='javascript:changePage("./partnersReLogin")'> <font style="vertical-align: inherit;"> 비밀번호 변경 </font>
					</a> <a id="partnersNotificationSetting" href='javascript:changePage("./partnersNotificationSetting")' class="partnersNotificationSetting teal item"> <font style="vertical-align: inherit;"> 알림 설정 </font>
					</a> <a id="partnersWithdrawal" class="partnersWithdrawal teal item" href='javascript:changePage("./partnersWithdrawal")'> <font style="vertical-align: inherit;"> 회원 탈퇴 </font>
					</a>
				</div>

				<!-- 서브 메뉴 ===================================================================================-->
			</div>
			<div class="ui column" id='subBody' style="padding-left: 5px; padding-top: 0px; padding-bottom: 0px; padding-right: 10px; width: 80%;">
				<div id="partnersback" class="ui container" style="padding-left: 20px; padding-top: 20px; padding-bottom: 10px; left: 5px; border: 1px solid #dedede;">
					<div>
						<h3 style="text-align: left">기본 정보 수정</h3>
					</div>
					<div class="ui two column grid container" style="padding-left: 0px; padding-top: 10px;">
						<div class="column" style="padding-left: 0px">
							<h5 style="text-align: left">계정의 기본 정보들을 수정할 수 있습니다.</h5>
						</div>
						<!-- <div class="column" style="text-align: right; padding-bottom: 0px;">
							<h11 style="text-align: right; padding-right:10px;"> <a href="">파트너스 정보 수정하기 </a>
							</h6>
						</div> -->
					</div>
				</div>
				<div style="height: 10px;"></div>
					<form id="f_UserInfo1" method="post" enctype="multipart/form-data" style="width: 100%;">
				<div class="ui container" style="width: 100% padding-left: 20px; padding-top: 0px; padding-bottom: 20px; left: 5px; border: 1px solid #dedede; height: auto;">

						<div class="ui two column grid container" style="width: 100%;margin-top: 0;">
							<div class="center column container" style="padding-left: 20px; width: 30%; text-align: left; background-color: #CECEF6">
								<h5>계정 정보</h5>
							</div>
							<div class="column container" style="padding-left: 20px; padding-top: 10px; padding-bottom: 0px; width: 70%; background-color: #CECEF6">
								<!-- 빈공간 -->
							</div>

							<div class="center column container" style="padding-left: 20px; padding-top: 10px; padding-bottom: 0px; width: 30%;">
								<strong>아이디</strong>
							</div>
							<div class="column container" style="padding-left: 20px; padding-top: 10px; padding-bottom: 0px; width: 70%;"><%=info.get("S_ID")%></div>
							<div class="center column container" style="padding-left: 20px; padding-top: 10px; padding-bottom: 0px; width: 30%;">
								<strong>이메일</strong>
							</div>
							<div class="column container" style="padding-left: 20px; padding-top: 10px; padding-bottom: 0px; width: 70%;"><%=info.get("S_EMAIL")%></div>
							<div class="ui one column container" style="padding-left: 10px; padding-top: 10px; padding-bottom: 30px; padding-right: 30px; width: 100%;">
								<!-- <hr class="dotted divider" style="margin-top: 15px;'" /> -->
							</div>
							
							<div class="center column container" style="padding-left: 20px; width: 30%; text-align: left; background-color: #CECEF6;">
								<h5>기본 정보</h5>
							</div>
							<div class="column container" style="padding-left: 20px; padding-top: 10px; padding-bottom: 0px; width: 70%; background-color: #CECEF6;">
								<!-- 빈공간 -->
							</div>
							
							<div class="center column container" style="padding: 17px; width: 30%;">
								<span>*</span>프로필 사진
							</div>
							<div class="column container" style="padding: 10px; width: 70%;">

								<input id="f_file" name="f_file" type="file" class="inputfile" />

							</div>
							<div class="center column container" style="padding: 17px; width: 30%;">
								<span>*</span>파트너스 형태
							</div>
							<div class="column container" style="padding: 10px; width: 70%;">
								<div>
									<script>
										$('.tag.example .ui.dropdown')
												.dropdown({
													allowAdditions : true
												});
									</script>
									<select id="f_dropdown" name="f_dropdown" class="ui fluid search dropdown" style="width: 60.5%;">
										<option id="1" value="개인">개인</option>
										<option id="2" value="팀">팀</option>
										<option id="3" value="개인 사업자">개인 사업자</option>
										<option id="4" value="법인 사업자">법인 사업자</option>
									</select>
								</div>
							</div>
							<div class="center column container" style="padding: 17px; width: 30%;">
								<span>*</span>이름
							</div>
							<div class="column container" style="padding: 10px; width: 70%;">
								<div class="ui input">
									<input id="f_name" name="f_name" type="text" placeholder="이름을 입력하세요." size="45px">
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
													<input type="radio" id="gender1" name="f_gender" value="남" checked="checked"> <label>남</label>
												</div>
											</div>
											<div class="field">
												<div class="ui radio checkbox">
													<input type="radio" id="gender2" name="f_gender" value="여"> <label>여</label>
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
									<select name="years" class="ui search dropdown">
										<%
											for (int i = 1918; i < 2019; i++) {
										%>
										<option value=""><%=i%></option>
										<%
											}
										%>
									</select> <i class="window minimize outline icon" style="padding: 5px; color: gray;"></i><input id="f_mounth" name="f_mounth" type="text" size="5px"><i class="window minimize outline icon" style="padding: 5px; color: gray;"></i><input id="f_day" name="f_day" type="text" size="5px">
								</div>
							</div>
							<div class="center column container" style="padding: 17px; width: 30%;">
								<span>*</span>지번
							</div>

							<div class="column container" style="padding: 10px; width: 70%;">
								<div class="ui input">
									<button id="Add_address" type="button" class="ui basic button">
										<i class="icon user"></i> 주소등록
									</button>
								</div>
							</div>
							<div class="center column container" style="padding: 17px; width: 30%;">
								<span>*</span>나머지 주소
							</div>

							<div class="column container" style="padding: 10px; width: 70%;">
								<div class="ui input">
									<input id="address" name="address" type="text" size="44px">
								</div>
							</div>
							<div class="center column container" style="padding: 17px; width: 30%;">
								<span>*</span>세금계산서용 이메일
							</div>
							<div class="column container" style="padding: 10px; width: 70%;">
								<div class="ui input">
									<input name="f_email" id="email" type="text" size="44px">
								</div>
							</div>
							<!-- <div name="f_email" class="center column container" style="padding: 17px; width: 30%;"></div>
							<div class="column container" style="padding: 10px; width: 70%;">
								<div style="padding-right: 20px; text-align: right;"></div>
							</div> -->
						</div>
						<div class="ui two column grid container" style="width: 100%">

							<div class="ui one column container" style="padding-left: 10px; padding-top: 10px; padding-bottom: 0px; padding-right: 30px; width: 100%;">
								<!-- <hr class="dotted" /> -->
							</div>
							
							<div class="center column container" style="padding-left: 20px; width: 30%; text-align: left; background-color: #CECEF6;">
								<h5>연락처 정보</h5>
							</div>
							<div class="column container" style="padding-left: 20px; padding-top: 10px; padding-bottom: 0px; width: 70%; background-color: #CECEF6;">
								<!-- 빈공간 -->
							</div>
							<div class="center column container" style="padding: 17px; width: 30%;">
								<span>*</span> 핸드폰 번호
							</div>
							<div class="column container" style="padding: 10px; width: 70%;">
								<div class="ui input">
									<select id="skills1" name="skills1" class="ui search dropdown">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
										<option value="foreign">해외</option>
									</select> <i class="window minimize outline icon" style="padding: 5px; color: gray;"></i> <input id="second" name="second" type="text" size="7px"> <i class="window minimize outline icon" style="padding: 5px; color: gray;"></i> <input id="three" name="three" type="text" size="6px">
								</div>
							</div>
							<div class="center column container" style="padding: 17px; width: 30%;">
								<span>*</span>전화번호
							</div>
							<div class="column container" style="padding: 10px; width: 70%;">
								<div class="ui input">
									<select id="skills2" name="skills2" class="ui search dropdown">
										<option value="5546">5546</option>
										<option value="foreign">해외</option>
									</select> <i class="window minimize outline icon" style="padding: 5px; color: gray;"> </i><input id="SecondT" name="SecondT" type="text" size="22px">
								</div>
							</div>
							<div class="center column container" style="padding: 17px; width: 30%; margin-bottom: 20px;">
								<span>*</span>팩스번호
							</div>
							<div class="column container" style="padding: 10px; width: 70%;">
								<div class="ui input">
									<input type="text" size="45px">
								</div>
							</div>
							<div class="center column container" style="padding: 17px; width: 30%;"></div>
							<div class="column container" style="padding: 10px; width: 70%;">
								<div style="padding-right: 20px; text-align: right;">
									<button type="button" id="plusfriend" class="ui blue button">플러스친구</button>
									<button type="button" id="userInfo1" class="ui blue button">등록완료</button>
								</div>
							</div>

						</div>
					
				</div>
</form>
			</div>
		</div>
		<!-- main 입력 끝-->

	</div>
	<script type="text/javascript">
					function changePage(url){
						$.ajax({
							url:url,
							method:'get',
							success:function(data){
								$('#subBody').html(data)
							},
							error:function(xhrObject){
				                   alert(xhrObject.responseText());
				              }
						});
					}
				</script>
	<!----------------------------------------------------------------------- main content 끝 --->
	<!--======================================================================================-->

	<!-- <div class="ui basicspace">
		login title와 main content 여백
	</div>
 -->
	<!----------------------------------------------------------------------- footer content 시작 -->
	<!-- footer 시작-->
	<footer class="footer">
		<div class="ui inverted segment">
			<jsp:include page="../../common/menu/footerMenu.jsp" />
		</div>
	</footer>
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
			console.log('현코인')
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
					from : '${email}',
					to : 'Master',
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
						$('#trans').append('</tr>');
					} 
				}
			})
		}, 500)
	</script>
	<!-- footer 끝-->
	<!----------------------------------------------------------------------- footer content 끝 -->
</body>
</html>