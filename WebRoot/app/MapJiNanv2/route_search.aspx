<%@ page language="C#" autoeventwireup="true" inherits="route_search, App_Web_zhcctc5x" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>���Ϲ�����·վ�������Ϣϵͳ</title>
<style type="text/css">
/*Բ�Ǳ߿�css �ɵ�����С����ɫ*/
div.roundout{ width:80px;/*��*/background:red;/*������ɫ*/ text-align:center;}
b.rtop, b.rbottom{display:block;background: #fff;}
b.rtop b, b.rbottom b{display:block;height: 1px;
    overflow: hidden; background: red;/*������ɫ*/border:solid 1px black;/*������ɫ*/border-top:none;border-bottom:none;}
b.r1{margin: 0 4px;}
b.r2{margin: 0 3px}
b.r3{margin: 0 2px}
b.rtop b.r4, b.rbottom b.r4{margin: 0 1px;height: 2px}
b.rtop b.r1,b.rbottom b.r1{background:black;/*������ɫ*/}
div.roundin{margin:0px 0px;height:10px; color:White; line-height:10px;/*��*/border:solid 1px black;/*������ɫ*/border-top:none;border-bottom:none;}
/*Բ�Ǳ߿�css end*/
</style>


<style type="text/css">
    body,h2{margin:0;padding:0;font:12px/1.5 Tahoma;}
    #win{position:absolute;top:50%;left:50%;width:700px;height:250px;background:#fff;border:4px solid #3CD2F7;margin:-102px 0 0 -202px;display:none;}
    h2{font-size:12px;height:18px;text-align:right;background:url(images/tab_bg2.gif);padding:5px;cursor:move;}
    h2 span{color:#fff;cursor:pointer;background:#cc3352;border:1px solid #fff;padding:0 2px;}


    #Mdown{margin: 0;padding: 0;text-align: center;font: normal 14px/180% Tahoma,sans-serif;}
    #loginBox{position:absolute;  padding: 0px;text-align: left;width: 90%;height: 250px;background: #EAEEFF;font-size: 9pt;border: 1px solid #829AFF;}
    #loginBox .title{text-align: left;padding-left: 10px;font-size: 11pt;border-bottom: 1px solid #829AFF;height: 25px;line-height: 25px;cursor: move;}
    #loginBox .t1{float: left;font-weight: bold;color: #AA7B7B;text-decoration: none;}
    #loginBox .t2{float: right;text-align: center;line-height: 18px;height: 18px;width: 18px;margin-top: 3px;margin-right: 2px;overflow: hidden;border: 1px solid #FF5889;background: #FFE0E9;cursor: pointer;}
</style>

<style type="text/css">
    html,body {margin:0; height:100%;width:100%;overflow:hidden; }
    .main {width:100%;height:90%;text-align:left; background-image:images/menu_bg.jpg;
    background-repeat:repeat;}
    .main_left {width:230px;background:#F1F1F1;}
    .main_right {
	    height:97%;
	    background-color: #CCC;
	    line-height:100px;
    }
    .iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
        .iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
    .picBox {
     width:4px;
     background:#3CD2F7 url(images/right.gif) no-repeat center center;
    }
    .main_left,.picBox {float:left;height:100%; _margin-right:-3px; font-size:large;}
    .style3
    {
    vertical-align:middle;
    width: 100%;
    height: 25px;
    text-align:right;
    margin: 0px auto;
    border:1px solid #BBE1F1;
    background-color: #EEFAFF;
    }
    .style4{
    width: 100%;
     font-style:normal;
     font:15px arial,sans_serif;overflow:visible;
    margin-left:10px;
    }
       
    .style5
    {
        width: 100%;
        border: 1px solid #33CCFF;
        width:90%;
        text-align:center;
        vertical-align:middle;
        font-size:14px;
        
    }

    .nTab{
    float: left;
    width: 100%;
    margin: 0 auto;
    border-bottom:1px #C7C7CD solid;
    background:#d5d5d5;
    background-position:left;
    background-repeat:repeat-y;
    margin-bottom:2px;
    }
    .nTab .TabTitle{
    clear: both;
    height: 26px;
    overflow: hidden;
    }
    .nTab .TabTitle ul{
    margin:0;
    padding:0;
    }
    .nTab .TabTitle li{
    float: left;
    width: 60px;
    cursor: pointer;
    padding-top: 6px;
    padding-right: 0px;
    padding-left: 0px;
    padding-bottom: 7px;
    list-style-type: none;
    }
    .nTab .TabTitle .active{ background:url(images/tab_bg2.gif)  left -25px no-repeat;border-left:1px  #C7C7CD solid;border-top:1px  #C7C7CD solid;border-bottom:1px #fff solid;}
    .nTab .TabTitle .normal{ background:url(images/tab_bg1.gif);border-top:1px #C7C7CD solid;border-bottom:1px #C7C7CD solid;}
    .nTab .TabContent{
    width:auto;background:#fff;
    margin: 0px auto;
    padding:10px 0 0 0;
    border-right:1px #C7C7CD solid;border-left:1px #C7C7CD solid;
    text-align:left;
    }
    .none {display:none;}




    .pnlSuggest
    {
     border:1px dashed #7f9db9;border-top:0;background-color:#fff;
      z-index: 9527;
     position: absolute;
     overflow: hidden;
    }

    .pnlSuggest table
    {
     width: 100%;font-size:12px;
    }

    .pnlSuggest tr
    {
     width: 100%;font-size:12px;
    }


    .trmouseover
    {
        width: 100%;
     background-color: #edf2fb;
    }

    .trmouseover td
    {
        width: 100%;
     text-align: left;
     overflow: hidden;
     background-color: #edf2fb;
    }

    .trmouseout
    {
        width: 100%;
     background-color: #FFFFFF;
    }

    .trmouseout td
    {
        width: 100%;
     text-align: left;
     overflow: hidden;
     background-color: #FFFFFF;
    }

    .ddlDataSource
    {
        display: none;
    }

    .style6
    {
        width: 100%;
    }

</style>

<script type="text/javascript" language="JavaScript" src="js/SelectHitEdit.js"></script>
<script type="text/javascript" language="javascript">
	var liststr;
	var strsplit = "," ;
	var lists="";
	var xmlHttp;
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
	
createXMLHTTP();
xmlHttp.onreadystatechange=function(){
  if (xmlHttp.readyState==4 && xmlHttp.status==200)
    {
    liststr=xmlHttp.responseText;
	lists=liststr.split(strsplit);

    }
    }
    var url="Read_Data.aspx?id=1";
    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
</script>
<script src="http://api.map.baidu.com/api?v=1.3" type="text/javascript"></script>



<script type="text/javascript">
window.onload = function ()
{
	var oWin = document.getElementById("win");
	var oBtn=document.getElementById("Button1");
	var oClose = document.getElementById("close");
	var oH2 = oWin.getElementsByTagName("h2")[0];
	var bDrag = false;
	var disX = disY = 0;
	oBtn.onclick = function ()
	{
//		oLay.style.display = "block";
		oWin.style.display = "block"	
	};
	oClose.onclick = function ()
	{
//		oLay.style.display = "none";
		oWin.style.display = "none"
		
	};
	oClose.onmousedown = function (event)
	{
		(event || window.event).cancelBubble = true;
	};
	oH2.onmousedown = function (event)
	{		
		var event = event || window.event;
		bDrag = true;
		disX = event.clientX - oWin.offsetLeft;
		disY = event.clientY - oWin.offsetTop;		
		this.setCapture && this.setCapture();		
		return false
	};
	document.onmousemove = function (event)
	{
		if (!bDrag) return;
		var event = event || window.event;
		var iL = event.clientX - disX;
		var iT = event.clientY - disY;
		var maxL = document.documentElement.clientWidth - oWin.offsetWidth;
		var maxT = document.documentElement.clientHeight - oWin.offsetHeight;	
		iL = iL < 0 ? 0 : iL;
		iL = iL > maxL ? maxL : iL; 		
		iT = iT < 0 ? 0 : iT;
		iT = iT > maxT ? maxT : iT;
		
		oWin.style.marginTop = oWin.style.marginLeft = 0;
		oWin.style.left = iL + "px";
		oWin.style.top = iT + "px";	
			
		return false
	};
	document.onmouseup = window.onblur = oH2.onlosecapture = function ()
	{
		bDrag = false;	
		bDrag2 = false;			
		oH2.releaseCapture && oH2.releaseCapture();
	};
};

</script>


<script type="text/javascript">
function nTabs(thisObj,Num)
{
    if(thisObj.className == "active")return;
    var tabObj = thisObj.parentNode.id;
    var tabList = document.getElementById(tabObj).getElementsByTagName("li");
    for(i=0; i <tabList.length; i++)
    {
      if (i == Num)
      {
       thisObj.className = "active"; 
       document.getElementById(tabObj+"_Content"+i).style.display = "block";
      }
      else
      {
       tabList[i].className = "normal"; 
       document.getElementById(tabObj+"_Content"+i).style.display = "none";
      }
    } 
}
</script>



</head>
<body>
    
<div class="main">

  <div class="main_left" id="frmTitle" >
  <div class="style3"></div>
  <div style="height:8px"></div>
  
<div style="margin-left:10px">

   </div>
 <div style="height:8px"></div>
    <%-- <div style="margin-left:10px"><input type="button" value="��ͨ������·����" onclick="ytgjroad();" /></div>
 <div style="height:8px"></div>
   <div style="margin-left:10px"><input type="button" value="δͨ������·����" onclick="wtgjroad();" /></div>
 <div style="height:8px"></div>
 <div style="margin-left:10px"><input type="button" value="����ר�õ�·����" onclick="gjzydroad();" /></div>
 <div style="height:8px"></div>--%>
  <div style="margin-left:10px"><input type="button" value="����վ�㸲�����" onclick="gjzdfgl();" /></div>
<%-- <div style="height:8px"></div>
  <div style="margin-left:10px"><input type="button" value="����վ���Ͽ���Ϣ" onclick="gjzdsxk();" /></div>
 <div style="height:8px"></div>
   <div style="margin-left:10px"><input type="button" value="������վ�ֲ���Ϣ" onclick="gjczfb();" /></div>
 <div style="height:8px"></div>
   <div style="margin-left:10px"><input type="button" value="��·����������Ϣ" onclick="dlcdwl();" /></div>
 <div style="height:8px"></div>
   <div style="margin-left:10px"></div>--%>
   <div></div>
   <div class="style4" id="jwd" style="margin-left:10px"></div>
   <div  class="style4" id="info"></div>
   <div style="height:8px;"></div>


        </div>
  <div class="picBox" onclick="switchSysBar()" id="switchPoint" ></div>
    <div class="style3">
        <input id="Button1" style="width:80px" type="button" value="������Ϣ" />��·��<input type="text" style="width:80px" id="txtInput" name="inputname" onkeydown="ShowSuggest(this,'h6',liststr,strsplit);" />
        </div>
  <div class="main_right" id="dituContent">
  </div>
</div>

    <div id="win"><h2>����϶�&nbsp;&nbsp;&nbsp;<span id="close">��</span></h2>


<div style="text-align:center; margin-left:2px;">
<!-- ѡ���ʼ -->
  <div class="nTab">
    <!-- ���⿪ʼ -->
    <div class="TabTitle">
      <ul id="myTab0">
        <li class="active" onclick="nTabs(this,0);">վ̨��Ϣ</li>
        <li class="normal" onclick="nTabs(this,1);">������Ϣ</li>
        <li class="normal" onclick="nTabs(this,2);">��Ƭ�鿴</li>
<%--        <li class="normal" onclick="nTabs(this,3);">վ̨���</li>--%>
<%--        <li class="normal" onclick="nTabs(this,3);">���ͽ��</li>
        <li class="normal" onclick="nTabs(this,4);">��վ����</li>
        <li class="normal" onclick="nTabs(this,5);">SEO�Ż�</li>--%>
      </ul>
    </div>
    <!-- ���ݿ�ʼ -->
    <div class="TabContent">
      <div id="myTab0_Content0"> <div>��껬����ʾվ̨��Ϣ</div>
      <div>վ�����ƣ�<input id="zdmc" type="text"  readonly="readonly"/></div>
      <div>վ̨��ʽ��<input id="ztxs" type="text"  readonly="readonly"/></div>
      <div>վ̨���ȣ�<input id="ztcd" type="text"  readonly="readonly"/></div>
      <div>�������Σ�<input id="sjcc" type="text"  readonly="readonly"/></div>
      <div>���λ����<input id="ggwsl" type="text"  readonly="readonly"/></div>
      <div>����վ��ࣺ<input id="zjj" type="text"  readonly="readonly"/></div> </div>
      <div id="myTab0_Content1" class="none">
      <table align="left" style="background-color:#fff; height:100%; width:100%">
        <tr align="left" style="width:30px;">
            <td>��Ӫʱ�䣺<input id="yysj" type="text" value="5:00-21:00" readonly="readonly" />
                </td>
            <td>
                ��·��̣�<input id="xllc" type="text"  readonly="readonly"/></td>
            
            <td>
                 վ�������<input id="zdgs" type="text" readonly="readonly" /></td>
            <td>
                </td>
        </tr>
        <tr align="left" style="width:30px;">
            <td>����Ʊ�ۣ�<input id="dcpj" type="text" value="1Ԫ"  readonly="readonly"/>
                </td>
            <td>
                ר�õ���̣�<input id="zydlc" type="text"  readonly="readonly"/></td>
            <td>
                ����վ̨��<input id="gwzt" type="text"  readonly="readonly"/></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="left" style="width:30px;">
            <td>��Ʊ��Ч��<input id="ypyx" type="text"  value="��" readonly="readonly"/>
                </td>
            <td>
               ר�õ�������<input id="zydbl" type="text"  readonly="readonly"/></td>
            <td>
               ���������<input id="gwbl" type="text"  readonly="readonly"/></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="left" style="width:30px;">
            <td>������˾��<input id="ssgs" type="text" value="�Ĺ�˾���" readonly="readonly"/>
                </td>
                                            <td>
                ��ֱ��ϵ����<input id="fzxxs" type="text"  readonly="readonly"/></td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>

    </table>
      
      
      
      
     </div>
      <div id="myTab0_Content2" class="none"> <img id="Image1" alt="Images/000296-9-201310090355550069-0017200.jpg" height="100%" width="100%" src="Images/000296-9-201310090355550069-0017200.jpg" /></div>
            <div id="myTab0_Content3" class="none"> <div  class="style4" id="station_distance_info" style="visibility:hidden; overflow:scroll">
    <table rules="all" id="testTbl" align="left" cellspacing="1" class="style5">
        <tr id="tr1">
        <td >���</td>
        <td >����</td>
        <td >���</td>  
        </tr>
    </table>

   </div></div>
<%--      <div>���λ������<input id="ggwsl" type="text"  readonly="readonly"/></div></div>
      <div id="myTab0_Content3" class="none"><a href="http://51xuediannao.com/show/">���ͽ��</a></div>
      <div id="myTab0_Content4" class="none"><a href="http://51xuediannao.com/jiqiao/">��վ����</a></div>
      <div id="myTab0_Content5" class="none"><a href="http://51xuediannao.com/SEO/">SEO�Ż�</a></div>--%>
    </div>
  </div>
  <!-- ѡ����� -->
  </div>

</div>



<div id="loginBox" style="position:absolute; left:20px;top:60%; z-index:1;display: none;" >
<div class="title" id="Mdown"><span class="t1">ͼƬ</span><span class="t2" title="�ر�" onclick="login.style.display='none'">X</span></div>
<img id="Img2" alt="" width="100%" src="Images/000296-9-201309290638410764-0007997.jpg" />    
</div>

<script type="text/javascript">
var IsMousedown, LEFT, TOP, login;
document.getElementById("Mdown").onmousedown=function(e) 
{
	login = document.getElementById("loginBox");
	IsMousedown = true;
	e = e||event;
	LEFT = e.clientX - loginBox.offsetLeft;
	TOP = e.clientY - loginBox.offsetTop;
	
	
	document.onmousemove = function(e) 
	{
		e = e||event;
		if (IsMousedown) 
		{
			login.style.left = e.clientX - LEFT + "px";
			login.style.top = e.clientY - TOP + "px";
		}
	}
	document.onmouseup=function(){
	IsMousedown=false;
	}
}
			
</script>

<div id="tui">
<div id ="Div0" ><img src="images/lan2.jpg" /></div>
<div id ="Div1" >





    <table class="style6">
        <tr>
            <td>
                </td>
                </tr>
                <tr>
                    <td>
                        ����<select 
        id="Select1" name="D1">
    <option>����</option>
    <option>����</option>
    </select></td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>





��·��&nbsp;
    <div>����ĩվ��input id="smz" type="checkbox" checked="checked" />
        </div>
        <div>
            �����ѯ��<input id="qc" type="checkbox" checked="checked" /><input id="xxys0" 
                style="width:62px;" 
                onclick="show_info();" type="button" value="Search" /></div>
              <h6 style="display: none;" ></h6></div>
</div>

</body>




<script type="text/javascript">
    //�����ͳ�ʼ����ͼ������
    var point ;
    function initMap()
    {
        createMap();//������ͼ
        setMapEvent();//���õ�ͼ�¼�
        addMapControl();//���ͼ��ӿؼ�
        addcon();//����Զ���ؼ�
        station_info();//���ع���վ����Ϣ
    }
    
    
    
    function addcon()
    {
    // ����һ���ؼ���,��function
        function ZoomControl()
        {
          // Ĭ��ͣ��λ�ú�ƫ����
          this.defaultAnchor = BMAP_ANCHOR_TOP_RIGHT;
          this.defaultOffset = new BMap.Size(5, 50);
        }

        // ͨ��JavaScript��prototype���Լ̳���BMap.Control
        ZoomControl.prototype = new BMap.Control();

        // �Զ���ؼ�����ʵ���Լ���initialize����,���ҽ��ؼ���DOMԪ�ط���
        // �ڱ������д�����divԪ����Ϊ�ؼ�������,��������ӵ���ͼ������
        ZoomControl.prototype.initialize = function(map){
          // ����һ��DOMԪ��
//          var div = document.createElement("div");
        var div=document.getElementById("tui");
          // ���DOMԪ�ص���ͼ��
          map.getContainer().appendChild(div);
          // ��DOMԪ�ط���
          return div;
        }
        // �����ؼ�
        var myZoomCtrl = new ZoomControl();
        // ��ӵ���ͼ����
    map.addControl(myZoomCtrl);
    }
    
    
    //������ͼ������
    function createMap()
    {
        var map = new BMap.Map("dituContent");//�ڰٶȵ�ͼ�����д���һ����ͼ
        point = new BMap.Point(117.007863, 36.676649);//����һ�����ĵ�����
        map.centerAndZoom(point,11);//�趨��ͼ�����ĵ�����겢����ͼ��ʾ�ڵ�ͼ������
        window.map = map;//��map�����洢��ȫ��}
        //��굥����ʾ��γ��
        var marker;
        function creatmarker(point)
        {
            map.removeOverlay(marker);
            marker=new BMap.Marker(point);
        //        marker.enableDragging();
            map.addOverlay(marker);
        //        //������Ϣ����
        //        var infoWindow1 = new BMap.InfoWindow(point.lng+";"+point.lat);
        //        marker.addEventListener("mouseover", function(){point.lng+";"+point.lat});
        }
        

        function showInfo(e)
        {
    //        if(e.overlay){ 
            createXMLHTTP();
            xmlHttp.onreadystatechange=function()
            {
              if (xmlHttp.readyState==4 && xmlHttp.status==200)
                {
                var strjwdd=xmlHttp.responseText;
                 mycars=strjwdd.split("|"); //�ַ��ָ� 
                var pt = new BMap.Point(mycars[0], mycars[1]);
                var srcc= "Images/"+mycars[2];
                document.getElementById("Image1").src = srcc;
                document.getElementById("Img2").src = srcc;
                creatmarker(pt);
                }
                }
                var url="Read_Data.aspx?id=3&lng="+e.point.lng+"&lat="+e.point.lat+"&route2="+document.getElementById("txtInput").value;
                xmlHttp.open("GET",url,true);
                xmlHttp.send(null);
    //         }
    //         else
    //         {
    //         alert("���ڸ���·�ϵ���");
    //         }
        }
    map.addEventListener("click", showInfo);
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
	map.addControl(new BMap.MapTypeControl());          //��ӵ�ͼ���Ϳؼ�
//	map.addControl(new BMap.MapTypeControl({mapTypes: [BMAP_NORMAL_MAP,BMAP_HYBRID_MAP]}));     //2Dͼ������ͼ
//    map.addControl(new BMap.MapTypeControl({anchor: BMAP_ANCHOR_TOP_RIGHT}));    //���Ͻǣ�Ĭ�ϵ�ͼ�ؼ�
    }
    
//��ע������
//    var plPoints = [{style:"solid",weight:6,color:"blue",opacity:0.6}];
//	var mycars = new Array();
//mycars[0]="117.01882736857|36.613212794465";
//mycars[1]="117.018805592|36.613213306874";
//mycars[2]="117.01566849846|36.613234625486";
//mycars[3]="117.01881675286|36.613213454722";
//mycars[4]="117.01560022851|36.613235206537";
//mycars[5]="117.01573731466|36.613235121197";

//var xmlHttp;
function show_info()
{
    var t=document.getElementById("Select1");
    var fx=t.options[t.selectedIndex].value;
    var rou=document.getElementById("txtInput").value;
    showCustomer(rou,fx);
}

var bx,by,xh
function showCustomer(rou,fx)
{
//    var t=document.getElementById("Select1");
//    var fx=t.options[t.selectedIndex].value;
//    var rou=document.getElementById("txtInput").value;
    createXMLHTTP();
    var mycars = new Array();
    xmlHttp.onreadystatechange=function()
    {
      if (xmlHttp.readyState==4 && xmlHttp.status==200)
        {
        var strjwdd=xmlHttp.responseText;
         mycars=strjwdd.split("*"); //�ַ��ָ� 
    //     map.clearOverlays();//�����ͼ������
         addPolyline(mycars);//���ͼ����   
    //     distance(mycars);//������·����  
             showzh_info(rou,fx);
         setTimeout(function(){station_road_info(rou,fx);},500);
        }
    }

    var url="Read_Data.aspx?id=2&route="+rou+"&sxx="+fx;
    xmlHttp.open("post",url,true);
    xmlHttp.send(null);
}  
  
function station_road_info(rou,fx)
 {
    createXMLHTTP();
    var mycars=new Array();
    xmlHttp.onreadystatechange=function()
    {
      if (xmlHttp.readyState==4 && xmlHttp.status==200)
        {
        var strjwdd=xmlHttp.responseText;
         mycars=strjwdd.split("*"); //�ַ��ָ� 
//          addRow(mycars);
          for (var i = 0; i <mycars.length ; i ++) 
          {
          var mycars2 = new Array();
          mycars2=mycars[i].split("|");
          addMarker(mycars2,mycars.length);
          }
        }
    }
//    var t=document.getElementById("Select1");
    var url="Read_Data.aspx?id=5&route5="+rou+"&sxx="+fx;
    xmlHttp.open("post",url,true);
    xmlHttp.send(null);
 }
 
  function station_info()
 {
  createXMLHTTP();
    var mycars=new Array();
    xmlHttp.onreadystatechange=function()
    {
      if (xmlHttp.readyState==4 && xmlHttp.status==200)
        {
        var strjwdd=xmlHttp.responseText;
         mycars=strjwdd.split("*"); //�ַ��ָ� 
          for (var i = 0; i <mycars.length ; i ++) 
          {
          var mycars2 = new Array();
          mycars2=mycars[i].split("|");
          addMarker3(mycars2,mycars.length);
          }
        }
    }
    var url="Read_Data.aspx?id=14";
    xmlHttp.open("post",url,true);
    xmlHttp.send(null);
 }
 
  function addMarker3(mycars3,lenn)
 {
     var icon = new BMap.Icon("images/busstop.jpg", new BMap.Size(13,13));
    var point2 = new BMap.Point(mycars3[0],mycars3[1]);
    var marker = new BMap.Marker(point2,{icon:icon});
    map.addOverlay(marker);
    marker.hide();
    
    marker.addEventListener("click",function(){
      var opts = {
          width : 200,     // ��Ϣ���ڿ��
          height: 100,     // ��Ϣ���ڸ߶�
          title:"վ����Ϣ"
        }
        var infocontent="վ�����ƣ�"+mycars3[2]+"<br/>վ̨��ʽ��"+mycars3[6]+"<br/>վ̨���ȣ�"+mycars3[5]+"<br/>�������Σ�"+mycars3[4];
        var infoWindow = new BMap.InfoWindow(infocontent,opts);  // ������Ϣ���ڶ���
        map.openInfoWindow(infoWindow,point2);});
    
    map.addEventListener("zoomend",function(){
    if(map.getZoom()>13)
    {marker.show();}
    else
    {marker.hide();}
    })
}
 
 
 function gjzdfgl()
 {
  createXMLHTTP();
    var mycars=new Array();
    xmlHttp.onreadystatechange=function()
    {
      if (xmlHttp.readyState==4 && xmlHttp.status==200)
        {
        var strjwdd=xmlHttp.responseText;
         mycars=strjwdd.split("*"); //�ַ��ָ� 
          for (var i = 0; i <mycars.length ; i ++) 
          {
          var mycars2 = new Array();
          mycars2=mycars[i].split("|");
          addMarker2(mycars2,mycars.length);
          }
        }
    }
    var url="Read_Data.aspx?id=14";
    xmlHttp.open("post",url,true);
    xmlHttp.send(null);
 }
 
 
 function addMarker2(mycars3,lenn)
 {
     var icon = new BMap.Icon("images/sta2.png", new BMap.Size(15,15));
    var point2 = new BMap.Point(mycars3[0],mycars3[1]);
    var marker = new BMap.Marker(point2,{icon:icon});
    map.addOverlay(marker);
    var circle = new BMap.Circle(point2,500,{strokeColor:"blue",FillColor:"white", strokeWeight:4, strokeOpacity:0.5,FillOpacity:0.5, strokeStyle:"ridge"});
    map.addOverlay(circle);
    marker.addEventListener("onmouseover",function(){
    document.getElementById("zdmc").value=mycars3[2];});
}
 
 
 
 
 function addMarker(mycars3,lenn)
 {
     var icon;
    // var icon = new BMap.Icon("images/sta1.png", new BMap.Size(20,30), {
    //    anchor: new BMap.Size(10,30),infoWindowAnchor: new BMap.Size(10, 0)});
    if(mycars3[6]==1)
    {
      icon = new BMap.Icon("images/sta1.png", new BMap.Size(13,13));
    }
    else
    {
    icon = new BMap.Icon("images/sta2.png", new BMap.Size(15,15));
    }
    var point2 = new BMap.Point(mycars3[4],mycars3[5]);
    var marker = new BMap.Marker(point2,{icon:icon});
    map.addOverlay(marker);
//    if((mycars3[0]==1)||(mycars3[0]==lenn))
//    {
//        var opts = {
//          width : 200,     // ��Ϣ���ڿ��
//          height: 100,     // ��Ϣ���ڸ߶�
//          title : "�� վ����Ϣ" , // ��Ϣ���ڱ���
//        }
//        var infocontent=mycars3[1];
//        var infoWindow = new BMap.InfoWindow(infocontent, opts);  // ������Ϣ���ڶ���
//        map.openInfoWindow(infoWindow,point2);
//    }
if(document.getElementById("smz").checked==true)
{
    if((mycars3[0]==1)||(mycars3[0]==lenn))
    {
        var opts = {
           position : point2,    // ָ���ı���ע���ڵĵ���λ��
  offset   : new BMap.Size(0, -35)    //�����ı�ƫ����
        }
         var infocontent=mycars3[1];
        var label = new BMap.Label(infocontent, opts);  // �����ı���ע����
	     label.setStyle({
		 color : "red",
		 fontSize : "12px",
		 height : "20px",
		 lineHeight : "20px",
		 fontFamily:"΢���ź�"
	 });
    map.addOverlay(label);   
    }
}
else
{
        var opts = {
           position : point2,    // ָ���ı���ע���ڵĵ���λ��
  offset   : new BMap.Size(0, -35)    //�����ı�ƫ����
        }
         var infocontent=mycars3[1];
        var label = new BMap.Label(infocontent, opts);  // �����ı���ע����
	     label.setStyle({
		 color : "red",
		 fontSize : "12px",
		 height : "20px",
		 lineHeight : "20px",
		 fontFamily:"΢���ź�"
	 });
    map.addOverlay(label);   
}
    marker.addEventListener("mouseover",function(){
    document.getElementById("zdmc").value=mycars3[1];
    document.getElementById("ztcd").value=mycars3[2];
    document.getElementById("ztxs").value=mycars3[7];
    document.getElementById("zjj").value=mycars3[3];
    document.getElementById("sjcc").value="2,45,83"});
    
    marker.addEventListener("click",function(){show_allroute(document.getElementById("sjcc").value);});
} 
  var iii=0;
  function show_allroute(xl)
  {
  var route=xl.split(",");
  var sxx="����";
  var intt=setInterval(
  function()
  {
      var len=route.length;
      if(iii>=len)
      {
      iii=0;
      clearInterval(intt);
      }
      else
      {
      var sfd=route[iii];
      showCustomer(route[iii],sxx);
      iii++;
      }
  },2000);
  }
   
function showzh_info(rou,fx)
{
    createXMLHTTP();
    xmlHttp.onreadystatechange=function()
    {
        if (xmlHttp.readyState==4 && xmlHttp.status==200)
        {
            var strjwdd=xmlHttp.responseText;
             mycars=strjwdd.split("|"); //�ַ��ָ� 
            // var zh_info="<br/>��·�����:"+mycars[0]+"ǧ��;<br/>ר�õ����:"+mycars[1]+"ǧ��;<br/>վ�����:"+mycars[2]+"��;<br/>����վ̨����"+mycars[3]+"��;<br/>����վ̨���ʣ�"+(mycars[3]/mycars[2]).toFixed(1)+"%";
            //document.getElementById("info").innerHTML=zh_info;
            document.getElementById("xllc").value=mycars[0];
            document.getElementById("zydlc").value=mycars[1];
            document.getElementById("zdgs").value=mycars[2];
            document.getElementById("gwzt").value=mycars[3];
            document.getElementById("gwbl").value=(mycars[3]/mycars[2]*100).toFixed(1)+"%";
            document.getElementById("zydbl").value=(mycars[1]/mycars[0]*100).toFixed(1)+"%";
            document.getElementById("fzxxs").value=mycars[4];
        }
    }
//    var t=document.getElementById("Select1");
    var url="Read_Data.aspx?id=4&route4="+rou+"&sxx="+fx;
    xmlHttp.open("post",url,true);
    xmlHttp.send(null);
}     
   



//����·������
function distance()
{
    var dis=0;
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
         if(j!=0)
         { 
            dis=dis+map.getDistance(pointA,pointB);
         }
    }
    var diss="��·GPS���:"+(dis/1000).toFixed(1)+"ǧ��";
    document.getElementById("jwd").innerHTML=diss;
    //alert("��·����Ϊ:"+dis/1000+"ǧ��");
}


function addPolyline(mycars)
{
if(document.getElementById("qc").checked==true)
{
    map.clearOverlays();//�����ͼ������
    }
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
	        if(mycars[j-1].split("|")[3]==1)
	        {
	        line = new BMap.Polyline(points, {strokeColor:"green", strokeWeight:4, strokeOpacity:0, strokeStyle:"ridge"});
	        }
	        else
	        {
	        line = new BMap.Polyline(points, {strokeColor:"red", strokeWeight:4, strokeOpacity:0, strokeStyle:"ridge"});
	        }
	        map.addOverlay(line);
	        points = [];
	        points.push(new BMap.Point(p1,p2));
	    }
		lansc= mycars[j].split("|")[2];
		
	}
	
	var p30 = mycars[0].split("|")[0];
	var p31 = mycars[0].split("|")[1];
	var p40 = mycars[mycars.length-1].split("|")[0];
	var p41 = mycars[mycars.length-1].split("|")[1];
	setTimeout(function(){map.setViewport([new BMap.Point(p30,p31),new BMap.Point(p40,p41)]);},1000);          //�����������Ұ
}
		 
initMap();//�����ͳ�ʼ����ͼ
</script>
</html>
