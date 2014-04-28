<%@ page language="C#" autoeventwireup="true" inherits="Combination_Route, App_Web_zhcctc5x" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="keywords" content="�ٶȵ�ͼ,�ٶȵ�ͼAPI���ٶȵ�ͼ�Զ��幤�ߣ��ٶȵ�ͼ���������ù���" />
<meta name="description" content="�ٶȵ�ͼAPI�Զ����ͼ�������û��ڿ��ӻ����������ɰٶȵ�ͼ" />
<title>������·���</title>
<style type="text/css"> 
body,div,h2{margin:0;padding:0;}
#drag{position:absolute;top:100px;left:100px;width:300px;height:400px;background:#e9e9e9;border:1px solid #444;border-radius:5px;box-shadow:0 1px 3px 2px #666;}
#drag .title{position:relative;height:27px;margin:5px;}
#drag .title h2{font-size:14px;height:27px;line-height:24px;border-bottom:1px solid #A1B4B0;}
#drag .title div{position:absolute;height:19px;top:2px;right:0;}
#drag .title a,a.open{float:left;width:21px;height:19px;display:block;margin-left:5px;background:url(img/tool.png) no-repeat;}
a.open{position:absolute;top:10px;left:50%;margin-left:-10px;background-position:0 0;}
a.open:hover{background-position:0 -29px;}
#drag .title a.min{background-position:-29px 0;}
#drag .title a.min:hover{background-position:-29px -29px;}
#drag .title a.max{background-position:-60px 0;}
#drag .title a.max:hover{background-position:-60px -29px;}
#drag .title a.revert{background-position:-149px 0;display:none;}
#drag .title a.revert:hover{background-position:-149px -29px;}
#drag .title a.close{background-position:-89px 0;}
#drag .title a.close:hover{background-position:-89px -29px;}
#drag .content{overflow:auto;margin:0 5px;}
#drag .resizeBR{position:absolute;width:14px;height:14px;right:0;bottom:0;overflow:hidden;cursor:nw-resize;background:url(img/resize.png) no-repeat;}
#drag .resizeL,#drag .resizeT,#drag .resizeR,#drag .resizeB,#drag .resizeLT,#drag .resizeTR,#drag .resizeLB{position:absolute;background:#000;overflow:hidden;opacity:0;filter:alpha(opacity=0);}
#drag .resizeL,#drag .resizeR{top:0;width:5px;height:100%;cursor:w-resize;}
#drag .resizeR{right:0;}
#drag .resizeT,#drag .resizeB{width:100%;height:5px;cursor:n-resize;}
#drag .resizeT{top:0;}
#drag .resizeB{bottom:0;}
#drag .resizeLT,#drag .resizeTR,#drag .resizeLB{width:8px;height:8px;background:#FF0;}
#drag .resizeLT{top:0;left:0;cursor:nw-resize;}
#drag .resizeTR{top:0;right:0;cursor:ne-resize;}
#drag .resizeLB{left:0;bottom:0;cursor:ne-resize;}
</style>
<script type="text/javascript"> 
/*-------------------------- +
  ��ȡid, class, tagName
 +-------------------------- */
var get = {
	byId: function(id) {
		return typeof id === "string" ? document.getElementById(id) : id
	},
	byClass: function(sClass, oParent) {
		var aClass = [];
		var reClass = new RegExp("(^| )" + sClass + "( |$)");
		var aElem = this.byTagName("*", oParent);
		for (var i = 0; i < aElem.length; i++) reClass.test(aElem[i].className) && aClass.push(aElem[i]);
		return aClass
	},
	byTagName: function(elem, obj) {
		return (obj || document).getElementsByTagName(elem)
	}
};
var dragMinWidth = 250;
var dragMinHeight = 124;
/*-------------------------- +
  ��ק����
 +-------------------------- */
function drag(oDrag, handle)
{
	var disX = dixY = 0;
	var oMin = get.byClass("min", oDrag)[0];
	var oMax = get.byClass("max", oDrag)[0];
	var oRevert = get.byClass("revert", oDrag)[0];
	var oClose = get.byClass("close", oDrag)[0];
	handle = handle || oDrag;
	handle.style.cursor = "move";
	handle.onmousedown = function (event)
	{
		var event = event || window.event;
		disX = event.clientX - oDrag.offsetLeft;
		disY = event.clientY - oDrag.offsetTop;
		
		document.onmousemove = function (event)
		{
			var event = event || window.event;
			var iL = event.clientX - disX;
			var iT = event.clientY - disY;
			var maxL = document.documentElement.clientWidth - oDrag.offsetWidth;
			var maxT = document.documentElement.clientHeight - oDrag.offsetHeight;
			
			iL <= 0 && (iL = 0);
			iT <= 0 && (iT = 0);
			iL >= maxL && (iL = maxL);
			iT >= maxT && (iT = maxT);
			
			oDrag.style.left = iL + "px";
			oDrag.style.top = iT + "px";
			
			return false
		};
		
		document.onmouseup = function ()
		{
			document.onmousemove = null;
			document.onmouseup = null;
			this.releaseCapture && this.releaseCapture()
		};
		this.setCapture && this.setCapture();
		return false
	};	
	//��󻯰�ť
	oMax.onclick = function ()
	{
		oDrag.style.top = oDrag.style.left = 0;
		oDrag.style.width = document.documentElement.clientWidth - 2 + "px";
		oDrag.style.height = document.documentElement.clientHeight - 2 + "px";
		this.style.display = "none";
		oRevert.style.display = "block";
	};
	//��ԭ��ť
	oRevert.onclick = function ()
	{		
		oDrag.style.width = dragMinWidth + "px";
		oDrag.style.height = dragMinHeight + "px";
		oDrag.style.left = (document.documentElement.clientWidth - oDrag.offsetWidth) / 2 + "px";
		oDrag.style.top = (document.documentElement.clientHeight - oDrag.offsetHeight) / 2 + "px";
		this.style.display = "none";
		oMax.style.display = "block";
	};
	//��С����ť
	oMin.onclick = oClose.onclick = function ()
	{
		oDrag.style.display = "none";
		var oA = document.createElement("a");
		oA.className = "open";
		oA.href = "javascript:;";
		oA.title = "��ԭ";
		document.body.appendChild(oA);
		oA.onclick = function ()
		{
			oDrag.style.display = "block";
			document.body.removeChild(this);
			this.onclick = null;
		};
	};
	//��ֹð��
	oMin.onmousedown = oMax.onmousedown = oClose.onmousedown = function (event)
	{
		this.onfocus = function () {this.blur()};
		(event || window.event).cancelBubble = true	
	};
}
/*-------------------------- +
  �ı��С����
 +-------------------------- */
function resize(oParent, handle, isLeft, isTop, lockX, lockY)
{
	handle.onmousedown = function (event)
	{
		var event = event || window.event;
		var disX = event.clientX - handle.offsetLeft;
		var disY = event.clientY - handle.offsetTop;	
		var iParentTop = oParent.offsetTop;
		var iParentLeft = oParent.offsetLeft;
		var iParentWidth = oParent.offsetWidth;
		var iParentHeight = oParent.offsetHeight;
		
		document.onmousemove = function (event)
		{
			var event = event || window.event;
			
			var iL = event.clientX - disX;
			var iT = event.clientY - disY;
			var maxW = document.documentElement.clientWidth - oParent.offsetLeft - 2;
			var maxH = document.documentElement.clientHeight - oParent.offsetTop - 2;			
			var iW = isLeft ? iParentWidth - iL : handle.offsetWidth + iL;
			var iH = isTop ? iParentHeight - iT : handle.offsetHeight + iT;
			
			isLeft && (oParent.style.left = iParentLeft + iL + "px");
			isTop && (oParent.style.top = iParentTop + iT + "px");
			
			iW < dragMinWidth && (iW = dragMinWidth);
			iW > maxW && (iW = maxW);
			lockX || (oParent.style.width = iW + "px");
			
			iH < dragMinHeight && (iH = dragMinHeight);
			iH > maxH && (iH = maxH);
			lockY || (oParent.style.height = iH + "px");
			
			if((isLeft && iW == dragMinWidth) || (isTop && iH == dragMinHeight)) document.onmousemove = null;
			
			return false;	
		};
		document.onmouseup = function ()
		{
			document.onmousemove = null;
			document.onmouseup = null;
		};
		return false;
	}
};
window.onload = window.onresize = function ()
{
	var oDrag = document.getElementById("drag");
	var oTitle = get.byClass("title", oDrag)[0];
	var oL = get.byClass("resizeL", oDrag)[0];
	var oT = get.byClass("resizeT", oDrag)[0];
	var oR = get.byClass("resizeR", oDrag)[0];
	var oB = get.byClass("resizeB", oDrag)[0];
	var oLT = get.byClass("resizeLT", oDrag)[0];
	var oTR = get.byClass("resizeTR", oDrag)[0];
	var oBR = get.byClass("resizeBR", oDrag)[0];
	var oLB = get.byClass("resizeLB", oDrag)[0];
	
	drag(oDrag, oTitle);
	//�Ľ�
	resize(oDrag, oLT, true, true, false, false);
	resize(oDrag, oTR, false, true, false, false);
	resize(oDrag, oBR, false, false, false, false);
	resize(oDrag, oLB, true, false, false, false);
	//�ı�
	resize(oDrag, oL, true, false, false, true);
	resize(oDrag, oT, false, true, true, false);
	resize(oDrag, oR, false, false, false, true);
	resize(oDrag, oB, false, false, true, false);
	
	oDrag.style.left = (document.documentElement.clientWidth - oDrag.offsetWidth) / 2 + "px";
	oDrag.style.top = (document.documentElement.clientHeight - oDrag.offsetHeight) / 2 + "px";
}
</script>



<!--���ðٶȵ�ͼAPI-->
<style type="text/css">
    html,body{margin:0;padding:0;}
    .iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
    .iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
    .style1
    {
        width: 100%;
        border-style: solid;
        border-width: 1px;
        height:90%;
    }
</style>
<script src="http://api.map.baidu.com/api?v=1.3" type="text/javascript"></script>
</head>

<body>
    <form id="form1" runat="server">
  <!--�ٶȵ�ͼ����-->
              <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
  <div style="height:90%">
      <table align="center" rules="all" class="style1">
          <tr>
              <td style="width:25%; vertical-align:top">
              <div style="overflow:scroll ; height:800px">
                  <div id="jwd"></div>
                  <div></div>
                   <div id="xxx">

            <p>
                ���ƣ�<asp:TextBox ID="routename" runat="server" Width="140px"></asp:TextBox>

                </p>
                <p>��·����<asp:DropDownList ID="dlfx" runat="server">
                               <asp:ListItem Value="E">��</asp:ListItem>
                               <asp:ListItem Value="S">��</asp:ListItem>
                               <asp:ListItem Value="W">��</asp:ListItem>
                               <asp:ListItem Value="N">��</asp:ListItem>
                           </asp:DropDownList>
                           <input type="button" value="����" onclick="showCustomer2();" />
                           </p>
      
<%--                           <p>
                               ��ţ�<asp:TextBox ID="TextBox2" runat="server" Width="140px">1</asp:TextBox>
                           </p>--%>

                               <div>************************</div>

                               <div>
                                   &nbsp;<div>
                                       <div id="Div1">·�����ƣ�
                                       <input type="text" id="luduanname" />
                                       </div>
                                       <div id="markjwd">·�α�ţ�
                                       <input type="text" id="luduanmaster" />
                                       </div>
                                       <div id="markjwd2">��·��ţ�
                                           <input type="text" id="dlxh2" value="1" />
                                       </div>
                                       <div id="info1">
                                       </div>
                                       <div id="info2">
                                       </div>
                                   </div>
                               </div>
    </div></div></td>
              <td style="width:80%">
                    <div style="width:100%;height:800px;border:#ccc solid 1px;" id="dituContent"></div></td>
          </tr>
      </table>
    </div>
   <div id="drag">
    <div class="title">
        <h2>����һ�������϶��Ĵ���</h2>
        <div>
            <a class="min" href="javascript:;" title="��С��"></a>
            <a class="max" href="javascript:;" title="���"></a>
            <a class="revert" href="javascript:;" title="��ԭ"></a>
            <a class="close" href="javascript:;" title="�ر�"></a>
        </div>
    </div>
    <div class="resizeL"></div>
    <div class="resizeT"></div>
    <div class="resizeR"></div>
    <div class="resizeB"></div>
    <div class="resizeLT"></div>
    <div class="resizeTR"></div>
    <div class="resizeBR"></div>
    <div class="resizeLB"></div>
    <div class="content">
<p>
   ��·��<asp:TextBox ID="TextBox1" runat="server" Width="100px"></asp:TextBox>
</p>
<p>
����<asp:DropDownList ID="DropDownList1" runat="server" Width="140px">
   <asp:ListItem>����</asp:ListItem>
   <asp:ListItem>����</asp:ListItem>
</asp:DropDownList>
        </p>
        <p>   <input onclick="showCustomer();" type="button" value="�鿴" />
   <input onclick="add();" type="button" value="���" />
   <input onclick="del();" type="button" value="ɾ��" />
    <input onclick="showCustomer33();" type="button" value="����" />
   </p>
        <p>**********************************</p>
        <p>��·��ţ�<input type="text" id="dlxh" /></p>
        <p>ѡ���1:<input type="text" id="bdjdtext" /></p>
        <p>ѡ���2:<input type="text" id="bdwdtext" /></p>
        <p><input type="button" value="��·����" onclick="update_road();"  /><input type="button" value="��ȡ����·��" onclick="getbus();"  /></p>
        <p><input type="text" id="zt"/></p>
    </div>    
</div>
<div id="info"></div>
</form>
</body>



<script type="text/javascript">
   //�����ͳ�ʼ����ͼ������
    var point ;
    var xmlHttp;
    var bx,by,xh;
    function initMap()
    {
        createMap();//������ͼ
        setMapEvent();//���õ�ͼ�¼�
        addMapControl();//���ͼ��ӿؼ�
    }
    
    //������ͼ������
    function createMap()
    {
        var map = new BMap.Map("dituContent");//�ڰٶȵ�ͼ�����д���һ����ͼ
        point = new BMap.Point(117.007863, 36.676649);//����һ�����ĵ�����
        map.centerAndZoom(point,11);//�趨��ͼ�����ĵ�����겢����ͼ��ʾ�ڵ�ͼ������
        window.map = map;//��map�����洢��ȫ��}

    var marker;
        function creatmarker(point)
        {
//         marker=new BMap.Marker(point)
//        map.addOverlay(marker);
        document.getElementById("bdwdtext").value=point.lng+";"+point.lat;
        marker.addEventListener("rightclick", function(){document.getElementById("bdwdtext").value=""; document.getElementById("bdjdtext").value=point.lng+";"+point.lat;});
        }

//        function showInfo(e){
//         createXMLHTTP();
//            xmlHttp.onreadystatechange=function(){
//              if (xmlHttp.readyState==4 && xmlHttp.status==200)
//                {
//                var strjwdd=xmlHttp.responseText;
//                 mycars=strjwdd.split("|"); //�ַ��ָ� 
//                var pt = new BMap.Point(mycars[0], mycars[1]);
//                document.getElementById("dlxh").value=mycars[3];
//                creatmarker(pt);
//                }
//                }
//                    var dropDownListt=document.getElementById("DropDownList1");
//                    var zzzz=dropDownListt.options[dropDownListt.selectedIndex].value;
//                    var route=document.getElementById("TextBox1").value;
////                    var road_id=document.getElementById("dlxh").value;
//                var url="ReadGPS2.aspx?id=0&lng="+e.point.lng+"&lat="+e.point.lat+"&route="+route+"&fx="+zzzz;
//                xmlHttp.open("post",url,true);
//                xmlHttp.send(null);
//        }
//        map.addEventListener("click", showInfo);
            }
    
    
    //��ͼ�¼����ú�����
    function setMapEvent()
    {
        map.enableDragging();//���õ�ͼ��ק�¼���Ĭ������(�ɲ�д)
        map.enableScrollWheelZoom();//���õ�ͼ���ַŴ���С
        map.enableDoubleClickZoom();//�������˫���Ŵ�Ĭ������(�ɲ�д)
        map.enableKeyboard();//���ü����������Ҽ��ƶ���ͼ
    }
    
    //��ͼ�ؼ���Ӻ�����
    function addMapControl()
    {
        //���ͼ��������ſؼ�
	var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
	map.addControl(ctrl_nav);
        //���ͼ���������ͼ�ؼ�
	var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
	map.addControl(ctrl_ove);
        //���ͼ����ӱ����߿ؼ�
	var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
	map.addControl(ctrl_sca);
	
	map.addControl(new BMap.MapTypeControl({mapTypes: [BMAP_NORMAL_MAP,BMAP_HYBRID_MAP]}));     //2Dͼ������ͼ

    map.addControl(new BMap.MapTypeControl({anchor: BMAP_ANCHOR_TOP_RIGHT}));    //���Ͻǣ�Ĭ�ϵ�ͼ�ؼ�
    }
    
    
    function update_road()
    {
        var mdd=document.getElementById("dlxh").value;
        var bdwd=document.getElementById("bdwdtext").value;
        var bdjd=document.getElementById("bdjdtext").value;
        createXMLHTTP();
        xmlHttp.onreadystatechange=function()
        {
          if (xmlHttp.readyState==4 && xmlHttp.status==200)
            {
            var strjwddd=xmlHttp.responseText;
            if(strjwddd==2)
            {
            document.getElementById("zt").value="�޸ĳɹ�!";
            document.getElementById("zt").style.backgroundColor="green";
            }
            else
            {
            document.getElementById("zt").value="�޸�ʧ��!";
            document.getElementById("zt").style.backgroundColor="red";
            }
            }
        }
            var url="ReadGPS.aspx?id=44&mdd="+mdd+"&bdwd="+bdwd+"&bdjd="+bdjd;
            xmlHttp.open("post",url,true);
            xmlHttp.send(null);
    }
    
    
    
//    function yichuliluduan()
//{
//var zzzz=document.getElementById("dlxh").value;
//createXMLHTTP();
//xmlHttp.onreadystatechange=function()
//{
//  if (xmlHttp.readyState==4 && xmlHttp.status==200)
//    {
//    var strjwddd=xmlHttp.responseText;
//     var mycarss=strjwddd.split("*"); //�ַ��ָ� 
//     addPolyline2(mycarss);//���ͼ����   
//    }
//}
//    var url="ReadGPS.aspx?id=44&route="+zzzz;
//    xmlHttp.open("post",url,true);
//    xmlHttp.send(null);
//}

//    function addPolyline2(mycarss){
//         map.clearOverlays();//�����ͼ������
//			var points22 = [];
//			for(var j=0;j<mycarss.length;j++){
//				var p1 = mycarss[j].split("|")[1];
//				var p2 = mycarss[j].split("|")[2];
//				var p3 = mycarss[j].split("|")[0];
//				var p4;
//				if(j!=mycarss.length-1)
//				{
//				p4 = mycarss[j+1].split("|")[0];
//				}
//				else
//				{
//				p4=p3;
//				}
//				points22.push(new BMap.Point(p1,p2));
//				if(p3!=p4)
//				{
//				var line22 = new BMap.Polyline(points22,{strokeColor:"red", strokeWeight:4, strokeOpacity:0});
//			    map.addOverlay(line22);
//				points22 = [];
//				}
//			}
//			var line2 = new BMap.Polyline(points22,{strokeColor:"red", strokeWeight:4, strokeOpacity:0});
//			map.addOverlay(line2);
//        }

//    
//    
    
    
    
    
  function getbus()
{
var busline = new BMap.BusLineSearch(map,{
    renderOptions:{map:map,panel:"info"},
        onGetBusListComplete: function(result){
           if(result) {
             var fstLine = result.getBusListItem(0);//��ȡ��һ�������б���ʾ��map��
             busline.getBusLine(fstLine);
           }
        }
});
var t=document.getElementById("TextBox1").value;
function busSearch(){
    var busName = t;
    busline.getBusList(busName);
}

setTimeout(function(){
    busSearch();
},1500);
}  
 
 
 
 function del()
{
    var t=document.getElementById("DropDownList1");
    var fx=t.options[t.selectedIndex].value;
    var rou=document.getElementById("TextBox1").value;
    var road_id=document.getElementById("dlxh2").value;
    createXMLHTTP();
    xmlHttp.onreadystatechange=function()
    {
        if (xmlHttp.readyState==4 && xmlHttp.status==200)
        {
            var strjwdd=xmlHttp.responseText;
             var mycars99=new Array();
             mycars99=strjwdd.split("|"); //�ַ��ָ� 
            if(mycars99[0]==2)
            {
            document.getElementById("info1").innerHTML="ɾ������ɹ�!";
            document.getElementById("info1").style.backgroundColor="green";
            document.getElementById("info1").style.color="white";
            }
            else
            {
            document.getElementById("info1").innerHTML="ɾ������ʧ��!";
            document.getElementById("info1").style.color="white";
            
            document.getElementById("info1").style.backgroundColor="red";
            }
            
            if(mycars99[1]==2)
            {
            document.getElementById("info2").innerHTML="ɾ���ӳɹ�!";
            document.getElementById("info2").style.backgroundColor="green";
            document.getElementById("info2").style.color="white";
            
            document.getElementById("dlxh2").value=mycars99[1];
            }
            else
            {
            document.getElementById("info2").innerHTML="ɾ���ӱ�ʧ��!";
            document.getElementById("info2").style.color="white";
            
            document.getElementById("info2").style.backgroundColor="red";
            }
            }
    }
    var url="Read_Data.aspx?id=36&route="+rou+"&fx="+fx+"&road_id="+road_id;
    xmlHttp.open("post",url,true);
    xmlHttp.send(null);
}
 
 
 function getnum()
 {
 var t=document.getElementById("DropDownList1");
    var fx=t.options[t.selectedIndex].value;
    var rou=document.getElementById("TextBox1").value;
    createXMLHTTP();
    xmlHttp.onreadystatechange=function()
    {
        if (xmlHttp.readyState==4 && xmlHttp.status==200)
        {
            var strjwdd=xmlHttp.responseText;
            document.getElementById("dlxh2").value=strjwdd;
       }
    }
    var url="Read_Data.aspx?id=44&route="+rou+"&fx="+fx;
    xmlHttp.open("post",url,true);
    xmlHttp.send(null);
 }
 
 
  function add()
{
    var t=document.getElementById("DropDownList1");
    var fx=t.options[t.selectedIndex].value;
    var rou=document.getElementById("TextBox1").value;
    var road_id=document.getElementById("luduanmaster").value;
    var idd=document.getElementById("dlxh2").value;
    createXMLHTTP();
    xmlHttp.onreadystatechange=function()
    {
        if (xmlHttp.readyState==4 && xmlHttp.status==200)
        {
            var strjwdd=xmlHttp.responseText;
             var mycars99=new Array();
             mycars99=strjwdd.split("|"); //�ַ��ָ� 
            if(mycars99[0]==2)
            {
            document.getElementById("info1").innerHTML="��������ɹ�!";
            document.getElementById("info1").style.backgroundColor="green";
            document.getElementById("info1").style.color="white";
            }
            else
            {
            document.getElementById("info1").innerHTML="��������ʧ��!";
            document.getElementById("info1").style.color="white";
            
            document.getElementById("info1").style.backgroundColor="red";
            }
            
            if(mycars99[1]==2)
            {
            document.getElementById("info2").innerHTML="����ӳɹ�!";
            document.getElementById("info2").style.backgroundColor="green";
            document.getElementById("info2").style.color="white";
            
            document.getElementById("dlxh2").value=mycars99[2];
            showCustomer();
            }
            else
            {
            document.getElementById("info2").innerHTML="����ӱ�ʧ��!";
            document.getElementById("info2").style.color="white";
            
            document.getElementById("info2").style.backgroundColor="red";
            }
            }
    }
    var url="Read_Data.aspx?id=35&route="+rou+"&fx="+fx+"&road_id="+road_id+"&idd="+idd;
    xmlHttp.open("post",url,true);
    xmlHttp.send(null);
}
 
 
 
 function showCustomer2()
{
         map.clearOverlays();//�����ͼ������
    var t=document.getElementById("dlfx");
    var fx=t.options[t.selectedIndex].value;
    var rou=document.getElementById("routename").value;
var mycars55 = new Array();
      var mycars66 = new Array();
    createXMLHTTP();
    xmlHttp.onreadystatechange=function()
    {
        if (xmlHttp.readyState==4 && xmlHttp.status==200)
        {
            var strjwdd=xmlHttp.responseText;
             mycars55=strjwdd.split("#"); //�ַ��ָ� 
             var ssd=mycars55.length;
             for(var jj=0;jj<mycars55.length;jj++)
             {
             mycars66=mycars55[jj].split("*"); //�ַ��ָ� 
             addPolyline_route_mul(mycars66);
             }
        }
    }
    var url="Read_Data.aspx?id=34&road_name="+rou+"&fx="+fx;
    xmlHttp.open("post",url,true);
    xmlHttp.send(null);
}  

function addPolyline_route_mul(mycars77)
{       
	var points = [];
	var p1;
	var p2;
	 var line;
	for(var j=1;j<mycars77.length;j++)
	{
		p1 = mycars77[j].split("|")[1];
		p2 = mycars77[j].split("|")[2];
		points[j-1]=new BMap.Point(p1,p2);

	    }
	    line = new BMap.Polyline(points, {strokeColor:"blue", strokeWeight:3, strokeOpacity:1, strokeStyle:"ridge"}); 
	       map.addOverlay(line);
	    line.addEventListener("click",function(e){
            document.getElementById("luduanmaster").value=mycars77[1].split("|")[0];
            document.getElementById("luduanname").value=mycars77[1].split("|")[3];
            document.getElementById("info1").innerHTML="";
            document.getElementById("info1").style.backgroundColor="white";
                        document.getElementById("info2").innerHTML="";
            document.getElementById("info2").style.backgroundColor="white";
                var marker66 = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat));  // ������ע
               map.addOverlay(marker66);
            
	        });
		
	}


 
 
 
 
function showCustomer33()
{
createXMLHTTP();
       var mycars = new Array();
    xmlHttp.onreadystatechange=function()
    {
      if (xmlHttp.readyState==4 && xmlHttp.status==200)
        {
        var strjwdd=xmlHttp.responseText;
         mycars=strjwdd.split("*"); //�ַ��ָ� 
         distance(mycars);//������·���� 
        }
    }
var t=document.getElementById("DropDownList1");
var url="Read_Data.aspx?id=2&route="+document.getElementById("TextBox1").value+"&sxx="+t.options[t.selectedIndex].value;
xmlHttp.open("post",url,true);
xmlHttp.send(null);
}   
 
 
 
 
 
    
    
function showCustomer()
{
createXMLHTTP();
       var mycars = new Array();
    xmlHttp.onreadystatechange=function()
    {
//    alert(xmlHttp.readyState);
      if (xmlHttp.readyState==4 && xmlHttp.status==200)
        {
//        alert(xmlHttp.status);
        var strjwdd=xmlHttp.responseText;
         mycars=strjwdd.split("*"); //�ַ��ָ� 
//         map.clearOverlays();//�����ͼ������
         addPolyline(mycars);//���ͼ����   
//         distance(mycars);//������·���� 
        }
    }
var t=document.getElementById("DropDownList1");
var url="Read_Data.aspx?id=2&route="+document.getElementById("TextBox1").value+"&sxx="+t.options[t.selectedIndex].value;
xmlHttp.open("post",url,true);
xmlHttp.send(null);
}  

function createXMLHTTP() 
{ 
  if(window.XMLHttpRequest) 
  { 
    xmlHttp = new XMLHttpRequest();//Mozilla����� 
  } 
  else if(window.ActiveXObject) 
  { 
    try 
    { 
      xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");//IE�ϰ汾 
    } 
    catch (e) 
    { } 
    try 
    { 
      xmlHttp = new ActiveXObject("Microsoft.XMLHTTP"); //IE�°汾 
    } 
    catch (e) 
    { } 
    if (!xmlHttp) 
    { 
      window.alert("���ܴ���XMLHttpRequest����ʵ��!"); 
      return false; 
    } 
  } 
} 


////function auto2()
////{
////setTimeout("showCustomer();",1000);
////}
//���������
function computer_dis()
{
    var t=document.getElementById("DropDownList1");
    var zdxh=document.getElementById("DropDownList2");
    var xh = document.getElementById("TextBox2").value;
        createXMLHTTP();
         var mycars = new Array();
        xmlHttp.onreadystatechange=function()
        {
          if (xmlHttp.readyState==4 && xmlHttp.status==200)
            {
            var strjwdd=xmlHttp.responseText;
            mycars=strjwdd.split("*"); //�ַ��ָ� 
             distance2(mycars);
             addMarker();
            }
        }
    var url="Read_Data.aspx?id=7&route7="+document.getElementById("TextBox1").value+"&sxx="+t.options[t.selectedIndex].value+"&zdxh="+zdxh.options[zdxh.selectedIndex].value+"&xlzdxh="+xh;
    xmlHttp.open("post",url,true);
    xmlHttp.send(null);
}


 function addMarker()
 {
     var icon1;
     var icon2;
     
    var t=document.getElementById("DropDownList1");
    var zdxh=document.getElementById("DropDownList2");
    var xh = document.getElementById("TextBox2").value;
        createXMLHTTP();
         var mycars = new Array();
        xmlHttp.onreadystatechange=function()
        {
          if (xmlHttp.readyState==4 && xmlHttp.status==200)
            {
            var strjwdd=xmlHttp.responseText;
            mycars=strjwdd.split("|"); //�ַ��ָ� 
            

            icon1 = new BMap.Icon("images/sta1.png", new BMap.Size(15,15));

            icon2 = new BMap.Icon("images/sta2.png", new BMap.Size(20,20));
            var point1 = new BMap.Point(mycars[0],mycars[1]);
            var point2 = new BMap.Point(mycars[2],mycars[3]);
            var marker1 = new BMap.Marker(point1,{icon:icon1});
            var marker2 = new BMap.Marker(point2,{icon:icon2});
            map.addOverlay(marker1);
            map.addOverlay(marker2);
            
            document.getElementById("TextBox2").value= parseInt(document.getElementById("TextBox2").value)+1;
            }
        }
    var url="Read_Data.aspx?id=8&route8="+document.getElementById("TextBox1").value+"&sxx="+t.options[t.selectedIndex].value+"&zdxh="+zdxh.options[zdxh.selectedIndex].value+"&xlzdxh="+xh;
    xmlHttp.open("post",url,true);
    xmlHttp.send(null);
} 



function distance2(mycars)
{
var dis=0;
var p1;
var p2;
var pointA;
var pointB;
    for(var j=0;j<mycars.length;j++)
    {
        if(j!=0)
        {
         pointA = new BMap.Point(p1,p2);
        }			
     p1 = mycars[j].split("|")[0];
     p2 = mycars[j].split("|")[1];
     pointB = new BMap.Point(p1,p2);
         if(j!=0)
         { 
         var distan=map.getDistance(pointA,pointB);
         if(isNaN(distan))
         {
         distan=0;
         }
         dis=dis+distan;
         }
    }
//var dis="վ���Ϊ:"+dis.toFixed(1)+"��";
//document.getElementById("jwd").innerHTML=dis;
writetodatabase2(dis.toFixed(1));
}


function writetodatabase2(jianju)
{
createXMLHTTP();
    xmlHttp.onreadystatechange=function()
    {
      if (xmlHttp.readyState==4 && xmlHttp.status==200)
        {
        var bz=xmlHttp.responseText;
        var diss;
            if(bz=="ok")
            {
            diss="վ���Ϊ:"+jianju+"��;";
            document.getElementById("jwd").innerHTML=diss;
            }
            else
            {
            diss="д��ʧ�ܣ�";
            document.getElementById("jwd").innerHTML=diss;
            }
        }
    }
    var t=document.getElementById("DropDownList1");
    var xh = document.getElementById("TextBox2").value;
var url="Read_Data.aspx?id=9&route9="+document.getElementById("TextBox1").value+"&sxx="+t.options[t.selectedIndex].value+"&xh="+xh+"&jianju="+jianju;
xmlHttp.open("post",url,true);
xmlHttp.send(null);
} 




//����·������
function distance(mycars)
{
var dis=0;
var  busline_dis=0;
var p1;
var p2;
var p3;
var pointA;
var pointB;
    for(var j=0;j<mycars.length;j++)
    {
        if(j!=0)
        {
         pointA = new BMap.Point(p1,p2);
        }			
     p1 = mycars[j].split("|")[0];
     p2 = mycars[j].split("|")[1];
     p3 = mycars[j].split("|")[3];
     pointB = new BMap.Point(p1,p2);
     var ddis=map.getDistance(pointA,pointB);
     if (isNaN(ddis))
     {
     ddis=0;
     }
         if(j!=0)
         { 
         dis=dis+ddis;
             if(p3=="1")
             {
             busline_dis=busline_dis+ddis;
             }
         }
    }
//var diss="��·GPS���:"+(dis/1000).toFixed(1)+"ǧ��;<br/>ר�õ����Ϊ:"+(busline_dis/1000).toFixed(1)+"ǧ��";
//document.getElementById("jwd").innerHTML=diss;
writetodatabase((dis/1000).toFixed(1),(busline_dis/1000).toFixed(1));
}


function writetodatabase(zlc,zydlc)
{
createXMLHTTP();
    xmlHttp.onreadystatechange=function()
    {
      if (xmlHttp.readyState==4 && xmlHttp.status==200)
        {
        var strjwdd=xmlHttp.responseText;
        var diss;
            if(strjwdd=="ok")
            {
            diss="��·GPS���:"+zlc+"ǧ��;<br/>ר�õ����Ϊ:"+zydlc+"ǧ��;<br/д��ɹ���>";
            document.getElementById("jwd").innerHTML=diss;
            }
            else
            {
            diss="��·GPS���:"+zlc+"ǧ��;<br/>ר�õ����Ϊ:"+zydlc+"ǧ��;<br/>д��ʧ�ܣ�";
            document.getElementById("jwd").innerHTML=diss;
            }
            getnum();
        }
    }
var t=document.getElementById("DropDownList1");
var url="Read_Data.aspx?id=6&route6="+document.getElementById("TextBox1").value+"&sxx="+t.options[t.selectedIndex].value+"&zlc="+zlc+"&zydlc="+zydlc;
xmlHttp.open("post",url,true);
xmlHttp.send(null);
} 

function addPolyline(mycars)
{
//    map.clearOverlays();//�����ͼ������
		var points = [];
			var p1;
			var p2;
		var lansc=mycars[0].split("|")[2];
		for(var j=0;j<mycars.length;j++)
		{
			p1 = mycars[j].split("|")[0];
			p2 = mycars[j].split("|")[1];
			points.push(new BMap.Point(p1,p2));
		    if(lansc!= mycars[j].split("|")[2]||j==mycars.length-1)
		    {
		        var line;
		        var xx;
		        if(mycars[j-1].split("|")[3]==1)
		        {
		        xx=4;
		        }
		        else
		        {
		        xx=4;
		        }
		        line = new BMap.Polyline(points, {strokeColor:"red", strokeWeight:xx, strokeOpacity:0, strokeStyle:"ridge"});
		        map.addOverlay(line);
		        points = [];
		        points.push(new BMap.Point(p1,p2));
		    }
			lansc= mycars[j].split("|")[2];
			
		}
		
//		var p30 = mycars[0].split("|")[0];
//		var p31 = mycars[0].split("|")[1];
//		var p40 = mycars[mycars.length-1].split("|")[0];
//		var p41 = mycars[mycars.length-1].split("|")[1];
		
//		setTimeout(function()
//		{
//        map.setViewport([new BMap.Point(p30,p31),new BMap.Point(p40,p41)]);          //�����������Ұ
//        },1000);
}		 
    initMap();//�����ͳ�ʼ����ͼ
</script>
</html>