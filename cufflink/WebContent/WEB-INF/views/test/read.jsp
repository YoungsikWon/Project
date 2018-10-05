<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//한줄댓글 입력 메소드

function doCreateCmt() {

   // 한줄댓글 내용이 필수이므로 검사

   if($('#cmt').val() == '') {

         alert("한줄 댓글의 내용은 필수 입력입니다.");

         $('#cmt').focus(); return;

   }

   // 버튼 중복 클릭 방지

   $('#createbt').attr('disabled', 'disabled');

   $.post('<%=cp%>/re/createCmt',

               {cwriter:$('#cwriter').val(),

                cmt:$('#cmt').val(),

                no:${item.no}},

               function(data){

                      $('#cmt').val(''); // 내용 비우기

                      // 다시 클릭이 가능하게끔

                      $('#createbt').attr("disabled", false);

                      // 입력이 완료가 됐으므로 다시 리스트 불러오기

                      cmtList();

               });

}

//한줄댓글 리스트 가져오는 메소드

function cmtList() {

   $('#cmtTarget').load("<%=cp%>/re/listCmt?no=${item.no}");

}

function doDeleteCmt(cno) {

   $.post('<%=cp%>/re/deleteCmt',

               {"cno":cno, no:${item.no}}, function(data) {cmtList();});

}

$(function(){

   // id가 cmt인 텍스트에서 엔터를 쳤을 경우

   // 바로 데이터 입력이 되도록 작성

   $('#cmt').keyup(function(e){

         if(e.keyCode == 13) doCreateCmt();

   });

   // 처음 읽기 화면 들어왔을때 바로 리스트를 가져와서 보여줌

   cmtList();
</script>
</head>
<body>
<div>

            <div>글쓴이 : <input type="text" id="cwriter" value="${userid }" style="width: 10%" /> 댓글 : <input type="text" id="cmt" style="width: 50%" />

            <input type="button" value="입력" id="createbt" onclick="doCreateCmt();" /></div>

      </div>

      <div id="cmtTarget"></div>



</body>
</html>