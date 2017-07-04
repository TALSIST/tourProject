<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/resources/css/owl.carousel2.css" rel="stylesheet">
<link href="/resources/css/plan_sub.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="plan_page" style="width:1120px;" >
	
	<div class="plan_cover">
		<div class="cover_img" style="background:url('https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${list2[0].placeVO.image }&key=AIzaSyAMbeNVdxJghsGGfBjDJwHPqYXXqgb-D0E')
			no-repeat;background-size:cover;background-position:cetner;"></div>
	</div>
	<div class="plan_mnu_box" style="width:1120px;">
		<a href="gaeyo2?tour_id=${list2[1].tour_id }"><div class="plan_mnu on">개요</div></a>
		<div class="plan_mnu_line"></div>
		<a href="time_schedule?tour_id=${list2[1].tour_id }"><div class="plan_mnu on">일정표</div></a>
		<div class="plan_mnu_line"></div>
		<a href="story?tour_id=${list2[1].tour_id }"><div class="plan_mnu on">스토리</div></a>
		<div class="plan_mnu_line"></div>
		<a href="memo?tour_id=${list2[1].tour_id }"><div class="plan_mnu on">메모</div></a>
		<div class="plan_mnu_line"></div>
		<a href="map?tour_id=${list2[1].tour_id }"><div class="plan_mnu on">지도</div></a>
		<div class="plan_mnu_line"></div>
		<div class="plan_mnu on"style="float:right;color:green;border:1px solid;">엑셀로 다운받기</div>
	
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