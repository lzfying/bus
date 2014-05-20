<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>站点选区查询</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>/css/table.css">
		<style type="text/css">
html {
	height: 100%
}

body {
	height: 100%;
	margin: 0px;
	padding: 0px
}

#container {
	height: 100%
}

#apDiv1 {
	position: absolute;
	width: 500px;
	height: 50px;
	z-index: 100000;
	margin-left: 220px;
	margin-top: 5px;
}

#apDiv3 {
	position: absolute;
	width: 800px;
	height: 60px;
	z-index: 2;
	right: 5px;
	bottom: 10px;
}

#apDiv100 {
	position: absolute;
	width: 200px;
	height: 50px;
	z-index: 2;
	margin-left: 5px;
	margin-top: 5px;
}
</style>
		<script type="text/javascript"
			src="http://api.map.baidu.com/api?v=1.5&ak=n1SSalem6xqM2OrVQVf3NkcG"></script>
		<script type="text/javascript"
			src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>/js/jquery-1.6.2.min.js"></script>
		<script type="text/javascript"
			src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>/FusionCharts/FusionCharts.js"></SCRIPT>
		<link rel="stylesheet"
			href="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css" />
		<!--加载检索信息窗口-->
		<script type="text/javascript"
			src="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.js"></script>
		<link rel="stylesheet"
			href="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.css" />
		<link rel="stylesheet"
			href="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css" />
		<script type="text/javascript">

var map =null;
// 地图展示
function init(){
map = new BMap.Map("container");
//map.addControl(new BMap.NavigationControl());
map.addControl(new BMap.ScaleControl());
map.addControl(new BMap.OverviewMapControl());
map.addControl(new BMap.MapTypeControl());
map.enableScrollWheelZoom();
map.enableContinuousZoom();
var point = new BMap.Point(116.960997, 36.6814599); 
map.centerAndZoom(point, 15);
tj_KLL();
}

// 编写自定义函数,创建标注
function addMarker(point,station_name,sxx){
 var content = '<div style="margin:0;line-height:20px;padding:2px;">' +
                    '<img src="<%=basePath%>/img/gj.jpg" alt="公交" style="float:right;zoom:1;overflow:hidden;width:100px;height:100px;margin-left:3px;"/>' +
                    '站点名称：'+station_name+'<br/>'+sxx+'</div>';
//创建检索信息窗口对象
    var searchInfoWindow = null;
	searchInfoWindow = new BMapLib.SearchInfoWindow(map, content, {
			title  : "站点说明",      //标题
			width  : 290,             //宽度
			height : 105,              //高度
			panel  : "panel",         //检索结果面板
			enableAutoPan : true,     //自动平移
			searchTypes   :[
				BMAPLIB_TAB_SEARCH  //周边检索
			]
		});
  var marker = new BMap.Marker(point);
    marker.addEventListener("click", function(e){
	    searchInfoWindow.open(marker);
    })
  map.addOverlay(marker);
}

// 搜索站点客流
function selectStationPS(lng,lat,lng1,lat1){
var baidu_lng="";
var baidu_lat="";
var station_name="";
var station_id="";
var sxx="";
var p_down="";
var p_up="";
var p_duan="";
var strXML="";
$.ajax({
				type:"POST",
				url:"<%=basePath%>/servlet/SelectPassergerServlet",
				data:{lng:lng,
					  lat:lat,
					  lng1:lng1,
					  lat1:lat1},
				success:function (msg){
					if(msg==""){
						alert("查询获取数据失败！");
					}else{
						// 清楚搜有覆盖物
						map.clearOverlays();
						var tableStr='<table id="mytable" style="width:100%;" cellspacing="1"><tr><th scope="col">线路</th><th scope="col">站点'+
						'</th><th scope="col">站点名称</th></tr>';
						var stas=msg.split("|");
						var bounds = map.getBounds();
						var sw = bounds.getSouthWest();
						var ne = bounds.getNorthEast();
						var lngSpan = Math.abs(sw.lng - ne.lng);
						var latSpan = Math.abs(ne.lat - sw.lat);
						if(stas.length>0){
							for (var i = 0; i < 10; i ++) {
							tableStr=tableStr+'<tr>';
							  var stas_attres=stas[i].split("@");
							  if(stas_attres.length>1){
							  	  if(stas_attres[0].split("=").length>1){
							  	     route_id=stas_attres[0].split("=")[1];
							  	  	 tableStr=tableStr+'<td>'+stas_attres[0].split("=")[1]+'</td>';
							  	  }
							  	   if(stas_attres[1].split("=").length>1){
							  	   	 station_id=stas_attres[1].split("=")[1]
							  	  	 tableStr=tableStr+'<td>'+stas_attres[1].split("=")[1]+'</td>';
							  	  }
							  	  if(stas_attres[2].split("=").length>1){
							  	    station_name=stas_attres[2].split("=")[1];
							  	  	tableStr=tableStr+'<td>'+stas_attres[2].split("=")[1]+'</td>';
							  	  }
							  	  if(stas_attres[3].split("=").length>1){
							  	  	baidu_lng=stas_attres[3].split("=")[1];
							  	  }
							  	  if(stas_attres[4].split("=").length>1){
							  	  	baidu_lat=stas_attres[4].split("=")[1];
							  	  }
							  	  if(stas_attres[5].split("=").length>1){
							  	  	sxx=stas_attres[5].split("=")[1];
							  	  }
							  	  if(stas_attres[6].split("=").length>1){
							  	  	p_down=stas_attres[6].split("=")[1];
							  	  	// 客流上客
							  	  	strXML=strXML+"<set name='"+route_id+"-"+station_id+"' value='"+stas_attres[6].split("=")[1]+"' color='AFD8F8'/>";
							  	  }
							  	  if(stas_attres[7].split("=").length>1){
							  	    // 客流下客
							  	  	p_up=stas_attres[7].split("=")[1];
							  	  }
							  	  if(stas_attres[8].split("=").length>1){
							  	  	 // 客流断面
							  	  	p_duan=stas_attres[8].split("=")[1];
							  	  }
								  var point = new BMap.Point(baidu_lng, baidu_lat);
								  addMarker(point,station_name,sxx);
							  }
							}
							tableStr=tableStr+'</tr>';
						}
						tableStr=tableStr+'</table>';
						document.getElementById("showTable").innerHTML=tableStr;
						var point = new BMap.Point(lng,lat); 
						map.centerAndZoom(point, 15);  
						tj_KLL(strXML);
						closeDraw();
					}
				}
		});
}

var styleOptions = {
        strokeColor:"blue",    //边线颜色。
        fillColor:"blue",      //填充颜色。当参数为空时，圆形将没有填充效果。
        strokeWeight: 3,       //边线的宽度，以像素为单位。
        strokeOpacity: 0.8,	   //边线透明度，取值范围0 - 1。
        fillOpacity: 0.6,      //填充的透明度，取值范围0 - 1。
        strokeStyle: 'solid' //边线的样式，solid或dashed。
    }
    
//回调获得覆盖物信息
    var overlaycomplete = function(e){
            var obj=e.overlay.hh;
            $("#lat").val(obj[0].lat);
            $("#lng").val(obj[0].lng);
            $("#lat1").val(obj[2].lat);
            $("#lng1").val(obj[2].lng);
            selectStationPS(obj[0].lng,obj[0].lat,obj[2].lng,obj[2].lat);
    };
var drawingManager =null;

// 初始化画笔
function draw_init(){
  //实例化鼠标绘制工具
    drawingManager = new BMapLib.DrawingManager(map, {
        isOpen: false, //是否开启绘制模式
        enableDrawingTool: false, //是否显示工具栏
        circleOptions: styleOptions, //圆的样式
        rectangleOptions: styleOptions //矩形的样式
    });
    
    //添加鼠标绘制工具监听事件，用于获取绘制结果
    drawingManager.addEventListener('overlaycomplete', overlaycomplete);
}
function drawCircle(){
draw_init();
drawingManager.open();
drawingManager.setDrawingMode(BMAP_DRAWING_RECTANGLE);
$("#openTool").attr("disabled",true);
}

function clearMap(){
map.clearOverlays();
document.getElementById("openTool").disabled = false;
}

function closeDraw(){
drawingManager.close();
drawingManager.disableCalculate();
document.getElementById("openTool").disabled = false;
}

// 统计客流量
function tj_KLL(strXML){
var strXML="<graph caption='高峰客流量'>"+strXML+"</graph>";
var chart3 = new FusionCharts("<%=basePath%>/FusionCharts/FCF_Line.swf", "chart3Id", "800", "140"); 
chart3.setDataXML(strXML);
chart3.render("chart3div");
}

</script>
	</head>
	<body onload="init();">
		<div id="apDiv1">
			<input type="button" id="openTool" name="openTool" value="打开工具"
				onclick="drawCircle();" />
			<input type="button" value="清除选区" onclick="clearMap();" />
		</div>
		<div id="apDiv100">
			<div id="showTable" style="height: 500px; overflow: auto;">
				<table id="mytable" style="width: 100%;" cellspacing="1">
					<tr>
						<th scope="col">
							线路
						</th>
						<th scope="col">
							站点
						</th>
						<th scope="col">
							站点编号
						</th>
					</tr>
					<tr>
					<td>
						</td>
						<td>
						</td>
						<td>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="apDiv3">
			<div id="chart3div">
			</div>
		</div>
		<div id="container"></div>
		<input type="hidden" id="lng" name="lng" />
		<input type="hidden" id="lat" name="lat" />
		<input type="hidden" id="lng1" name="lng1" />
		<input type="hidden" id="lat1" name="lat1" />
	</body>
</html>
