<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	  <c:when test="${res=='NOTITLE' }">
		   <script>
			   alert("���������� �Է��ϼ���");
			   history.back();
		   </script>
	  </c:when>
	  
	  <c:when test="${res=='NOSTARTDATE' }">
		   <script>
			   alert("�������� �Է��ϼ���.");
			   history.back();
		   </script>
	  </c:when>
	  
	  <c:when test="${res=='NOEndDATE' }">
		   <script>
			   alert("�������� �Է��ϼ���");
			   history.back();
		   </script>
	  </c:when>
	  
	  <c:when test="${res=='OK' }">
	    <c:redirect url="dayselecdt2"/>
	  </c:when>
	  
</c:choose>