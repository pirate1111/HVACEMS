<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<c:set var="thermometerList" value="${dataMap.thermometerList }" />
<c:set var="hygrometerList" value="${dataMap.hygrometerList }" />
<c:set var="barometerList" value="${dataMap.barometerList }" />
<c:set var="dustmeterList" value="${dataMap.dustmeterList }" />
<c:set var="onoffRecordList" value="${dataMap.onoffRecordListA }"/>
<c:set var="onoffRecordList" value="${dataMap.onoffRecordListB }"/>
<c:set var="onoffRecordList" value="${dataMap.onoffRecordListC }"/>
<c:set var="onoffRecordList" value="${dataMap.onoffRecordListD }"/>
<c:set var="onoffRecordList" value="${dataMap.onoffRecordListE }"/>
<c:set var="onoffRecordList" value="${dataMap.onoffRecordListF }"/>
<c:set var="onoffRecordList" value="${dataMap.onoffRecordListG }"/>
<c:set var="onoffRecordList" value="${dataMap.onoffRecordListH }"/>
<c:set var="onoffRecordList" value="${dataMap.onoffRecordListI }"/>
<c:set var="onoffRecordList" value="${dataMap.onoffRecordListJ }"/>
<head>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/style/plotPlanStyle.css">
	<meta name="viewport" content="width=device-width, initial-scal=1.0">
</head>
<body>
	<!-- Content Header (Page header) -->


<!-- Main content -->
<section>

<table>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>

		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>

		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	
	<tr>
		<td rowspan="2"></td>
		<td colspan="5" class="showValue">적정온도</td>
		<td colspan="5" class="showValue">적정습도</td>
		<td colspan="5" class="showValue">적정기압</td>
		<td colspan="5" class="showValue">적정청정도</td>
		<td rowspan="2" colspan="2">
			<button id="changeValue" onclick="submit_onoff()">전 원</button>
		</td>
		<td colspan="4">
			<div style="margin-left:8px; width:20px; height:20px; background-color:#8294C4; float:left;"></div>
			<div style="float:left; margin-left:8px; font-size:13px;">급기팬</div>
			<div style="margin-left:8px; width:20px; height:20px; background-color:#64CCC5; float:left;"></div>
			<div style="float:left; margin-left:8px; font-size:13px;">환기팬</div>
		</td>
		<td rowspan="2" colspan="3" style="text-align:right; padding-right:10px;">
			<select name="chooseFunction" onchange="if(this.value) location.href=(this.value);">
				<option value="main.do" selected>전  체</option>
				<option value="temp.do">온  도</option>
				<option value="hum.do">습  도</option>
				<option value="pres.do">기  압</option>
				<option value="clean.do">청정도</option>
			</select>
		</td>
		<td rowspan="2">
			<button type="button" class="cctvSeceretButton" style="	border:none; background:#fff;"><img src="/hvacems/resources/img/cctv.png" style="width:25px; height:25px;" onclick="location.href='cctv.do'"></button>
		</td>
		<td rowspan="2">
			<div class="setting-menu">
				<a class="setting-icon" href="#">
					<button type="button" class="setSeceretButton" style="	border:none; background:#fff;"><img src="/hvacems/resources/img/settings.png" style="width:23px; height:23px;"></button>
				</a>
			</div>
			
			<div class="modal" id="myModal">
				<div class="modal-content">
					<div class="modal-header">
						<h5 style="font-weight:bold;">오차범위 설정</h5>
						<span class="close" id="closeModal">&times;</span>
					</div>
					<div class="modal-body">
						<!-- 드롭다운 메뉴 내용을 이곳에 넣으세요 -->
						<div class="setting-header"></div>
						<a href="#" class="setting-item">
							<div class="setting-content">
								<div class="setting-title" style="float:left; padding-top:10px;">🎃&nbsp;&nbsp;온도&nbsp;(0~10)</div>
								<div class="setting-slider">
									<input class="rangeInputSet" id="rangeInputB" max="10" min="0" step="1" type="range" value="${dataMap.thermometerList[0].thermometerErrorRange}"/><span id="rangeValueB"></span>
								</div>
								<div class="setting-title" style="float:left; padding-top:15px;">🎃&nbsp;&nbsp;습도&nbsp;(0~20)</div>
								<div class="setting-slider">
									<input class="rangeInputSet" id="rangeInputC" max="20" min="0" step="1" type="range" value="${dataMap.hygrometerList[0].hygrometerErrorRange}"/><span id="rangeValueC"></span>
								</div>
								<div class="setting-title" style="float:left; padding-top:15px;">🎃&nbsp;&nbsp;기압&nbsp;(0~20)</div>
								<div class="setting-slider">
									<input class="rangeInputSet" id="rangeInputD" max="20" min="0" step="1" type="range" value="${dataMap.barometerList[0].barometerErrorRange}"/><span id="rangeValueD"></span>
								</div>
								<div class="setting-title" style="float:left; padding-top:15px;">🎃&nbsp;&nbsp;청정도&nbsp;(0~20)</div>
								<div class="setting-slider">
									<input class="rangeInputSet" id="rangeInputE" max="20" min="0" step="1" type="range" value="${dataMap.dustmeterList[0].dustmeterErrorRange}"/><span id="rangeValueE"></span>
								</div>
								<div style="padding:15px;" >
									<button id="changeValue" onclick="submit_errorRange()">변 경</button>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</td>
		<td rowspan="2" colspan="2"></td>
	</tr>
	
	<tr>
		<td colspan="5" class="ALLtempSet" style="border:2px solid #ADC4CE; background-color:#F8F6F4;">23℃</td>
		<td colspan="5" class="ALLhumSet" style="border:2px solid #ADC4CE; background-color:#F8F6F4;">45%</td>
		<td colspan="5" class="ALLbaroSet" style="border:2px solid #ADC4CE; background-color:#F8F6F4;">1000</td>
		<td colspan="5" class="ALLdustSet" style="border:2px solid #ADC4CE; background-color:#F8F6F4;">70</td>
		<td colspan="4">
			<div style="margin-left:8px; width:20px; height:20px; background-image:linear-gradient(to right, #77D970 50%, #F90716 50%); float:left; padding-top:3px;"></div>
			<div style="float:left; margin-left:8px; padding-top:3px; font-size:12px;">측정값오류</div>
			<div style="margin-left:8px; width:20px; height:20px; background-image:linear-gradient(to right, #77D970 50%, #F90716 50%); float:left; border-radius:50%; padding-top:3px;"></div>
			<div style="float:left; margin-left:8px; padding-top:3px; font-size:12px;">공조기전원</div>
		</td>
	</tr>
</table>

<table>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>

		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>

		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	
	
	<tr>
		<td rowspan="9"></td>
		<td colspan="3"></td>
		<td id="column" rowspan="2" colspan="2">
			<h6 style="font-weight:bold; color:#363062;">A구역</h6>
		</td>
		<td colspan="4"></td>
		<td id="column" rowspan="2" colspan="2">
			<h6 style="font-weight:bold; color:#363062;">B구역</h6>
		</td>
		<td colspan="4"></td>
		<td id="column" rowspan="2" colspan="2">
			<h6 style="font-weight:bold; color:#363062;">C구역</h6>
		</td>
		<td colspan="4"></td>
		<td id="column" rowspan="2" colspan="2">
			<h6 style="font-weight:bold; color:#363062;">D구역</h6>
		</td>
		<td colspan="4"></td>
		<td id="column" rowspan="2" colspan="2">
			<h6 style="font-weight:bold; color:#363062;">E구역</h6>
		</td>
		<td colspan="2"></td>
		<td colspan="2"></td>
	</tr>
	<tr class="vent-aisle">
		<td colspan="3"></td>
		<td colspan="4"></td>
		<td colspan="4"></td>
		<td colspan="4"></td>
		<td colspan="4"></td>
		<td colspan="2"></td>
		<td colspan="2" style="background-color:white; font-size:10px;">
			<div style="float:left; border:2px solid #B4B4B3; margin-left:2px; width:44px; height:23px; background-color:#white;">설정값</div>
			<div style="float:left; border:2px solid #B4B4B3; border-left: none; width:42px; height:23px; background-color:#white;">측정값</div>
		</td>
	</tr>
	<tr class="vent-aisle">
		<td colspan="31"></td>
		<td colspan="2" style="background-color:white; font-size:10px;">
			<div style="margin-left:8px; width:20px; height:20px; background-color:#F9F3CC; float:left;"></div>
			<div style="float:left; margin-left:8px; padding-top:3px;">온도</div>
		</td>
	</tr>
	<tr class="vent-aisle">
		<td colspan="2"></td>
		<td></td>
		<td id="value" class="AtempSet" style="background-color:#F9F3CC;"></td>
		<td id="value" class="AtempMeasure" style="background-color:#F9F3CC;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="BtempSet" style="background-color:#F9F3CC;"></td>
		<td id="value" class="BtempMeasure" style="background-color:#F9F3CC;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="CtempSet" style="background-color:#F9F3CC;"></td>
		<td id="value" class="CtempMeasure" style="background-color:#F9F3CC;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="DtempSet" style="background-color:#F9F3CC;"></td>
		<td id="value" class="DtempMeasure" style="background-color:#F9F3CC;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="EtempSet" style="background-color:#F9F3CC;"></td>
		<td id="value" class="EtempMeasure" style="background-color:#F9F3CC;"></td>
		<td colspan="2"></td>
		<td colspan="2" style="background-color:white; font-size:10px;">
			<div style="margin-left:8px; width:20px; height:20px; background-color:#EAFDFC; float:left;"></div>
			<div style="float:left; margin-left:8px; padding-top:3px;">습도</div>
		</td>
	</tr>
	<tr class="vent-aisle">
		<td colspan="2"></td>
		<td></td>
		<td id="value" class="AhumSet" style="background-color:#EAFDFC;"></td>
		<td id="value" class="AhumMeasure" style="background-color:#EAFDFC;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="BhumSet" style="background-color:#EAFDFC;"></td>
		<td id="value" class="BhumMeasure" style="background-color:#EAFDFC;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="ChumSet" style="background-color:#EAFDFC;"></td>
		<td id="value" class="ChumMeasure" style="background-color:#EAFDFC;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="DhumSet" style="background-color:#EAFDFC;"></td>
		<td id="value" class="DhumMeasure" style="background-color:#EAFDFC;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="EhumSet" style="background-color:#EAFDFC;"></td>
		<td id="value" class="EhumMeasure" style="background-color:#EAFDFC;"></td>
		<td colspan="2"></td>
		<td colspan="2" style="background-color:white; font-size:10px;">
			<div style="margin-left:8px; width:20px; height:20px; background-color:#B0D8B1; float:left;"></div>
			<div style="float:left; margin-left:8px; padding-top:3px;">기압</div>
		</td>
	</tr>
	
	
	<tr>
		<td colspan="2" rowspan="4" style="background-color:#D2E9E9;"></td>
		<td></td>
		<td id="value" class="AbaroSet" style="background-color:#B0D8B1;"></td>
		<td id="value" class="AbaroMeasure" style="background-color:#B0D8B1;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="BbaroSet" style="background-color:#B0D8B1;"></td>
		<td id="value" class="BbaroMeasure" style="background-color:#B0D8B1;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="CbaroSet" style="background-color:#B0D8B1;"></td>
		<td id="value" class="CbaroMeasure" style="background-color:#B0D8B1;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="DbaroSet" style="background-color:#B0D8B1;"></td>
		<td id="value" class="DbaroMeasure" style="background-color:#B0D8B1;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="EbaroSet" style="background-color:#B0D8B1;"></td>
		<td id="value" class="EbaroMeasure" style="background-color:#B0D8B1;"></td>
		<td colspan="2"></td>
		<td colspan="2" style="background-color:white; font-size:10px;">
			<div style="margin-left:8px; width:20px; height:20px; background-color:#9ED3FF; float:left;"></div>
			<div style="float:left; margin-left:8px; padding-top:3px;">청정도</div>
		</td>
	</tr>
	<tr>
		<td></td>
		<td id="value" class="AdustSet" style="background-color:#9ED3FF;"></td>
		<td id="value" class="AdustMeasure" style="background-color:#9ED3FF;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="BdustSet" style="background-color:#9ED3FF;"></td>
		<td id="value" class="BdustMeasure" style="background-color:#9ED3FF;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="CdustSet" style="background-color:#9ED3FF;"></td>
		<td id="value" class="CdustMeasure" style="background-color:#9ED3FF;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="DdustSet" style="background-color:#9ED3FF;"></td>
		<td id="value" class="DdustMeasure" style="background-color:#9ED3FF;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="EdustSet" style="background-color:#9ED3FF;"></td>
		<td id="value" class="EdustMeasure" style="background-color:#9ED3FF;"></td>
		<td colspan="2"></td>
		<td colspan="2" style="background-color:white; font-size:10px;">
			<div style="margin-left:8px; width:20px; height:20px; background-color:#E5CFF7; float:left;"></div>
			<div style="float:left; margin-left:8px; padding-top:3px;">온도/풍량</div>
		</td>
	</tr>
	<tr>
		<td></td>
		<td id="value" class="Acooler" style="background-color:#E5CFF7;"></td>
		<td id="value" class="Aheater" style="background-color:#E5CFF7;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="Bcooler" style="background-color:#E5CFF7;"></td>
		<td id="value" class="Bheater" style="background-color:#E5CFF7;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="Ccooler" style="background-color:#E5CFF7;"></td>
		<td id="value" class="Cheater" style="background-color:#E5CFF7;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="Dcooler" style="background-color:#E5CFF7;"></td>
		<td id="value" class="Dheater" style="background-color:#E5CFF7;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="Ecooler" style="background-color:#E5CFF7;"></td>
		<td id="value" class="Eheater" style="background-color:#E5CFF7;"></td>
		<td colspan="2"></td>
		<td rowspan="5" colspan="2"></td>
	</tr>
	<tr>
		<td colspan="3"></td>
		<td>
			<input class="measureCheck" type="checkbox" id="toggleConditionA" value="" name="MeasureCheck" style="border-radius:0; width:15px; height:15px; cursor:auto;" >
			<label for="toggleConditionA" onclick="return false;" style="border-radius:0; width:15px; height:15px; cursor:auto;" ></label>
		</td>
		<td colspan="5"></td>
		<td>
			<input class="measureCheck" type="checkbox" id="toggleConditionB" value="" name="MeasureCheck" style="border-radius:0; width:15px; height:15px; cursor:auto;" >
			<label for="toggleConditionB" onclick="return false;" style="border-radius:0; width:15px; height:15px; cursor:auto;"></label>
		</td>
		<td colspan="5"></td>
		<td>
			<input class="measureCheck" type="checkbox" id="toggleConditionC" value="" name="MeasureCheck" style="border-radius:0; width:15px; height:15px; cursor:auto;">
			<label for="toggleConditionC" onclick="return false;" style="border-radius:0; width:15px; height:15px; cursor:auto;"></label>
		</td>
		<td colspan="5"></td>
		<td>
			<input class="measureCheck" type="checkbox" id="toggleConditionD" value="" name="MeasureCheck" style="border-radius:0; width:15px; height:15px; cursor:auto;">
			<label for="toggleConditionD" onclick="return false;" style="border-radius:0; width:15px; height:15px; cursor:auto;"></label>
		</td>
		<td colspan="5"></td>
		<td>
			<input class="measureCheck" type="checkbox" id="toggleConditionE" value="" name="MeasureCheck" style="border-radius:0; width:15px; height:15px; cursor:auto;">
			<label for="toggleConditionE" onclick="return false;" style="border-radius:0; width:15px; height:15px; cursor:auto;"></label>
		</td>
		<td></td>
	</tr>
	<tr>
		<td rowspan="11" colspan="2" style="background-color:#E3F4F4;">
			<h5 style="font-weight:bold; color:#186F65;">door</h5>
		</td>
		<td rowspan="11" style="background-color:#D2E9E9;"></td>
		<td colspan="29"></td>
	</tr>
	<tr>
		<td></td>
		<td class="air-vent" colspan="3"></td>
		<td colspan="3"></td>
		<td class="air-vent" colspan="3"></td>
		<td colspan="3"></td>
		<td class="air-vent" colspan="3"></td>
		<td colspan="3"></td>
		<td class="air-vent" colspan="3"></td>
		<td colspan="3"></td>
		<td class="air-vent" colspan="3"></td>
		<td></td>
	</tr>
	<tr>
		<td colspan="2"></td>
		<td class="air-vent-column"></td>
		<td colspan="5"></td>
		<td class="air-vent-column"></td>
		<td colspan="5"></td>
		<td class="air-vent-column"></td>
		<td colspan="5"></td>
		<td class="air-vent-column"></td>
		<td colspan="5"></td>
		<td class="air-vent-column"></td>
		<td colspan="2"></td>
	</tr>
	
	
	<tr class="vent-aisle">
		<td rowspan="5" style="background-color:#FFFFFF;"></td>
		<td colspan="28"></td>
		<td rowspan="16" colspan="2" style="background-color:#C4DFDF;">
			<h5 style="font-weight:bold; color:#186F65;">hvac</h5>
		</td>
	</tr>
	<tr class="vent-aisle">
		<td colspan="2"></td>
		<td>
			<input type="checkbox" id="toggleA" value="${dataMap.onoffRecordListA[0].onoffYn }" name="A" onchange="OnoffCheck(this);">
			<label for="toggleA" onclick=""></label>
		</td>
		<td colspan="3"></td>
		<td colspan="2"></td>
		<td>
			<input type="checkbox" id="toggleB" value="${dataMap.onoffRecordListB[0].onoffYn }" name="B" onchange="OnoffCheck(this);">
			<label for="toggleB" onclick=""></label>
		</td>
		<td colspan="3"></td>
		<td colspan="2"></td>
		<td>
			<input type="checkbox" id="toggleC" value="${dataMap.onoffRecordListC[0].onoffYn }" name="C" onchange="OnoffCheck(this);">
			<label for="toggleC" onclick=""></label>
		</td>
		<td colspan="3"></td>
		<td colspan="2"></td>
		<td>
			<input type="checkbox" id="toggleD" value="${dataMap.onoffRecordListD[0].onoffYn }" name="D" onchange="OnoffCheck(this);">
			<label for="toggleD" onclick=""></label>
		</td>
		<td colspan="3"></td>
		<td colspan="2"></td>
		<td>
			<input type="checkbox" id="toggleE" value="${dataMap.onoffRecordListE[0].onoffYn }" name="E" onchange="OnoffCheck(this);">
			<label for="toggleE" onclick=""></label>
		</td>
		<td></td>
	</tr>
	<tr class="vent-aisle">
		<td colspan="28"></td>
	</tr>
	<tr class="vent-aisle">
		<td colspan="2"></td>
		<td>
			<input type="checkbox" id="toggleF" value="${dataMap.onoffRecordListF[0].onoffYn }" name="F" onchange="OnoffCheck(this);">
			<label for="toggleF" onclick=""></label>
		</td>
		<td colspan="3"></td>
		<td colspan="2"></td>
		<td>
			<input type="checkbox" id="toggleG" value="${dataMap.onoffRecordListG[0].onoffYn }" name="G" onchange="OnoffCheck(this);">
			<label for="toggleG" onclick=""></label>
		</td>
		<td colspan="3"></td>
		<td colspan="2"></td>
		<td>
			<input type="checkbox" id="toggleH" value="${dataMap.onoffRecordListH[0].onoffYn }" name="H" onchange="OnoffCheck(this);">
			<label for="toggleH" onclick=""></label>
		</td>
		<td colspan="3"></td>
		<td colspan="2"></td>
		<td>
			<input type="checkbox" id="toggleI" value="${dataMap.onoffRecordListI[0].onoffYn }" name="I" onchange="OnoffCheck(this);">
			<label for="toggleI" onclick=""></label>
		</td>
		<td colspan="3"></td>
		<td colspan="2"></td>
		<td>
			<input type="checkbox" id="toggleJ" value="${dataMap.onoffRecordListJ[0].onoffYn }" name="J" onchange="OnoffCheck(this);">
			<label for="toggleJ" onclick=""></label>
		</td>
		<td></td>
	</tr>
	<tr class="vent-aisle">
		<td colspan="28"></td>
	</tr>
	
	
	<tr>
		<td colspan="2"></td>
		<td class="air-vent-column"></td>
		<td colspan="5"></td>
		<td class="air-vent-column"></td>
		<td colspan="5"></td>
		<td class="air-vent-column"></td>
		<td colspan="5"></td>
		<td class="air-vent-column"></td>
		<td colspan="5"></td>
		<td class="air-vent-column"></td>
		<td colspan="2"></td>
	</tr>
	<tr>
		<td></td>
		<td class="air-vent" colspan="3"></td>
		<td colspan="3"></td>
		<td class="air-vent" colspan="3"></td>
		<td colspan="3"></td>
		<td class="air-vent" colspan="3"></td>
		<td colspan="3"></td>
		<td class="air-vent" colspan="3"></td>
		<td colspan="3"></td>
		<td class="air-vent" colspan="3"></td>
		<td></td>
	</tr>
	<tr>
		<td colspan="29"></td>
	</tr>
	<tr>
		<td rowspan="9"></td>
		<td rowspan="4" colspan="2" style="background-color:#D2E9E9;"></td>
		<td colspan="3"></td>
		<td>
			<input class="measureCheck" type="checkbox" id="toggleConditionF" value="" name="MeasureCheck"  style="border-radius:0; width:15px; height:15px; cursor:auto;">
			<label for="toggleConditionF" onclick="return false;" style="border-radius:0; width:15px; height:15px; cursor:auto;"></label>
		</td>
		<td colspan="5"></td>
		<td>
			<input class="measureCheck" type="checkbox" id="toggleConditionG" value="" name="MeasureCheck"  style="border-radius:0; width:15px; height:15px; cursor:auto;">
			<label for="toggleConditionG" onclick="return false;" style="border-radius:0; width:15px; height:15px; cursor:auto;"></label>
		</td>
		<td colspan="5"></td>
		<td>
			<input class="measureCheck" type="checkbox" id="toggleConditionH" value="" name="MeasureCheck"  style="border-radius:0; width:15px; height:15px; cursor:auto;">
			<label for="toggleConditionH" onclick="return false;" style="border-radius:0; width:15px; height:15px; cursor:auto;"></label>
		</td>
		<td colspan="5"></td>
		<td>
			<input class="measureCheck" type="checkbox" id="toggleConditionI" value="" name="MeasureCheck"  style="border-radius:0; width:15px; height:15px; cursor:auto;">
			<label for="toggleConditionI" onclick="return false;" style="border-radius:0; width:15px; height:15px; cursor:auto;"></label>
		</td>
		<td colspan="5"></td>
		<td>
			<input class="measureCheck" type="checkbox" id="toggleConditionJ" value="" name="MeasureCheck"  style="border-radius:0; width:15px; height:15px; cursor:auto;">
			<label for="toggleConditionJ" onclick="return false;" style="border-radius:0; width:15px; height:15px; cursor:auto;"></label>
		</td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td id="value" class="Fcooler" style="background-color:#E5CFF7;"></td>
		<td id="value" class="Fheater" style="background-color:#E5CFF7;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="Gcooler" style="background-color:#E5CFF7;"></td>
		<td id="value" class="Gheater" style="background-color:#E5CFF7;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="Hcooler" style="background-color:#E5CFF7;"></td>
		<td id="value" class="Hheater" style="background-color:#E5CFF7;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="Icooler" style="background-color:#E5CFF7;"></td>
		<td id="value" class="Iheater" style="background-color:#E5CFF7;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="Jcooler" style="background-color:#E5CFF7;"></td>
		<td id="value" class="Jheater" style="background-color:#E5CFF7;"></td>
		<td colspan="2"></td>
		<td rowspan="5" colspan="2"></td>
	</tr>
	<tr>
		<td></td>
		<td id="value" class="FdustSet" style="background-color:#9ED3FF;"></td>
		<td id="value" class="FdustMeasure" style="background-color:#9ED3FF;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="GdustSet" style="background-color:#9ED3FF;"></td>
		<td id="value" class="GdustMeasure" style="background-color:#9ED3FF;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="HdustSet" style="background-color:#9ED3FF;"></td>
		<td id="value" class="HdustMeasure" style="background-color:#9ED3FF;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="IdustSet" style="background-color:#9ED3FF;"></td>
		<td id="value" class="IdustMeasure" style="background-color:#9ED3FF;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="JdustSet" style="background-color:#9ED3FF;"></td>
		<td id="value" class="JdustMeasure" style="background-color:#9ED3FF;"></td>
		<td colspan="2"></td>
	</tr>
	<tr>
		<td></td>
		<td id="value" class="FbaroSet" style="background-color:#B0D8B1;"></td>
		<td id="value" class="FbaroMeasure" style="background-color:#B0D8B1;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="GbaroSet" style="background-color:#B0D8B1;"></td>
		<td id="value" class="GbaroMeasure" style="background-color:#B0D8B1;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="HbaroSet" style="background-color:#B0D8B1;"></td>
		<td id="value" class="HbaroMeasure" style="background-color:#B0D8B1;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="IbaroSet" style="background-color:#B0D8B1;"></td>
		<td id="value" class="IbaroMeasure" style="background-color:#B0D8B1;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="JbaroSet" style="background-color:#B0D8B1;"></td>
		<td id="value" class="JbaroMeasure" style="background-color:#B0D8B1;"></td>
		<td colspan="2"></td>
	</tr>
	
	
	<tr class="vent-aisle">
		<td colspan="2"></td>
		<td></td>
		<td id="value" class="FhumSet" style="background-color:#EAFDFC;"></td>
		<td id="value" class="FhumMeasure" style="background-color:#EAFDFC;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="GhumSet" style="background-color:#EAFDFC;"></td>
		<td id="value" class="GhumMeasure" style="background-color:#EAFDFC;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="HhumSet" style="background-color:#EAFDFC;"></td>
		<td id="value" class="HhumMeasure" style="background-color:#EAFDFC;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="IhumSet" style="background-color:#EAFDFC;"></td>
		<td id="value" class="IhumMeasure" style="background-color:#EAFDFC;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="JhumSet" style="background-color:#EAFDFC;"></td>
		<td id="value" class="JhumMeasure" style="background-color:#EAFDFC;"></td>
		<td colspan="2"></td>
	</tr>
	<tr class="vent-aisle">
		<td colspan="2"></td>
		<td></td>
		<td id="value" class="FtempSet" style="background-color:#F9F3CC;"></td>
		<td id="value" class="FtempMeasure" style="background-color:#F9F3CC;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="GtempSet" style="background-color:#F9F3CC;"></td>
		<td id="value" class="GtempMeasure" style="background-color:#F9F3CC;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="HtempSet" style="background-color:#F9F3CC;"></td>
		<td id="value" class="HtempMeasure" style="background-color:#F9F3CC;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="ItempSet" style="background-color:#F9F3CC;"></td>
		<td id="value" class="ItempMeasure" style="background-color:#F9F3CC;"></td>
		<td colspan="3"></td>
		<td></td>
		<td id="value" class="JtempSet" style="background-color:#F9F3CC;"></td>
		<td id="value" class="JtempMeasure" style="background-color:#F9F3CC;"></td>
		<td colspan="2"></td>
	</tr>
	<tr class="vent-aisle">
		<td colspan="31"></td>
	</tr>
	<tr class="vent-aisle">
		<td colspan="3"></td>
		<td id="column" rowspan="2" colspan="2">
			<h6 style="font-weight:bold; color:#363062;">F구역</h6>
		</td>
		<td colspan="4"></td>
		<td id="column" rowspan="2" colspan="2">
			<h6 style="font-weight:bold; color:#363062;">G구역</h6>
		</td>
		<td colspan="4"></td>
		<td id="column" rowspan="2" colspan="2">
			<h6 style="font-weight:bold; color:#363062;">H구역</h6>
		</td>
		<td colspan="4"></td>
		<td id="column" rowspan="2" colspan="2">
			<h6 style="font-weight:bold; color:#363062;">I구역</h6>
		</td>
		<td colspan="4"></td>
		<td id="column" rowspan="2" colspan="2">
			<h6 style="font-weight:bold; color:#363062;">J구역</h6>
		</td>
		<td colspan="2"></td>
	</tr>
	<tr>
		<td colspan="3"></td>
		<td colspan="4"></td>
		<td colspan="4"></td>
		<td colspan="4"></td>
		<td colspan="4"></td>
		<td colspan="4"></td>
	</tr>
</table>

<form id="onoff" method="POST">
	<input type="hidden" name="onoffCheck" value="" id="A">
	<input type="hidden" name="onoffCheck" value="" id="B">
	<input type="hidden" name="onoffCheck" value="" id="C">
	<input type="hidden" name="onoffCheck" value="" id="D">
	<input type="hidden" name="onoffCheck" value="" id="E">
	<input type="hidden" name="onoffCheck" value="" id="F">
	<input type="hidden" name="onoffCheck" value="" id="G">
	<input type="hidden" name="onoffCheck" value="" id="H">
	<input type="hidden" name="onoffCheck" value="" id="I">
	<input type="hidden" name="onoffCheck" value="" id="J">
</form>

<form id="errorRange" method="POST">
	<input type="hidden" name="errorRangeChange" value="" id="eB">
	<input type="hidden" name="errorRangeChange" value="" id="eC">
	<input type="hidden" name="errorRangeChange" value="" id="eD">
	<input type="hidden" name="errorRangeChange" value="" id="eE">
</form>

</section>
<%@ include file="/WEB-INF/views/module/footer_js.jsp" %>

<script>
let tempList = [];
let windList = [];
let sectionList = [];
$.ajax({
	url: "<%=request.getContextPath()%>/monitor/realTimeHvac.do",
    type: "get",
    success: function (data) {
    	for(let i = 0; i < data.length; i++){
			tempList.push(data[i].hvacTemperature);
			windList.push(data[i].hvacWind);
			sectionList.push(data[i].section);
			
			// 공조기 온도값 넣기
			for (let i = 0; i < 10; i++) {
				let elements = document.getElementsByClassName(String.fromCharCode(65 + i) + 'cooler');
				if (elements.length > 0) {
				    elements[0].innerHTML = tempList[i] + "℃";
				}
			}
			
			// 공조기 풍량값 넣기
			for (let i = 0; i < 10; i++) {
				let elements = document.getElementsByClassName(String.fromCharCode(65 + i) + 'heater');
				if (elements.length > 0) {
				    elements[0].innerHTML = windList[i];
				}
			}
    	}
    	
    }
})

</script>

<script>
//측정값 및 오류 추적을 위한 배열 생성
const SENSOR_NUMBER =10;
var tempMeasureError = new Array(SENSOR_NUMBER).fill(0);
var humidMeasureError = new Array(SENSOR_NUMBER).fill(0);
var pressureMeasureError = new Array(SENSOR_NUMBER).fill(0);
var cleanMeasureError = new Array(SENSOR_NUMBER).fill(0);


function measure() {
	 for (let i = 0; i < SENSOR_NUMBER; i++) {
		 let checkboxId = 'toggleCondition' + String.fromCharCode(65 + i);
         document.getElementById(checkboxId).checked = true;	     
	 }

	// 온도측정
	let temprealtime = [];
	
	$.ajax({
		url: "<%=request.getContextPath()%>/monitor/tempRealtime.do",
		type: "get",
		success: function (data) {
			for (let i = 0; i < SENSOR_NUMBER; i++) {
				temprealtime.push(data[i].temperature);
				
				let minTemp = settemp[i] - ${dataMap.thermometerList[0].thermometerErrorRange};
				let maxTemp = settemp[i] + ${dataMap.thermometerList[0].thermometerErrorRange};
				
				if (temprealtime[i] < minTemp || temprealtime[i] > maxTemp ) {
				    tempMeasureError[i] = 1;
					sumMeasureCheck(tempMeasureError[i],i);
				}else{
					tempMeasureError[i] = 0;
				}
			
			}
			
			// 측정온도값 넣기
			for (let i = 0; i < 10; i++) {
				let elements = document.getElementsByClassName(String.fromCharCode(65 + i) + 'tempMeasure');
				if (elements.length > 0) {
				    elements[0].innerHTML = temprealtime[i] + "℃";
				}
			}
		}
	});

	// 습도측정
	let humrealtime = [];
	
	$.ajax({
	url: "<%=request.getContextPath()%>/monitor/humidRealtime.do",
	type: "get",
		success: function (data) {
			for (let i = 0; i < SENSOR_NUMBER; i++) {
				humrealtime.push(data[i].humid);
				
				let minHum = sethum[i] - ${dataMap.hygrometerList[0].hygrometerErrorRange};
				let maxHum = sethum[i] + ${dataMap.hygrometerList[0].hygrometerErrorRange};
				
				if (humrealtime[i] < minHum || humrealtime[i] > maxHum) {
				    humidMeasureError[i] = 1;
					sumMeasureCheck(pressureMeasureError[i],i);
				}else{
					humidMeasureError[i] = 0;
				}
			    
			}
		
			// 측정습도값 넣기
			for (let i = 0; i < 10; i++) {
				let elements = document.getElementsByClassName(String.fromCharCode(65 + i) + 'humMeasure');
				if (elements.length > 0) {
				    elements[0].innerHTML = humrealtime[i] + "%";
				}
			}
		}
	});

	// 기압측정
	let barorealtime = [];

	$.ajax({
		url: "<%=request.getContextPath()%>/monitor/pressRealtime.do",
		type: "get",
		success: function (data) {
			for (let i = 0; i < SENSOR_NUMBER; i++) {
				barorealtime.push(data[i].pressure);
				
				let minPress = setbaro[i] - ${dataMap.barometerList[0].barometerErrorRange};
				let maxPress = setbaro[i] + ${dataMap.barometerList[0].barometerErrorRange};
				
				if (barorealtime[i] < minPress || barorealtime[i] > maxPress) {
				    pressureMeasureError[i] = 1;
					sumMeasureCheck(pressureMeasureError[i],i);
				}else{
					pressureMeasureError[i] = 0;
				}
			    
			}
		
			// 측정차압값 넣기
			for (let i = 0; i < 10; i++) {
				let elements = document.getElementsByClassName(String.fromCharCode(65 + i) + 'baroMeasure');
				if (elements.length > 0) {
				    elements[0].innerHTML = barorealtime[i];
				}
			}
		}
	});

	// 청정도측정
	let dustrealtime = [];

	$.ajax({
		url: "<%=request.getContextPath()%>/monitor/classsRealtime.do",
		type: "get",
		success: function (data) {
			for (let i = 0; i < SENSOR_NUMBER; i++) {
				dustrealtime.push(data[i].classs);
				
				let mindust = setdust[i] - ${dataMap.dustmeterList[0].dustmeterErrorRange};
				let maxdust = setdust[i] + ${dataMap.dustmeterList[0].dustmeterErrorRange};
				
				if (dustrealtime[i] < mindust || dustrealtime[i] > maxdust) {
				    cleanMeasureError[i] = 1;
				    console.log(cleanMeasureError[i]);
					sumMeasureCheck(cleanMeasureError[i],i);
				}else{
					cleanMeasureError[i] = 0;
				}
			}
		
			// 측정청정도값 넣기
			for (let i = 0; i < 10; i++) {
				let elements = document.getElementsByClassName(String.fromCharCode(65 + i) + 'dustMeasure');
				if (elements.length > 0) {
				    elements[0].innerHTML = dustrealtime[i];
				}
			}
		}
	});
}
</script>

<script>
function sumMeasureCheck(sensorErrorData, i){   
	let checkboxId = 'toggleCondition' + String.fromCharCode(65 + i);
	console.log(sensorErrorData);
	if (sensorErrorData > 0) {
		document.getElementById(checkboxId).checked = false;
	} else {
		document.getElementById(checkboxId).checked = true;
	}
}

window.onload=function(){
	measure();
}
setInterval(measure,5000);
</script>

<script>
//세팅값 DB에 전송
function submit_errorRange(){
	document.getElementById("eB").value = document.getElementById("rangeInputB").value;
	document.getElementById("eC").value = document.getElementById("rangeInputC").value;
	document.getElementById("eD").value = document.getElementById("rangeInputD").value;
	document.getElementById("eE").value = document.getElementById("rangeInputE").value;

	alert("업데이트가 성공했습니다.");
	errorRange.action = "aerror.do";
	errorRange.submit();
}


//체크박스 값 DB에 전송
function submit_onoff(){
	if(${dataMap.onoffRecordListA[0].onoffYn } != document.getElementById("toggleA").value){
		document.getElementById("A").value = document.getElementById("toggleA").value+':A';
	}
	if(${dataMap.onoffRecordListB[0].onoffYn } != document.getElementById("toggleB").value){
		document.getElementById("B").value = document.getElementById("toggleB").value+':B';
	}
	if(${dataMap.onoffRecordListC[0].onoffYn } != document.getElementById("toggleC").value){
		document.getElementById("C").value = document.getElementById("toggleC").value+':C';
	}
	if(${dataMap.onoffRecordListD[0].onoffYn } != document.getElementById("toggleD").value){
		document.getElementById("D").value = document.getElementById("toggleD").value+':D';
	}
	if(${dataMap.onoffRecordListE[0].onoffYn } != document.getElementById("toggleE").value){
		document.getElementById("E").value = document.getElementById("toggleE").value+':E';
	}
	if(${dataMap.onoffRecordListF[0].onoffYn } != document.getElementById("toggleF").value){
		document.getElementById("F").value = document.getElementById("toggleF").value+':F';
	}
	if(${dataMap.onoffRecordListG[0].onoffYn } != document.getElementById("toggleG").value){
		document.getElementById("G").value = document.getElementById("toggleG").value+':G';
	}
	if(${dataMap.onoffRecordListH[0].onoffYn } != document.getElementById("toggleH").value){
		document.getElementById("H").value = document.getElementById("toggleH").value+':H';
	}
	if(${dataMap.onoffRecordListI[0].onoffYn } != document.getElementById("toggleI").value){
		document.getElementById("I").value = document.getElementById("toggleI").value+':I';
	}
	if(${dataMap.onoffRecordListJ[0].onoffYn } != document.getElementById("toggleJ").value){
		document.getElementById("J").value = document.getElementById("toggleJ").value+':J';
	}
	
	onoff.action = "insert.do";
	onoff.submit();
}

//체크박스값 db에서 가져오기
var OnoffCheckA=${dataMap.onoffRecordListA[0].onoffYn }
var OnoffCheckB=${dataMap.onoffRecordListB[0].onoffYn }
var OnoffCheckC=${dataMap.onoffRecordListC[0].onoffYn }
var OnoffCheckD=${dataMap.onoffRecordListD[0].onoffYn }
var OnoffCheckE=${dataMap.onoffRecordListE[0].onoffYn }
var OnoffCheckF=${dataMap.onoffRecordListF[0].onoffYn }
var OnoffCheckG=${dataMap.onoffRecordListG[0].onoffYn }
var OnoffCheckH=${dataMap.onoffRecordListH[0].onoffYn }
var OnoffCheckI=${dataMap.onoffRecordListI[0].onoffYn }
var OnoffCheckJ=${dataMap.onoffRecordListJ[0].onoffYn }

if(OnoffCheckA==1){
	document.getElementById("toggleA").checked = true;
}else{
    document.getElementById("toggleA").checked = false;
}
if(OnoffCheckB==1){
	document.getElementById("toggleB").checked = true;
}else{
    document.getElementById("toggleB").checked = false;
}
if(OnoffCheckC==1){
	document.getElementById("toggleC").checked = true;
}else{
    document.getElementById("toggleC").checked = false;
}
if(OnoffCheckD==1){
	document.getElementById("toggleD").checked = true;
}else{
    document.getElementById("toggleD").checked = false;
}
if(OnoffCheckE==1){
	document.getElementById("toggleE").checked = true;
}else{
    document.getElementById("toggleE").checked = false;
}
if(OnoffCheckF==1){
	document.getElementById("toggleF").checked = true;
}else{
    document.getElementById("toggleF").checked = false;
}
if(OnoffCheckG==1){
	document.getElementById("toggleG").checked = true;
}else{
    document.getElementById("toggleG").checked = false;
}
if(OnoffCheckH==1){
	document.getElementById("toggleH").checked = true;
}else{
    document.getElementById("toggleH").checked = false;
}
if(OnoffCheckI==1){
	document.getElementById("toggleI").checked = true;
}else{
    document.getElementById("toggleI").checked = false;
}
if(OnoffCheckJ==1){
	document.getElementById("toggleJ").checked = true;
}else{
    document.getElementById("toggleJ").checked = false;
}


//체크박스로 공조기 ON/OFF
function OnoffCheck(obj){
	var checked = obj.checked;
	if(checked){
		obj.value=1;
	}else{
		obj.value=0;
	} 
};


//설정온도값 넣기
var settemp = [];
<c:forEach items="${dataMap.thermometerList}" var="thermometer">
    settemp.push(${thermometer.thermometerSet});
</c:forEach>

// var elements = document.getElementsByClassName('ALLtempSet');
// if (elements.length > 0) {
//     elements[0].innerHTML = settemp[0]+"℃";
// }
var elements = document.getElementsByClassName('AtempSet');
if (elements.length > 0) {
    elements[0].innerHTML = settemp[1]+"℃";
}
var elements = document.getElementsByClassName('BtempSet');
if (elements.length > 0) {
    elements[0].innerHTML = settemp[2]+"℃";
}
var elements = document.getElementsByClassName('CtempSet');
if (elements.length > 0) {
    elements[0].innerHTML = settemp[3]+"℃";
}
var elements = document.getElementsByClassName('DtempSet');
if (elements.length > 0) {
    elements[0].innerHTML = settemp[4]+"℃";
}
var elements = document.getElementsByClassName('EtempSet');
if (elements.length > 0) {
    elements[0].innerHTML = settemp[5]+"℃";
}
var elements = document.getElementsByClassName('FtempSet');
if (elements.length > 0) {
    elements[0].innerHTML = settemp[6]+"℃";
}
var elements = document.getElementsByClassName('GtempSet');
if (elements.length > 0) {
    elements[0].innerHTML = settemp[7]+"℃";
}
var elements = document.getElementsByClassName('HtempSet');
if (elements.length > 0) {
    elements[0].innerHTML = settemp[8]+"℃";
}
var elements = document.getElementsByClassName('ItempSet');
if (elements.length > 0) {
    elements[0].innerHTML = settemp[9]+"℃";
}
var elements = document.getElementsByClassName('JtempSet');
if (elements.length > 0) {
    elements[0].innerHTML = settemp[10]+"℃";
}

//설정습도값 넣기
var sethum = [];
<c:forEach items="${dataMap.hygrometerList}" var="hygrometer">
	sethum.push(${hygrometer.hygrometerSet});
</c:forEach>

// var elements = document.getElementsByClassName('ALLhumSet');
// if(elements.length > 0){
// 	elements[0].innerHTML = sethum[0]+"%";
// }
var elements = document.getElementsByClassName('AhumSet');
if(elements.length > 0){
	elements[0].innerHTML = sethum[1]+"%";
}
var elements = document.getElementsByClassName('BhumSet');
if(elements.length > 0){
	elements[0].innerHTML = sethum[2]+"%";
}
var elements = document.getElementsByClassName('ChumSet');
if(elements.length > 0){
	elements[0].innerHTML = sethum[3]+"%";
}
var elements = document.getElementsByClassName('DhumSet');
if(elements.length > 0){
	elements[0].innerHTML = sethum[4]+"%";
}
var elements = document.getElementsByClassName('EhumSet');
if(elements.length > 0){
	elements[0].innerHTML = sethum[5]+"%";
}
var elements = document.getElementsByClassName('FhumSet');
if(elements.length > 0){
	elements[0].innerHTML = sethum[6]+"%";
}
var elements = document.getElementsByClassName('GhumSet');
if(elements.length > 0){
	elements[0].innerHTML = sethum[7]+"%";
}
var elements = document.getElementsByClassName('HhumSet');
if(elements.length > 0){
	elements[0].innerHTML = sethum[8]+"%";
}
var elements = document.getElementsByClassName('IhumSet');
if(elements.length > 0){
	elements[0].innerHTML = sethum[9]+"%";
}
var elements = document.getElementsByClassName('JhumSet');
if(elements.length > 0){
	elements[0].innerHTML = sethum[10]+"%";
}

//설정차압값
var setbaro = [];
<c:forEach items="${dataMap.barometerList}" var="barometer">
	setbaro.push(${barometer.barometerSet});
</c:forEach>

// var elements = document.getElementsByClassName('ALLbaroSet');
// if (elements.length > 0) {
//     elements[0].innerHTML = setbaro[0];
// }
var elements = document.getElementsByClassName('AbaroSet');
if (elements.length > 0) {
    elements[0].innerHTML = setbaro[1];
}
var elements = document.getElementsByClassName('BbaroSet');
if (elements.length > 0) {
    elements[0].innerHTML = setbaro[2];
}
var elements = document.getElementsByClassName('CbaroSet');
if (elements.length > 0) {
    elements[0].innerHTML = setbaro[3];
}
var elements = document.getElementsByClassName('DbaroSet');
if (elements.length > 0) {
    elements[0].innerHTML = setbaro[4];
}
var elements = document.getElementsByClassName('EbaroSet');
if (elements.length > 0) {
    elements[0].innerHTML = setbaro[5];
}
var elements = document.getElementsByClassName('FbaroSet');
if (elements.length > 0) {
    elements[0].innerHTML = setbaro[6];
}
var elements = document.getElementsByClassName('GbaroSet');
if (elements.length > 0) {
    elements[0].innerHTML = setbaro[7];
}
var elements = document.getElementsByClassName('HbaroSet');
if (elements.length > 0) {
    elements[0].innerHTML = setbaro[8];
}
var elements = document.getElementsByClassName('IbaroSet');
if (elements.length > 0) {
    elements[0].innerHTML = setbaro[9];
}
var elements = document.getElementsByClassName('JbaroSet');
if (elements.length > 0) {
    elements[0].innerHTML = setbaro[10];
}

//설정청정도값 넣기
var setdust = [];
<c:forEach items="${dataMap.dustmeterList}" var="dustmeter">
	setdust.push(${dustmeter.dustmeterSet});
</c:forEach>

// var elements = document.getElementsByClassName('ALLdustSet');
// if(elements.length > 0){
// 	elements[0].innerHTML = setdust[0];
// }
var elements = document.getElementsByClassName('AdustSet');
if(elements.length > 0){
	elements[0].innerHTML = setdust[1];
}
var elements = document.getElementsByClassName('BdustSet');
if(elements.length > 0){
	elements[0].innerHTML = setdust[2];
}
var elements = document.getElementsByClassName('CdustSet');
if(elements.length > 0){
	elements[0].innerHTML = setdust[3];
}
var elements = document.getElementsByClassName('DdustSet');
if(elements.length > 0){
	elements[0].innerHTML = setdust[4];
}
var elements = document.getElementsByClassName('EdustSet');
if(elements.length > 0){
	elements[0].innerHTML = setdust[5];
}
var elements = document.getElementsByClassName('FdustSet');
if(elements.length > 0){
	elements[0].innerHTML = setdust[6];
}
var elements = document.getElementsByClassName('GdustSet');
if(elements.length > 0){
	elements[0].innerHTML = setdust[7];
}
var elements = document.getElementsByClassName('HdustSet');
if(elements.length > 0){
	elements[0].innerHTML = setdust[8];
}
var elements = document.getElementsByClassName('IdustSet');
if(elements.length > 0){
	elements[0].innerHTML = setdust[9];
}
var elements = document.getElementsByClassName('JdustSet');
if(elements.length > 0){
	elements[0].innerHTML = setdust[10];
}


//설정창
const setSeceretButton = document.querySelector(".setSeceretButton");
const modal = document.getElementById("myModal");
const closeModal = document.getElementById("closeModal");

setSeceretButton.addEventListener("click", function () {
    if(modal.style.display === "block"){
    	modal.style.display="none";
    } else{
    	modal.style.display="block";
    }
});

closeModal.addEventListener("click", function () {
    modal.style.display = "none";
});

window.addEventListener("click", function (event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
});


//세팅 슬라이더들의 span요소들을 업데이트
document.addEventListener('DOMContentLoaded', function () {
	for (let i = 1; i < 5; i++) {
	    let rangeInput = document.querySelector('#rangeInput' + String.fromCharCode(65 + i)); // rangeInputA부터 rangeInputJ까지 선택
	    let rangeValue = document.getElementById('rangeValue' + String.fromCharCode(65 + i)); // 해당하는 span 요소 선택
		
	    if(i==3){
	    	function updateValue() {
		        rangeValue.textContent = rangeInput.value; // range의 value 값을 span에 출력
		    }	  
	    }else{
		    function updateValue() {
		        rangeValue.textContent = rangeInput.value; // range의 value 값을 span에 출력
		    }	    	
	    }

	    rangeInput.addEventListener('input', updateValue); // input 이벤트를 감지하여 range 값이 변경될 때마다 업데이트
	    updateValue(); // 페이지 로드 시 초기값에 대한 span 업데이트
	}
});


//세팅 슬라이드
var rangeInputs = document.querySelectorAll('.rangeInputSet'); // class 이름으로 선택합니다.

rangeInputs.forEach(function(input) {
    function updateBackground() {
        var gradient_value = (input.value - input.min) / (input.max - input.min) * 100;
        var newGradient = 'linear-gradient(to right, #FFE283 0%, #FFE283 ' + gradient_value + '%, rgb(236, 236, 236) ' + gradient_value + '%, rgb(236, 236, 236) 100%)';
        input.style.background = newGradient;
    }

    input.addEventListener('input', updateBackground);
    updateBackground(); // 페이지 로드 시 초기값에 대한 배경색 업데이트
});
</script>