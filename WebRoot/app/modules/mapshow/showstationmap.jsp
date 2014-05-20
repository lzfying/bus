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

<title>折线</title>
</head>
<body>
<div style=" width:100%; height:100%;">
  <div>
    <form action="">
     站点查询
      <input type="text" name="station_name" id="station_name">
   	  <input type="button" value="提交" onClick="showStation()">
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
function showStation(){
	map.clearOverlays();
	
	$.getJSON("mapshow.do?reqCode=queryStationMap",{
	station_name:document.getElementById("station_name").value,
	loginuserid:"developer"
	},function(js){
	showStationInfo(js);
	}
	);
} /*

request.
//显示站点
$.getJSON("mapshow.do",{
	reqCode:"queryStationMap",
	station_name:document.getElementById("station_name").value
},function(js){
	showStationInfo(js);
}
);*/
function showStationInfo(js){
		var obj =  eval(js);
		for(var i=0;i<obj.length;i++){
			if( i == obj.length/2){
				map.panTo(new BMap.Point(obj[i].lng,obj[i].lat));
			}
			addTextMaker(obj[i]);
		}
 }
 
function addTextMaker(obj){
	var point=new BMap.Point(obj.lng, obj.lat);
	var marker = new BMap.Marker(point);  // 创建标注
						map.addOverlay(marker); 
												var opts = {
        					position : point,    // 指定文本标注所在的地理位置
							offset: new BMap.Size(-5, -25)    //设置文本偏移量
        				}
						var station_type_name = "";
						switch(obj.type){
							case "1": station_type_name = "直列式"; break;
							case "2": station_type_name = "港湾式"; break;
							case "3": station_type_name = "BRT站台"; break;
						}
       			    	var infocontent=obj.cars;
        				var label = new BMap.Label(infocontent, opts);  // 创建文本标注对象
					    label.setStyle({
		 					color : "#FFFFFF",
		 					fontSize : "12px",
		 					height : "20px",
		 					lineHeight : "20px",
		 					fontFamily:"微软雅黑",
		 					border :"0", 
		 					fontWeight :"bold" ,
		 					backgroundColor :"0.05"
	 					});
    					map.addOverlay(label); 
						marker.addEventListener("click",function(){  
      					   	var opts = {
        					 width : 300,     // 信息窗口宽度
							 height: 150,     // 信息窗口高度
          					 offset: new BMap.Size(0, -20),
							 title:"站点名称："+obj.name
        					 }
    						var content = '<div style="margin:0;fontSize : 12px;line-height:20px;padding:2px;">' + '站台形式：'+station_type_name+'<br/>站台长度：'+obj.len+'米<br/>站台宽度：'+obj.wid+'米<br/>广告位数：'+obj.ggw+'<br/>途经线路：'+obj.sjcc+'' +'</div>';
        					var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象
        					map.openInfoWindow(infoWindow,point);
						});
 }
  
</script>
