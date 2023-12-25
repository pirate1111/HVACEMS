<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="command" value="${pageMaker.command }" />
<c:set var="energycostYearList" value="${dataMap.energycostYearList }" />
<c:set var="co2List" value="${dataMap1.co2List }" />
<c:set var="reversedCostYearList" value="${dataMap.reversedCostYearList }" />
<c:set var="reversedCo2List" value="${dataMap1.reversedCo2List }" />

<head>
	<!-- datetimepicker -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/datetimepicker/jquery.datetimepicker.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<!-- Theme style -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/ion-rangeslider/css/ion.rangeSlider.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
body{
-ms-overflow-style:none;
}

::-webkit-scrollbar {
	display:none;
}

id=#change{
justify-content: flex-start;; display :inline-flex;
}
</style>

</head>

<body>
<div class="card-body">
	<section class="content">
		<div class="row">
			<div class="col-md-6">
				<div class="dt-buttons btn-group flex-wrap">
					<button type="button" class="btn bg-gradient-success" style="width: 60px;" id="pdfDown">PDF</button>
					<button type="button" class="btn bg-gradient-success" style="width: 60px;" id="excelDownload">Excel</button>
					<button type="button" class="btn bg-gradient-success" style="width: 60px;" onclick="downloadCSV();">CSV</button>
					<button type="button" class="btn bg-gradient-success" style="width: 60px;" onclick="f_print();">인쇄</button>
				</div>
			</div>
			<!-- 데이트피커 -->
			<div class="col-md-6">
				<div class="row">
					<div class="input-group" style="width:800px;">
						<select class="custom-select" onchange="if(this.value) location.href=(this.value);" id="search">
							<option value="analysisyear.do">연별</option>
							<option value="analysis.do">월별</option>
						</select>&nbsp;&nbsp;
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
						</div>
						<input type="text" class="form-control datetimepicker" name="fromDate" id="fromDate" value="${command.fromDate}" placeholder="날짜와 시간을 선택하세요.">
						<div class="input-group-prepend">
							<span class="input-group-text">~</span>
						</div>
						<input type="text" class="form-control datetimepicker" name="toDate" id="toDate" value="${command.toDate}" placeholder="날짜와 시간을 선택하세요.">&nbsp;&nbsp;
						<span class="input-group-append">
							<button type="button" class="btn bg-gradient-success" onclick="searchList_go(1);" data-card-widget="search" style="width:74px;">조회</button>
						</span>
					</div>
				</div>
			</div>
		</div>
<br/><div id="print">
		<div class="col-12">
			<div class="callout callout-info">
				<h5 style="text-align: center;">연간 에너지 비용</h5>
			</div>
		</div>
		<!-- 그래프 -->
		<div class="row">
			<div class="col-md-8">
				<div class="card-body">
					<canvas id="cost-chart" style="min-height: 300px; height: 300px; max-height: 300px; max-width: 100%; display: block; width: 408px;" width="408" height="250" class="chartjs-render-monitor"></canvas>
				</div>
				<br/>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th class="text-center">연 평균 에너지 비용</th>
							<th class="text-center">누적 에너지 비용</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty dataMap.energycostYearList }" >
						<tr>
							<td colspan="4">
								<strong>해당 내용이 없습니다.</strong>
							</td>
						</tr>
						</c:if>
						<c:if test="${not empty dataMap.energycostYearList}" >
							<c:set var="totalCost" value="0" />
							<c:forEach items="${energycostYearList}" var="energycostYearList" >
								<c:set var="totalCost" value="${totalCost + energycostYearList.totalYear}" />
							</c:forEach>
							<c:set var="averageCost" value="${totalCost / fn:length(dataMap.energycostYearList)}" />
						</c:if>
						<tr class="odd">
							<td class="text-center"><fmt:formatNumber value="${averageCost}" pattern="#,###"/>원</td>
							<td class="text-center"><fmt:formatNumber value="${totalCost}" pattern="#,###"/>원</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-4">
				<table id="cost" class="table table-bordered dataTable dtr-inline" aria-describedby="example1_info">
					<thead>
						<tr>
							<th>날짜</th>
							<th>비용(원)</th>
							<th>편차</th>
							<th>전년대비</th>

						</tr>
					</thead>
					<tbody>
						<c:if test="${empty dataMap.energycostYearList }" >
						<tr>
							<td colspan="5">
								<strong>해당 내용이 없습니다.</strong>
							</td>
						</tr>
						</c:if>
						<c:forEach items="${dataMap.energycostYearList }" var="energycostYearList" varStatus="loop">
							<tr class="odd">
								<td class="text-center">${energycostYearList.year }</td>
								<td class="text-center"><fmt:formatNumber value="${energycostYearList.totalYear }" pattern="#,###"/></td>
								<c:if test="${dataMap.energycostYearList.size() != loop.count}">
									<c:set var="preCost" value="${dataMap.energycostYearList[loop.index+1].totalYear }" />
									<c:set var="deviation" value="${(preCost - energycostYearList.totalYear)}" />
						        	<c:set var="growRate" value="${deviation/preCost*100 }" />
									<td class="text-center"><fmt:formatNumber value="${deviation }" pattern="#,###"/></td>
									<td class="text-center"><fmt:formatNumber type="number" pattern="####" value="${growRate}"/>%</td>
								</c:if>
								<c:if test="${dataMap.energycostYearList.size() == loop.count}">
						        	<td class="text-center">-</td>
						        	<td class="text-center">-</td>
						        </c:if> 
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="card-footer">
					<div style="display:${!empty dataMap.energycostYearList ? 'visible':'none' };">
						<%@ include file="/WEB-INF/views/energycost/year_analysispagination.jsp" %>
					</div>
				</div>
			</div>
		</div>
<br>
		<div class="col-12">
			<div class="callout callout-info">
				<h5 style="text-align: center;">연간 탄소배출량</h5>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<div class=card-body>
					<canvas id="co2-chart" style="min-height: 250px; height: 300px; max-height: 300px; max-width: 100%; display: block; width: 408px;" width="408" height="600" class="chartjs-render-monitor"></canvas>
				</div>
				<br/>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th class="text-center">연 평균 탄소배출량</th>
								<th class="text-center">누적 탄소배출량</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty dataMap.co2List }" >
							<tr>
								<td colspan="4">
									<strong>해당 내용이 없습니다.</strong>
								</td>
							</tr>
							</c:if>
							<c:if test="${not empty co2List}" >
								<c:set var="totalCo2" value="0" />
								<c:forEach items="${co2List}" var="co2">
									<c:set var="totalCo2" value="${totalCo2 + co2.co2Account}" />
								<c:set var="averageCo2" value="${totalCo2 / fn:length(co2List)}" />
								<c:set var="averageCo2" value="${fn:substringBefore(averageCo2, '.')}"/>
								</c:forEach>
							</c:if>
							<tr class="odd">
								<td class="text-center"><fmt:formatNumber value="${averageCo2}" pattern="#,###"/>&nbsp;(tCO2eq/년)</td>
								<td class="text-center"><fmt:formatNumber value="${totalCo2}" pattern="#,###"/>&nbsp;(tCO2eq/년)</td>
							</tr>
						</tbody>
					</table>
				</div>
			<div class="col-md-4">
				<div class="dt-buttons btn-group flex-wrap">
					<button type="button" class="btn bg-gradient-success" style="width: 60px;">Excel</button>
					<button type="button" class="btn bg-gradient-success" style="width: 60px;" onclick="downloadCSV2();">CSV</button>
				</div>
				<table id="co2" class="table table-bordered dataTable dtr-inline" aria-describedby="example1_info">
					<thead>
						<tr>
							<th class="text-center">날짜</th>
							<th class="text-center" style="width:40%">탄소배출량(tCO2eq/년)</th>
							<th class="text-center">전년대비</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty co2List }" >
						<tr>
							<td colspan="4">
								<strong>해당 내용이 없습니다.</strong>
							</td>
						</tr>
						</c:if>
						<c:forEach items="${dataMap1.co2List }" var="co2" varStatus="loop">
							<tr class="odd">
								<td class="text-center"><fmt:formatDate value="${co2.co2Date }" pattern="yyyy"/></td>
								<td class="text-center"><fmt:formatNumber value="${co2.co2Account }" pattern="#,###"/></td>
								<c:if test="${dataMap1.co2List.size() != loop.count}">
									<c:set var="previousCo2" value="${dataMap1.co2List[loop.index+1].co2Account }" />
									<c:set var="growRate" value="${(previousCo2 - co2.co2Account)/previousCo2*100 }" />
								<td class="text-center"><fmt:formatNumber type="number" maxFractionDigits="1" value="${growRate}" />%</td>
								</c:if>
								<c:if test="${dataMap1.co2List.size() == loop.count}">
									<td class="text-center" >-</td>
								</c:if> 
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="card-footer">
					<div style="display:${!empty co2List ? 'visible':'none' };">
						<%@ include file="/WEB-INF/views/energycost/year_analysispagination.jsp" %>
					</div>
				</div>
			</div>
		</div>
</div>
	</section>
</div>


<!-- chart -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/flot/jquery.flot.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/chart.js/Chart.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/flot/plugins/jquery.flot.resize.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/flot/plugins/jquery.flot.pie.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<!-- datepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="<%=request.getContextPath() %>/resources/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath() %>/resources/datetimepicker/build/jquery.datetimepicker.full.min.js"></script>
<!-- pdfdownload-->
<script src="<%=request.getContextPath() %>/resources/js/html2canvas.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jspdf.min.js"></script>


<script>
<!-- datetimepicker -->
var today = new Date();
var year = today.getFullYear();
var month = ('0' + (today.getMonth() + 1)).slice(-2);
var day = ('0' + today.getDate()).slice(-2);
var fromday = ('0' + (today.getDate()-1)).slice(-2);
var fromdate =  year + '-' + month  + '-' + fromday + ' ' + ':' + '00'
var todate = year + '-' + month  + '-' + day + ' '  + ':' + '00';

$('document').ready(function(){
	$('.datetimepicker').datetimepicker({
		format:'Y-m-d',
		lang:'ko',
		step:60,
		timepicker:false
	});
	$.datetimepicker.setLocale('kr');
});
</script>

<script>
var ctx = document.getElementById('cost-chart').getContext('2d');

//선 그래프 데이터 생성
var data = {
labels: [], // 레이블을 빈 배열로 초기화
datasets: [{
   label: '에너지 비용(원)',
   data: [], 
   borderColor: 'rgb(75, 192, 192)',
   borderWidth: 2,
   fill: false
}]
};

//그래프 옵션 설정
var options = {
responsive: true,
scales: {
   x: {
       beginAtZero: true
   },
   y: {
       beginAtZero: false
   }
}
};

//JSP 변수 energycostYearList의 데이터를 그래프 데이터에 추가
<c:forEach items="${dataMap.reversedCostYearList}" var="reversedCostYearList">
data.labels.push(${reversedCostYearList.year}); // 시간을 레이블 배열에 추가
data.datasets[0].data.push(${reversedCostYearList.totalYear}); 
</c:forEach>

var barChart = new Chart(ctx, {
type: 'bar',
data: data,
options: options
});
</script>

<script>
//탄소배출량
var ctx1 = document.getElementById('co2-chart').getContext('2d');

var data1 = {
labels: [], // 레이블을 빈 배열로 초기화
datasets: [{
   label: '탄소배출량',
   data: [], 
   borderColor: 'rgb(75, 192, 192)',
   borderWidth: 2,
   fill: false
}]
};

//그래프 옵션 설정
var options1 = {
responsive: true,
scales: {
   x: {
       beginAtZero: true
   },
   y: {
       beginAtZero: false
   }
}
};

//JSP 변수 co2List의 데이터를 그래프 데이터에 추가
<c:forEach items="${dataMap1.reversedCo2List}" var="reversedCo2List">
data1.labels.push('<fmt:formatDate value="${reversedCo2List.co2Date}" pattern="yyyy" />'); // 시간을 레이블 배열에 추가
data1.datasets[0].data.push(${reversedCo2List.co2Account}); 
</c:forEach>

var lineChart1 = new Chart(ctx1, {
type: 'bar',
data: data1,
options: options1
});

</script>

<!-- pdf -->
<script>
$('#pdfDown').click(function() { 
   
    html2canvas($('#print')[0]).then(function(canvas) { 
   
    var imgData = canvas.toDataURL('image/png');
        
    var imgWidth = 190; 
    var pageHeight = imgWidth * 1.414;  
    var imgHeight = canvas.height * imgWidth / canvas.width;
    var heightLeft = imgHeight;
    var margin = 10; 
    var doc = new jsPDF('p', 'mm');
    var position = 0;
   
    doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
    heightLeft -= pageHeight;
         
    while (heightLeft >= 20) {
        position = heightLeft - imgHeight;
        doc.addPage();
        doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
        heightLeft -= pageHeight;
    }
 
    doc.save('cost.pdf');
   });
});
</script>

<script>
   function downloadCSV() {
      const table = document.getElementById("cost"); // 테이블 설정
      const rows = table.getElementsByTagName("tr"); // 행 저장
       let csvContent = "\uFEFF"; // BOM (utf8이 자꾸 안돼서 이걸로 해봤음)

       const headerCells = rows[0].getElementsByTagName("th"); // 제목 행
       const headerRowData = []; // 제목 행 데이터 저장 배열
       for (const cell of headerCells) {
           headerRowData.push(cell.textContent.trim()); // 제목 행 공백 자르고 배열에 저장
       }
       csvContent += headerRowData.join(",") + "\n"; // 쉼표로 데이터 구분, 개행 문자로 행 구분

       for (let i = 1; i < rows.length; i++) { // 1부터 시작해서 제목 행 다음부터 반복문 실행
           const cells = rows[i].getElementsByTagName("td"); // 데이터 저장
           if (cells.length > 0) {
               const rowData = []; // 데이터 저장 배열
               for (const cell of cells) {
                   rowData.push(cell.textContent.trim()); // 데이터 공백 자르고 배열에 저장
               }
               csvContent += rowData.join(",") + "\n"; // 쉼표, 개행 문자로 데이터 구분
           }
       }

       const encodedUri = "data:text/csv;charset=utf-8," + encodeURIComponent(csvContent); // uri로 인코딩
       const link = document.createElement("a");
       link.setAttribute("href", encodedUri);
       link.setAttribute("download", "costlist.csv"); // alarmLog.csv 다운로드하는 링크
       document.body.appendChild(link);
       link.click(); // <a> 클릭해서 다운로드 시작
   }

   </script>
   
   <script>
   function downloadCSV2() {
      const table = document.getElementById("co2"); // 테이블 설정
      const rows = table.getElementsByTagName("tr"); // 행 저장
       let csvContent = "\uFEFF"; // BOM (utf8이 자꾸 안돼서 이걸로 해봤음)

       const headerCells = rows[0].getElementsByTagName("th"); // 제목 행
       const headerRowData = []; // 제목 행 데이터 저장 배열
       for (const cell of headerCells) {
           headerRowData.push(cell.textContent.trim()); // 제목 행 공백 자르고 배열에 저장
       }
       csvContent += headerRowData.join(",") + "\n"; // 쉼표로 데이터 구분, 개행 문자로 행 구분

       for (let i = 1; i < rows.length; i++) { // 1부터 시작해서 제목 행 다음부터 반복문 실행
           const cells = rows[i].getElementsByTagName("td"); // 데이터 저장
           if (cells.length > 0) {
               const rowData = []; // 데이터 저장 배열
               for (const cell of cells) {
                   rowData.push(cell.textContent.trim()); // 데이터 공백 자르고 배열에 저장
               }
               csvContent += rowData.join(",") + "\n"; // 쉼표, 개행 문자로 데이터 구분
           }
       }

       const encodedUri = "data:text/csv;charset=utf-8," + encodeURIComponent(csvContent); // uri로 인코딩
       const link = document.createElement("a");
       link.setAttribute("href", encodedUri);
       link.setAttribute("download", "co2.csv"); // alarmLog.csv 다운로드하는 링크
       document.body.appendChild(link);
       link.click(); // <a> 클릭해서 다운로드 시작
   }

   </script>

<script>
const excelDownload = document.querySelector('#excelDownload');

document.addEventListener('DOMContentLoaded', ()=>{
    excelDownload.addEventListener('click', exportExcel);
});

function exportExcel(){ 
  // step 1. workbook 생성
  var wb = XLSX.utils.book_new();

  // step 2. 시트 만들기 
  var newWorksheet = excelHandler.getWorksheet();

  // step 3. workbook에 새로만든 워크시트에 이름을 주고 붙인다.  
  XLSX.utils.book_append_sheet(wb, newWorksheet, excelHandler.getSheetName());

  // step 4. 엑셀 파일 만들기 
  var wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary'});

  // step 5. 엑셀 파일 내보내기 
  saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), excelHandler.getExcelFileName());
}

var excelHandler = {
    getExcelFileName : function(){
        return 'energy-cost.xlsx';	//파일명
    },
    getSheetName : function(){
        return 'Table Test Sheet';	//시트명
    },
    getExcelData : function(){
        return document.getElementById('cost'); 	//TABLE id
    },
    getWorksheet : function(){
        return XLSX.utils.table_to_sheet(this.getExcelData());
    }
}

function s2ab(s) { 
  var buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
  var view = new Uint8Array(buf);  //create uint8array as viewer
  for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
  return buf;    
}
</script>

<script>
function f_print(){
    var initBody = document.body.innerHTML;
    window.onbeforeprint = function(){
        // print_area는 인쇄하고자 하는 영역의 ID를 말합니다.( 필수 )
        document.body.innerHTML = document.getElementById("print").innerHTML;
    }
    window.onafterprint = function(){
        document.body.innerHTML = initBody;
    }
    window.print();
}
</script>

</body>
