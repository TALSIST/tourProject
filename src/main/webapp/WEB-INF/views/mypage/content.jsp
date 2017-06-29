<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Bootstrap Core CSS -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>
    <!-- Page Content -->
    <div class="container1">
        <!-- Page Features -->
        <div class="row text-center">
        <c:if test="${list==null }">
        	<div>내 일정이 존재하지 않습니다</div>
        </c:if>
        
        <c:if test="${list!=null }">
        <c:forEach var="vo" items="${list}">
        	<div class="col-md-4 col-sm-6">
   tour_id=${vo.tour_id } 
                <div class="thumbnail">
                    <a href="detail_content.do?"><img src="https://maps.googleapis.com/maps/api/place/photo?maxwidth
                    =700&photoreference=key=AIzaSyCoxAzj933Z0kM-ZJObD0V0CRmn05vH000" alt=""></a>
                    <div class="caption">
                    	
                        <h3>${vo.title }</h3>
                        <%-- <p>${vo.subtitle }</p> --%>
                        <p>
                            <a href="/mypage?jsp_page=detail_mypage" class="btn btn-info">수정하기</a> <a href="#" class="btn btn-warning">삭제하기</a>
                        </p>
                    </div>
                </div>
            </div>
        </c:forEach>
        </c:if>
            

            <!-- <div class="col-md-4 col-sm-6">
                <div class="thumbnail">
                    <img src="/resources/img/porf-2.jpg" alt="">
                    <div class="caption">
                        <h3>노르웨이 산에서 자전거타기</h3>
                        <p>슝슝슝~!</p>
                        <p>
                            <a href="#" class="btn btn-info">수정하기</a> <a href="#" class="btn btn-warning">삭제하기</a>
                        </p>
                    </div>
                </div>
            </div> -->
            

        </div>
        <!-- /.row -->

    </div>
    <!-- /.container1 -->

</body>

</html>
