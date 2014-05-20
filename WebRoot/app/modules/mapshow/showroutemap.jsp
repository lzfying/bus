<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<head>
<title>济南公交系统</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=BP3QtYgK2SY5WwA6i2Ug0TGh&callback"></script>
<title>折线</title>
</head>
<body>
<div style=" width:100%; height:100%;">
  <div>
    <form action="">
      线路
	  <input type="text" name="route_id" id="route_id">
	  上/下行
	  <select  name="sxx" id="sxx">
		<option value="上行" elected="selected">上行</option>
		<option value="下行">下行</option>
	  </select>
	  <input type="button" value="提交" onClick="showInfo()">
    </form>
  </div>
  <div id="allmap"  style=" width:100%; height:100%;"></div>
</div>
</body>
</html>
<script type="text/javascript">

// 百度地图API功能
var map = new BMap.Map("allmap");
var point = new BMap.Point(117.007863, 36.676649);
map.centerAndZoom(point, 15);
map.enableScrollWheelZoom();  
function createXMLHTTP() 
{ 
  if(window.XMLHttpRequest) 
  { 
    xmlHttp = new XMLHttpRequest();//Mozilla浏览器 
  } 
  else if(window.ActiveXObject) 
  { 
    try 
    { 
      xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");//IE老版本 
    } 
    catch (e) 
    { } 
    try 
    { 
      xmlHttp = new ActiveXObject("Microsoft.XMLHTTP"); //IE新版本 
    } 
    catch (e) 
    { } 
    if (!xmlHttp) 
    { 
      window.alert("不能创建XMLHttpRequest对象实例!"); 
      return false; 
    } 
  } 
} 
$(document).ready(function(){
	
});
//显示信息
function showInfo(){
	map.clearOverlays();
	showRouteInfo();
	
}
//显示线路上的站点信息
function showStationInfo(){
			createXMLHTTP();
            xmlHttp.onreadystatechange=function()
            {
              if (xmlHttp.readyState==4 && xmlHttp.status==200)
                {
					var js=xmlHttp.responseText;
					var objs =  eval(js);
					for(var i=0;i<objs.length;i++){
						var sign = 2;
						if(i == 0){
							sign = 0;
						}else if( i == objs.length-1){
							sign = 1;
						}
						addStationMaker(objs[i],sign);
					}
                }
            }
            var url="mapshow.do?reqCode=queryRouteStation&route_id="+document.getElementById("route_id").value+"&sxx="+document.getElementById("sxx").value;
            xmlHttp.open("GET",url,true);
            xmlHttp.send(null);
}
//显示站点
function addStationMaker(objs,sign){
	var point=new BMap.Point(objs.lng, objs.lat);
	if(sign != 2){
		//setTimeout(function(){
			map.setZoom(14);
    		map.panTo(point);
		//}, 1500);
		var optl = {
 		position : point,    // 指定文本标注所在的地理位置
  		offset   : new BMap.Size(30, -30)    //设置文本偏移量
 		}
		var string = "终:";
		if( sign == 1){
			string = "始:"
		}
		var label = new BMap.Label(""+string+objs.name, optl);  // 创建文本标注对象
		label.setStyle({
		 	 color : "blue",
			 borderColor:"blue",
			 fontSize : "12px",
			 height : "20px",
			 lineHeight : "20px",
			 fontFamily:"微软雅黑"
		 });
		map.addOverlay(label);
	}
	
	var src = "";
	var station_type_name = "";
	switch(objs.station_type){
		case "1": src = "resource/image/map/lt3.gif"; station_type_name = "直列式"; break;
		case "2": src = "resource/image/map/lt2.gif"; station_type_name = "港湾式"; break;
		case "3": src = "resource/image/map/lt2_old.gif"; station_type_name = "BRT站台"; break;
	}
	var icon = new BMap.Icon(src, new BMap.Size(10,10));
	var marker = new BMap.Marker(point,{icon: icon});  // 创建标注
	map.addOverlay(marker);
	marker.addEventListener("click",function(){  
      	var opts = {
		title:objs.name,
        width : 350,     // 信息窗口宽度
		height:150,     // 信息窗口高度
        offset: new BMap.Size(0, -20)
        }
    	var content = '<div style="margin:0;fontSize:10px;line-height:20px;padding:2px;">' + '站台形式：'+station_type_name+'<br/>站台长度：'+objs.len+'米<br/>距离上站：'+objs.ssd+'米<br/>途经线路：'+objs.sjcc+'' +'</div>';
        var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象
        map.openInfoWindow(infoWindow,point);
		});
}
//显示线路
function showRouteInfo()
        {
            createXMLHTTP();
            xmlHttp.onreadystatechange=function()
            {
              if (xmlHttp.readyState==4 && xmlHttp.status==200)
                {
					var routejson=xmlHttp.responseText;
					var obj =  eval(routejson);
					showRoute(obj);
                }
            }
            var url="mapshow.do?reqCode=queryRouteMap&route_id="+document.getElementById("route_id").value+"&sxx="+document.getElementById("sxx").value;
            xmlHttp.open("GET",url,true);
            xmlHttp.send(null);
        }	
function showRoute(obj){
	var points = [];
	var pointsz = [];
	var j = 0;
	for(var i=0;i<obj.length;i++){
		point=new BMap.Point(obj[i].lng, obj[i].lat);
		points[i]=point;
		if(obj[i].buslane == 1){
			pointsz[j] = new BMap.Point(obj[i].lng, obj[i].lat);
			j++;
		}else{
			if(j != 0 && pointsz.length > 0){
				var polylinez = new BMap.Polyline(pointsz, {strokeColor:"red", strokeWeight:8, strokeStyle:"ridge"});
				map.addOverlay(polylinez);
				j = 0;
				pointsz = [];	
			}
		}
	}
	
	var polyline = new BMap.Polyline(points, {strokeColor:"blue", strokeWeight:6,strokeStyle:"ridge"});
	setTimeout(function(){
		var label = null;
		polyline.addEventListener("onmouseover",function(e){
		var optl = {
 		position : e.point,    // 指定文本标注所在的地理位置
  		offset   : new BMap.Size(30, -30)    //设置文本偏移量
 		}
		label = new BMap.Label(obj[0].route_id+"路-"+obj[0].sxx, optl);  // 创建文本标注对象
		label.setStyle({
		 color : "red",
		 fontSize : "12px",
		 height : "20px",
		 lineHeight : "20px",
		 fontFamily:"微软雅黑"
	 	});
		map.addOverlay(label);
 		});
 		polyline.addEventListener("mouseout",function(){
		map.removeOverlay(label);
 		});
	}, 100);
	setTimeout(function(){
		polyline.addEventListener("click",function(e){
			showImg(e.point,obj[0].route_id,obj[0].sxx);
		});
	},100);
	
	map.addOverlay(polyline);
	
	//线路信息显示完了之后再加载站点信息
	showStationInfo();
}

//图片弹窗
function tanchuang(){
	 var opts = {
			  width : 0,     // 信息窗口宽度
         	  height: 0,     // 信息窗口高度
        	  enableMessage:true,//设置允许信息窗发送短息
        	  offset: new BMap.Size(0, -20),
         	  title:xl+"路-车道数量："
     		}
            var content = '<div style="margin:0;line-height:20px;padding:2px;">' +"束带结发"+'</div>';
        	var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象
			map.openInfoWindow(infoWindow,point);
}
//下载图片
function showImg(point, id, sxx){
            createXMLHTTP();
            xmlHttp.onreadystatechange=function()
            {
              if (xmlHttp.readyState==4 && xmlHttp.status==200)
                {
					var routejson=xmlHttp.responseText;
					var obj =  eval(routejson);
					//showRouteImg(obj);
                }
            }
            var url="mapshow.do?reqCode=queryRouteImg&route_id="+id+"&lng="+point.lng+"&lat="+point.lat+"&sxx="+sxx;
            xmlHttp.open("GET",url,true);
            xmlHttp.send(null);
}
  
</script>
