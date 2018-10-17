<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	session.setAttribute("username", "hi");
%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.0/dist/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.0/dist/semantic.min.js"></script>
</head>
<body>
	<div class="ui text container">
		<div class="ui segments">
			<div class="ui segment">
				<p>채팅서버</p>
			</div>
		</div>
		<div class="ui action input">
			<select id="users">
				<option value="">ip</option>
			</select> <input id="msg" type="text" placeholder="메시지를 입력해주세요">
			<button class="ui button">입력</button>
		</div>
	</div>
	<script>
		var socket = new WebSocket('ws://192.168.0.36:8080/WebSocketServer')
		var data = []
		socket.onopen = function() {
			for(d of data){
				if($("#users").val() != d){
				$('#users').append('<option class="data" value="'+d+'">'+d+'</option>')
				}
			}
		}
		socket.onmessage = function(message) {
			var info = JSON.parse(message.data);
			console.log(info.id)
			if(data.length > 0){
				for(d of data){
					console.log(d)
					if(d != info.id){
						data.push(info.id)
					}
				}
			}else{
				data.push(info.id)
			}
			var msg = info.message
			$('.ui.segments').append('<div class="ui segment"><p>'+info.id+":"+msg+'</p></div>')
			$('#users').html('')
			for(d of data){
				if($("#users").val() != d){
				$('#users').append('<option class="data" value="'+d+'">'+d+'</option>')
				}
			}
		}
		socket.onerror = function() {
			alert('에러가 발생 했습니다.')
		}
		socket.onclose = function() {
			alert('연결종료')
		}
		$('button').on({
			click : function(e) {
				console.log($('#users').val())
				var obj = {
					id : $('#users').val(),
					message : $('#msg').val(),
					master:'Master'
				}
				var json = JSON.stringify(obj)
				socket.send(json);
				$('#msg').val('')
			}
		})
		$('input').on({
			keypress : function(e) {
				if (e.keyCode === 13) {
					var obj = {
						id : $('#users').val(),
						message : $('#msg').val(),
						master:'Master'
					}
					var json = JSON.stringify(obj)
					socket.send(json);
					$('#msg').val('')
				}
			}
		})
	</script>
</body>
</html>