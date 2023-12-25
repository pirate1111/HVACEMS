<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>

<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
										<div class="col-2">
											<button type="button" class="btn bg-gradient-success" style="width:74px;">PDF</button>
											<button type="button" class="btn bg-gradient-success" style="margin-left: 5px; width:74px;">인쇄</button>
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
											<select class="form-control" style="width:90px;">
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
											<button type="button" class="btn bg-gradient-success btn-float-right" style="margin-left: 5px; width:74px;">조회</button>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-12">
											<table id="example1" class="table table-bordered table-striped dataTable dtr-inline" aria-describedby="example1_info">
												<thead>
													<tr>
														<th tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">전력번호</th>
														<th tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">전력날짜</th>
														<th tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">전력(kWh)</th>
													</tr>
												</thead>
												<tbody>
												<tr class="odd">
													<td class="dtr-control sorting_1" tabindex="0">30</td>
													<td>2023.10.10.</td>
													<td>1380</td>
												</tr>
												<tr class="even">
													<td class="dtr-control sorting_1" tabindex="0">29</td>
													<td>2023.10.09.</td>
													<td>1056</td>
												</tr>
												<tr class="odd">
													<td class="dtr-control sorting_1" tabindex="0">28</td>
													<td>2023.10.08.</td>
													<td>1229</td>
												</tr>
												<tr class="even">
													<td class="dtr-control sorting_1" tabindex="0">27</td>
													<td>2023.10.07.</td>
													<td>1271</td>
												</tr>
												<tr class="odd">
													<td class="sorting_1 dtr-control">26</td>
													<td>2023.10.06.</td>
													<td>1236</td>
												</tr>
												<tr class="even">
													<td class="sorting_1 dtr-control">25</td>
													<td>2023.10.05.</td>
													<td>1604</td>
												</tr>
												<tr class="odd">
													<td class="sorting_1 dtr-control">24</td>
													<td>2023.10.04.</td>
													<td>1393</td>
												</tr>
													<tr class="even">
													<td class="sorting_1 dtr-control">23</td>
													<td>2023.10.03.</td>
													<td>1371</td>
												</tr>
												<tr class="odd">
													<td class="sorting_1 dtr-control">22</td>
													<td>2023.10.02.</td>
													<td>1032</td>
												</tr>
												<tr class="even">
													<td class="sorting_1 dtr-control">21</td>
													<td>2023.10.01.</td>
													<td>1446</td>
												</tr>
												<tr class="even">
													<td class="sorting_1 dtr-control">20</td>
													<td>2023.09.30.</td>
													<td>1280</td>
												</tr>
												<tr class="even">
													<td class="sorting_1 dtr-control">19</td>
													<td>2023.10.29.</td>
													<td>1000</td>
												</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="card-footer">
								<%@ include file="/WEB-INF/views/module/pagination.jsp" %>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 	
<script>
window.onload=function(){
    getPage("<%=request.getContextPath()%>/cleandata/temp.do");
 }
</script>
<script>
  $(function(){
    $('.datepicker').datepicker();
  })
</script>