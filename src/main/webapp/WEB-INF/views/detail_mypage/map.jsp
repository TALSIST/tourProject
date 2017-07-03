<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

#chartdiv, #map-canvas {
	width: 100%;
	height: 300px;
	border: 1px solid #b3d1ff;
	border-radius: 5px;
	background: #f5f8fd;
	margin-bottom: 20px;
}

.select-style {
    padding: 0;
    margin: 20px;
    border: 1px solid #ccc;
    width: 120px;
    border-radius: 3px;
    overflow: hidden;
    background-color: #fff;

    background: #fff url("http://www.scottgood.com/jsg/blog.nsf/images/arrowdown.gif") no-repeat 90% 50%;
}

.select-style select{
    padding: 5px 8px;
    width: 130%;
    border: none;
    box-shadow: none;
    background-color: transparent;
    background-image: none;
    -webkit-appearance: none;
       -moz-appearance: none;
            appearance: none;
}

.select-style select:focus{
    outline: none;
}
</style>
</head>
<body>
	<div class="select-style">
		<select>
			<option value="volvo">Volvo</option>
			<option value="saab">Saab</option>
			<option value="mercedes">Mercedes</option>
			<option value="audi">Audi</option>
		</select>
	</div>
	<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
	<script src="https://www.amcharts.com/lib/3/serial.js"></script>
	<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjdiZZjAmalE56JzPh-f5hRJI28zOXsXw"></script>
	<div id="chartdiv"></div>
	<div id="map-canvas"></div>
	<script src="/resources/js/mypage/map.js"></script>
</body>
</html>