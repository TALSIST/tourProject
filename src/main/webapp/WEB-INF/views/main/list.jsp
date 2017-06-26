<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style>
.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
}

.pagination a.active {
	background-color: #199EB8;
	color: white;
	border: 1px solid #199EB8;
}

.pagination a:hover:not(.active ) {
	background-color: #ddd;
}
</style>
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

	<div class="container text-center">

		<h2>모든일정목록</h2>
		<p>다양한 사람들이 만든 일정을 확인하세요!</p>

		<!-- content include -->
		<div class="container1">
        <!-- Page Features -->
        
        <div class="row text-center">
        
        <c:forEach var="vo" items="${list }">
            <div class="col-md-4 col-sm-6">
                <div class="thumbnail">
                    <img src="/resources/img/${vo.img }" alt="">
                    <div class="caption">
                        <h3>${vo.title }</h3>
                        <p>${vo.subTitle }</p>
                        <p>
                            <a href="${vo.tour_id }" class="btn btn-primary">찜하기</a> <a href="#" class="btn btn-default">자세히</a>
                        </p>
                    </div>
                </div>
            </div>
            </c:forEach>
		<!-- /content include -->
	</div>
	<center>
	<div class="pagination">
	<c:if test="${startPage==1 }">
  	<a href="javascript:">&laquo;</a>
  	</c:if>
  	<c:if test="${startPage!=1 }">
  	<a href="/list?page=${startPage-1 }">&laquo;</a>
  	</c:if>
  	
  	<c:forEach var="i" begin="${startPage }" end="${endPage }">
  	<c:if test="${i==page }">
  	<a href="/list?page=${i }" class="active">${i }</a>
  	</c:if>
  	<c:if test="${i!=page }">
  	<a href="/list?page=${i }">${i }</a>
  	</c:if>
  	</c:forEach>
  	
  	<c:if test="${endPage==totalpage }">
  	<a href="javascript:">&raquo;</a>
  	</c:if>
  	<c:if test="${endPage!=totalpage }">
  	<a href="/list?page=${endPage+1 }">&raquo;</a>
  	</c:if>
	</div>
	</center>



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