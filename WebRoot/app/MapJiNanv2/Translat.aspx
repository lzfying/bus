<%@ page language="C#" autoeventwireup="true" inherits="Translat, App_Web_zhcctc5x" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />  
<title>Translat</title>  
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=nnxL77fSqPkCGqjbeP6osiT2"></script>
<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script>
<script type="text/javascript">
var bx,by,xh
//function showCustomer(xxx)
var ggxh;
var xlxh;



function auto3()
{
var maxzz;
createXMLHTTP();
xmlHttp.onreadystatechange=function(){
  if (xmlHttp.readyState==4 && xmlHttp.status==200)
    {
    maxzz=xmlHttp.responseText;  
    setTimeout("showCustomer("+maxzz+");",1000);  
    }
    }
    var ld=document.getElementById("Text1").value;
    var road=document.getElementById("road").checked;
    var url;
        if(road==true)
    {
    url="Default.aspx?id=5&idd=2&ld="+ld; 
    }
    else
    {
    url="Default.aspx?id=5&idd=1&ld="+ld; 
    }
//var url="Default.aspx?id=5&ld="+ld;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);

//var x=0;
//setInterval(function(){x++;showCustomer(x);document.getElementById("xhh").innerHTML="����ת���У������ĵȺ�"+x+"/"+maxzz;},500);
}





function trslatqq()
{
var maxzz;
createXMLHTTP();
xmlHttp.onreadystatechange=function(){
  if (xmlHttp.readyState==4 && xmlHttp.status==200)
    {
    maxzz=xmlHttp.responseText;  
//    setTimeout("showCustomerqq("+maxzz+");",1000);  
    }
    }
    var url;
    url="Default.aspx?id=12"; 
xmlHttp.open("GET",url,true);
xmlHttp.send(null);

//var x=0;
//setInterval(function(){x++;showCustomer(x);document.getElementById("xhh").innerHTML="����ת���У������ĵȺ�"+x+"/"+maxzz;},500);
}


function showCustomerqq(mmzz)
{
createXMLHTTP();
xmlHttp.onreadystatechange=function(){
  if (xmlHttp.readyState==4 && xmlHttp.status==200)
    {
    var strjwdd=xmlHttp.responseText;
    var strs= new Array(); //����һ����
     strs=strjwdd.split("|"); //�ַ��ָ� 
    var url;
    var x=-1;
    setInterval(function(){x++;var ssxx=new Array();ssxx=strs[x].split("*");ggxh=ssxx[0];xlxh=ssxx[1]; ggxy2(ssxx[1],ssxx[2]);document.getElementById("xhh").innerHTML="����ת���У������ĵȺ�"+x+"/"+mmzz;},500); 
    }
    }
    var ld=document.getElementById("Text1").value;
    var road=document.getElementById("road").checked;
    var url;
    if(road==true)
    {
    url="Default.aspx?id=2&ld="+ld;
    }
    else
    {
    url="Default.aspx?id=1&ld="+ld;
    }
//var url="Default.aspx?id=1&ld="+ld;
//var url="Default.aspx?id=1";
xmlHttp.open("post",url,true);
xmlHttp.send(null);

}




function maxz()
{
createXMLHTTP();
xmlHttp.onreadystatechange=function(){
  if (xmlHttp.readyState==4 && xmlHttp.status==200)
    {
    maxzz=xmlHttp.responseText;    
    }
    }
    var ld=document.getElementById("Text1").value;
    var road=document.getElementById("road").checked;
    var url;
        if(road==true)
    {
    url="Default.aspx?id=5&idd=2&ld="+ld; 
    }
    else
    {
    url="Default.aspx?id=5&idd=1&ld="+ld; 
    }
//var url="Default.aspx?id=5&ld="+ld;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}

function deletedou()
{
createXMLHTTP();
xmlHttp.onreadystatechange=function(){
  if (xmlHttp.readyState==4 && xmlHttp.status==200)
    {
    var ssc=xmlHttp.responseText; 
    if(ssc="1")
    {
    alert("ִ�����");
    }   
    }
    }
var url="Default.aspx?id=7";
xmlHttp.open("post",url,true);
xmlHttp.send(null);
}


function chouxi()
{
createXMLHTTP();
xmlHttp.onreadystatechange=function(){
  if (xmlHttp.readyState==4 && xmlHttp.status==200)
    {
    var ssc=xmlHttp.responseText; 
    document.getElementById("xhh2").innerHTML=ssc;
    }
    }
var url="Default.aspx?id=9";
xmlHttp.open("post",url,true);
xmlHttp.send(null);
}






function chouxi3()
    {
createXMLHTTP();//����XMLHttpRequest���� 
//�����ݴ��뵽��һ��ҳ��ִ�� 
xmlHttp.onreadystatechange=function(){
  if (xmlHttp.readyState==4 && xmlHttp.status==200)
    {
var stt=xmlHttp.responseText;
document.getElementById("xhh2").innerHTML="��ɾ����"+stt+"��";
return 1;
    }
    }
    var cxid=document.getElementById("Text1").value;
    url="Default.aspx?id=10&cxid="+cxid; 
xmlHttp.open("post", url, true); 
xmlHttp.send(null);
    }




function fzxxs()
{
createXMLHTTP();
var mycars = new Array();
xmlHttp.onreadystatechange=function(){
  if (xmlHttp.readyState==4 && xmlHttp.status==200)
    {
    var ssc=xmlHttp.responseText; 
//    mycars=ssc.split("#"); //�ַ��ָ� 
//    distance(mycars);
document.getElementById("jwd").innerHTML="�������";
    }
    }
var url="Default.aspx?id=11";
xmlHttp.open("post",url,true);
xmlHttp.send(null);
}


//����·������
function distance(mycars)
{
var dis=0;
var p1;
var p2;
var p3;
var pointA;
var pointB;
var ssff="";

    for(var j=0;j<mycars.length;j++)
    {
    var mycars2 = new Array();
        mycars2=mycars[j].split("*"); //�ַ��ָ� 
     pointA = new BMap.Point(mycars2[2],mycars2[3]);			
     pointB = new BMap.Point(mycars2[4],mycars2[5]);
     var ddis=map.getDistance(pointA,pointB);
     if (isNaN(ddis))
     {
     ddis=0;
     }
     else
     {
     ssff=ssff+mycars2[0]+"*"+mycars2[1]+"*"+ddis.toFixed(1)+"#";
     }
    }
//var diss="��·GPS���:"+(dis/1000).toFixed(1)+"ǧ��;<br/>ר�õ����Ϊ:"+(busline_dis/1000).toFixed(1)+"ǧ��";
//document.getElementById("jwd").innerHTML=diss;
writetodatabase(ssff);
}

function writetodatabase(ssff)
{
createXMLHTTP();
    xmlHttp.onreadystatechange=function()
    {
      if (xmlHttp.readyState==4 && xmlHttp.status==200)
        {
        var bz=xmlHttp.responseText;
            document.getElementById("xhh2").innerHTML=bz;
        }
    }
var url="Default.aspx?id=12&ssff="+ssff;
xmlHttp.open("post",url,true);
xmlHttp.send(null);
} 



function showCustomer(mmzz)
{
createXMLHTTP();
xmlHttp.onreadystatechange=function(){
  if (xmlHttp.readyState==4 && xmlHttp.status==200)
    {
    var strjwdd=xmlHttp.responseText;
    var strs= new Array(); //����һ����
     strs=strjwdd.split("|"); //�ַ��ָ� 
     var x=-1;
    var road=document.getElementById("road").checked;
    var url;
    if(road==true)
    {
         setInterval(function(){x++;var ssxx=new Array();ssxx=strs[x].split("*");ggxh=ssxx[0]; ggxy2(ssxx[1],ssxx[2]);document.getElementById("xhh").innerHTML="����ת���У������ĵȺ�"+x+"/"+mmzz;},500);

    }
    else
    {
         setInterval(function(){x++;var ssxx=new Array();ssxx=strs[x].split("*");ggxh=ssxx[0];xlxh=ssxx[3]; ggxy2(ssxx[1],ssxx[2]);document.getElementById("xhh").innerHTML="����ת���У������ĵȺ�"+x+"/"+mmzz;},500);

    }
//     setInterval(function(){x++;var ssxx=new Array();ssxx=strs[x].split("*");ggxh=ssxx[0];xlxh=ssxx[3]; ggxy2(ssxx[1],ssxx[2]);document.getElementById("xhh").innerHTML="����ת���У������ĵȺ�"+x+"/"+mmzz;},500);  
    }
    }
    var ld=document.getElementById("Text1").value;
    var road=document.getElementById("road").checked;
    var url;
    if(road==true)
    {
    url="Default.aspx?id=2&ld="+ld;
    }
    else
    {
    url="Default.aspx?id=1&ld="+ld;
    }
//var url="Default.aspx?id=1&ld="+ld;
//var url="Default.aspx?id=1";
xmlHttp.open("post",url,true);
xmlHttp.send(null);

}
function ggxy2(jd,wd){  
    var ggPoint = new BMap.Point(jd,wd);  
    BMap.Convertor.translate(ggPoint,0,translateOptions2);
}  
 
translateOptions2 = function (point){   
bx=point.lng;
by=point.lat;
//sendjwd(ggxh,bx,by);
sendjwd(bx,by);
}  

//function sendjwd(xh,jd,wd)
function sendjwd(jd,wd)
    {
createXMLHTTP();//����XMLHttpRequest���� 
//�����ݴ��뵽��һ��ҳ��ִ�� 
xmlHttp.onreadystatechange=function(){
  if (xmlHttp.readyState==4 && xmlHttp.status==200)
    {
//    document.getElementById("cou").innerhtml=xmlHttp.responseText;
var stt=xmlHttp.responseText;
    }}
// var ldd=document.getElementById("Text1").value;
    var road=document.getElementById("road").checked;
    var url;
        if(road==true)
    {
    url="update.aspx?id=2&xh="+ggxh+"&jd="+jd+"&wd="+wd+"&ld="+xlxh; 
    }
    else
    {
    url="update.aspx?id=1&xh="+ggxh+"&jd="+jd+"&wd="+wd+"&ld="+xlxh; 
    }
//var url="update.aspx?xh="+ggxh+"&jd="+jd+"&wd="+wd+"&ld="+xlxh; 
xmlHttp.open("post", url, true); 
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
</script>

    <style type="text/css">
        #Text1
        {
            width: 450px;
        }
    </style>
</head>  
<body id="Body1" runat="server">  
    <form id="form1" runat="server">
    <p>Road��<input type="checkbox" id="road" value="2" /></p>
<p>
        <input value="��ʼ" id="xxys0" type="button" onclick="auto3();"  /><input 
            id="Text1" type="text" />
            </p>
        <div id="cou">
<input type="button" value="ɾ���ظ���" onclick="deletedou();" /></div> 
                <br />
                <div><input type="button" name="ss" value="��ϡ·�����ݣ�ȫ����" onclick="chouxi();" /></div>
                <br />
<div><input type="button" name="ss" value="��ϡ·�����ݣ���·�Σ�" onclick="chouxi3();" /></div>
<br />
<div><input type="button" name="ss" value="������·��ֱ��ϵ��" onclick="fzxxs();" /></div>
    <br />
    <div id="xhh"></div>
    <div id="xhh2"></div>
    <div id="xhh3">
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <input id="Button1" type="button" onclick="trslatqq();" value="תQQ����" /></div>
        <div id="dituContent"></div>
<br />


<script type="text/javascript">


</script>
</form>
</body>  
<script type="text/javascript">

// �ٶȵ�ͼAPI����
var map = new BMap.Map("dituContent");            // ����Mapʵ��
var point = new BMap.Point(116.404, 39.915);    // ����������
map.centerAndZoom(point,15);                     // ��ʼ����ͼ,�������ĵ�����͵�ͼ����
map.enableScrollWheelZoom();                            //���ù��ַŴ���С

</script>
</html>