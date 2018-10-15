<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../common/ui.jsp" />
<meta charset="UTF-8">
<title>test</title>
<link rel="stylesheet" type="text/css" href="../dist/semantic.css">
<link rel="stylesheet" href="./css/cuffLink.css" />
<link rel="stylesheet" href="./css/login.css" />
</head>
<body>
중앙평균크기 조절
<div class="ui two column centered grid" style="border:1px solid #000000;">
  <div class="column" style="border:1px solid #000000;">1</div>
  <div class="four column centered row" style="border:1px solid #000000;">
    <div class="column" style="border:1px solid #000000;">2</div>
    <div class="column" style="border:1px solid #000000;">3</div>
  </div>
</div>


<div class="ui styled accordion">
  <div class="title">
    <i class="dropdown icon"></i>
    Level 1
  </div>
  <div class="content">
    Welcome to level 1
    <div class="accordion transition hidden">
      <div class="title">
          <i class="dropdown icon"></i>
          Level 1A
      </div>
      <div class="content">
        <p class="transition hidden">Level 1A Contents</p>
        <div class="accordion transition hidden">
          <div class="title">
              <i class="dropdown icon"></i>
              Level 1A-A
          </div>
          <div class="content">
              Level 1A-A Contents
          </div>
          <div class="title">
              <i class="dropdown icon"></i>
              Level 1A-B
          </div>
          <div class="content">
              Level 1A-B Contents
          </div>
        </div>
      </div>
      <div class="title">
          <i class="dropdown icon"></i>
          Level 1B
      </div>
      <div class="content">
          Level 1B Contents
      </div>
      <div class="title">
          <i class="dropdown icon"></i>
          Level 1C
      </div>
      <div class="content">
          Level 1C Contents
      </div>
    </div>
  </div>
  <div class="title">
    <i class="dropdown icon"></i>
    Level 2
  </div>
  <div class="content">
    <p class="transition hidden">Welcome to level 2</p>
    <div class="accordion transition hidden">
      <div class="active title">
        <i class="dropdown icon"></i>
        Level 2A
      </div>
      <div class="active content">
        <p>Level 2A Contents</p>
        <div class="accordion">
          <div class="title">
              <i class="dropdown icon"></i>
              Level 2A-A
          </div>
          <div class="content">
              Level 2A-A Contents
          </div>
          <div class="title">
              <i class="dropdown icon"></i>
              Level 2A-B
          </div>
          <div class="content">
              Level 2A-B Contents
          </div>
        </div>
      </div>
      <div class="title">
          <i class="dropdown icon"></i>
          Level 2B
      </div>
      <div class="content">
          Level 2B Contents
      </div>
      <div class="title">
          <i class="dropdown icon"></i>
          Level 2C
      </div>
      <div class="content">
          Level 2C Contents
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
$('.trigger.title .accordion')
  .accordion({
    selector: {
      trigger: '.title .icon'
    }
  });
</script>

























<div style="padding-top:30px;">
	<div class="ui two column grid container">
		<div class="ui one center column container" style="padding: 17px; width: 90%; text-align: left;height: 54px;">
			<h5>보안 로그인</h5>
			개인정보 보호를 위하여 회원님의 비밀번호를 다시 한번 확인합니다.
		</div>
		
		<div class="center column container" style="padding: 17px; width: 30%;">
			<span>*</span>이메일
		</div>
		<div class="column container" style="padding: 17px; width: 60%;">
			twins0313@naver.com
		</div>
		<div class="center column container" style="padding: 17px; width: 30%;">
			<span>*</span>비밀번호
		</div>
		<div class="column container" style="padding: 10px; width: 60%;">
			<div class="ui input">
				<input type="text" placeholder="비밀번호를 입력하세요." size="45px">
			</div>
		</div>
		<div class="center column container" style="padding: 17px; width: 30%;">
			
		</div>
		<div class="column container" style="padding: 10px; width: 60%; text-align:right">
			<div class="ui container" style="padding-right:30px; ">
				<button class="ui blue button" >로그인</button>
			</div>
		</div>
	</div>
</div>





















	<div class="ui form">
		<div class="grouped fields">
			<div class="field">
				<div class="ui radio checkbox">
					<input type="radio" name="example2" checked="checked"> <label>남</label>
				</div>
			</div>
			<div class="field">
				<div class="ui radio checkbox">
					<input type="radio" name="example2"> <label>여k</label>
				</div>
			</div>
		</div>
	</div>

	<select class="form-control" id="id_bank" name="bank"
		required="required"><option value="">은행 선택</option>
		<option value="1">한국산업은행</option>
		<option value="2">기업은행</option>
		<option value="3">국민은행</option>
		<option value="4">우리은행</option>
		<option value="5">신한은행</option>
		<option value="6">하나은행</option>
		<option value="7">농협</option>
		<option value="8">단위농협</option>
		<option value="9">SC은행</option>
		<option value="10">외환은행</option>
		<option value="11">한국씨티은행</option>
		<option value="12">우체국</option>
		<option value="13">경남은행</option>
		<option value="14">광주은행</option>
		<option value="15">대구은행</option>
		<option value="16">도이치</option>
		<option value="17">부산은행</option>
		<option value="18">산림조합</option>
		<option value="19">산업은행</option>
		<option value="20">상호저축은행</option>
		<option value="21">새마을금고</option>
		<option value="22">수협</option>
		<option value="23">신협중앙회</option>
		<option value="24">전북은행</option>
		<option value="25">제주은행</option>
		<option value="26">BOA</option>
		<option value="27">HSBC</option>
		<option value="28">JP모간</option>
		<option value="29">교보증권</option>
		<option value="30">대신증권</option>
		<option value="31">대우증권</option>
		<option value="32">동부증권</option>
		<option value="33">동양증권</option>
		<option value="34">메리츠증권</option>
		<option value="35">미래에셋</option>
		<option value="36">부국증권</option>
		<option value="37">삼성증권</option>
		<option value="38">솔로몬투자증권</option>
		<option value="39">신영증권</option>
		<option value="40">신한금융투자</option>
		<option value="41">우리투자증권</option>
		<option value="42">유진투자은행</option>
		<option value="43">이트레이드증권</option>
		<option value="44">키움증권</option>
		<option value="45">하나대투</option>
		<option value="46">하이투자</option>
		<option value="47">한국투자</option>
		<option value="48">한화증권</option>
		<option value="49">현대증권</option>
		<option value="50">HMC증권</option>
		<option value="51">LIG투자증권</option>
		<option value="52">NH증권</option>
		<option value="53">SK증권</option>
		<option value="54">비엔비파리바은행</option>
		<option value="55">케이뱅크</option>
		<option value="56">카카오뱅크</option></select>


	<div class="ui two column grid">
		<div class="column">
			<div class="ui raised segment">
				<a class="ui red ribbon label">Overview</a> <span>Account
					Details</span>
				<p>이거 된다고?</p>
				<a class="ui blue ribbon label">Community</a> User Reviews
				<p></p>
			</div>
		</div>
		<div class="column">
			<div class="ui segment">
				<a class="ui orange right ribbon label">Specs</a>
				<p></p>
				<a class="ui teal right ribbon label">Reviews</a>
				<p>정말</p>
			</div>
		</div>
	</div>


	<div class="example">
		<h4 class="ui header">Modal</h4>
		<p>A standard modal</p>
		<div class="code" data-demo="true"
			data-eval="$('.modal').modal('show');">$('.ui.modal')
			.modal('show') ;</div>
		<div class="existing code" data-type="html">
			<div class="ui modal">
				<i class="close icon"></i>
				<div class="header">Profile Picture</div>
				<div class="image content">
					<div class="ui medium image">
						<img src="/images/avatar/large/chris.jpg">
					</div>
					<div class="description">
						<div class="ui header">We've auto-chosen a profile image for
							you.</div>
						<p>
							We've grabbed the following image from the <a
								href="https://www.gravatar.com" target="_blank">gravatar</a>
							image associated with your registered e-mail address.
						</p>
						<p>Is it okay to use this photo?</p>
					</div>
				</div>
				<div class="actions">
					<div class="ui black deny button">Nope</div>
					<div class="ui positive right labeled icon button">
						Yep, that's me <i class="checkmark icon"></i>
					</div>
				</div>
			</div>
		</div>


















		<div class="ui compact menu">
			<div class="ui dropdown item">
				twins0313 <i class="dropdown icon"></i>
				<div class="menu">
					<div class="item">
						<i class="home icon"></i>마이 커프링크
					</div>
					<div class="item">
						<i class="user icon"></i>클라이언트 정보관리
					</div>
					<div class="item">
						<i class="cog icon"></i>계정설정
					</div>
					<div class="item">
						<i class="power off icon"></i>로그아웃
					</div>
				</div>
			</div>
		</div>




		<div class="ui secondary pointing menu">
			<a class="item"> Home </a> <a class="item active"> Messages </a> <a
				class="item"> Friends </a>
			<div class="right menu">
				<a class="ui item"> Logout </a>
			</div>
		</div>
		<div class="ui segment">
			<p></p>
		</div>
		<div class="ui form">
			<div class="inline fields">
				<div class="field">
					<div class="ui radio checkbox">
						<input type="radio" name="frequency" checked="checked"> <label>클라이언트</label>
					</div>
				</div>
				<div class="field">
					<div class="ui radio checkbox">
						<input type="radio" name="frequency"> <label>파트너스</label>
					</div>
				</div>
			</div>
		</div>

		<script src="/javascript/dropdown.js"></script>
		<div class="ui four item stackable tabs menu">
			<a class="item active" data-tab="definition">Definition</a> <a
				class="item" data-tab="examples">Examples</a> <a class="item"
				data-tab="usage">Usage</a> <a class="item" data-tab="settings">Settings</a>
		</div>






		<div class="ui comments">
			<h3 class="ui dividing header">Comments</h3>
			<div class="comment">
				<a class="avatar"> <img src="/images/avatar/small/matt.jpg">
				</a>
				<div class="content">
					<a class="author">Matt</a>
					<div class="metadata">
						<span class="date">Today at 5:42PM</span>
					</div>
					<div class="text">How artistic!</div>
					<div class="actions">
						<a class="reply">Reply</a>
					</div>
				</div>
			</div>
			<div class="comment">
				<a class="avatar"> <img src="/images/avatar/small/elliot.jpg">
				</a>
				<div class="content">
					<a class="author">Elliot Fu</a>
					<div class="metadata">
						<span class="date">Yesterday at 12:30AM</span>
					</div>
					<div class="text">
						<p>This has been very useful for my research. Thanks as well!</p>
					</div>
					<div class="actions">
						<a class="reply">Reply</a>
					</div>
				</div>
				<div class="comments">
					<div class="comment">
						<a class="avatar"> <img src="/images/avatar/small/jenny.jpg">
						</a>
						<div class="content">
							<a class="author">Jenny Hess</a>
							<div class="metadata">
								<span class="date">Just now</span>
							</div>
							<div class="text">Elliot you are always so right :)</div>
							<div class="actions">
								<a class="reply">Reply</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="comment">
				<a class="avatar"> <img src="/images/avatar/small/joe.jpg">
				</a>
				<div class="content">
					<a class="author">Joe Henderson</a>
					<div class="metadata">
						<span class="date">5 days ago</span>
					</div>
					<div class="text">Dude, this is awesome. Thanks so much</div>
					<div class="actions">
						<a class="reply">Reply</a>
					</div>
				</div>
			</div>


			<div class="ui comments">
				<form class="ui reply form">
					<div class="field">
						<textarea
							style="margin-top: 0px; margin-bottom: 0px; height: 167px;"></textarea>
					</div>
					<div class="ui blue labeled submit icon button">
						<i class="icon edit"></i> 프로젝트 정보 등록하러 가기
					</div>
				</form>
			</div>


			<div class="ui very relaxed celled list">
				<div class="item">
					<img>
					<div class="content">
						<div class="header">
							New York Dog Fair
							<div class="ui heart rating" data-rating="2"></div>
						</div>
						A fun day at the fair
					</div>
				</div>
				<div class="item">
					<img>
					<div class="content">
						<div class="header">
							Dog Appreciation Day
							<div class="ui heart rating" data-rating="2"></div>
						</div>
						I'd like to tell your dog he's great
					</div>
				</div>
			</div>
			<script>
				$('.ui.rating').rating({
					initialRating : 3,
					maxRating : 5
				});
			</script>
			<div class="ui rating"></div>

			<div class="ui celled relaxed list">
				<div class="item">
					<div class="ui master checkbox">
						<input type="checkbox" name="dev"> <label>개발</label>
					</div>
					<div class="list">
						<div class="item">
							<div class="ui child checkbox">
								<input type="checkbox" name="dev_web"> <label>웹</label>
							</div>
						</div>
						<div class="item">
							<div class="ui child checkbox">
								<input type="checkbox" name="dev_application"> <label>애플리케이션</label>
							</div>
						</div>
						<div class="item">
							<div class="ui child checkbox">
								<input type="checkbox" name="dev_wordPress"> <label>워드프레스</label>
							</div>
						</div>
						<div class="item">
							<div class="ui child checkbox">
								<input type="checkbox" name="dev_publishing"> <label>퍼블리싱</label>
							</div>
						</div>
						<div class="item">
							<div class="ui child checkbox">
								<input type="checkbox" name="dev_software"> <label>일반
									소프트웨어</label>
							</div>
						</div>
						<div class="item">
							<div class="ui child checkbox">
								<input type="checkbox" name="dev_commerce"> <label>커머스,쇼핑몰</label>
							</div>
						</div>
						<div class="item">
							<div class="ui child checkbox">
								<input type="checkbox" name="dev_game"> <label>게임</label>
							</div>
						</div>
						<div class="item">
							<div class="ui child checkbox">
								<input type="checkbox" name="dev_embeded"> <label>임베디드</label>
							</div>
						</div>
						<div class="item">
							<div class="ui child checkbox">
								<input type="checkbox" name="dev_outside"> <label>기타</label>
							</div>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="ui master checkbox">
						<input type="checkbox" name="design"> <label>디자인</label>
					</div>
					<div class="list">
						<div class="item">
							<div class="ui child checkbox">
								<input type="checkbox" name="design_web"> <label>웹</label>
							</div>
						</div>
						<div class="item">
							<div class="ui child checkbox">
								<input type="checkbox" name="design_application"> <label>애플리케이션</label>
							</div>
						</div>
						<div class="item">
							<div class="ui child checkbox">
								<input type="checkbox" name="design_product"> <label>제품</label>
							</div>
						</div>
						<div class="item">
							<div class="ui child checkbox">
								<input type="checkbox" name="design_presentation"> <label>프레젠테이션</label>
							</div>
						</div>
						<div class="item">
							<div class="ui child checkbox">
								<input type="checkbox" name="design_print"> <label>인쇄물</label>
							</div>
						</div>
						<div class="item">
							<div class="ui child checkbox">
								<input type="checkbox" name="design_commerce"> <label>커머스,쇼핑몰</label>
							</div>
						</div>
						<div class="item">
							<div class="ui child checkbox">
								<input type="checkbox" name="design_logo"> <label>로고</label>
							</div>
						</div>
						<div class="item">
							<div class="ui child checkbox">
								<input type="checkbox" name="design_graphics"> <label>그래픽</label>
							</div>
						</div>
						<div class="item">
							<div class="ui child checkbox">
								<input type="checkbox" name="design_vision"> <label>영상</label>
							</div>
						</div>
						<div class="item">
							<div class="ui child checkbox">
								<input type="checkbox" name="design_game"> <label>게임</label>
							</div>
						</div>
						<div class="item">
							<div class="ui child checkbox">
								<input type="checkbox" name="design_outside"> <label>기타</label>
							</div>
						</div>
					</div>
				</div>
			</div>

			<script>
				/************************************************************ 프로젝트 찾기 - 프로젝트  카테고리  */
				$('.list .master.checkbox').checkbox(
						{
							// check all children
							onChecked : function() {
								var $childCheckbox = $(this).closest(
										'.checkbox').siblings('.list').find(
										'.checkbox');
								$childCheckbox.checkbox('check');
							},
							// uncheck all children
							onUnchecked : function() {
								var $childCheckbox = $(this).closest(
										'.checkbox').siblings('.list').find(
										'.checkbox');
								$childCheckbox.checkbox('uncheck');
							}
						});
				$('.list .child.checkbox')
						.checkbox(
								{
									// Fire on load to set parent value
									fireOnInit : true,
									// Change parent state on each child checkbox change
									onChange : function() {
										var $listGroup = $(this).closest(
												'.list'), $parentCheckbox = $listGroup
												.closest('.item').children(
														'.checkbox'), $checkbox = $listGroup
												.find('.checkbox'), allChecked = true, allUnchecked = true;
										// check to see if all other siblings are checked or unchecked
										$checkbox
												.each(function() {
													if ($(this).checkbox(
															'is checked')) {
														allUnchecked = false;
													} else {
														allChecked = false;
													}
												});
										// set parent checkbox state, but dont trigger its onChange callback
										if (allChecked) {
											$parentCheckbox
													.checkbox('set checked');
										} else if (allUnchecked) {
											$parentCheckbox
													.checkbox('set unchecked');
										} else {
											$parentCheckbox
													.checkbox('set indeterminate');
										}
									}
								});
				/************************************************************ 프로젝트 찾기 - 프로젝트  카테고리  */
			</script>

			<div class="ui hidden divider"></div>
			<div class="ui floating dropdown button">
				<div class="text">Go to</div>
				<i class="dropdown icon"></i>
				<div class="menu">
					<a class="item" href="http://www.naver.com"><i
						class="home icon"></i> Home</a> <a class="item" href="#link2"><i
						class="users icon"></i> Browse</a> <a class="item" href="#link3"><i
						class="search icon"></i> Search</a>
				</div>
			</div>
			<script type="text/javascript">
				$('.dropdown').dropdown({
					action : 'hide'
				});
			</script>
			<br> <br> <br> <br> <br> <br> <br>
			<br> <select class="ui search selection dropdown"
				id="search-select">
				<option value="">지역선택</option>
				<option value="1">서울특별시</option>
				<option value="2">경기도</option>
				<option value="3">인천광역시</option>
				<option value="4">부산광역시</option>
				<option value="5">대구광역시</option>
				<option value="6">광주광역시</option>
				<option value="7">대전광역시</option>
				<option value="8">울산광역시</option>
				<option value="9">세종특별자치시</option>
				<option value="10">강원도</option>
				<option value="11">충청북도</option>
				<option value="12">충청남도</option>
				<option value="13">전라북도</option>
				<option value="14">전라남도</option>
				<option value="15">경상북도</option>
				<option value="16">경상남도</option>
				<option value="17">제주특별자치도</option>
			</select>
			<script type="text/javascript">
				$('#search-select').dropdown();
			</script>












			<br> <br> <br> <br> <br> <br> <br>
			<br> <br> <br>
</body>
</html>