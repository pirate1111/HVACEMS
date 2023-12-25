<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<c:set var="temp" value="${temperatureList }" />
<c:set var="humid" value="${humidList }" />
<c:set var="press" value="${pressureList }" />
<c:set var="class" value="${classList }" />
<c:set var="hvacelec" value="${hvacelecList }" />
<c:set var="weather" value="${weatherList}" />

<head><title>HVACEMS</title></head>
<body>
<!-- Content Wrapper. Contains page content -->    
<div class="">
    <!-- Main content -->
    <section class="content">
		<div class="card">
			<div class="card-body" style="width:100%;">
				<div class="row">
					<div class="col-3">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">온도</h3><a href="<%=request.getContextPath()%>/cleandata/temp.do" class="float-sm-right" style="font-size: 8pt;"id="tempdetail">자세히보기+</a>
							</div>
							<div class="card-body">
								 <canvas id="tempChart" style="width:100%; height:280px;"></canvas>
							</div>
						</div>
					</div>
					<div class="col-3">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">습도</h3><a href="<%=request.getContextPath()%>/cleandata/humid.do" class="float-sm-right" style="font-size: 8pt;">자세히보기+</a>
							</div>
							<div class="card-body">
								 <canvas id="humidChart" style="width:100%; height:280px;"></canvas>
							</div>
						</div>
					</div>
					<div class="col-3">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">기압</h3><a href="<%=request.getContextPath()%>/cleandata/press.do" class="float-sm-right" style="font-size: 8pt;">자세히보기+</a>
							</div>
							<div class="card-body">
								 <canvas id="pressChart" style="width:100%; height:280px;"></canvas>
							</div>
						</div>
					</div>
					<div class="col-3">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">청정도</h3><a href="<%=request.getContextPath()%>/cleandata/classs.do" class="float-sm-right" style="font-size: 8pt;">자세히보기+</a>
							</div>
							<div class="card-body">
								 <canvas id="classsChart" style="width:100%; height:280px;"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-6">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">일별 전력소비량</h3><a href="<%=request.getContextPath()%>/cleandata/hvacelec.do"class="float-sm-right" style="font-size: 8pt;">자세히보기+</a>
							</div>
							<div class="card-body">
								<canvas id="hvacelecChart" style="width:100%; height:300px;"></canvas>
							</div>
						</div>
					</div>
					<div class="col-6">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">기상 현황</h3>
							</div>
							<div class="card-body" style="padding-left:5px; padding-right:5px; height:340px;">
								<canvas id="weatherChart" style="width:100%; height:100px;"></canvas>
								<table class="table table-bordered dataTable dtr-inline" style="width:100%; height:200px ">
									<tr class="text-center" style="font-size:10px;">
										<td style="padding:0px; vertical-align:middle;">시간</td>
										<c:forEach items="${weatherList}" var="weather">
											<td style="padding:0px; vertical-align:middle;"><fmt:formatDate value="${weather.weatherDate }" pattern="HH"/></td>
										</c:forEach>
									</tr>
									<tr class="text-center" style="font-size:10px;">
										<td style="padding:0px; vertical-align:middle;">온도</td>
										<c:forEach items="${weatherList}" var="weather">
											<td style="padding:0px; vertical-align:middle;">${weather.weatherTemperature }</td>
										</c:forEach>
									</tr>
									<tr class="text-center" style="font-size:10px;">
										<td style="padding:0px; vertical-align:middle;">습도</td>
										<c:forEach items="${weatherList}" var="weather">
											<td style="padding:0px; vertical-align:middle;">${weather.weatherHumidity }</td>
										</c:forEach>
									</tr>
									<tr class="text-center" style="font-size:10px; ">
										<td style="padding:0px; vertical-align:middle;">기압</td>
										<c:forEach items="${weatherList}" var="weather">
											<td style="padding:0px; vertical-align:middle;">${weather.weatherPressure }</td>
										</c:forEach>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>

<%@ include file="/WEB-INF/views/module/footer_js.jsp" %>
<!-- chart -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/flot/jquery.flot.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/flot/plugins/jquery.flot.resize.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/flot/plugins/jquery.flot.pie.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
//온도
function getTempGraph(){
	let timeList = [];
	let tempList = [];
	
	var data = {
		"sectionType" : "A00",
		"toDate" : "sysdate",
		"perPageNum" : "24"
	}
// 	alert(JSON.stringify(data));
	
	$.ajax({
		url:"<%=request.getContextPath() %>/cleandata/tempGraph.do",
		type:"get",
		data: data,
		success:function(data){
// 			alert(data.length);
			for(let i = 0; i < data.length; i++){
				timeList.push(data[i].date.substring(11,13));
				tempList.push(data[i].temperature);
			}

			new Chart(document.getElementById("tempChart"), {
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
			    	elements: {
					    point: {
					    radius: 0,
				    	},
				    },
			    	responsive: false,
			    	scales: {
			    		y: {
			    			beginAtzero: true
			    		}
			    	}
			    }
			})
		}
	})
};
getTempGraph();
setInterval(getTempGraph,5000);
</script>

<script>
//습도
function getHumidGraph(){
	
	let timeList = [];
	let humidList = [];
	
	var data = {
		"sectionType" : "A00",
		"toDate" : "sysdate",
		"perPageNum" : "24"
	}
// 	alert(JSON.stringify(data));
	
	$.ajax({
		url:"<%=request.getContextPath() %>/cleandata/humidGraph.do",
		type:"get",
		data: data,
		success:function(data){
// 			alert(data[0].temperatureDate);
			for(let i = 0; i < data.length; i++){
				timeList.push(data[i].date.substring(11,13));
				humidList.push(data[i].humid);
			}

			new Chart(document.getElementById("humidChart"), {
			    type: 'line',
			    data: {
			    	labels: timeList,	
			    	datasets: [{
						label: '습도(%)',
						data: humidList,
						borderWidth: 1
					}]
			    },
			    options: {
			    	elements: {
					    point: {
					    radius: 0,
				    	},
				    },
			    	responsive: false,
			    	scales: {
			    		y: {
			    			beginAtzero: true
			    		}
			    	}
			    }
			});
		}
	})
};
getHumidGraph();
setInterval(getHumidGraph,5000);
</script>
<script>
//기압
function getPressGraph(){
	
	let timeList = [];
	let pressList = [];
	
	var data = {
		"sectionType" : "A00",
		"toDate" : "sysdate",
		"perPageNum" : "24"
	}
// 	alert(JSON.stringify(data));
	
	$.ajax({
		url:"<%=request.getContextPath() %>/cleandata/pressGraph.do",
		type:"get",
		data: data,
		success:function(data){
// 			alert(data[0].temperatureDate);
			for(let i = 0; i < data.length; i++){
				timeList.push(data[i].date.substring(11,13));
				pressList.push(data[i].pressure);
			}

			new Chart(document.getElementById("pressChart"), {
			    type: 'line',
			    data: {
			    	labels: timeList,	
			    	datasets: [{
						label: '기압(hPa)',
						data: pressList,
						borderWidth: 1
					}]
			    },
			    options: {
			    	elements: {
					    point: {
					    radius: 0,
				    	},
				    },
			    	responsive: false,
			    	scales: {
			    		y: {
			    			beginAtzero: true
			    		}
			    	}
			    }
			});
		}
	})
};
getPressGraph();
setInterval(getPressGraph,5000);
</script>
<script>
//청정도
function getClasssGraph(){
	
	let timeList = [];
	let classsList = [];
	
	var data = {
		"sectionType" : "A00",
		"toDate" : "sysdate",
		"perPageNum" : "24"
	}
// 	alert(JSON.stringify(data));
	
	$.ajax({
		url:"<%=request.getContextPath() %>/cleandata/classsGraph.do",
		type:"get",
		data: data,
		success:function(data){
// 			alert(data[0].classs);
			for(let i = 0; i < data.length; i++){
				timeList.push(data[i].date.substring(11,13));
				classsList.push(data[i].classs);
			}

			new Chart(document.getElementById("classsChart"), {
			    type: 'line',
			    data: {
			    	labels: timeList,	
			    	datasets: [{
						label: '청정도(CLASS)',
						data: classsList,
						borderWidth: 1
					}]
			    },
			    options: {
			    	elements: {
					    point: {
					    radius: 0,
				    	},
				    },
			    	responsive: false,
			    	scales: {
			    		y: {
			    			beginAtzero: true
			    		}
			    	}
			    }
			});
		}
	})
};
getClasssGraph();
setInterval(getClasssGraph,5000);
</script>
<script>
//일별 전력
function getHvacelecGraph(){
	
	let timeList = [];
	let hvacelecList = [];
	
	var data = {
		"sectionType" : "A00",
		"toDate" : "sysdate",
		"perPageNum" : "24"
	}
// 	alert(JSON.stringify(data));
	
	$.ajax({
		url:"<%=request.getContextPath() %>/cleandata/hvacelecGraph.do",
		type:"get",
		data: data,
		success:function(data){
// 			alert(data[0].hvacelecData);
			for(let i = 0; i < data.length; i++){
				timeList.push(data[i].date.substring(11,13));
				hvacelecList.push(data[i].hvacelecData);
			}
			new Chart(document.getElementById('hvacelecChart'), {
				type: 'bar',
				data: {
					labels: timeList,
				datasets: [{
				  label: '전력량(kWh)',
				  data: hvacelecList,
				  borderWidth: 1
				}]
				},
				options: {
					responsive: false,
					scales: {
						y: {
				  		beginAtZero: true
				  		}
					}
				}
			});

		}
	})
};
getHvacelecGraph();
setInterval(getHvacelecGraph,5000);
</script>	    
<script>
//기상
function getWeatherGraph(){
	
	let timeList = [];
	let weatherList = [];
	
	var data = {
		"toDate" : "sysdate",
		"perPageNum" : "24"
	}
// 	alert(JSON.stringify(data));
	
	$.ajax({
		url:"<%=request.getContextPath() %>/cleandata/weatherGraph.do",
		type:"get",
		data: data,
		success:function(data){
// 			alert(data[0].weatherDate);
			for(let i = 0; i < data.length; i++){
				timeList.push(data[i].date.substring(11,13));
				weatherList.push(data[i].weatherTemperature);
			}
			new Chart(document.getElementById("weatherChart"), {
			    type: 'line',
			    data: {
			    	labels: timeList,	
			    	datasets: [{
						label: '온도(℃)',
						data: weatherList,
						borderWidth: 1
					}]
			    },
			    options: {
			    	elements: {
						point: {
							radius: 0,
			     	    },
			     	},
			    	responsive: false,
			    	scales: {
			    		y: {
			    			beginAtzero: true
			    		},
					    x: {
			    	        display: false,
			    	        ticks: {
			    	          display: false,
			    	        },
			    		}
			    	}
			    }
			});

		}
	})
};
getWeatherGraph();
setInterval(getWeatherGraph,5000);
</script>

