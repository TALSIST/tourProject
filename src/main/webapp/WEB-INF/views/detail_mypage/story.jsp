<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Simple Responsive Timeline</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css'>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="/resources/css/mypage/style.css">
  <link rel="stylesheet" href="/resources/css/mypage/story.css">
</head>
<body>
<script src="https://use.typekit.net/bkt6ydm.js"></script>
<script>try{Typekit.load({ async: true });}catch(e){}</script>

<div class="container-fluid">
    <div class="row example-split">
        <div class="col-md-12 example-title">
            <h2>스토리</h2>
            <p>여행에 대한 스토리를 적어보세요</p>
            <div class="btnhover">
		      <a href="#">스토리 작성</a>
		      <div class="backcolor"></div>
		    </div>
        </div>
        <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2">
            <ul class="timeline timeline-split">
                <li class="timeline-item">
                    <div class="timeline-info" style="text-align:left">
                        <span>day1</span>
                    </div>
                    <div class="timeline-marker"></div>
                    <div class="timeline-content" style="text-align:left">
                      <div class="w3-card-4 w3-margin w3-white">
   						<img src="/resources/img/mypage/osaca.jpg" alt="Nature" style="width:100%; height:300px">
                        <div class="w3-container" style="margin:20px">
					      <p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus nisl. Sed mattis nunc id lorem euismod placerat. Vivamus porttitor magna enim, ac accumsan tortor cursus at. Phasellus sed ultricies mi non congue ullam corper. Praesent tincidunt sed
					        tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
					      <div class="w3-row">
					        <div class="w3-col m8 s12" style="margin-bottom:10px">
					          <p><button class="w3-button w3-padding-large w3-white w3-border"><b>READ MORE »</b></button></p>
					        </div>
					        <div class="w3-col m4 w3-hide-small">
					          <p><span class="w3-padding-large w3-right"><b>Comments  </b> <span class="w3-tag">0</span></span></p>
					        </div>
					      </div>
					    </div>
					  </div>
                    </div>
                </li>
                <li class="timeline-item">
                    <div class="timeline-info" style="text-align:left">
                        <span>day2</span>
                    </div>
                    <div class="timeline-marker"></div>
                    <div class="timeline-content" style="text-align:left">
                        <h3 class="timeline-title">Event Title</h3>
                        <p>Nullam vel sem. Nullam vel sem. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Donec orci lectus, aliquam ut, faucibus non, euismod id, nulla. Donec vitae sapien ut libero venenatis faucibus. ullam dictum felis
                            eu pede mollis pretium. Pellentesque ut neque. </p>
                    </div>
                </li>
                <li class="timeline-item period">
                    <div class="timeline-info"></div>
                    <div class="timeline-marker"></div>
                    <div class="timeline-content" style="text-align:left">
                        <h2 class="timeline-title">April 2016</h2>
                    </div>
                </li>
                <li class="timeline-item">
                    <div class="timeline-info" style="text-align:left">
                        <span>day3</span>
                    </div>
                    <div class="timeline-marker"></div>
                    <div class="timeline-content" style="text-align:left">
                        <h3 class="timeline-title">Event Title</h3>
                        <p>Nullam vel sem. Nullam vel sem. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Donec orci lectus, aliquam ut, faucibus non, euismod id, nulla. Donec vitae sapien ut libero venenatis faucibus. ullam dictum felis
                            eu pede mollis pretium. Pellentesque ut neque. </p>
                    </div>
                </li>
                <li class="timeline-item">
                    <div class="timeline-info" style="text-align:left">
                        <span>day4</span>
                    </div>
                    <div class="timeline-marker"></div>
                    <div class="timeline-content" style="text-align:left">
                        <h3 class="timeline-title">Event Title</h3>
                        <p>Nullam vel sem. Nullam vel sem. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Donec orci lectus, aliquam ut, faucibus non, euismod id, nulla. Donec vitae sapien ut libero venenatis faucibus. ullam dictum felis
                            eu pede mollis pretium. Pellentesque ut neque. </p>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
