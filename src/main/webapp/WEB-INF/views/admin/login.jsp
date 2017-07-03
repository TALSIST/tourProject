<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Admin Theme v3</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="/resources/css/admin/bootstrap/bootstrap.min.css" rel="stylesheet">
<!-- styles -->
<link href="/resources/css/admin/styles.css" rel="stylesheet">
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
</head>
<body class="login-bg">
	<div class="header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<!-- Logo -->
					<div class="logo">
						<h1>
							<a href="index.html">여행 블로그 관리</a>
						</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="page-content container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-wrapper">
					<div class="box">
						<div class="content-wrap">
							<h6>로그인</h6>
							<div class="social">
								<a class="face_login" href="#"> 
									<span class="face_icon">
										<img src="/resources/img/admin/facebook.png" alt="fb">
									</span> 
									<span class="text">페이스북 아이디로 로그인</span>
								</a>
								<div class="division">
									<hr class="left">
									<span>or</span>
									<hr class="right">
								</div>
							</div>
							<input class="form-control" type="text"
								placeholder="E-mail address"> <input
								class="form-control" type="password" placeholder="Password">
							<div class="action">
								<a class="btn btn-primary signup" href="index.html">로그인</a>
							</div>
						</div>
					</div>

					<div class="already">
						<p>계정이 없으신가요?</p>
						<a href="/admin/signup">회원가입</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://code.jquery.com/jquery.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/resources/js/admin/bootstrap/bootstrap.min.js"></script>
	<script src="/resources/js/admin/custom.js"></script>
</body>
</html>