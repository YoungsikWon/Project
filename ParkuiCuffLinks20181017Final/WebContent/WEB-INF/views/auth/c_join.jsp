<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join-(회원가입)</title>
</head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"charset="utf-8"></script>
<body>
   <!----------------------------------------------------------------------- top 시작 -->
   <header class="header">
      <div class="ui">
         <!-- header 시작 -->
         <div class="ui">
            <jsp:include page="../common/menu/headerMenu.jsp" />
         </div>
         <!-- header 종료 -->
      </div>
   </header>
    <script type="text/javascript">
   
    
    $(document).ready(function(){

       $('#b_join').click(function(){
    	   
         $("#f_join").attr("action","/capchar/join");
         $("#f_join").attr("method","post");
         $("#f_join").submit(); 
          
         });

    });
    
   
   </script>
   <!----------------------------------------------------------------------- top 끝 -->

   <!----------------------------------------------------------------------- main content 시작 -->
   <!----------------------------------------------------------------------- main content 시작 -->
   <div class="ui container raised segment  contentMain">

      <!-- title 시작-->
      <div class="ui container">
         <div class="content-header">
            <div class="ui two column grid container">
               <div class="column" style="text-align: left">
                  <h3 class="content-text">타사 인증 회원가입</h3>
                  <small class="small-text">CuffLink에 오신 것을 환영합니다.</small>
               </div>
               <div class="column" style="text-align: right; margin: 10px 0px;">
                  <!-- 우측에 입력할 수 있는 공간 확보 -->
               </div>
            </div>
         </div>
      </div>
      <!-- title 끝-->

      <div class="ui basicspace">
         <!-- login title와 main content 여백 -->
      </div>

      <!-- main 입력 시작-->
      <div class="ui container">
         <div class="content-middle-join">
            <div class="ui two column grid container" style="padding: 20px; ">
               <div class="column grid" style="padding: 10px; width: 100%; text-align: right; ">
                  <!-- form 시작 ================================================================================================================================== -->
                  <form id="f_join" name="join" >
                     <div class="column container" style="padding: 10px; width: 90%; margin: 0 auto;">
                        <div class="ui two column grid container" style="padding: 10px;">
                           <div class="column container" style="padding: 10px; width: 50%; text-align: center; vertical-align: middle; outline: dotted gray 0.5px;">
                              <p>프로젝트를 의뢰하고 싶습니다</p>
                              <div class="ui image">
                                 <img src="./image/client.jpg" style="padding: 10px">
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
                           <div class="column container"
                              style="padding: 10px; width: 50%; text-align: center; vertical-align: middle; outline: dotted gray 0.5px;">
                              <p>일거리를 찾고 있습니다</p>
                              <div class="ui image">
                                 <img src="./image/partners.jpg" style="padding: 10px">
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
                  </form>
                  <!-- form 끝 ================================================================================================================================== -->
                  <div style="padding: 10px;"></div>
                  <div class="ui two column grid container">
                     <div class="column"
                        style="padding: 10px; width: 100%; text-align: right; margin-right: 55px;">
                        <div type = "button" id="b_join" class="ui column animated fade button" tabindex="0">
                           <div class="visible content">가입 완료</div>
                           <div class="hidden content">
                              <a href="#">Next Click</a>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
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
      <div class="ui inverted segment"
         style="height: 200px; padding: 25px; vertical-align: middle;">
         <jsp:include page="../common/menu/footerMenu.jsp" />
      </div>
   </footer>
   <!-- footer 끝-->
   <!----------------------------------------------------------------------- footer content 끝 -->

</body>
</html>