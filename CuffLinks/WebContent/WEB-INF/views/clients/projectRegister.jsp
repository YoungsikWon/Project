<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>projectRegister-(프로젝트 등록)</title>
</head>
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
   
        $("#ProjectRegisterButton").click(function() {
            location.href = "/clients/projectRegisterDetail";
        });
     });

</script>
   <!----------------------------------------------------------------------- top 끝 -->

   <!----------------------------------------------------------------------- main content 시작 -->
   <!----------------------------------------------------------------------- main content 시작 -->
   <div class="ui container raised segment content">

      <!-- title 시작-->
      <div class="ui container">
         <div class="content-header">
            <div class="ui two column grid container">
               <div class="column" style="text-align: left">
                  <h3 class="content-text">클라이언트 프로젝트 기본 정보 등록</h3>
                  <small class="small-text">프로젝트 등록 전에 기본 정보를 입력해 주세요.</small>
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
            <div class="ui two column grid container" style="padding: 0px;">
               <div class="column grid" style="border-right: 1px solid #dedede; vertical-align: middle; padding: 20px; width: 70%;">
                  <div class="ui two column grid container">
                     <div class="center column container" style="padding: 17px; width: 25%;">
                        <span>*</span>클라이언트 형태
                     </div>
                     <div class="column container" style="padding: 10px; width: 75%;">
                        <div style="width: 50%;">
                           <select name="skills" class="ui fluid search dropdown">
                              <option value="">개인</option>
                              <option value="angular">팀</option>
                              <option value="css">개인 사업자</option>
                              <option value="design">법인 사업자</option>
                           </select>
                        </div>
                     </div>
                     <div class="column container" style="padding-left: 10px; padding-top: 0px; padding-bottom: 0px; width: 25%;"></div>
                     <div class="column container" style="padding-left: 10px; padding-top: 0px; padding-bottom: 0px; width: 75%;">
                        <hr class="garo" />
                     </div>
                     <div class="center column container" style="padding: 17px; width: 25%;">
                        <span>*</span>이름
                     </div>
                     <div class="column container" style="padding: 10px; width: 75%; text-align:left;">
                        <div class="ui input" style="padding-left: 0; margin-left: 0;">
                           <input type="text" placeholder="이름을 입력하세요." size="30px">
                        </div>
                     </div>
                     <div class="center column container" style="padding: 17px; width: 25%;">
                        <span>*</span>담당자 핸드폰
                     </div>
                     <div class="column container" style="padding: 10px; width: 75%; text-align:left;">
                        <div class="ui input">
                           <select name="skills" class="ui search dropdown">
                              <option value="010">010</option>
                              <option value="011">011</option>
                              <option value="016">016</option>
                              <option value="017">017</option>
                              <option value="018">018</option>
                              <option value="019">019</option>
                              <option value="foreign">해외</option>
                           </select> <i class="window minimize outline icon" style="padding: 5px; color: gray;"></i><input type="text" size="5px"><i class="window minimize outline icon" style="padding: 5px; color: gray;"></i><input type="text" size="5px">
                        </div>
                     </div>
                     <div class="column container" style="padding-left: 10px; padding-top: 0px; padding-bottom: 0px; width: 25%;"></div>
                     <div class="column container" style="padding-left: 10px; padding-top: 0px; padding-bottom: 0px; width: 75%;">
                        <p>클라이언트 형태 및 연락처 정보는 파트너들에게 공개되지 않습니다.</p>
                        <p>커프링크와의 원활한 커뮤니케이션을 위해 클라이언트님의 정보를 정확히 입력해주세요.</p>
                     </div>
                     <div class="column container" style="padding-left: 10px; padding-top: 0px; padding-bottom: 0px; width: 25%;"></div>
                     <div class="column container" style="padding-left: 10px; padding-top: 0px; padding-bottom: 0px; width: 75%;">
                        <hr class="garo" />
                     </div>
                     <div class="center column container" style="padding: 17px; width: 25%;">
                        <span>*</span>클라이언트 소개<br> <br> <br> <br> <br> <br>
                     </div>
                     <div class="column container" style="padding-top: 0px; width: 75%;">
                        <div class="ui comments">
                           <form class="ui reply form">
                              <div class="field">
                                 <textarea style="margin-top: 0px; margin-bottom: 0px; height: 170px;"></textarea>
                              </div>
                              <p>회사(개인)에 대해 간략하게 설명해주세요(150자 이내)</p>
                              <div id="ProjectRegisterButton" class="ui blue labeled submit icon button">
                                 <i class="icon edit"></i> 프로젝트 정보 등록하러 가기
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="column grid" style="padding: 10px; width: 30%;">
                  <div class="column-login1">국내 1위,</div>
                  <div class="column-login1">온라인 아웃소싱 플랫폼</div>
                  <div class="column-login1">CuffLink(커프링크)</div>
                  <div class="column-login1">000,000개의 클라이언트 기업</div>
                  <div class="column-login1">000,000개의 개발회사 & 프리랜서</div>
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
      <div class="ui inverted segment" style="height: 200px; padding: 25px; vertical-align: middle;">
         <jsp:include page="../common/menu/footerMenu.jsp" />
      </div>
   </footer>
   <!-- footer 끝-->
   <!----------------------------------------------------------------------- footer content 끝 -->
   
   <script>
      $('.tag.example .ui.dropdown')
         .dropdown({
            allowAdditions : true
         });
   </script>
   
</body>
</html>