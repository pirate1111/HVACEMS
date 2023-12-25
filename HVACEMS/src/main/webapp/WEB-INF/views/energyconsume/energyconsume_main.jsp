<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set value="${dataMap.energyconsumeList}" var="consumeList" />
<c:set value="${dataMap.pageMaker}" var="pageMaker" />
<c:set value="${pageMaker.command}" var="command" />


<head>

<!-- datetimepicker -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/datetimepicker/jquery.datetimepicker.css" />
<link rel="stylesheet" ref="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- donwLoad -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
</head>
<body>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6">
					<div class="dt-buttons btn-group flex-wrap ">
						<button class="btn bg-gradient-success" style="width:74px;" type="button" id="pdfDown" onclick="pdfDown()">PDF</button>
						<button class="btn bg-gradient-success" style="width:74px;" type="button" id="csvDown" onclick="csvDown()">CSV</button>
						<button class="btn bg-gradient-success" style="width:74px;" type="button" id="excelDownload" onclick="xlsDown()">Excel</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Content Wrapper. Contains page content -->
	<div class="">
		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="callout callout-info">
						<h5 style="text-align: center;">
							<span id="currentDate"></span> 평균 전력소비량
						</h5>
					</div>
				</div>
			</div>
			<br>
			<!-- 그래프 -->
			<div class="card-body">
				<div class="row">
					<div class="col-md-8">
						<div style="position: relative; height: 200px; width: 100%;">
							<canvas id="lineChart" width="100%" height="50%"></canvas>
							<br> <br>
							<div class="col-md-6 offset-md-4 d-flex justify-content-center mb-2" >
								<table id="example1" class="table table-bordered table-striped dataTable dtr-inline">
									<thead>
										<tr>
											<th class="sorting text-center" tabindex="0"
												aria-controls="example1" rowspan="1" colspan="1"
												aria-label="Rendering engine: activate to sort column ascending">평균
												전력소비량</th>
											<th class="sorting text-center" tabindex="0"
												aria-controls="example1" rowspan="1" colspan="1"
												aria-label="Browser: activate to sort column ascending">누적
												전력소비량(kWh)</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty consumeList}">
											<c:set var="totalConsumption" value="0" />
											<c:forEach items="${consumeList}" var="consume">
												<c:set var="totalConsumption"
													value="${totalConsumption + consume.consumeEnergy}" />
											</c:forEach>
											<c:set var="averageConsumption"
												value="${totalConsumption / fn:length(consumeList)}" />

											<!-- 평균 전력 소비량을 정수로 변환 -->
											<c:set var="averageConsumption"
												value="${fn:substringBefore(averageConsumption, '.')}" />
										</c:if>
										<tr class="odd">
											<td class="text-center">${averageConsumption}kWh</td>
											<td class="text-center">${totalConsumption}kWh</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="col-md-4" id="consumeMainTable">
						<table id="example1" class="table table-bordered table-striped dataTable dtr-inline">
							<thead>
								<tr>
									<th class="sorting text-center" tabindex="0"
										aria-controls="example1" rowspan="1" colspan="1"
										aria-label="Rendering engine: activate to sort column ascending">시간</th>
									<th class="sorting text-center" tabindex="0"
										aria-controls="example1" rowspan="1" colspan="1"
										aria-label="Browser: activate to sort column ascending">전력소비량(kWh)</th>
									<th class="sorting text-center" tabindex="0"
										aria-controls="example1" rowspan="1" colspan="1"
										aria-label="Browser: activate to sort column ascending">구역</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${consumeList}" var="consume">
									<tr class="odd">
										<td class="dtr-control"><fmt:formatDate
												value="${consume.consumeDate}" pattern="HH:mm" /></td>
										<td>${consume.consumeEnergy}</td>
										<td>${consume.hvacNum }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
				<br> <br> <br> <br>
			<div class="wrapper"></div>
		</div>
	</section>
</div>
<%@ include file="/WEB-INF/views/module/footer_js.jsp"%>
<!-- chart -->
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/flot/jquery.flot.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/flot/plugins/jquery.flot.resize.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/flot/plugins/jquery.flot.pie.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/chart.js/Chart.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- datepicker -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
	integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="<%=request.getContextPath()%>/resources/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/datetimepicker/build/jquery.datetimepicker.full.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>
<!-- download-->
<script src="<%=request.getContextPath() %>/resources/js/html2canvas.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jspdf.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>

<script>

       // 그래프를 그릴 canvas 요소 가져오기
       var ctx = document.getElementById('lineChart').getContext('2d');

       // 선 그래프 데이터 생성
       var data = {
           labels: [], // 시간 레이블을 빈 배열로 초기화
           datasets: [{
               label: '전력소비량(kWh)',
               data: [], // 전력소비량 데이터를 빈 배열로 초기화
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
                   beginAtZero: true
               }
           }
       };

       // JSP 변수 consumeList의 데이터를 그래프 데이터에 추가
       <c:forEach items="${consumeList}" var="consume">
           data.labels.push('<fmt:formatDate value="${consume.consumeDate}" pattern="HH:mm"/>'); // 시간을 레이블 배열에 추가
           data.datasets[0].data.push(${consume.consumeEnergy}); // 전력소비량을 데이터 배열에 추가
       </c:forEach>

       // 선 그래프 생성
       var lineChart = new Chart(ctx, {
           type: 'line',
           data: data,
           options: options
       });
   </script>
<!-- datetimepicker -->
<script>
 $(document).ready(function () {
       
        initializeDateTimePicker();

        $('#sectionType, #timeRange').on('change', function () {
            initializeDateTimePicker();
        });

        function initializeDateTimePicker() {
            var sectionType = $('#sectionType').val();
            var timeRange = $('#timeRange').val();

           
            if (sectionType === '' || timeRange === '') {
                $('#fromDate, #toDate').prop('disabled', true);
            } else {
                $('#fromDate, #toDate').prop('disabled', false);
            }

            if (timeRange === 'search.do') {
                $('.datetimepicker').datetimepicker({
                    format: 'Y-m-d',
                    timepicker: false,
                });
            } else if (timeRange === 'searchyear.do') {
                $('.datetimepicker').datetimepicker({
                    format: 'Y-m-d',
                    timepicker: false,
                });
            } else {
                $('.datetimepicker').datetimepicker({
                    format: 'Y-m-d',
                });
            }
            $.datetimepicker.setLocale('kr');
        }
});
    </script>





	<script>
       // JavaScript를 사용하여 현재 날짜를 가져오고 포맷팅
       var currentDate = new Date();
       var formattedDate = currentDate.getFullYear() + '년 ' + (currentDate.getMonth() + 1) + '월 ' + currentDate.getDate() + '일';

       // HTML 요소에 현재 날짜 표시
       document.getElementById("currentDate").textContent = formattedDate;
   </script>
   
<!-- csv -->
<script>
   function csvDown() {
      const table = document.getElementById("consumeMainTable"); // 테이블 설정
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
       link.setAttribute("download", "consumeMain.csv"); // alarmLog.csv 다운로드하는 링크
       document.body.appendChild(link);
       link.click(); // <a> 클릭해서 다운로드 시작
   }
</script>

<!-- pdf -->
<script>
function pdfDown() {
    html2canvas(document.body).then(function(canvas) {
        var imgData = canvas.toDataURL('image/png');
        var imgWidth = 210;
        var pageHeight = 297;
        var imgHeight = canvas.height * imgWidth / canvas.width;
        var heightLeft = imgHeight;
        var position = 0;
        var pdf = new jsPDF('p', 'mm', 'a4');
        var pageData = canvas.toDataURL('image/png', 1.0);

        pdf.addImage(pageData, 'PNG', 0, position, imgWidth, imgHeight);
        heightLeft -= pageHeight;

        while (heightLeft >= 0) {
            position = heightLeft - imgHeight;
            pdf.addPage();
            pdf.addImage(pageData, 'PNG', 0, position, imgWidth, imgHeight);
            heightLeft -= pageHeight;
        }
        pdf.save('download.pdf');
    });
};
</script>

<!-- excel -->
<script>
function _excelDown(fileName, sheetName, sheetHtml) {
    var html = '';
    html += '<html xmlns:x="urn:schemas-microsoft-com:office:excel">';
    html += '    <head>';
    html += '        <meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8">';
    html += '        <xml>';
    html += '            <x:ExcelWorkbook>';
    html += '                <x:ExcelWorksheets>';
    html += '                    <x:ExcelWorksheet>'
    html += '                        <x:Name>' + sheetName + '</x:Name>';   // 시트이름
    html += '                        <x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions>';
    html += '                    </x:ExcelWorksheet>';
    html += '                </x:ExcelWorksheets>';
    html += '            </x:ExcelWorkbook>';
    html += '        </xml>';
    html += '    </head>';
    html += '    <body>';
    
    // ----------------- 시트 내용 부분 -----------------
    html += sheetHtml;
    // ----------------- //시트 내용 부분 -----------------
    
    html += '    </body>';
    html += '</html>';
    
    // 데이터 타입
    var data_type = 'data:application/vnd.ms-excel';
    var ua = window.navigator.userAgent;
    var blob = new Blob([html], {type: "application/csv;charset=utf-8;"});
    
    if ((ua.indexOf("MSIE ") > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) && window.navigator.msSaveBlob) {
        // ie이고 msSaveBlob 기능을 지원하는 경우
        navigator.msSaveBlob(blob, fileName);
    } else {
        // ie가 아닌 경우 (바로 다운이 되지 않기 때문에 클릭 버튼을 만들어 클릭을 임의로 수행하도록 처리)
        var anchor = window.document.createElement('a');
        anchor.href = window.URL.createObjectURL(blob);
        anchor.download = fileName;
        document.body.appendChild(anchor);
        anchor.click();
        
        // 클릭(다운) 후 요소 제거
        document.body.removeChild(anchor);
    }
}

function xlsDown(){
    // 대상 테이블을 가져옴
    var table = document.getElementById("consumeMainTable");
    
    if(table){
        // CASE 대상 테이블이 존재하는 경우
        
        // 엑셀다운 (엑셀파일명, 시트명, 내부데이터HTML)
        _excelDown("consumMain.xls", "consumMain", table.outerHTML)
    }
}
</script>
</body>