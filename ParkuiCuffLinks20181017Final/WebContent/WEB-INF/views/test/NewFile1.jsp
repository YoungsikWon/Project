<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../common/ui.jsp" />
<meta charset="UTF-8">
<title>test</title>
<link rel="stylesheet" href="./css/cuffLink.css" />
<link rel="stylesheet" href="./css/login.css" />
</head>
<body>

	<div class="ui styled fluid accordion">
		<div class="ui two column grid title">
			<div class="column">
				<i class="envelope outline icon"></i> 이메일
			</div>
			<div class="column" style="text-align: right;">
				<i class="dropdown icon"></i>
			</div>
		</div>
		<div class="content">
			<div class="ui two column centered grid"
				style="padding-top: 0px; border: 1px solid #dedede;">
				<div class="column"
					style="padding-left: 20px; padding-right: 0px; padding-top: 10px; padding-bottom: 10px; width: auto;">
					<img class="ui mini" src="../../image/setting_email.png">
				</div>
				<div class="column"
					style="padding-left: 20px; padding-right: 0px; padding-top: 20px; padding-bottom: 20px; width: auto; text-align: left;">
					&nbsp;&nbsp; twins0313@naver.com 으로 알림을 받습니다.</div>
			</div>
			<div style="padding: 20px;"></div>
			<div>
				<div class="ui internally celled grid">
					<div class="row">
						<div class="six wide column" style="background-color:#FBFBEF">
							프로젝트 알림
						</div>
						<div class="ten wide column">
							<div class="ui form">
								<div class="grouped fields">
									<div class="field">
										<div class="ui radio checkbox">
											<input type="radio" name="example1" checked="checked">
											<label>전체 알림 받기</label>
										</div>
									</div>
									<div class="field">
										<div class="ui radio checkbox">
											<input type="radio" name="example1"> 
											<label>중요한 알림만 받기 | 프로젝트 댓글, 미팅 안내 등</label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="six wide column" style="background-color:#FBFBEF">
							지원자 알림
						</div>
						<div class="ten wide column">
							<div class="ui relaxed list">
								<div class="item">
									<div class="ui master checkbox">
										<input type="checkbox" name="fruits"> <label>전체 알림 받기</label>
									</div>
									<div class="list">
										<div class="item">
											<div class="ui child checkbox">
												<input type="checkbox" name="apple"> <label>실시간 새로운 지원자</label>
											</div>
										</div>
										<div class="item">
											<div class="ui child checkbox">
												<input type="checkbox" name="orange"> <label>지난밤의 새로운 지원자</label>
											</div>
										</div>
										<div class="item">
											<div class="ui child checkbox">
												<input type="checkbox" name="pear"> <label>일간 지원자 현황</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="six wide column" style="background-color:#FBFBEF">
							계약 알림
						</div>
						<div class="ten wide column">
							<div class="ui form">
								<div class="grouped fields">
									<div class="field">
										<div class="ui radio checkbox">
											<input type="radio" name="example2" checked="checked">
											<label>전체 알림 받기</label>
										</div>
									</div>
									<div class="field">
										<div class="ui radio checkbox">
											<input type="radio" name="example2"> 
											<label>중요한 알림만 받기 | 프로젝트 댓글, 미팅 안내 등</label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="" style="padding-top:20px;">
						기타 알림
					</div>
					<div class="ui form" style="padding-top:20px;">
						<div class="field">
							<div class="ui checkbox" id="demo1">
								<input type="checkbox" checked="checked">
								<label>Disabled</label>
							</div>
						</div>
						<div class="field">
							<div class="ui checkbox" id="demo2">
								<input type="checkbox"> <label>Read-only</label>
							</div>
						</div>
						<div class="field">
							<div class="ui checkbox" id="demo3">
								<input type="checkbox"> <label>Uncheckable</label>
							</div>
						</div>
					</div>
				</div>
				<div>
					<div class="column container" style="padding: 10px; width: 100%; text-align: right;">
						<div class="right menu">
							<button class="ui primary button" style="margin-right: 10px;" onclick="window.location.href='#'" />
							저장
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
<!-- 문자메시지 ================================================================================================-->
		<div class="ui two column grid title">
			<div class="column">
				<i class="envelope outline icon"></i> 문자 메시지
			</div>
			<div class="column" style="text-align: right;">
				<i class="dropdown icon"></i>
			</div>
		</div>
		<div class="content">
			<div class="ui two column centered grid" style="padding-top: 0px; border: 1px solid #dedede;">
				<div class="column"	style="padding-left: 20px; padding-right: 0px; padding-top: 20px; padding-bottom: 10px; width: auto;">
					<img class="ui mini" src="../../image/setting_email.png">
				</div>
				<div class="column" style="padding-left: 20px; padding-right: 0px; padding-top: 20px; padding-bottom: 20px; width: auto; text-align: left;">
					입력된 연락처 정보가 없습니다.<br>
					문자메시지 알림을 받으려면 연락처 정보를 입력해 주세요.<br><br>
					<h11><a href="/ClientProfile">연락처 정보 입력하기 ></a></h11>
				</div>
			</div>
			<div style="padding: 20px;"></div>
			<div>
				<div class="ui internally celled grid">
					<div class="row">
						<div class="six wide column" style="background-color:#FBFBEF">
							프로젝트 알림
						</div>
						<div class="ten wide column">
							<div class="ui form">
								<div class="grouped fields">
									<div class="field">
										<div class="ui radio checkbox">
											<input type="radio" name="example1" checked="checked">
											<label>전체 알림 받기</label>
										</div>
									</div>
									<div class="field">
										<div class="ui radio checkbox">
											<input type="radio" name="example1"> 
											<label>중요한 알림만 받기 | 프로젝트 댓글, 미팅 안내 등</label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="six wide column" style="background-color:#FBFBEF">
							지원자 알림
						</div>
						<div class="ten wide column">
							<div class="ui relaxed list">
								<div class="item">
									<div class="ui master checkbox">
										<input type="checkbox" name="fruits"> <label>전체 알림 받기</label>
									</div>
									<div class="list">
										<div class="item">
											<div class="ui child checkbox">
												<input type="checkbox" name="apple"> <label>실시간 새로운 지원자</label>
											</div>
										</div>
										<div class="item">
											<div class="ui child checkbox">
												<input type="checkbox" name="orange"> <label>지난밤의 새로운 지원자</label>
											</div>
										</div>
										<div class="item">
											<div class="ui child checkbox">
												<input type="checkbox" name="pear"> <label>일간 지원자 현황</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="six wide column" style="background-color:#FBFBEF">
							계약 알림
						</div>
						<div class="ten wide column">
							<div class="ui form">
								<div class="grouped fields">
									<div class="field">
										<div class="ui radio checkbox">
											<input type="radio" name="example2" checked="checked">
											<label>전체 알림 받기</label>
										</div>
									</div>
									<div class="field">
										<div class="ui radio checkbox">
											<input type="radio" name="example2"> 
											<label>중요한 알림만 받기 | 계약 상태 변경, 대금 상태 등</label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div>
					<div class="column container" style="padding: 10px; width: 100%; text-align: right;">
						<div class="right menu">
							<button class="ui primary button" style="margin-right: 10px;" onclick="window.location.href='#'" />
							저장
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
$('.ui.accordion')
  .accordion({
    selector: {
      trigger: '.title .icon'
    }
  });
</script>
</body>
</html>