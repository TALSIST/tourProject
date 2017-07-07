<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<!-- <link href="/resources/css/gaeyo.less" rel="stylesheet/less"> -->
<!-- <link href="/resources/css/plan_sub.css" rel="stylesheet"> -->
<link href="/resources/css/gaeyo.css" rel="stylesheet">
<script src="/resources/lib/jquery/jquery.min.js"></script>
<!-- <script src="/resources/js/gaeyo.js"></script> -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script>
function scrollFix(a){
	window.scrollTO(a,0)
}
function up(){
	a=document.body.scrollLeft;
	
}
</script>

</head>
<body>
<div class="wrap">
<ul class="timeline">
   <c:forEach var="vo" items="${list2 }">
  <li>
   	 
      <header class="year">
      	<c:if test="${vo.gubun!=0 }">
      		<div style="border:1px solid;width:70px;">DAY${vo.day }</div>
      	</c:if>
      </header>
     <c:if test="${vo.gubun!=0 }">
        <div style="display:block;height:3px;border:0;border-top:3px solid #041102;margin:1em 0;padding:0;"></div>
   		</c:if>
        <div class="box">
        <img src="https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${vo.placeVO.image }&key=AIzaSyAMbeNVdxJghsGGfBjDJwHPqYXXqgb-D0E" class="spot_img" style="float:left;width:80px;height:83px;">
             <h4 align="left">&nbsp;${vo.placeVO.name }</h4>
              <p align="left">&nbsp;&nbsp;${vo.placeVO.address }</p>
        </div>
     
    </li>
    </c:forEach>
</ul>
</div>

</body>
</html>