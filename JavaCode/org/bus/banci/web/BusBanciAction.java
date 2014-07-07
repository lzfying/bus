package org.bus.banci.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.g4studio.core.json.JsonHelper;
import org.g4studio.core.metatype.Dto;
import org.g4studio.core.mvc.xstruts.action.ActionForm;
import org.g4studio.core.mvc.xstruts.action.ActionForward;
import org.g4studio.core.mvc.xstruts.action.ActionMapping;
import org.g4studio.core.util.G4Constants;
import org.g4studio.core.web.BizAction;
import org.g4studio.core.web.CommonActionForm;

/**
 * 
 * @author ToDoU
 * 
 */
public class BusBanciAction extends BizAction {
	/**
	 * 查询分公司的班次情况
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward queryCompanyBanciInit(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("queryCompanyBanciInitView");
	}

	/**
	 * 分公司查询班次情况
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward queryCompanyBanci(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		if ("".equals(dto.getAsString("date2"))) {
			dto.put("date2", dto.getAsString("date1"));
		}
		List areaList=null;
		if("1".equals(dto.getAsString("week"))){
			areaList = g4Reader
					.queryForList("BusBanci.queryCompanyBanci", dto);	
		}else{
			areaList = g4Reader
					.queryForList("BusBanci.queryCompanyBanciW", dto);
		}
		String jsonString = JsonHelper.encodeObject2Json(areaList);
		write(jsonString, response);
		return mapping.findForward(null);
	}

	/**
	 * 路队班次情况
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward queryTeamBanciInit(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("queryTeamBanciInitView");
	}

	/**
	 * 路队查询班次情况
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward queryTeamBanci(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		if ("".equals(dto.getAsString("date2"))) {
			dto.put("date2", dto.getAsString("date1"));
		}
		List areaList=null;
		if("1".equals(dto.getAsString("week"))){
			areaList = g4Reader
					.queryForList("BusBanci.queryTeamBanci", dto);	
		}else{
			areaList = g4Reader
					.queryForList("BusBanci.queryTeamBanciW", dto);
		}
		String jsonString = JsonHelper.encodeObject2Json(areaList);
		write(jsonString, response);
		return mapping.findForward(null);
	}

	/**
	 * 根据公司查路队
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward queryteamDatas(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		List areaList = g4Reader.queryForList("BusBanci.queryteamDatas", dto);
		String jsonString = JsonHelper.encodeObject2Json(areaList);
		write(jsonString, response);
		return mapping.findForward(null);
	}

	/**
	 * 线路班次情况
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward queryRouteBanciInit(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("queryRouteBanciInitView");
	}

	/**
	 * 线路班次情况
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward queryRouteBanci(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		if ("".equals(dto.getAsString("date2"))) {
			dto.put("date2", dto.getAsString("date1"));
		}
		List areaList=null;
		if("1".equals(dto.getAsString("week"))){
			areaList = g4Reader
					.queryForList("BusBanci.queryRouteBanci", dto);	
		}else{
			areaList = g4Reader
					.queryForList("BusBanci.queryRouteBanciW", dto);
		}
		String jsonString = JsonHelper.encodeObject2Json(areaList);
		write(jsonString, response);
		return mapping.findForward(null);
	}

	// 断面车次情况公司
	public ActionForward queryCompanyPeakSectionInit(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("queryCompanyPeakSectionInitView");
	}

	public ActionForward queryCompanyPeakSection(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		if ("".equals(dto.getAsString("date2"))) {
			dto.put("date2", dto.getAsString("date1"));
		}
		List areaList = g4Reader.queryForList(
				"BusBanci.queryCompanyPeakSection", dto);
		String jsonString = JsonHelper.encodeObject2Json(areaList);
		write(jsonString, response);
		return mapping.findForward(null);
	}

	// 断面车次情况路队
	public ActionForward queryTeamPeakSectionInit(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("queryTeamPeakSectionInitView");
	}

	public ActionForward queryTeamPeakSection(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		if ("".equals(dto.getAsString("date2"))) {
			dto.put("date2", dto.getAsString("date1"));
		}
		List areaList = g4Reader.queryForList("BusBanci.queryTeamPeakSection",
				dto);
		String jsonString = JsonHelper.encodeObject2Json(areaList);
		write(jsonString, response);
		return mapping.findForward(null);
	}

	// 断面车次情况线路
	public ActionForward queryRoutePeakSectionInit(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("queryRoutePeakSectionInitView");
	}

	public ActionForward queryRoutePeakSection(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		if ("".equals(dto.getAsString("date2"))) {
			dto.put("date2", dto.getAsString("date1"));
		}
		List areaList = g4Reader.queryForList("BusBanci.queryRoutePeakSection",
				dto);
		String jsonString = JsonHelper.encodeObject2Json(areaList);
		write(jsonString, response);
		return mapping.findForward(null);
	}

	// 平峰发车间隔公司情况
	public ActionForward queryCompanyFlatPeakIntervalInit(
			ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("queryCompanyFlatPeakIntervalInitView");
	}

	public ActionForward queryCompanyFlatPeakInterval(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		if ("".equals(dto.getAsString("date2"))) {
			dto.put("date2", dto.getAsString("date1"));
		}
		List areaList = g4Reader.queryForList(
				"BusBanci.queryCompanyFlatPeakInterval", dto);
		String jsonString = JsonHelper.encodeObject2Json(areaList);
		write(jsonString, response);
		return mapping.findForward(null);
	}

	// 平峰发车间隔路队情况
	public ActionForward queryTeamFlatPeakIntervalInit(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("queryTeamFlatPeakIntervalInitView");
	}

	public ActionForward queryTeamFlatPeakInterval(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		if ("".equals(dto.getAsString("date2"))) {
			dto.put("date2", dto.getAsString("date1"));
		}
		List areaList = g4Reader.queryForList(
				"BusBanci.queryTeamFlatPeakInterval", dto);
		String jsonString = JsonHelper.encodeObject2Json(areaList);
		write(jsonString, response);
		return mapping.findForward(null);
	}

	// 公司高峰断面点击跳转的详细信息
	public ActionForward queryCompanyPeakSectionInfo(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		if ("".equals(dto.getAsString("date2"))) {
			dto.put("date2", dto.getAsString("date1"));
		}
		List areaList = g4Reader.queryForList(
				"BusBanci.queryCompanyPeakSectionInfo", dto);
		String jsonString = JsonHelper.encodeObject2Json(areaList);
		write(jsonString, response);
		return mapping.findForward(null);
	}

	// 路队高峰断面点击跳转的详细信息
	public ActionForward queryTeamPeakSectionInfo(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		if ("".equals(dto.getAsString("date2"))) {
			dto.put("date2", dto.getAsString("date1"));
		}
		List areaList = g4Reader.queryForList(
				"BusBanci.queryTeamPeakSectionInfo", dto);
		String jsonString = JsonHelper.encodeObject2Json(areaList);
		write(jsonString, response);
		return mapping.findForward(null);
	}

	// 平峰发车间隔路队
	public ActionForward queryTeamFlatPeakIntervalInfo(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		if ("".equals(dto.getAsString("date2"))) {
			dto.put("date2", dto.getAsString("date1"));
		}
		List areaList = g4Reader.queryForList(
				"BusBanci.queryTeamFlatPeakIntervalInfo", dto);
		String jsonString = JsonHelper.encodeObject2Json(areaList);
		write(jsonString, response);
		return mapping.findForward(null);
	}

	// 平峰发车间隔公司
	public ActionForward queryCompanyFlatPeakIntervalInfo(
			ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		if ("".equals(dto.getAsString("date2"))) {
			dto.put("date2", dto.getAsString("date1"));
		}
		List areaList = g4Reader.queryForList(
				"BusBanci.queryCompanyFlatPeakIntervalInfo", dto);
		String jsonString = JsonHelper.encodeObject2Json(areaList);
		write(jsonString, response);
		return mapping.findForward(null);
	}

	// 平峰间隔线路情况
	public ActionForward queryRouteFlatPeakIntervalInit(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("queryRouteFlatPeakIntervalInitView");
	}

	// 平峰发车间隔线路情况
	public ActionForward queryFlatTeamInfo(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		if ("".equals(dto.getAsString("date2"))) {
			dto.put("date2", dto.getAsString("date1"));
		}
		List areaList = g4Reader
				.queryForList("BusBanci.queryRouteFlatPeakInterval", dto);
		String jsonString = JsonHelper.encodeObject2Json(areaList);
		write(jsonString, response);
		return mapping.findForward(null);
	}

	// 班次月超车
	public ActionForward queryCompanyOverInit(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("queryCompanyOverInitView");
	}

	// 班次月超车情况
	public ActionForward queryCompanyOver(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		
		if ("".equals(dto.getAsString("date2"))) {
			dto.put("date2", dto.getAsString("date1"));
		}
		List areaList = g4Reader.queryForList("BusBanci.queryCompanyOver", dto);
		String jsonString = JsonHelper.encodeObject2Json(areaList);
		write(jsonString, response);
		return mapping.findForward(null);
	}

	// 班次月超车
	public ActionForward queryTeamOverInit(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("queryTeamOverInitView");
	}

	// 班次月超车情况
	public ActionForward queryTeamOver(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		if ("".equals(dto.getAsString("date2"))) {
			dto.put("date2", dto.getAsString("date1"));
		}
		List areaList = g4Reader.queryForList("BusBanci.queryTeamOver", dto);
		String jsonString = JsonHelper.encodeObject2Json(areaList);
		write(jsonString, response);
		return mapping.findForward(null);
	}

	// 班次月超车
	public ActionForward queryRouteOverInit(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("queryRouteOverInitView");
	}

	// 班次月超车情况
	public ActionForward queryRouteOver(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		if ("".equals(dto.getAsString("date2"))) {
			dto.put("date2", dto.getAsString("date1"));
		}
		List areaList = g4Reader.queryForList("BusBanci.queryRouteOver", dto);
		String jsonString = JsonHelper.encodeObject2Json(areaList);
		write(jsonString, response);
		return mapping.findForward(null);
	}

	// 双休日班次
	public ActionForward queryWeekendBanciInit(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("queryWeekendBanciInitView");
	}

	// 双休日班次
	public ActionForward queryWeekendBanci(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		List areaList = g4Reader
				.queryForList("BusBanci.queryWeekendBanci", dto);
		String jsonString = JsonHelper.encodeObject2Json(areaList);
		write(jsonString, response);
		return mapping.findForward(null);
	}
	
	// 班次执行情况
		public ActionForward queryBanciExecuteInit(ActionMapping mapping,
				ActionForm form, HttpServletRequest request,
				HttpServletResponse response) throws Exception {

			return mapping.findForward("queryBanciExecuteInitView");
		}

		// 双休日班次
		public ActionForward queryBanciExecute(ActionMapping mapping,
				ActionForm form, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			CommonActionForm aForm = (CommonActionForm) form;
			Dto dto = aForm.getParamAsDto(request);
			List list = g4Reader.queryForPage("BusBanci.queryBanciExecute", dto);
			Integer countInteger = (Integer) g4Reader.queryForObject(
					"BusBanci.countqueryBanciExecute", dto);
			String jsonString = JsonHelper.encodeList2PageJson(list, countInteger,
					G4Constants.FORMAT_Date);
			super.write(jsonString, response);
			return mapping.findForward(null);
		}
		
		public ActionForward queryBanciJianGePlanInit(ActionMapping mapping,
				ActionForm form, HttpServletRequest request,
				HttpServletResponse response) throws Exception {

			return mapping.findForward("queryBanciJianGePlanInitView");
		}

		// 双休日班次
		public ActionForward queryBanciJianGePlan(ActionMapping mapping,
				ActionForm form, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			CommonActionForm aForm = (CommonActionForm) form;
			Dto dto = aForm.getParamAsDto(request);
			List list = g4Reader.queryForPage("BusBanci.queryBanciJianGePlan", dto);
			Integer countInteger = (Integer) g4Reader.queryForObject(
					"BusBanci.countqueryBanciJianGePlan", dto);
			String jsonString = JsonHelper.encodeList2PageJson(list, countInteger,
					G4Constants.FORMAT_Date);
			super.write(jsonString, response);
			return mapping.findForward(null);
		}
}
