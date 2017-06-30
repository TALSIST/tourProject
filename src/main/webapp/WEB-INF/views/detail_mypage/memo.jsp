<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
@import
	url(https://fonts.googleapis.com/css?family=Open+Sans:400,800,700,600,300)
	;

body {
	margin: 0;
	font-family: 'Open Sans', sans-serif;
	background: #eee;
	font-size: 16px;
	line-height: 1;
}

p {
	margin: 0;
	padding: 0;
	line-height: 1.5;
}

h3 {
	margin: 0;
	padding: 0;
	font-size: 140%;
	font-weight: normal;
	line-height: 1.5;
}

.postit1, .postit2, .postit3, .postit4 {
	position: relative;
	padding: 25px;
	display: inline-block;
	-webkit-box-shadow: 0 8px 10px -7px #999;
	-moz-box-shadow: 0 8px 10px -7px #999;
	box-shadow: 0 8px 10px -7px #999;
	-webkit-border-bottom-right-radius: 60px 10px;
	-moz-border-radius-bottomright: 60px 10px;
	border-bottom-right-radius: 60px 10px;
	margin: 20px 0 20px 20px;
}

.postit1 h3, .postit2 h3, .postit3 h3, .postit4 h3 {
	border-top-width: 2px;
	border-top-style: dotted;
	margin: 0 -25px;
	padding: 15px 25px 0 25px;
}

.postit1 {
	background: #fefabc;
}

.postit1 h3 {
	border-top-color: #dbd581;
}

.postit2 {
	background: #FDD7DB;
}

.postit2 h3 {
	border-top-color: #E6A1A8;
}

.postit3 {
	background: #EAF763;
}

.postit3 h3 {
	border-top-color: #72A201;
}

.postit4 {
	background: #B9EAF6;
}

.postit4 h3 {
	border-top-color: #6DB4C4;
}
</style>
</head>
<body>
	<div class="btn-wrapper">
		<button type="button" class="btn" style="margin:20px">메모 작성</button>
	</div>
	<div class="postit1">
		<h3>Shopping list</h3>
		<p>
			tomato<br> carrot<br> egg<br> cheese<br>
		</p>
	</div>
	<div class="postit2">
		<h3>Class schedule</h3>
		<p>
			Mathematics<br> Chemistry<br> English<br> Politics and
			Economics<br> Health & Physical Education<br>
		</p>
	</div>
	<div class="postit3">
		<h3>List of cat breeds</h3>
		<p>
			Abyssinian<br> American Shorthair<br> Cornish Rex<br>
			Egyptian Mau<br> Japanese Bobtail<br>
		</p>
	</div>
	<div class="postit4">
		<h3>ToDo list</h3>
		<p>
			Buy birthday gift for Aki<br> Trip to Fukuoka<br> Clean
			bedroom<br> Read more books<br> Play the piano<br>
			learn more English!
		</p>
	</div>
	<div class="postit4">
		<h3>ToDo list</h3>
		<p>
			Buy birthday gift for Aki<br> Trip to Fukuoka<br> Clean
			bedroom<br> Read more books<br> Play the piano<br>
			learn more English!
		</p>
	</div>
	<div class="postit4">
		<h3>ToDo list</h3>
		<p>
			Buy birthday gift for Aki<br> Trip to Fukuoka<br> Clean
			bedroom<br> Read more books<br> Play the piano<br>
			learn more English!
		</p>
	</div>

</body>
</html>