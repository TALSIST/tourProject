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
	Shadowbox.init({
	    players:['iframe']
	    });
	
	$(function(){
	      $('#comm1').click(function(){
	         alert("1.경로추천 박스 누름");
	         Shadowbox.open({
	            content:"routecommend.do",
	            player:'iframe',
	            title:'경로추천',
	            width:500,
	            height:600
	         });
	      });
	      $('#plan_complete_btn').click(function(){
	         alert("완료버튼 누름");
	         Shadowbox.open({
	            content:"complete.do",
	            player:'iframe',
	            title:'완료창',
	            width:500,
	            height:600
	         });
	      });
	   }); 
	   
	   function initMap(p) {
	      console.log("p는?"+p);
	      var place;
	      if(p==undefined||p==null){
	         console.log("p는 null?"+p);
	          place = [
	                         ['가로수길', 37.5206974,127.0225605, 10],
	                         ['북촌한옥마을',37.5793998,126.9802342, 10]
	                       ]; 
	      }else
	      {   console.log("p는 full?"+p);
	         place = p;
	         console.log("place는?"+place);
	      }
	         console.log("lat값?"+place[0][1]+",lng값?"+place[0][2])
	          var map = new google.maps.Map(document.getElementById('map'), {
	                zoom: 10,
	                center: {lat: parseFloat(place[0][1]), lng: parseFloat(place[0][2])}
	           });

	           for (var i = 0; i < place.length; i++){
	               
	               var plc = place[i];   
	               console.log("for문안에서도는 plc는?"+plc);
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
			console.log('dd');
			var name = $(this).attr('data-name');
			var place_id = $(this).attr('data-id');
			var sub_category_id = $(this).attr('sub-category-id');
			console.log(place_id + "              " + sub_category_id+"             "+name); 		
			$.ajax({
				type:'POST',
				url:'/addSpot',
				data:{"sub_category_id" : sub_category_id,	"place_id":place_id},
				success:function(response){
					var sub=" <div class=\"day_spot_item\" data=\"1\" data-set_day=\"1\" place_id="+response[0].place_id+" latitude="+response[0].latitude+" longitude="+response[0].longitude+" >"
					+"<div class=\"item_ctrl_box\" style=\"display: none;\">"
			        +"<div class=\"fl btn_del\" title=\"삭제\">"
			        +"<img src=\" /resources/img/plan/remove.png \">"
			        +"</div>"
			        +"<div class=\"clear\"></div>"
		        	+"</div>"
		        	+"<div class=\"img_box fl \">"
			        +"<div class=\"spot_order_box\">1</div>"
			        +"<img src="+response[0].image+">"
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
					
					$('#schedule_detail_box').append(sub);
					sub="";
					
					
				}, error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			
				}
				
				
				
			}); 
			
		});
	}
	
	
	$(document).ready(function(){
		var temp = ${sessionScope.startDay};
		var temp2 = ${sessionScope.endDay};
		
		var startSeconds =new Date(temp);
		alert("startSeconds          " + startSeconds);
		var endSeconds =new Date(temp2);
		alert("endSeconds          " + endSeconds);
		/* var startDate = startSeconds.getTime();
		alert("startDate      "+startDate);
		var EndDate=endSeconds.getTime();
		alert("EndDate              "+ EndDate); */
		var tempDate=new Date();
		var btMs = temp2 - temp ;
	    var btDay = btMs / (1000*60*60*24) ;
		//console.log(btDay);
		console.log(tempDate);
		console.log(btMs + "       ");
		console.log(btDay + "       ");
		
		var week = new Array('일','월','화','수','목','금','토');
	
		
		//day추가버튼시 클릭 이벤트 구현
		//이건 실제로 레디될때..구현되야할 기능이고.. .나중에 추가누르면 append시키면됨;;
		$('#dayAdd').click(function(){
			var createDay="";
			createDay+="<li id=\"show_all_day\" >전체 일정 보기</li>";
			for(var i=0; i<btDay+1;i++){
			tempDate.setDate(startSeconds.getDate()+i);
			createDay+="<li data=\"1\" data-date=\"06.14\" data-day_week=\"3\" original-title=\"서울\">"
			         +"<div class=\"fl cat_date_left_box\">"   
		            +"<div class=\"cat_left_day\">DAY"+(i+1)+"</div>"
		            +"<div class=\"cat_left_date\">"+(tempDate.getMonth()+1)+" 월 "+(tempDate.getDate())+" 일</div>"
		         +"</div>"
		         +"<div class=\"fl cat_date_right_box\">"
		            +"<div class=\"cat_right_weekday\">"+week[tempDate.getDay()]+"요일</div>"
		            +"<div class=\"cat_right_city\">서울</div>"
		         +"</div>"
		         +"<div class=\"clear\"></div>"
		      +"</li>";
		      
		      
			}
			$('#cat_menu').html(createDay);
			$('#schedule_detail_box').html();
			
		});
		
		$('#cat_menu').sortable();
		
		$(".connectedSortable").sortable({
            revert: true
        }); 
		 $('#topcate_sub').change(function() {
		        var top_category_id = $('#topcate_sub').find(':selected').data('id');
		        console.log("topID = "+top_category_id);
		        $.ajax({
					type:'POST',
					url:'/dayselectTop',
					data:{"top_category_id" : top_category_id},
					success:function(response){
						alert(JSON.stringify(response));
						 console.log(response[0].top_category_id);
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
			console.log(searchCity);
			$.ajax({
				type:'POST',
				url:'/inputsearch',
				data:{"name":searchCity},
				success:function(response){
					console.log(JSON.stringify(response));
					var sub="";
					//검색어가 아무것도 없다면... 다시 도시에 관한것만 나오게
					if(searchCity==""){
						
					}
					//검색어가 입력되고 있을때
					for(var i=0; i<response.length;i++){
					
						 sub+="<input type=\"hidden\" city_id="+response[i].city_id+">"+
						 "<div style=\"height:128px;\" class=\"day_spot_item ui-draggable\" name="+response[i].name+" longitude="+response[i].longitude+" latitude="+response[i].latitude+" place_id="+response[i].place_id+" data=\"0\" data-set_day=\"0\" data-rel_srl=\"6662\" data-pl_type=\"0\" data-no="+i+" data-pl_cat=\"301\" data-ci=\"310\">"+
						 "<div class=\"img_box fl\" > <img src="+response[i].image+"></div>"+
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
						 "<div class=\"spot_to_inspot\"  sub-category-id="+response[i].sub_category_id+" data-name="+name+" ><img style=\"width:20px; height:20px;\"src=\"/resources/img/plan/addspot.png \"></div><div class=\"clear\"></div></div>";
					 }
					 $('#locList').html(""+sub+"");
					 classact();
				}
			});
		});
	});
	
 	 function addClick(){
		console.log('img Click');
		var name = $(this).attr(name);
		console.log(name);
		var name = 
		$.ajax({
			type:'POST',
			url:'/addSpot',
			data:{"name":name},
			success:function(response){
				console.log(response);
				
				
				
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
	
		
		
		
		//하위카테고리 클릭이벤트 구현	
		$('#map_subcate_select_box').click(function(){
			/*  var container = $(".et_slide2");
			 var _parent_sel_box = $(e.target).attr('id');
			 //open
			if($('#map_subcate_select_box').attr('data-is_open')=="0"){
				 $('.et_slide_parent2').attr('data-is_open','1');
				 container.slideUp(300);
			}else if($('#map_subcate_select_box').attr('data-is_open')=="1"){	//Close
				$('.et_slide_parent2').removeClass('on');
				 $('.et_slide_parent2').attr('data-is_open','0');
				 container.slideDown(300);
			} */
		});
		
		
		//하위 카테고리 선택시 여행지 리스트가 해당되는것만 나옴
		$('#subcate_sub').change(function() {
			//서브카테고리 아이디, 시티 아이디가 필요함.
		        var sub_category_id =$('#subcate_sub').find(':selected').data('subcategory');
				var city_id = $('.list_title span').attr('city-id');
		        console.log("sub = "+sub_category_id);
		        console.log("city-id=" + city_id);
		       var parameter = []
		        $.ajax({
					type:'POST',
					url:'/selSubcategoryLocList',
					data:{"city_id":city_id, "sub_category_id":sub_category_id},
					success:function(response){
						alert(JSON.stringify(response));
						 var sub="";
						 if(response.length==0){
							 sub="<div style=\"height:128px;\" class=\"day_spot_item ui-draggable\"  data=\"0\" data-set_day=\"0\" data-rel_srl=\"6662\" data-pl_type=\"0\" data-no=\"0\" data-pl_cat=\"301\" data-ci=\"310\">"+
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
							 "<div class=\"img_box fl\" > <img src="+response[i].image+"></div>"+
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
			console.log($('.list_title span').attr('city-id'));
			 $.ajax({
				 type:'POST',
				 url:'/getLocationList',
				 data:{"city_id":$('.list_title span').attr('city-id')},
				 success:function(response){
					 console.log(response[0].name);
					 var sub="";
					 for(var i=0; i<response.length;i++){
						 sub+="<input type=\"hidden\" city_id="+response[i].city_id+">"+
						 "<div style=\"height:128px;\" class=\"day_spot_item ui-draggable\" name="+response[i].name+" longitude="+response[i].longitude+" latitude="+response[i].latitude+" place_id="+response[i].place_id+" data=\"0\" data-set_day=\"0\" data-rel_srl=\"6662\" data-pl_type=\"0\" data-no="+i+" data-pl_cat=\"301\" data-ci=\"310\">"+
						 "<div class=\"img_box fl\" > <img src="+response[i].image+"></div>"+
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
					 classact();
				 }
			 }); 
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
			<div class="fl" id="plan_title" style="background-color: rgb(255, 255, 255);">${startDate }</div>	<!-- 일정제목 -->
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
	<div class="fl">	<!-- 가장왼쪽 DIV시작 -->
	   <ul id="pn_title_box" >                                                               <!-- 11시방향 div시작. -->
	      <li data="pn_date">
	         <div class="full_date_info fl">06.14~06.17</div>                              <!-- 좌측 상단 여행전체일자 -->
	         <div class="fl day_edit_start_btn" onclick="day_edit_start()">EDIT</div>      <!-- 수정버튼 -->
	      </li>
	   </ul>
	   
	   <ul id="cat_menu" style="max-height: 418px;">
	      <li id="show_all_day" >전체 일정 보기</li>
	      <li data="1" data-date="06.14" data-day_week="3" class="on" original-title="서울">
	         <div class="fl cat_date_left_box">   
	            <div class="cat_left_day">DAY1</div>
	            <div class="cat_left_date">06.14</div>
	         </div>
	         <div class="fl cat_date_right_box">
	            <div class="cat_right_weekday">수요일</div>
	            <div class="cat_right_city">서울</div>
	         </div>
	         <div class="clear"></div>
	      </li>
	      
	      
	   </ul>
	   
	   <!-- Day추가하기 버튼 -->
	   <ul id="cat_add_box" style="width: 160px;" background: rgb(32, 51, 65); color: rgb(255, 255, 255); height: 118px;">
	      <li style="padding-top:15px;">
	         <div id="dayAdd" style="width:124px;height:32px;line-height:32px;border:solid 1px #fff;text-align:center;margin:0 auto;cursor:pointer;"> DAY 추가</div>
	      </li>
	   </ul>
	   
	</div>	<!-- 가장 왼쪽 DIV END -->
	
	<!-- 왼쪽에서 2번째 Div Start -->
	<div class="fl" id="schedule_full_box" style="width:265px" data="0">
	     
	     <div class="title_box">	<!-- Day1 | 06.14설명 -->
	     
	       <div id="schedule_detail_title" data-date="06-14" style="display: block;">
	               <div class="fl schedule_detail_title_text" style="width:245px;padding-left:10px;font-size:15px;">
		               	<div class="fl">DAY1 <span style="color:#999999">|</span> 06.14(수요일)</div>
		               	<div class="fl day_reset_btn"></div>		<!-- 해당날짜 여행지 Reset -->
		               	<div class="fr day_next_btn"></div>			<!-- 다음날짜 -->
		               	<div class="fr day_prev_btn"></div>			<!-- 이전날짜 -->
	              		<div class="clear"></div>
	               	</div>
	               <div class="clear"></div>
	       </div>
		</div>
	
		<div id="day_controll_btn_box">
		    <div id="day_optimize_btn" class="fl" onclick="optimize_route()">경로최적화</div>
		    <div class="clear"></div>
		</div>
	
	        <!--//(s)스케쥴 디테일 리스트-->
	        <div id="schedule_detail_box" class="connectedSortable ui-sortable" style="height: 447px; display: block;">
		        <div class="day_spot_item" data="1" data-set_day="1" data-rel_srl="6659" data-pl_type="0" data-no="0" data-pl_cat="400" data-latlng="37.57000700,126.99927500" data-ci="310">
			        <div class="item_ctrl_box" style="display: none;">
				        <div class="fl btn_del" title="삭제">
				        	<img src="/res/img/workspace/new/item_del_icon_a.png">
				        </div>
				        <div class="clear"></div>
			        </div>
			        <div class="img_box fl">
				        <div class="spot_order_box">1</div>
				        <img src="http://img.earthtory.com/img/place_img/310/6659_0_et.jpg">			<!-- 관광지 이미지 입력 -->
			        </div>
			        <div class="fl info_box">
				        <div class="title">광장시장</div>
				        <div class="sub">시장/쇼핑거리, 식당가/푸드코트</div>
				        <div class="sub inspot_day_info_box" style="color:#1a7ad9">
				        </div>
			        </div>
			        <div class="clear"></div>
		        </div>
		        <!-- 반복구간...1번째 아닌경우..			데이터 순서				관광지가는날																							 -->
		        <div class="day_spot_item" data="2" data-set_day="1" data-rel_srl="6725" data-pl_type="0" data-no="1" data-pl_cat="301" data-ci="310">
			        <div class="item_ctrl_box" style="display: none;">
				        <div class="fl btn_del" title="삭제">
				        	<img src="/res/img/workspace/new/item_del_icon_a.png">
				        </div>
				        <div class="clear"></div>
			        </div>
			        
			        <div class="spot_distance_box">			<!-- 두 관광지간 사이 거리 나타내는곳 -->
			        	<a id="comm1">1.경로추천</a>
			        </div>
			        <div class="img_box fl">
				        <div class="spot_order_box">2</div>
				        <img src="http://img.earthtory.com/img/place_img/310/6725_0_et.jpg">
				        <div style="position:absolute;top:35px;left:40px;width:22px;height:20px;">
				        	<img src="/res/img/workspace/list_memo_btn_off.png" class="memo_indi" style="width:22px;height:20px;">
				        </div>
			        </div>
			        <div class="fl info_box">
				        <div class="title">북촌 한옥 마을</div>
				        <div class="sub">유명한거리/지역</div>
				        <div class="sub inspot_day_info_box" style="color:#1a7ad9"></div>
			        </div>
			        <div class="clear"></div>
		        </div>
		        
		        <div class="day_spot_item" data="2" data-set_day="1" data-rel_srl="6725" data-pl_type="0" data-no="1" data-pl_cat="301" data-latlng="37.57903300,126.98640400" data-ci="310">
			        <div class="item_ctrl_box" style="display: none;">
				        <div class="fl btn_del" title="삭제">										<!-- 삭제버튼 넣어야함. -->
				        	<img src="/res/img/workspace/new/item_del_icon_a.png">
				        </div>
				        <div class="clear"></div>
			        </div>
			        
			        <div class="spot_distance_box">
			        	1.51Km 추천경로
			        </div>
			        <div class="img_box fl">
				        <div class="spot_order_box">2</div>
				        <img src="http://img.earthtory.com/img/place_img/310/6725_0_et.jpg">
				        <div style="position:absolute;top:35px;left:40px;width:22px;height:20px;">
				        	<img src="/res/img/workspace/list_memo_btn_off.png" class="memo_indi" style="width:22px;height:20px;">
				        </div>
			        </div>
			        <div class="fl info_box">
				        <div class="title">북촌 한옥 마을</div>
				        <div class="sub">유명한거리/지역</div>
				        <div class="sub inspot_day_info_box" style="color:#1a7ad9"></div>
			        </div>
			        <div class="clear"></div>
		        </div>
	      </div>
	
	
	    </div>
	   
	   <div class="clear"></div>
	</div>
	
	<!-- 검색창 시작 -->
	<div id="right_full_box" class="fl" style="position: absolute; left: 425px; top: 66px; width:auto;"> <!-- width 유동적으로바꿀것. -->
	
<div id="on_city_open_btn"></div>
	<div id="city_list" data="310">			<!-- 도시변경클릭시 Start -->
				<div class="list_title" style="padding-left: 15px;">
					<span city-id="627">Toscana</span>
					<div class="list_title_option_menu" data-is_open="off">도시 변경</div>
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
			<!-- 검색결과 1개 Start -->
			<div style="height:128px;" class="day_spot_item ui-draggable" data="0" data-set_day="0" data-rel_srl="6662" data-pl_type="0" data-no="0" data-pl_cat="301" data-ci="310">
				
				<div class="img_box fl">
					<img src="http://img.earthtory.com/img/place_img/310/6662_0_et.jpg">
				</div>
				<div class="fl info_box">
					<div class="title">가로수길</div>
					<div class="sub">유명한거리/지역, 시장/쇼핑거리</div>
					<div class="sub"><div class="tooltip_clip_cnt fl">409</div>
					<div class="tooltip_cnt_line fl"></div>
					<div class="tooltip_review_rate fl">9.4</div>
					<div class="clear"></div>
					</div>
					<div class="sub include_pn_day" style="color:#1a7ad9"></div>
				</div>
				<div class="spot_to_inspot" data-name="ddddd">
					<img data-name="ddd" src="/resources/img/plan/addspot.png" style="width:20px; height:20px;">
				</div>
				<div class="clear"></div>
			</div>
			<!-- 검색결과 1개 End -->
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
	<!-- 장소 상세보기 클릭시 설명나옴 -->
   <!-- <div id="select_detail_view_spot" data="6659" data-no="0" data-cat="400" data-only_clip="1" data-clip_yn="y" class="visible" style="left: 0px; display: block;"><div class="detail_view_full_box"><div id="detail_spot_to_inspot" data-ci="310" data-rel_srl="6659" data-pl_type="0">+일정에 추가</div><div id="detail_close_btn"></div><a class="spot_title" href="/ko/city/seoul_310/shopping/gwangjang-market_6659" target="_blank">광장시장</a><div class="spot_img"><div class="detail_img_overlay"></div><img src="http://img.earthtory.com/img/place_img/310/6659_0_et.jpg"><div class="spot_cnt_box"></div></div><div id="detail_content" style="height: 356px;"><div class="info_first"><div class="in_full_box"><div class="info_memo"><div style="font-size:15px;color:#363636;font-weight:bold;text-align:left;padding-bottom:10px;padding-left:8px;">예산</div><div style="padding-left:10px;padding-bottom:15px;"><div id="budget_currency_select_list"><div data="KRW">KRW</div><div data="USD">USD</div></div><div id="budget_currency" data="KRW" class="fl">KRW</div><div class="fl"><input type="text" class="budget_input" placeholder="0" onkeyup="return isNumberKey(event)"></div><div class="clear"></div></div><div style="font-size:15px;color:#363636;font-weight:bold;text-align:left;padding-bottom:10px;padding-left:8px;">메모</div><textarea id="memo_input" data-type="inspot" data-set_day="1" data-set_order="1" data-pl_type="0"></textarea><div id="memo_save">저장</div></div></div><div class="in_full_box"><div style="line-height:22px;font-size:11px;color:#808080;padding-bottom:20px;font-size:13px;"><img src="/res/img/workspace/new/tip_desc_icon.png" style="vertical-align:top;"> 광장시장은 최초의 상설시장이면서 1904년 동대문시장이라는 이름으로 출발했으며 이전에는 한복과 포목등을 주로 판매하였으나 지금은 원단과 패션 부자재를 주로 판매하는 곳으로 패션업계에 종사하는 사람들이 많이 찾는 곳이며 구제품을 구입하고자 하는 사람들도 많이 찾는다 그 외에도 다른 재래시장과 달리 먹거리가 다양하고 맛있어 쇼핑을 위해 찾는 사람들 못지 않게 음식을 즐기기 위해 찾는 사람 또한 많이 있다 저녁이 되면 보기만 해도 군침이 흐르는 다양한 종류의 음식들이 줄지어 가게를 이루고 있으며 서민적인 먹거리들로 가득하다 광장시장에서도 유난히 사람들이 많이 찾는 곳으로 순희네빈대떡, 복민횟집, 마약김밥 등이 있으며 광장시장을 오랫동안 지키며 전통을 이어가고 있다 </div><div class="information"><div style="width:100%;padding:15px;border:solid #d4d4d4 1px;"><div style="color:#808080;font-size:13px;padding-left:20px;background:url('/res/img/workspace/new/addr_desc_icon.png') no-repeat 2px 2px;line-height:16px;padding-bottom:10px;">269-39 Yeji-dong, Jongno-gu, Seoul, South Korea</div><div class="sub_title fl">카테고리</div><div class="sub_info fl">식당가/푸드코트, 시장/쇼핑거리</div><div class="clear"></div><div class="sub_title fl">영업시간</div><div class="sub_info fl">월~토 - 09:00~18:00<br></div><div class="clear"></div><div class="sub_title fl">홈페이지</div><div class="sub_info fl"><a href="http://www.kwangjangmarket.co.kr" target="_blank">http://www.kwangjangmarket.co.kr</a></div><div class="clear"></div><div id="fq_attr_box"></div><div id="fq_open_box"></div><div class="clear"></div></div><div class="sub_desc"></div></div><div class="clear"></div></div></div><div class="info_second"><div class="info_section_line"></div><div class="in_full_box"><div id="review_title_box" style="font-size:15px;color:#363636;font-weight:bold;padding-bottom:10px;" class="fl">리뷰</div><div class="map_review_w_btn fr" onclick="et_modal('548px','352px','1','0','/ko/modal/review?pl_srl=6659','2','1');">리뷰쓰기</div><div class="clear"></div><div id="review_item_box"><div class="cmmt_content_box"><div class="cmmt_c_user"><img src="http://graph.facebook.com/1108963139175010/picture?type=large" class="cmmt_content_uimg"><div class="cmmt_c_user_txt"><div class="cmmt_c_user_name">송준일<span>&nbsp;&nbsp;2016-06-14 21:40:50</span><div class="clear"></div></div><div class="cmmt_c_user_level"><img src="http://earthtory.com/res/img/common/web/mgrade_8_ko.png" alt=""><div class="rv_cnt">2개의 평가</div><div class="clear"></div></div></div><div class="clear"></div></div><div class="cmmt_content"><div class="cmmt_content_info"><span>좋아요!</span></div>asdsadsa<div class="cmmt_content_bottom"><div class="clear"></div></div></div></div><div class="clear" style="height:10px;width:1px;"></div></div><div class="clear"></div></div></div><div class="info_third" style="padding-top:30px;"><div style="font-size:15px;color:#363636;font-weight:bold;padding-bottom:10px;padding-left:20px;">블로그</div><a href="http://blog.naver.com/pianocl?Redirect=Log&amp;logNo=221030827704" target="_blank"><div class="in_full_box"><div class="blog_item"><div class="blog_title" style="font-size:15px;color:#1a7ad9;padding-bottom:5px;font-weight:bold;line-height:20px;">서울 광장시장- 누드김밥과 잡채.../원조누드치즈김밥</div><div style="font-size:12px;color:#363636;line-height:20px;">아니 오히려 더 정감있고 저렴한 가격의 좋은 김밥이지요 오랫동안 성업 하시길 바라며 매력있는 사장님, 다음에 또 뵙겠습니다. 연락처: ***-****-**** 주소: 서울 종로구 예지동 2-1 광장시장내 41호</div></div></div></a><a href="http://blog.naver.com/dream88915?Redirect=Log&amp;logNo=221012634370" target="_blank"><div class="in_full_box"><div class="blog_item"><div class="blog_title" style="font-size:15px;color:#1a7ad9;padding-bottom:5px;font-weight:bold;line-height:20px;">비오는날 데이트로 좋은, 서울 광장시장 맛집 투어 !</div><div style="font-size:12px;color:#363636;line-height:20px;">비오는날 데이트로 좋은, 서울 광장시장 맛집 투어 ! 밖에 돌아다니기 좋아하는 나는 비가 오는날이면 뭘 해야하나, 어딜가야하나 늘 고민이다. 이날은 "비오는날은 빈대떡과 막걸리지~!"를 외치며 야심차게... </div></div></div></a><a href="http://blog.naver.com/pure7193?Redirect=Log&amp;logNo=221022615941" target="_blank"><div class="in_full_box"><div class="blog_item"><div class="blog_title" style="font-size:15px;color:#1a7ad9;padding-bottom:5px;font-weight:bold;line-height:20px;">서울 광장시장 맛집 청계천 나들이 :: 가볼만한 곳*</div><div style="font-size:12px;color:#363636;line-height:20px;">오로지 빈대떡 하나를 먹기위해 서울 광장시장 갔어요 일산 근처 엄청 맛있는 전집가서 먹어도 되지만, 빈대떡보다 더 기대됐던 나들이 때문에♡ @ 서울 광장시장 먹방투어, 청계천 나들이 :: 꼬보일상* 행복한... </div></div></div></a><a href="http://blog.naver.com/loveju33?Redirect=Log&amp;logNo=221003726935" target="_blank"><div class="in_full_box"><div class="blog_item"><div class="blog_title" style="font-size:15px;color:#1a7ad9;padding-bottom:5px;font-weight:bold;line-height:20px;">서울 광장시장 탐방기 드디어~ 빈대떡을 먹다~ㅋ</div><div style="font-size:12px;color:#363636;line-height:20px;">서울 광장시장 탐방기 드디어~ 빈대떡을 먹다~ㅋ 여러분~~ 서울 광장시장 고고~~ 주말에 나들이~ 갔어요 성남에서 가는건 정말 멀잖아요 서울 나간김에 ㅋㅋ 탐방하고 왔네요~ 역시나 사람들이 엄청 분벼서 사진도... </div></div></div></a><a href="http://blog.naver.com/notianna1?Redirect=Log&amp;logNo=221011474209" target="_blank"><div class="in_full_box"><div class="blog_item"><div class="blog_title" style="font-size:15px;color:#1a7ad9;padding-bottom:5px;font-weight:bold;line-height:20px;">서울가볼만한곳 &lt;서울광장시장&gt;먹거리가 풍성한 이곳~</div><div style="font-size:12px;color:#363636;line-height:20px;">서울 가볼만한 곳- 서울 광장시장 서울의 명소중 꽤 인기있는 이곳 볼거리와 먹거리가 풍성한 이곳 낮보단 밤이 더 활기찬 이곳 서울광장시장 나들이 낮보다 밤이 더 활기찬 서울광장시장 먹거리편입니다 항상... </div></div></div></a><a href="http://blog.naver.com/lay7556?Redirect=Log&amp;logNo=220999351376" target="_blank"><div class="in_full_box"><div class="blog_item"><div class="blog_title" style="font-size:15px;color:#1a7ad9;padding-bottom:5px;font-weight:bold;line-height:20px;">[요니맛집여행] 서울 여행 / 서울 맛집 / 광장시장 /</div><div style="font-size:12px;color:#363636;line-height:20px;">양파짱아지가 완전히 생양파.. 장아찌가 아닌듯...ㅋㅋㅋ 그래도 느끼함을 없애주니 굳 대박막걸리도 같이먹었는데 왜이렇게 달던지... 역시 막걸리가 술중에 제일 맛있는듯 즐거웠던 서울 광장시장 탐방 끝~!!</div></div></div></a><a href="http://blog.naver.com/feb23jh?Redirect=Log&amp;logNo=221011841627" target="_blank"><div class="in_full_box"><div class="blog_item"><div class="blog_title" style="font-size:15px;color:#1a7ad9;padding-bottom:5px;font-weight:bold;line-height:20px;">서울 광장시장 빈대떡 육회 한 접시</div><div style="font-size:12px;color:#363636;line-height:20px;">서울 광장시장 빈대떡 육회 한 접시 할 거 없는 안산 까페에서 죽치고 있지 말고 서울 놀러 가자고 하니 네가 가고 싶은 데로 가자고, 울산 촌 친구 배려해주는 경기도 친구님 덕에 다녀온 광장시장ㅋ 전철로... </div></div></div></a><a href="http://blog.naver.com/haluday?Redirect=Log&amp;logNo=221021542090" target="_blank"><div class="in_full_box"><div class="blog_item"><div class="blog_title" style="font-size:15px;color:#1a7ad9;padding-bottom:5px;font-weight:bold;line-height:20px;">서울 가볼만한곳 재래시장 광장시장</div><div style="font-size:12px;color:#363636;line-height:20px;">물으면 추천할수 있는곳 서울광장시장입니다. 한국관광 100선에 광장시장이 선정되었네요~ 정말 외국인 관광객들도 눈에띄게 많아졌습니다. 빈대떡과 마약김밥은 서울 가볼만한곳 광장시장의 대표... </div></div></div></a><a href="http://blog.naver.com/jsm917?Redirect=Log&amp;logNo=221026649037" target="_blank"><div class="in_full_box"><div class="blog_item"><div class="blog_title" style="font-size:15px;color:#1a7ad9;padding-bottom:5px;font-weight:bold;line-height:20px;">서울 광장시장육회맛집, 육사시미 진주육회</div><div style="font-size:12px;color:#363636;line-height:20px;">광장시장육회맛집 진주육회에 갔다왔습니다. 입구가 환합니다. 조명이 있어서 그런지...어째거나... 홈페이지는 www.jinjuzip.com 이고, 참고 url: http://cafe.naver.com/sioneview/14356 위치는 주 소 : 서울시 종로구... </div></div></div></a><a href="http://blog.naver.com/hjkwon063?Redirect=Log&amp;logNo=221001930960" target="_blank"><div class="in_full_box"><div class="blog_item"><div class="blog_title" style="font-size:15px;color:#1a7ad9;padding-bottom:5px;font-weight:bold;line-height:20px;">서울 광장시장 맛집 - 마약김밥 원조 모녀김밥</div><div style="font-size:12px;color:#363636;line-height:20px;">서울 광장시장 맛집 - 마약김밥 원조 모녀김밥 오늘 이야기 하고자 하는 곳은 서울 광장시장 맛집 모녀꼬마마약김밥 입니다. 일반적으로 광장시장 모녀김밥으로 부르는 사람들이 많답니다. 보통 이곳은... </div></div></div></a></div></div><div class="clear"></div></div><div class="detail_view_bottom"></div></div> - -->

		</div>
	
	<div class="clear"></div>
	</div>
</body>
</html>