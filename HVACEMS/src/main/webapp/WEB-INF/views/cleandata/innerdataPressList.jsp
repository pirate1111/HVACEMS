<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<c:set var="press" value="${dataMap.pressureList }"/>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="command" value="${dataMap.pageMaker.command }" />

<head>
<title>HVACEMS</title>
	<!-- datetimepicker -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/datetimepicker/jquery.datetimepicker.css" />
	<!-- donwLoad -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
</head>
<body>
	<!-- Content Wrapper. Contains page content -->
	<div class="">
		<!-- Main content -->
		<section class="content">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-3">
											<div class="dt-buttons btn-group flex-wrap ">
												<button type="button" class="btn bg-gradient-success" style="width:74px;" onclick="downloadPDF();">PDF</button>
												<button type="button" class="btn bg-gradient-success" style="width:74px;" onclick="downloadCSV();">CSV</button>
												<button type="button" class="btn bg-gradient-success" style="width:74px;" onclick="downloadXLS();">EXCEL</button>
											</div>
										</div>
										<div class="col-6">
											<div class="row">
												<div class="input-group" style="width:800px;">
													<select class="form-control" name="sectionType" id="sectionType">
														<option value="">구역선택</option>
														<option value="A00" ${command.sectionType eq 'A00' ? 'selected':'' }>전체구역</option>
														<option value="A01" ${command.sectionType eq 'A01' ? 'selected':'' }>A구역</option>
														<option value="B01" ${command.sectionType eq 'B01' ? 'selected':'' }>B구역</option>
														<option value="C01" ${command.sectionType eq 'C01' ? 'selected':'' }>C구역</option>
														<option value="D01" ${command.sectionType eq 'D01' ? 'selected':'' }>D구역</option>
														<option value="E01" ${command.sectionType eq 'E01' ? 'selected':'' }>E구역</option>
														<option value="F01" ${command.sectionType eq 'F01' ? 'selected':'' }>F구역</option>
														<option value="G01" ${command.sectionType eq 'G01' ? 'selected':'' }>G구역</option>
														<option value="H01" ${command.sectionType eq 'H01' ? 'selected':'' }>H구역</option>
														<option value="I01" ${command.sectionType eq 'I01' ? 'selected':'' }>I구역</option>
														<option value="J01" ${command.sectionType eq 'J01' ? 'selected':'' }>J구역</option>
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
										<div class="col-3" align="right">
											<button type="button" class="btn bg-gradient-success" style="margin-left: 5px; width:74px;" onclick="location.href='main.do'">메인</button>
											<button type="button" class="btn bg-gradient-success" style="margin-left: 5px; width:74px;" onclick="location.href='press.do'">그래프</button>
										</div>
									</div>
									<br/>
									
									<div class="row">
										<div class="col-12" id="pressureTable" >
											<table class="table table-bordered" >
												<thead>
													<tr>
														<th class="text-center" style="width:25%;">기압번호</th>
														<th class="text-center" style="width:25%;">기압날짜</th>
														<th class="text-center" style="width:25%;">기압(hPa)</th>
														<th class="text-center" style="width:25%;">구역</th>
													</tr>
												</thead>
												<c:if test="${empty dataMap.pressureList }">
													<tr>
														<td colspan="4" class="text-center"><strong>해당 내용이 없습니다.</strong></td>
													</tr>
												</c:if>
												<tbody>
												<c:forEach items="${dataMap.pressureList}" var="press">
													<tr>
														<td class="text-center">${press.pressureNum }</td>
														<td class="text-center"><fmt:formatDate value="${press.pressureDate }" pattern="yyyy-MM-dd HH:mm" /></td>
														<td class="text-center">${press.pressure }</td>
														<td class="text-center">
															<c:choose>
																<c:when test="${press.barometerNum eq 'A00'}">${press.barometerNum.replace('A00','전체구역') }</c:when>
																<c:otherwise>${press.barometerNum.replace('01','구역') }</c:otherwise>
															</c:choose>
														</td>
													</tr>
												</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="card-footer">
								<%@ include file="/WEB-INF/views/cleandata/presspagination.jsp" %>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<%@ include file="/WEB-INF/views/module/footer_js.jsp"%>
	
<!-- download-->
<script src="<%=request.getContextPath() %>/resources/js/html2canvas.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jspdf.min.js"></script>

<!-- datetimepicker -->
<script src="<%=request.getContextPath() %>/resources/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath() %>/resources/datetimepicker/build/jquery.datetimepicker.full.min.js"></script>
	
<!-- datetimepicker -->
<script>
$('.datetimepicker').datetimepicker({
	format:'Y-m-d H:i',
	lang:'ko',
	step:60
});
$.datetimepicker.setLocale('kr');
</script>

<!-- csv -->
<script>
   function downloadCSV() {
      const table = document.getElementById("pressureTable"); // 테이블 설정
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
       link.setAttribute("download", "pressureList.csv"); // alarmLog.csv 다운로드하는 링크
       document.body.appendChild(link);
       link.click(); // <a> 클릭해서 다운로드 시작
   }
</script>

<!-- pdf -->
<script>
function downloadPDF() { 
	
    html2canvas($('#pressureTable')[0]).then(function(canvas) { 
	
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
 
    doc.save('pressureList.pdf');
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

function downloadXLS(){
    // 대상 테이블을 가져옴
    var table = document.getElementById("pressureTable");
    
    if(table){
        // CASE 대상 테이블이 존재하는 경우
        
        // 엑셀다운 (엑셀파일명, 시트명, 내부데이터HTML)
        _excelDown("pressureList.xls", "pressureList", table.outerHTML)
    }
}
</script>
</body>