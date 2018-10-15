<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		$(document).ready(function() {
			// 리스트 이벤트
			$('#dt_reserv_list').dataTable({
				//url:'../../member/empty/getReservList.test',
				"ajax" : {
					"url" : "../boardList/board.hon?key=혼밥",
					"type" : "POST"
				},
				"columns" : [
					{
						"data" : 'BAB_NO',
						"className" : 'dt-body-center'
					},
					{
						"data" : 'BAB_ID',
						"className" : 'dt-body-center'
					},
					{
						"data" : 'BAB_TITLE',
						"className" : 'dt-body-center'
					},
					{
						"data" : 'BAB_CATEGORY',
						"className" : 'dt-body-center'
					},
					{
						"data" : 'BAB_HIT',
						"className" : 'dt-body-center'
					},
					{
						"data" : 'BAB_DATE',
						"className" : 'dt-body-center'
					}
				],
				"language" : {
					"sEmptyTable" : "데이터가 없습니다",
					"sInfo" : "_START_ - _END_ / _TOTAL_",
					"sInfoEmpty" : "0 - 0 / 0",
					"sInfoFiltered" : "(총 _MAX_ 개)",
					"sInfoPostFix" : "",
					"sInfoThousands" : ",",
					"sLengthMenu" : "페이지당 줄수 _MENU_",
					"sLoadingRecords" : "읽는중...",
					"sProcessing" : "처리중...",
					"sSearch" : "검색:",
					"sZeroRecords" : "검색 결과가 없습니다",
					"oPaginate" : {
						"sFirst" : "처음",
						"sLast" : "마지막",
						"sNext" : "다음",
						"sPrevious" : "이전"
					},
					"oAria" : {
						"sSortAscending" : ": 오름차순 정렬",
						"sSortDescending" : ": 내림차순 정렬"
					}
				}
			});
			//
			var table = $('#dt_reserv_list').DataTable(); // 테이블
			$('#dt_reserv_tbody').on('click', 'tr', function(e, dt, type, indexes) { // 티바디를 누르면..
				var data = table.row(this).data();
				var BAB_NO = data.BAB_NO;
				location.href = '../boardList/boardOne.hon?key=혼밥' + "&num=" + BAB_NO;
			});
		})
	</script>
	<div class="ui header"
		style="margin-left: 0px; margin-right: 0px; margin-top: 100px; margin-bottom: 100px">
		<div class="ui field">
			<div class="ui stackable column grid">
				<div class="ui column">
					<div class="ui blue three item inverted top attached tabular menu">
						<a id="m_reservation" class="item"> </a> <a id="m_reserv_list"
							class="item active"> </a> <a id="m_reserv_history" class="item">
						</a>
					</div>
					<div id="reserv_list" class="ui blue bottom attached segment">
						<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 말머리 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						<table id="dt_reserv_list"
							class="ui center aligned stackable selectable display datatable">
							<thead>
								<tr>
									<th style="width: 100px;">글 번호</th>
									<th style="width: 100px;">제목</th>
									<th style="width: 300px;">분류</th>
									<th style="width: 200px;">작성자</th>
									<th style="width: 500px;">조회수</th>
									<th style="width: 100px;">날짜</th>
								</tr>
							</thead>
							<tbody id="dt_reserv_tbody"></tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(".menu").find('a').click(function() {
			$(".menu").find('a').attr('class', 'item'); //active 초기화
			$(this).attr('class', 'item active'); //누른메뉴 active로 변경
			if ($(this).attr('id') == 'm_reservation') {
				location.href = "./sView.jsp";
			} else if ($(this).attr('id') == 'm_reserv_list') {
				$("#reserv_list").show();
			} else if ($(this).attr('id') == 'm_reserv_history') {
				$("#reservation").hide();
				$("#reserv_list").hide();
			}
		});
	</script>
</body>
</html>