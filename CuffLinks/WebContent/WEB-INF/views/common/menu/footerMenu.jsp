<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="ui content-footer four column grid container">

	<div class="column column-footer container"
		style="width: 40%; height: 180px; text-align: left">
		<h3>
			<img src="../../image/logo.jpg" class="ui image tiny" alt=""
				style="float: left; margin-right: 10px" />CuffLink
		</h3>
		<br> 전화: <br> 이메일: <br> 운영시간: <br> 주소: <br>
		©2018 CuffLink Corp.
	</div>
	<div class="column column-footer container"
		style="width: 20%; height: 180px; text-align: left">클라이언트 메뉴</div>
	<div class="column column-footer container"
		style="width: 20%; height: 180px; text-align: left">파트너스 메뉴</div>
	<div class="column grid container"
		style="width: 20%; height: 180px; text-align: left">게시판</div>
</div>

<!-- chatting -->
<div class="chat-right">
	<div id="chatbtn" class="chatbtn">
		<a href="#"><p>
				<i class="fas fa-comment-dots "></i> 채팅문의
			</p></a>
	</div>
	<div id="chatwin" class="chatwin">
		<div class="chat-top">
			<div class="t-left">
				<a href="#"> <i class="fas fa-cog fa-2x"></i>
				</a>
			</div>
			<div class="t-center">CuffLink 상담실</div>
			<div class="t-right">
				<a href="#"> <i class="fas fa-times fa-2x"></i>
				</a>
			</div>
		</div>
		<div class="chat-middle" style="height: 400px;">
			<div id="c-middle" class="c-middle">
			</div>
		</div>
		<div class="chat-bottom">
			<div class="b-left">
				<a href="#"> <i class="fas fa-paperclip fa-2x"></i>
				</a>
			</div>
			<div class="b-center">
				<input type="text" id="q-input" name="q-input"
					onkeypress="if(event.keyCode==13){input(); return false;}">
			</div>
			<div class="b-right">
				<a href="javascript:sendMessage();"> <i
					class="fas fa-arrow-circle-right fa-2x"></i>
				</a>
			</div>
		</div>
	</div>
</div>

<!-- 채팅문의 관련 코드 -->
<script src="../js/headerMenu.js"></script>

<script>
	var socket = new WebSocket('ws://192.168.0.59:8080/WebSocketServer')
	var info = {
		id : '<%= request.getRemoteAddr()%>',
		message : '입장'
	}
	socket.onopen = function() {
		socket.send(JSON.stringify(info))
	}
	socket.onmessage = function(message) {
		console.log(message)
		var info = JSON.parse(message.data)
		if (!info.master && info.id === '<%= request.getRemoteAddr() %>') {
			$('#c-middle').append('<p align="right"> 나:' + info.message + '</p>')
		}
		if (info.master && info.id === '<%= request.getRemoteAddr() %>') {
			$('#c-middle').append('<p align="left">Master: ' + info.message + '</p>')
		}
	}
	socket.onerror = function() {
		alert('에러가 발생 했습니다.')
	}
	socket.onclose = function() {
		alert('연결종료')
	}

	function sendMessage() {
		info = {
			id : '<%= request.getRemoteAddr()%>',
			message : $('#q-input').val()
		}
		socket.send(JSON.stringify(info));
		$('#q-input').val('')
	}
	$('#q-input').keypress(function(e) {
		if (e.keyCode === 13) {
			info = {
				id : '<%= request.getRemoteAddr()%>',
				message : $('#q-input').val()
			}
			socket.send(JSON.stringify(info));
			$('#q-input').val('')
		}
	})
</script>



