<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
.pagination {
	display: inline-block;
}
.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
}
.pagination a#active {
	background-color: #199EB8;
	color: white;
	border: 1px solid #199EB8;
}
.pagination a:hover:not(.active ) {
	background-color: #ddd;
}
</style>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
$(function(){
	$('.pagenum').click(function(){
		var page=$(this).text();
		$.ajax({
			type:"POST",
			url:"result.do",
			data:{"page": page},
			success:function(response){
				$('#result').html(response);
			}
		});
	});
});
</script>
</head>
<body>
	<div class="container text-center">

		<h2>모든일정목록</h2>
		<p>다양한 사람들이 만든 일정을 확인하세요!</p>

		<!-- content include -->		
		<div class="container1">
        <!-- Page Features -->
        
        <div class="row text-center">
        
        <c:forEach var="vo" items="${list }">
            <div class="col-md-4 col-sm-6">
                <div class="thumbnail">
                    <img src="/resources/img/${vo.img }" alt="">
                    <div class="caption">
                        <h3>${vo.title }</h3>
                        <p>${vo.subTitle }</p>
                        <p>
                            <a href="${vo.tour_id }" class="btn btn-primary">찜하기</a> <a href="#" class="btn btn-default">자세히</a>
                        </p>
                    </div>
                </div>
            </div>
          </c:forEach>
          </div>
		<!-- /content include -->
	</div>
	
	
	<center>
	<div class="pagination">
	<c:if test="${startPage==1 }">
  	<a href="javascript:">&laquo;</a>
  	</c:if>
  	<c:if test="${startPage!=1 }">
  	<a href="/list?page=${startPage-1 }">&laquo;</a>
  	</c:if>
  	
  	<c:forEach var="i" begin="${startPage }" end="${endPage }">
  	<c:if test="${i==page }">
  	<a href="#" id="active" class=pagenum>${i }</a>
  	</c:if>
  	<c:if test="${i!=page }">
  	<a href="#" class=pagenum>${i }</a>
  	</c:if>
  	</c:forEach>
  	
  	<c:if test="${endPage==totalpage }">
  	<a href="javascript:">&raquo;</a>
  	</c:if>
  	<c:if test="${endPage!=totalpage }">
  	<a href="/list?page=${endPage+1 }">&raquo;</a>
  	</c:if>
	</div>
	</center>

	</div>
</body>
</html>