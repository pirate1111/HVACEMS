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
		<td colspan="5" style="border:2px solid #ADC4CE; background-color:#F8F6F4;">적정습도</td>
		<td colspan="3" style="border:2px solid #ADC4CE; background-color:#F8F6F4;">45%</td>
		<td rowspan="2"></td>
		<td rowspan="2" colspan="10">
			<input class="rangeInput" id="HrangeInputAll" max="65" min="25" step="1" type="range" value="${dataMap.hygrometerList[0].hygrometerSet}"/><span id="HrangeValueAll"></span>
		</td>
		<td rowspan="2" colspan="2">
			<button id="changeValue" style="background-color:#FFCF96; border:2px solid #ED7D31;" onclick="submit_humid()">습 도</button>
		</td>
		<td rowspan="2" colspan="2">
			<button id="changeValue" onclick="submit_onoff()">전 원</button>
		</td>
		<td rowspan="2" colspan="3"></td>
		<td rowspan="2" colspan="3" style="text-align:right; padding-right:10px;">
			<select name="chooseFunction" onchange="if(this.value) location.href=(this.value);">
				<option value="main.do">전  체</option>
				<option value="temp.do">온  도</option>
				<option value="hum.do" selected>습  도</option>
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
									<input class="rangeInputSet" id="HrangeInputL" max="10" min="0" step="1" type="range" value="${dataMap.thermometerList[0].thermometerErrorRange}"/><span id="HrangeValueL"></span>
								</div>
								<div class="setting-title" style="float:left; padding-top:15px;">🎃&nbsp;&nbsp;습도&nbsp;(0~20)</div>
								<div class="setting-slider">
									<input class="rangeInputSet" id="HrangeInputM" max="20" min="0" step="1" type="range" value="${dataMap.hygrometerList[0].hygrometerErrorRange}"/><span id="HrangeValueM"></span>
								</div>
								<div class="setting-title" style="float:left; padding-top:15px;">🎃&nbsp;&nbsp;기압&nbsp;(0~20)</div>
								<div class="setting-slider">
									<input class="rangeInputSet" id="HrangeInputN" max="20" min="0" step="1" type="range" value="${dataMap.barometerList[0].barometerErrorRange}"/><span id="HrangeValueN"></span>
								</div>
								<div class="setting-title" style="float:left; padding-top:15px;">🎃&nbsp;&nbsp;청정도&nbsp;(0~20)</div>
								<div class="setting-slider">
									<input class="rangeInputSet" id="HrangeInputO" max="20" min="0" step="1" type="range" value="${dataMap.dustmeterList[0].dustmeterErrorRange}"/><span id="HrangeValueO"></span>
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
		<td colspan="5" style="border:2px solid #ADC4CE; background-color:#F8F6F4;">전체 설정 습도</td>
		<td colspan="3" class="ALLhumSet" style="border:2px solid #ADC4CE; background-color:#F8F6F4;"></td>
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
		<td colspan="2" style="background-color:white; font-size:12px; text-align:left; padding-left:2px;">설정범위:25~65%</td>
	</tr>
	<tr class="vent-aisle">
		<td colspan="3"></td>
		<td id="value" class="AhumSet" style="background-color:#EAFDFC;"></td>
		<td id="value" class="AhumMeasure" style="background-color:#EAFDFC;"></td>
		<td colspan="4"></td>
		<td id="value" class="BhumSet" style="background-color:#EAFDFC;"></td>
		<td id="value" class="BhumMeasure" style="background-color:#EAFDFC;"></td>
		<td colspan="4"></td>
		<td id="value" class="ChumSet" style="background-color:#EAFDFC;"></td>
		<td id="value" class="ChumMeasure" style="background-color:#EAFDFC;"></td>
		<td colspan="4"></td>
		<td id="value" class="DhumSet" style="background-color:#EAFDFC;"></td>
		<td id="value" class="DhumMeasure" style="background-color:#EAFDFC;"></td>
		<td colspan="4"></td>
		<td id="value" class="EhumSet" style="background-color:#EAFDFC;"></td>
		<td id="value" class="EhumMeasure" style="background-color:#EAFDFC;"></td>
		<td colspan="2"></td>
		<td colspan="2" style="background-color:white;">
			<div style="margin-left:8px; width:15px; height:15px; background-color:#8294C4; float:left;"></div>
			<div style="float:left; margin-left:8px; font-size:10px;">급기팬</div>
		</td>	
	</tr>
	<tr class="vent-aisle">
		<td colspan="31"></td>
		<td colspan="2" style="background-color:white;">
			<div style="margin-left:8px; width:15px; height:15px; background-color:#64CCC5; float:left;"></div>
			<div style="float:left; margin-left:8px; font-size:10px;">환기팬</div>
		</td>
	</tr>
	
	
	<tr>
		<td colspan="2" rowspan="4" style="background-color:#D2E9E9;"></td>
		<td colspan="29"></td>
		<td colspan="2" style="background-color:white;">
			<div style="margin-left:8px; width:15px; height:15px; background-image:linear-gradient(to right, #77D970 50%, #F90716 50%); float:left; padding-top:3px;"></div>
			<div style="float:left; margin-left:8px; padding-top:3px; font-size:10px;">측정값오류</div>
		</td>
	</tr>
	<tr>
		<td colspan="4">
			<input class="rangeInput" id="HrangeInputA" max="65" min="25" step="1" type="range" value="${dataMap.hygrometerList[1].hygrometerSet}"/><span id="HrangeValueA"></span>
		</td>
		<td colspan="2"></td>
		<td colspan="4">
			<input class="rangeInput" id="HrangeInputB" max="65" min="25" step="1" type="range" value="${dataMap.hygrometerList[2].hygrometerSet}"/><span id="HrangeValueB"></span>			
		</td>
		<td colspan="2"></td>
		<td colspan="4">
			<input class="rangeInput" id="HrangeInputC" max="65" min="25" step="1" type="range" value="${dataMap.hygrometerList[3].hygrometerSet}"/><span id="HrangeValueC"></span>		
		</td>
		<td colspan="2"></td>
		<td colspan="4">
			<input class="rangeInput" id="HrangeInputD" max="65" min="25" step="1" type="range" value="${dataMap.hygrometerList[4].hygrometerSet}"/><span id="HrangeValueD"></span>		
		</td>
		<td colspan="2"></td>
		<td colspan="4">
			<input class="rangeInput" id="HrangeInputE" max="65" min="25" step="1" type="range" value="${dataMap.hygrometerList[5].hygrometerSet}"/><span id="HrangeValueE"></span>		
		</td>
		<td></td>
		<td colspan="2" style="background-color:white;">
			<div style="margin-left:8px; width:15px; height:15px; background-image:linear-gradient(to right, #77D970 50%, #F90716 50%); float:left; border-radius:50%; padding-top:3px;"></div>
			<div style="float:left; margin-left:8px; padding-top:3px; font-size:10px;">공조기전원</div>
		</td>
	</tr>
	<tr>
		<td colspan="29"></td>
		<td rowspan="5" colspan="2" style="background-color:white;"></td>
	</tr>
	<tr>
		<td colspan="3"></td>
		<td>
			<input type="checkbox" id="toggleConditionA" value="" name="airconOnoff" style="border-radius:0; width:15px; height:15px; cursor:auto;" >
			<label for="toggleConditionA" onclick="return false;" style="border-radius:0; width:15px; height:15px; cursor:auto;" ></label>
		</td>
		<td colspan="5"></td>
		<td>
			<input type="checkbox" id="toggleConditionB" value="" name="airconOnoff" style="border-radius:0; width:15px; height:15px; cursor:auto;" >
			<label for="toggleConditionB" onclick="return false;" style="border-radius:0; width:15px; height:15px; cursor:auto;" ></label>
		</td>
		<td colspan="5"></td>
		<td>
			<input type="checkbox" id="toggleConditionC" value="" name="airconOnoff" style="border-radius:0; width:15px; height:15px; cursor:auto;" >
			<label for="toggleConditionC" onclick="return false;" style="border-radius:0; width:15px; height:15px; cursor:auto;" ></label>
		</td>
		<td colspan="5"></td>
		<td>
			<input type="checkbox" id="toggleConditionD" value="" name="airconOnoff" style="border-radius:0; width:15px; height:15px; cursor:auto;" >
			<label for="toggleConditionD" onclick="return false;" style="border-radius:0; width:15px; height:15px; cursor:auto;" ></label>
		</td>
		<td colspan="5"></td>
		<td>
			<input type="checkbox" id="toggleConditionE" value="" name="airconOnoff" style="border-radius:0; width:15px; height:15px; cursor:auto;" >
			<label for="toggleConditionE" onclick="return false;" style="border-radius:0; width:15px; height:15px; cursor:auto;" ></label>
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
			<input type="checkbox" id="toggleConditionF" value="" name="airconOnoff" style="border-radius:0; width:15px; height:15px; cursor:auto;" >
			<label for="toggleConditionF" onclick="return false;" style="border-radius:0; width:15px; height:15px; cursor:auto;" ></label>
		</td>
		<td colspan="5"></td>
		<td>
			<input type="checkbox" id="toggleConditionG" value="" name="airconOnoff" style="border-radius:0; width:15px; height:15px; cursor:auto;" >
			<label for="toggleConditionG" onclick="return false;" style="border-radius:0; width:15px; height:15px; cursor:auto;" ></label>
		</td>
		<td colspan="5"></td>
		<td>
			<input type="checkbox" id="toggleConditionH" value="" name="airconOnoff" style="border-radius:0; width:15px; height:15px; cursor:auto;" >
			<label for="toggleConditionH" onclick="return false;" style="border-radius:0; width:15px; height:15px; cursor:auto;" ></label>
		</td>
		<td colspan="5"></td>
		<td>
			<input type="checkbox" id="toggleConditionI" value="" name="airconOnoff" style="border-radius:0; width:15px; height:15px; cursor:auto;" >
			<label for="toggleConditionI" onclick="return false;" style="border-radius:0; width:15px; height:15px; cursor:auto;" ></label>
		</td>
		<td colspan="5"></td>
		<td>
			<input type="checkbox" id="toggleConditionJ" value="" name="airconOnoff" style="border-radius:0; width:15px; height:15px; cursor:auto;" >
			<label for="toggleConditionJ" onclick="return false;" style="border-radius:0; width:15px; height:15px; cursor:auto;" ></label>
		</td>
		<td></td>
	</tr>
	<tr>
		<td colspan="29"></td>
	</tr>
	<tr>
		<td colspan="4">
			<input class="rangeInput" id="HrangeInputF" max="65" min="25" step="1" type="range" value="${dataMap.hygrometerList[6].hygrometerSet}" /><span id="HrangeValueF"></span>	
		</td>
		<td colspan="2"></td>
		<td colspan="4">
			<input class="rangeInput" id="HrangeInputG" max="65" min="25" step="1" type="range" value="${dataMap.hygrometerList[7].hygrometerSet}" /><span id="HrangeValueG"></span>
		</td>
		<td colspan="2"></td>
		<td colspan="4">
			<input class="rangeInput" id="HrangeInputH" max="65" min="25" step="1" type="range" value="${dataMap.hygrometerList[8].hygrometerSet}" /><span id="HrangeValueH"></span>
		</td>
		<td colspan="2"></td>
		<td colspan="4">
			<input class="rangeInput" id="HrangeInputI" max="65" min="25" step="1" type="range" value="${dataMap.hygrometerList[9].hygrometerSet}" /><span id="HrangeValueI"></span>
		</td>
		<td colspan="2"></td>
		<td colspan="4">
			<input class="rangeInput" id="HrangeInputJ" max="65" min="25" step="1" type="range" value="${dataMap.hygrometerList[10].hygrometerSet}" /><span id="HrangeValueJ"></span>
		</td>
		<td></td>
	</tr>
	<tr>
		<td colspan="29"></td>
	</tr>
	
	
	<tr class="vent-aisle">
		<td colspan="31"></td>
	</tr>
	<tr class="vent-aisle">
		<td colspan="3"></td>
		<td id="value" class="FhumSet" style="background-color:#EAFDFC;"></td>
		<td id="value" class="FhumMeasure" style="background-color:#EAFDFC;"></td>
		<td colspan="4"></td>
		<td id="value" class="GhumSet" style="background-color:#EAFDFC;"></td>
		<td id="value" class="GhumMeasure" style="background-color:#EAFDFC;"></td>
		<td colspan="4"></td>
		<td id="value" class="HhumSet" style="background-color:#EAFDFC;"></td>
		<td id="value" class="HhumMeasure" style="background-color:#EAFDFC;"></td>
		<td colspan="4"></td>
		<td id="value" class="IhumSet" style="background-color:#EAFDFC;"></td>
		<td id="value" class="IhumMeasure" style="background-color:#EAFDFC;"></td>
		<td colspan="4"></td>
		<td id="value" class="JhumSet" style="background-color:#EAFDFC;"></td>
		<td id="value" class="JhumMeasure" style="background-color:#EAFDFC;"></td>
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

<form id="hum" method="POST">
	<input type="hidden" name="hygrometerSetChange" value="" id="Ah">
	<input type="hidden" name="hygrometerSetChange" value="" id="Bh">
	<input type="hidden" name="hygrometerSetChange" value="" id="Ch">
	<input type="hidden" name="hygrometerSetChange" value="" id="Dh">
	<input type="hidden" name="hygrometerSetChange" value="" id="Eh">
	<input type="hidden" name="hygrometerSetChange" value="" id="Fh">
	<input type="hidden" name="hygrometerSetChange" value="" id="Gh">
	<input type="hidden" name="hygrometerSetChange" value="" id="Hh">
	<input type="hidden" name="hygrometerSetChange" value="" id="Ih">
	<input type="hidden" name="hygrometerSetChange" value="" id="Jh">
	<input type="hidden" name="hygrometerSetChange" value="" id="All">
</form>

<form id="errorRange" method="POST">
	<input type="hidden" name="HerrorRangeChange" value="" id="eL">
	<input type="hidden" name="HerrorRangeChange" value="" id="eM">
	<input type="hidden" name="HerrorRangeChange" value="" id="eN">
	<input type="hidden" name="HerrorRangeChange" value="" id="eO">
</form>

</section>
<%@ include file="/WEB-INF/views/module/footer_js.jsp" %>

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
}
</script>

<script>
function sumMeasureCheck(sensorErrorData, i){   
	let checkboxId = 'toggleCondition' + String.fromCharCode(65 + i);
	
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
	document.getElementById("eL").value = document.getElementById("HrangeInputL").value;
	document.getElementById("eM").value = document.getElementById("HrangeInputM").value;
	document.getElementById("eN").value = document.getElementById("HrangeInputN").value;
	document.getElementById("eO").value = document.getElementById("HrangeInputO").value;

	alert("업데이트가 성공했습니다.");
	errorRange.action = "herror.do";
	errorRange.submit();
}

//rnage 값 DB에 전송
function submit_humid(){
	document.getElementById("Ah").value = document.getElementById("HrangeInputA").value+':A';
	document.getElementById("Bh").value = document.getElementById("HrangeInputB").value+':B';
	document.getElementById("Ch").value = document.getElementById("HrangeInputC").value+':C';
	document.getElementById("Dh").value = document.getElementById("HrangeInputD").value+':D';
	document.getElementById("Eh").value = document.getElementById("HrangeInputE").value+':E';
	document.getElementById("Fh").value = document.getElementById("HrangeInputF").value+':F';
	document.getElementById("Gh").value = document.getElementById("HrangeInputG").value+':G';
	document.getElementById("Hh").value = document.getElementById("HrangeInputH").value+':H';
	document.getElementById("Ih").value = document.getElementById("HrangeInputI").value+':I';
	document.getElementById("Jh").value = document.getElementById("HrangeInputJ").value+':J';
	document.getElementById("All").value = document.getElementById("HrangeInputAll").value+':ALL';
	alert("업데이트가 성공했습니다.");
	hum.action = "hupdate.do";
	hum.submit();
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


//설정습도값 넣기
var sethum = [];
<c:forEach items="${dataMap.hygrometerList}" var="hygrometer">
	sethum.push(${hygrometer.hygrometerSet});
</c:forEach>

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
var elements = document.getElementsByClassName('ALLhumSet');
if(elements.length > 0){
	elements[0].innerHTML = sethum[0]+"%";
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


//range의 value span에서 출력되록 하기
//전체값
var rangeInputAll = document.querySelector('#HrangeInputAll'); // 전체 설정값을 조절하는 슬라이더
var rangeValueAll = document.getElementById('HrangeValueAll'); // 전체 설정값을 표시하는 span

//전체 설정값을 조절하는 슬라이더에 대한 이벤트 핸들러
function updateAll() {
  rangeValueAll.textContent = rangeInputAll.value; // 전체 설정값을 표시하는 span 업데이트
}

rangeInputAll.addEventListener('input', updateAll); // 전체 설정값 슬라이더의 input 이벤트 감지
updateAll(); // 페이지 로드 시 초기값에 대한 span 업데이트

//A부터 J까지의 슬라이더와 span 요소들을 업데이트
document.addEventListener('DOMContentLoaded', function () {
  for (let i = 0; i < 10; i++) {
      let rangeInput = document.querySelector('#HrangeInput' + String.fromCharCode(65 + i)); // A부터 J까지의 슬라이더 선택
      let rangeValue = document.getElementById('HrangeValue' + String.fromCharCode(65 + i)); // 해당하는 span 요소 선택

      function updateValue() {
          rangeValue.textContent = rangeInput.value; // 각 슬라이더의 값을 표시하는 span 업데이트
      }

      rangeInput.addEventListener('input', updateValue); // 각 슬라이더의 input 이벤트 감지
      updateValue(); // 페이지 로드 시 초기값에 대한 span 업데이트

      // 전체 설정값 슬라이더가 변경될 때, 각 슬라이더의 값을 업데이트
      rangeInputAll.addEventListener('input', function () {
          rangeInput.value = rangeInputAll.value;
          updateValue(); // 슬라이더 값 업데이트 후 span 업데이트
      });
  }
});

//세팅 슬라이더들의 span요소들을 업데이트
document.addEventListener('DOMContentLoaded', function () {
	for (let i = 11; i < 15; i++) {
	    let rangeInput = document.querySelector('#HrangeInput' + String.fromCharCode(65 + i)); // rangeInputA부터 rangeInputJ까지 선택
	    let rangeValue = document.getElementById('HrangeValue' + String.fromCharCode(65 + i)); // 해당하는 span 요소 선택
		
	    if(i==13){
	    	function updateValue() {
		        rangeValue.textContent = rangeInput.value / 10; // range의 value 값을 span에 출력
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


//세팅 슬라이드 배경색 변경
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

//그 외 모든 슬라이드 배경색 변경
var rangeInputs = document.querySelectorAll('.rangeInput'); // 클래스 이름으로 선택합니다.

function updateBackground(input) {
    var gradient_value = (input.value - input.min) / (input.max - input.min) * 100;
    var newGradient = 'linear-gradient(to right, #FFE283 0%, #FFE283 ' + gradient_value + '%, rgb(236, 236, 236) ' + gradient_value + '%, rgb(236, 236, 236) 100%)';
    input.style.background = newGradient;
}

rangeInputs.forEach(function(input) {
    input.addEventListener('input', function() {
        updateBackground(input);
        updateOtherSliders(input);
    });
    updateBackground(input); // 페이지 로드 시 초기값에 대한 배경색 업데이트
});

// 전체 설정값 조정해서 개별값 배경까지 바꾸기
HrangeInputAll.addEventListener('input', function () {
    var allValue = HrangeInputAll.value;

    // 다른 슬라이더의 값을 업데이트하고 배경색을 설정합니다.
    HrangeInputA.value = allValue;
    updateBackground(HrangeInputA);

    HrangeInputB.value = allValue;
    updateBackground(HrangeInputB);

    HrangeInputC.value = allValue;
    updateBackground(HrangeInputC);
    
    HrangeInputD.value = allValue;
    updateBackground(HrangeInputD);
    
    HrangeInputE.value = allValue;
    updateBackground(HrangeInputE);
    
    HrangeInputF.value = allValue;
    updateBackground(HrangeInputF);
    
    HrangeInputG.value = allValue;
    updateBackground(HrangeInputG);
    
    HrangeInputH.value = allValue;
    updateBackground(HrangeInputH);
    
    HrangeInputI.value = allValue;
    updateBackground(HrangeInputI);
    
    HrangeInputJ.value = allValue;
    updateBackground(HrangeInputJ);
});
</script>