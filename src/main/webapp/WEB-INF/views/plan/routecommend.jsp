<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ ��õâ</title>
<link rel="stylesheet" href="/resources/css/routecommend.css">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
   $(function() {
      $(".tab_content:first").show();
      var c_name = getcookie("vi"); // ���� ����� ��Ű���� �����´�.
      if (c_name) { // ���� ����� ��Ű���� ������ �� ������ ch �Լ� ȣ��
         ch(c_name); // ch �Լ�ȣ��
      }

      $("ul.tabs li").click(function() {
         var num = $(this).index();
         setcookie("vi", num); // Ŭ���� li �� index ��ȣ�� ��Ű�� �����Ѵ�.
         ch(num); // ch �Լ�ȣ��
      });
   });

   function ch(num) { // Ŭ���� li �� �Ǳ�� �����Լ�
      $("ul.tabs li").removeClass("active").css("color", "#333");
      $("ul.tabs li:eq(" + num + ")").addClass("active").css("color",
            "darkred");

      $(".tab_content").hide()
      $(".tab_content:eq(" + num + ")").fadeIn()
   }

   function setcookie(aa, bb) { // ��Ű�����Լ�
      document.cookie = aa + "=" + bb + "; path=/;"
      return false;
   }

   function getcookie(Key) { // ��Űȣ���Լ�
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
    var directionsDisplay = new google.maps.DirectionsRenderer;
    var directionsService = new google.maps.DirectionsService;
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 7,
      center: {lat: 41.85, lng: -87.65}
    });
    directionsDisplay.setMap(map);
    directionsDisplay.setPanel(document.getElementById('tab1'));

    var control = document.getElementById('floating-panel');
    control.style.display = 'block';
    map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);

    var onChangeHandler = function() {
      calculateAndDisplayRoute(directionsService, directionsDisplay);
    };
    document.getElementById('start').addEventListener('change', onChangeHandler);
    document.getElementById('end').addEventListener('change', onChangeHandler);
    document.getElementById('mode').addEventListener('change', onChangeHandler);
  }

  function calculateAndDisplayRoute(directionsService, directionsDisplay) {
    var start = document.getElementById('start').value;
    var end = document.getElementById('end').value;
    var mode = document.getElementById('mode').value;
    console.log("����?"+mode);
    directionsService.route({
      origin: start,
      destination: end,
      travelMode: 'TRANSIT'
    }, function(response, status) {
      if (status === 'OK') {
        directionsDisplay.setDirections(response);
      } else {
        window.alert('��Ҹ� ��Ȯ�� �Է����ֽñ� �ٶ��ϴ�' + status);
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
       <input id="start" class="controls" type="text"
        placeholder="�����Ҹ� �Է��ϼ���">
    <input id="end" class="controls" type="text"
        placeholder="������Ҹ� �Է��ϼ���">
    </div>
   <div id="map" class="fl" style="height:280px; position: relative; width:100%; overflow: hidden;">
      <iframe width="500" height="300" scrolling="yes" frameborder="0"
         style="border: 0" allowfullscreen>
         </iframe>
   </div>
   <div id="info" height=300px;>
   <div id="travelTab" scrolling="yes">
      <ul class="tabs" id="mode">
         <li class="traffic1 on" rel="tab1" value="TRANSIT">���߱���</li>
         <li class="traffic2" rel="tab2" value="WALKING">����</li>
         <li class="traffic3" rel="tab3" value="DRIVING">�ڰ���</li>
         <li class="traffic4" rel="tab4" value="BICYCLING">������</li>
         <div rel="tab5" class="adp-summary">
            <span class="len" jstcache="59">km</span>
            <span class="jum" jstcache="60">.</span>
            <span class="time" jstcac   he="61">��</span>
         </div>
      </ul>
      <div class="tab_container" height=100%>
         <div id="tab1" class="tab_content">
         </div>
         <div id="tab2" class="tab_content">���񽺰� �������� �ʴ� �����Դϴ�.</div>
         <div id="tab3" class="tab_content">���񽺰� �������� �ʴ� �����Դϴ�.</div>
         <div id="tab4" class="tab_content">���񽺰� �������� �ʴ� �����Դϴ�.</div>
      </div>
      <!-- .tab_container -->
   </div>
   <!-- #container -->
   </div>
</body>
</html>
</body>
</html>