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
<style>
#fileUploadDiv{
width:30%; height:150px; margin:10px; border:1px solid; border-color:#BDBDBD; float:left; border-radius: 4px;
}
#uploadedImg{
height:80%;
}
#fileDelBtnDiv{
border:1px dotted; border-color:#BDBDBD; width:10%; border-radius: 4px; float:right; margin:3px;
}
</style>
<script src=" http://code.jquery.com/jquery-latest.min.js "></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<div class="col-md-12 example-title">
		<h2>스토리 작성</h2>
	</div>
	<div class="col-md-12">
		<div class="panel z-depth-1">
			<div class="panel-content">

				<form action="/story/create" method="post">
				<input type="hidden" name="tour_id" value="${tour_id }">
				
				<div class="row">

					<div class="col-xs-12 col-sm-7 col-md-7" style="margin: auto;">

						<select class="form-control boxed-input" id="tourDate" onChange="itemChange(${tour_id })" style="width: 200px; margin-bottom: 10px">
							<!-- 여행날짜 선택 (선택하지 않으면 선택하라는 경고창)-->
							<option>-- 여행 날짜 선택</option>
							<c:set var="i" value="0"/>
							<c:forEach var="schedulePlan" items="${schedulePlans }">
								<option value="${schedulePlan.tour_date }">day${i = i + 1 } (${schedulePlan.tour_date })</option>
							</c:forEach>
						</select>
						
						<select class="form-control boxed-input" id="tourPlace" style="width: 200px; margin-bottom: 30px">
							<option>-- 장소 선택</option>
						</select>

						<div class="form-group" style="margin-bottom: 30px">
							<div>
								<input type="text" class="form-control boxed-input"
									id="inputBanco" placeholder="제목">
							</div>
						</div>

						<textarea class="form-control boxed-input" rows="3"
							id="inputDescricao" placeholder="여행 내용"
							style="margin-bottom: 30px"></textarea>

						<div id="wrapper" style="display:table; width: 100%; height: 200px; margin-bottom: 30px;border: 1px dotted; border-radius: 4px; background:#F6F6F6">
							<div id="dropImages" style="display:table-cell; vertical-align:middle">
								첨부할 이미지를 여기에 드래그하세요
							</div>
						</div>
						
						<div id="fileContainer">
							
						</div>

						<div class="col-md-12" style="text-align: right; margin-bottom: 30px;">
							<button class="btn btn-secundary" type="button" style="margin-right: 5px;">취소</button>
							<button class="btn btn-primary" type="submit" style="border-color:#199EB8;">스토리 등록</button>
						</div>
						
					</div>
				</div>
				
				</form>
				<!-- .row -->
			</div>
		</div>
	</div>
	<script src="/resources/js/mypage/upload.js"></script>
	<script id="template" type="text/x-handlebars-template">
		<div id="fileUploadDiv">
			<div id="uploadedImg"><img src="{{imgsrc}}"></div>
			<div id="fileDelBtnDiv"><a data-src="{{fullName}}" style="color:#BDBDBD">X</a></div>
		</div>	
	</script>
	<script>
		function itemChange(tour_id){
			var selectedDate = $("#tourDate option:selected").val();
			$("#tourPlace").empty();
			
			$.getJSON("/story/getPlace/"+tour_id+"/"+selectedDate, function(data){
				var option = "";
				option += "<option>-- 장소 선택</option>";
	
				$(data).each(function(){
					option += "<option value='"+this.detail_schedule_id+"'>"+this.name+"</option>"
				});
				
				$("#tourPlace").append(option);
			});
		}
	
		var template = Handlebars.compile($("#template").html());
		
		$("#dropImages").on("dragenter dragover", function(event){
			event.preventDefault();
		});
		
		$("#dropImages").on("drop", function(event){
			event.preventDefault();
			
			var files = event.originalEvent.dataTransfer.files;
			var file = files[0];
			var formData = new FormData();
			formData.append("file", file);
			
			$.ajax({
				url:'/story/uploadImages',
				data:formData,
				dataType:'text',
				processData:false,
				contentType:false,
				type:'POST',
				success:function(data){
					if(data == null){
						alert("이미지만 첨부할 수 있어요");
					}else{
						var fileInfo = getFileInfo(data);
						var html = template(fileInfo);
						
						$("#fileContainer").append(html);
					}
					
				}
			});
		});
		
		$("#fileContainer").on("click", "a", function(event){
			var that = $(this);
			
			$.ajax({
				url:"/story/deleteImages",
				type:"post",
				data:{fileName:$(this).attr("data-src")},
				dataType:'text',
				success:function(result){
					if(result == 'deleted'){
						that.parent("div").parent("div").remove();
					}
				}
			});
		})
	</script>
</body>
</html>