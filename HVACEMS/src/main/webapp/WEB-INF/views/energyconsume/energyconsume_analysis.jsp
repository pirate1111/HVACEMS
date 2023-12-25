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
<c:set value="${dataMap.consumemonth}" var="consumemonth" />
<html>
<head>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&amp;display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<!-- Ekko Lightbox -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/plugins/ekko-lightbox/ekko-lightbox.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/plugins/ion-rangeslider/css/ion.rangeSlider.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"
	integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- datetimepicker -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/datetimepicker/jquery.datetimepicker.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"
	integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

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
				<!-- 데이트피커 -->
				<div class="col-6">
					<div class="row">
						<div class="input-group" style="width: 800px;">
							<select class="form-control" name="sectionType" id="sectionType">

								<option value="ALL"
									${command.sectionType eq 'ALL' ? 'selected':'' }>전체구역</option>
								<option value="A" ${command.sectionType eq 'A' ? 'selected':'' }>A구역</option>
								<option value="B" ${command.sectionType eq 'B' ? 'selected':'' }>B구역</option>
								<option value="C" ${command.sectionType eq 'C' ? 'selected':'' }>C구역</option>
								<option value="D" ${command.sectionType eq 'D' ? 'selected':'' }>D구역</option>
								<option value="E" ${command.sectionType eq 'E' ? 'selected':'' }>E구역</option>
								<option value="F" ${command.sectionType eq 'F' ? 'selected':'' }>F구역</option>
								<option value="G" ${command.sectionType eq 'G' ? 'selected':'' }>G구역</option>
								<option value="H" ${command.sectionType eq 'H' ? 'selected':'' }>H구역</option>
								<option value="I" ${command.sectionType eq 'I' ? 'selected':'' }>I구역</option>
								<option value="J" ${command.sectionType eq 'J' ? 'selected':'' }>J구역</option>
							</select>&nbsp;&nbsp; <select class="form-control" name="timeRange"
								id="timeRange"
								onchange="if(this.value) location.href=(this.value);">

								<option value=>월별</option>
								<option value="analysisyear.do">연별</option>
							</select>&nbsp;&nbsp;

							<div class="input-group-prepend">
								<span class="input-group-text"><i
									class="far fa-calendar-alt"></i></span>
							</div>
							<input type="text" class="form-control datetimepicker"
								name="fromDate" id="fromDate" value="${command.fromDate}"
								placeholder="날짜를 선택하세요.">
							<div class="input-group-prepend">
								<span class="input-group-text">~</span>
							</div>
							<input type="text" class="form-control datetimepicker"
								name="toDate" id="toDate" value="${command.toDate}"
								placeholder="날짜를 선택하세요.">&nbsp;&nbsp; <span
								class="input-group-append">
								<button type="button" class="btn bg-gradient-success"
									onclick="searchList_go(1);" data-card-widget="analysis"
									style="width: 74px;">조회</button>
							</span>
						</div>
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
				<!-- 그래프 -->
				<div class="row">
					<div class="col-12">
						<div class="callout callout-info">
							<h5 style="text-align: center;" id="analysisTitle">
								${command.sectionType} 월별 전력소비량 분석</h5>
						</div>
					</div>
				</div>
				<br>
				<div class="wrapper">
					<div class="row">
						<div class="col-md-8">
							<div style="position: relative; height: 200px; width: 100%;">
								<canvas id="barChart" width="100%" height="50%"></canvas>
								<br> <br>
								<div class="col-12">


									<div class="d-flex justify-content-between mb-4">
										<div class="callout callout-info col-md-6">
											<h4 style="text-align: center; font-size: 18px;">
												가장 많은 전력을 소비한 달: 
												<c:set var="maxConsumeMonth" value="" />
												<c:set var="maxConsumeValue" value="0" />
												<c:forEach items="${consumemonth}" var="currentMonth"
													varStatus="loop">
													<c:if test="${currentMonth.totalEnergy > maxConsumeValue}">
														<c:set var="maxConsumeValue"
															value="${currentMonth.totalEnergy}" />
														<c:set var="maxConsumeMonth"
															value="${currentMonth.year}년 ${currentMonth.month}월" />
													</c:if>
												</c:forEach>

												<!-- Display the result -->
												${maxConsumeMonth}
											</h4>
											<h4 style="text-align: center; font-size: 18px;">
												가장 적은 전력을 소비한 달:
												<c:set var="minConsumeMonth" value="" />
												<c:set var="minConsumeValue" value="${maxConsumeValue + 1}" />
												<c:forEach items="${consumemonth}" var="currentMonth"
													varStatus="loop">
													<c:if test="${currentMonth.totalEnergy < minConsumeValue}">
														<c:set var="minConsumeValue"
															value="${currentMonth.totalEnergy}" />
														<c:set var="minConsumeMonth"
															value="${currentMonth.year}년 ${currentMonth.month}월" />
													</c:if>
												</c:forEach>

												<!-- Display the result -->
												${minConsumeMonth}
											</h4>
											<h4 style="text-align: center; font-size: 18px;">
												전력 소비 증가율이 가장 높은 달:
												<c:set var="maxIncreaseMonth" value="" />
												<c:set var="maxIncreaseValue" value="0" />
												<c:forEach items="${consumemonth}" var="currentMonth"
													varStatus="loop">
													<c:if test="${loop.index > 0}">
														<c:set var="previousMonth"
															value="${consumemonth[loop.index - 1]}" />
														<c:set var="difference"
															value="${currentMonth.totalEnergy - previousMonth.totalEnergy}" />
														<c:set var="percentageChange"
															value="${previousMonth.totalEnergy != 0 ? (difference / previousMonth.totalEnergy) * 100 : 0}" />
														<c:if test="${percentageChange > maxIncreaseValue}">
															<c:set var="maxIncreaseValue" value="${percentageChange}" />
															<c:set var="maxIncreaseMonth"
																value="${currentMonth.year}년 ${currentMonth.month}월" />
														</c:if>
													</c:if>
												</c:forEach>
												<!-- Display the result -->
												${maxIncreaseMonth}
											</h4>
											<h4 style="text-align: center; font-size: 18px;">
												전력 소비 감소율이 가장 높은 달:
												<c:set var="maxDecreaseMonth" value="" />
												<c:set var="maxDecreaseValue" value="0" />
												<c:forEach items="${consumemonth}" var="currentMonth"
													varStatus="loop">
													<c:if test="${loop.index > 0}">
														<c:set var="previousMonth"
															value="${consumemonth[loop.index - 1]}" />
														<c:set var="difference"
															value="${currentMonth.totalEnergy - previousMonth.totalEnergy}" />
														<c:set var="percentageChange"
															value="${previousMonth.totalEnergy != 0 ? (difference / previousMonth.totalEnergy) * 100 : 0}" />
														<c:if test="${percentageChange < maxDecreaseValue}">
															<c:set var="maxDecreaseValue" value="${percentageChange}" />
															<c:set var="maxDecreaseMonth"
																value="${currentMonth.year}년 ${currentMonth.month}월" />
														</c:if>
													</c:if>
												</c:forEach>

												<!-- Display the result -->
												${maxDecreaseMonth}
											</h4>
										</div>
										<div class="col-md-6 text-right">
											<table id="example1"
												class="table table-bordered table-striped dataTable dtr-inline">
												<tr>
													<th class="sorting text-center" tabindex="0"
														aria-controls="example1" rowspan="1" colspan="1"
														aria-label="Rendering engine: activate to sort column ascending">월
														평균 전력소비량</th>
													<th class="sorting text-center" tabindex="0"
														aria-controls="example1" rowspan="1" colspan="1"
														aria-label="Browser: activate to sort column ascending">누적
														전력소비량(kWh)</th>
												</tr>
												<tbody>
													<c:if test="${not empty consumemonth}">
														<c:set var="totalConsumption" value="0" />
														<c:forEach items="${consumemonth}" var="month">
															<c:set var="totalConsumption"
																value="${totalConsumption + month.totalEnergy}" />
														</c:forEach>
														<c:if test="${fn:length(consumemonth) > 0}">
															<c:set var="averageConsumption"
																value="${totalConsumption / fn:length(consumemonth)}" />
														</c:if>
													</c:if>

													<!-- 평균 전력소비량을 정수로 변환 -->
													<c:set var="averageConsumption"
														value="${fn:substringBefore(averageConsumption, '.')}" />

													<tr class="odd">
														<td class="text-center">${averageConsumption}kWh</td>
														<td class="text-center">${totalConsumption}kWh</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4" id="analysisMonthTable">
							<table id="example1"
								class="table table-bordered table-striped dataTable dtr-inline"
								aria-describedby="example1_info">
								<thead>
									<tr>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="날짜: activate to sort column ascending">날짜</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="전력 소비량(kWh): activate to sort column ascending">전력
											소비량(kWh)</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="편차: activate to sort column ascending">편차</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="증감률: activate to sort column ascending">증감률</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${consumemonth}" var="currentMonth"
										varStatus="loop">
										<tr class="odd">
											<td class="text-center">${currentMonth.year}년
												${currentMonth.month}월</td>
											<td class="text-center">${currentMonth.totalEnergy}kWh</td>
											<c:if test="${loop.index > 0}">
												<c:set var="previousMonth"
													value="${consumemonth[loop.index - 1]}" />
												<c:set var="difference"
													value="${currentMonth.totalEnergy - previousMonth.totalEnergy}" />
												<c:set var="percentageChange"
													value="${previousMonth.totalEnergy != 0 ? (difference / previousMonth.totalEnergy) * 100 : 0}" />
												<td class="text-center"><fmt:formatNumber type="number"
														maxFractionDigits="1" value="${difference}" />kWh</td>
												<td class="text-center"><fmt:formatNumber type="number"
														maxFractionDigits="1" value="${percentageChange}" />%</td>
											</c:if>
											<c:if test="${loop.index == 0}">
												<td class="text-center">0kWh</td>
												<td class="text-center">0.0%</td>
											</c:if>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<%@ include
								file="/WEB-INF/views/energyconsume/month_analysis_pagination.jsp"%>
						</div>
					</div>
				</div>
				<br> <br> <br> <br>
				<div class="wrapper"></div>
			</div>

		</section>
	</div>

	<jsp:include page="/WEB-INF/views/module/footer_js.jsp" />
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
	<!-- download -->
	<script src="<%=request.getContextPath() %>/resources/js/html2canvas.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/jspdf.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
	<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>

	<script>
    // 그래프를 그릴 canvas 요소 가져오기
    var ctx = document.getElementById('barChart').getContext('2d');

    // 바차트 데이터 생성
    var data = {
        labels: [], // 레이블을 빈 배열로 초기화
        datasets: [{
            label: '전력소비량(kWh)',
            data: [], // 전력소비량 데이터를 빈 배열로 초기화
            backgroundColor: 'rgb(75, 192, 192)',
            borderWidth: 2
        }]
    };

 // JSP 변수 consumeList의 데이터를 그래프 데이터에 추가
    <c:forEach items="${dataMap.consumemonth}" var="consumemonth">
        data.labels.push("${consumemonth.year}-${consumemonth.month}");
        data.datasets[0].data.push(${consumemonth.totalEnergy});
    </c:forEach>



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

    // 바차트 생성
    var barChart = new Chart(ctx, {
        type: 'bar',
        data: data,
        options: options
    });
    </script>
	<!-- datetimepicker -->
	<script>
    $(document).ready(function () {
        initializeDateTimePicker();
        $('#sectionType, #timeRange').on('change', function () {
        	updateAnalysisTitle();
            initializeDateTimePicker();
        });

        function initializeDateTimePicker() {
            var sectionType = $('#sectionType').val();
            var timeRange = $('#timeRange').val();
            if (sectionType === '' || timeRange === '') {
                $('#fromDate, #toDate');
            } else {
                $('#fromDate, #toDate');
            }

            if (timeRange === 'analysis.do') {
                $('.datetimepicker').datetimepicker({
                    format: 'Y-m-d',
                    timepicker: false,
                });
            } else if (timeRange === 'analysisyear.do') {
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
//         function updateAnalysisTitle() {
//             var selectedSection = $('#sectionType').val(); // 선택한 섹션 가져오기
//             var title = selectedSection + " 월별 전력소비량 분석";

//             if (selectedSection) {
//                 // 만약 섹션을 선택한 경우, 제목을 업데이트
//                 title = selectedSection + " 월별 전력소비량 분석";
//             }

//             $('#analysisTitle').text(title); // 제목을 업데이트
//         }
});
    </script>
    <!-- csv -->
<script>
   function csvDown() {
      const table = document.getElementById("analysisMonthTable"); // 테이블 설정
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
       link.setAttribute("download", "analysisMonth.csv"); // alarmLog.csv 다운로드하는 링크
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
    var table = document.getElementById("analysisMonthTable");
    
    if(table){
        // CASE 대상 테이블이 존재하는 경우
        
        // 엑셀다운 (엑셀파일명, 시트명, 내부데이터HTML)
        _excelDown("analysisMonth.xls", "analysisMonth", table.outerHTML)
    }
}
</script>


</body>
</html>