<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
border:1px dotted; border-color:#BDBDBD; width:10%; border-radius: 4px; float:right; margin:3px
}
</style>
</head>
<body>
	<div class="col-md-12 example-title">
		<h2>스토리 수정</h2>
	</div>
	<div class="col-md-12">
		<div class="panel z-depth-1">
			<div class="panel-content">

				<div class="row">

					<div class="col-xs-12 col-sm-7 col-md-7" style="margin: auto;">

						<select class="form-control boxed-input" id="inputGrupoDeProduto"
							style="width: 200px; margin-bottom: 10px">
							<option selected>day1 (2017-07-04)</option>
							<option>day2 (2017-07-05)</option>
							<option>day3 (2017-07-06)</option>
						</select>
						
						<select class="form-control boxed-input" id="inputGrupoDeProduto"
							style="width: 200px; margin-bottom: 30px">
							<option selected>에버랜드</option>
							<option>광화문</option>
							<option>남산타워</option>
						</select>

						<div class="form-group" style="margin-bottom: 30px">
							<div>
								<input type="text" class="form-control boxed-input"
									id="inputBanco" value="제목">
							</div>
						</div>

						<textarea class="form-control boxed-input" rows="3"
							id="inputDescricao"
							style="margin-bottom: 30px">여행 내용</textarea>

						<div id="wrapper" style="display:table; width: 100%; height: 200px; margin-bottom: 30px;border: 1px dotted; border-radius: 4px; background:#F6F6F6">
							<div style="display:table-cell; vertical-align:middle">
								첨부할 이미지를 여기에 드래그하세요
							</div>
						</div>
						
						<div id="fileContainer">
							<div id="fileUploadDiv">
								<div id="uploadedImg"></div>
								<div id="fileDelBtnDiv"><a style="color:#BDBDBD">X</a></div>
							</div>
						</div>

						<div class="col-md-12" style="text-align: right; margin-bottom: 30px;">
							<button class="btn btn-primary" type="submit" style="border-color:#199EB8;">수정</button>
							<button class="btn btn-secundary" type="submit" name="action" style="margin-right: 5px;">취소</button>
						</div>
						
					</div>
				</div>
				<!-- .row -->
			</div>
		</div>
	</div>
</body>
</html>