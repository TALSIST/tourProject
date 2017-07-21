<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
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
<!-- jquery -->
<script src="https://code.jquery.com/jquery.js"></script>

<script>
	function all(){
		$.ajax({ //초기화
			type:"POST",
			url:"result",
			data:{
				"page" : "1"
			},
			success:function(response) {
				$('#result').html(response);
			}
		});
	}
		
	$(function() {
		all();
		
		$("#tagSearch").click(function(){
			$.ajax({
				type : "POST",
				url : "result",
				data : {
					"page" :"1",
					"countryName" : $("#tags").children('[type="country"]').attr("data")
				},
				success : function(response){
					$("#result").html(response);
				}
			});
		});
		
		//확장
		$("#down").click(function() {
			if ($('[name="hiddenTap"]').css("display") == "none") {
				$(this).text("접기");
				$('[name="hiddenTap"]').slideDown("slow");
			} else {
				$(this).text("더보기");
				$('[name="hiddenTap"]').slideUp("slow");
			}
		});
		//대륙클릭시 확장
		$('[name="continent"]').click(function(){
			var i = $(this).attr('value');
			$('[name="continent"]').css("color", "black");
			$(this).css("color", "#199EB8");
			$('[name="all"]').css("display", "none");
			$("#"+i).css("display","block");
		});
		//국가 클릭시 필터에 태그 추가
		$('[name="country"]').click(function(){
			var countryName=$(this).text();
			$("#tags").append("<div class='col-sm-2 col-md-2' name='hashtag' style='cursor: pointer' type='country' data='"+countryName+"'>"+countryName+" x</div>");
			if($("#tags").has("div")){
				$("#filter").css("display", "block");
			}
			$('[name="hiddenTap"]').css("display", "none");
			$('[name="recommandTab"]').css("display", "none");
		});		
	});
	//필터내 태그 클릭시 삭제
	$(document).on("click", '[name="hashtag"]', function(){
		var tagName=$(this).attr("data");
		$("#tags").children('[data=\"'+tagName+'\"]').remove();
		
		if($("#tags").children().size()==0){
			$("#filter").css("display", "none");
			$('[name="hiddenTap"]').css("display", "block");
			$('[name="recommandTab"]').css("display", "block");
			all();//다 삭제되면 다시 전체 보여주기
		}
	});
</script>
</head>

<body>

	<!-- Header -->
	<header id="header">
		<div class="container">

			<div id="logo" class="pull-left">
				<a href="/main1"><img src="/resources/img/logo-nav.png"
					alt="" title="" /></img></a>
				<!-- Uncomment below if you prefer to use a text image -->
				<!--<h1><a href="#hero">Bell</a></h1>-->
			</div>

			<nav id="nav-menu-container">
				<ul class="nav-menu">
					<li><a href="/main1">Home</a></li>
					<li><a href="/cityselect">여행일정만들기</a></li>
			<!-- 로그인관련 -->
         <c:if test="${sessionScope.email==null }">
             <li><a href="/login" data-toggle="modal" data-target="#id01">로그인/회원가입</a></li>
          </c:if>
          <c:if test="${sessionScope.email!=null }">
            <li class="menu-has-children">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.email }님이 로그인 하였습니다.<a href="#"></a>
            <ul>
             <li><a href="/mypage">여행일정</a></li>
              <li><a href="/logout">로그아웃</a></li>
              
              <!-- <li class="menu-has-children"><a href="#" >설정</a>
                <ul>
                  <li><a href="#">개인정보변경</a></li>
                  <li><a href="#">회원탈퇴요청</a></li>
               </ul>
              </li> -->
            </ul>
            </li>
       </c:if>

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
		<h2 style="font-size: 50px">여행지 상세</h2>
	</div>
	<!-- /Parallax -->

	<!-- bigdata -->
	<div class="container">
		<center>
		<h2>${country }</h2>
		<span>realtime search from youtube/naver/daum....</span>
		</center>
		<div class="col-lg-6 col-md-6 col-xs-6">
		<embed class="movie-image" src="${link}" width=600px height=450px/></div>
		<div class="col-lg-6 col-md-6 col-xs-6">
			<center>
				<img src="/resources/wordcloud.png">
			</center>
		</div>
		<div class="col-lg-12 col-md-12 col-xs-12">
		<center>
			<h3>방문자 체감 날씨</h3>
			<img src="/resources/barchart.png">
		</center>
		</div>
	</div>

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