//������Ư��ͼƬ�Ƿ�ΪFLASH�Լ���ʾ��С
var brOK=false;
var mie=false;
var vmin=2;
var vmax=5;
var vr=1;
var timer1;
var ads;
var isflash=0;      //�Ƿ�ΪFLASH�ļ���Ư�� 1=�� 0=��
var pic="1.gif";     //ͼƬ�ĵ�ַ
var alt="����Ұ�!";     //������ͼƬ��ʱ��ʾ����ʾ����
var url="http://www.jz123.cn/";  //ͼƬ���ӵĵ�ַ
var flashurl="1.swf";   //FLASH�ļ���·��
var Wimg=80;     //ͼ��Ŀ��
var Himg=80;     //ͼ��ĸ߶�
function movechip(chipname)
{
if(brOK)
{
  eval("chip="+chipname);
  if(!mie)
  {
   pageX=window.pageXOffset;
   pageW=window.innerWidth;
   pageY=window.pageYOffset;
   pageH=window.innerHeight;
  } 
  else
  {
   pageX=window.document.body.scrollLeft;
   pageW=window.document.body.offsetWidth-8;
   pageY=window.document.body.scrollTop;
   pageH=window.document.body.offsetHeight;
  }
  chip.xx=chip.xx+chip.vx;
  chip.yy=chip.yy+chip.vy;
  chip.vx+=vr*(Math.random()-0.5);
  chip.vy+=vr*(Math.random()-0.5);
  if(chip.vx>(vmax+vmin))  chip.vx=(vmax+vmin)*2-chip.vx;
  if(chip.vx<(-vmax-vmin)) chip.vx=(-vmax-vmin)*2-chip.vx;
  if(chip.vy>(vmax+vmin))  chip.vy=(vmax+vmin)*2-chip.vy;
  if(chip.vy<(-vmax-vmin)) chip.vy=(-vmax-vmin)*2-chip.vy;
  if(chip.xx<=pageX)
  {
   chip.xx=pageX;
   chip.vx=vmin+vmax*Math.random();
  }
  if(chip.xx>=pageX+pageW-chip.w)
  {
   chip.xx=pageX+pageW-chip.w;
   chip.vx=-vmin-vmax*Math.random();
  }
  if(chip.xx>=680)
  {
   chip.xx=chip.xx-20;
   chip.vx=-vmin-vmax*Math.random();
  }
  if(chip.yy<=pageY)
  {
   chip.yy=pageY;
   chip.vy=vmin+vmax*Math.random();
  }
  if(chip.yy>=pageY+pageH-chip.h)
  {
   chip.yy=pageY+pageH-chip.h;
   chip.vy=-vmin-vmax*Math.random();
  }
  if(!mie)
  {
   eval('document.'+chip.named+'.top ='+chip.yy);
   eval('document.'+chip.named+'.left='+chip.xx);
  }
  else
  {
   eval('document.all.'+chip.named+'.style.pixelLeft='+chip.xx);
   eval('document.all.'+chip.named+'.style.pixelTop ='+chip.yy);
  }
  chip.timer1=setTimeout("movechip('"+chip.named+"')",80);
}
}

function stopme(chipname)
{
if(brOK)
{
  eval("chip="+chipname);
  if(chip.timer1!=null)
  {
   clearTimeout(chip.timer1)
  }
}
}

function ads()
{
if(navigator.appName.indexOf("Internet Explorer")!=-1)
{
  if(parseInt(navigator.appVersion.substring(0,1))>=4) brOK=navigator.javaEnabled();mie=true;
}
if(navigator.appName.indexOf("Netscape")!=-1)
{
  if(parseInt(navigator.appVersion.substring(0,1))>=4) brOK=navigator.javaEnabled();
}
ads.named="ads";
ads.vx=vmin+vmax*Math.random();
ads.vy=vmin+vmax*Math.random();
ads.w=1;
ads.h=1;
ads.xx=0;
ads.yy=0;
ads.timer1=null;
movechip("ads");
}

document.write('<div id="ads" onmouseover=stopme("ads"); onmouseout=movechip("ads"); style="height:49px;left:178px;position:absolute;top:1237px;width:70px; z-index:1000">');
if (isflash>0)
{
document.write("<EMBED src='" + flashurl + "' quality=high  WIDTH='" + Wimg + "' HEIGHT='" + Himg + "' TYPE='application/x-shockwave-flash'></EMBED>");
}
else
{
document.write("<a href='" + url + "' target=_blank>");
document.write("<img src='" + pic + "' alt='" + alt + "' border=0 width='" + Wimg + "' height='" + Himg + "'></a>");
}
document.write("</div>");
ads();