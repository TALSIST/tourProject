<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>여행경로 추천창</title>
<link rel="stylesheet" href="/resources/css/routecommend.css">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
   $(function() {
      $(".tab_content:first").show();
      var c_name = getcookie("vi"); // 기존 저장된 쿠키값을 가져온다.
      if (c_name) { // 기존 저장된 쿠키값이 있으면 그 값으로 ch 함수 호출
         ch(c_name); // ch 함수호출
      }

      $("ul.tabs li").click(function() {
         var num = $(this).index();
         setcookie("vi", num); // 클릭한 li 의 index 번호를 쿠키에 저장한다.
         ch(num); // ch 함수호출
      });
   });

   function ch(num) { // 클릭한 li 의 탭기능 구현함수
      $("ul.tabs li").removeClass("active").css("color", "#333");
      $("ul.tabs li:eq(" + num + ")").addClass("active").css("color",
            "darkred");

      $(".tab_content").hide()
      $(".tab_content:eq(" + num + ")").fadeIn()
   }

   function setcookie(aa, bb) { // 쿠키생성함수
      document.cookie = aa + "=" + bb + "; path=/;"
      return false;
   }

   function getcookie(Key) { // 쿠키호출함수
      var cookies = document.cookie.split("; ");
      for (var i = 0; i < cookies.length; i++) {
         var coValues = cookies[i].split("=");
         if (coValues[0] == Key) {
            return unescape(coValues[1]);
         }
      }
      return false;
   }

  function initMap() {  
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 7,
      center: {lat: 41.85, lng: -87.65}
    });
    console.log("맵 초기화 생성중");
    var test22222 =${sessionScope.prevLat};
    console.log(test22222);
    var control = document.getElementById('floating-panel');
    control.style.display = 'block';
    map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);
    
    var directionsDisplay = new google.maps.DirectionsRenderer;
    var directionsService = new google.maps.DirectionsService;
    directionsDisplay.setMap(map);
    directionsDisplay.setPanel(document.getElementById('tab1'));
    
    marker1 = new google.maps.Marker({
       map: map,
       draggle:true,
       position:{lat:23.299,lng:91.56}
    });
    
    marker2 = new google.maps.Marker({
       map: map,
       draggle:true,
       position:{lat:23.4490,lng:91.43340}
    });
    
    calculateAndDisplayRoute(directionsService, directionsDisplay);
    console.log("루트그리기실행완료!");
  }

  
  function calculateAndDisplayRoute(directionsService, directionsDisplay) {
     console.log("루트그리기실행!");
    var start = marker1;
    var end = marker2;
    directionsService.route({
      origin: {lat:(${sessionScope.prevLat}),lng:(${sessionScope.prevlong})},
      destination: {lat:(${sessionScope.curLat}),lng:(${sessionScope.curlong})},
      travelMode: 'TRANSIT'
    }, function(response, status) {
      if (status === 'OK') {
        directionsDisplay.setDirections(response);
      } else {
        window.alert('장소에 대한 정보가 정확하지 않습니다' + status);
      }
    });
  }
</script>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCMo-APmmEA2Ph6druEVRBiP7kwaC_BF_A&language=ko&callback=initMap">
</script>
</head>
<body style="background-color: white; height:100%;scrolling:yes;">
    <div id="floating-panel">
       <input type="hidden" id="start" class="controls" type="text"
        placeholder="출발장소를 입력하세요" value="${sessionScope.start}">
    <input type="hidden" id="end" class="controls" type="text"
        placeholder="도착장소를 입력하세요" value="${sessionScope.end}">
    </div>
   <div id="map" class="fl" style="height:280px; position: relative; width:100%; overflow: hidden;">
      <iframe width="500" height="300" scrolling="yes" frameborder="0"
         style="border: 0" allowfullscreen>
         </iframe>
   </div>
   <div id="info" height=300px;>
   <div id="travelTab" scrolling="yes">
      <ul class="tabs" id="mode">
         <li class="traffic1 on" rel="tab1" value="TRANSIT">대중교통</li>
         <li class="traffic2" rel="tab2" value="WALKING">도보</li>
         <li class="traffic3" rel="tab3" value="DRIVING">자가용</li>
         <li class="traffic4" rel="tab4" value="BICYCLING">자전거</li>
         <div rel="tab5" class="adp-summary">
            <!--<span class="len" jstcache="59">km</span>
            <span class="jum" jstcache="60">.</span>
            <span class="time" jstcac   he="61">분</span> -->
         </div>
      </ul>
      <div class="tab_container" height=100%>
         <div id="tab1" class="tab_content">
         </div>
         <div id="tab2" class="tab_content">서비스가 제공되지 않는 지역입니다.</div>
         <div id="tab3" class="tab_content">서비스가 제공되지 않는 지역입니다.</div>
         <div id="tab4" class="tab_content">서비스가 제공되지 않는 지역입니다.</div>
      </div>
      <!-- .tab_container -->
   </div>
   <!-- #container -->
   </div>
</body>
</html>
</body>
</html>