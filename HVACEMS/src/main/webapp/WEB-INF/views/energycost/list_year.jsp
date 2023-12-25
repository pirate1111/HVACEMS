<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
					<button type="button" class="btn bg-gradient-success" style="width: 60px;" onclick="window.print();">인쇄</button>
				</div>
			</div>
			<!-- 데이트피커 -->
			<div class="col-md-6">
				<div class="row">
					<div class="input-group" style="width:800px;">
						<select class="custom-select" onchange="if(this.value) location.href=(this.value);" id="search">
							<option value="searchyear.do">연별</option>
							<option value="searchmonth.do">월별</option>
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
			<div class="callout callout">
				<h5 style="text-align: center;" id="days">연간 에너지 비용</h5>
			</div>
		</div>

		<!-- 에너지 비용 -->
		<div class="card-body" style="padding-top:0px;">
			<div class="row">
				<div class="col-md-8">
					<canvas id="energy-chart" style="min-height: 300px; height: 300px; max-height: 300px; max-width: 100%; display: block; width: 408px;" width="408" height="250" class="chartjs-render-monitor"></canvas>
				</div>
				<div class="col-md-4">
					<table id="cost" class="table table-bordered" style="height:50px;">
						<thead>
							<tr>
								<th class="text-center">날짜</th>
								<th class="text-center">비용(원)</th>
								<th class="text-center">전년대비</th>
	
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
							<c:forEach items="${dataMap.energycostYearList }" var="energycostYearList" varStatus="loop">
								<tr class="odd">
									<td class="text-center">${energycostYearList.year }</td>
									<td class="text-center"><fmt:formatNumber value="${energycostYearList.totalYear }" pattern="#,###"/></td>
									 <c:if test="${dataMap.energycostYearList.size() != loop.count}">
									 	<c:set var="preCost" value="${dataMap.energycostYearList[loop.index+1].totalYear }" />
							        	<c:set var="growRate" value="${(preCost - energycost.totalYear)/preCost*100 }" />
							        	<td class="text-center"><fmt:formatNumber pattern="#.##" value="${growRate }" /> %</td>
							        </c:if>
									<c:if test="${dataMap.energycostList.size() == loop.count}">
							        	<td class="text-center">-</td>
							        </c:if> 
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="card-footer">
						<div style="display:${!empty dataMap.energycostYearList ? 'visible':'none' };">
							<%@ include file="/WEB-INF/views/energycost/yearpagination.jsp" %>
						</div>
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
							<th class="text-center" style="width:50%">탄소배출량(tCO2eq/년)</th>
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
								<td class="text-center" style="width:50%"><fmt:formatNumber value="${co2.co2Account }" pattern="#,###"/></td>
								<c:if test="${dataMap1.co2List.size() != loop.count}">
									<c:set var="preCo2" value="${dataMap1.co2List[loop.index+1].co2Account }" />
									<c:set var="growRate" value="${(preCo2 - co2.co2Account)/preCo2*100 }" />
								<td class="text-center" ><fmt:formatNumber pattern="#.##" value="${growRate }" /> %</td>
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
						<%@ include file="/WEB-INF/views/energycost/yearpagination.jsp" %>
					</div>
				</div>
			</div>
		</div>
		</div>
	</section>
</div>
<%@ include file="/WEB-INF/views/module/footer_js.jsp"%>


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
var ctx = document.getElementById('energy-chart').getContext('2d');

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

 
var lineChart = new Chart(ctx, {
 type: 'line',
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
type: 'line',
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
 
    doc.save('costChart.pdf');
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
	var currentDate = new Date();
    var formattedDate = currentDate.getFullYear() + '년'
    
	if (${command.fromDate} == "" and ${command.toDate} == "") {
		var dateElement = document.getElementById("days");
		dateElement.getElementById("days").textContent = "formattedDate 에너지 비용";
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

</body>
