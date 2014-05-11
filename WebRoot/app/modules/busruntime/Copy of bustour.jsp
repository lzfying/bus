<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<G4Studio:html title="班次统计"  fcfEnabled="true" >
<G4Studio:import src="/app/modules/busruntime/js/bustour.js" />
<G4Studio:body>
<G4Studio:flashReport type="L" dataVar="xmlString" id="myLineChart" align="center" style="margin-top:50px" height="90%" width="100%"
		visible="false" />
</G4Studio:body>
</G4Studio:html>