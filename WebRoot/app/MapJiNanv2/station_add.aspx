<%@ page language="C#" autoeventwireup="true" inherits="station_add, App_Web_qnz2vcqa" %>

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
                           <div><input onclick="getbus();" type="button" value="����������·" /></div>
                           <br />
                       </div>
                       <div>
                           <input onclick="showCustomer();" type="button" value="�鿴" /><input onclick="all_station_info();" type="button" value="��������վ��" />
                           <p><input type="button" value="��ѯվ��" onclick="secachzd();" /></p>
                           </div>
                           
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
                           <br />
                           վ��λ�ã�
                           <asp:DropDownList ID="zd_pos" runat="server">
                               <asp:ListItem Value="E">��</asp:ListItem>
                               <asp:ListItem Value="S">��</asp:ListItem>
                               <asp:ListItem Value="W">��</asp:ListItem>
                               <asp:ListItem Value="N">��</asp:ListItem>
                           </asp:DropDownList>
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
<%--                       <div>��ǵ�1��<asp:TextBox ID="disjwd1" ReadOnly="true" runat="server"></asp:TextBox>
                           </div>--%>
                       <div>��ǵ㣺<asp:TextBox ID="bjd" ReadOnly="true"  runat="server"></asp:TextBox>
                           </div>
                           
                       <p>
                       <input type="button" value="վ�����" onclick="update_station_info();" />  
                       <%--��ԭվ��:<input type="checkbox" id="cc" />--%>
                       </p>
                       <p><input type="button" value="����վ���" onclick="computer_dis_station();" /></p>
                       <p><input type="button" value="վ��ɾ��" onclick="delete_station();" /></p>
                       
                       <div id="info"></div>
                       <div id="info2"></div>
                       <div id="info3"></div>
                       <div>
                           <asp:ScriptManager ID="ScriptManager1" runat="server">
                           </asp:ScriptManager>
                           <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                               <ContentTemplate>
                                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                                       <Columns>
                                           <asp:BoundField DataField="station_name" HeaderText="����" />
                                           <asp:BoundField DataField="station_id" HeaderText="���" />
                                           <asp:BoundField DataField="station_id_double" HeaderText="���˫" />
                                       </Columns>
                                   </asp:GridView>
                               </ContentTemplate>
                           </asp:UpdatePanel>
                              </div>
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
map.clearOverlays();//�����ͼ������
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
         setTimeout("station_road_info();",2000);

        }
    }
var t=document.getElementById("fx");
var url="Read_Data.aspx?id=2&route="+document.getElementById("xl").value+"&sxx="+t.options[t.selectedIndex].value;
xmlHttp.open("post",url,true);
xmlHttp.send(null);
}  

function delete_station()
{
createXMLHTTP();
    xmlHttp.onreadystatechange=function()
    {
      if (xmlHttp.readyState==4 && xmlHttp.status==200)
        {
        var strjwdd=xmlHttp.responseText;
        if(strjwdd==2)
        {
        alert("ɾ���ɹ�");
            var dsd2=document.getElementById("xh_double").value;
            dsd2=parseInt(dsd2)-1;
            document.getElementById("xh_double").value=dsd2;
            document.getElementById("bjd").value="";
        }
        else
        {
        alert("ɾ��ʧ��");
        }
        }
    }
var t=document.getElementById("fx");
var url="Read_Data.aspx?id=16&route="+document.getElementById("xl").value+"&sxx="+t.options[t.selectedIndex].value+"&idd="+document.getElementById("xh_singel").value;
xmlHttp.open("post",url,true);
xmlHttp.send(null);
}


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
var t=document.getElementById("xl").value;
function busSearch(){
    var busName = t;
    busline.getBusList(busName);
}

setTimeout(function(){
    busSearch();
},1500);
}

function all_station_info()
 {
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
    var url="Read_Data.aspx?id=20&route7="+xl;
    xmlHttp.open("post",url,true);
    xmlHttp.send(null);
 }
 
 
 function secachzd()
  {
 var xl=document.getElementById("zd_name").value;
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
    var url="Read_Data.aspx?id=46&zd_name="+xl;
    xmlHttp.open("post",url,true);
    xmlHttp.send(null);
 }
 
   function addMarker3(mycars3,lenn)
 {
     var icon = new BMap.Icon("images/busstop.jpg", new BMap.Size(13,13));
    var point2 = new BMap.Point(mycars3[2],mycars3[3]);
    var marker = new BMap.Marker(point2,{icon:icon});
    map.addOverlay(marker);
    marker.addEventListener("mouseover",function(){
    document.getElementById("wlzdbh").value=mycars3[0];
    document.getElementById("zd_name").value=mycars3[1];
    document.getElementById("bdjd").value=mycars3[2];
    document.getElementById("bdwd").value=mycars3[3];
    document.getElementById("ggjd").value=mycars3[4];
    document.getElementById("ggwd").value=mycars3[5];
    searchnear(mycars3[2],mycars3[3]);
	 });  
    	  marker.addEventListener("mouseover",function(){
      var opts = {
           position : point2,    // ָ���ı���ע���ڵĵ���λ��
  offset   : new BMap.Size(0, -35)    //�����ı�ƫ����
        }
         var infocontent=mycars3[6];
        var label = new BMap.Label(infocontent, opts);  // �����ı���ע����
	     label.setStyle({
		 color : "red",
		 fontSize : "12px",
		 height : "20px",
		 lineHeight : "20px",
		 fontFamily:"΢���ź�"
	 });
    map.addOverlay(label); 
    });
}

//��վ����Ϣ��ӵ�route_station
function insert_route_station2(xl,sxx,xh_sigel,xh_double,phy_station_id,road_id)
{
    var sxx=document.getElementById("DropDownList1");
    var xl=document.getElementById("TextBox1").value;
    var xh_singel = document.getElementById("TextBox2").value;
        createXMLHTTP();
         var mycars = new Array();
        xmlHttp.onreadystatechange=function()
        {
          if (xmlHttp.readyState==4 && xmlHttp.status==200)
            {
            var strjwdd=xmlHttp.responseText;
            if(strjwdd==2)
            {
            document.getElementById("info2").innerHTML="����վ����Ϣ��station_info���ɹ�";
            document.getElementById("info2").style.backgroundColor="green";
            var dsd=document.getElementById("TextBox2").value;
            dsd=parseInt(dsd)+1;
            document.getElementById("TextBox2").value=dsd;
            document.getElementById("disjwd2").value="";
            }
            else
            {
            document.getElementById("info2").innerHTML="����վ����Ϣ��station_info��ʧ��";
            document.getElementById("info2").style.backgroundColor="red";
            document.getElementById("info2").style.font.fontColor="white"
            }
            }
        }
//    var url="Read_Data.aspx?id=17&route7="+xl+"&sxx="+sxx.options[sxx.selectedIndex].value+"&zdxh="+xh_singel+"&wlzdbh="+wlzdbh+"&zdxh_double="+zdxh_double+"&bjd2="+bjd2;
    var url="Read_Data.aspx?id=17&route7="+xl+"&sxx="+sxx.options[sxx.selectedIndex].value+"&zdxh="+xh_singel+"&wlzdbh="+wlzdbh+"&zdxh_double="+zdxh_double+"&bjd2="+bjd2;
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
function auto()
{
var bjd=document.getElementById("bjd").value;
    var sxx2=document.getElementById("fx");
    var sxx=sxx2.options[sxx2.selectedIndex].value;
    var xl=document.getElementById("xl").value;
    var xh_singel = document.getElementById("xh_singel").value;
    var xh_double = document.getElementById("xh_double").value;
    var wlzdbh = document.getElementById("wlzdbh").value;
insert_route_station(xl,sxx,xh_singel,xh_double,wlzdbh,bjd);
}



//��վ����Ϣ��ӵ�route_station
function insert_route_station(xl,sxx,xh_singel,xh_double,wlzdbh,bjd)
{
        createXMLHTTP();
         var mycars = new Array();
        xmlHttp.onreadystatechange=function()
        {
          if (xmlHttp.readyState==4 && xmlHttp.status==200)
            {
            var strjwdd=xmlHttp.responseText;
            if(strjwdd==2)
            {
            document.getElementById("info2").innerHTML="����վ����Ϣ��route_station���ɹ�";
            document.getElementById("info2").style.backgroundColor="green";
            var dsd=document.getElementById("xh_singel").value;
            dsd=parseInt(dsd)+1;
            var dsd2=document.getElementById("xh_double").value;
            dsd2=parseInt(dsd2)+1;
             document.getElementById("xh_singel").value=dsd;
            document.getElementById("xh_double").value=dsd2;
            document.getElementById("bjd").value="";
            }
            else
            {
            document.getElementById("info2").innerHTML="����վ����Ϣ��route_station��ʧ��";
            document.getElementById("info2").style.backgroundColor="red";
            document.getElementById("info2").style.font.fontColor="white"
            }
            }
        }
    var url="Read_Data.aspx?id=24&route7="+xl+"&sxx="+sxx+"&xh_singel="+xh_singel+"&xh_double="+xh_double+"&wlzdbh="+wlzdbh+"&bjd="+bjd;
    xmlHttp.open("post",url,true);
    xmlHttp.send(null);
}


function update_station_info()
{
var wlzdbh=document.getElementById("wlzdbh").value;
var zd_name=document.getElementById("zd_name").value;
    var bdjd=document.getElementById("bdjd").value;
    var bdwd=document.getElementById("bdwd").value;
    var ggjd=document.getElementById("ggjd").value;
    var ggwd=document.getElementById("ggwd").value;
    var tt=document.getElementById("zd_pos");
    var zd_pos=tt.options[tt.selectedIndex].value;

        createXMLHTTP();
        xmlHttp.onreadystatechange=function()
        {
          if (xmlHttp.readyState==4 && xmlHttp.status==200)
            {
            var strjwdd=xmlHttp.responseText;
            if(strjwdd==2)
            {
            document.getElementById("info").innerHTML="���루station_info����Ϣ�ɹ�";
            document.getElementById("info").style.backgroundColor="green";
            }
            else
            {
            document.getElementById("info").innerHTML="���루station_info����Ϣʧ��";
            document.getElementById("info").style.backgroundColor="red";
            document.getElementById("info").style.font.fontColor="white"
            }
            setTimeout("auto();",1000);
            }
        }
        //�޸�վ����Ϣstation_info,�޸ľ�γ����Ϣ
    var url="Read_Data.aspx?id=23&zd_id="+wlzdbh+"&zd_pos="+zd_pos+"&bdjd="+bdjd+"&bdwd="+bdwd+"&ggjd="+ggjd+"&ggwd="+ggwd+"&zd_name="+zd_name;
    xmlHttp.open("post",url,true);
    xmlHttp.send(null);
}

function searchnear(lng,lat)
{
  document.getElementById("info2").innerHTML="";
            document.getElementById("info2").style.backgroundColor="white";
            document.getElementById("info").innerHTML="";
            document.getElementById("info").style.backgroundColor="white";
    var sxx=document.getElementById("fx");
    var xl=document.getElementById("xl").value;
        createXMLHTTP();
         var mycars = new Array();
        xmlHttp.onreadystatechange=function()
        {
          if (xmlHttp.readyState==4 && xmlHttp.status==200)
            {
            var strjwdd=xmlHttp.responseText;
            mycars=strjwdd.split("|"); //�ַ��ָ� 
//            var pointB = new BMap.Point(mycars[3],mycars[4]); 
            var pointB = new BMap.Point(mycars[3],mycars[4]); 
            var marker = new BMap.Marker(pointB);
            map.addOverlay(marker);
            marker.enableDragging();    //����ק
            marker.addEventListener("dragend",function(e){
           document.getElementById("bdjd").value=e.point.lng;
           document.getElementById("bdwd").value=e.point.lat;
            searchnear(e.point.lng,e.point.lat)
 
            });
            
            //id,road,detai_id
           document.getElementById("bjd").value=mycars[0]+","+mycars[1]+","+mycars[2];
//            document.getElementById("disjwd2").value=mycars[0]+","+mycars[1]+","+mycars[2];
            }
        }
    var url="Read_Data.aspx?id=22&route7="+xl+"&sxx="+sxx.options[sxx.selectedIndex].value+"&lng="+lng+"&lat="+lat;
    xmlHttp.open("post",url,true);
    xmlHttp.send(null);

}

//��վ����Ϣ��ӵ�route_station
function computer_dis(wlzdbh,zdxh_double,bdj1,bjd2)
{
    var sxx=document.getElementById("DropDownList1");
    var xl=document.getElementById("TextBox1").value;
    var xh_singel = document.getElementById("TextBox2").value;
        createXMLHTTP();
         var mycars = new Array();
        xmlHttp.onreadystatechange=function()
        {
          if (xmlHttp.readyState==4 && xmlHttp.status==200)
            {
            var strjwdd=xmlHttp.responseText;
            mycars=strjwdd.split("*"); //�ַ��ָ�  
            distance2(mycars);
            }
        }
        if(document.getElementById("TextBox2").value==1)
        {
        bdj1=bjd2;
        }
    var url="Read_Data.aspx?id=7&route7="+xl+"&sxx="+sxx.options[sxx.selectedIndex].value+"&zdxh="+xh_singel+"&wlzdbh="+wlzdbh+"&zdxh_double="+zdxh_double+"&bjd1="+bdj1+"&bjd2="+bjd2;
    xmlHttp.open("post",url,true);
    xmlHttp.send(null);
}

//����ȫ��վ���

function computer_dis_station()
{
 var sxx=document.getElementById("fx");
var xl=document.getElementById("xl").value;
 createXMLHTTP();
         var mycars = new Array();
        xmlHttp.onreadystatechange=function()
        {
          if (xmlHttp.readyState==4 && xmlHttp.status==200)
            {
            var strjwdd=xmlHttp.responseText;
            mycars=strjwdd.split("#"); //�ַ��ָ�  
            distance88(mycars[1],mycars[0]);
            }
        }
    var url="Read_Data.aspx?id=25&route7="+xl+"&sxx="+sxx.options[sxx.selectedIndex].value;
    xmlHttp.open("post",url,true);
    xmlHttp.send(null);
}

function distance88(sta,rout)
{
var dis=0;
var p1;
var p2;
var pointA;
var pointB;
var sta_dis="";
var sta_dis2="";
var ii=0;
var ssta= new Array();
 var station = new Array();
 var route = new Array();
 station=sta.split("*"); //�ַ��ָ� 
 route=rout.split("*"); //�ַ��ָ� 
    for(var j=0;j<route.length;j++)
    {
        if(j!=0)
        {
         pointA = new BMap.Point(p1,p2);
        }			
     p1 = route[j].split("|")[1];
     p2 = route[j].split("|")[2];
     pointB = new BMap.Point(p1,p2);
     if(ii<station.length)
     {
         if(station[ii].split("|")[1]==route[j].split("|")[0])
         {
         sta_dis=sta_dis+station[ii].split("|")[0]+"|"+dis.toFixed(1)+"*";
         sta_dis2=sta_dis2+station[ii].split("|")[0]+"*"+dis.toFixed(1)+"<br/>"
         document.getElementById("info3").innerHTML=sta_dis2;
         dis=0;
         ii++;
         }
         else
         {
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
     }
    }
    

writetodatabase5(sta_dis);
}

function writetodatabase5(jianju)
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
            alert("������ϣ�ok");

            }
            else
            {
            alert("������ϣ�wrong");
            }
        }
    }
    var t=document.getElementById("fx");
//    var xh = document.getElementById("TextBox2").value;
var url="Read_Data.aspx?id=19&route9="+document.getElementById("xl").value+"&sxx="+t.options[t.selectedIndex].value+"&jianju="+jianju;
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
 //���ԭʼվ������
 function addMarker(mycars3)
 {
     var icon;
      icon = new BMap.Icon("images/sta1.png", new BMap.Size(20,20));
    var point2 = new BMap.Point(mycars3[1],mycars3[2]);
    var marker = new BMap.Marker(point2,{icon:icon});
    map.addOverlay(marker);

    marker.addEventListener("click",function(){
    document.getElementById("zd_name").value=mycars3[0];
    document.getElementById("bdjd").value=mycars3[1];
    document.getElementById("bdwd").value=mycars3[2];
    document.getElementById("ggjd").value=mycars3[3];
    document.getElementById("ggwd").value=mycars3[4];
    searchwlzdbh(mycars3);
    
    });
} 

function searchwlzdbh(mycars3)
{
createXMLHTTP();
    xmlHttp.onreadystatechange=function()
    {
      if (xmlHttp.readyState==4 && xmlHttp.status==200)
        {
        var strjwdd=xmlHttp.responseText;
        document.getElementById("wlzdbh").value=strjwdd;
            searchnear(mycars3[1],mycars3[2]);
          }
        }
    var url="Read_Data.aspx?id=21";
    xmlHttp.open("post",url,true);
    xmlHttp.send(null);
}
function RemoveAllOption(drp)       //���DropDownList��������
    {
        var i = 0;
        for(i = drp.length; i >= 0; i--)
        {
           drp.options.remove(i);
        }
    }

function mohu(myc)
{
   var dt=document.getElementById("DropDownList2");
   var tstation=document.getElementById("DropDownList1");
   RemoveAllOption(dt);
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
            var newOption = document.createElement("OPTION");
            newOption.text = mycars2[1];
            newOption.value = mycars2[0];
            dt.options.add(newOption);
          }
//         if(document.getElementById("cb").checked)
//        {
//           var t=document.getElementById("DropDownList2");
//           t.selectedIndex=1;

//        }
        searchnear(myc[1],myc[2]);
        }
//        searchnear(myc[1],myc[2]);
    }
    var url="Read_Data.aspx?id=11&route11="+document.getElementById("TextBox1").value+"&staname="+myc[0]+"&sxx="+tstation.options[tstation.selectedIndex].value;
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
         dis=dis+map.getDistance(pointA,pointB);
         }
    }
var icon = new BMap.Icon('images/icon.png', new BMap.Size(20, 32), {
anchor: new BMap.Size(10, 30)
});
                var marker = new BMap.Marker(pointB,{icon:icon});
                map.addOverlay(marker);
//var dis="վ���Ϊ:"+dis.toFixed(1)+"��";
document.getElementById("jwd2").innerHTML="վ���Ϊ:"+dis+"��";;
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
            var dsd=document.getElementById("TextBox2").value;
            dsd=parseInt(dsd)+1;
            document.getElementById("TextBox2").value=dsd;
            diss="վ���Ϊ:"+jianju+"��;";
            document.getElementById("jwd").innerHTML=diss;
             document.getElementById("disjwd1").value=document.getElementById("disjwd2").value;
             document.getElementById("disjwd2").value="";
            alert(diss);

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
         if(j!=0)
         { 
         dis=dis+map.getDistance(pointA,pointB);
             if(p3=="1")
             {
             busline_dis=busline_dis+map.getDistance(pointA,pointB);
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
		
//		var p30 = mycars[0].split("|")[0];
//		var p31 = mycars[0].split("|")[1];
//		var p40 = mycars[mycars.length-1].split("|")[0];
//		var p41 = mycars[mycars.length-1].split("|")[1];
//		
//		setTimeout(function()
//		{
//        map.setViewport([new BMap.Point(p30,p31),new BMap.Point(p40,p41)]);          //�����������Ұ
//        },1000);
}		 
    initMap();//�����ͳ�ʼ����ͼ
</script>
</html>