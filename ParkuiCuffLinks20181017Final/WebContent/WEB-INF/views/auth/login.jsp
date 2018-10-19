<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = "";
	int index = 0;
	int index2 = 0;
	try {

		HttpSession Se = request.getSession();
		id = (String) Se.getAttribute("capchar");
		index = (int) Se.getAttribute(id);
	} catch (NullPointerException e) {

	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">

function CapcharService(url){

	  $("#C_naver").attr("action",url);
	  $("#C_naver").attr("method","post");
	  $("#C_naver").submit();
	  
}

Kakao.init('8e91bf2951ff7ac21938e4a240554ea4');
function loginWithKakao() {
  // 로그인 창을 띄웁니다.
  Kakao.Auth.login({
    success: function(authObj) {
    
      Kakao.API.request({
          url: '/v2/user/me',
          success: function(res) {
        	   $.ajax({
        		   	
        			 url: "/capcharLogic"
        			,method:"post"
        			,data : {"j_token" : "123123" ,"j_profile" : res.properties.profile_image ,"j_email":res.kakao_account.email,"j_id":res.id,"s_shape":"kakao"}
        	        ,success:function(data){
        	
        	        	if(data==0){
        	        		
        	        		$("#j_token").val("123123");
        	        		$("#j_email").val(res.kakao_account.email);
        	        		$("#j_id").val(res.id);
        	        		$("#s_shape").val("kakao");
        	        		CapcharService("/capcharJoin"); 
        	        	}
        	        	else{
        	        		
        	        		$("#j_email").val(res.kakao_account.email);
        	        		CapcharService("/capcharLogin");
        	        		
        	        	}

        	        }
        	        ,error:function(xhrObject){
        	        	
        	        	alert(xhrObject.responseText);
        	        	
        	        }
        			
        		 }); 

          },
          fail: function(error) {
            alert(JSON.stringify(error));
          }
        });
    },
    fail: function(err) {
      alert(JSON.stringify(err));
    }
  });
};

var isok = true;
</script>
<body>
	<form id="C_naver">
		<input type=hidden id="j_token" name="j_token"> <input type=hidden id="j_email" name="j_email"> <input type=hidden id="j_id" name="j_id"> <input type=hidden id="s_shape" name="s_shape">
	</form>
	<!----------------------------------------------------------------------- top 시작 -->
	<header class="header">
		<div class="ui">
			<!-- header 시작 -->
			<div class="ui">
				<jsp:include page="../common/menu/headerMenuLogout.jsp" />
			</div>
			<!-- header 종료 -->
		</div>
	</header>

	<!----------------------------------------------------------------------- top 끝 -->

	<!--======================================================================================-->
	<!----------------------------------------------------------------------- main content 시작 -->
	<div class="ui container raised segment content contentMain">

		<!-- title 시작-->
		<div class="ui container">
			<div class="content-header" style="background-color: #E0ECF8;">
				<div class="ui two column grid container">
					<div class="column" style="text-align: left;">
						<h3 class="content-text">로그인</h3>
						<small class="small-text">CuffLink에 오신 것을 환영합니다.</small>
					</div>
					<div class="column" style="text-align: right; margin: 10px 0px;">
						<!-- 우측에 입력할 수 있는 공간 확보 -->
					</div>
				</div>
			</div>
		</div>
		<!-- title 끝-->

		<!-- <div class="ui basicspace">
			title와 main content 여백
		</div> -->

		<!-- main 입력 시작-->
		<div class="ui container">
			<div class="content-middle" style="margin-top: 10px;min-height: 550px; height: auto; background-color: #dedede;">
				<div class="ui two column grid container" style="padding: 20px; height: auto;">
					<div class="column grid" style="vertical-align: middle; padding: 20px; width: 60%;border-right: 1px solid #BDBDBD">
						<div class="ui two column grid container">
							
							<div class="center column container" style="padding: 17px; width: 35%;">
								<span>*</span>아이디 또는 이메일
							</div>
							<div class="column container" style="padding: 10px; width: 65%;">
								<form id="f_login">
									<div class="ui left icon input">
										<input name="f_id" type="text" placeholder="아이디 또는 이메일" size="40px">
										<i class="id badge icon"></i>
									</div>
							</div>
							
							<div class="center column container" style="padding: 17px; width: 35%;">
								<span>*</span>비밀번호
							</div>
							<div class="column container" style="padding: 10px; width: 65%;">
								<div class="ui left icon input">
									<input name="f_pw" type="password" placeholder="비밀번호" size="40px">
									<i class="key icon"></i>
								</div>
								</form>
							</div>
							
							<div class="column container" style="padding: 0px; width: 0%;"></div>
							<div class="column container" style="padding: 0px; width: 100%; margin-bottom: 10px;">
								<div class="ui checkbox">
									<input type="checkbox" name="example" /> <label>로그인 상태 유지</label>
								</div>
							</div>
							
							<div class="center column container" style="padding: 0px; width: 35%;">
							
							</div>
							
							<div class="column container" style="padding: 0px; width: 65%; ">
								<div style="display:flex; justify-content:center; align-items:center; vertical-align: middle;"> 
								<%
									if (index > 2) {
								%>
								<!-- 캡차 서비스 !!! -->
								<%-- <jsp:include page="../../../capchar/capchar.jsp" /> --%>
								<jsp:include page="../naver/capchar/capchar.jsp" />

								<script type="text/javascript">isok = false;</script>
								<%
									}
								%>
								</div>
							</div>
							
							<div class="center column container" style="padding: 0px; width: 35%; background: red;">
							
							</div>
							
							<div class="column container" style="margin-right: 0; padding-top: 0; color:red; ;width: 65%;  font-size: 12px;">
								<div style="background-color: #F8E0E6;"> 
								<%
									if (index > 0 && index < 3) {
								%>아이디 또는 비밀번호 <%=index%>회 불일치
								
								<%
									} else if (index == -1) {
								%>아이디가 존재하지 않습니다.
								
								</div>
							
							
								<div style="">
								<%
									} else if (index > 2) {
								%>앗, 로그인이 안 되나요?.<%
									}
								%>
								</div>
							</div>
							
							<div class="column container" style="padding: 0px; width: 0%;"></div>
							<div class="column container" style="padding: 20px; width: 100%; text-align: center;">
								<div class="ui two column grid container">
									<div class="cloumn container" style="width: 50%;">
										<div class="ui fluid black animated fade button" tabindex="0">
											<div class="visible content">로 그 인</div>
											<div class="hidden content" onClick='login()'>Login Click</div>
										</div>
									</div>

									<div class="cloumn  container" style="width: 50%;">
										<div class="ui fluid black animated fade button" tabindex="0">
											<div class="visible content">회원가입</div>
											<div class="hidden content">
												<a href="/auth/join">Join Click</a>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="column container" style="padding: 10px; width: 35%;"></div>
							<div class="column container" style="padding: 10px; width: 65%;">
								<label>비밀번호를 잊으셨나요? <a href="/idpassfind">아이디 비밀번호 찾기</a></label>
							</div>

						</div>
					</div>
					<div class="column grid" style="padding: 10px; width: 40%;">
						<div class="space-login" style="padding: 20px;">
							<h3>타사로그인</h3>
						</div>
						<div class="column-login2">

							<div id="naver_id_login"></div>
							<!-- //네이버아이디로로그인 버튼 노출 영역 -->

							<script type="text/javascript">
							
  	                        var naver_id_login = new naver_id_login("zuz0tecb_NrFuIUNUC0o", "http://localhost:8080/capchar");
  	                        var state = naver_id_login.getUniqState();
  	                        naver_id_login.setButton("green",3,45);
  	                        naver_id_login.setDomain("http://localhost:8080/join" );
  	                        naver_id_login.setState(state);
  	                        naver_id_login.init_naver_id_login();
                            </script>

						</div>
						<div class="column-login2">

							<a id="custom-login-btn" href="javascript:loginWithKakao()"> <img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="210px" height="40px" />
							</a>

						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- main 입력 끝-->

	</div>
	<!------------------------------------------------------------------------ main content 끝 -->
	<!--======================================================================================-->

	<!----------------------------------------------------------------------- footer content 시작 -->
	<!-- footer 시작-->
	<footer class="footer">
		<div class="ui inverted segment" style="height: 200px; padding: 25px; vertical-align: middle;">
			<jsp:include page="../common/menu/footerMenu.jsp" />
		</div>
	</footer>
	<!-- footer 끝-->
	<!----------------------------------------------------------------------- footer content 끝 -->
	<script type="text/javascript">
/******************************************************************************* 20181013 수정요청사항 캡차서비스 로딩중 처리 */	
    $('#loading').hide();  
/******************************************************************************* 20181013 수정요청사항 캡차서비스 로딩중 처리 */	 
	    function Csuccess(){
		    isok = true;
		    alert("성공적으로 인증 되었습니다.");
		}
	   
	    
		function login() {
	
	
		    if(isok == true){
		    	
			$('#f_login').attr("method", "post");
			$('#f_login').attr("action", "/clients/login");
			$('#f_login').submit();
			
		    }
		    else{
		    	alert("캡차서비스를 확인을 해주세요");
		    }
	
	
		}
	</script>
</body>
</html>