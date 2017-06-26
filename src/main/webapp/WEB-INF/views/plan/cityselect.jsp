<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>SelectCity</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet prefetch'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="/resources/css/plan.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="header">
		<div class="wrap" style="width: 100%; padding: 0px 10px;">
			<div class="fl" id="gnb_plan_create_title">
				1.도시선택&nbsp;&nbsp;→&nbsp;&nbsp;2.상세
				일정 만들기
			</div>
			<div class="fl" id="gnb_ci_name"></div>
			<div class="fr gnb_box">
				<div class="fl gnb_search_box"></div>
				<a href="/ko/plan">
					<div class="fr gnb_plan_create_close_btn">닫기</div>
				</a>
				<div class="clear"></div>
			</div>
		</div>
	<div class="clear"></div>
	<link rel="stylesheet" href="/resources/css/cityselect.css">
	
	<div id="full_wrap" style="width: 100%; height: 598px;">
	<div class="fl left_full_box">
		<ul class="fl" id="cat_menu" data="" data-member_srl="1329305">
			<li data="as" data-val="아시아" class="on">
				<img src="/resources/image/asia.png" class="s"><br>아시아
			</li>
			<li data="eu" data-val="유럽">
				<img src="/resources/image/europe.png" class="s"><br>유럽
			</li>
			<li data="oc" data-val="남태평양">
				<img src="/resources/image/southpacific.png" class="s"><br>남태평양
			</li>
			<li data="na" data-val="북아메리카">
				<img src="/resources/image/northamerica.png" class="s"><br>북아메리카
			</li>
			<li data="sa" data-val="중남미">
				<img src="/resources/image/latinamerica.png" class="s" style="padding-bottom:7px;"><br>중남미
			</li>
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
        <div id="country_list_box" style="height: 477px; display: block;">
	        <div class="item" data-no="0" data="338" data-latlng="28.39485700,84.12400800" data-val="네팔">
	        	<div class="img_box fl">
		        	<img src="http://mw2.google.com/mw-panoramio/photos/medium/72200085.jpg">
		        </div>
		        <div class="info_box fl">
			        <div class="info_title">네팔</div>
			        <div class="info_sub_title">Nepal</div>
		        </div>
		        <div class="clear"></div>
	        </div>
        </div>

		<!-- country select after select city Start -->
         <div id="city_list_box" style="height: 477px; display: none;">
	        <div class="item" data-no="0" data="10635" data-ci_name="박타푸르" data-lat="27.67222200" data-lng="85.42777800">
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
				<div id="map" class="fl" style="height: 598px; position: relative; width: 470px; overflow: hidden;">
					<img src="https://maps.googleapis.com/maps/api/staticmap?center=Brooklyn+Bridge,New+York,NY&zoom=13&size=600x300&maptype=roadmap
&markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318
&markers=color:red%7Clabel:C%7C40.718217,-73.998284
&key=AIzaSyASKQxwUvzQY0jwKugCGRdD4bSjBAjRn3Y">
				</div>
				<!-- Map End -->
		
		<!-- Plan start -->
		<div id="select_detail_view_city" data="0">
			 <div class="city_title">
			<div class="ci_title_name fl">여행도시</div>
			<div class="pn_date_box fr" id="date_pick_btn" data="0">
				<div class="pn_date_info fl">출발일</div>
				<div class="pn_date_icon fr">
					<img src="/res/img/workspace/new/pn_cal_btn.png">
				</div>
				<div class="clear"></div>
				<div id="date_pick" class="hasDatepicker">
				<div class="ui-datepicker-inline ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" style="display: block;">
				<div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-all">
						<a class="ui-datepicker-next ui-corner-all" data-handler="next" data-event="click" title="">
							<span class="ui-icon ui-icon-circle-triangle-e"></span>
						</a>
					<div class="ui-datepicker-title">
						<span class="ui-datepicker-month">6월</span>&nbsp;
						<span class="ui-datepicker-year">2017</span>
					</div>
				</div>
				
				<table class="ui-datepicker-calendar">
					<thead>
						<tr>
							<th class="ui-datepicker-week-end">
								<span title="SUN">SUN</span>
							</th>
							<th>
								<span title="MON">MON</span>
							</th>
							<th>
								<span title="TUE">TUE</span>
							</th>
							<th>
								<span title="WED">WED</span>
							</th>
							<th>
								<span title="THU">THU</span>
							</th>
							<th>
								<span title="FRI">FRI</span>
							</th>
							<th class="ui-datepicker-week-end">
							<	span title="SAT">SAT</span>
							</th>
						</tr>
					</thead>
				
				<!-- Calendar Month Start -->
				<tbody>
					<tr>	<!-- Calendar Week Start -->
						<td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
						<td class=" ui-datepicker-unselectable ui-state-disabled ">
							<span class="ui-state-default">1</span>
						</td>
						<td class=" ui-datepicker-unselectable ui-state-disabled ">
							<span class="ui-state-default">2</span>
						</td>
						<td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled ">
							<span class="ui-state-default">3</span>
						</td>
					</tr>	<!-- Calendar Week End -->
					
					<tr> <!-- Week repeat Start -->
						<td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled ">
							<span class="ui-state-default">4</span>
						</td>
						<td class=" ui-datepicker-unselectable ui-state-disabled ">
							<span class="ui-state-default">5</span>
						</td>
						<td class=" ui-datepicker-unselectable ui-state-disabled ">
							<span class="ui-state-default">6</span>
						</td>
						<td class=" ui-datepicker-unselectable ui-state-disabled ">
							<span class="ui-state-default">7</span>
						</td>
						<td class=" ui-datepicker-unselectable ui-state-disabled ">
							<span class="ui-state-default">8</span>
						</td>
						<td class=" ui-datepicker-unselectable ui-state-disabled ">
							<span class="ui-state-default">9</span>
						</td>
						<td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled ">
							<span class="ui-state-default">10</span>
						</td>
					</tr> <!-- Week repeat End -->
					
					<tr>
						<td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">11</span></td><td class=" ui-datepicker-unselectable ui-state-disabled ">
							<span class="ui-state-default">12</span>
						</td>
						<td class=" ui-datepicker-unselectable ui-state-disabled ">
							<span class="ui-state-default">13</span>
						</td>
						<td class=" ui-datepicker-unselectable ui-state-disabled ">
							<span class="ui-state-default">14</span>
						</td>
						<td class=" ui-datepicker-unselectable ui-state-disabled ">
							<span class="ui-state-default">15</span>
						</td>
						<td class=" ui-datepicker-unselectable ui-state-disabled ">
							<span class="ui-state-default">16</span>
						</td>
						<td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled ">
							<span class="ui-state-default">17</span>
						</td>
					</tr><!-- Week repeat End -->
					
					<tr>
						<!-- no Selectable day -->
						<td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled ">
							<span class="ui-state-default">18</span>
						</td>
						<td class=" ui-datepicker-unselectable ui-state-disabled ">
							<span class="ui-state-default">19</span>
						</td>
						<td class=" ui-datepicker-unselectable ui-state-disabled ">
							<span class="ui-state-default">20</span>
						</td>
						<td class=" ui-datepicker-unselectable ui-state-disabled ">
							<span class="ui-state-default">21</span>
						</td>
						<td class=" ui-datepicker-unselectable ui-state-disabled ">
							<span class="ui-state-default">22</span></td>
						<!-- Selectable Day -->
						<td class=" ui-datepicker-days-cell-over  ui-datepicker-current-day ui-datepicker-today" data-handler="selectDay" data-event="click" data-month="5" data-year="2017">
							<a class="ui-state-default ui-state-highlight ui-state-active ui-state-hover" href="#">
								23
							</a>
						</td>
						<td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="5" data-year="2017">
							<a class="ui-state-default" href="#">24</a>
						</td>
					</tr>
					<tr>
						<td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="5" data-year="2017">
							<a class="ui-state-default" href="#">25</a>
						</td>
						<td class=" " data-handler="selectDay" data-event="click" data-month="5" data-year="2017">
							<a class="ui-state-default" href="#">26</a>
						</td>
						<td class=" " data-handler="selectDay" data-event="click" data-month="5" data-year="2017">
							<a class="ui-state-default" href="#">27</a>
						</td>
						<td class=" " data-handler="selectDay" data-event="click" data-month="5" data-year="2017">
							<a class="ui-state-default" href="#">28</a>
						</td>
						<td class=" " data-handler="selectDay" data-event="click" data-month="5" data-year="2017">
							<a class="ui-state-default" href="#">29</a>
						</td>
						<td class=" " data-handler="selectDay" data-event="click" data-month="5" data-year="2017">
							<a class="ui-state-default" href="#">30</a>
						</td>
						<td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
					</tr>
				</tbody>
				</table>
				</div>
				</div>
			</div>
			<div class="clear"></div>
			 </div>
			 <div id="selected_cities" data="0" style="max-height: 398px;">
			</div>
			<div class="detail_city_bottom">
			<div class="detail_plan_go_btn" >상세 일정 만들기</div>
			</div>
		</div>
	</div>

	<div class="clear"></div>
</div>
</div>

</body>
</html>