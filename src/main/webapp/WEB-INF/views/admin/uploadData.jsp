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
<body>
	<div class="header">
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<!-- Logo -->
					<div class="logo">
						<h1>
							<a href="index.html">여행 블로그 관리</a>
						</h1>
					</div>
				</div>
				<div class="col-md-5">
					<div class="row">
						<div class="col-lg-12">
							<div class="input-group form">
								<input type="text" class="form-control" placeholder="Search...">
								<span class="input-group-btn">
									<button class="btn btn-primary" type="button">Search</button>
								</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="navbar navbar-inverse" role="banner">
						<nav
							class="collapse navbar-collapse bs-navbar-collapse navbar-right"
							role="navigation">
							<ul class="nav navbar-nav">
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown">My Account <b class="caret"></b></a>
									<ul class="dropdown-menu animated fadeInUp">
										<li><a href="profile.html">Profile</a></li>
										<li><a href="login.html">Logout</a></li>
									</ul></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="page-content">
		<div class="row">
			<div class="col-md-2">
				<div class="sidebar content-box" style="display: block;">
					<ul class="nav">
						<!-- Main menu -->
						<li><a href="index.html"> <i
								class="glyphicon glyphicon-home"></i> Home
						</a></li>
						<li class="current"><a href="/admin/uploadData"> <i
								class="glyphicon glyphicon-record"></i> Data Update
						</a></li>
						<li><a href="/admin/dataCheck"> <i
								class="glyphicon glyphicon-record"></i> Data Check
						</a></li>
					</ul>
				</div>
			</div>
			<div class="col-md-10">
				<div class="row">
					<div class="col-md-12 panel-warning">
						<div class="content-box-header panel-heading">
							<div class="panel-title ">장소 데이터 업로드</div>

							<div class="panel-options">
								<a href="#" data-rel="collapse"> <i
									class="glyphicon glyphicon-refresh"></i>
								</a> <a href="#" data-rel="reload"> <i
									class="glyphicon glyphicon-cog"></i>
								</a>
							</div>
						</div>
						<div class="content-box-large box-with-header" align="center">
							<div>
  <button type="submit" class="button">Click me</button>
</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer>
		<div class="container">
			<div class="copy text-center">
				Copyright 2017 <a href='#'>tour project</a>
			</div>
		</div>
	</footer>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://code.jquery.com/jquery.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/resources/js/admin/bootstrap/bootstrap.min.js"></script>
	<script src="/resources/js/admin/custom.js"></script>
</body>
</html>