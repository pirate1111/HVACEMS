<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>

<head>
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
										<div class="col-2">
											<button type="button" class="btn bg-gradient-success">PDF</button>
											<button type="button" class="btn bg-gradient-success" style="margin-left: 5px">인쇄</button>
										</div>
										<div class="col-8">
											<div class="form-group">
												<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
													</div>
													<input type="text" class="form-control float-right datepicker">
												</div>
											</div>
										</div>
										<div class="col-2">
											<div class="row">
												<select class="form-control" style="width:100px;">
													<option value="all">전체</option>
													<option value="A">A구역</option>
													<option value="B">B구역</option>
													<option value="C">C구역</option>
													<option value="D">D구역</option>
													<option value="E">E구역</option>
													<option value="F">F구역</option>
													<option value="G">G구역</option>
													<option value="H">H구역</option>
													<option value="I">I구역</option>
													<option value="J">J구역</option>
												</select>
												<button type="button" class="btn bg-gradient-success" style="margin-left: 5px;">조회</button>
												<button type="button" class="btn bg-gradient-success" style="margin-left: 5px;" onclick="location.href='elecdataList.do'">리스트</button>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-12">
											<canvas id="elecDetailChart" style="width:1570px; height:700px;"></canvas>
										</div>
									</div>
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
	<script	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/flot/jquery.flot.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/flot/plugins/jquery.flot.resize.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/flot/plugins/jquery.flot.pie.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<!-- download-->
	<script	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/datatables/jquery.dataTables.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jszip/jszip.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/pdfmake/pdfmake.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/pdfmake/vfs_fonts.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/datatables-buttons/js/buttons.print.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
	<!-- datepicker -->
	<!-- datepicker -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
window.reload=function(){
    getPage("<%=request.getContextPath()%>/cleandata/temp.do");
 }
</script>
<script>
  $(function(){
    $('.datepicker').datepicker();
  })
</script>
<script>
//LINE randomly generated data
//일별 전력
const elec = document.getElementById('elecDetailChart');

new Chart(elec, {
type: 'bar',
data: {
	labels: ['1', '2', '3', '4', '5', '6','7','8','9','10','11', '12', '13', '14', '15', '16','17','18','19','20','21', '22', '23', '24', '25', '26', '27', '28', '29', '30'],
  datasets: [{
    label: '전력량(kWh)',
    data: [1050, 1060, 1053, 1300, 1207, 1193, 1000, 1058, 1456, 1233, 1745, 1593, 1020, 1892, 1462, 1036, 1071, 1690, 1000, 1280, 1446, 1032, 1371, 1393, 1604, 1236, 1271, 1229, 1056, 1380],
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
</script>
