package org.bus.runtime.web;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.g4studio.core.json.JsonHelper;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.metatype.impl.BaseDto;
import org.g4studio.core.mvc.xstruts.action.ActionForm;
import org.g4studio.core.mvc.xstruts.action.ActionForward;
import org.g4studio.core.mvc.xstruts.action.ActionMapping;
import org.g4studio.core.util.G4Constants;
import org.g4studio.core.util.G4Utils;
import org.g4studio.core.web.BizAction;
import org.g4studio.core.web.CommonActionForm;
import org.g4studio.core.web.report.fcf.Categorie;
import org.g4studio.core.web.report.fcf.CategoriesConfig;
import org.g4studio.core.web.report.fcf.DataSet;
import org.g4studio.core.web.report.fcf.FcfDataMapper;
import org.g4studio.core.web.report.fcf.GraphConfig;
import org.g4studio.core.web.report.fcf.Set;

/**
 * 
 * 
 * @author lz
 * @since 2014-4-15
 * @see BizAction
 */
public class BusRunTimeAction extends BizAction {

	/**
	 * 周转时间预测初始化
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward calculateTimeInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		return mapping.findForward("calculateTimeInitView");
	}
	
	/**
	 * 周转时间预测初始化
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward testcharts(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		return mapping.findForward("testchartsInitView");
	}
	
	/**
	 * 分线路单车实际周转时间对比
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward compareTimeInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		return mapping.findForward("compareTimeInitView");
	}
	
	/**
	 * 站点间平均运行速度
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward showbussitespeedInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		return mapping.findForward("showbussitespeedInitView");
	}
	
	/**
	 * 超速比例图表
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward showbusoverspeedreportInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		return mapping.findForward("showbusoverspeedreportInitView");
	}
	
	
	/**
	 * 线路每日各车超速查询
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward overbusspeedInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		return mapping.findForward("overbusspeedInitView");
	}
	
	
	/**
	 * 分线路单车实际周转时间对比
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward proveTimeInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		return mapping.findForward("proveTimeInitView");
	}
	
	
	
	
	/**
	 * 地图线路展示
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward routeshowBymap(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		return mapping.findForward("routeshowBymapView");
	}
	
	
	/**
	 * 查询周转预测
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward queryTimebyRoute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List list = getTimebyRoute(form,request);
		//Integer countInteger = (Integer) g4Reader.queryForObject("Bus.countStddev", dto);
		String jsonString = JsonHelper.encodeObject2Json(list);
		
		//String jsonString = JsonHelper.encodeList2PageJson(list, countInteger, G4Constants.FORMAT_Date);
		super.write(jsonString, response);
		return mapping.findForward(null);
	}
	
	
	/**
	 * 查询周转预测
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward queryTimebyRouteReport(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		List list = getTimebyRoute(form,request);
		//Integer countInteger = (Integer) g4Reader.queryForObject("Bus.countStddev", dto);
		String jsonString = JsonHelper.encodeObject2Json(list);
		
		//String jsonString = JsonHelper.encodeList2PageJson(list, countInteger, G4Constants.FORMAT_Date);
		super.write(jsonString, response);
		return mapping.findForward(null);
	}
	
	
	
	
	/**
	 * 站点间平均运行速度分页
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward querysitespeed(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		
		List list =g4Reader.queryForPage("Bus.querysitespeed", dto);
		
		Integer countInteger = (Integer) g4Reader.queryForObject("Bus.countquerysitespeed", dto);
		
		String jsonString = JsonHelper.encodeList2PageJson(list, countInteger, G4Constants.FORMAT_Date);
		super.write(jsonString, response);
		return mapping.findForward(null);
	}
	
	
	/**
	 * 站点间平均运行速度分页
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward queryoverspeed(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		
		List list =g4Reader.queryForPage("Bus.queryoverspeed", dto);
		
		Integer countInteger = (Integer) g4Reader.queryForObject("Bus.countqueryoverspeed", dto);
		
		String jsonString = JsonHelper.encodeList2PageJson(list, countInteger, G4Constants.FORMAT_Date);
		super.write(jsonString, response);
		return mapping.findForward(null);
	}
	
	
	
	
	/**
	 * 
	 * 分线路单车实际周转时间 获取分页数据
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward queryCompareBustime(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		 java.text.DateFormat format1 = new java.text.SimpleDateFormat("yyyy-MM-dd");
		
			String selectroute = dto.getAsString("selectroute");
			if(selectroute==null||selectroute.equals("")){
				return null;
			}
			if(!isNumeric(selectroute)){
				String pre= selectroute.substring(0, 1);
				if(pre.equals("K")){
					selectroute= selectroute.substring(1, selectroute.length());
				}else{
					//selectroute= selectroute.substring(1, selectroute.length());
					
				}
				
			}
			String datetime =dto.getAsString("datetime");
			String temp=null;
			if(!datetime.equals("")){
				
				 temp = datetime.substring(datetime.lastIndexOf("-")+1, datetime.length());
			}else{
				
				datetime=format1.format(new Date());
				temp =  datetime.substring(datetime.lastIndexOf("-")+1, datetime.length());
				
			}

			int day= Integer.parseInt(temp) ;
			if(day>1&&day<=10){
				dto.put("bit1", 0.5);
				dto.put("bit2", 0.3);
				dto.put("bit3", 0.2);
			}else if(day>10&&day<=20){
				
				dto.put("bit1", 0.3);
				dto.put("bit2", 0.5);
				dto.put("bit3", 0.2);
			}else{
				
				dto.put("bit1", 0.2);
				dto.put("bit2", 0.3);
				dto.put("bit3", 0.5);
			}
			dto.put("route", selectroute);
		
		List list = g4Reader.queryForPage("Bus.compareBustime", dto);
		Integer countInteger = (Integer) g4Reader.queryForObject("Bus.countcompareBustime", dto);
		String jsonString = JsonHelper.encodeList2PageJson(list, countInteger, G4Constants.FORMAT_Date);
		super.write(jsonString, response);
		return mapping.findForward(null);
	}
	
	
	
	/**
	 * 查询周转预测 报表查询
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward queryTimeReport(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List list = getTimebyRoute(form,request);
		//Integer countInteger = (Integer) g4Reader.queryForObject("Bus.countStddev", dto);
		String jsonString = JsonHelper.encodeObject2Json(list);
		
		String re = "";
		for(int i=0;i<list.size();i++){
			Dto d = (Dto) list.get(i);
			String timeinterval = d.getAsString("timeinterval");
			String avtime = d.getAsString("avtime");
			String[] arr = new String[3];
					
			arr=	timeinterval.split("\\~");
			
			String tmp =  arr[0].substring(1, arr[0].length());
			tmp=tmp.replace(":", ".");
			
			
			
			//triptime="20";
			re=re+tmp+","+avtime+"|";
		}
		
		
		
		re = re.substring(0, re.length()-1);
		super.write(re, response);
		return mapping.findForward(null);
	}
	
	
	/**
	 * 
	 * 分线路单车实际周转时间 获取分页数据
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward queryCompareBustimeReport(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		 java.text.DateFormat format1 = new java.text.SimpleDateFormat("yyyy-MM-dd");
		
			String selectroute = dto.getAsString("selectroute");
			if(selectroute==null||selectroute.equals("")){
				return null;
			}
			if(!isNumeric(selectroute)){
				String pre= selectroute.substring(0, 1);
				if(pre.equals("K")){
					selectroute= selectroute.substring(1, selectroute.length());
				}else{
					//selectroute= selectroute.substring(1, selectroute.length());
					
				}
				
			}
			String datetime =dto.getAsString("datetime");
			String temp=null;
			if(!datetime.equals("")){
				
				 temp = datetime.substring(datetime.lastIndexOf("-")+1, datetime.length());
			}else{
				
				datetime=format1.format(new Date());
				temp =  datetime.substring(datetime.lastIndexOf("-")+1, datetime.length());
				
			}

			int day= Integer.parseInt(temp) ;
			if(day>1&&day<=10){
				dto.put("bit1", 0.5);
				dto.put("bit2", 0.3);
				dto.put("bit3", 0.2);
			}else if(day>10&&day<=20){
				
				dto.put("bit1", 0.3);
				dto.put("bit2", 0.5);
				dto.put("bit3", 0.2);
			}else{
				
				dto.put("bit1", 0.2);
				dto.put("bit2", 0.3);
				dto.put("bit3", 0.5);
			}
			dto.put("route", selectroute);
		
		List list = g4Reader.queryForList("Bus.compareBustime", dto);
		
		
		  
	    Date date=null;  
	    SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-ddHH:mm:ss");  
	    
		
		String re = "";
		for(int i=0;i<list.size();i++){
			Dto d = (Dto) list.get(i);
			//String starttime = d.getAsString("starttime").substring(0, d.getAsString("starttime").lastIndexOf("."));
			String starttime = d.getAsString("starttime");
			String[] arr1 = new String[3];
			arr1=starttime.split("\\.");
			DecimalFormat df = new DecimalFormat("0.00");
			double hi= Float.parseFloat(arr1[0]);
			double mi=(float) (Math.round(Integer.parseInt(arr1[1]))/60.0);
			//String result = (mi+hi)+"" .format("%.2f");
			
			String triptime = d.getAsString("triptime");
			String[] arr = new String[3];
					
			arr=	triptime.split("\\.");
			int h= Integer.parseInt(arr[0])*60; 
			int m= Integer.parseInt(arr[1]); 
			
			//triptime="20";
			re=re+(mi+hi)+","+(h+m)+"|";
		}
		
		
		if(re!=null&&!re.equals("")){
			re = re.substring(0, re.length()-1);
			super.write(re, response);
		}
		
		return mapping.findForward(null);
	}
	
	
	public ActionForward queryCompanyDatas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		List areaList = g4Reader.queryForList("Bus.queryCompanyDatas", dto);
		String jsonString = JsonHelper.encodeObject2Json(areaList);
		write(jsonString, response);
		return mapping.findForward(null);
	}
	
	public ActionForward queryrouteDatas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		List areaList = g4Reader.queryForList("Bus.queryrouteDatas", dto);
		String jsonString = JsonHelper.encodeObject2Json(areaList);
		write(jsonString, response);
		return mapping.findForward(null);
	}
	
	
	public static boolean isNumeric(String str){
		  for (int i = str.length();--i>=0;){   
		   if (!Character.isDigit(str.charAt(i))){
		    return false;
		   }
		  }
		  return true;
		 }
	
	public List getTimebyRoute( ActionForm form, HttpServletRequest request
			) throws Exception {
		
		 java.text.DateFormat format1 = new java.text.SimpleDateFormat("yyyy-MM-dd");
			CommonActionForm aForm = (CommonActionForm) form;
			Dto dto = aForm.getParamAsDto(request);
			String selectroute = dto.getAsString("selectroute");
			if(selectroute==null||selectroute.equals("")){
				return null;
			}
			if(!isNumeric(selectroute)){
				String pre= selectroute.substring(0, 1);
				if(pre.equals("K")){
					selectroute= selectroute.substring(1, selectroute.length());
				}else{
					//selectroute= selectroute.substring(1, selectroute.length());
					
				}
				
			}
			String datetime =dto.getAsString("datetime");
			String temp=null;
			if(!datetime.equals("")){
				
				 temp = datetime.substring(datetime.lastIndexOf("-")+1, datetime.length());
			}else{
				
				datetime=format1.format(new Date());
				temp =  datetime.substring(datetime.lastIndexOf("-")+1, datetime.length());
				
			}

			int day= Integer.parseInt(temp) ;
			if(day>1&&day<=10){
				dto.put("bit1", 0.5);
				dto.put("bit2", 0.3);
				dto.put("bit3", 0.2);
			}else if(day>10&&day<=20){
				
				dto.put("bit1", 0.3);
				dto.put("bit2", 0.5);
				dto.put("bit3", 0.2);
			}else{
				
				dto.put("bit1", 0.2);
				dto.put("bit2", 0.3);
				dto.put("bit3", 0.5);
			}
			dto.put("route", selectroute);
			
			
			List list = g4Reader.queryForList("Bus.countStddev", dto);
			return list;
		
		
	}
	
	/**
	 * 保存表格脏数据
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward saveDirtyDatas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		List list  = aForm.getGridDirtyData(request);
		for (int i = 0; i < list.size(); i++) {
			Dto dto = (BaseDto)list.get(i);
			System.out.println("脏数据:\n" + dto);
			//todo anything what u want
		}
		Dto outDto = new BaseDto();
		outDto.put("success", new Boolean(true));
		outDto.put("msg", "数据已提交到后台,但演示程序没有将其持久化到数据库.<br>" + request.getParameter("dirtydata"));
		super.write(outDto.toJson(), response);
		return mapping.findForward(null);
	}
	
	/**
	 * 周转时间预测报表展示
	 * 
	 * @param
	 * @return
	 */
	public ActionForward showBusTimeByReport(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//实例化一个图形配置对象
		GraphConfig graphConfig = new GraphConfig();
		//主标题
		graphConfig.setCaption("周转时间预测");
		//X坐标轴名称
		graphConfig.setXAxisName("时段");
		//数字值前缀
		graphConfig.setNumberPrefix("");
		//使用这种方式可以加入框架没有封装的原生报表属性,原生属可以参考《G4Studio开发指南》的相关章节
		//graphConfig.put("propertyName", "value");
        Dto qDto = new BaseDto();		
        qDto.put("product", "1");
        //查询原始数据
		
		List dataList = new ArrayList();
		//将原始数据对象转换为框架封装的Set报表数据对象
		
		//将图表数据转为Flash能解析的XML资料格式
		String xmlString = FcfDataMapper.toFcfXmlData(dataList, graphConfig);
		//此Key对应的<flashReport />标签的datavar属性
		request.setAttribute("xmlString", xmlString);
		return mapping.findForward("showbustimereportView");
	}
	
	/**
	 * 查询数据报表XML格式串
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward queryReportXmlDatas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		String selectroute = dto.getAsString("selectroute");
		String updown_name = dto.getAsString("updown_name").equals("Down")?"下行":"上行";
		
		
		List list = getTimebyRoute(form,request);
		//实例化一个图形配置对象
		GraphConfig graphConfig = new GraphConfig();
		
		//主标题
		graphConfig.setCaption("周转时间预测 第:" + selectroute+" "+updown_name+" 路车");
		//X坐标轴名称
		graphConfig.setXAxisName("时段");
		//数字值前缀
		graphConfig.setNumberPrefix("");
		//使用这种方式可以加入框架没有封装的原生报表属性,原生属可以参考《G4Studio开发指南》的相关章节
		//graphConfig.put("propertyName", "value");
		List dataList = new ArrayList();
		//将原始数据对象转换为框架封装的Set报表数据对象
		for (int i = 0; i < list.size(); i++) {
			Dto dto1 = (BaseDto)list.get(i);
			//实例化一个图表元数据对象
			Set set = new Set();
			set.setName(dto1.getAsString("timenum")); //名称
			set.setValue(dto1.getAsString("avtime")); //数据值
			set.setColor(dto1.getAsString("color")); //柱状图颜色
			dataList.add(set);
		}
		//将图表数据转为Flash能解析的XML资料格式
		String xmlString = FcfDataMapper.toFcfXmlData(dataList, graphConfig);
		Dto outDto = new BaseDto();
		outDto.put("success", new Boolean(true));
		outDto.put("xmlstring", xmlString);
		write(JsonHelper.encodeObject2Json(outDto), response);
		return mapping.findForward(null);
	}
	
	
	/**
	 * 查询超速比例数据报表XML格式串
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward queryoverspeedReportXmlDatas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		String selectroute = dto.getAsString("selectroute");
		String updown_name = dto.getAsString("updown_name").equals("Down")?"下行":"上行";
		
		
		//实例化一个图形配置对象
				GraphConfig graphConfig = new GraphConfig();
				//主标题
				graphConfig.setCaption("超速比例");
				//设置数字值的前缀
				graphConfig.setNumberPrefix("");
				graphConfig.setShowNames(new Boolean(true));
				//使用这种方式可以加入框架没有封装的原生报表属性,原生属可以参考《开发指南》的相关章节
				//graphConfig.put("propertyName", "value");
		        Dto qDto = new BaseDto();		
		       
		        //查询原始数据
		        dto.put("bit1", 0);
		        dto.put("bit2", 0.1);
		        Integer rate1 = (Integer) g4Reader.queryForObject("Bus.countoverspeedbit", dto);
		        dto.put("bit1", 0.1);
		        dto.put("bit2", 0.2);
		        Integer rate2 = (Integer) g4Reader.queryForObject("Bus.countoverspeedbit", dto);
		        dto.put("bit1", 0.3);
		        dto.remove("bit2");
		        Integer rate3 = (Integer) g4Reader.queryForObject("Bus.countoverspeedbit", dto);
		        List dataList = new ArrayList();
		        
		        Set set1 = new Set();
				set1.setName("超速10%"); //名称
				set1.setValue(rate1.toString()); //数据值
				set1.setColor("AFD8F8"); //柱状图颜色
				set1.setIsSliced("0");//浮动
				Set set2 = new Set();
				set2.setName("超速20%"); //名称
				set2.setValue(rate2.toString()); //数据值
				set2.setColor("F6BD0F"); //柱状图颜色
				set2.setIsSliced("0");//浮动
				Set set3 = new Set();
				set3.setName("超速30%"); //名称
				set3.setValue(rate3.toString()); //数据值
				set3.setColor("red"); //柱状图颜色
				set3.setIsSliced("0");//浮动
				dataList.add(set1);
				dataList.add(set2);
				dataList.add(set3);
		       
		        
				//将原始数据对象转换为框架封装的Set报表数据对象
				
				//将图表数据转为Flash能解析的XML资料格式
				String xmlString = FcfDataMapper.toFcfXmlData(dataList, graphConfig);
				
		Dto outDto = new BaseDto();
		outDto.put("success", new Boolean(true));
		outDto.put("xmlstring", xmlString);
		write(JsonHelper.encodeObject2Json(outDto), response);
		return mapping.findForward(null);
	}
}
