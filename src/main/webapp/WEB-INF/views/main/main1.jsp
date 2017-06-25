<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<script>
</script>
  <head>
    <meta charset="utf-8">
    <title>Trip With Us WITHEARTH</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/resources/img/favicon.ico" rel="icon">
  
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Raleway:400,500,700|Roboto:400,900" rel="stylesheet">
    
    <!-- Bootstrap CSS File -->
    <link href="/resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  
    <!-- Libraries CSS Files -->
    <link href="/resources/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    
    <!-- Main Stylesheet File -->
    <link href="/resources/css/style1.css" rel="stylesheet">
    

  </head>

  <body>
    <!-- Page Content
    ================================================== -->

    <section class="hero">
      <div class="container text-center">
        <div class="row">
          <div class="col-md-12">
            <a class="hero-brand" href="index.html" title="Home"><img alt="Bell Logo" src="/resources/img/logo.png"></a>
          </div>
        </div>

        <div class="col-md-12">
          <h1 style="font-size:62px">
            	나만의 여행 플래너 위드어스!
          </h1>

          <p class="tagline">
            	쉽고 빠르게 여행을 계획하세요. 
          </p>
          <a class="btn btn-full" href="#about" style="background-color: #199EB8; font-weight: 800; padding: 15px 45px; border-radius: 50px">여행 일정 만들기</a>
        </div>
      </div>
      
    </section>
    <!-- /Hero -->
    
  <!-- Header -->
  <header id="header">
    <div class="container">
    
      <div id="logo" class="pull-left">
        <a href="index.html"><img src="/resources/img/logo-nav.png" alt="" title="" /></img></a>
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
                </ul>
              </li>
              <li><a href="#">로그아웃</a></li>
            </ul>
          </li>
        </ul>
      </nav><!-- #nav-menu-container -->
      
      <nav class="nav social-nav pull-right hidden-sm-down">
        <a data-toggle="modal" data-target="#login" >
        	<i class="fa fa-twitter" data-toggle="modal" data-target="login" ></i>
        </a>
         <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a> <a href="#"><i class="fa fa-envelope"></i></a>
      </nav>
      <div class="modal fade" id="login" role="dialog">
     	<jsp:include page="login.jsp"></jsp:include>      
      </div>
    </div>
  </header><!-- #header -->
  
  	<div class="container text-center">
  	<h2>인기 여행 일정</h2>
 	<p>다른 여행자들의 일정을 참고해 나만의 여행을 계획해보세요!</p>
  	

	<!-- content include -->
    <jsp:include  page="/WEB-INF/views/main/content.jsp"></jsp:include>
    <!-- /content include -->
   </div>
  
    <!-- About -->

    <section class="about" id="about">
      <div class="container text-center">
        <h2>
          	여행 일정 통계
        </h2>

        <p>
           	어디로 갈까? 전세계 1,000개 이상의 여행 일정을 확인하고 나만의 일정을 계획해 보세요. 
        </p>

        <div class="row stats-row">
          <div class="stats-col text-center col-md-3 col-sm-6">
            <div class="circle">
              <span class="stats-no" data-toggle="counter-up">232</span> 등록 <br>국가수
            </div>
          </div>

          <div class="stats-col text-center col-md-3 col-sm-6">
            <div class="circle">
              <span class="stats-no" data-toggle="counter-up">79</span> 인기있는 <br>여행지
            </div>
          </div>

          <div class="stats-col text-center col-md-3 col-sm-6">
            <div class="circle">
              <span class="stats-no" data-toggle="counter-up">1,463</span> 등록된 <br>여행일정
            </div>
          </div>

          <div class="stats-col text-center col-md-3 col-sm-6">
            <div class="circle">
              <span class="stats-no" data-toggle="counter-up">15</span> 500명 이상 <br>방문<br>인기 도시
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- /About -->
    

   
    <!-- Features -->

    <!-- <section class="features" id="features">
      <div class="container">
        <h2 class="text-center">
          Features
        </h2>

        <div class="row">
          <div class="feature-col col-lg-4 col-xs-12">
            <div class="card card-block text-center">
              <div>
                <div class="feature-icon">
                  <span class="fa fa-rocket"></span>
                </div>
              </div>

              <div>
                <h3>
                  Custom Design
                </h3>

                <p>
                  Eque feugiat contentiones ei has. Id summo mundi explicari his, nec in maiorum scriptorem.
                </p>
              </div>
            </div>
          </div>

          <div class="feature-col col-lg-4 col-xs-12">
            <div class="card card-block text-center">
              <div>
                <div class="feature-icon">
                  <span class="fa fa-envelope"></span>
                </div>
              </div>

              <div>
                <h3>
                  Responsive Layout
                </h3>

                <p>
                  Eque feugiat contentiones ei has. Id summo mundi explicari his, nec in maiorum scriptorem.
                </p>
              </div>
            </div>
          </div>

          <div class="feature-col col-lg-4 col-xs-12">
            <div class="card card-block text-center">
              <div>
                <div class="feature-icon">
                  <span class="fa fa-bell"></span>
                </div>
              </div>

              <div>
                <h3>
                  Innovative Ideas
                </h3>

                <p>
                  Eque feugiat contentiones ei has. Id summo mundi explicari his, nec in maiorum scriptorem.
                </p>
              </div>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="feature-col col-lg-4 col-xs-12">
            <div class="card card-block text-center">
              <div>
                <div class="feature-icon">
                  <span class="fa fa-database"></span>
                </div>
              </div>

              <div>
                <h3>
                  Good Documentation
                </h3>

                <p>
                  Eque feugiat contentiones ei has. Id summo mundi explicari his, nec in maiorum scriptorem.
                </p>
              </div>
            </div>
          </div>

          <div class="feature-col col-lg-4 col-xs-12">
            <div class="card card-block text-center">
              <div>
                <div class="feature-icon">
                  <span class="fa fa-cutlery"></span>
                </div>
              </div>

              <div>
                <h3>
                  Excellent Features
                </h3>

                <p>
                  Eque feugiat contentiones ei has. Id summo mundi explicari his, nec in maiorum scriptorem.
                </p>
              </div>
            </div>
          </div>

          <div class="feature-col col-lg-4 col-xs-12">
            <div class="card card-block text-center">
              <div>
                <div class="feature-icon">
                  <span class="fa fa-dashboard"></span>
                </div>
              </div>

              <div>
                <h3>
                  Retina Ready
                </h3>

                <p>
                  Eque feugiat contentiones ei has. Id summo mundi explicari his, nec in maiorum scriptorem.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    /Features
    Call to Action
    
    

    <section class="cta">
      <div class="container">
        <div class="row">
          <div class="col-lg-9 col-sm-12 text-lg-left text-center">
            <h2>
              Call to Action Section
            </h2>

            <p>
              Lorem ipsum dolor sit amet, nec ad nisl mandamus imperdiet, ut corpora cotidieque cum. Et brute iracundia his, est eu idque dictas gubergren
            </p>
          </div>

          <div class="col-lg-3 col-sm-12 text-lg-right text-center">
            <a class="btn btn-ghost" href="#">Buy This Theme</a>
          </div>
        </div>
      </div>
    </section>
    /Call to Action -->
    <!-- Portfolio -->

    <section class="portfolio" id="portfolio">
      <div class="container text-center">
        <h2>
          	인기도시 TOP8
        </h2>

      </div>

      <div class="portfolio-grid">
        <div class="row">
          <div class="col-lg-3 col-sm-6 col-xs-12">
            <div class="card card-block">
              <a href="#"><img alt="" src="/resources/img/porf-1.jpg">
              <div class="portfolio-over">
                <div>
                  <h3 class="card-title">
                    	런던
                  </h3>
                </div>
              </div></a>
            </div>
          </div>

          <div class="col-lg-3 col-sm-6 col-xs-12">
            <div class="card card-block">
              <a href="#"><img alt="" src="/resources/img/porf-2.jpg">
              <div class="portfolio-over">
                <div>
                  <h3 class="card-title">
                  	  파리
                  </h3>
                </div>
              </div></a>
            </div>
          </div>

          <div class="col-lg-3 col-sm-6 col-xs-12">
            <div class="card card-block">
              <a href="#"><img alt="" src="/resources/img/porf-3.jpg">
              <div class="portfolio-over">
                <div>
                  <h3 class="card-title">
                   	 바르셀로나
                  </h3>
                </div>
              </div></a>
            </div>
          </div>

          <div class="col-lg-3 col-sm-6 col-xs-12">
            <div class="card card-block">
              <a href="#"><img alt="" src="/resources/img/porf-4.jpg">
              <div class="portfolio-over">
                <div>
                  <h3 class="card-title">
                    	베네치아
                  </h3>
                </div>
              </div></a>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-lg-3 col-sm-6 col-xs-12">
            <div class="card card-block">
              <a href="#"><img alt="" src="/resources/img/porf-5.jpg">
              <div class="portfolio-over">
                <div>
                  <h3 class="card-title">
                    	타이페이
                  </h3>
                </div>
              </div></a>
            </div>
          </div>

          <div class="col-lg-3 col-sm-6 col-xs-12">
            <div class="card card-block">
              <a href="#"><img alt="" src="/resources/img/porf-6.jpg">
              <div class="portfolio-over">
                <div>
                  <h3 class="card-title">
                   	싱가포르
                  </h3>
                </div>
              </div></a>
            </div>
          </div>

          <div class="col-lg-3 col-sm-6 col-xs-12">
            <div class="card card-block">
              <a href="#"><img alt="" src="/resources/img/porf-7.jpg">
              <div class="portfolio-over">
                <div>
                  <h3 class="card-title">
                    	제주도
                  </h3>
                </div>
              </div></a>
            </div>
          </div>

          <div class="col-lg-3 col-sm-6 col-xs-12">
            <div class="card card-block">
              <a href="#"><img alt="" src="/resources/img/porf-8.jpg">
              <div class="portfolio-over">
                <div>
                  <h3 class="card-title">
                    	방콕
                  </h3>
                </div>
              </div></a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- /Portfolio -->
    

    <!-- Team -->

    <section class="team" id="team">
      <div class="container">
        <h2 class="text-center">
          Meet our team
        </h2>

        <div class="row">
          <div class="col-sm-3 col-xs-6">
            <div class="card card-block">
              <a href="#"><img alt="" class="team-img" src="/resources/img/team-1.jpg">
              <div class="card-title-wrap">
                <span class="card-title">이상운</span> <span class="card-text">Developer</span>
              </div>

              <div class="team-over">
                <h4 class="hidden-md-down">
                  Connect with me
                </h4>

                <nav class="social-nav">
                  <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a> <a href="#"><i class="fa fa-envelope"></i></a>
                </nav>

                <p>
                  Lorem ipsum dolor sit amet, eu sed suas eruditi honestatis.
                </p>
              </div></a>
            </div>
          </div>
          <div class="col-sm-3 col-xs-6">
            <div class="card card-block">
              <a href="#"><img alt="" class="team-img" src="/resources/img/team-1.jpg">
              <div class="card-title-wrap">
                <span class="card-title">유은희</span> <span class="card-text">Developer</span>
              </div>

              <div class="team-over">
                <h4 class="hidden-md-down">
                  Connect with me
                </h4>

                <nav class="social-nav">
                  <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a> <a href="#"><i class="fa fa-envelope"></i></a>
                </nav>

                <p>
                  Lorem ipsum dolor sit amet, eu sed suas eruditi honestatis.
                </p>
              </div></a>
            </div>
          </div>
          <div class="col-sm-3 col-xs-6">
            <div class="card card-block">
              <a href="#"><img alt="" class="team-img" src="/resources/img/team-1.jpg">
              <div class="card-title-wrap">
                <span class="card-title">최지민</span> <span class="card-text">Art Director</span>
              </div>

              <div class="team-over">
                <h4 class="hidden-md-down">
                  Connect with me
                </h4>

                <nav class="social-nav">
                  <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a> <a href="#"><i class="fa fa-envelope"></i></a>
                </nav>

                <p>
                  Lorem ipsum dolor sit amet, eu sed suas eruditi honestatis.
                </p>
              </div></a>
            </div>
          </div>

          <div class="col-sm-3 col-xs-6">
            <div class="card card-block">
              <a href="#"><img alt="" class="team-img" src="/resources/img/team-2.jpg">
              <div class="card-title-wrap">
                <span class="card-title">장현령</span> <span class="card-text">Developer</span>
              </div>

              <div class="team-over">
                <h4 class="hidden-md-down">
                  Connect with me
                </h4>

                <nav class="social-nav">
                  <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a> <a href="#"><i class="fa fa-envelope"></i></a>
                </nav>

                <p>
                  Lorem ipsum dolor sit amet, eu sed suas eruditi honestatis.
                </p>
              </div></a>
            </div>
          </div>

          <div class="col-sm-3 col-xs-6">
            <div class="card card-block">
              <a href="#"><img alt="" class="team-img" src="/resources/img/team-3.jpg">
              <div class="card-title-wrap">
                <span class="card-title">한예지</span> <span class="card-text">Developer</span>
              </div>

              <div class="team-over">
                <h4 class="hidden-md-down">
                  Connect with me
                </h4>

                <nav class="social-nav">
                  <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a> <a href="#"><i class="fa fa-envelope"></i></a>
                </nav>

                <p>
                  Lorem ipsum dolor sit amet, eu sed suas eruditi honestatis.
                </p>
              </div></a>
            </div>
          </div>
          <div class="col-sm-3 col-xs-6">
            <div class="card card-block">
              <a href="#"><img alt="" class="team-img" src="/resources/img/team-3.jpg">
              <div class="card-title-wrap">
                <span class="card-title">김민정</span> <span class="card-text">Developer</span>
              </div>

              <div class="team-over">
                <h4 class="hidden-md-down">
                  Connect with me
                </h4>

                <nav class="social-nav">
                  <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a> <a href="#"><i class="fa fa-envelope"></i></a>
                </nav>

                <p>
                  Lorem ipsum dolor sit amet, eu sed suas eruditi honestatis.
                </p>
              </div></a>
            </div>
          </div>

          <div class="col-sm-3 col-xs-6">
            <div class="card card-block">
              <a href="#"><img alt="" class="team-img" src="/resources/img/team-4.jpg">
              <div class="card-title-wrap">
                <span class="card-title">이아영</span> <span class="card-text">Developer</span>
              </div>

              <div class="team-over">
                <h4 class="hidden-md-down">
                  Connect with me
                </h4>

                <nav class="social-nav">
                  <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a> <a href="#"><i class="fa fa-envelope"></i></a>
                </nav>

                <p>
                  Lorem ipsum dolor sit amet, eu sed suas eruditi honestatis.
                </p>
              </div></a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- /Team -->
    <!-- @component: footer -->

     
      
    <footer class="site-footer">
      <div class="bottom">
        <div class="container">
          <div class="row">

            <div class="col-lg-6 col-xs-12 text-lg-left text-center">
              <p class="copyright-text">
                © WITHEARTH
              </p>
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
                <li class="list-inline-item">
                  <a href="index.html">Home</a>
                </li>

                <li class="list-inline-item">
                  <a href="#about">About Us</a>
                </li>

                <li class="list-inline-item">
                  <a href="#features">여행일정만들기</a>
                </li>

                <li class="list-inline-item">
                  <a href="#portfolio">준비중</a>
                </li>

                <li class="list-inline-item">
                  <a href="#team">준비중</a>
                </li>

                <li class="list-inline-item">
                  <a href="#contact">준비중</a>
                </li>
              </ul>
            </div>
            
          </div>
        </div>
      </div>
    </footer>
    <a class="scrolltop" href="#"><span class="fa fa-angle-up"></span></a> <!-- JavaScript


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