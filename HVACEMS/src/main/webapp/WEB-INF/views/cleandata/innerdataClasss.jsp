<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<c:set var="classs" value="${dataMap.classsList }"/>
<c:set var="command" value="${dataMap.pageMaker.command }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />

<head>
	<!-- datetimepicker -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/datetimepicker/jquery.datetimepicker.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>>
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
												<button type="button" class="btn bg-gradient-success" id="pdfDown" style="width:74px;">PDF</button>
												<button type="button" class="btn bg-gradient-success" id="print" style="width:74px;">인쇄</button>
											</div>
										</div>
										<div class="col-6">
											<div class="row">
												<div class="input-group" style="width:800px;">
													<select class="form-control" name="sectionType" id="sectionType">
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
											<button type="button" class="btn bg-gradient-success" style="margin-left: 5px; width:74px;" onclick="location.href='classsList.do'">리스트</button>
										</div>
									</div>
									<div class="row">
										<div class="col-12" id="chartCanvas">
											<canvas id="classsDetailChart" style="width:100%; height:700px;"></canvas>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	<form id="jobForm">	
		<input type='hidden' name="page" value="" />
		<input type='hidden' name="sectionType" value="" />
		<input type='hidden' name="fromDate" value="" />
		<input type='hidden' name="toDate" value="" />
	</form>
		</section>
	</div>
<%@ include file="/WEB-INF/views/module/footer_js.jsp"%>

<!-- chart -->
<script	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/flot/jquery.flot.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/flot/plugins/jquery.flot.resize.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/flot/plugins/jquery.flot.pie.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- download-->
<script src="<%=request.getContextPath() %>/resources/js/html2canvas.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jspdf.min.js"></script>
<!-- datepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="<%=request.getContextPath() %>/resources/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath() %>/resources/datetimepicker/build/jquery.datetimepicker.full.min.js"></script>
	
<!-- datetimepicker -->
<script>
$('document').ready(function(){
	$('.datetimepicker').datetimepicker({
		format:'Y-m-d H:i',
		lang:'ko',
		step:60
	});
	$.datetimepicker.setLocale('kr');
});
</script>

<!-- chart js -->
<script>
//습도
$(document).ready(function(){
	getGraph();
});

function getGraph(){
	
	var sectionType =  $('#sectionType').val();
	var fromDate =  $('#fromDate').val();
	var toDate =  $('#toDate').val();
	
	let timeList = [];
	let classsList = [];
	let sdclasssList = [];
	
	var data = {
		"sectionType" : sectionType,
		"fromDate" : fromDate,
		"toDate" : toDate,
		"perPageNum" : "99999"
	}
// 	alert(JSON.stringify(data));
	
	$.ajax({
		url:"<%=request.getContextPath() %>/cleandata/classsGraph.do",
		type:"get",
		data: data,
		success:function(data){
// 			alert(data[0].JSONclass);
			for(let i = 0; i < data.length; i++){
				timeList.push(data[i].date);
				classsList.push(data[i].classs);
				sdclasssList.push(100)
			}

			new Chart(document.getElementById("classsDetailChart"), {
			    type: 'line',
			    data: {
			    	labels: timeList,	
			    	datasets: [{
						label: '적정습도(%)',
						data: sdclasssList,
						borderWidth: 1
			    	},{
						label: '습도(%)',
						data: classsList,
						borderWidth: 1
					}]
			    },
			    options: {
			    	responsive: false,
			    	scales: {
			    		y: {
			    			beginAtzero: false
			    		}
			    	}
			    }
			});
		}
	})
}
</script>

<!-- searchgo -->
<script>
function searchList_go(page,url){
	if(!url) url="classs.do";
	
	var jobFormn = document.querySelector("form#jobForm");
	jobForm.page.value = page;
	jobForm.sectionType.value = document.querySelector("select[name='sectionType']").value;
	jobForm.fromDate.value = $('#fromDate').val();
	jobForm.toDate.value = $('#toDate').val();
			
	jobForm.action=url;
	jobForm.submit();
}
</script>
<!-- pdf -->
<script>
$('#pdfDown').click(function() { 
	
    html2canvas($('#chartCanvas')[0]).then(function(canvas) { 
	
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
 
    doc.save('classsChart.pdf');
	});
});
</script>
<!-- print -->
<script>
$('#print').click(function() { 
html2canvas(document.getElementById("chartCanvas")).then(function(canvas) {
	 //document.body.appendChild(canvas)
	var dataUrl = canvas.toDataURL(); //atclasst to save base64 string to server using this var
    var windowContent = '<!DOCTYPE html>';
    windowContent += '<html>';
    windowContent += '<head>';
    windowContent += '<style> @media print {img {width: 100%; height: 100%;}}</style>' ;
    windowContent +=  '<title>Print canvas</title>';
    windowContent +=  '</head>';
    windowContent += '<body>'
    windowContent += '<img src="' + dataUrl + '">';
    windowContent += '</body>';
    windowContent += '</html>';
    var printWin = window.open('','','width=1000,height=1000');
    printWin.document.open();
    printWin.document.write(windowContent);
    printWin.document.close();

	//셋타임아웃을 주는 이유는 css가 먹히라고
    setTimeout(function(){
    printWin.focus();
    printWin.print();
    printWin.close();},10);
	});
});
</script>
