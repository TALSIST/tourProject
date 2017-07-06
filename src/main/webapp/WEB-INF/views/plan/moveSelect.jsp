<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	  <c:when test="${res=='NOTITLE' }">
		   <script>
			   alert("여행제목을 입력하세요");
			   history.back();
		   </script>
	  </c:when>
	  
	  <c:when test="${res=='NOSTARTDATE' }">
		   <script>
			   alert("시작일을 입력하세요.");
			   history.back();
		   </script>
	  </c:when>
	  
	  <c:when test="${res=='NOEndDATE' }">
		   <script>
			   alert("종료일을 입력하세요");
			   history.back();
		   </script>
	  </c:when>
	  
	  <c:when test="${res=='OK' }">
	    <c:redirect url="dayselecdt2"/>
	  </c:when>
	  
</c:choose>