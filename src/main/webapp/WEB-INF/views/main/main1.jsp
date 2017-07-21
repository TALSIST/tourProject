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
    <link href="https://fonts.googleapis.com/css?family=Raleway:400,500,700|Roboto:400,900" rel="stylesheet">
    
    <!-- Bootstrap CSS File -->
    <link href="/resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  
    <!-- Libraries CSS Files -->
    <link href="/resources/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    
    <!-- Main Stylesheet File -->
    <link href="/resources/css/style1.css" rel="stylesheet">
    
    <!-- 삽입시킨 css -->
   <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
   
   <!-- login css -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
   <link rel="stylesheet" href="resources/css/login.css"> 
   
   <!-- realtime-chart 용 css -->
   <link href="/resources/css/realtime_chart.css" rel="stylesheet">
   
   <script src="http://code.jquery.com/jquery.js"></script>
   <script>
   function generateBarGraph(wrapper) {
	    // Set Up Values Array
	    var values = [];

	    // Get Values and save to Array
	    $(wrapper + ' .bar').each(function(index, el) {
	      values.push($(this).data('value'));
	    });

	    // Get Max Value From Array
	    var max_value = Math.max.apply(Math, values);

	    // Set width of bar to percent of max value
	    $(wrapper + ' .bar').each(function(index, el) {
	      var bar = $(this),
	          value = bar.data('value'),
	          percent = Math.ceil((value / max_value) * 100);

	      // Set Width & Add Class
	      bar.width(percent + '%');
	      bar.addClass('in');
	    });
	  }
   $(function(){
	   $(window).scroll(function(event){
			if ($(document).scrollTop() > 1900 && $(document).scrollTop()<1950) {
		        generateBarGraph('#dashboard-stats');
		    }
		});
   });
   
   </script>
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
          <a class="btn btn-full" href="/cityselect" style="background-color: #199EB8; font-weight: 800; padding: 15px 45px; border-radius: 50px">여행 일정 만들기</a>
        </div>
      </div>
      
    </section>
    <!-- /Hero -->
    
  <!-- Header -->
  <header id="header">
    <div class="container">
    
      <div id="logo" class="pull-left">
        <a href="#"><img src="/resources/img/logo-nav.png" alt="" title="" /></img></a>
        <!-- Uncomment below if you prefer to use a text image -->
        <!--<h1><a href="#hero">Bell</a></h1>-->
      </div>
        
      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li><a href="/main1">home</a></li>
          <li><a href="/cityselect">여행일정만들기</a></li>
          <li><a href="#">여행지추천서비스(준비중)</a></li>
          <li><a href="/mypage">MUST DO(준비중)</a></li>
          <li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </li>
          
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
      </nav><!-- #nav-menu-container -->
      
    <!--   <nav class="nav social-nav pull-right hidden-sm-down">
        <a data-toggle="modal" data-target="#id01"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a> <a href="#"><i class="fa fa-envelope"></i></a>
        
      </nav> -->
    </div>
  </header><!-- #header -->
  
  <div id="id01" class="modal fade" role="dialog">

  <div class="modal-dialog">
  <div class="modal-content">
        <div class="absolute-wrap-signup">
     <div class="signup-wrap hide">
       <form action="post" id="sign_form">
         <div class="row">
           <div class="col-12">
         <button type="button" class="close" data-dismiss="modal">&times;</button>
             <h1 class="hide-fade">Sign Up</h1>
           </div>
         </div>
         <div class="row">
           <div class="col-12">
             <div class="input-group hide-down">
               <input type="text" class="name" required/>
               <span class="valid-icon"></span>
               <label for="name">Name</label>
               <span class="bottom-border"></span>
             </div>
             <div class="input-group">
               <input type="email" class="check-email" required/>
               <span class="valid-icon"></span>
               <label for="email">Email</label>
               <span class="bottom-border"></span>
             </div>
             <div class="input-group">
               <input type="password" class="check-password" required/>
               <span class="valid-icon"></span>
               <label for="password">Password</label>
               <span class="bottom-border"></span>
             </div>
             <div class="input-group hide-up">
               <input type="password" class="check-equal" required/>
               <span class="valid-icon"></span>
               <label for="password">Verify Password</label>
               <span class="bottom-border"></span>
             </div>
           </div>
         </div>
         <div class="row login-footer">
           <div class="col-7">
             <a href="#" class="btn signup">Sign Up</a>
           </div>
           <div class="col-5">
             <a class="btn btn-pink hide-signup-btn" id="show-signup" href="#">Login</a>
           </div>
         </div>
       </form>
     </div>
     </div>
     </div>
   </div>
   
   <div class="login-wrap">
     <form action="post" id="login-form">
       <div class="row">
         <div class="col-12">
           <h1 class="hide-fade delay-6">Login</h1>
         </div>
       </div>
       <div class="row">
         <div class="col-12">
           <div class="input-group">
             <input type="email" class="check-email" required/>
             <span class="valid-icon"></span>
             <label for="email">Email</label>
             <span class="bottom-border"></span>
           </div>
           <div class="input-group">
             <input type="password" class="check-password" required/>
             <span class="valid-icon"></span>
             <label for="password">Password</label>
             <span class="bottom-border"></span>
           </div>
         </div>
       </div>
       <div class="row login-footer">
         <div class="col-7">
           <a href="#" class="btn login">Login</a>
         </div>
         <div class="col-5">
           <a class="btn btn-pink show-signup-btn" href="#">Sign Up</a>
         </div>
       </div>
       <div class="row login-footer">
         <div class="col-12 hide-fade delay-7">
           <a class="forgot" href="#">Forgot Password?</a>
         </div>
       </div>
     </form>
   </div>
  </div>
  
     <div class="container text-center">
     <h2>인기 여행 일정</h2>
    <p>다른 여행자들의 일정을 참고해 나만의 여행을 계획해보세요!</p>

   <!-- content include -->
   <!-- Page Content -->
    <div class="container1">
        <!-- Page Features -->

         <div class="row text-center">

            <c:forEach var="vo" items="${list }">
               <div class="col-md-4 col-sm-6">
                  <div class="thumbnail">
                     <img class="cool_img" src="/resources/img/${vo.img }" alt="">
                     <div class="caption">
                        <h3>${vo.title }</h3>
                        <p>${vo.subTitle }</p>
                        <p>
                           <a href="#" class="btn btn-primary">찜하기</a> 
                           <a href="#" class="btn btn-default">자세히</a>
                        </p>
                     </div>
                  </div>
               </div>
            </c:forEach>
            
            <!-- /content include -->
         </div>
         <div class="btn btn-full" onclick="location.href='/list?page=1'" style="font-color:white; background-color: #199EB8; font-weight: 800; padding: 15px 45px; border-radius: 50px; ">더보기</div>

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
    
    <!-- realtime chart -->
    <div class="container text-center" id="realtime_chart">
    <div class="chart-wrap">
	  <div class="chart-title" color="#199EB8">
	    인기 여행지 인기순위(실시간 트위터 언급횟수)
	  </div>
	  <div id="dashboard-stats" class="chart bars-horizontal brand-primary">
	    <c:forEach var="vo" items="${rList }" varStatus="s">
	    <c:if test="${s.index<10 }">
	    <div class="row-chart">
	      <span class="label-chart">${vo.title }</span>
	      <div class="bar-wrap-chart">
	        <div class="bar" data-value="${vo.count }"></div>
	      </div>
	      <span class="number">${vo.count }</span>
	    </div>
	    </c:if>
	    </c:forEach>
		</div>
	</div>
    </div>
    <br>
    <br>
    <!-- //realtime chart -->
    
    <!-- Portfolio -->
	<!-- 인기도시 rank -->
    <section class="portfolio" id="portfolio">
      <div class="container text-center">
        <h2>
             인기도시 TOP 24
        </h2>
        <span>by Tripadvisor</span>
      </div>

      <div class="portfolio-grid">
        <div class="row">
        
        <c:forEach var="vo" items="${rList }" varStatus="s">
        <c:if test="${s.index<24}">
          <div class="col-lg-3 col-sm-6 col-xs-12">
            <div class="card card-block">
              <a href="country_detail?country=${vo.title }"><img height="233px" src="${vo.img }">
              <div class="portfolio-over">
                <div>
                  <h3 class="card-title" style="align:center">
                       ${vo.rank }위 ${vo.title }
                  </h3>
                </div>
              </div></a>
            </div>
          </div>
          </c:if>
          </c:forEach>
        </div>
      </div>
    </section>
    <!-- /Portfolio --> 
    
    <!-- Urgent -->
    <div class="container">
    <h2 style="color:#199EB8">긴급 모객 패키지</h2>
    <li class="list-group-item">
    <div class="row">
    <div class="col-lg-7 col-sm-7 col-xs-7">패키지</div>
    <div class="col-lg-2 col-sm-2 col-xs-2">가격</div>
    <div class="col-lg-3 col-sm-3 col-xs-3">출발일/여행사</div>
    </div>
    </li>
    <c:forEach var="vo" items="${uList }">
    <li class="list-group-item">
    <div class="row">
    <div class="col-lg-1 col-sm-1 col-xs-1">
    	<a href="${vo.link }"><img src="${vo.img }" width="50"></a>
    </div>
    <div class="col-lg-6 col-sm-6 col-xs-6" align="left">
		<a href="${vo.link }">${vo.package_name }</a></div>
	<div class="col-lg-2 col-sm-2 col-xs-2">${vo.price }</div>
    <div class="col-lg-3 col-sm-3 col-xs-3">${vo.start_date }/${vo.site }</div>
    </div>
    </li>
    </c:forEach>
    </div>
    <br>
    <br>

    <!-- Team -->

   <!--  <section class="team" id="team">
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
    </section> -->
    <!-- /Team -->
    <!-- @component: footer -->

     
      
    <footer class="site-footer">
      <div class="bottom">
        <div class="container">
          <div class="row">

            <div class="col-lg-12 col-xs-12 text-lg-left text-center">
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
            
            <div class="col-lg-12 col-xs-12 text-lg-right text-center">
              <ul class="list-inline">
                <li class="list-inline-item">
                  <a href="/main1">Home</a>
                </li>
                <li class="list-inline-item">
                  <a href="/cityselect">여행일정만들기</a>
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
    
   
        <!-- login박스. -->
    <script src="resources/js/login.js"></script>
    
  </body>
</html>