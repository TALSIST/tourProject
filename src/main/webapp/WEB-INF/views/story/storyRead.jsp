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

<c:set var="size" value="${story.storyImageList.size()}"/>
<c:forEach var="i" begin="1" end="${size}">
	input#img-${i}:checked ~ .nav-dots label#img-dot-${i},
</c:forEach>
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
						<form id="form1" action="/story/delete" method="post">
							<input type="hidden" name="tour_id" value="${tour_id }">
							<input type="hidden" name="story_id" value="${story.story_id }">
						</form>

						<input type="text" class="form-control boxed-input" style="margin-bottom: 10px; width: 30%" value="${dayAndDate }" readonly>
						<input type="text" class="form-control boxed-input" style="margin-bottom: 30px; width: 30%" value="${placeName }" readonly>
							
						<div class="form-group" style="margin-bottom: 30px">
							<div>
								<input type="text" class="form-control boxed-input" value="${story.title }" readonly>
							</div>
						</div>

						<!-- image -->
						<c:if test="${story.storyImageList.size() != 0 }">
   						<ul class="slides" style="margin-bottom:30px">
   							<c:set var="i" value="0"/>
   							<c:forEach var="storyImage" items="${story.storyImageList }" varStatus="status" >
							<input type="radio" name="radio-btn" id="img-${i=i+1}" checked />
							<li class="slide-container">
								<div class="slide">
									<img src="/resources/upload${storyImage.image }" data-src="${storyImage.image }"/>
								</div>
								<div class="nav">
									<c:if test="${i == 1 }">
										<label for="img-${size }" class="prev">&#x2039;</label> 
									</c:if>
									<c:if test="${i != 1 }">
										<label for="img-${i-1 }" class="prev">&#x2039;</label> 
									</c:if>
									<c:if test="${i == size }">
										<label for="img-1" class="next">&#x203a;</label>
									</c:if>
									<c:if test="${i != size }">
										<label for="img-${i+1 }" class="next">&#x203a;</label>
									</c:if>
								</div>
							</li>
							</c:forEach>

							<li class="nav-dots">
								<c:forEach var="storyImage" items="${story.storyImageList }" varStatus="status" >
									<label for="img-${status.count }" class="nav-dot" id="img-dot-${status.count }"></label>
								</c:forEach>
							</li>
						</ul>
						</c:if>
						<!-- /.image -->

						<textarea class="form-control boxed-input" rows="3"
							style="margin-bottom: 30px; height:300px" readonly>${story.content }</textarea>

						<div class="col-md-12"
							style="text-align: right; margin-bottom: 30px;">
							<button class="btn btn-primary" id="goUpdate" type="button">수정</button>
							<button class="btn btn-secundary" id="goDelete" type="button" style="margin-right: 5px;" onclick="deleteStory()">삭제</button>
							<button class="btn btn-default" id="goList" type="button">전체 스토리 보기</button>
						</div>

					</div>
				</div>
				<!-- .row -->
			</div>
		</div>
	</div>
	<script>
		$("#goList").on("click", function(){
			location.href="/story?tour_id=${tour_id}";
		});
		
		$("#goUpdate").on("click", function(){
			location.href="/story/update?tour_id=${tour_id}&story_id=${story.story_id}";
		});
		
		function deleteStory(){
			var arr = [];
			$(".slide img").each(function(index){
				arr.push($(this).attr("data-src")); 
			});
			//모든 첨부파일을 배열에 저장
			
			if(arr.length > 0){
				$.post("/deleteAllFiles", {files:arr}, function(){
					
				});
			}
			
			$("#form1").submit();
		}
	</script>
</body>
</html>