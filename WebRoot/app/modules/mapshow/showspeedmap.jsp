<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<head>
<title>站点查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;}
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=BP3QtYgK2SY5WwA6i2Ug0TGh&callback"></script>
<title>显示速度</title>
</head>
<body>
<div style=" width:100%; height:100%;">
  <div>
    <form action="">
	日期
      <input type="text" name="date" id="date" value='2014-03-26'>
     时间段选择
	 <select name="timesection" id="timesection">
		<option value="[05:30~06:00)">05:30~06:00</option>
		<option value="[06:00~06:30)">06:00~06:30</option>
		<option value="[06:30~07:00)" selected="selected">06:30~07:00</option>
		<option value="[07:00~07:30)">07:00~07:30</option>
		<option value="[07:30~08:00)">07:30~08:00</option>
		<option value="[08:00~08:30)">08:00~08:30</option>
		<option value="[08:30~09:00)">08:30~09:00</option>
		<option value="[09:00~09:30)">09:00~09:30</option>
		<option value="[09:30~10:00)">09:30~10:00</option>
		<option value="[10:00~10:30)">10:00~10:30</option>
		<option value="[10:30~11:00)">10:30~11:00</option>
		<option value="[11:00~11:30)">11:00~11:30</option>
		<option value="[11:30~12:00)">11:30~12:00</option>
		<option value="[12:00~12:30)">12:00~12:30</option>
		<option value="[12:30~13:00">12:30~13:00</option>
		<option value="[13:00~13:30)">13:00~13:30</option>
		<option value="[13:30~14:00)">13:30~14:00</option>
		<option value="[14:00~14:30)">14:00~14:30</option>
		<option value="[14:30~15:00)">14:30~15:00</option>
		<option value="[15:00~15:30)">15:00~15:30</option>
		<option value="[15:30~16:00)">15:30~16:00</option>
		<option value="[16:00~16:30)">16:00~16:30</option>
		<option value="[16:30~17:00)">16:30~17:00</option>
		<option value="[17:00~17:30)">17:00~17:30</option>
		<option value="[17:30~18:00)">17:30~18:00</option>
		<option value="[18:00~18:30)">18:00~18:30</option>
		<option value="[18:30~19:00)">18:30~19:00</option>
		<option value="[19:00~19:30)">19:00~19:30</option>
		
	</select>
   	  <input type="button" value="提交" onClick="showspeedview()">
    </form>
  </div>
  <div id="allmap" style=" width:100%; height:100%;"></div>
</div>
</body>
</html>
<script type="text/javascript">

// 百度地图API功能
var map = new BMap.Map("allmap");
var point = new BMap.Point(117.007863, 36.676649);
map.centerAndZoom(point, 15);
map.enableScrollWheelZoom();

function showspeedview(){
	map.clearOverlays();
	$.getJSON("mapshow.do?reqCode=querySpeedMap",{
	timesection:document.getElementById("timesection").value,
	date:document.getElementById("date").value,
	loginuserid:"developer"
	},function(js){
		var obj = eval(js);
		for(var i=0;i<obj.length;i++){
			showeveryroutespeed(obj[i]);
		}		
	});
}

function showeveryroutespeed(objs){
	color = "red";
	
	//alert("1111");
	
	
	var speed = parseInt(objs.realspeed.toFixed(2));
	
	if(15 <= speed &&speed<25 ){
	console.log('111111111111111'+speed);
		color = "yellow";
	}else if( speed >= 25){
		color = "green";
		
	}
	/*
	$.getJSON("mapshow.do?reqCode=queryRoad",{
	pos:objs.pos,
	posp:objs.posp,
	loginuserid:"developer"
	},
	function(js){
		var obj =  eval(js);
		var points = [];
		for(var i=0;i<obj.length;i++){
			point=new BMap.Point(obj[i].lng, obj[i].lat);
			points[i]=point;
		}
		console.log('22222222222222'+color);
		var polyline = new BMap.Polyline(points, {strokeColor:color, strokeWeight:3,strokeStyle:"ridge"});
				
		map.addOverlay(polyline);		
	});*/
	
	
	$.ajax({
	 sync:false,
	 type: 'POST',
 	 url: "mapshow.do?reqCode=queryRoad",
	 data:{pos:objs.pos,posp:objs.posp,color:color},
 	 success: function(js){
		var obj =  eval(js);
		var points = [];
		for(var i=0;i<obj.length;i++){
			point=new BMap.Point(obj[i].lng, obj[i].lat);
			points[i]=point;
		}
		console.log('22222222222222'+color);
		var polyline = new BMap.Polyline(points, {strokeColor:obj[0].color, strokeWeight:3,strokeStyle:"ridge"});
				
		map.addOverlay(polyline);		
	},
 	 dataType:'json'
});
		
}
</script>
