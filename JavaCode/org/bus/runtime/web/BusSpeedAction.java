package org.bus.runtime.web;

import java.util.ArrayList;
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
import org.g4studio.core.web.BizAction;
import org.g4studio.core.web.CommonActionForm;
import org.g4studio.core.web.report.fcf.Categorie;
import org.g4studio.core.web.report.fcf.CategoriesConfig;
import org.g4studio.core.web.report.fcf.DataSet;
import org.g4studio.core.web.report.fcf.FcfDataMapper;
import org.g4studio.core.web.report.fcf.GraphConfig;
import org.g4studio.core.web.report.fcf.Set;

public class BusSpeedAction extends BizAction {
	
	
	/**
	 * 车辆使用率统计初始化
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward busUseInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		return mapping.findForward("busUseInitInitView");
	}
	
	/**
	 * 车辆班次统计初始化
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward bustourInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		return mapping.findForward("bustourInitInitView");
	}
	
	
	/**
	 * 车辆使用率统计数量
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward querybusUse(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		String datetime= dto.getAsString("datetime");
		String datetime1=datetime+" 00:00:30" ;
		String datetime2= datetime+" 23:00:30" ;
		dto.put("datetime1", datetime1);
		dto.put("datetime2", datetime2);
		List list = g4Reader.queryForList("Bus.querybusUse", dto);
		
		String jsonString = JsonHelper.encodeObject2Json(list);
		
		
		super.write(jsonString, response);
		return mapping.findForward(null);
	}
	
	
	/**
	 * 车辆使用率统计数量
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward querybusUseRecord(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		String datetime= dto.getAsString("datetime");
		String datetime1=datetime+" 00:00:30" ;
		String datetime2= datetime+" 23:00:30" ;
		dto.put("datetime1", datetime1);
		dto.put("datetime2", datetime2);
		List list = g4Reader.queryForList("Bus.querybusUserecord", dto);
		
		String proid="";
		for(int i=0;i<list.size();i++){
			Dto tmp =(Dto) list.get(i);
			proid= proid+tmp.getAsString("productid")+" ";
			
		}
		Dto formdata = new BaseDto();	
		formdata.put("route", dto.getAsString("route"));
		formdata.put("pids", proid);
		
		String jsonString = JsonHelper.encodeDto2FormLoadJson(formdata, null);
		
		
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
	public ActionForward querybustour(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		
		List list =g4Reader.queryForPage("Bus.querybustour", dto);
		
		Integer countInteger = (Integer) g4Reader.queryForObject("Bus.countquerybustour", dto);
		
		String jsonString = JsonHelper.encodeList2PageJson(list, countInteger, G4Constants.FORMAT_Date);
		super.write(jsonString, response);
		return mapping.findForward(null);
	}
	
	
	public ActionForward querybustourReport(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		String selectroute = dto.getAsString("selectroute");
		String updown_name = dto.getAsString("updown_name").equals("Down")?"下行":"上行";
		List list =g4Reader.queryForList("Bus.querybustourReport", dto);
		
		
		
		CategoriesConfig categoriesConfig = new CategoriesConfig();
		List cateList = new ArrayList();
		
		
		
		List dataList = new ArrayList();
		//实例化一个图形配置对象
				GraphConfig graphConfig = new GraphConfig();
				
				//主标题
				graphConfig.setCaption("班次统计 第:" + selectroute+" "+updown_name+" 路车");
				//X坐标轴名称
				graphConfig.setXAxisName("时段");
				//数字值前缀
				graphConfig.setNumberPrefix("");
				//使用这种方式可以加入框架没有封装的原生报表属性,原生属可以参考《G4Studio开发指南》的相关章节
				//graphConfig.put("propertyName", "value");
				List dataList1 = new ArrayList();
				
				
				DataSet dataSet1 = new DataSet();
				dataSet1.setSeriesname("班次执行次数");
				dataSet1.setColor("FDC12E");
				
				//将原始数据对象转换为框架封装的Set报表数据对象
				for (int i = 0; i < list.size(); i++) {
					Dto dto1 = (BaseDto)list.get(i);
					//实例化一个图表元数据对象
					Set set = new Set();
					//set.setName(dto1.getAsString("hour")); //名称
					
					cateList.add(new Categorie(dto1.getAsString("hour")));
					
					
					set.setValue(dto1.getAsString("num")); //数据值
					
					dataList1.add(set);
				}
				
				dataSet1.setData(dataList1);
				dataList.add(dataSet1);
				
				categoriesConfig.setCategories(cateList);
				
				List dataList2 = new ArrayList();
				
				
				DataSet dataSet2 = new DataSet();
				dataSet2.setSeriesname("班次累加数");
				dataSet2.setColor("FDC12E");
				int total=0;
				//将原始数据对象转换为框架封装的Set报表数据对象
				for (int i = 0; i < list.size(); i++) {
					Dto dto1 = (BaseDto)list.get(i);
					//实例化一个图表元数据对象
					Set set = new Set();
					//set.setName(dto1.getAsString("hour")); //名称
					
					total=total+ dto1.getAsInteger("num");
					set.setValue(total+""); //数据值
					
					dataList2.add(set);
				}
				
				dataSet2.setData(dataList2);
				dataList.add(dataSet2);
				
				
				
				
				//将图表数据转为Flash能解析的XML资料格式
				String xmlString = FcfDataMapper.toFcfXmlData(dataList, graphConfig,categoriesConfig);
				Dto outDto = new BaseDto();
				outDto.put("success", new Boolean(true));
				outDto.put("xmlstring", xmlString);
				System.out.println("<<<<<<<<<<<<<<<");
				//write(JsonHelper.encodeObject2Json(outDto), response);
				request.setAttribute("xmlString", xmlString);
		return mapping.findForward("querybustourReportInitView");
	}
	
	
	
	/**
	 * 获取班次统计的元数据 (折线组合图)
	 * @param pDto
	 * @return
	 */
	private List getFcfDataList4LineGroup(Dto pDto){
		pDto.put("fcfid", "12");
		List dataList = new ArrayList();
		DataSet dataSet1 = new DataSet();
		dataSet1.setSeriesname("班次执行次数");
		dataSet1.setColor("FDC12E");
		pDto.put("product", "1");
		List alist = g4Reader.queryForList("Demo.getFcfDataList", pDto);;
		List aSetList = new ArrayList();
		for (int i = 0; i < alist.size(); i++) {
			Dto dto = (BaseDto)alist.get(i);
			Set set = new Set();
			set.setValue(dto.getAsString("value"));
			aSetList.add(set);
		}
		dataSet1.setData(aSetList);
		dataList.add(dataSet1);
		
		DataSet dataSet2 = new DataSet();
		dataSet2.setSeriesname("班次执行累加次数");
		dataSet2.setColor("44BC2F");
		pDto.put("product", "2");
		List blist = g4Reader.queryForList("Demo.getFcfDataList", pDto);
		List bSetList = new ArrayList();
		for (int i = 0; i < blist.size(); i++) {
			Dto dto = (BaseDto)blist.get(i);
			Set set = new Set();
			set.setValue(dto.getAsString("value"));
			bSetList.add(set);
		}
		dataSet2.setData(bSetList);
		dataList.add(dataSet2);
		return dataList;
	}
	
	
	
}
