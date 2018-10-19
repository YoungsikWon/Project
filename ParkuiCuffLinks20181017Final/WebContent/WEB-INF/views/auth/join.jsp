<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   int num = (int) (Math.random() * 10000 + Math.random() * 1000 + Math.random() * 100 + Math.random() * 10);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join-(회원가입)</title>
</head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<body>
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
   <script type="text/javascript">
      var CheckId = 0;
      var CheckEmail = 0;
      var CheckPw = 0;
      var num = 98761235943598324;

      function b_email() {
         if (CheckEmail == 0) {

            if (CheckEmail == 0) {
               $("#j_email").focus()
               alert("이메일을 입력하지 않았습니다.");
            }

         } else {
            $.ajax({
               url : "/email",
               method : "post",
               data : {
                  "f_email_check" : $("#j_email").val()
               },
               success : function(data) {

                  num = data;
                  alert($("#j_email").val() + "에 보냈습니다.");
                  /* $("#b_email").hide(); */
               },
               error : function(xhrObject) {
                  alert("error: " + xhrObject.responseText);
               }
            });

         }
      }

      function b_join() {
         if (CheckId == 0 || CheckEmail == 0 || CheckPw == 0
               || num != $("#j_email_check").val()) {

            if (CheckEmail == 0) {
               $("#j_email").focus()
               alert("이메일을 입력해주세요");
            } else if (CheckId == 0) {
               $("#j_id").focus()
               alert("아이디를 입력해주세요");
            } else if (CheckPw == 0) {
               $("#j_pw").focus()
               alert("비밀번호를 입력해주세요");
            } else if (num != $("#j_email_check").val()) {
               $("#j_email_check").focus()
               alert("이메일 인증 해주세요");
            }

         } else {
            $('#f_join').attr("method", "post");
            $('#f_join').attr("action", "/clients/join");
            $('#f_join').submit();
         }

      }

      $(document)
            .ready(
                  function() {

                     $("#j_email")
                           .keyup(
                                 function() {
                                    $
                                          .ajax({
                                             url : "/clients/emailcheck",
                                             method : "post",
                                             data : {
                                                "f_email" : $(
                                                      "#j_email")
                                                      .val()
                                             },
                                             success : function(
                                                   data) {
                                                $("#a_email")
                                                      .html(
                                                            data);

                                                if ($(
                                                      "#j_email")
                                                      .val().length == 0) {
                                                   $(
                                                         "#a_email")
                                                         .html(
                                                               "");
                                                }

                                                if (data.length == 33) {
                                                   CheckEmail = 1;
                                                } else {
                                                   CheckEmail = 0;
                                                }

                                             },
                                             error : function(
                                                   xhrObject) {
                                                alert("error: "
                                                      + xhrObject.responseText);
                                             }
                                          });

                                 });
                     $("#j_id")
                           .keyup(
                                 function() {
                                    $
                                          .ajax({
                                             url : "/clients/idcheck",
                                             method : "post",
                                             data : {
                                                "f_id" : $(
                                                      "#j_id")
                                                      .val()
                                             },
                                             success : function(
                                                   data) {
                                                $("#a_id")
                                                      .html(
                                                            data);

                                                if ($("#j_id")
                                                      .val().length == 0) {
                                                   $("#a_id")
                                                         .html(
                                                               "");
                                                }

                                                if (data.length == 33) {
                                                   CheckId = 1;
                                                } else {
                                                   CheckId = 0;
                                                }
                                             },
                                             error : function(
                                                   xhrObject) {
                                                alert("error: "
                                                      + xhrObject.responseText);
                                             }
                                          });

                                 });

                     $("#j_pw")
                           .keyup(
                                 function() {

                                    if ($("#j_pw").val() != $(
                                          "#j_pw2").val()) {
                                       $("#pw_check").html(
                                             "암호가  틀립니다.");
                                       if ($("#j_pw").val().length == 0) {
                                          $("#pw_check").html("");
                                       }
                                       CheckPw = 0;
                                    } else {
                                       $("#pw_check")
                                             .html(
                                                   "<font color = 'blue'>암호가 일치합니다.</font>");
                                       if ($("#j_pw").val().length == 0) {
                                          $("#pw_check").html("");
                                       }
                                       CheckPw = 1;
                                    }
                                 });
                     $("#j_pw2")
                           .keyup(
                                 function() {

                                    if ($("#j_pw").val() != $(
                                          "#j_pw2").val()) {
                                       $("#pw_check").html(
                                             "암호가  틀립니다.");
                                       if ($("#j_pw2").val().length == 0) {
                                          $("#pw_check").html("");
                                       }
                                       CheckPw = 0;
                                    } else {
                                       $("#pw_check")
                                             .html(
                                                   "<font color = 'blue'>암호가 일치합니다.</font>");
                                       if ($("#j_pw2").val().length == 0) {
                                          $("#pw_check").html("");
                                       }
                                       CheckPw = 1;
                                    }
                                 });

                  });
   </script>
   <!----------------------------------------------------------------------- top 끝 -->

   <!----------------------------------------------------------------------- main content 시작 -->
   <!----------------------------------------------------------------------- main content 시작 -->
   <div class="ui container raised segment  contentMain-join">

      <!-- title 시작-->
      <div class="ui container">
         <div class="content-header" style="background-color: #E0ECF8;">
            <div class="ui two column grid container">
               <div class="column" style="text-align: left">
                  <h3 class="content-text">회원가입</h3>
                  <small class="small-text">CuffLink에 오신 것을 환영합니다.</small>
               </div>
               <div class="column" style="text-align: right; margin: 10px 0px;">
                  <!-- 우측에 입력할 수 있는 공간 확보 -->
               </div>
            </div>
         </div>
      </div>
      <!-- title 끝-->

      <!--       <div class="ui basicspace">
         login title와 main content 여백
      </div> -->

      <!-- main 입력 시작-->
      <div class="ui container">
         <div class="content-middle-join" style="margin-top: 10px; min-height: 550px; height: auto; background-color: #dedede;">
            <div class="ui two column grid container" style="padding: 20px">
               <div class="column grid" style="padding: 10px; width: 80%;">
                  <!-- form 시작 ================================================================================================================================== -->
                  <form id="f_join" name="join">
                     <div class="ui three column grid container ">
                        <div class="center column container" style="padding: 10px; width: 30%; height: 210px; vertical-align: middle">
                           <span>*</span>이용목적
                        </div>
                        <div class="column container" style="padding: 10px; width: 60%; padding: 10;">
                           <div class="ui two column grid container" style="padding: 0px;">
                              <div class="column container" style="background-color: #fff; padding: 10px; width: 50%; text-align: center; vertical-align: middle; outline: dotted gray 0.5px;">
                                 <p>프로젝트를 의뢰하고 싶습니다</p>
                                 <div class="ui image">
                                    <img src="../image/client.jpg" style="padding: 10px">
                                 </div>
                                 <div>
                                    <input type="radio" name="radio" checked="checked" value="1">
                                 </div>
                                 <div>
                                    <p>클라이언트</p>
                                    <hr class="garo" />
                                 </div>
                                 <div>
                                    <p>
                                       의뢰할 프로젝트가 있는 <br> 기업, 개인
                                    </p>
                                 </div>
                              </div>
                              <div class="column container" style="background-color: #fff; padding: 10px; width: 50%; text-align: center; vertical-align: middle; outline: dotted gray 0.5px;">
                                 <p>일거리를 찾고 있습니다</p>
                                 <div class="ui image">
                                    <img src="../image/partners.jpg" style="padding: 10px">
                                 </div>
                                 <div>
                                    <input type="radio" name="radio" checked="checked" value="2">
                                 </div>
                                 <div>
                                    <p>파트너스</p>
                                    <hr class="garo" />
                                 </div>
                                 <div>
                                    <p>
                                       프로젝트의 수주를<br> 원하는 기업, 개인
                                    </p>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="column" style="width: 10%;"></div>

                        <div class="center column container" style="padding: 10px; width: 30%;">
                           <span>*</span>이메일
                        </div>
                        <div class="ui left icon input" style="padding: 10px; width: 50%">
                           <input id="j_email" name="j_email" type="text" placeholder="이메일" size="40px"> <i class="id envelope icon"></i>
                        </div>
                        <div id="a_email" class="center-right" style="padding: 10px; width: 20%"></div>



                        <div class="center column container" style="padding: 10px; width: 30%;">
                           <span>*</span>이메일 인증
                        </div>

                        <div class="ui left icon input" style="padding: 10px; width: 50%">
                           <input id="j_email_check" name="j_email_check" type="text" placeholder="이메일인증" size="40px"> <i class="id envelope icon"></i>
                        </div>

                        <div id="a_email_check" class="center-right" style="padding-top: 10px; margin-left: 0; width: 20%; height: 17px; margin: 0px; padding-left: 0;">
                           <div id="b_email" class="ui black animated fade button" tabindex="0" onClick="b_email()" style="margin-left: 0;">
                              <div class="visible content" style="padding: 0; margin-left: 0;">인증</div>
                              <div class="hidden content" style="padding: 0; margin-left: 0;">
                                 <a href="#">send</a>
                              </div>
                           </div>
                        </div>
                        <div class="center column container" style="padding: 10px; width: 30%;">
                           <span>*</span>아이디
                        </div>
                        <div class="ui left icon input" style="padding: 10px; width: 50%;">
                           <input id="j_id" name="j_id" type="text" placeholder="아이디" size="40px"> <i class="id badge icon"></i>
                        </div>
                        <div id="a_id" class="center-right" style="padding: 0px; width: 20%"></div>
                        <div class="center column container" style="padding: 10px; width: 30%;">
                           <span>*</span>비밀번호
                        </div>
                        <div class="ui left icon input" style="padding: 10px; width: 50%;">
                           <input id="j_pw" name="j_pw" type="password" placeholder="비밀번호" size="40px"> <i class="key icon"></i>
                        </div>
                        <div id="pw_check" class="center-right" style="padding: 0px; width: 20%"></div>


                        <div class="center column container" style="padding: 10px; width: 30%;">
                           <span>*</span>비밀번호 재입력
                        </div>
                        <div class="ui left icon input" style="padding: 10px; width: 50%;">
                           <input id="j_pw2" name="j_pw2" type="password" placeholder="비밀번호" size="40px"> <i class="key icon"></i>
                        </div>
                        <div class="center-right" style="padding: 0px; width: 20%;"></div>


                        <div class="column container" style="padding: 10px; width: 30%;"></div>
                        <div class="column container" style="padding: 10px; width: 70%;">
                           <div class="ui checkbox">
                              <input type="checkbox" name="example"> <a href="#">이용약관</a> 및 <a href="#">개인정보 처리방침</a>에 동의합니다.
                           </div>
                        </div>

                        <div class="column container" style="padding: 10px; width: 30%;"></div>

                        <div class="column container" style="padding: 10px; width: 70%;">
                           <div class="ui black fluid animated fade button" tabindex="0" onClick="b_join()">
                              <div class="visible content">회원가입</div>
                              <div class="hidden content">Join Click</div>
                           </div>
                        </div>
                     </div>
                  </form>
                  <!-- form 끝 ================================================================================================================================== -->
               </div>
               <div class="column grid" style="padding: 10px; width: 20%;"></div>
            </div>
         </div>
      </div>
      <!-- main 입력 끝-->

   </div>
   <!----------------------------------------------------------------------- main content 끝 -->
   <!----------------------------------------------------------------------- main content 끝 -->

   <!----------------------------------------------------------------------- footer content 시작 -->
   <!-- footer 시작-->
   <footer class="footer">
      <div class="ui inverted segment" style="height: 200px; padding: 25px; vertical-align: middle;">
         <jsp:include page="../common/menu/footerMenu.jsp" />
      </div>
   </footer>
   <!-- footer 끝-->
   <!----------------------------------------------------------------------- footer content 끝 -->

</body>
</html>