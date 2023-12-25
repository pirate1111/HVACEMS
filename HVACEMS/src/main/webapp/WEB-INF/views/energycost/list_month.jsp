<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="command" value="${dataMap.pageMaker.command }" />
<c:set var="energycostList" value="${dataMap.energycost }" />
<c:set var="reversedCostList" value="${dataMap.reversedCostList }" />

<head>
	<!-- datetimepicker -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/datetimepicker/jquery.datetimepicker.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<!-- Theme style -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/ion-rangeslider/css/ion.rangeSlider.css">
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
					<button type="button" class="btn bg-gradient-success" style="width: 60px;" id="cscDown" onclick="downloadCSV();">CSV</button>
					<button type="button" class="btn bg-gradient-success" style="width: 60px;" onclick="window.print();">인쇄</button>
				</div>
			</div>
			<!-- 데이트피커 -->
			<div class="col-md-6">
				<div class="row">
					<div class="input-group" style="width:800px;">
							<select class="custom-select" onchange="if(this.value) location.href=(this.value);" id="search">
							<option  value="searchmonth.do">월별</option>
							<option value="searchyear.do">연별</option>
						</select>&nbsp;&nbsp;
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
						</div>
						<input type="text" class="form-control datetimepicker" name="fromDate" id="fromDate" value="${command.fromDate }" placeholder="날짜를 선택하세요.">
						<div class="input-group-prepend">
							<span class="input-group-text">~</span>
						</div>
						<input type="text" class="form-control datetimepicker" name="toDate" id="toDate" value="${command.toDate }" placeholder="날짜를 선택하세요.">&nbsp;&nbsp;
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
				<c:choose>
				<c:when test="${empty command.fromDate and empty command.toDate}">
					<h5 style="text-align: center;">월별 에너지 비용</h5>
				</c:when>
	        		<c:otherwise>
						 <h5 style="text-align: center">${command.fromDate} ~ ${command.toDate} 에너지 비용</h5>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		
		<div class="card-body" style="padding-top:0px;">
			<div class="row">
				<div class="col-md-8">
					<canvas id="lineChart" style="min-height: 250px; height: 600px; max-height: 600px; max-width: 100%; display: block; width: 500px;" width="600" height="600" class="chartjs-render-monitor"></canvas>
				</div>
				<div class="col-md-4">
					<table id="cost" class="table table-bordered dataTable dtr-inline" aria-describedby="example1_info" style="height: 50px;">
						<thead>
							<tr>
								<th class="text-center" style="height: 8px;">날짜</th>
								<th class="text-center">비용(원)</th>
								<th class="text-center">전월대비</th>
							</tr>
						</thead>
						<tbody>
						<c:if test="${empty dataMap.energycostList }" >
						<tr>
							<td colspan="4">
								<strong>해당 내용이 없습니다.</strong>
							</td>
						</tr>
						</c:if>
						<c:forEach items="${dataMap.energycostList}" var="energycost" varStatus="loop">
						    <tr class="odd">
						        <td class="text-center"><fmt:formatDate value="${energycost.energycostDate}" pattern="yyyy-MM"/></td>
						        <td class="text-center"><fmt:formatNumber value="${energycost.energyCost}" pattern="#,###"/></td>
						        <c:if test="${dataMap.energycostList.size() != loop.count}">
						        	<c:set var="preCost" value="${dataMap.energycostList[loop.index+1].energyCost }" />
						        	<c:set var="growRate" value="${(preCost - energycost.energyCost)/preCost*100 }" />
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
						<div style="display:${!empty dataMap.energycostList ? 'visible':'none' };">
							<%@ include file="/WEB-INF/views/energycost/monthpagination.jsp" %>
						</div>
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
<!-- Sheet JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
<!--FileSaver savaAs 이용 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>

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
var ctx = document.getElementById('lineChart').getContext('2d');

// 선 그래프 데이터 생성
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

// 그래프 옵션 설정
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

//JSP 변수 cost의 데이터를 그래프 데이터에 추가
<c:forEach items="${dataMap.reversedCostList}" var="reversedCostList">
	data.labels.push('<fmt:formatDate value="${reversedCostList.energycostDate}" pattern="yyyy" />'); // 시간을 레이블 배열에 추가
	data.datasets[0].data.push(${reversedCostList.energyCost}); 
</c:forEach>
    
var lineChart = new Chart(ctx, {
    type: 'line',
    data: data,
    options: options
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
   
<!-- <script>
function max(max) {
	var max = Number.MIN_VALUE;
<c:forEach items="${energycostList}" var="energycost">
	<c:if test="${energycost.energyCost} > max">
		<c:set var="max" value="${energycost.energyCost}"/>
	</c:if>
</c:forEach>

</script> -->

</body>