<%@ page language="C#" autoeventwireup="true" inherits="ditu, App_Web_agyah52i" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="keywords" content="�ٶȵ�ͼ,�ٶȵ�ͼAPI���ٶȵ�ͼ�Զ��幤�ߣ��ٶȵ�ͼ���������ù���" />
<meta name="description" content="�ٶȵ�ͼAPI�Զ����ͼ�������û��ڿ��ӻ����������ɰٶȵ�ͼ" />
<title>·�ηָ�</title>
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
 <script type="text/javascript" src="http://dev.baidu.com/wiki/static/map/API/examples/script/changeMore.js"></script>
</head>

<body>
    <form id="form1" runat="server">
  <!--�ٶȵ�ͼ����-->
              <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
  <div style="height:90%">
      <table align="center" rules="all" class="style1">
          <tr>
              <td style="width:30%; vertical-align:top">
               <div></div>
                  <div>
                      <input id="xxys0" onclick="showCustomer();" type="button" value="�����⴦��·��" /><asp:DropDownList ID="DropDownList1"  runat="server">
                      </asp:DropDownList></div>
                                      <div id="Div1">
                    <input ID="Button2" onclick="yichuliluduan();" type="button" value="�����Ѵ���·��" />
<%--                    <asp:Button ID="Button6" runat="server" onclick="Button6_Click" Text="����" 
                        ValidationGroup="77" />--%>
                        </div>
                  <div id="jwd"></div>
                   <div id="xxx">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <div>
                ��·���ƣ�<asp:TextBox ID="routename" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="routename" Display="Dynamic" ErrorMessage="�ǿ�"></asp:RequiredFieldValidator></div>
                <div>�ཻ·��1��<asp:TextBox ID="routename2" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="routename2" Display="Dynamic" ErrorMessage="�ǿ�"></asp:RequiredFieldValidator></div>
                <div>�ཻ·��2��<asp:TextBox ID="routename3" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="routename3" Display="Dynamic" ErrorMessage="�ǿ�"></asp:RequiredFieldValidator></div>
                <div>��������
                   <asp:RadioButtonList ID="lanes" runat="server" 
                       RepeatDirection="Horizontal">
                       <asp:ListItem>1</asp:ListItem>
                       <asp:ListItem Selected="True">2</asp:ListItem>
                       <asp:ListItem>3</asp:ListItem>
                       <asp:ListItem>4</asp:ListItem>
                       <asp:ListItem>5</asp:ListItem>
                       <asp:ListItem>6</asp:ListItem>
                       <asp:ListItem>7</asp:ListItem>
                   </asp:RadioButtonList></div><div>����
                    <asp:RadioButtonList ID="dire" runat="server" 
                        RepeatDirection="Horizontal">
                        <asp:ListItem Value="w">��</asp:ListItem>
                        <asp:ListItem Value="e">��</asp:ListItem>
                        <asp:ListItem Value="n">��</asp:ListItem>
                        <asp:ListItem Value="s">��</asp:ListItem>
                    </asp:RadioButtonList></div><div>ר�õ���
                    <asp:RadioButtonList ID="zylane" runat="server" 
                        RepeatDirection="Horizontal">
                        <asp:ListItem Value="0" Selected="True">��</asp:ListItem>
                        <asp:ListItem Value="1">��</asp:ListItem>
                    </asp:RadioButtonList><div>
                <div>��һ�㣺<asp:TextBox ID="bdjdtext"  runat="server" ReadOnly="True" Width="274px"></asp:TextBox>
                        </div>
                <div>�ڶ��㣺<asp:TextBox ID="bdwdtext" runat="server" ReadOnly="True" Width="274px"></asp:TextBox>
                        </div>
                <div>
                    <asp:Button ID="Button1" runat="server" Text="��ȡ" 
    onclick="Button1_Click" />
                    &nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server"></asp:Label>
                    &nbsp;</div>

        <p><div id="markjwd">�ѷָ�·���б�</div>
            
            <div ID="markjwd2">
                <asp:Button ID="Button5" runat="server" onclick="Button5_Click" Text="��ѯ" 
                    ValidationGroup="2" />
                <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="�޸ı���" />
                <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="�޸�ɾ��" 
                    ValidationGroup="2" />
            </div>
            <div style="overflow:scroll; height:380px">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" 
                    onselectedindexchanging="GridView1_SelectedIndexChanging">
                    <Columns>
                        <asp:CommandField HeaderText="����" SelectText="�޸�" ShowSelectButton="True" />
                        <asp:BoundField DataField="id" HeaderText="ID" />
                        <asp:BoundField DataField="roadname" HeaderText="·��" />
                        <asp:BoundField DataField="roadnamejc" HeaderText="����·��" />
                        <asp:BoundField DataField="direction" HeaderText="����" />
                        <asp:BoundField DataField="lanscount" HeaderText="������" />
                        <asp:BoundField DataField="buslane" HeaderText="ר�õ�" />
                    </Columns>
                </asp:GridView>
            </div>
                        <p>
            </p>
                        <p>
            </p>
                        <p>
            </p>
                        <p>
            </p>
                        <p>
            </p>
                        </p>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div></td>
              <td style="width:80%">
                    <div style="width:100%;height:800px;border:#ccc solid 1px;" id="dituContent"></div></td>
          </tr>
      </table>
    </div>


<%--        <div id="jwd"></div>
        <div id="markjwd"></div>
        <div id="markjwd2"></div>
        <div id="tijiao">
            <br />
    </div>--%>
   
</form>
</body>
<script type="text/javascript">
    //�����ͳ�ʼ����ͼ������
    var point ;
    function initMap(){
        createMap();//������ͼ
        setMapEvent();//���õ�ͼ�¼�
        addMapControl();//���ͼ��ӿؼ�
//        addPolyline();//���ͼ�������
//addmark();
    }
    
    //������ͼ������
    function createMap(){
        //var map = new BMap.Map("dituContent",{mapType: BMAP_HYBRID_MAP});//�ڰٶȵ�ͼ�����д���һ����ͼ
        var map = new BMap.Map("dituContent");//�ڰٶȵ�ͼ�����д���һ����ͼ
        point = new BMap.Point(117.007863, 36.676649);//����һ�����ĵ�����
        map.centerAndZoom(point,17);//�趨��ͼ�����ĵ�����겢����ͼ��ʾ�ڵ�ͼ������
        
        
        
        window.map = map;//��map�����洢��ȫ��
        //��굥����ʾ��γ��
        var marker;
        function creatmarker(point)
        {
         marker=new BMap.Marker(point)
        map.addOverlay(marker);
        document.getElementById("bdwdtext").value=point.lng+";"+point.lat;
        marker.addEventListener("rightclick", function(){document.getElementById("bdwdtext").value=""; document.getElementById("bdjdtext").value=point.lng+";"+point.lat;});
        }

        function showInfo(e){
//        if(e.overlay){ 
         createXMLHTTP();
            xmlHttp.onreadystatechange=function(){
              if (xmlHttp.readyState==4 && xmlHttp.status==200)
                {
                var strjwdd=xmlHttp.responseText;
                 mycars=strjwdd.split("|"); //�ַ��ָ� 
                var pt = new BMap.Point(mycars[0], mycars[1]);
                creatmarker(pt);
                }
                }
                    var dropDownListt=document.getElementById("DropDownList1");
                    var zzzz=dropDownListt.options[dropDownListt.selectedIndex].value;
                var url="ReadGPS2.aspx?id=1&lng="+e.point.lng+"&lat="+e.point.lat+"&rou="+zzzz;
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
    function setMapEvent(){
        map.enableDragging();//���õ�ͼ��ק�¼���Ĭ������(�ɲ�д)
        map.enableScrollWheelZoom();//���õ�ͼ���ַŴ���С
        map.enableDoubleClickZoom();//�������˫���Ŵ�Ĭ������(�ɲ�д)
        map.enableKeyboard();//���ü����������Ҽ��ƶ���ͼ
    }
    
    //��ͼ�ؼ���Ӻ�����
    function addMapControl(){
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
    
	var mycars = new Array();




function yichuliluduan()
{
var dropDownListt=document.getElementById("DropDownList1");
var zzzz=dropDownListt.options[dropDownListt.selectedIndex].value;
createXMLHTTP();
xmlHttp.onreadystatechange=function()
{
  if (xmlHttp.readyState==4 && xmlHttp.status==200)
    {
    var strjwddd=xmlHttp.responseText;
     var mycarss=strjwddd.split("*"); //�ַ��ָ� 
     addPolyline2(mycarss);//���ͼ����   
    }
}
    var url="ReadGPS.aspx?id=4&route="+zzzz;
    xmlHttp.open("post",url,true);
    xmlHttp.send(null);
}

    function addPolyline2(mycarss){
         map.clearOverlays();//�����ͼ������
			var points22 = [];
			for(var j=0;j<mycarss.length;j++){
				var p1 = mycarss[j].split("|")[1];
				var p2 = mycarss[j].split("|")[2];
				var p3 = mycarss[j].split("|")[0];
				var p4;
				if(j!=mycarss.length-1)
				{
				p4 = mycarss[j+1].split("|")[0];
				}
				else
				{
				p4=p3;
				}
				points22.push(new BMap.Point(p1,p2));
				if(p3!=p4)
				{
				var line22 = new BMap.Polyline(points22,{strokeColor:"red", strokeWeight:2, strokeOpacity:0});
			    map.addOverlay(line22);
				points22 = [];
				}
			}
			var line2 = new BMap.Polyline(points22,{strokeColor:"red", strokeWeight:2, strokeOpacity:0});
			map.addOverlay(line2);
        }


var bx,by,xh
function showCustomer()
{
createXMLHTTP();
xmlHttp.onreadystatechange=function(){
  if (xmlHttp.readyState==4 && xmlHttp.status==200)
    {
    var strjwdd=xmlHttp.responseText;
     mycars=strjwdd.split("*"); //�ַ��ָ� 
//     map.clearOverlays();//�����ͼ������
     addPolyline();//���ͼ����   
     distance();//������·����  
    }
    }
    var dropDownList=document.getElementById("DropDownList1");
    var zz=dropDownList.options[dropDownList.selectedIndex].value
    var url="ReadGPS.aspx?id=1&route="+zz;
    xmlHttp.open("GET",url,true);
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

//����·������
function distance()
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
document.getElementById("jwd").innerHTML="��·����Ϊ:"+dis/1000+"ǧ��";
//alert("��·����Ϊ:"+dis/1000+"ǧ��");
}

	function addPolyline(){
			var points = [];
			for(var j=0;j<mycars.length;j++){
				var p1 = mycars[j].split("|")[0];
				var p2 = mycars[j].split("|")[1];
				points.push(new BMap.Point(p1,p2));
			}
			var line = new BMap.Polyline(points,{strokeColor:"blue", strokeWeight:2, strokeOpacity:0});
			map.addOverlay(line);
			
			var p30 = mycars[0].split("|")[0];
			var p31 = mycars[0].split("|")[1];
			var p40 = mycars[mycars.length-1].split("|")[0];
			var p41 = mycars[mycars.length-1].split("|")[1];
			
			setTimeout(function(){
            map.setViewport([new BMap.Point(p30,p31),new BMap.Point(p40,p41)]);          //�����������Ұ
        },1000);
	}
		 
    initMap();//�����ͳ�ʼ����ͼ
</script>
</html>