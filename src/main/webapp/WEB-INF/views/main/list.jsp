<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Trip With Us WITHEARTH</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="/resources/img/favicon.ico" rel="icon">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Raleway:400,500,700|Roboto:400,900"
	rel="stylesheet">
<!-- Bootstrap CSS File -->
<link href="/resources/lib/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Libraries CSS Files -->
<link href="/resources/lib/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Main Stylesheet File -->
<link href="/resources/css/style1.css" rel="stylesheet">
<!-- 삽입시킨 css -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">


<script src="http://code.jquery.com/jquery.js"></script>
<script>
	$(function() {
		$.ajax({
			type : "POST",
			url : "result.do",
			data : {
				"page" : "1"
			},
			success : function(response) {
				$('#result').html(response);
			}
		});

		$("#down").click(function() {
			if ($("#filter").css("display") == "none") {
				$("#filter").css("display", "block");
				$("#tab").css("display", "block");
			} else {
				$("#filter").css("display", "none");
				$("#tab").css("display", "none");
			}
		});
	});
</script>
</head>

<body>


	<!-- Header -->
	<header id="header">
		<div class="container">

			<div id="logo" class="pull-left">
				<a href="index.html"><img src="/resources/img/logo-nav.png"
					alt="" title="" /></img></a>
				<!-- Uncomment below if you prefer to use a text image -->
				<!--<h1><a href="#hero">Bell</a></h1>-->
			</div>

			<nav id="nav-menu-container">
				<ul class="nav-menu">
					<li><a href="/main1">Home</a></li>
					<li><a href="#features">여행일정만들기</a></li>
					<li><a href="#portfolio">준비중</a></li>
					<li><a href="#team">준비중</a></li>
					<li class="menu-has-children"><a href="">마이페이지</a>
						<ul>
							<li><a href="#">클립보드</a></li>
							<li><a href="/mypage">여행일정</a></li>
							<li><a href="#">Q&A</a></li>
							<li class="menu-has-children"><a href="#">설정</a>
								<ul>
									<li><a href="#">개인정보변경</a></li>
									<li><a href="#">회원탈퇴요청</a></li>
								</ul></li>
							<li><a href="#">로그아웃</a></li>
						</ul></li>
				</ul>
			</nav>
			<!-- #nav-menu-container -->

			<nav class="nav social-nav pull-right hidden-sm-down">
				<a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i
					class="fa fa-facebook"></i></a> <a href="#"><i
					class="fa fa-linkedin"></i></a> <a href="#"><i
					class="fa fa-envelope"></i></a>
			</nav>
		</div>
	</header>
	<!-- #header -->

	<!-- Parallax -->

	<div class="block bg-primary block-pd-lg block-bg-overlay text-center"
		data-bg-img="/resources/img/cover_mypage.jpg"
		data-settings='{"stellar-background-ratio": 0.6}'
		data-toggle="parallax-bg">
		<h2 style="font-size: 50px">여행일정</h2>

		<!-- <img alt="Bell - A perfect theme" class="gadgets-img hidden-md-down" src="/resources/img/gadgets.png"> -->
	</div>
	<!-- /Parallax -->

	<!-- 검색창 -->
	<div class="container">
		<h2>일정 검색</h2>
		<ul class="list-group">
			<!-- 필터 -->
			<li class="list-group-item" style="display: none" id="filter">
				<div class="row">
					<div class="col-md-3 col-sm-2">필터</div>
					<div class="col-md-9 col-sm-10">검색결과</div>
				</div>
			</li>
			<!-- 검색기본 -->
			<li class="list-group-item">
				<div class="row">
					<div class="col-md-2 col-sm-2" style="font-weight: bold">여행지</div>
					<div class="col-md-1 col-sm-1">국내</div>
					<div class="col-md-1 col-sm-1">일본</div>
					<div class="col-md-1 col-sm-1">홍콩</div>
					<div class="col-md-1 col-sm-1">태국</div>
					<div class="col-md-1 col-sm-1">미국</div>
					<div class="col-md-1 col-sm-1">대만</div>
					<div class="col-md-2 col-sm-2">프랑스</div>
					<div class="col-md-2 col-sm-2" id="down" style="cursor: pointer">▼</div>
				</div>
			</li>
			<!-- 탭 -->
			<li class="list-group-item" id=tab style="display:none">
				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#home">아시아</a></li>
					<li><a data-toggle="tab" href="#menu1">유럽</a></li>
					<li><a data-toggle="tab" href="#menu2">남태평양</a></li>
					<li><a data-toggle="tab" href="#menu3">북미</a></li>
					<li><a data-toggle="tab" href="#menu3">중남미</a></li>
				</ul>

				<div class="tab-content">
					<div id="home" class="tab-pane fade in active">
					<div class="col-md-2 col-sm-2">일본</div>
					<div class="col-md-2 col-sm-2">마카오</div>
					<div class="col-md-2 col-sm-2">말레이시아</div>
					<div class="col-md-2 col-sm-2">베트남</div>
					<div class="col-md-2 col-sm-2">싱카포르</div>
					<div class="col-md-2 col-sm-2">인도</div>
					<div class="col-md-2 col-sm-2">중국</div>
					<div class="col-md-2 col-sm-2">캄보디아</div>
					</div>
					<div id="menu1" class="tab-pane fade">
					<div class="col-md-1 col-sm-1">국내</div>
					<div class="col-md-1 col-sm-1">일본</div>
					<div class="col-md-1 col-sm-1">홍콩</div>
					<div class="col-md-1 col-sm-1">태국</div>
					<div class="col-md-1 col-sm-1">미국</div>
					<div class="col-md-1 col-sm-1">대만</div>
					<div class="col-md-2 col-sm-2">프랑스</div>
					</div>
					<div id="menu2" class="tab-pane fade">
					<div class="col-md-1 col-sm-1">유럽</div>
					<div class="col-md-1 col-sm-1">일본</div>
					<div class="col-md-1 col-sm-1">홍콩</div>
					<div class="col-md-1 col-sm-1">태국</div>
					<div class="col-md-1 col-sm-1">미국</div>
					<div class="col-md-1 col-sm-1">대만</div>
					<div class="col-md-2 col-sm-2">프랑스</div>
					</div>
					<div id="menu3" class="tab-pane fade">
					<div class="col-md-1 col-sm-1">중남미닷</div>
					<div class="col-md-1 col-sm-1">일본</div>
					<div class="col-md-1 col-sm-1">홍콩</div>
					<div class="col-md-1 col-sm-1">태국</div>
					<div class="col-md-1 col-sm-1">미국</div>
					<div class="col-md-1 col-sm-1">대만</div>
					<div class="col-md-2 col-sm-2">프랑스</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-1 col-sm-1">아시아</div>
				</div>
			</li>
			<li class="list-group-item">
				<div class="row"></div>
			</li>
		</ul>
	</div>

	<!-- result들어갈 자리 -->
	<div id=result></div>

	<!-- @component: footer -->



	<footer class="site-footer">
		<div class="bottom">
			<div class="container">
				<div class="row">

					<div class="col-lg-6 col-xs-12 text-lg-left text-center">
						<p class="copyright-text">© WITHEARTH</p>
						<div class="credits">
							<!-- 
                  All the links in the footer should remain intact. 
                  You can delete the links only if you purchased the pro version.
                  Licensing information: https://bootstrapmade.com/license/
                  Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Bell
                -->
							<a href="https://www.earthtory.com/">Earthtory</a> by 참고사이트
						</div>
					</div>

					<div class="col-lg-6 col-xs-12 text-lg-right text-center">
						<ul class="list-inline">
							<li class="list-inline-item"><a href="index.html">Home</a></li>

							<li class="list-inline-item"><a href="#about">About Us</a></li>

							<li class="list-inline-item"><a href="#features">여행일정만들기</a>
							</li>

							<li class="list-inline-item"><a href="#portfolio">준비중</a></li>

							<li class="list-inline-item"><a href="#team">준비중</a></li>

							<li class="list-inline-item"><a href="#contact">준비중</a></li>
						</ul>
					</div>

				</div>
			</div>
		</div>
	</footer>
	<a class="scrolltop" href="#"><span class="fa fa-angle-up"></span></a>
	<!-- JavaScript


    <!-- Required JavaScript Libraries -->
	<script src="/resources/lib/jquery/jquery.min.js"></script>
	<script src="/resources/lib/superfish/hoverIntent.js"></script>
	<script src="/resources/lib/superfish/superfish.min.js"></script>
	<script src="/resources/lib/tether/js/tether.min.js"></script>
	<script src="/resources/lib/stellar/stellar.min.js"></script>
	<script src="/resources/lib/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/lib/counterup/counterup.min.js"></script>
	<script src="/resources/lib/waypoints/waypoints.min.js"></script>
	<script src="/resources/lib/easing/easing.js"></script>
	<script src="/resources/lib/stickyjs/sticky.js"></script>
	<script src="/resources/lib/parallax/parallax.js"></script>
	<script src="/resources/lib/lockfixed/lockfixed.min.js"></script>

	<!-- Template Specisifc Custom Javascript File -->
	<script src="/resources/js/custom.js"></script>

</body>
</html>