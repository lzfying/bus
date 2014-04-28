
//Ϊstring�������һ�����ǰ��ո������
String.prototype.trim = function()
{
    return this.replace(new RegExp("(^[\\s]*)|([\\s]*$)", "g"), "");
};

//��ʾ������Ϣ
//objInputText�������Ŀؼ�����distagname����ʾ��������������div��id���ƣ�hitListValue����ʾ�б��ַ�����hitSplitStr����ʾ�ַ����ָ���
function ShowSuggest(objInputText,distagname,hitListValue,hitSplitStr)
{
   
    objInputText.onkeyup = ControlSuggest;
    
    objInputText.onblur = RemoveSuggest;
    
    var oldValue = objInputText.parentElement.getElementsByTagName(distagname)[0];
    var dateTableIndex=1; //���ݱ����������0��ʼ
	
	 if(hitListValue==null){
		hitListValue=""; 
	 }
	 if(hitSplitStr==null||hitSplitStr==""){
		hitSplitStr=","; 
	 }
	 var suggestListValue=hitListValue.split(hitSplitStr);
    
    //����ʾ��Ŀ���
    function ControlSuggest()
    {
        var ie = (document.all)?true:false;
        if(ie)
        {
            var keycode = event.keyCode;
            
            if(keycode == 40)
            {//����
                ChangeSelection(false);
                return ;
            }
            
            if(CheckSuggest())
            {
                if(keycode == 38)
                {//����
                    ChangeSelection(true);
                    return ;
                }
                
                if(keycode == 13)
                {//�س�
                    RemoveSuggest();
                    return ;
                }
                
                if(keycode == 46)
                {//del
                    DeleteSuggest();
                    objInputText.value = oldValue.innerText;
                    oldValue.innerText = "";
                    return ;
                }
                
                if((keycode >= 16 && keycode <= 36) || (keycode >= 41 && keycode <= 47))
                {
                    return;
                }
            }
            
            CreateSuggest();
        }
    }
    
    //ɾ����ʾǰ���ı�����ز���
    function RemoveSuggest()
    {
        if(CheckSuggest())
        {
            var panelSuggest = document.getElementById("divSuggestPanel");
            var inputIndex = document.getElementById("inputIndex");
            
            if( CheckActiveElement(panelSuggest) || event.keyCode == 13)
            {
                var selectIndex = Number(inputIndex.value);
                if(selectIndex >= 0)
                {
                    var tb = panelSuggest.getElementsByTagName("table")[dateTableIndex];
                    objInputText.value = tb.rows[selectIndex].cells[0].innerText;
                }
            }
            else
            {
                objInputText.value = oldValue.innerText;
            }
            
            document.body.removeChild(inputIndex);
            document.body.removeChild(panelSuggest);
            oldValue.innerText = "";
        }
        else
        {
            return ;
        }
    }
    
    //ɾ����ʾ�ķ����������ı����κβ���
    function DeleteSuggest()
    {
        if(CheckSuggest())
        {
            var panelSuggest = document.getElementById("divSuggestPanel");
            var inputIndex = document.getElementById("inputIndex");
            document.body.removeChild(inputIndex);
            document.body.removeChild(panelSuggest);
        }
    }
    
    //������ʾ��
    function CreateSuggest()
    {
        //��ʾ����ڣ������ı���ֵ���ϴε����벻ͬʱ���Ž�������ļ��ع���
        if(CheckSuggest())
        {
            if( oldValue.innerText.trim() == objInputText.value.trim())
            {
                return ;
            }
            else
            {
                DeleteSuggest();
            }
        }
        
        if(CheckSuggest() && objInputText.value.trim().length ==0)
        {//��ʾ�����,�����ı���û������,��ʱɾ����ʾ��
            DeleteSuggest();
            oldValue.innerText = "";
            return ;
        }
        
        //�������Ϊ�ո񣬾��˳�
        if(objInputText.value.trim().length == 0)
        {
            return ;
        } 
        
        //������Դ��ȡ����
        var suggestList = GetSuggestList();
        
        if(suggestList == null||suggestList.length < 1)
        {//�Դ������������жϣ�Ϊ�ջ����б�Ϊ0���˳�
            DeleteSuggest();                                  //��ʼ����������ʾ��������������û����ʾ����������ԴΪ��ʱҪ����ɾ����ʾ
            oldValue.innerText = "";
            return ;
        }
        
        oldValue.innerText = objInputText.value;              //�������������ϣ���������Դ����������
        
        var inputIndex = document.createElement("input");     //�����ؿؼ����������ı���
        inputIndex.type = "hidden";
        inputIndex.id = "inputIndex";
        inputIndex.value = -1;
        
        var suggest = "";                                     //��������Դ��дdiv��ʾ��Ϣ
        suggest += "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr bgcolor=\"#3C83C9\"><td align=left>&nbsp;<b><font color=white>Select</font></b></td><td align=right><img src=\"closeimg.gif\"</td></tr></table>";
        suggest += "<table>";
        
        for(var nIndex = 0; nIndex < suggestList.length; nIndex++)
        {
            suggest += "<tr onmouseover=\" for(var n=0;n<this.parentElement.rows.length;n++){this.parentElement.rows[n].className='trmouseout';};this.className='trmouseover';var inputIndex = document.getElementById('inputIndex');inputIndex.value = this.rowIndex; \" onmouseout=\"this.className='trmouseout';\"  ><td>";
            suggest += suggestList[nIndex];
            suggest += "</td></tr>";
        }
        suggest += "</table>";
        
        var panelSuggest = document.createElement("div");                //����װ��ʾ�������div
        
        panelSuggest.id = "divSuggestPanel";
        panelSuggest.className = "pnlSuggest";                           //���ö������
        panelSuggest.style.width = objInputText.clientWidth+5 + "px";      //���ö���Ŀ�ȣ����ı�������ͬ
        panelSuggest.style.top =  (GetPosition()[0] + objInputText.offsetHeight + 1) + "px";
        panelSuggest.style.left = GetPosition()[1] + "px";
        panelSuggest.innerHTML = suggest;
        //alert(panelSuggest.style.left);
        document.body.appendChild(panelSuggest);                         //����ʾ��������ؼ���ӽ���        
        document.body.appendChild(inputIndex);
        
    }
    
    //����ѡ��
    function ChangeSelection(isup)
    {
        //�����´�����ʾ
        if(!CheckSuggest() && objInputText.value.trim().length !=0 && !isup)
        {//�ı���������,��ʾ������,����
            CreateSuggest();
            return;
        }
                
        if(CheckSuggest())
        {
            var inputIndex = document.getElementById("inputIndex");                 //�õ�������ֵ
            var selectIndex = Number(inputIndex.value);
            
            var panelSuggest = document.getElementById("divSuggestPanel");          //�õ���ʾ��
            var tb = panelSuggest.getElementsByTagName("table")[dateTableIndex]; 
            var maxIndex = tb.rows.length - 1;                                      //��ʾ��Ϣ���������
            var startIndex=0;
            if(isup)
            {//����
                if(selectIndex >= startIndex)                                                //��������Ϊ��
                {
                    tb.rows[selectIndex].className = "trmouseout";
                    selectIndex--;
                    if(selectIndex >= startIndex)
                    {
                        tb.rows[selectIndex].className = "trmouseover";
                    }
                }
            }
            else
            {
                if(selectIndex < maxIndex)                                          //���ڵ�����������Ͳ����κβ���
                {
                    if(selectIndex >= startIndex)
                    {
                        tb.rows[selectIndex].className = "trmouseout";
                    }
                    selectIndex++;
                    tb.rows[selectIndex].className = "trmouseover";
                }
            }
            
            inputIndex.value = selectIndex;
            if(selectIndex >= startIndex)
            {
                objInputText.value = tb.rows[selectIndex].cells[0].innerText;
            }
            else
            {
                objInputText.value = oldValue.innerText;
            }
        }
        
    }
    
    //�жϻ�����Ƿ�Ϊobj����Ĵ�������
    function CheckActiveElement(obj)
    {
        var isAe = false;
        var objtemp = document.activeElement;
        while(objtemp != null)
        {
            if(objtemp == obj)
            {
                isAe = true;
                break;
            }
            objtemp = objtemp.parentElement;
        }
        return isAe;
    }
    
    //�����ʾ���Ƿ����
    function CheckSuggest()
    {
        var panelSuggest = document.getElementById("divSuggestPanel");
        if(panelSuggest == null)
        {
            return false;
        }
        else
        {
            return true;
        }
    }
    
    //��ȡ�ı����λ��
    function GetPosition()
    {
        var top = 0,left = 0;
        var obj = objInputText;
        do 
        {
            top += obj.offsetTop;         //���붥��
            left += obj.offsetLeft;       //�������
        }
        while (obj = obj.offsetParent);
            //alert( left);
        var arr = new Array();
        arr[0] = top;
        arr[1] = left;
        return arr; 
    }
    
    //�õ���ʾ����
    function GetSuggestList()
    {
        var intIndex=0;suggestList = new Array();
		
        var dataoptions = suggestListValue;
 
        var inputtxt = objInputText.value;
        for(var n = 0; n < dataoptions.length; n++)
        {
            if(dataoptions[n].indexOf(inputtxt) > -1)
            {
                suggestList[intIndex++] = dataoptions[n];
            }
        }
        return suggestList;
    }
  
}

function getAbsolutePosition(obj){//��ȡĳ���ؼ���body�ľ���λ��
   var position = new Object();
   var top = 0,left = 0;
   do 
	{
		top += obj.offsetTop;         //���붥��
		left += obj.offsetLeft;       //�������
	}
	while (obj = obj.offsetParent);
		//alert( left);
   position.x = left;
   position.y = top;
   return position;
}
function initPage(inputObjID,selectObjID){  //��ʼ��ҳ��������λ�ú�������λ��
   var tempobj = document.getElementById(inputObjID);
   document.getElementById(selectObjID).style.position="absolute";
   pos = getAbsolutePosition(tempobj);
   document.getElementById(selectObjID).style.left = pos.x  ;
   document.getElementById(selectObjID).style.top = pos.y   ;
   document.getElementById(selectObjID).style.width = tempobj.clientWidth+5;
   document.getElementById(selectObjID).style.clip = "rect(2px auto 20px "+(tempobj.clientWidth-15)+"px)";
}
