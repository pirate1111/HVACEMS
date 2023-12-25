<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
	
<style>
.explanation {
	background: #f0f0f0;
	text-align: center;
}
.green {
    width: 1rem;
    height: 1rem;
    border-radius: 50%;
    border: none;
    appearance: none;
    cursor: pointer;
    transition: background 0.2s; 
    background: #00ff00;
}

.red {
	width: 1rem;
    height: 1rem;
    border-radius: 50%;
    border: none;
    appearance: none;
    cursor: pointer;
    transition: background 0.2s; 
    background: #ff0000;
}
</style>
<head>
<!-- board style by oceanny -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/style/board.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/style/plotPlanStyle.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jscharting/JSC/jscharting.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jscharting/JSC/modules/toolbar.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jscharting/JSC/modules/types.js"></script>
</head>
<section class="content">
	<div class="card">
	<div class="card-body" style="width:100%;">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-9">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">실시간 전원현황</h3>
					</div>
					<div class="card-body">
						<div class="table" >
							<table class="table table-bordered text-center" style="height:265px; vertical-align:middle;">
								<tr>
									<td>구분</td>
									<td>A구역</td>
									<td>B구역</td>
									<td>C구역</td>
									<td>D구역</td>
									<td>E구역</td>
									<td>F구역</td>
									<td>G구역</td>
									<td>H구역</td>
									<td>I구역</td>
									<td>J구역</td>
								</tr>
								<tr>
									<td>환풍기</td>
									<td>
										<input type="checkbox" id="hvacA" value="" name="hvacA" >
										<label for="hvacA" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="hvacB" value="" name="hvacB" >
										<label for="hvacB" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="hvacC" value="" name="hvacC" >
										<label for="hvacC" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="hvacD" value="" name="hvacD" >
										<label for="hvacD" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="hvacE" value="" name="hvacE" >
										<label for="hvacE" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="hvacF" value="" name="hvacF" >
										<label for="hvacF" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="hvacG" value="" name="hvacG" >
										<label for="hvacG" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="hvacH" value="" name="hvacH" >
										<label for="hvacH" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="hvacI" value="" name="hvacI" >
										<label for="hvacI" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="hvacJ" value="" name="hvacJ" >
										<label for="hvacJ" onclick="return false;"></label>
									</td>
								</tr>
								<tr>
									<td>쿨러</td>
									<td>
										<input type="checkbox" id="coolerA" value="" name="coolerA" >
										<label for="coolerA" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="coolerB" value="" name="coolerB" >
										<label for="coolerB" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="coolerC" value="" name="coolerC" >
										<label for="coolerC" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="coolerD" value="" name="coolerD" >
										<label for="coolerD" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="coolerE" value="" name="coolerE" >
										<label for="coolerE" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="coolerF" value="" name="coolerF" >
										<label for="coolerF" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="coolerG" value="" name="coolerG" >
										<label for="coolerG" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="coolerH" value="" name="coolerH" >
										<label for="coolerH" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="coolerI" value="" name="coolerI" >
										<label for="coolerI" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="coolerJ" value="" name="coolerJ" >
										<label for="coolerJ" onclick="return false;"></label>
									</td>
								</tr>
								<tr>
									<td>히터</td>
									<td>
										<input type="checkbox" id="heaterA" value="" name="heaterA" >
										<label for="heaterA" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="heaterB" value="" name="heaterB" >
										<label for="heaterB" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="heaterC" value="" name="heaterC" >
										<label for="heaterC" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="heaterD" value="" name="heaterD" >
										<label for="heaterD" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="heaterE" value="" name="heaterE" >
										<label for="heaterE" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="heaterF" value="" name="heaterF" >
										<label for="heaterF" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="heaterG" value="" name="heaterG" >
										<label for="heaterG" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="heaterH" value="" name="heaterH" >
										<label for="heaterH" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="heaterI" value="" name="heaterI" >
										<label for="heaterI" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="heaterJ" value="" name="heaterJ" >
										<label for="heaterJ" onclick="return false;"></label>
									</td>
								</tr>
								<tr>
									<td>가습기</td>
									<td>
										<input type="checkbox" id="dehumidA" value="" name="dehumidA" >
										<label for="dehumidA" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="dehumidB" value="" name="dehumidB" >
										<label for="dehumidB" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="dehumidC" value="" name="dehumidC" >
										<label for="dehumidC" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="dehumidD" value="" name="dehumidD" >
										<label for="dehumidD" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="dehumidE" value="" name="dehumidE" >
										<label for="dehumidE" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="dehumidF" value="" name="dehumidF" >
										<label for="dehumidF" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="dehumidG" value="" name="dehumidG" >
										<label for="dehumidG" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="dehumidH" value="" name="dehumidH" >
										<label for="dehumidH" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="dehumidI" value="" name="dehumidI" >
										<label for="dehumidI" onclick="return false;"></label>
									</td>
									<td>
										<input type="checkbox" id="dehumidJ" value="" name="dehumidJ" >
										<label for="dehumidJ" onclick="return false;"></label>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">실시간 전력사용량</h3>
					</div>
					<div class="card-body" style="height:321px; overflow:hidden;">
						<div id="electricitychart" style="max-width:100%;height:330px; margin: 0px auto;"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-3">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">실시간 온도</h3>
					</div>
					<div class="card-body" style="height:350px;">
						<canvas id="tempChart" style="width:100%; height:280px;"></canvas>
					</div>
				</div>
			</div>
			<div class="col-3">
				<div class="card" >
					<div class="card-header">
						<h3 class="card-title">실시간 습도</h3>
					</div>
					<div class="card-body" style="height:350px;">
						<canvas id="humidChart" style="width:100%; height:280px;"></canvas>
					</div>
				</div>
			</div>
			<div class="col-3">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">실시간 기압</h3>
					</div>
					<div class="card-body" style="height:350px;">
						<canvas id="pressChart" style="width:100%; height:280px;"></canvas>
					</div>
				</div>
			</div>
			<div class="col-3">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">실시간 청정도</h3>
					</div>
					<div class="card-body" style="height:350px; overflow:hidden;">
						<div id="cleanlinesschart" style="max-width: 100%; height:350px; margin: 0px auto; "></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/module/footer_js.jsp" %>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/flot/jquery.flot.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/flot/plugins/jquery.flot.resize.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/flot/plugins/jquery.flot.pie.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.4/raphael-min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/justgage/1.2.2/justgage.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
// alert("123");

function hvacRealtime(){
let hvac1 = [];
let	heater1 = [];
let cooler1 = [];
let dehumid1 = [];

	var data = {
			"hvacNum" : "ALL"
	}
// 	alert("456");
	$.ajax({
		url:"<%=request.getContextPath() %>/hvacRealtime.do",
		type:"get",
		success:function(data){
// 			alert(data.length);
			for(let i = 0; i < data.length; i++){
				heater1.push(data[i].heater);
				cooler1.push(data[i].cooler);
				dehumid1.push(data[i].dehumidifier);
				
				if(heater1[i] && cooler1[i] && dehumid1[i] == 0){					
					hvac1[i] = 1;
				}else {
					hvac1[i] = 0;
				}
			}
			
			for(let i = 0; i < data.length; i++){
				if(hvac1[i] == 1){
					document.getElementById("hvac" + String.fromCharCode(65 + i)).checked = true;
				}else {
					document.getElementById("hvac" + String.fromCharCode(65 + i)).checked = false;
				}
				
				if(heater1[i] == 1){
					document.getElementById("heater" + String.fromCharCode(65 + i)).checked = true;
				}else {
					document.getElementById("heater" + String.fromCharCode(65 + i)).checked = false;
				}
				
				if(cooler1[i] == 1){
					document.getElementById("cooler" + String.fromCharCode(65 + i)).checked = true;
				}else {
					document.getElementById("cooler" + String.fromCharCode(65 + i)).checked = false;
				}
				
				if(dehumid1[i] == 1){
					document.getElementById("dehumid" + String.fromCharCode(65 + i)).checked = true;
				}else {
					document.getElementById("dehumid" + String.fromCharCode(65 + i)).checked = false;
				}
			}
		}
	})
	
};
hvacRealtime();
setInterval(hvacRealtime, 5000);
</script>

<script>
//온도
let timeList = [];
let tempList = [];
let tempChart = null;

function tempGraph() {
    var data = {
        "sectionType": "A00",
    }

    $.ajax({
        url: "<%=request.getContextPath() %>/tempRealtime.do",
        type: "get",
        success: function (data) {
            timeList.push(data[10].date);
            tempList.push(data[10].temperature);

            if (tempChart) {
                tempChart.destroy();
            }

            tempChart = new Chart(document.getElementById("tempChart"), {
                type: 'line',
                data: {
                    labels: timeList,
                    datasets: [{
                        label: '온도(℃)',
                        data: tempList,
                        borderWidth: 1
                    }]
                },
                options: {
                	animation: false, 
                	elements: {
 			     	   point: {
 			     	   radius: 0,
 			     	  },
 			     	},
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: false,
                            min: 16,
                            max: 30 
                        },
                        x: {
                            display: false,
                            ticks: {
                                display: false,
                            },
                        }
                    },
                }
            })
        }
    })
};

tempGraph();
setInterval(tempGraph, 5000);
</script>

<script>
// 습도
let htimeList = [];
let humidList = [];
let humidChart = null;

function humidGraph() {
    var data = {
        "sectionType": "A00",
    }

    $.ajax({
        url: "<%=request.getContextPath() %>/humidRealtime.do",
        type: "get",
        success: function (data) {
            htimeList.push(data[10].date);
            humidList.push(data[10].humid);

            if (humidChart) {
                humidChart.destroy();
            }

            humidChart = new Chart(document.getElementById("humidChart"), {
                type: 'line',
                data: {
                    labels: htimeList,
                    datasets: [{
                        label: '습도(%)',
                        data: humidList,
                        borderWidth: 1
                    }]
                },
                options: {
                	animation: false, 
                	elements: {
 			     	   point: {
 			     	   radius: 0,
 			     	  },
 			     	},
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: false,
                            min: 35,
                            max: 55 
                        },
                        x: {
                            display: false,
                            ticks: {
                                display: false,
                            },
                        }
                    },
                }
            })
        }
    })
};

humidGraph();
setInterval(humidGraph, 5000);

</script>

<script>
// 기압
let ptimeList = [];
let pressList = [];
let pressChart = null;

function pressGraph() {
    var data = {
        "sectionType": "A00",
    }

    $.ajax({
        url: "<%=request.getContextPath() %>/pressRealtime.do",
        type: "get",
        success: function (data) {
            ptimeList.push(data[10].date);
            pressList.push(data[10].pressure);

            if (pressChart) {
                pressChart.destroy();
            }

            pressChart = new Chart(document.getElementById("pressChart"), {
                type: 'line',
                animation_duration: 1,
                data: {
                    labels: ptimeList,
                    datasets: [{
                        label: '기압(hPa)',
                        data: pressList,
                        borderWidth: 1
                    }]
                },
                options: {
                	animation: false, 
                	elements: {
 			     	   point: {
 			     	   radius: 0,
 			     	  },
 			     	},
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: false,
                            min: 950,
                            max: 1050 
                        },
                        x: {
                            display: false,
                            ticks: {
                                display: false,
                            },
                        }
                    },
                }
            })
        }
    })
};

pressGraph();
setInterval(pressGraph, 5000);
</script>

<script>
	var realtimeelec;
function elecGraph(){
	
	var data = {
			"hvacNum" : "ALL",
		}
	
	$.ajax({
	    url: "<%=request.getContextPath() %>/hvacRealtime.do",
	    type: "get",
	    data: data,
	    success: function (data) {
	    	realtimeelec = data[0].consumeEnergy;
	    	
			var chart = JSC.chart('electricitychart', {									// 차트 'electricitychart'에 연결되어 있는 자바스크립트
			    debug: true,															// 디버그 모드를 활성화함
			    type: 'gauge',															// 차트 타입을 원형 게이지로 설정함.
			    animation_duration: 1,												// 차트 업데이트 애니메이션의 지속 시간을 1000밀리초(1초)로 설정함.
			    legend_visible: false,													// 범례를 표시하지 않음.
			    xAxis: { 																// X축에 대한 설정을 지정함.
			    	spacingPercentage: 0.25 },											// X축의 각 눈금 사이의 간격을 전체 축 길이의 25%로 설정함
			    yAxis: {																// Y축에 대한 설정을 지정함.
			        defaultTick: {														// 'defaultTick' 옵션
			            padding: -5,													// 각 눈금의 레이블과 눈금 사이의 간격을 음수 값으로 설정하여 레이블이 눈금 위에 오게 만듬. 일반적으로 레이블이 눈금 아래에 위치하는데, 음수 값을 주면 레이블이 눈금 위로 올라가게 됨.
			            label_style_fontSize: '12px'									// 눈금 레이블의 폰트 크기를 12px로 설정함.
			        },
			        line: {																// 'line' 옵션
			            width: 9,														// Y축 라인의 너비를 9로 설정함.
			            color: 'smartPalette',											// Y축 라인의 색상을 smartPalette에서 지정한 색상으로 설정함.(smartPalette는 차트에서 사용하는 기본 색상 팔레트를 나타냄.)
			            breaks_gap: 0.06												//  Y축의 각 눈금 사이에 간격을 설정함. 이 값은 눈금 간의 간격을 조정함.
			        },
			        scale_range: [0, 600]												// Y축의 값 범위를 0부터 2600까지로 설정함. 이는 Y축이 0부터 2600까지의 값을 나타낼 수 있도록 설정하는 것임.
			    },
			    palette: {																// 'palette' 옵션
			        pointValue: '{%value/600}',											// 차트에서 사용되는 각 포인트의 값을 100으로 나눈 값을 나타냄. 이는 데이터 값을 100으로 나눈 비율을 통해 색상을 결정하는 데 사용될 수 있음.
			        colors: ['green', 'yellow', 'red']									// 차트에서 사용될 색상 팔레트를 정의함. 여기서는 초록색, 노란색, 빨간색 순서로 색상이 지정됨.
			    },
			    defaultTooltip_enabled: false,											// 기본 툴팁 기능을 비활성화함. 툴팁은 사용자가 차트의 특정 부분을 가리킬 때 나타나는 정보를 나타냄.
			    defaultSeries: {														// 'defaultSeries' 옵션
			        angle: { sweep: 180 },												// 시리즈의 각도를 설정함. 이 경우에는 180도로 설정되어 있어 반원 형태의 차트를 나타냄.
			        shape: { innerSize: '70%',											// 시리즈의 모양을 설정함. innerSize는 시리즈의 내부 공간을 나타냄. 여기서는 전체 크기의 70%를 사용하여 중심 부분이 비어 있는 반원 형태의 차트를 나타냄.
			            label: {														//레이블을 지정하는 부분임. 여기서는 포인트의 값을 나타내는데 사용됨
			                text: '<span color="%color">{%sum:n1}</span><br/><span color="#696969" fontSize="20px">kWh</span>',	// 속성에서는 포인트의 값({%sum:n1})을 포함한 HTML 형식의 문자열을 지정함
			                style_fontSize: '46px',										// 스타일 폰트 크기를 46px로 설정함
			                verticalAlign: 'middle'										// 레이블을 수직 중앙에 정렬함
			            }
			        }
			    },
			    series: [{																// 'series' 옵션
			        type: 'column roundcaps',											// 이 시리즈는 원형 캡(round caps)이 있는 컬럼 형태로 표시됨. 각 데이터 포인트는 세로 막대로 나타나며, 끝 부분이 둥근 형태로 디자인됨
			        points: [{ id: '1', x: 'speed', y: 0 }]								// 시리즈에 표시될 데이터 포인트를 정의함. 여기서는 'id', 'x', 'y' 값을 갖는 객체 배열을 사용함
			    }]
			});
			
			function setelectricityGauge(max, y) {										// 'setelectricityGauge(max, y)' 함수 ('max' 매개변수는 게이지의 최대 값으로 사용되고, 'y' 매개변수는 랜덤한 값을 나타냄)
			    chart.series(0).options({ points: [{ id: '1', x: 'speed', y: y }] });	// 차트의 첫 번째 시리즈(인덱스 0)의 첫 번째 데이터 포인트를 업데이트함. 'id': '1'은 데이터 포인트의 고유 식별자이고, 'x: 'speed''은 x 축의 위치를 지정합니다. 'y: y'는 게이지의 값을 나타냄
			}
			
			setelectricityGauge(100, realtimeelec);
	    }
	})
};

elecGraph();
setInterval(elecGraph,5000);
</script>

<script>
function classsGraph(){
	let realtimeclasss = 0;
	
	var data = {
		"sectionType" : "A00",
	}
	
	$.ajax({
		url:"<%=request.getContextPath() %>/classsRealtime.do",
		type:"get",
		data: data,
		success:function(data){
			realtimeclasss = data[10].classs
			
			var chartCleanliness = JSC.chart('cleanlinesschart', {						// 차트 'cleanlinesschart'에 연결되어 있는 자바스크립트
			    debug: true,															// 디버그 모드를 활성화함
			    type: 'gauge',															// 차트 타입을 원형 게이지로 설정함.
			    animation_duration: 1,												// 차트 업데이트 애니메이션의 지속 시간을 1000밀리초(1초)로 설정함.
			    legend_visible: false,													// 범례를 표시하지 않음.
			    xAxis: { 																// X축에 대한 설정을 지정함.
			    	spacingPercentage: 0.25 },											// X축의 각 눈금 사이의 간격을 전체 축 길이의 25%로 설정함
			    yAxis: {																// Y축에 대한 설정을 지정함.
			        defaultTick: {														// 'defaultTick' 옵션
			            padding: -5,													// 각 눈금의 레이블과 눈금 사이의 간격을 음수 값으로 설정하여 레이블이 눈금 위에 오게 만듬. 일반적으로 레이블이 눈금 아래에 위치하는데, 음수 값을 주면 레이블이 눈금 위로 올라가게 됨.
			            label_style_fontSize: '12px'									// 눈금 레이블의 폰트 크기를 12px로 설정함.
			        },
			        line: {																// 'line' 옵션
			            width: 9,														// Y축 라인의 너비를 9로 설정함.
			            color: 'smartPalette',											// Y축 라인의 색상을 smartPalette에서 지정한 색상으로 설정함.(smartPalette는 차트에서 사용하는 기본 색상 팔레트를 나타냄.)
			            breaks_gap: 0.06												// Y축의 각 눈금 사이에 간격을 설정함. 이 값은 눈금 간의 간격을 조정함.
			        },
			        scale_range: [0, 150]												// Y축의 값 범위를 0부터 100까지로 설정함. 이는 Y축이 0부터 100까지의 값을 나타낼 수 있도록 설정하는 것임.
			    },
			    palette: {																// 'palette' 옵션
			        pointValue: '{%value/150}',											// 차트에서 사용되는 각 포인트의 값을 100으로 나눈 값을 나타냄. 이는 데이터 값을 100으로 나눈 비율을 통해 색상을 결정하는 데 사용될 수 있음.
			        colors: ['red', 'yellow', 'green']									// 차트에서 사용될 색상 팔레트를 정의함. 여기서는 초록색, 노란색, 빨간색 순서로 색상이 지정됨.
			    },
			    defaultTooltip_enabled: false,											// 기본 툴팁 기능을 비활성화함. 툴팁은 사용자가 차트의 특정 부분을 가리킬 때 나타나는 정보를 나타냄.
			    defaultSeries: {														// 'defaultSeries' 옵션
			        angle: { sweep: 180 },												// 시리즈의 각도를 설정함. 이 경우에는 180도로 설정되어 있어 반원 형태의 차트를 나타냄.
			        shape: { innerSize: '70%',											// 시리즈의 모양을 설정함. innerSize는 시리즈의 내부 공간을 나타냄. 여기서는 전체 크기의 70%를 사용하여 중심 부분이 비어 있는 반원 형태의 차트를 나타냄.
			            label: {														//레이블을 지정하는 부분임. 여기서는 포인트의 값을 나타내는데 사용됨
			                text: '<span color="%color">{%sum:n1}</span><br/><span color="#696969" fontSize="20px">class</span>',	// 속성에서는 포인트의 값({%sum:n1})을 포함한 HTML 형식의 문자열을 지정함
			                style_fontSize: '46px',										// 스타일 폰트 크기를 46px로 설정함
			                verticalAlign: 'middle'										// 레이블을 수직 중앙에 정렬함
			            }
			        }
			    },
			    series: [																// 'series' 옵션
			        {
			            type: 'column roundcaps',										// 이 시리즈는 원형 캡(round caps)이 있는 컬럼 형태로 표시됨. 각 데이터 포인트는 세로 막대로 나타나며, 끝 부분이 둥근 형태로 디자인됨
			            points: [{ id: '1', x: 'speed', y: 0 }]							// 시리즈에 표시될 데이터 포인트를 정의함. 여기서는 'id', 'x', 'y' 값을 갖는 객체 배열을 사용함
			        }
			    ]
			});
			
			function setcleanlinessGauge(max, y) {										// 'setelectricityGauge(max, y)' 함수 ('max' 매개변수는 게이지의 최대 값으로 사용되고, 'y' 매개변수는 랜덤한 값을 나타냄)
			    chartCleanliness.series(0).options({ points: [{ id: '1', x: 'speed', y: y }] });	// 차트의 첫 번째 시리즈(인덱스 0)의 첫 번째 데이터 포인트를 업데이트함. 'id': '1'은 데이터 포인트의 고유 식별자이고, 'x: 'speed''은 x 축의 위치를 지정합니다. 'y: y'는 게이지의 값을 나타냄
			}
			   																			// 'ELECTRICITY_INTERVAL_ID' 변수는 'setInterval' 함수에 의해 반환된 타이머 ID를 저장함
			setcleanlinessGauge(100, realtimeclasss);										// 'setelectricityGauge' 함수 ('y' 값을 30으로 고정한다.)
			    
		}
	})
};

classsGraph();
setInterval(classsGraph,5000);
</script>