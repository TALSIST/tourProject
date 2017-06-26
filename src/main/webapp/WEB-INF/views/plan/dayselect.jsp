<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <title>Toooour</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>
  <link rel="stylesheet" href="/resources/css/plan.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>

	<div id="header">	
	<div style="width:100%;">
		<div class="fl" style="width:357px;border-right:solid #ebebeb 1px;height:62px">
			<div class="fl" id="plan_title" style="background-color: rgb(255, 255, 255);">ㅇㄹㄷㅇㅎㅍㄷ</div>	<!-- 일정제목 -->
			<div class="clear"></div>
		</div>
		<div class="fr gnb_box">
			<div class="fr" style="margin-top:9px;margin-right:20px;">
				<div class="fl" id="plan_member_list_box">
					<a class="fl" style="margin-right:5px;background:#e5e5e5;border-radius: 20px;width:40px;height:40px;" original-title="이아영"> <!-- 초대된사람이름적기 -->
						<img src="/res/img/common/mobile/img_profile.png" style="width:40px;height:40px;border-radius:20px;">
					</a>
					<a class="fl" style="margin-right:5px;background:#e5e5e5;border-radius: 20px;width:40px;height:40px;" original-title="이상운"> <!-- 초대된사람이름적기 -->
						<img src="/res/img/common/mobile/img_profile.png" style="width:40px;height:40px;border-radius:20px;">
					</a>
				</div>
				<div class="fl" style="margin-right:10px;margin-top:3px;cursor:pointer;"  id="ws_invite_btn" original-title="친구 초대">
					<img src="/res/img/workspace/new/ws_invite_btn.png">
				</div>
				<div class="fl" id="plan_out_btn">저장&amp;닫기</div>
				<div class="fl" id="plan_complete_btn" style="display: none;">완료</div>
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
	      <li data="1" data-date="06.15" data-day_week="3" class="on" original-title="서울">   <!-- Day1,2나오는부분. 이 태그를 변경해야 값이 변경됨.. -->
	         <div class="fl cat_date_left_box">   
	            <div class="cat_left_day">DAY2</div>
	            <div class="cat_left_date">06.15</div>
	         </div>
	         <div class="fl cat_date_right_box">
	            <div class="cat_right_weekday">목요일</div>
	            <div class="cat_right_city">서울</div>
	         </div>
	         <div class="clear"></div>
	      </li>
	      <li data="1" data-date="06.16" data-day_week="3" class="on" original-title="서울">   <!-- Day1,2나오는부분. 이 태그를 변경해야 값이 변경됨.. -->
	         <div class="fl cat_date_left_box">   
	            <div class="cat_left_day">DAY2</div>
	            <div class="cat_left_date">06.15</div>
	         </div>
	         <div class="fl cat_date_right_box">
	            <div class="cat_right_weekday">목요일</div>
	            <div class="cat_right_city">서울</div>
	         </div>
	         <div class="clear"></div>
	      </li>
	      <li data="1" data-date="06.17" data-day_week="3" class="on" original-title="서울">   <!-- Day1,2나오는부분. 이 태그를 변경해야 값이 변경됨.. -->
	         <div class="fl cat_date_left_box">   
	            <div class="cat_left_day">DAY2</div>
	            <div class="cat_left_date">06.15</div>
	         </div>
	         <div class="fl cat_date_right_box">
	            <div class="cat_right_weekday">목요일</div>
	            <div class="cat_right_city">서울</div>
	         </div>
	         <div class="clear"></div>
	      </li>
	      <li data="1" data-date="06.15" data-day_week="3" class="on" original-title="서울">   <!-- Day1,2나오는부분. 이 태그를 변경해야 값이 변경됨.. -->
	         <div class="fl cat_date_left_box">   
	            <div class="cat_left_day">DAY2</div>
	            <div class="cat_left_date">06.15</div>
	         </div>
	         <div class="fl cat_date_right_box">
	            <div class="cat_right_weekday">목요일</div>
	            <div class="cat_right_city">서울</div>
	         </div>
	         <div class="clear"></div>
	      </li>
	   </ul>
	   
	   <!-- Day추가하기 버튼 -->
	   <ul id="cat_add_box" style="width: 160px; background: rgb(32, 51, 65); color: rgb(255, 255, 255); height: 118px;">
	      <li style="padding-top:15px;">
	         <div style="width:124px;height:32px;line-height:32px;border:solid 1px #fff;text-align:center;margin:0 auto;cursor:pointer;"> DAY 추가</div>
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
		<div class="list_title">
			<span>서울</span>
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
		<div class="list_search_box">
			<input type="text" id="input_search" placeholder="장소 검색">
			<div style="margin-left:20px;margin-top:5px;">
			<span type="radio" class="radio on" data-val="city" data-on="on" data-name="search_type" style="color:#808080"><span class="et-radio">&nbsp;</span><span class="et-radio_txt">도시내 검색&nbsp;&nbsp;&nbsp;&nbsp;</span></span>
			<span type="radio" class="radio" data-val="total" data-name="search_type" style="color:#808080" data-on="off"><span class="et-radio">&nbsp;</span><span class="et-radio_txt">전체검색</span></span>
			<input type="hidden" name="search_type" id="search_type" class="news" value="city">
			</div>
		</div>
		<div class="list_category_box">
			<div class="list_cat_item fl on" data="3"><img src="/res/img/workspace/new/ic_300_c.png"></div>	<!-- 상위카테고리 이미지 -->
			<div class="list_cat_item fl" data="2"><img src="/res/img/workspace/new/ic_200_a.png"></div>
			<div class="list_cat_item fl" data="4"><img src="/res/img/workspace/new/ic_400_a.png"></div>
			<div class="list_cat_item fl" data="1"><img src="/res/img/workspace/new/ic_100_a.png"></div>
			<div class="list_cat_item fl" data="5"><img src="/res/img/workspace/new/ic_000_a.png"></div>
			<div class="clear"></div>
			
			<div class="list_tag_box">
				<div id="map_tag_select_box" class="et_slide_parent" data-is_open="0">태그 선택</div>				<!-- 하위카테고리 -->
				<div id="map_tag_select_sub_box" class="et_slide" style=""></div>
			</div>                        
		</div>
	</div>
	 <!-- 장소검색 END -->
  	
  	
	  	<!-- 검색 결과 Start -->
	  	 <div class="list_box_overlay"></div>
		<div class="list_box connectedSortable" style="height: 346px;">
			<!-- 검색결과 1개 Start -->
			<div class="day_spot_item ui-draggable" data="0" data-set_day="0" data-rel_srl="6662" data-pl_type="0" data-no="0" data-pl_cat="301" data-ci="310">
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
				<div class="spot_to_inspot">
					<img src="/res/img/workspace/new/spot_to_inspot_a.png">
				</div>
				<div class="clear"></div>
			</div>
			<!-- 검색결과 1개 End -->
		</div> 
		<!-- 검색결과 종료 -->
	</div>
	<!-- 검색창 종료 -->
</div>

		<!-- 지도시작 -->
		<div id="map" class="fr" style="height: 588px; position: relative; width: 212px; overflow: hidden;"><div style="height: 100%; width: 100%; position: absolute; top: 0px; left: 0px; background-color: rgb(229, 227, 223);"><div class="gm-style" style="position: absolute; z-index: 0; left: 0px; top: 0px; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px;"><div tabindex="0" style="position: absolute; z-index: 0; left: 0px; top: 0px; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; cursor: url(&quot;https://maps.gstatic.com/mapfiles/openhand_8_8.cur&quot;) 8 8, default;"><div style="z-index: 1; position: absolute; top: 0px; left: 0px; width: 100%; transform-origin: 0px 0px 0px; transform: matrix(1, 0, 0, 1, 0, 0);"><div style="position: absolute; left: 0px; top: 0px; z-index: 100; width: 100%;"><div style="position: absolute; left: 0px; top: 0px; z-index: 0;"><div aria-hidden="true" style="position: absolute; left: 0px; top: 0px; z-index: 1; visibility: inherit;"><div style="width: 256px; height: 256px; position: absolute; left: -248px; top: 3px;"></div><div style="width: 256px; height: 256px; position: absolute; left: -248px; top: 259px;"></div><div style="width: 256px; height: 256px; position: absolute; left: -248px; top: -253px;"></div><div style="width: 256px; height: 256px; position: absolute; left: -248px; top: 515px;"></div><div style="width: 256px; height: 256px; position: absolute; left: 8px; top: 3px;"></div><div style="width: 256px; height: 256px; position: absolute; left: 8px; top: 259px;"></div><div style="width: 256px; height: 256px; position: absolute; left: 8px; top: -253px;"></div><div style="width: 256px; height: 256px; position: absolute; left: 8px; top: 515px;"></div></div></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 101; width: 100%;"><div style="position: absolute; left: 0px; top: 0px; z-index: 30;"><div aria-hidden="true" style="position: absolute; left: 0px; top: 0px; z-index: 1; visibility: inherit;"><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -248px; top: -253px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -248px; top: 515px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -248px; top: 3px;"><canvas width="256" height="256" draggable="false" style="width: 256px; height: 256px; user-select: none; position: absolute; left: 0px; top: 0px;"></canvas></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -248px; top: 259px;"><canvas width="256" height="256" draggable="false" style="width: 256px; height: 256px; user-select: none; position: absolute; left: 0px; top: 0px;"></canvas></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 8px; top: 3px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 8px; top: -253px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 8px; top: 515px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 8px; top: 259px;"><canvas width="256" height="256" draggable="false" style="width: 256px; height: 256px; user-select: none; position: absolute; left: 0px; top: 0px;"></canvas></div></div></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 102; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 103; width: 100%;"><div style="position: absolute; left: 0px; top: 0px; z-index: -1;"><div aria-hidden="true" style="position: absolute; left: 0px; top: 0px; z-index: 1; visibility: inherit;"><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -248px; top: 3px;"><canvas draggable="false" height="256" width="256" style="user-select: none; position: absolute; left: 0px; top: 0px; height: 256px; width: 256px;"></canvas></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -248px; top: 259px;"><canvas draggable="false" height="256" width="256" style="user-select: none; position: absolute; left: 0px; top: 0px; height: 256px; width: 256px;"></canvas></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -248px; top: -253px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -248px; top: 515px;"><canvas draggable="false" height="256" width="256" style="user-select: none; position: absolute; left: 0px; top: 0px; height: 256px; width: 256px;"></canvas></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 8px; top: 3px;"><canvas draggable="false" height="256" width="256" style="user-select: none; position: absolute; left: 0px; top: 0px; height: 256px; width: 256px;"></canvas></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 8px; top: 259px;"><canvas draggable="false" height="256" width="256" style="user-select: none; position: absolute; left: 0px; top: 0px; height: 256px; width: 256px;"></canvas></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 8px; top: -253px;"></div><div style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 8px; top: 515px;"><canvas draggable="false" height="256" width="256" style="user-select: none; position: absolute; left: 0px; top: 0px; height: 256px; width: 256px;"></canvas></div></div></div></div><div style="position: absolute; z-index: 0; left: 0px; top: 0px;"><div style="overflow: hidden;"></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 0;"><div aria-hidden="true" style="position: absolute; left: 0px; top: 0px; z-index: 1; visibility: inherit;"><div style="position: absolute; left: -248px; top: 3px;"><img src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i12!2i3492!3i1585!4i256!2m3!1e0!2sm!3i383075252!3m14!2sko!3sKR!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2sp.s%3A-20!4e0&amp;token=116044" draggable="false" alt="" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: -248px; top: 259px;"><img src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i12!2i3492!3i1586!4i256!2m3!1e0!2sm!3i383075252!3m14!2sko!3sKR!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2sp.s%3A-20!4e0&amp;token=96319" draggable="false" alt="" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: -248px; top: 515px;"><img src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i12!2i3492!3i1587!4i256!2m3!1e0!2sm!3i383075252!3m14!2sko!3sKR!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2sp.s%3A-20!4e0&amp;token=76594" draggable="false" alt="" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: -248px; top: -253px;"><img src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i12!2i3492!3i1584!4i256!2m3!1e0!2sm!3i383074508!3m14!2sko!3sKR!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2sp.s%3A-20!4e0&amp;token=52248" draggable="false" alt="" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 8px; top: 3px; transition: opacity 200ms ease-out;"><img src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i12!2i3493!3i1585!4i256!2m3!1e0!2sm!3i383075396!3m14!2sko!3sKR!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2sp.s%3A-20!4e0&amp;token=14848" draggable="false" alt="" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 8px; top: 259px; transition: opacity 200ms ease-out;"><img src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i12!2i3493!3i1586!4i256!2m3!1e0!2sm!3i383075252!3m14!2sko!3sKR!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2sp.s%3A-20!4e0&amp;token=105444" draggable="false" alt="" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 8px; top: -253px; transition: opacity 200ms ease-out;"><img src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i12!2i3493!3i1584!4i256!2m3!1e0!2sm!3i383075396!3m14!2sko!3sKR!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2sp.s%3A-20!4e0&amp;token=34573" draggable="false" alt="" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="position: absolute; left: 8px; top: 515px; transition: opacity 200ms ease-out;"><img src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i12!2i3493!3i1587!4i256!2m3!1e0!2sm!3i383075252!3m14!2sko!3sKR!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2sp.s%3A-20!4e0&amp;token=85719" draggable="false" alt="" style="width: 256px; height: 256px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div></div></div></div><div style="z-index: 2; position: absolute; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; left: 0px; top: 0px;"></div><div style="z-index: 3; position: absolute; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; left: 0px; top: 0px;"><div style="z-index: 1; position: absolute; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; left: 0px; top: 0px;"></div></div><div style="z-index: 4; position: absolute; top: 0px; left: 0px; width: 100%; transform-origin: 0px 0px 0px; transform: matrix(1, 0, 0, 1, 0, 0);"><div style="position: absolute; left: 0px; top: 0px; z-index: 104; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 105; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 106; width: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 107; width: 100%;"><div style="z-index: -202; cursor: pointer; display: none;"><div style="width: 30px; height: 27px; overflow: hidden; position: absolute;"><img src="https://maps.gstatic.com/mapfiles/undo_poly.png" draggable="false" style="position: absolute; left: 0px; top: 0px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none; width: 90px; height: 27px;"></div></div></div></div></div><div style="margin-left: 5px; margin-right: 5px; z-index: 1000000; position: absolute; left: 0px; bottom: 0px;"><a target="_blank" href="https://maps.google.com/maps?ll=37.570007,127.035667&amp;z=12&amp;t=m&amp;hl=ko&amp;gl=KR&amp;mapclient=apiv3" title="Google 지도에서 이 지역을 보려면 클릭하세요." style="position: static; overflow: visible; float: none; display: inline;"><div style="width: 66px; height: 26px; cursor: pointer;"><img src="https://maps.gstatic.com/mapfiles/api-3/images/google_white5.png" draggable="false" style="position: absolute; left: 0px; top: 0px; width: 66px; height: 26px; user-select: none; border: 0px; padding: 0px; margin: 0px;"></div></a></div><div style="background-color: white; padding: 15px 21px; border: 1px solid rgb(171, 171, 171); font-family: Roboto, Arial, sans-serif; color: rgb(34, 34, 34); box-shadow: rgba(0, 0, 0, 0.2) 0px 4px 16px; z-index: 10000002; display: none; width: 158px; height: 148px; position: absolute; left: 5px; top: 204px;"><div style="padding: 0px 0px 10px; font-size: 16px;">지도 데이터</div><div style="font-size: 13px;">지도 데이터 ©2017 Google, SK telecom</div><div style="width: 13px; height: 13px; overflow: hidden; position: absolute; opacity: 0.7; right: 12px; top: 12px; z-index: 10000; cursor: pointer;"><img src="https://maps.gstatic.com/mapfiles/api-3/images/mapcnt6.png" draggable="false" style="position: absolute; left: -2px; top: -336px; width: 59px; height: 492px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div></div><div class="gmnoprint" style="z-index: 1000001; position: absolute; right: 52px; bottom: 0px; width: 64px;"><div draggable="false" class="gm-style-cc" style="user-select: none; height: 14px; line-height: 14px;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;"><a style="color: rgb(68, 68, 68); text-decoration: none; cursor: pointer;">지도 데이터</a><span style="display: none;">지도 데이터 ©2017 Google, SK telecom</span></div></div></div><div class="gmnoscreen" style="position: absolute; right: 0px; bottom: 0px;"><div style="font-family: Roboto, Arial, sans-serif; font-size: 11px; color: rgb(68, 68, 68); direction: ltr; text-align: right; background-color: rgb(245, 245, 245);">지도 데이터 ©2017 Google, SK telecom</div></div><div class="gmnoprint gm-style-cc" draggable="false" style="z-index: 1000001; user-select: none; height: 14px; line-height: 14px; position: absolute; right: 0px; bottom: 0px;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;"><a href="https://www.google.com/intl/ko_KR/help/terms_maps.html" target="_blank" style="text-decoration: none; cursor: pointer; color: rgb(68, 68, 68);">이용약관</a></div></div><div style="cursor: pointer; width: 25px; height: 25px; overflow: hidden; display: none; margin: 10px 14px; position: absolute; top: 0px; right: 0px;"><img src="https://maps.gstatic.com/mapfiles/api-3/images/sv9.png" draggable="false" class="gm-fullscreen-control" style="position: absolute; left: -52px; top: -86px; width: 164px; height: 175px; user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div draggable="false" class="gm-style-cc" style="user-select: none; height: 14px; line-height: 14px; display: none; position: absolute; right: 0px; bottom: 0px;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;"><a target="_new" title="Google에 도로 지도 또는 이미지 오류 신고" href="https://www.google.com/maps/@37.570007,127.0356672,12z/data=!10m1!1e1!12b1?source=apiv3&amp;rapsrc=apiv3" style="font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); text-decoration: none; position: relative;">지도 오류 신고</a></div></div><div class="gmnoprint gm-bundled-control" draggable="false" controlwidth="28" controlheight="93" style="margin: 10px; user-select: none; position: absolute; top: 0px; right: 28px;"><div class="gmnoprint" controlwidth="28" controlheight="55" style="position: absolute; left: 0px; top: 0px;"><div draggable="false" style="user-select: none; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; border-radius: 2px; cursor: pointer; background-color: rgb(255, 255, 255); width: 28px; height: 55px;"><div title="확대" style="position: relative; width: 28px; height: 27px; left: 0px; top: 0px;"><div style="overflow: hidden; position: absolute; width: 15px; height: 15px; left: 7px; top: 6px;"><img src="https://maps.gstatic.com/mapfiles/api-3/images/tmapctrl.png" draggable="false" style="position: absolute; left: 0px; top: 0px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none; width: 120px; height: 54px;"></div></div><div style="position: relative; overflow: hidden; width: 67%; height: 1px; left: 16%; background-color: rgb(230, 230, 230); top: 0px;"></div><div title="축소" style="position: relative; width: 28px; height: 27px; left: 0px; top: 0px;"><div style="overflow: hidden; position: absolute; width: 15px; height: 15px; left: 7px; top: 6px;"><img src="https://maps.gstatic.com/mapfiles/api-3/images/tmapctrl.png" draggable="false" style="position: absolute; left: 0px; top: -15px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none; width: 120px; height: 54px;"></div></div></div></div><div class="gm-svpc" controlwidth="28" controlheight="28" style="background-color: rgb(255, 255, 255); box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; border-radius: 2px; width: 28px; height: 28px; cursor: url(&quot;https://maps.gstatic.com/mapfiles/openhand_8_8.cur&quot;) 8 8, default; position: absolute; left: 0px; top: 65px;"><div style="position: absolute; left: 1px; top: 1px;"></div><div style="position: absolute; left: 1px; top: 1px;"><div aria-label="스트리트 뷰 페그맨 컨트롤" style="width: 26px; height: 26px; overflow: hidden; position: absolute; left: 0px; top: 0px;"><img src="https://maps.gstatic.com/mapfiles/api-3/images/cb_scout5.png" draggable="false" style="position: absolute; left: -147px; top: -26px; width: 215px; height: 835px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div aria-label="지도 위에 페그맨이 있음" style="width: 26px; height: 26px; overflow: hidden; position: absolute; left: 0px; top: 0px; visibility: hidden;"><img src="https://maps.gstatic.com/mapfiles/api-3/images/cb_scout5.png" draggable="false" style="position: absolute; left: -147px; top: -52px; width: 215px; height: 835px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div aria-label="스트리트 뷰 페그맨 컨트롤" style="width: 26px; height: 26px; overflow: hidden; position: absolute; left: 0px; top: 0px; visibility: hidden;"><img src="https://maps.gstatic.com/mapfiles/api-3/images/cb_scout5.png" draggable="false" style="position: absolute; left: -147px; top: -78px; width: 215px; height: 835px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div></div></div></div><div class="gmnoprint gm-bundled-control gm-bundled-control-on-bottom" draggable="false" controlwidth="0" controlheight="0" style="margin: 10px; user-select: none; position: absolute; display: none; bottom: 14px; right: 0px;"><div class="gmnoprint" controlwidth="28" controlheight="0" style="display: none; position: absolute;"><div title="지도 90도 회전" style="width: 28px; height: 28px; overflow: hidden; position: absolute; border-radius: 2px; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; cursor: pointer; background-color: rgb(255, 255, 255); display: none;"><img src="https://maps.gstatic.com/mapfiles/api-3/images/tmapctrl4.png" draggable="false" style="position: absolute; left: -141px; top: 6px; width: 170px; height: 54px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div class="gm-tilt" style="width: 28px; height: 28px; overflow: hidden; position: absolute; border-radius: 2px; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; top: 0px; cursor: pointer; background-color: rgb(255, 255, 255);"><img src="https://maps.gstatic.com/mapfiles/api-3/images/tmapctrl4.png" draggable="false" style="position: absolute; left: -141px; top: -13px; width: 170px; height: 54px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div></div></div><div class="gmnoprint" style="margin: 10px; z-index: 0; position: absolute; cursor: pointer; left: 0px; top: 0px;"><div class="gm-style-mtc" style="float: left;"><div draggable="false" title="거리 지도 보기" style="direction: ltr; overflow: hidden; text-align: center; position: relative; color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; user-select: none; font-size: 11px; background-color: rgb(255, 255, 255); padding: 8px; border-bottom-left-radius: 2px; border-top-left-radius: 2px; -webkit-background-clip: padding-box; background-clip: padding-box; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; min-width: 22px; font-weight: 500;">지도</div><div style="background-color: white; z-index: -1; padding: 2px; border-bottom-left-radius: 2px; border-bottom-right-radius: 2px; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; position: absolute; left: 0px; top: 31px; text-align: left; display: none;"><div draggable="false" title="지형과 거리 지도 보기" style="color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; user-select: none; font-size: 11px; background-color: rgb(255, 255, 255); padding: 6px 8px 6px 6px; direction: ltr; text-align: left; white-space: nowrap;"><span role="checkbox" style="box-sizing: border-box; position: relative; line-height: 0; font-size: 0px; margin: 0px 5px 0px 0px; display: inline-block; background-color: rgb(255, 255, 255); border: 1px solid rgb(198, 198, 198); border-radius: 1px; width: 13px; height: 13px; vertical-align: middle;"><div style="position: absolute; left: 1px; top: -2px; width: 13px; height: 11px; overflow: hidden; display: none;"><img src="https://maps.gstatic.com/mapfiles/mv/imgs8.png" draggable="false" style="position: absolute; left: -52px; top: -44px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none; width: 68px; height: 67px;"></div></span><label style="vertical-align: middle; cursor: pointer;">지형</label></div></div></div><div class="gm-style-mtc" style="float: left;"><div draggable="false" title="위성 이미지 보기" style="direction: ltr; overflow: hidden; text-align: center; position: relative; color: rgb(86, 86, 86); font-family: Roboto, Arial, sans-serif; user-select: none; font-size: 11px; background-color: rgb(255, 255, 255); padding: 8px; border-bottom-right-radius: 2px; border-top-right-radius: 2px; -webkit-background-clip: padding-box; background-clip: padding-box; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; border-left: 0px; min-width: 22px;">위성</div><div style="background-color: white; z-index: -1; padding: 2px; border-bottom-left-radius: 2px; border-bottom-right-radius: 2px; box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px; position: absolute; right: 0px; top: 31px; text-align: left; display: none;"><div draggable="false" title="거리 이름과 이미지 함께 보기" style="color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; user-select: none; font-size: 11px; background-color: rgb(255, 255, 255); padding: 6px 8px 6px 6px; direction: ltr; text-align: left; white-space: nowrap;"><span role="checkbox" style="box-sizing: border-box; position: relative; line-height: 0; font-size: 0px; margin: 0px 5px 0px 0px; display: inline-block; background-color: rgb(255, 255, 255); border: 1px solid rgb(198, 198, 198); border-radius: 1px; width: 13px; height: 13px; vertical-align: middle;"><div style="position: absolute; left: 1px; top: -2px; width: 13px; height: 11px; overflow: hidden;"><img src="https://maps.gstatic.com/mapfiles/mv/imgs8.png" draggable="false" style="position: absolute; left: -52px; top: -44px; user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none; width: 68px; height: 67px;"></div></span><label style="vertical-align: middle; cursor: pointer;">라벨</label></div></div></div></div></div></div></div>
		<!-- 지도종료 -->
	
	<!-- 장소 상세보기 클릭시 설명나옴 -->
   <!-- <div id="select_detail_view_spot" data="6659" data-no="0" data-cat="400" data-only_clip="1" data-clip_yn="y" class="visible" style="left: 0px; display: block;"><div class="detail_view_full_box"><div id="detail_spot_to_inspot" data-ci="310" data-rel_srl="6659" data-pl_type="0">+일정에 추가</div><div id="detail_close_btn"></div><a class="spot_title" href="/ko/city/seoul_310/shopping/gwangjang-market_6659" target="_blank">광장시장</a><div class="spot_img"><div class="detail_img_overlay"></div><img src="http://img.earthtory.com/img/place_img/310/6659_0_et.jpg"><div class="spot_cnt_box"></div></div><div id="detail_content" style="height: 356px;"><div class="info_first"><div class="in_full_box"><div class="info_memo"><div style="font-size:15px;color:#363636;font-weight:bold;text-align:left;padding-bottom:10px;padding-left:8px;">예산</div><div style="padding-left:10px;padding-bottom:15px;"><div id="budget_currency_select_list"><div data="KRW">KRW</div><div data="USD">USD</div></div><div id="budget_currency" data="KRW" class="fl">KRW</div><div class="fl"><input type="text" class="budget_input" placeholder="0" onkeyup="return isNumberKey(event)"></div><div class="clear"></div></div><div style="font-size:15px;color:#363636;font-weight:bold;text-align:left;padding-bottom:10px;padding-left:8px;">메모</div><textarea id="memo_input" data-type="inspot" data-set_day="1" data-set_order="1" data-pl_type="0"></textarea><div id="memo_save">저장</div></div></div><div class="in_full_box"><div style="line-height:22px;font-size:11px;color:#808080;padding-bottom:20px;font-size:13px;"><img src="/res/img/workspace/new/tip_desc_icon.png" style="vertical-align:top;"> 광장시장은 최초의 상설시장이면서 1904년 동대문시장이라는 이름으로 출발했으며 이전에는 한복과 포목등을 주로 판매하였으나 지금은 원단과 패션 부자재를 주로 판매하는 곳으로 패션업계에 종사하는 사람들이 많이 찾는 곳이며 구제품을 구입하고자 하는 사람들도 많이 찾는다 그 외에도 다른 재래시장과 달리 먹거리가 다양하고 맛있어 쇼핑을 위해 찾는 사람들 못지 않게 음식을 즐기기 위해 찾는 사람 또한 많이 있다 저녁이 되면 보기만 해도 군침이 흐르는 다양한 종류의 음식들이 줄지어 가게를 이루고 있으며 서민적인 먹거리들로 가득하다 광장시장에서도 유난히 사람들이 많이 찾는 곳으로 순희네빈대떡, 복민횟집, 마약김밥 등이 있으며 광장시장을 오랫동안 지키며 전통을 이어가고 있다 </div><div class="information"><div style="width:100%;padding:15px;border:solid #d4d4d4 1px;"><div style="color:#808080;font-size:13px;padding-left:20px;background:url('/res/img/workspace/new/addr_desc_icon.png') no-repeat 2px 2px;line-height:16px;padding-bottom:10px;">269-39 Yeji-dong, Jongno-gu, Seoul, South Korea</div><div class="sub_title fl">카테고리</div><div class="sub_info fl">식당가/푸드코트, 시장/쇼핑거리</div><div class="clear"></div><div class="sub_title fl">영업시간</div><div class="sub_info fl">월~토 - 09:00~18:00<br></div><div class="clear"></div><div class="sub_title fl">홈페이지</div><div class="sub_info fl"><a href="http://www.kwangjangmarket.co.kr" target="_blank">http://www.kwangjangmarket.co.kr</a></div><div class="clear"></div><div id="fq_attr_box"></div><div id="fq_open_box"></div><div class="clear"></div></div><div class="sub_desc"></div></div><div class="clear"></div></div></div><div class="info_second"><div class="info_section_line"></div><div class="in_full_box"><div id="review_title_box" style="font-size:15px;color:#363636;font-weight:bold;padding-bottom:10px;" class="fl">리뷰</div><div class="map_review_w_btn fr" onclick="et_modal('548px','352px','1','0','/ko/modal/review?pl_srl=6659','2','1');">리뷰쓰기</div><div class="clear"></div><div id="review_item_box"><div class="cmmt_content_box"><div class="cmmt_c_user"><img src="http://graph.facebook.com/1108963139175010/picture?type=large" class="cmmt_content_uimg"><div class="cmmt_c_user_txt"><div class="cmmt_c_user_name">송준일<span>&nbsp;&nbsp;2016-06-14 21:40:50</span><div class="clear"></div></div><div class="cmmt_c_user_level"><img src="http://earthtory.com/res/img/common/web/mgrade_8_ko.png" alt=""><div class="rv_cnt">2개의 평가</div><div class="clear"></div></div></div><div class="clear"></div></div><div class="cmmt_content"><div class="cmmt_content_info"><span>좋아요!</span></div>asdsadsa<div class="cmmt_content_bottom"><div class="clear"></div></div></div></div><div class="clear" style="height:10px;width:1px;"></div></div><div class="clear"></div></div></div><div class="info_third" style="padding-top:30px;"><div style="font-size:15px;color:#363636;font-weight:bold;padding-bottom:10px;padding-left:20px;">블로그</div><a href="http://blog.naver.com/pianocl?Redirect=Log&amp;logNo=221030827704" target="_blank"><div class="in_full_box"><div class="blog_item"><div class="blog_title" style="font-size:15px;color:#1a7ad9;padding-bottom:5px;font-weight:bold;line-height:20px;">서울 광장시장- 누드김밥과 잡채.../원조누드치즈김밥</div><div style="font-size:12px;color:#363636;line-height:20px;">아니 오히려 더 정감있고 저렴한 가격의 좋은 김밥이지요 오랫동안 성업 하시길 바라며 매력있는 사장님, 다음에 또 뵙겠습니다. 연락처: ***-****-**** 주소: 서울 종로구 예지동 2-1 광장시장내 41호</div></div></div></a><a href="http://blog.naver.com/dream88915?Redirect=Log&amp;logNo=221012634370" target="_blank"><div class="in_full_box"><div class="blog_item"><div class="blog_title" style="font-size:15px;color:#1a7ad9;padding-bottom:5px;font-weight:bold;line-height:20px;">비오는날 데이트로 좋은, 서울 광장시장 맛집 투어 !</div><div style="font-size:12px;color:#363636;line-height:20px;">비오는날 데이트로 좋은, 서울 광장시장 맛집 투어 ! 밖에 돌아다니기 좋아하는 나는 비가 오는날이면 뭘 해야하나, 어딜가야하나 늘 고민이다. 이날은 "비오는날은 빈대떡과 막걸리지~!"를 외치며 야심차게... </div></div></div></a><a href="http://blog.naver.com/pure7193?Redirect=Log&amp;logNo=221022615941" target="_blank"><div class="in_full_box"><div class="blog_item"><div class="blog_title" style="font-size:15px;color:#1a7ad9;padding-bottom:5px;font-weight:bold;line-height:20px;">서울 광장시장 맛집 청계천 나들이 :: 가볼만한 곳*</div><div style="font-size:12px;color:#363636;line-height:20px;">오로지 빈대떡 하나를 먹기위해 서울 광장시장 갔어요 일산 근처 엄청 맛있는 전집가서 먹어도 되지만, 빈대떡보다 더 기대됐던 나들이 때문에♡ @ 서울 광장시장 먹방투어, 청계천 나들이 :: 꼬보일상* 행복한... </div></div></div></a><a href="http://blog.naver.com/loveju33?Redirect=Log&amp;logNo=221003726935" target="_blank"><div class="in_full_box"><div class="blog_item"><div class="blog_title" style="font-size:15px;color:#1a7ad9;padding-bottom:5px;font-weight:bold;line-height:20px;">서울 광장시장 탐방기 드디어~ 빈대떡을 먹다~ㅋ</div><div style="font-size:12px;color:#363636;line-height:20px;">서울 광장시장 탐방기 드디어~ 빈대떡을 먹다~ㅋ 여러분~~ 서울 광장시장 고고~~ 주말에 나들이~ 갔어요 성남에서 가는건 정말 멀잖아요 서울 나간김에 ㅋㅋ 탐방하고 왔네요~ 역시나 사람들이 엄청 분벼서 사진도... </div></div></div></a><a href="http://blog.naver.com/notianna1?Redirect=Log&amp;logNo=221011474209" target="_blank"><div class="in_full_box"><div class="blog_item"><div class="blog_title" style="font-size:15px;color:#1a7ad9;padding-bottom:5px;font-weight:bold;line-height:20px;">서울가볼만한곳 &lt;서울광장시장&gt;먹거리가 풍성한 이곳~</div><div style="font-size:12px;color:#363636;line-height:20px;">서울 가볼만한 곳- 서울 광장시장 서울의 명소중 꽤 인기있는 이곳 볼거리와 먹거리가 풍성한 이곳 낮보단 밤이 더 활기찬 이곳 서울광장시장 나들이 낮보다 밤이 더 활기찬 서울광장시장 먹거리편입니다 항상... </div></div></div></a><a href="http://blog.naver.com/lay7556?Redirect=Log&amp;logNo=220999351376" target="_blank"><div class="in_full_box"><div class="blog_item"><div class="blog_title" style="font-size:15px;color:#1a7ad9;padding-bottom:5px;font-weight:bold;line-height:20px;">[요니맛집여행] 서울 여행 / 서울 맛집 / 광장시장 /</div><div style="font-size:12px;color:#363636;line-height:20px;">양파짱아지가 완전히 생양파.. 장아찌가 아닌듯...ㅋㅋㅋ 그래도 느끼함을 없애주니 굳 대박막걸리도 같이먹었는데 왜이렇게 달던지... 역시 막걸리가 술중에 제일 맛있는듯 즐거웠던 서울 광장시장 탐방 끝~!!</div></div></div></a><a href="http://blog.naver.com/feb23jh?Redirect=Log&amp;logNo=221011841627" target="_blank"><div class="in_full_box"><div class="blog_item"><div class="blog_title" style="font-size:15px;color:#1a7ad9;padding-bottom:5px;font-weight:bold;line-height:20px;">서울 광장시장 빈대떡 육회 한 접시</div><div style="font-size:12px;color:#363636;line-height:20px;">서울 광장시장 빈대떡 육회 한 접시 할 거 없는 안산 까페에서 죽치고 있지 말고 서울 놀러 가자고 하니 네가 가고 싶은 데로 가자고, 울산 촌 친구 배려해주는 경기도 친구님 덕에 다녀온 광장시장ㅋ 전철로... </div></div></div></a><a href="http://blog.naver.com/haluday?Redirect=Log&amp;logNo=221021542090" target="_blank"><div class="in_full_box"><div class="blog_item"><div class="blog_title" style="font-size:15px;color:#1a7ad9;padding-bottom:5px;font-weight:bold;line-height:20px;">서울 가볼만한곳 재래시장 광장시장</div><div style="font-size:12px;color:#363636;line-height:20px;">물으면 추천할수 있는곳 서울광장시장입니다. 한국관광 100선에 광장시장이 선정되었네요~ 정말 외국인 관광객들도 눈에띄게 많아졌습니다. 빈대떡과 마약김밥은 서울 가볼만한곳 광장시장의 대표... </div></div></div></a><a href="http://blog.naver.com/jsm917?Redirect=Log&amp;logNo=221026649037" target="_blank"><div class="in_full_box"><div class="blog_item"><div class="blog_title" style="font-size:15px;color:#1a7ad9;padding-bottom:5px;font-weight:bold;line-height:20px;">서울 광장시장육회맛집, 육사시미 진주육회</div><div style="font-size:12px;color:#363636;line-height:20px;">광장시장육회맛집 진주육회에 갔다왔습니다. 입구가 환합니다. 조명이 있어서 그런지...어째거나... 홈페이지는 www.jinjuzip.com 이고, 참고 url: http://cafe.naver.com/sioneview/14356 위치는 주 소 : 서울시 종로구... </div></div></div></a><a href="http://blog.naver.com/hjkwon063?Redirect=Log&amp;logNo=221001930960" target="_blank"><div class="in_full_box"><div class="blog_item"><div class="blog_title" style="font-size:15px;color:#1a7ad9;padding-bottom:5px;font-weight:bold;line-height:20px;">서울 광장시장 맛집 - 마약김밥 원조 모녀김밥</div><div style="font-size:12px;color:#363636;line-height:20px;">서울 광장시장 맛집 - 마약김밥 원조 모녀김밥 오늘 이야기 하고자 하는 곳은 서울 광장시장 맛집 모녀꼬마마약김밥 입니다. 일반적으로 광장시장 모녀김밥으로 부르는 사람들이 많답니다. 보통 이곳은... </div></div></div></a></div></div><div class="clear"></div></div><div class="detail_view_bottom"></div></div> - -->

		</div>
	
	<div class="clear"></div>
	</div>
</body>
</html>