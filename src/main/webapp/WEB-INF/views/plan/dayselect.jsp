<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <title>Toooour</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>
  <link rel="stylesheet" href="/resources/css/plan.css">
  <link rel="stylesheet" href="/resources/css/shadowbox.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link href="/resources/css/owl.carousel2.css" rel="stylesheet">
<link href="/resources/css/plan_sub.css" rel="stylesheet">
<script src="http://ajax.cdnjs.com/ajax/libs/json2/20110223/json2.js"></script>
<script type="text/javascript" src="/resources/js/shadowbox.js"></script>
<script>

   var temp = ${sessionScope.startDay};
   var temp2 = ${sessionScope.endDay};
   var tempDate=new Date();
  
   var startSeconds =new Date(temp);
   var endSeconds =new Date(temp2);
  
   var btDay;         //여행일자   
   var date="";      //날짜 -7.10일
   var week="";      //요일
   var day=1;         //몇번째날인지
   var countDay;    //DAY가 몇개인지..포문돌리기용
   var IsClick=false;
   var year= startSeconds.getFullYear()+"-"+(startSeconds.getMonth()+1)+"-"+startSeconds.getDate();
   var fullDate=year;
   var tour_id=${sessionScope.tour_id};
   
    Shadowbox.init({
             players:['iframe']
      }); 

      function initMap(p) {
         var place;
         if(p==undefined||p==null){
             place = [
                            ['가로수길', 37.5206974,127.0225605, 10],
                            ['북촌한옥마을',37.5793998,126.9802342, 10]
                          ]; 
             var map = new google.maps.Map(document.getElementById('map'), {
                   zoom: parseFloat(place[1][3]),
                   center: {lat: parseFloat(place[1][1]), lng: parseFloat(place[1][2])}
              });
         }else
         {  
            place = p;
            var map = new google.maps.Map(document.getElementById('map'), {
                  zoom: parseFloat(place[0][3]),
                  center: {lat: parseFloat(place[0][1]), lng: parseFloat(place[0][2])}
             });
         }
           

              for (var i = 0; i < place.length; i++){
                  
                  var plc = place[i];   
                  var marker = new google.maps.Marker({
                     position: {lat: parseFloat(plc[1]), lng: parseFloat(plc[2])},
                     map: map,
                     title: plc[0],
                     zIndex: parseFloat(plc[3])
                  });
                  
                  var infowindow = new google.maps.InfoWindow({
                      content: plc[0],
                    });
               infowindow.open(map,marker);
                }
          
      }   
   function classact() {
      // ajax를 통해 생성된 loc리스트를 Day경로에 넣기 위한 함수.
      $('.spot_to_inspot').click(function(){
         var id;
        var selDay;
         
         var name = $(this).attr('data-name');
         var place_id = $(this).attr('data-id');
         var sub_category_id = $(this).attr('sub-category-id');
         
         var set_day = $(this).attr('data-day');
         
         //var dayday = //day1, day2의 값..
         id="#schedule_detail_box"+(day)+"";
         var data_no=  $(""+id+"").children('.day_spot_item').length;
         set_day=  $(""+id+"").attr('data-day');
         
         //day는 day1을 누르면 값이 셋팅 되고 아니면 1로 셋팅
         $.ajax({
            type:'POST',
            url:'/addSpot',
            data:{"sub_category_id" : sub_category_id,   "place_id":place_id},
            success:function(response){
               var sub=" <div class=\"day_spot_item\" data-img="+response[0].image+" data-fullDate="+fullDate+" data="+(data_no+1)+" data-set_day="+set_day+" place_id="+response[0].place_id+" latitude="+response[0].latitude+" longitude="+response[0].longitude+" >"
               +"<div class=\"item_ctrl_box\" style=\"display: none;\">"
                 +"<div class=\"fl btn_del\" title=\"삭제\">"
                 +"<img src=\" /resources/img/plan/remove.png \">"
                 +"</div>"
                 +"<div class=\"clear\"></div>"
                 +"</div>";
                 if(data_no+1>1){
                	 sub+="<div class=\"spot_distance_box\">"
                         +"<div id=\"re\">"+(data_no)+".경로추천"+"</div>"
                         +"</div>";
                 }
                 sub+="<div class=\"img_box fl \">"
                 +"<div class=\"spot_order_box\">"+(data_no+1)+"</div>"
                 +"<img src=https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference="+response[0].image+"&key=AIzaSyAMbeNVdxJghsGGfBjDJwHPqYXXqgb-D0E>"
                 +"<div style=\"position:absolute;top:35px;left:40px;width:22px;height:20px;\" >"
                 +"<img src=\" /resources/img/plan/remove.png \" class=\"memo_indi\" style=\"width:22px;height:20px;\">"
                 +"</div>"
                 +"</div>"
                 +"<div class=\"fl info_box\">"
                 +"<div class=\"title\">"+response[0].name+"</div>"
                 +"<div class=\"sub\">"+place_id+"</div>"
                 +"<div class=\"sub inspot_day_info_box\" style=\"color:#1a7ad9\">"
                 +"</div>"
                 +"</div>"
                 +"<div class=\"clear\"></div>"
                 +"</div>";
                 var p = new Array();
                 for(var i=0;i<response.length;i++){
                    var pi = new Array();
                    pi.push(response[i].name);
                    pi.push(response[i].latitude);
                    pi.push(response[i].longitude);
                    pi.push(15);
                 }
                 p.push(pi);
               for(var i=0; i<=btDay;i++){
                   id="#schedule_detail_box"+(i+1)+"";
                   if(!IsClick){
                   	day=1;
                   }
                   selDay= $(""+id+"").attr('data-day');
                   //$(""+id+"").css('display','none');
                   if(selDay==day){
                      $(""+id+"").append(sub);
                      sub="";
                   }
                } 
                  //var day=$('.day_spot_item').eq(i+1).attr('data-set_day');
               $("#schedule_full_box").append(sub);
               sub="";
               initMap(p);
               recomm2();
            }, error:function(request,status,error){
               alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
         
            }
          
         }); 
         
      
      });
      
   }
   
   function recomm2(){
	   $('.spot_distance_box').click(function(){
 	  		var prevLat = $(this).parent().prev().attr('latitude');
 	  		var prevlong = $(this).parent().prev().attr('longitude');
 	  		var curLat = $(this).parent().attr('latitude');
 	  		var curlong =  $(this).parent().attr('longitude');
 	  		
 	  		
 	  		
		   recomm(prevLat,prevlong,curLat,curlong);
   	});
   }
   

   
   
   //넘어온 날짜만큼 DAY1,DAY2만들기
   function setSepDay(){
   /*       
      alert("startSeconds          " + startSeconds);
      alert("endSeconds          " + endSeconds);
       */
      var btMs = temp2 - temp ;
       btDay = btMs / (1000*60*60*24) ;
      
      var startMonth = tempDate.setDate(startSeconds.getDate()+1);
      var week = new Array('일','월','화','수','목','금','토');
      if(btDay!=0){
         var createDay="";
         createDay+="<li id=\"show_all_day\" >전체 일정 보기</li>";
         for(var i=0; i<btDay+1;i++){
            tempDate.setDate(startSeconds.getDate()+i);
            createDay+="<li data=\"1\" datafullDate="+(tempDate.getFullYear())+"-"+(tempDate.getMonth()+1)+"-"+(tempDate.getDate())+" data-week="+week[tempDate.getDay()]+"요일"+"  data-date="+(tempDate.getMonth()+1)+"."+(tempDate.getDate())+" data-day_week=\"3\" data-day="+(i+1)+" original-title=\"서울\">"
                    +"<input type=\"hidden\" data-fulldate="+fullDate+" data-date="+(tempDate.getMonth()+1)+"."+(tempDate.getDate())+" data-week="+week[tempDate.getDay()]+"요일>" 
                  +"<div class=\"fl cat_date_left_box\">"   
                     +"<div class=\"cat_left_day\">DAY"+(i+1)+"</div>"
                     +"<div class=\"cat_left_date\">"+(tempDate.getMonth()+1)+" 월 "+(tempDate.getDate())+" 일"+"</div>"
                  +"</div>"
                  +"<div class=\"fl cat_date_right_box\">"
                     +"<div class=\"cat_right_weekday\">"+week[tempDate.getDay()]+"요일</div>"
                     +"<div class=\"cat_right_city\"></div>"
                  +"</div>"
                  +"<div class=\"clear\"></div>"
               +"</li>";
         }
         $('#cat_menu').html(createDay);
         setDayLocList();
         
      }
   }
   
   
   function recomm(prevLat,prevlong,curLat,curlong){
		
       var start = "타임스퀘어";
       var end = "명동역";
      //alert(lat+","+lng+","+pid+","+start+","+end);
      $.ajax({
           type:'POST',
           url:'/recomm.do',
           data:{"prevLat":prevLat, "prevlong":prevlong,"curLat":curLat, "curlong":curlong},
           success:function(response){
              
           }
       });
       Shadowbox.open({
          content:"routecommend.do",
          player:'iframe',
          title:'경로추천',
          width:500,
          height:600
        
       });
    }
   
   //DAY1, DAY2 클릭시 이벤트 구현
   function setDayLocList(){
      
      $('#cat_menu li').click(function(){
    	  IsClick=true;
         date = $(this).attr('data-date');         //날짜 -7.10일
         week= $(this).attr('data-week');         //요일
         day = $(this).attr('data-day');            //몇번째날인지
         fullDate= $(this).attr('datafulldate');
         
         //디테일 리스트... 창 바꾸기
           for(var i=0; i<=btDay;i++){
            var id="#schedule_detail_box"+(i+1)+"";
              if(day==(i+1)){
                 $(""+id+"").css('display','block');
              }else{
                 $(""+id+"").css('display','none');
              }
           }
           
         $('#sepDay').text("DAY"+day+"|  "+date+"|  ("+week+")");
         
         var locCount = $('#schedule_detail_box2').children('.day_spot_item').length;
         //가져온 데이스팟 태그와 찍은 데이와 비교해서 같은것만 디스플레이 논에서 제외시켜준다.
         
         for(var i=0; i<locCount;i++){
            var day33=$('.day_spot_item').eq(i+1).attr('data-set_day');
         }
         
      });
   }

   
   function setDetailBox(){
      //<div id="schedule_detail_box" class="connectedSortable ui-sortable" style="height: 447px; display: block;">
      //</div>
      //스케쥴 디테일 박스에는 몇번째 날짜인지, 하위갯수( day_spot item의 갯수), 아이디값 =  day(N)
      var setDetailBox="";
      
      var i;
         for(i=0; i<btDay+1;i++){
            setDetailBox="";
            if(i==0){
               setDetailBox+="<div id=\"schedule_detail_box"+(i+1)+"\" data-day="+(i+1)+" spotItemCount=day"+(i+1)+" class=\"connectedSortable ui-sortable\" style=\"height: 447px;overflow-y:scroll; display: block;\" >"
               +"</div>";
               $('#schedule_full_box').append(setDetailBox);
            }else{
            setDetailBox+="<div id=\"schedule_detail_box"+(i+1)+"\" data-day="+(i+1)+" spotItemCount=day"+(i+1)+" class=\"connectedSortable ui-sortable\" style=\"height: 447px; overflow-y:scroll; display: none;\" >"
                           +"</div>";
            $('#schedule_full_box').append(setDetailBox);
            }
         }
      classact();
      setDayLocList();
   }
   
   function setShareMember(){
	   
	   
	   
   }
   function saveTourPlan(){
	 //완료버튼 클릭시 이벤트 처리
	      $('#plan_complete_btn').click(function(){
	    	  //var locCount = $('#schedule_detail_box2').children('.day_spot_item').length;
	    	  //var id="#schedule_detail_box"+(i+1)+"";
	           //$(""+id+"").css('display','none');
	    	  var topCount = $('#schedule_full_box').children('.connectedSortable ui-sortable').length;	//day의 갯수
	    	  var tourInfomation = new Object();	//여행 id에 대한 정보
	    	  tourInfomation.tour_id ="3";
	    	  var tourlist = new Array();
	    	  for(var i=1;i<=btDay+1;i++){
	    		  var id="#schedule_detail_box"+(i)+"";
	    		  var subCount = $(""+id+"").children('.day_spot_item').length;			//day_spot_item의 갯수
	    		  var id="#schedule_detail_box"+(i)+" .day_spot_item:nth-child(";
	    		  for(var j=1;j<=subCount;j++){
	    			  //E:nth-child(n)
	    			  var place_id = $(""+id+""+j+")").attr('place_id');	//장소 id.
	    			  var tour_dateOrder = $(""+id+""+j+")").attr('data-set_day');	//set-day
	    			  var tour_order=	$(""+id+""+j+")").attr('data');	//몇번쨰 요소인지
	    			  															//tour_id (글 번호)
	    			  var tour_fullDate= $(""+id+""+j+")").attr('data-fullDate');
	    			  var sepTour = new Object();
	    			  sepTour.place_id = place_id;
	    			  sepTour.tour_dateOrder=tour_dateOrder;
	    			  sepTour.tour_order=tour_order;
	    			  sepTour.tour_fullDate=tour_fullDate;
	    			  sepTour.tour_id = tour_id;
	    			  tourlist.push(sepTour);
	    		  }
	    	  }
	    	  tourInfomation.tour=tourlist;
			  var sendData = JSON.stringify(tourInfomation);
			  
			  
			  $.ajax({
				  type:'POST',
				  url:'/savePlan',
				  data:{"sendData":sendData},
			  	  success:function(){
			  		location.href='/mypage';
			  	}
				  
			  })
			  
	      });
   }
   
   
   //DAY1, DAY2클릭시 이벤트구현
   $(document).ready(function(){
      
      classact();
      
      setSepDay();      //DAY설정하기
      setDayLocList();      //동적추가부분..
      setDetailBox();         //검색결과를 디테일박스에넣기.
      setShareMember();
      saveTourPlan();
      var city_id = ${sessionScope.city_id};
      //var city_name = ${sessionScope.city_name};
      $('#city_name').attr('city-id',city_id);
      
      
      $.ajax({
          type:'POST',
          url:'/getLocationList',
          data:{"city_id":city_id},
          success:function(response){
             var sub="";
             for(var i=0; i<response.length;i++){
                sub+="<input type=\"hidden\" city_id="+response[i].city_id+">"+
                "<div style=\"height:128px;\" class=\"day_spot_item ui-draggable\" name="+response[i].name+" longitude="+response[i].longitude+" latitude="+response[i].latitude+" place_id="+response[i].place_id+" data=\"0\" data-set_day="+day+" data-rel_srl=\"6662\" data-pl_type=\"0\" data-no="+i+" data-pl_cat=\"301\" data-ci=\"310\">"+
                "<div class=\"img_box fl\" > "
                +"<img src=https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference="+response[i].image+"&key=AIzaSyAMbeNVdxJghsGGfBjDJwHPqYXXqgb-D0E>"
                +"</div>"+    
                "<div class=\"fl info_box\">"+
                   "<div class=\"title\">"+response[i].name+"</div>"+
                   "<div class=\"sub\">"+response[i].sub_category_id+"</div>"+
                   "<div class=\"sub\" style=\"height:42px;\">"+
                      "<div class=\"tooltip_clip_cnt fl\">"+response[i].good+"</div>"+
                      "<div class=\"tooltip_clip_cnt fl\"></div>"+
                      "<div class=\"tooltip_review_rate fl\"></div>"+
                      "<div class=\"clear\"></div>"+
                   "</div>" +
                   "<div class=\"sub include_pn_day\" style=\"color:#1a7ad9\"></div>"+
                "</div>"+
                "<div class=\"spot_to_inspot\" sub-category-id="+response[i].sub_category_id+" data-id="+response[i].place_id+" data-name="+response[i].name+"><img style=\"width:20px; height:20px;\"src=\"/resources/img/plan/addspot.png \"></div><div class=\"clear\"></div></div>";
             }
             $('#locList').html(""+sub+"");
              $('#city_name').text('${sessionScope.city_name}');
             classact();
             setDayLocList();
          }
       });
      
      //day추가버튼시 클릭 이벤트 구현 (추가할때마다 마지막날의 초만큼 더해줌)
      $('#dayAdd').click(function(){
         temp2 +=1000*60*60*24;      //하루치 초를 더해줌.
         setSepDay();
         //setDayLocList();
         var setDetailBox2="<div id=\"schedule_detail_box"+(btDay+1)+"\" data-day="+(btDay+1)+" spotItemCount=day"+(btDay+1)+" class=\"connectedSortable ui-sortable\" style=\"height: 447px; overflow-y:scroll; display: none;\" >"
                              +"</div>";
         $('#schedule_full_box').append(setDetailBox2);
      });
     
      
      $('#cat_menu').sortable();
      
      $(".connectedSortable").sortable({
            revert: true
        }); 
      
      
       $('#topcate_sub').change(function() {
              var top_category_id = $('#topcate_sub').find(':selected').data('id');
              $.ajax({
               type:'POST',
               url:'/dayselectTop',
               data:{"top_category_id" : top_category_id},
               success:function(response){
                  
                   
                  var sub = "";
                  for(var i=0; i<response.length;i++){
                     if(i==0){
                        sub+="<option data-subcategory="+response[i].sub_category_id+" >"+response[i].name+"</option>";
                     }else{
                        sub+="<option data-subcategory="+response[i].sub_category_id+">"+response[i].name+"</option>";
                     }
                  }
                  $('#subcate_sub').html(""+sub+"");
                  classact();
               }
            });
              
          });
       
      //검색어 입력하자마자 관련유사어 도시 검색할때
      
      $('#input_search').keyup(function(){
         var searchCity = $('#input_search').val();
         $.ajax({
            type:'POST',
            url:'/inputsearch',
            data:{"name":searchCity},
            success:function(response){
               var sub="";
               //검색어가 아무것도 없다면... 다시 도시에 관한것만 나오게
               if(searchCity==""){
                  
               }
               //검색어가 입력되고 있을때
               for(var i=0; i<response.length;i++){
               
                   sub+="<input type=\"hidden\" city_id="+response[i].city_id+">"+
                   "<div style=\"height:128px;\" class=\"day_spot_item ui-draggable\" name="+response[i].name+" longitude="+response[i].longitude+" latitude="+response[i].latitude+" place_id="+response[i].place_id+" data=\"0\" data-set_day=\"0\" data-rel_srl=\"6662\" data-pl_type=\"0\" data-no="+i+" data-pl_cat=\"301\" data-ci=\"310\">"+
                   "<div class=\"img_box fl\" >"
                   +"<img src=https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference="+response[i].image+"&key=AIzaSyAMbeNVdxJghsGGfBjDJwHPqYXXqgb-D0E>"
                   +"</div>"+
                   "<div class=\"fl info_box\">"+
                      "<div class=\"title\">"+response[i].name+"</div>"+
                      "<div class=\"sub\">"+response[i].sub_category_id+"</div>"+
                      "<div class=\"sub\" style=\"height:42px;\">"+
                         "<div class=\"tooltip_clip_cnt fl\">"+response[i].good+"</div>"+
                         "<div class=\"tooltip_clip_cnt fl\"></div>"+
                         "<div class=\"tooltip_review_rate fl\"></div>"+
                         "<div class=\"clear\"></div>"+
                      "</div>" +
                      "<div class=\"sub include_pn_day\" style=\"color:#1a7ad9\"></div>"+
                   "</div>"+
                   "<div class=\"spot_to_inspot\"  data-id="+response[i].place_id+" sub-category-id="+response[i].sub_category_id+" data-name="+name+" ><img style=\"width:20px; height:20px;\"src=\"/resources/img/plan/addspot.png \"></div><div class=\"clear\"></div></div>";
                }
                $('#locList').html(""+sub+"");
                classact();
            }
         });
      });

   });
   
     function addClick(){
      var name = $(this).attr(name);
      var name = 
      $.ajax({
         type:'POST',
         url:'/addSpot',
         data:{"name":name},
         success:function(response){
            
         }
      });
      
      
    } 
   
   //상위카테고리 클릭이벤트 구현
   $(function(e){
      $('#map_tag_select_box').click(function(){
          var container = $(".et_slide");
          var _parent_sel_box = $(e.target).attr('id');
         if($('#map_tag_select_box').attr('data-is_open')=="0"){
             container.slideUp(300);
             $('.et_slide_parent').attr('data-is_open','1');
         }else if($('#map_tag_select_box').attr('data-is_open')=="1"){
            $('.et_slide_parent').removeClass('on');
             container.slideDown(300);
             $('.et_slide_parent').attr('data-is_open','0');
         }
      });
   
      

      
      //하위 카테고리 선택시 여행지 리스트가 해당되는것만 나옴
      $('#subcate_sub').change(function() {
         //서브카테고리 아이디, 시티 아이디가 필요함.
              var sub_category_id =$('#subcate_sub').find(':selected').data('subcategory');
            var city_id = $('#city_name').attr('city-id');
             var parameter = []
              $.ajax({
               type:'POST',
               url:'/selSubcategoryLocList',
               data:{"city_id":city_id, "sub_category_id":sub_category_id},
               success:function(response){
                  
                   var sub="";
                   if(response.length==0){
                      sub="<div style=\"height:128px;\" class=\"day_spot_item ui-draggable\"  data=\"0\" data-set_day="+day+" data-rel_srl=\"6662\" data-pl_type=\"0\" data-no=\"0\" data-pl_cat=\"301\" data-ci=\"310\">"+
                      "<div class=\"img_box fl\" ></div>"+
                      "<div class=\"fl info_box\">"+
                         "<div class=\"title\">검색결과가 없습니다.</div>"+
                         "<div class=\"sub\"></div>"+
                         "<div class=\"sub\" style=\"height:42px;\">"+
                            "<div class=\"tooltip_clip_cnt fl\"></div>"+
                            "<div class=\"tooltip_clip_cnt fl\"></div>"+
                            "<div class=\"tooltip_review_rate fl\"></div>"+
                            "<div class=\"clear\"></div>"+
                         "</div>" +
                         "<div class=\"sub include_pn_day\" style=\"color:#1a7ad9\"></div>"+
                      "</div>"+
                      "<div class=\"spot_to_inspot\" onclick=\"addClick()\"  sub-category-id="+response[i].sub_category_id+" data-name="+response[i].name+"></div><div class=\"clear\"></div></div>";
                   }
                   for(var i=0; i<response.length;i++){
                      sub+="<input type=\"hidden\" city_id="+response[i].city_id+">"+
                      "<div style=\"height:128px;\" class=\"day_spot_item ui-draggable\" name="+response[i].name+" longitude="+response[i].longitude+" latitude="+response[i].latitude+" place_id="+response[i].place_id+" data=\"0\" data-set_day=\"0\" data-rel_srl=\"6662\" data-pl_type=\"0\" data-no="+i+" data-pl_cat=\"301\" data-ci=\"310\">"+
                      "<div class=\"img_box fl\" >" 
                      +"<img src=https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference="+response[i].image+"&key=AIzaSyAMbeNVdxJghsGGfBjDJwHPqYXXqgb-D0E>"
                     + "</div>"+
                      "<div class=\"fl info_box\">"+
                         "<div class=\"title\">"+response[i].name+"</div>"+
                         "<div class=\"sub\">"+response[i].sub_category_id+"</div>"+
                         "<div class=\"sub\" style=\"height:42px;\">"+
                            "<div class=\"tooltip_clip_cnt fl\">"+response[i].good+"</div>"+
                            "<div class=\"tooltip_clip_cnt fl\"></div>"+
                            "<div class=\"tooltip_review_rate fl\"></div>"+
                            "<div class=\"clear\"></div>"+
                         "</div>" +
                         "<div class=\"sub include_pn_day\" style=\"color:#1a7ad9\"></div>"+
                      "</div>"+
                      "<div class=\"spot_to_inspot\" onclick=\"addClick()\" sub-category-id="+response[i].sub_category_id+" data-name="+response[i].name+"><img style=\"width:20px; height:20px;\"src=\"/resources/img/plan/addspot.png \"></div><div class=\"clear\"></div></div>";
                   }
                   $('#locList').html(""+sub+"");
                   classact();
               }
            });
              
          });
      
      //도시 선택했을때 여행지 리스트 나오는 함수.
      $('.list_title_option_menu').click(function(){
    	 
    	  
    	  // $('#myModal').fadeToggle();
         
           
      });
      
   });
   
   
</script>
 <script async defer
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC6rZnP1jhdyQEEje0CSjX-V_v8UouCqi0&libraries=places&callback=initMap">
</script>    
</head>
<body>
   
   <input type="hidden" id="FromDay" value="${sessionScope.startDay }" > 
   <div id="header">   
   <div style="width:100%;">
      <div class="fl" style="width:357px;border-right:solid #ebebeb 1px;height:62px">
         <div class="fl" id="plan_title" style="background-color: rgb(255, 255, 255);">${sessionScope.title }</div>   <!-- 일정제목 -->
         <div class="clear"></div>
      </div>
      <div class="fr gnb_box">
         <div class="fr" style="margin-top:9px;margin-right:20px;">
            <div class="fl" id="plan_member_list_box">
               <a class="fl" style="margin-right:5px;background:#e5e5e5;border-radius: 20px;width:40px;height:40px;" original-title="이아영"> <!-- 초대된사람이름적기 -->
                  <div class="tooltip" title="test">
                     <img src="/resources/img/plan/user.png" style="width:40px;height:40px;border-radius:20px;">
                  </div>
               </a>
               <a class="fl" style="margin-right:5px;background:#e5e5e5;border-radius: 20px;width:40px;height:40px;" original-title="이상운"> <!-- 초대된사람이름적기 -->
                  <img src="/resources/img/plan/user.png" style="width:40px;height:40px;border-radius:20px;">
               </a>
            </div>
            <div class="fl" style="margin-right:10px;margin-top:3px;cursor:pointer;"  id="ws_invite_btn" original-title="친구 초대">
               <img src="/resources/img/plan/useradd.png" style="width:40px;height:40px;border-radius:20px;">
            </div>
            <div class="fl" id="plan_out_btn">저장&amp;닫기</div>
            <div class="fl" id="plan_complete_btn">완료</div>
            <div class="clear"></div>
         </div>
         <div class="clear"></div>
      </div>
      </div>
      <div class="clear"></div>
      
   </div>

   <div id="full_wrap" style="width: 100%; height: 588px;">
   <div class="fl left_full_box">
   <div class="fl">   <!-- 가장왼쪽 DIV시작 -->
      <ul id="pn_title_box" >                                                               <!-- 11시방향 div시작. -->
         <li data="pn_date">
            <div class="full_date_info fl"></div>                              <!-- 좌측 상단 여행전체일자 -->
            <!-- <div class="fl day_edit_start_btn" onclick="day_edit_start()">EDIT</div>      수정버튼 -->
         </li>
      </ul>
      
      <ul id="cat_menu" style="max-height: 418px;">
         <li id="show_all_day" >전체 일정 보기</li>
         
      </ul>
      
      <!-- Day추가하기 버튼 -->
      <ul id="cat_add_box" style="width: 160px;" background: rgb(32, 51, 65); color: rgb(255, 255, 255); height: 118px;">
         <li style="padding-top:15px;">
            <div id="dayAdd" style="width:124px;height:32px;line-height:32px;border:solid 1px #fff;text-align:center;margin:0 auto;cursor:pointer;"> DAY 추가</div>
         </li>
      </ul>
      
   </div>   <!-- 가장 왼쪽 DIV END -->
   
   <!-- 왼쪽에서 2번째 Div Start -->
   <div class="fl" id="schedule_full_box" style="width:265px" data="0">
        
        <div class="title_box">   <!-- Day1 | 06.14설명 -->
        
          <div id="schedule_detail_title" data-date="06-14" style="display: block;">
                  <div class="clear"></div>
          </div>
      </div>
   
      <div id="day_controll_btn_box">
          <div id="day_optimize_btn" class="fl" onclick="optimize_route()">경로최적화</div>
          <div class="clear"></div>
      </div>
       </div>
      
      <div class="clear"></div>
   </div>
   
   <!-- 검색창 시작 -->
   <div id="right_full_box" class="fl" style="position: absolute; left: 425px; top: 66px; width:auto;"> <!-- width 유동적으로바꿀것. -->
   
<div id="on_city_open_btn"></div>
   <div id="city_list" data="310">         <!-- 도시변경클릭시 Start -->
            <div class="list_title" style="padding-left: 15px;">
               <span id="city_name" city-id="627">Toscana</span>
               <div class="list_title_option_menu" data-toggle="modal" data-target="#myModal">도시 변경</div>
            </div>

            <div id="on_city_close_btn"></div>
      <div class="clear"></div>
      <div class="city_change_box">
         <div class="city_text_search_box">
               <input type="text" class="city_text_search_input" id="city_search_key">
            </div>
         <div class="city_search" style="display: none;"></div>
         <div class="city_items" data="310">
            <div class="city_item" data="310" data-ci_name="서울" data-lat="37.56653500" data-lng="126.97796920" data-ss_id="undefined">
               <div class="fl ci_img">
                  <img src="http://img.earthtory.com/img/city_images/310/seoul_1425373106.jpg">
               </div>
               <div class="fl">서울,&nbsp;<span>대한민국</span></div>
               <div class="clear"></div>
            </div>
            <div class="clear"></div>
            
            <div style="width:100%;height:25px;border-bottom:solid 1px #cacaca;"></div>
            <!-- 서울 인근도시 검색시 나오는 목록 출력 Start -->
            <div class="city_item_title">서울 인근 도시</div>
            <div class="city_item" data="10907" data-ci_name="구리시" data-lat="37.59431240" data-lng="127.12956460" data-ss_id="">
               <div class="fl ci_img">
                  <img src="http://mw2.google.com/mw-panoramio/photos/medium/3566456.jpg">
               </div>
               <div class="fl">구리시,&nbsp;<span>대한민국</span></div>
               <div class="clear"></div>
            </div>
            <div class="clear"></div>
            <!-- 인근도시 검색시 나오는 목록 End   반복문 -->
            
            <div class="clear"></div>
         </div>
         <div class="clear"></div>
      
      <div class="modal fade" role="dialog" id="myModal"> 
      <div class="modal-dialog">
      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <input type="text" placeholder="여행 제목 입력" id="tourTitle" value="">
	        </div>
	        <div class="modal-body">
	           <p>dddd</p>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	          <input type="button" class="btn btn-primary"  id="PlanStart" value="여행시작하기">
	        </div>
		      </div>
	    </div>
  </div>
      
      </div>
      
   
   <!-- 장소검색 Start -->
   <div class="list_search_full_box">
               <div class="list_search_box"
                  style="padding-top: 0px; border-bottom-width: 0px; height: 60px;">
                  <input type="text" id="input_search" placeholder="장소 검색" value="">
                  <div style="margin-left: 20px; margin-top: 5px;">
                     <span type="radio" class="radio on" data-val="city" data-on="on"
                        data-name="search_type" style="color: #808080"><span
                        class="et-radio" style="width: 30px;">&nbsp;</span><span
                        class="et-radio_txt">도시내 검색&nbsp;&nbsp;&nbsp;&nbsp;</span></span> <span
                        type="radio" class="radio" data-val="total"
                        data-name="search_type" style="color: #808080" data-on="off"><span
                        class="et-radio">&nbsp;</span><span class="et-radio_txt">전체검색</span></span>
                     <input type="hidden" name="search_type" id="search_type"
                        class="news" value="city">
                  </div>
               </div>
               <div class="list_category_box"
                  style="padding-top: 0px; height: 150px;">
                  <div class="list_tag_box" style="height: 40%">
                     <label for="sel5">상위 카테고리</label> <select class="form-control"
                        id="topcate_sub">
                        <c:forEach var="topcate" items="${topList }">
                           <option data-id="${topcate.getTop_category_id() }">${topcate.getName() }</option>
                        </c:forEach>
                     </select>
                  </div>

                  <div class="clear"></div>
                  <br>

                  <div class="list_tag_box" style="height: 40%">
                     <label for="sel5">하위카테고리</label> <select class="form-control"
                        id="subcate_sub">
                     </select>
                  </div>

               </div>
            </div>
    <!-- 장소검색 END -->
     
     
        <!-- 검색 결과 Start -->
         <div class="list_box_overlay"></div>
      <div id="locList" class="list_box connectedSortable" style="height: 100%;">
      </div> 
      <!-- 검색결과 종료 -->
   </div>
   <!-- 검색창 종료 -->


      <!-- 지도시작 -->
   <div id="map" class="fl" style="height: 598px; position: relative; width: 1500px; overflow: hidden;">
           <iframe width="100%" height="100%" scrolling="no" frameborder="0"
     style="border: 0"
     allowfullscreen>
     </iframe>
      </div>    
   </div>

      </div>
   
   <div class="clear"></div>
   </div>
   
   
</body>
</html>