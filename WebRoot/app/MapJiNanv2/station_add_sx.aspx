<%@ page language="C#" autoeventwireup="true" inherits="station_add, App_Web_agyah52i" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="keywords" content="�ٶȵ�ͼ,�ٶȵ�ͼAPI���ٶȵ�ͼ�Զ��幤�ߣ��ٶȵ�ͼ���������ù���" />
<meta name="description" content="�ٶȵ�ͼAPI�Զ����ͼ�������û��ڿ��ӻ����������ɰٶȵ�ͼ" />
<title>����վ�����</title>
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
<script language="javascript" type="text/javascript">
     function keyevent(){
     if(event.keyCode==113)
     update_station_info();
     }
     document.onkeydown = keyevent;
</script>

</head>

<body>
    <form id="form1" runat="server">
  <!--�ٶȵ�ͼ����-->
  <div style="height:90%">
      <table align="center" rules="all" class="style1">
          <tr>
              <td style="width:25%; vertical-align:top">
              <div style="overflow:scroll ; height:800px">
                  <div id="jwd"></div>
                  <div id="jwd2"></div>
                   <div id="xxx">
<p>
                       <div>
                           ��·��<asp:TextBox ID="xl" runat="server" Width="140px"></asp:TextBox>
                       </div>
                       <div>
                           ����<asp:DropDownList ID="fx" runat="server" Width="140px">
                               <asp:ListItem>����</asp:ListItem>
                               <asp:ListItem>����</asp:ListItem>
                           </asp:DropDownList></div>
                           <br />
                       </div>
                       <div>
                           <input onclick="showCustomer();" type="button" value="�鿴" /><input onclick="all_station_info();" type="button" value="����վ��" /></div>
                       <div>
                           ������ţ�<asp:TextBox ID="xh_singel" runat="server" Width="140px">1</asp:TextBox>
                       </div>
                                              <div>
                           ˫����ţ�<asp:TextBox ID="xh_double" runat="server" Width="140px">1</asp:TextBox>
                       </div>
                                                                     <div>
                           վ���ţ�<asp:TextBox ID="wlzdbh" runat="server" Width="140px"></asp:TextBox>
                       </div>
                       <div>
                           վ�����ƣ�<asp:TextBox ID="zd_name" runat="server" ></asp:TextBox>
                           </div>
                       <div>
                           վ�㾭�ȣ�<asp:TextBox ID="bdjd" runat="server" Width="140px"></asp:TextBox>
                       </div>
                       <div>
                           վ��γ�ȣ�<asp:TextBox ID="bdwd" runat="server" Width="140px"></asp:TextBox>
                       </div>
                       <div>
                           google���ȣ�<asp:TextBox ID="ggjd" runat="server" Width="140px"></asp:TextBox>
                       </div>
                       <div>
                           googleγ�ȣ�<asp:TextBox ID="ggwd" runat="server" Width="140px"></asp:TextBox>
                       </div>
                         <div>
                           ������·��<asp:TextBox ID="sjcc" runat="server" Width="140px"></asp:TextBox>
                       </div>
<%--                       <div>��ǵ�1��<asp:TextBox ID="disjwd1" ReadOnly="true" runat="server"></asp:TextBox>
                           </div>--%>
                       <div>
                           վ̨��ʽ��
                           <asp:DropDownList ID="ztxs" runat="server">
                               <asp:ListItem Value="0">����</asp:ListItem>
                               <asp:ListItem Value="1">�Ǹ���</asp:ListItem>
                               <asp:ListItem Value="2">����</asp:ListItem>
                           </asp:DropDownList>
                           </div>
                       <div>վ̨���ȣ�<asp:TextBox ID="ztcd"  runat="server" Text="0"></asp:TextBox>
                           </div>
                       <div>վ̨��ȣ�<asp:TextBox ID="ztkd"  runat="server" Text="0"></asp:TextBox>
                           </div>
                        <div>���λ����<asp:TextBox ID="ggw"  runat="server" Text="0"></asp:TextBox>
                           </div>
                       <p>
                       <input type="button" value="�޸�" onclick="update_station_info();" />  
                       </p>
<%--                       <p><input type="button" value="����վ���" onclick="computer_dis_station();" /></p>
                       <p><input type="button" value="վ��ɾ��" onclick="delete_station();" /></p>--%>
                       
                       <div id="info"></div>
                       <div id="info2"></div>
                       <div id="info3"></div>
    </div></div></td>
              <td style="width:80%">
                    <div style="width:100%;height:800px;border:#ccc solid 1px;" id="dituContent"></div></td>
          </tr>
      </table>
    </div>
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
  //��ѯ��·  
function showCustomer()
{
document.getElementById("info3").innerHTML="";
createXMLHTTP();
       var mycars = new Array();
    xmlHttp.onreadystatechange=function()
    {
      if (xmlHttp.readyState==4 && xmlHttp.status==200)
        {
        var strjwdd=xmlHttp.responseText;
         mycars=strjwdd.split("*"); //�ַ��ָ� 
         document.getElementById("xh_singel").value=1;
         addPolyline(mycars);//���ͼ����   
//         setTimeout("station_road_info();",2000);

        }
    }
var t=document.getElementById("fx");
var url="Read_Data.aspx?id=2&route="+document.getElementById("xl").value+"&sxx="+t.options[t.selectedIndex].value;
xmlHttp.open("post",url,true);
xmlHttp.send(null);
}  



function all_station_info()
 {
     var sxx=document.getElementById("fx");
 var xl=document.getElementById("xl").value;
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
    var url="Read_Data.aspx?id=31&route7="+xl+"&sxx="+sxx.options[sxx.selectedIndex].value;
    xmlHttp.open("post",url,true);
    xmlHttp.send(null);
 }
 
 
   function addMarker3(mycars3,lenn)
 {
 var marker;
 var icon = new BMap.Icon("images/busstop.jpg", new BMap.Size(13,13));
    var point2 = new BMap.Point(mycars3[2],mycars3[3]);
  if(mycars3[9]==99)
 {
    marker = new BMap.Marker(point2);
 }
 else
 {

 marker = new BMap.Marker(point2,{icon:icon});
 }
    map.addOverlay(marker);
    marker.addEventListener("onclick",function(){
        document.getElementById("xh_singel").value=mycars3[0];
    document.getElementById("xh_double").value=mycars3[8];
    document.getElementById("wlzdbh").value=mycars3[7];
    document.getElementById("zd_name").value=mycars3[1];
    document.getElementById("bdjd").value=mycars3[2];
    document.getElementById("bdwd").value=mycars3[3];
    document.getElementById("ggjd").value=mycars3[4];
    document.getElementById("ggwd").value=mycars3[5];
    document.getElementById("sjcc").value=mycars3[10];
     document.getElementById("info").innerHTML="";
     document.getElementById("info").style.backgroundColor="white";
     document.getElementById("ztcd").focus();
	 });  
	 

      var opts = {
           position : point2,    // ָ���ı���ע���ڵĵ���λ��
  offset   : new BMap.Size(0, -35)    //�����ı�ƫ����
        }
         var infocontent=mycars3[1]+"("+mycars3[6]+")";
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




function update_station_info()
{
var wlzdbh=document.getElementById("wlzdbh").value;
var ztcd=document.getElementById("ztcd").value;
    var ztkd=document.getElementById("ztkd").value;
    var ggw=document.getElementById("ggw").value;
    var tt=document.getElementById("ztxs");
    var ztxs=tt.options[tt.selectedIndex].value;

        createXMLHTTP();
        xmlHttp.onreadystatechange=function()
        {
          if (xmlHttp.readyState==4 && xmlHttp.status==200)
            {
            var strjwdd=xmlHttp.responseText;
            if(strjwdd==2)
            {
            document.getElementById("info").innerHTML="�޸ģ�station_info����Ϣ�ɹ�";
            document.getElementById("info").style.backgroundColor="green";
            document.getElementById("ztcd").value="0";
            document.getElementById("ztkd").value="0";
            document.getElementById("ggw").value="0";
            }
            else
            {
            document.getElementById("info").innerHTML="�޸ģ�station_info����Ϣʧ��";
            document.getElementById("info").style.backgroundColor="red";
            document.getElementById("info").style.font.fontColor="white"
            }
//            setTimeout("auto();",1000);
            }
        }
        //�޸�վ����Ϣstation_info,�޸ľ�γ����Ϣ
    var url="Read_Data.aspx?id=32&zd_id="+wlzdbh+"&ztcd="+ztcd+"&ztkd="+ztkd+"&ggw="+ggw+"&ztxs="+ztxs;
    xmlHttp.open("post",url,true);
    xmlHttp.send(null);
}




//��ѯ��ť��ѯ��·��վ������
 function station_road_info()
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
          addMarker(mycars2);
          }
        }
    }
    var url="Read_Data.aspx?id=10&route10="+document.getElementById("xl").value;
    xmlHttp.open("post",url,true);
    xmlHttp.send(null);
 }




function addPolyline(mycars)
{
    map.clearOverlays();//�����ͼ������
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
		        if(lansc==1)
		        {
		        line = new BMap.Polyline(points, {strokeColor:"red", strokeWeight:xx, strokeOpacity:0, strokeStyle:"ridge"});
		        }
		        else if(lansc==2)
		        {
		        line = new BMap.Polyline(points, {strokeColor:"#0099CC", strokeWeight:xx, strokeOpacity:0, strokeStyle:"dashed "});
		        }
		        else if(lansc==3)
		        {
		        line = new BMap.Polyline(points, {strokeColor:"Fuchsia", strokeWeight:xx, strokeOpacity:0, strokeStyle:"dashed "});
		        }
		        else if(lansc>=4)
		        {
		        line = new BMap.Polyline(points, {strokeColor:"#00CC33", strokeWeight:xx, strokeOpacity:0, strokeStyle:"ridge"});
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
		
		setTimeout(function()
		{
        map.setViewport([new BMap.Point(p30,p31),new BMap.Point(p40,p41)]);          //�����������Ұ
        },1000);
}		 
    initMap();//�����ͳ�ʼ����ͼ
</script>
</html>