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
		<td colspan="5" style="border:2px solid #ADC4CE; background-color:#F8F6F4;">적정온도</td>
		<td colspan="3" style="border:2px solid #ADC4CE; background-color:#F8F6F4;">23℃</td>
		<td rowspan="2"></td>
		<td rowspan="2" colspan="10">
			<input class="rangeInput" id="rangeInputAll" max="33" min="13" step="1" type="range" value="${dataMap.thermometerList[0].thermometerSet}"/><span id="rangeValueAll"></span>
		</td>
		<td rowspan="2" colspan="2">
			<button id="changeValue" style="background-color:#FFCF96; border:2px solid #ED7D31;" onclick="submit_temp()">온 도</button>
		</td>
		<td rowspan="2" colspan="2">
			<button id="changeValue" onclick="submit_onoff()">전 원</button>
		</td>
		<td rowspan="2" colspan="3"></td>
		<td rowspan="2" colspan="3" style="text-align:right; padding-right:10px;">
			<select name="chooseFunction" onchange="if(this.value) location.href=(this.value);">
				<option value="main.do">전  체</option>
				<option value="temp.do" selected>온  도</option>
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
									<input class="rangeInputSet" id="rangeInputL" max="10" min="0" step="1" type="range" value="${dataMap.thermometerList[0].thermometerErrorRange}"/><span id="rangeValueL"></span>
								</div>
								<div class="setting-title" style="float:left; padding-top:15px;">🎃&nbsp;&nbsp;습도&nbsp;(0~20)</div>
								<div class="setting-slider">
									<input class="rangeInputSet" id="rangeInputM" max="20" min="0" step="1" type="range" value="${dataMap.hygrometerList[0].hygrometerErrorRange}"/><span id="rangeValueM"></span>
								</div>
								<div class="setting-title" style="float:left; padding-top:15px;">🎃&nbsp;&nbsp;기압&nbsp;(0~20)</div>
								<div class="setting-slider">
									<input class="rangeInputSet" id="rangeInputN" max="20" min="0" step="1" type="range" value="${dataMap.barometerList[0].barometerErrorRange}"/><span id="rangeValueN"></span>
								</div>
								<div class="setting-title" style="float:left; padding-top:15px;">🎃&nbsp;&nbsp;청정도&nbsp;(0~20)</div>
								<div class="setting-slider">
									<input class="rangeInputSet" id="rangeInputO" max="20" min="0" step="1" type="range" value="${dataMap.dustmeterList[0].dustmeterErrorRange}"/><span id="rangeValueO"></span>
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
		<td colspan="5" style="border:2px solid #ADC4CE; background-color:#F8F6F4;">전체 설정 온도</td>
		<td colspan="3" class="ALLtempSet" style="border:2px solid #ADC4CE; background-color:#F8F6F4;"></td>
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
		<td colspan="2" style="background-color:white; font-size:12px; text-align:left; padding-left:2px;">설정범위:13~33℃</td>
	</tr>
	<tr class="vent-aisle">
		<td colspan="3"></td>
		<td id="value" class="AtempSet" style="background-color:#F9F3CC;"></td>
		<td id="value" class="AtempMeasure" style="background-color:#F9F3CC;"></td>
		<td colspan="4"></td>
		<td id="value" class="BtempSet" style="background-color:#F9F3CC;"></td>
		<td id="value" class="BtempMeasure" style="background-color:#F9F3CC;"></td>
		<td colspan="4"></td>
		<td id="value" class="CtempSet" style="background-color:#F9F3CC;"></td>
		<td id="value" class="CtempMeasure" style="background-color:#F9F3CC;"></td>
		<td colspan="4"></td>
		<td id="value" class="DtempSet" style="background-color:#F9F3CC;"></td>
		<td id="value" class="DtempMeasure" style="background-color:#F9F3CC;"></td>
		<td colspan="4"></td>
		<td id="value" class="EtempSet" style="background-color:#F9F3CC;"></td>
		<td id="value" class="EtempMeasure" style="background-color:#F9F3CC;"></td>
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
			<input class="rangeInput" id="rangeInputA" max="33" min="13" step="1" type="range" value="${dataMap.thermometerList[1].thermometerSet}" /><span id="rangeValueA"></span>
		</td>
		<td colspan="2"></td>
		<td colspan="4">
			<input class="rangeInput" id="rangeInputB" max="33" min="13" step="1" type="range" value="${dataMap.thermometerList[2].thermometerSet}" /><span id="rangeValueB"></span>
		</td>
		<td colspan="2"></td>
		<td colspan="4">
			<input class="rangeInput" id="rangeInputC" max="33" min="13" step="1" type="range" value="${dataMap.thermometerList[3].thermometerSet}" /><span id="rangeValueC"></span>
		</td>
		<td colspan="2"></td>
		<td colspan="4">
			<input class="rangeInput" id="rangeInputD" max="33" min="13" step="1" type="range" value="${dataMap.thermometerList[4].thermometerSet}" /><span id="rangeValueD"></span>	
		</td>
		<td colspan="2"></td>
		<td colspan="4">
			<input class="rangeInput" id="rangeInputE" max="33" min="13" step="1" type="range" value="${dataMap.thermometerList[5].thermometerSet}" /><span id="rangeValueE"></span>
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
			<input class="rangeInput" id="rangeInputF" max="33" min="13" step="1" type="range"  value="${dataMap.thermometerList[6].thermometerSet}" /><span id="rangeValueF"></span>
		</td>
		<td colspan="2"></td>
		<td colspan="4">
			<input class="rangeInput" id="rangeInputG" max="33" min="13" step="1" type="range"  value="${dataMap.thermometerList[7].thermometerSet}" /><span id="rangeValueG"></span>
		</td>
		<td colspan="2"></td>
		<td colspan="4">
			<input class="rangeInput" id="rangeInputH" max="33" min="13" step="1" type="range"  value="${dataMap.thermometerList[8].thermometerSet}" /><span id="rangeValueH"></span>
		</td>
		<td colspan="2"></td>
		<td colspan="4">
			<input class="rangeInput" id="rangeInputI" max="33" min="13" step="1" type="range"  value="${dataMap.thermometerList[9].thermometerSet}" /><span id="rangeValueI"></span>
		</td>
		<td colspan="2"></td>
		<td colspan="4">
			<input class="rangeInput" id="rangeInputJ" max="33" min="13" step="1" type="range"  value="${dataMap.thermometerList[10].thermometerSet}" /><span id="rangeValueJ"></span>
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
		<td id="value" class="FtempSet" style="background-color:#F9F3CC;"></td>
		<td id="value" class="FtempMeasure" style="background-color:#F9F3CC;"></td>
		<td colspan="4"></td>
		<td id="value" class="GtempSet" style="background-color:#F9F3CC;"></td>
		<td id="value" class="GtempMeasure" style="background-color:#F9F3CC;"></td>
		<td colspan="4"></td>
		<td id="value" class="HtempSet" style="background-color:#F9F3CC;"></td>
		<td id="value" class="HtempMeasure" style="background-color:#F9F3CC;"></td>
		<td colspan="4"></td>
		<td id="value" class="ItempSet" style="background-color:#F9F3CC;"></td>
		<td id="value" class="ItempMeasure" style="background-color:#F9F3CC;"></td>
		<td colspan="4"></td>
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

<form id="temp" method="POST">
	<input type="hidden" name="thermometerSetChange" value="" id="At">
	<input type="hidden" name="thermometerSetChange" value="" id="Bt">
	<input type="hidden" name="thermometerSetChange" value="" id="Ct">
	<input type="hidden" name="thermometerSetChange" value="" id="Dt">
	<input type="hidden" name="thermometerSetChange" value="" id="Et">
	<input type="hidden" name="thermometerSetChange" value="" id="Ft">
	<input type="hidden" name="thermometerSetChange" value="" id="Gt">
	<input type="hidden" name="thermometerSetChange" value="" id="Ht">
	<input type="hidden" name="thermometerSetChange" value="" id="It">
	<input type="hidden" name="thermometerSetChange" value="" id="Jt">
	<input type="hidden" name="thermometerSetChange" value="" id="All">
</form>
	
<form id="errorRange" method="POST">
	<input type="hidden" name="TerrorRangeChange" value="" id="eL">
	<input type="hidden" name="TerrorRangeChange" value="" id="eM">
	<input type="hidden" name="TerrorRangeChange" value="" id="eN">
	<input type="hidden" name="TerrorRangeChange" value="" id="eO">
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
	document.getElementById("eL").value = document.getElementById("rangeInputL").value;
	document.getElementById("eM").value = document.getElementById("rangeInputM").value;
	document.getElementById("eN").value = document.getElementById("rangeInputN").value;
	document.getElementById("eO").value = document.getElementById("rangeInputO").value;

	alert("업데이트가 성공했습니다.");
	errorRange.action = "terror.do";
	errorRange.submit();
}

//rnage 값 DB에 전송
function submit_temp(){
	document.getElementById("At").value = document.getElementById("rangeInputA").value+':A';
	document.getElementById("Bt").value = document.getElementById("rangeInputB").value+':B';
	document.getElementById("Ct").value = document.getElementById("rangeInputC").value+':C';
	document.getElementById("Dt").value = document.getElementById("rangeInputD").value+':D';
	document.getElementById("Et").value = document.getElementById("rangeInputE").value+':E';
	document.getElementById("Ft").value = document.getElementById("rangeInputF").value+':F';
	document.getElementById("Gt").value = document.getElementById("rangeInputG").value+':G';
	document.getElementById("Ht").value = document.getElementById("rangeInputH").value+':H';
	document.getElementById("It").value = document.getElementById("rangeInputI").value+':I';
	document.getElementById("Jt").value = document.getElementById("rangeInputJ").value+':J';
	document.getElementById("All").value = document.getElementById("rangeInputAll").value+':ALL';
	alert("업데이트가 성공했습니다.");
	temp.action = "tupdate.do";
	temp.submit();
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

// 배열의 첫 번째 요소를 HTML 엘리먼트에 할당
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
var elements = document.getElementsByClassName('ALLtempSet');
if (elements.length > 0) {
    elements[0].innerHTML = settemp[0]+"℃";
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
var rangeInputAll = document.querySelector('#rangeInputAll'); // 전체 설정값을 조절하는 슬라이더
var rangeValueAll = document.getElementById('rangeValueAll'); // 전체 설정값을 표시하는 span

// 전체 설정값을 조절하는 슬라이더에 대한 이벤트 핸들러
function updateAll() {
    rangeValueAll.textContent = rangeInputAll.value; // 전체 설정값을 표시하는 span 업데이트
}

rangeInputAll.addEventListener('input', updateAll); // 전체 설정값 슬라이더의 input 이벤트 감지
updateAll(); // 페이지 로드 시 초기값에 대한 span 업데이트

//A부터 J까지의 슬라이더와 span 요소들을 업데이트
document.addEventListener('DOMContentLoaded', function () {
    for (let i = 0; i < 10; i++) {
        let rangeInput = document.querySelector('#rangeInput' + String.fromCharCode(65 + i)); // A부터 J까지의 슬라이더 선택
        let rangeValue = document.getElementById('rangeValue' + String.fromCharCode(65 + i)); // 해당하는 span 요소 선택

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
	    let rangeInput = document.querySelector('#rangeInput' + String.fromCharCode(65 + i)); // rangeInputA부터 rangeInputJ까지 선택
	    let rangeValue = document.getElementById('rangeValue' + String.fromCharCode(65 + i)); // 해당하는 span 요소 선택
		
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
    });
    updateBackground(input); // 페이지 로드 시 초기값에 대한 배경색 업데이트
});


// 전체 설정값 조정해서 개별값 배경까지 바꾸기
rangeInputAll.addEventListener('input', function () {
    var allValue = rangeInputAll.value;

    // 다른 슬라이더의 값을 업데이트하고 배경색을 설정합니다.
    rangeInputA.value = allValue;
    updateBackground(rangeInputA);

    rangeInputB.value = allValue;
    updateBackground(rangeInputB);

    rangeInputC.value = allValue;
    updateBackground(rangeInputC);
    
    rangeInputD.value = allValue;
    updateBackground(rangeInputD);
    
    rangeInputE.value = allValue;
    updateBackground(rangeInputE);
    
    rangeInputF.value = allValue;
    updateBackground(rangeInputF);
    
    rangeInputG.value = allValue;
    updateBackground(rangeInputG);
    
    rangeInputH.value = allValue;
    updateBackground(rangeInputH);
    
    rangeInputI.value = allValue;
    updateBackground(rangeInputI);
    
    rangeInputJ.value = allValue;
    updateBackground(rangeInputJ);
});
</script>