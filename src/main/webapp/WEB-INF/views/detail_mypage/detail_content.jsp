<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/resources/css/owl.carousel2.css" rel="stylesheet">
<link href="/resources/css/plan_sub.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
<div style="height:50px"></div>
<div class="plan_page" style="width:1120px;" >
	<div class="plan_cover">
		<div class="cover_img" style="background:url('http://www.lgblog.co.kr/wp-content/uploads/2015/08/%EA%B2%BD%EB%B3%B5%EA%B6%81_624.jpg')
			no-repeat;background-size:cover;background-position:cetner;"></div>
	</div>
	<div class="plan_mnu_box" style="width:1110px;">
		<a href="gaeyo2?tour_id=${list[1].tour_id }"><div class="plan_mnu on">개요</div></a>
		<div class="plan_mnu_line"></div>
		<a href="time_schedule?tour_id=44"><div class="plan_mnu on">일정표</div></a>
		<div class="plan_mnu_line"></div>
		<a href="story"><div class="plan_mnu on">스토리</div></a>
		<div class="plan_mnu_line"></div>
		<a href="memo"><div class="plan_mnu on">메모</div></a>
		<div class="plan_mnu_line"></div>
		<a href="map"><div class="plan_mnu on">지도</div></a>
		<div class="plan_mnu_line"></div>
		<div class="plan_mnu on">댓글</div>
	</div>
	

	
	<c:if test="${my_page_gubun == null}">
		<jsp:include page="gaeyo2.jsp"></jsp:include>
	</c:if>
	<c:if test="${my_page_gubun != null}">
		<jsp:include page="${my_page_gubun }"></jsp:include>
	</c:if>
</div>	
</body>
</html>