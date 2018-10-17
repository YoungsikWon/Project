<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호변경
</title>
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
		</div>
	</header>
<!----------------------------------------------------------------------- top 끝 -->

<script type="text/javascript">

$(document).ready(function(){

	$("#PwModify").click(function(){

		 $.ajax({
				
			 url: "/client/PwModify"
			,method : "post"
			,data   : {pw1:$("#password1").val(),pw2:$("#password2").val(),s_email:"<%=info.get("S_EMAIL")%>"}
			,success : function(data){
				if(data == 1){
				   alert("비밀번호 변경 성공");	
				   $("#password1").val("");
				   $("#password2").val("");
				}
				else{
				   alert("기존 비밀번호가 틀렸습니다.");	
				   
				}
			}
		    ,error   : function(xhrObject){
		    	alert(xhrObject.responseText);
		    }
			 
		 });
	
	});
	
});


</script>

	<div class="ui basicspace"><!-- navigation menu와 여백 --></div>
	
<!--======================================================================================-->
<!----------------------------------------------------------------------- main content 시작 -->

	<div class="ui container" >
	
	<!-- main 입력 시작-->

		<div class="ui two column grid container" >
			<div class="ui column" style="width: 20%;padding-top: 0px;padding-left: 0px;padding-right: 0px">
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
			<div class="ui column" style="padding-left: 5px; padding-top: 0px; padding-bottom: 0px; padding-right: 10px; width: 80%;">
				<div class="ui container" style="padding-left: 20px; padding-top: 20px; padding-bottom: 10px; left: 5px; border: 1px solid #dedede;">
					<div>
						<h3 style="text-align: left">비밀번호 변경</h3>
					</div>
					<div class="ui two column grid container" style="padding-left: 0px; padding-top: 10px;">
						<div class="column" style="padding-left: 0px; width:60%;">
							<h5 style="text-align: left">개인정보 보호를 위해 주기적으로 비밀번호를 변경해주세요.</h5>
						</div>
						<div class="column" style="text-align:right; padding-bottom:0px; width:40%;">
							<!-- 우측 빈공간 -->
						</div>
					</div>
				</div>
				<div style="height: 10px;"></div>
<!-- ********************************************************************************************************************************************************우측내용 높이설정수정  -->			
				<div class="ui container" style="padding-left: 20px; padding-right:20px; padding-top: 30px; padding-bottom: 20px; left: 5px; border: 1px solid #dedede; min-height: 570px; height:auto;">
<!-- ********************************************************************************************************************************************************우측내용 높이설정수정  -->
					<div class="ui two column grid container" style="padding-top: 0px; border: 1px solid #dedede;">
						<div class="column" style="width: 10%; padding: 20px">
							<img class="ui medium circular image" style="width: 40px;" src="../../image/process-guide-warning.png">
						</div>
						<div class="column" style="width: 90%;text-align: left; padding-left: 5px ">
							[ 비밀번호 변경 가이드 ]<br>
							다른 사이트에서 사용하지 않는 고유한 비밀번호를 사용하시고, 주기적으로 변경해주세요.
						</div>
					</div>
					
					<div style="padding-top:30px;">
							<div class="ui two column grid container">
								<div class="center column container" style="padding: 17px; width: 30%; text-align: left;">
									<h5>보안 로그인</h5>
								</div>
								<div class="column container" style="padding-left: 20px; padding-top: 10px; padding-bottom: 0px; width: 60%;">
									<!-- 빈공간 -->
								</div>
								<div class="center column container" style="padding: 17px; width: 30%;">
									<span>*</span>이메일
								</div>
								<div class="column container" style="padding: 17px; width: 60%;">
								<%=info.get("S_EMAIL")%>
								</div>
								<div class="center column container" style="padding: 17px; width: 30%;">
									<span>*</span>기존비밀번호
								</div>
								<div class="column container" style="padding: 10px; width: 60%;">
									<div class="ui input">
										<input id = "password1" type="text" placeholder="비밀번호를 입력하세요." size="25px">
									</div>
								</div>
								<div class="center column container" style="padding: 17px; width: 30%;">
									<span>*</span>변경비밀번호
								</div>
								<div class="column container" style="padding: 10px; width: 60%;">
									<div class="ui input">
										<input id = "password2" type="text" placeholder="비밀번호를 입력하세요." size="25px">
									</div>
								</div>
								<div class="center column container" style="padding: 17px; width: 30%;">
									
								</div>
								<div class="column container" style="padding: 10px; width: 60%; text-align:right">
									<div class="ui container" style="padding-right:30px; ">
										<button type = "button" id = "PwModify" class="ui blue button" >비밀번호 변경</button>
									</div>
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