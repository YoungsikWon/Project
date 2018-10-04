<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/* Style the buttons */
.btn {
    border: none;
    outline: none;
    padding: 10px 16px;
    background-color: #f1f1f1;
    cursor: pointer;
    font-size: 18px;
}

/* Style the active class, and buttons on mouse-over */
.active, .btn:hover {
    background-color: #666;
    color: white;
}
</style>
</head>
<body>

<h1>4</h1>
<p>Highlight the active/current (pressed) button.</p>
  
<div id="myDIV">
   <button class="btn" onclick="location.href='test11.jsp'">1</button>
  <button class="btn" onclick="location.href='test12.jsp'">2</button>
  <button class="btn" onclick="location.href='test13.jsp'">3</button>
  <button class="btn" onclick="location.href='test14.jsp'">4</button>

</div>

<script>
// Add active class to the current button (highlight it)
var header = document.getElementById("myDIV");
var btns = header.getElementsByClassName("btn");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function() {
    var current = document.getElementsByClassName("active");
    current[0].className = current[0].className.replace(" active", "");
    this.className += " active";
  });
}
</script>

</body>
</html>