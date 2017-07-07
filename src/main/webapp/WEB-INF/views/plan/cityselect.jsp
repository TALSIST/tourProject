<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>SelectCity</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet prefetch'    href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="/resources/css/plan.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Calendar관련 -->
.
<!-- googleMap -->
<script async defer
   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB0x8X06sFv38VVRGSwLdAS9m2dkEl3dEs&callback=initMap">
</script>

<!--  <link rel='stylesheet prefetch' href='https://ajax.googleapis.com/ajax/libs/angular_material/0.9.0/angular-material.min.css'>
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Roboto:400,700'>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js'></script>
<script src='https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.min.js'></script>
<script src='https://ajax.googleapis.com/ajax/libs/angular_material/0.9.0/angular-material.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.3/moment.min.js'></script>
<script src='https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular-animate.min.js'></script>
<script src='https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular-aria.min.js'></script>
<script src="resources/js/calendar.js"></script>
<link rel="stylesheet" href="resources/css/calendar.css">  -->


<script type="text/javascript">
   var startday="";
   var endday="";
   $(document).ready(function(){
      $('#tourStartDate').datepicker({
         format:'MM-dd'
      });
      $('#tourStartDate').on("change",function(){
         startday = $(this).val();
         
      });
      $('#tourEndDate').datepicker({
         format:'yyyy-MM-dd'
      });
      $('#tourEndDate').on("change",function(){
         endday = $(this).val();
      });
      
      
      
   })
   
   function classact(){
          $('.item').click(function(){
             var country=$(this).attr('data-val');
         alert(country);            
            $('#country_list_title').text(country);
            $.ajax({
               type:'POST',
               url:'/getCountryID',
               data:{"name":country},
               success:function(response){
                  alert(JSON.stringify(response));
                  if(response==""){
                     alert('서비스 준비중입니다.');
                  }else{
                  var sub2="";
                  for(var i=0; i<response.length; i++){
                     sub2+="<div class=\"item\" data-no=\"0\" data=\"10635\" city_id="+response[i].city_id+" country-id="+response[i].country_id+" city-name="+response[i].name+" data-latitude="+response[i].latitude+" data-longitude="+response[i].longitude+">"
                       +"<div class=\"img_box fl\">"
                       +"<img src=https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference="+response[i].image+"&key=AIzaSyAMbeNVdxJghsGGfBjDJwHPqYXXqgb-D0E>"
                       +"</div>"
                       +"<div class=\"info_box fl\">"
                       +"<div class=\"info_title\">"+response[i].name+"</div>"
                       +"</div>"
                       +"<div class=\"spot_to_inspot\">"
                       +"<a data-toggle=\"modal\" data-target=\"#myModal\" href=\" /startdate\"><img id=\"startPlan\" src=\"/resources/img/plan/startPlan.png\" style=\"width:30px;\"></a></div>"
                       +"<div class=\"clear\"></div>"
                       +"</div>"
                  }
                  $('#country_list_box').html(""+sub2+"");
                  startplan();
                  }
               }
               
            });
            
          }); 
   }
   
   
      

   
$(function(){
   $('#startPlan').click(function(){
      var startDate = $('#tourStartDate').datepicker("getDate");
      var endDate=$('#tourEndDate').datepicker("getDate");
      var title= $('#tourTitle').val();
      startDate=startDate.getTime();
      endDate=endDate.getTime();
      
      if(title!=""){
         alert("startDate     " + startDate);
         $.ajax({
            type:'POST',
            url:'/startTour',
            data:{"startDate" : startDate ,"endDate":endDate,"title":title},
            success:function(data){
               alert("title "+title);  
               $('.modal-content').hide();
               location.href='/dayselect2';
               
            }
            
         });
      }else{
         alert('타이틀을 입력하세요');
      }
      
      
      
      
      
   });
   
   
   $("#cat_menu li").click(function () {
      var continent=$(this).attr('data-val');
      console.log(continent);
      $('#country_list_title').text(continent);
         $.ajax({
           type:'POST',
           url:'/getContinentID',
           data:{"name":continent},
           success:function(response){
              console.log(response[0].name);
              
              var sub="";
              var c = new Array();
              for(var i=0; i<response.length;i++){ 
                 sub+="<div class=\"item\" data-no=\"0\" data=\"338\" data-latitude=\" "+response[i].latitude+" \" onClick=\"showCity()\" data-val='"+response[i].name+"'>"
                 +"<div class=\"img_box fl\">"
                 +"<img src=https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference="+response[i].image+"&key=AIzaSyAMbeNVdxJghsGGfBjDJwHPqYXXqgb-D0E>"
                 +"</div>"
                 +"<div class=\"info_box fl\">"
                +"<div class=\"info_title\">"+response[i].name+"</div>"
                 +"<div class=\"info_sub_title\">Nepal</div>"
                 +"</div>"
                 +"<div class=\"clear\"></div>"
                 +"</div>"
                 +"<input type=hidden id=\"haha\" data-name=\" "+response[i].name+"\">";
                  var ci=new Array();
                    console.log("2.name은?"+response[i].name);
                    ci.push(response[i].name);
                    console.log("2.위도는?"+response[i].latitude);
                    ci.push(response[i].latitude);
                    console.log("2.경도은?"+response[i].longitude);
                    ci.push(response[i].longitude);
                    ci.push(3);
                     console.log("돌고난후 ci는?"+ci);
                    c.push(ci);
              
              }
              $('#country_list_box').html(""+sub+"");
              classact();
              console.log("눌렀다!넘겨질 대륙은?"+c);
                 initMap(c);
                 console.log("다시 인잇맵");

              
           }
           
        });
   });
         
});
function initMap(c) {
    console.log("c는?"+c);
    var conti;
    if(c==undefined||c==null){
       console.log("c는 null?"+c);
        conti = [
                       ['미국', 37.2582812,-104.6538703, 3],
                       ['캐나다', 54.6992932,-113.7082635, 3]
                     ]; 
        
       console.log("lat값?"+conti[0][1]+",lng값?"+conti[0][2])
        var map = new google.maps.Map(document.getElementById('map'), {
              zoom: parseFloat(conti[1][3]),
              center: {lat: parseFloat(conti[1][1]), lng: parseFloat(conti[1][2])}
         });
    }else
    {   console.log("c는 full?"+c);
       conti = c;
       console.log("conti는?"+conti);
       
       console.log("lat값?"+conti[0][1]+",lng값?"+conti[0][2])
        var map = new google.maps.Map(document.getElementById('map'), {
              zoom: parseFloat(conti[1][3]),
              center: {lat: parseFloat(conti[1][1]), lng: parseFloat(conti[1][2])}
         });
    }

         for (var i = 0; i < conti.length; i++){
             
             var cont = conti[i];   
             console.log("for문안에서도는 cont는?"+cont);
             var marker = new google.maps.Marker({
                position: {lat: parseFloat(cont[1]), lng: parseFloat(cont[2])},
                map: map,
                title: cont[0],
                zIndex: parseFloat(cont[3])
             });
             
             var infowindow = new google.maps.InfoWindow({
                 content: cont[0]
               });
          infowindow.open(map,marker);
           }
     
 }
function startplan(){
    var city_id;
    $('.item').click(function(){
       city_id = $(this).attr('city_id');
       alert("city  "+city_id);
    });
    $('#PlanStart').click(function(){      

       var startDate = $('#tourStartDate').datepicker("getDate");
       var endDate=$('#tourEndDate').datepicker("getDate");
       var title= $('#tourTitle').val();
       startDate=startDate.getTime();
       endDate=endDate.getTime();
    
        
       if(title!=""){
          alert("startDate     " + startDate);
          $.ajax({
             type:'POST',
             url:'/startTour',
             data:{"startDate" : startDate ,"endDate":endDate,"title":title,"city_id":city_id },
             success:function(data){
                
                /* alert("title "+title);   */
                $('.modal-content').hide();
                location.href='/dayselect2';
             /*    
                  $('.cat_right_city').text(city);
                $('.list_title span').innerHTML=city;  
              */
                
             }
             
          });
       }else{
          alert('타이틀을 입력하세요');
       }
    });
    
 }
 
 
       

</script>

</head>
<body>
   <div class="header">
      <div class="wrap" style="width: 100%; padding: 0px 10px;">
         <h1 class="logo fl" alt="나만의 여행 플래너 위드어스!">         
         <a href="main1">
            <img src="/resources/img/logo.png" alt="나만의 여행 플래너 위드어스!" width=176 height=37>
         </a>
         </h1>
         <div class="fl" id="gnb_plan_create_title">
            1.도시선택&nbsp;&nbsp;→&nbsp;&nbsp;2.상세
            일정 만들기
         </div>
         <div class="fl" id="gnb_ci_name"></div>
         <div class="fr gnb_box">
            <div class="fl gnb_search_box"></div>
            <!-- <a href="/ko/plan"> -->
               <div class="fr gnb_plan_create_close_btn" id="close22"><a href="main1">닫기</a></div>
            <!-- </a> -->      
            <div class="clear"></div>
         </div>
      </div>
   <div class="clear"></div>
   <link rel="stylesheet" href="/resources/css/cityselect.css">
   <div id="full_wrap" style="width: 100%; height: 598px;">
   <div class="fl left_full_box">
      <ul class="fl" id="cat_menu" data="" data-member_srl="1329305">
         <a><li data="as" data-val="아시아" class="on">
            <img src="/resources/img/plan/asia.png" class="s"><br>아시아
         </li></a>
         <a><li data="eu" data-val="유럽" >
            <img src="/resources/img/plan/europe.png" class="s"><br>유럽
         </li></a>
         <a><li data="oc" data-val="남태평양">
            <img src="/resources/img/plan/southpacific.png" class="s"><br>남태평양
         </li></a>
         <a><li data="na" data-val="북미">
            <img src="/resources/img/plan/northamerica.png" class="s"><br>북미
         </li></a>
         <a><li data="sa" data-val="중남미">
            <img src="/resources/img/plan/latinamerica.png" class="s" style="padding-bottom:7px;"><br>중남미
         </li></a>
      </ul>
   
   <!-- Left Div Start -->
    <div class="fl" id="schedule_full_box" style="width:265px" data="0">
        <div class="title_box">
          <div id="country_list_title" style="display: block;">
                <div class="fl ct_title">아시아</div>
                <div class="clear"></div>
          </div>
          <div id="city_list_title" style="display: none;">
                  <div class="back_btn fl"></div>
                  <div class="fl cu_title" style="width:230px;padding-left:10px;font-size:15px;">네팔</div>
                  <div class="clear"></div>
          </div>
        </div>
      <div id="search_box" style="width:100%;height:51px;border-bottom:solid #d6d6d6 1px;"></div>
      <!-- 대륙별 나라 리스트  -->
        <div id="country_list_box" style="height: 477px; display: block;">
          
        </div>

      <!-- country select after select city Start -->
         <div id="city_list_box" style="height: 477px; display: none;">
            
           <div class="item" data-no="0" data="10635" data-ci_name="" data-lat="27.67222200" data-lng="85.42777800" onClick="showCity()">
           <div class="img_box fl">
              <img src="http://mw2.google.com/mw-panoramio/photos/medium/72200693.jpg"></div>
           <div class="info_box fl">
           <div class="info_title">박타푸르</div>
           <div class="info_sub_title">Bhaktapur</div>
           </div>
           <div class="spot_to_inspot">
           <img src="/res/img/workspace/new/spot_to_inspot_a.png"></div>
           <div class="clear"></div>
           </div>
          
        </div> 
      <!-- country select after select city End -->
    </div>
    <!-- Left Div End -->
   
   <div class="clear"></div>

   
</div>
<div id="right_full_box" class="fl" style="position:absolute;left:336px;top:62px;">
      <!-- 지도 명칭 마커 표시 Start -->
      <div id="clip_list" data="0">
                <div class="list_title"><span></span> 클립보드<div class="list_title_option_menu" data-is_open="off">도시 변경</div></div>
                <div id="detail_close_btn"></div>
                <div class="clear"></div>
                <div class="clipboard_change_box"></div>
                
                <div class="list_box_overlay"></div>
                
                <div class="list_box"></div>
              </div>
          <!-- 지도 명칭 마커 표시 End -->
      <!-- Map Start -->
      <div id="map" class="fl"
         style="height: 598px; position: relative; width: 1500px; overflow: hidden;">
         <iframe width="100%" height="100%" scrolling="no" frameborder="0"
            style="border: 0" allowfullscreen> </iframe>
      </div>

            <div class="clear"></div>
</div>
</div>

   <!-- dayselect여부 !! -->
    <div class="modal fade" role="dialog" id="myModal"> 
      <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <input type="text" placeholder="여행 제목 입력" id="tourTitle" value="">
        </div>
        <div class="modal-body">
           <div>
              <p>여행 출발일</p>
                <input type="text" id="tourStartDate" dddddd="">
                <span id="tourStartSpan"></span>
                <p>여행 도착일</p>
                <input type="text" id="tourEndDate">
                <span id="tourStartSpan"></span>
           </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <input type="button" class="btn btn-primary"  id="PlanStart" value="여행시작하기">
        </div>
      </div>
      
    </div>
      
      
      
      
  </div>
  
  </div>
<script src="resources/js/index.js"></script>
<!-- </div> -->


</body>
</html>