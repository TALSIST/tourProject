<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Simple Responsive Timeline</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet prefetch'
	href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css'>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/resources/css/mypage/style.css">
<link rel="stylesheet" href="/resources/css/mypage/story.css">
<style>
header { 
  padding: .5vw;
  font-size: 0;
  display: -ms-flexbox;
  -ms-flex-wrap: wrap;
  -ms-flex-direction: column;
  -webkit-flex-flow: row wrap; 
  flex-flow: row wrap; 
  display: -webkit-box;
  display: flex;
}
header div { 
  -webkit-box-flex: auto;
  -ms-flex: auto;
  flex: auto; 
  width: 200px; 
  margin: .5vw; 
}
header div img { 
  width: 100%; 
  height: auto; 
}
@media screen and (max-width: 400px) {
  header div { margin: 0; }
  header { padding: 0; }
  
}
</style>
</head>
<body>

	<div class="container-fluid">
		<div class="row example-split">
			<div class="col-md-12 example-title">
				<h2>스토리</h2>
				<p>여행에 대한 스토리를 적어보세요</p>
				<div class="btnhover">
					<a href="story/create?tour_id=${tour_id }">스토리 작성</a>
					<div class="backcolor"></div>
				</div>
			</div>
			<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2">
				<ul class="timeline timeline-split">
					<c:set var="i" value="0" />
					<c:forEach var="schedulePlan" items="${schedulePlans }">
						<li class="timeline-item">
							<div class="timeline-info" style="text-align: right">
								<span style="text-align: right">day ${i = i + 1 }</span><br>
								<span>${schedulePlan.tour_date }</span>
							</div>
							<div class="timeline-marker"></div>
							<div class="timeline-content" style="text-align: left">
								<div class="w3-card-4 w3-margin w3-white">
									<!-- image -->
									<header>
										<div>
											<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/4273/jeremiah-wilson-1.jpg" alt>
										</div>
									</header>
									<!-- /.image -->
									<div class="w3-container" style="margin: 20px">
										<span class="w3-tag" style="margin-bottom: 10px">2017-07-04</span>
										<p>Mauris neque quam, fermentum ut nisl vitae, convallis
											maximus nisl. Sed mattis nunc id lorem euismod placerat.
											Vivamus porttitor magna enim, ac accumsan tortor cursus at.
											Phasellus sed ultricies mi non congue ullam corper. Praesent
											tincidunt sed tellus ut rutrum. Sed vitae justo condimentum,
											porta lectus vitae, ultricies congue gravida diam non
											fringilla.</p>
										<div class="w3-row">
											<div class="w3-col m8 s12" style="margin-bottom: 10px;width:60%">
												<p>
													<a class="w3-button w3-padding-large w3-white w3-border" href="story/read?tour_id=${tour_id }">
														<b>READ MORE »</b>
													</a>
												</p>
											</div>
											<div class="w3-col m4 w3-hide-small" style="width:40%">
												<p>
													<span class="w3-padding-large w3-right">
														<b>Comments</b>
														<span class="w3-tag">0</span>
													</span>
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</li>
					</c:forEach>
					<!--
	                <li class="timeline-item period">
	                    <div class="timeline-info"></div>
	                    <div class="timeline-marker"></div>
	                    <div class="timeline-content" style="text-align:left">
	                        <h2 class="timeline-title">April 2016</h2>
	                    </div>
	                </li>
	                -->
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
