<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/resources/css/owl.carousel2.css" rel="stylesheet">
<link href="/resources/css/plan_sub.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
#map {
        height: 300px;
        width: 95%;
       }
</style>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBJ6_EEkSUummI0Jns1VsF-kgJpy8JeEVk&callback=initMap">
    </script>
<script>
      function initMap() {
        var uluru = {lat: -25.363, lng: 131.044};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
    </script>
</head>
<body>
<div class="plan_page" style="width:1120px;">
	
	<div class="plan_cover">
		<div class="cover_img" style="background:url('http://www.lgblog.co.kr/wp-content/uploads/2015/08/%EA%B2%BD%EB%B3%B5%EA%B6%81_624.jpg')
			no-repeat;background-size:cover;background-position:cetner;"></div>
	</div>
	<div class="plan_mnu_box" style="width:1120px;">
		<div class="plan_mnu on">개요</div>
		<div class="plan_mnu on">일정표</div>
		<div class="plan_mnu on">지도</div>
		<div class="plan_mnu on">댓글</div>
	</div>
	

	<div class="wrap page show">
	<div class="page_left">
		<div class="day_box">
		<!-- 데이 정보 날짜랑 그런거 -->
			<div class="day_info_box">
				<div class="day_txt">Day1</div>
				<div class="day_info_left">
					<div class="date">2016.06.16 (목)</div>
					<div class="day_title">서울</div>
				</div>
				<div class="day_info_right" style="display:none;"></div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
			
			<!-- 장소 정보  -->
			<div class="day_sch_box">
				<div class="day_sch_num">
					<div class="sch_num">1</div>
				</div>
				<div class="sch_content">
					<img src="http://img.earthtory.com/img/place_img/310/6732_0_et.jpg" alt class="spot_img" style="cursor:pointer;">
					<div class="spot_content_box">
						<div class="spot_name">낙산공원</div>
						<div class="spot_info">
							<div class="tag">공원</div>
							<div class="clear"></div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
			
			<!--  사이에 넘어가는거 짝대기-->
			<div class="day_sch_distance">|</div>
			<div class="day_sch_box">
				<div class="day_sch_num">
					<div class="sch_num">2</div>
				</div>
				<div class="sch_content">
					<img src="http://img.earthtory.com/img/place_img/310/6973_0_et.jpg" alt class="spot_img" style="cursor:pointer;">
					<div class="spot_content_box">
						<div class="spot_name">신당동</div>
						<div class="spot_info">
							<div class="tag">레스토랑</div>
							<div class="clear"></div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<!-- 2일차 -->
		<div class="day_box">
		<!-- 데이 정보 날짜랑 그런거 -->
			<div class="day_info_box">
				<div class="day_txt">Day2</div>
				<div class="day_info_left">
					<div class="date">2016.06.16 (목)</div>
					<div class="day_title">서울</div>
				</div>
				<div class="day_info_right" style="display:none;"></div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
			
			<!-- 장소 정보  -->
			<div class="day_sch_box">
				<div class="day_sch_num">
					<div class="sch_num">1</div>
				</div>
				<div class="sch_content">
					<img src="http://img.earthtory.com/img/place_img/310/6732_0_et.jpg" alt class="spot_img" style="cursor:pointer;">
					<div class="spot_content_box">
						<div class="spot_name">낙산공원</div>
						<div class="spot_info">
							<div class="tag">공원</div>
							<div class="clear"></div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
			
			<!--  사이에 넘어가는거 짝대기-->
			<div class="day_sch_distance">|</div>
			<div class="day_sch_box">
				<div class="day_sch_num">
					<div class="sch_num">2</div>
				</div>
				<div class="sch_content">
					<img src="http://img.earthtory.com/img/place_img/310/6973_0_et.jpg" alt class="spot_img" style="cursor:pointer;">
					<div class="spot_content_box">
						<div class="spot_name">신당동</div>
						<div class="spot_info">
							<div class="tag">레스토랑</div>
							<div class="clear"></div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
			
			<div class="day_sch_distance">|</div>
			<div class="day_sch_box">
				<div class="day_sch_num">
					<div class="sch_num">3</div>
				</div>
				<div class="sch_content">
					<img src="http://pds.joins.com/news/component/htmlphoto_mmdata/201507/20/htm_20150720211200585.jpg" alt class="spot_img" style="cursor:pointer;">
					<div class="spot_content_box">
						<div class="spot_name">창덕궁</div>
						<div class="spot_info">
							<div class="tag">궁</div>
							<div class="clear"></div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<div class="page_right">
		<div class="right_scroll_box">
			<div class="map_box" id="map" style="position:relative;overflow:hidden;">
				
			</div>
		</div>
	</div>
	</div>
</div>	
</body>
</html>