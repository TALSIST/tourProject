<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/mypage/story.css">
<link rel="stylesheet" href="/resources/css/mypage/style.css">
<link rel="stylesheet" href="/resources/css/mypage/image.css">

<style>
#wrapper {
	display: table;
	width: 100%;
	height: 200px;
	margin-bottom: 30px;
	border: 1px dotted;
	border-radius: 4px;
	background: #F6F6F6
}

#fileUploadDiv {
	width: 30%;
	height: 150px;
	margin: 10px;
	border: 1px solid;
	border-color: #BDBDBD;
	float: left;
	border-radius: 4px;
}

#uploadedImg {
	height: 100%;
}

#fileDelBtnDiv {
	border: 1px dotted;
	border-color: #BDBDBD;
	width: 10%;
	border-radius: 4px;
	float: right;
	margin: 3px
}

<c:forEach var="i" begin="1" end="6">
input#img-${i}:checked ~ .nav-dots label#img-dot-${i},
</c:forEach>{
	background: rgba(0, 0, 0, 0.8);
}
</style>
</head>
<body>
	<div class="col-md-12 example-title">
		<h2>스토리 확인</h2>
	</div>
	<div class="col-md-12">
		<div class="panel z-depth-1">
			<div class="panel-content">

				<div class="row">

					<div class="col-xs-12 col-sm-7 col-md-7" style="margin: auto;">

						<input type="text" class="form-control boxed-input" style="margin-bottom: 10px; width: 30%" value="day1 (2017-07-04)" readonly>
						<input type="text" class="form-control boxed-input" style="margin-bottom: 30px; width: 30%" value="에버랜드" readonly>
							
						<div class="form-group" style="margin-bottom: 30px">
							<div>
								<input type="text" class="form-control boxed-input" value="제목" readonly>
							</div>
						</div>

						<!-- image -->
   						<ul class="slides" style="margin-bottom:30px">
							<input type="radio" name="radio-btn" id="img-1" checked />
							<li class="slide-container">
								<div class="slide">
									<img src="http://farm9.staticflickr.com/8072/8346734966_f9cd7d0941_z.jpg" />
								</div>
								<div class="nav">
									<label for="img-6" class="prev">&#x2039;</label> 
									<label for="img-2" class="next">&#x203a;</label>
								</div>
							</li>

							<input type="radio" name="radio-btn" id="img-2" />
							<li class="slide-container">
								<div class="slide">
									<img src="http://farm9.staticflickr.com/8504/8365873811_d32571df3d_z.jpg" />
								</div>
								<div class="nav">
									<label for="img-1" class="prev">&#x2039;</label> 
									<label for="img-3" class="next">&#x203a;</label>
								</div>
							</li>

							<input type="radio" name="radio-btn" id="img-3" />
							<li class="slide-container">
								<div class="slide">
									<img src="http://farm9.staticflickr.com/8068/8250438572_d1a5917072_z.jpg" />
								</div>
								<div class="nav">
									<label for="img-2" class="prev">&#x2039;</label> 
									<label for="img-4" class="next">&#x203a;</label>
								</div>
							</li>

							<input type="radio" name="radio-btn" id="img-4" />
							<li class="slide-container">
								<div class="slide">
									<img src="http://farm9.staticflickr.com/8061/8237246833_54d8fa37f0_z.jpg" />
								</div>
								<div class="nav">
									<label for="img-3" class="prev">&#x2039;</label> 
									<label for="img-5" class="next">&#x203a;</label>
								</div>
							</li>

							<input type="radio" name="radio-btn" id="img-5" />
							<li class="slide-container">
								<div class="slide">
									<img src="http://farm9.staticflickr.com/8055/8098750623_66292a35c0_z.jpg" />
								</div>
								<div class="nav">
									<label for="img-4" class="prev">&#x2039;</label> 
									<label for="img-6" class="next">&#x203a;</label>
								</div>
							</li>

							<input type="radio" name="radio-btn" id="img-6" />
							<li class="slide-container">
								<div class="slide">
									<img src="http://farm9.staticflickr.com/8195/8098750703_797e102da2_z.jpg" />
								</div>
								<div class="nav">
									<label for="img-5" class="prev">&#x2039;</label> 
									<label for="img-1" class="next">&#x203a;</label>
								</div>
							</li>

							<li class="nav-dots">
								<label for="img-1" class="nav-dot" id="img-dot-1"></label> 
								<label for="img-2" class="nav-dot" id="img-dot-2"></label> 
								<label for="img-3" class="nav-dot" id="img-dot-3"></label> 
								<label for="img-4" class="nav-dot" id="img-dot-4"></label> 
								<label for="img-5" class="nav-dot" id="img-dot-5"></label> 
								<label for="img-6" class="nav-dot" id="img-dot-6"></label>
							</li>
						</ul>
						<!-- /.image -->

						<textarea class="form-control boxed-input" rows="3"
							style="margin-bottom: 30px" readonly>여행 내용</textarea>

						<div class="col-md-12"
							style="text-align: right; margin-bottom: 30px;">
							<button class="btn btn-primary" type="submit">수정</button>
							<button class="btn btn-secundary" type="submit" name="action" style="margin-right: 5px;">삭제</button>
							<button class="btn btn-default" type="submit">전체 스토리 보기</button>
						</div>

					</div>
				</div>
				<!-- .row -->
			</div>
		</div>
	</div>
</body>
</html>