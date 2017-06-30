<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/tb.css">

</script>
</head>
<body>
	<div>
		<table id="table_content" width=100% border=1>
			<tr>
				<th width=20% style="font-family:dotum;">
					<div>
						<img src="/resources/img/schedule/tr_date.png">
						날짜
					</div>
				</th>
				<th width=35%>
					<div>
						<img alt="" src="/resources/img/schedule/tr_city.png">
						도시
					</div>				
				</th>
				<th width=45%>
					<div>
						<img alt="" src="/resources/img/schedule/tr_sch.png">
						일정
					</div>		
				</th>
			</tr>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td align="center">
						${vo.day_title}&nbsp;<span>${vo.day_day }</span><br>
						${vo.day_order }
					</td>
					<td>
						<c:forEach var="cvo" items="${vo.cityVO }">
							⊙ ${cvo.name }<br>
						</c:forEach>
					</td>
					<td>					
						<c:forEach var="pvo" items="${vo.placeVO }">
							${pvo.name }<br>
						</c:forEach>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>