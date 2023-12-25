<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>

<c:set var="lastYear" value="${dataMap }"/>
<c:set var="costChange" value="${dataMap1 }"/>

<head>
	<!-- datetimepicker -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/datetimepicker/jquery.datetimepicker.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Ekko Lightbox -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/ekko-lightbox/ekko-lightbox.css">


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
				<div class="card card-info">
					<div class="card-header">
						<h3 class="card-title" id="today"> </h3>
					</div>
					<div class="card-body">
						<div class="card-body p-0">
							<table class="table">
								<thead>
									<tr>
										<th style="font-size:18px">기준단가(${costChange.baseFee}원)</th>
										<th class="text-right" style="font-size:17px">당월 합계</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="font-size:18px">전기요금</td>
									<c:choose>
										<c:when test="${todayCost == 0 }">
												<td class="text-right" style="font-size:17px">0원</td>
										</c:when>
							        		<c:otherwise>
												<td class="text-right" style="font-size:17px"><fmt:formatNumber value="${todayCost }" pattern="#,###"/>원</td>
											</c:otherwise>
									</c:choose>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br/><br/>
				<div class="card card-yellow">
					<div class="card-header">
						<h3 class="card-title" id="todayCo2"> </h3>
					</div>
					<div class="card-body">
						<table class="table">
							<thead>
								<tr>
									<th style="font-size:18px">구분</th>
									<th class="text-right" style="font-size:17px">당월 합계</th>
								</tr>
							</thead>
						
							<tbody>
								<tr>
									<td style="font-size:18px">탄소배출량</td>
									<td class="text-right" style="font-size:17px">${todayCo2}&nbsp;(tCO2/MWh)</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<br/><br/>
				<div class="card card-teal">
					<div class="card-header">
						<h3 class="card-title">작년 결산</h3>
					</div>
					<div class="card-body">
						<table class="table">
							<thead>
								<tr>
									<th style="font-size:17px">총 에너지 지출 비용</th>
									<th class="text-right" style="font-size:17px">탄소배출권 수익</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<c:choose>
									<c:when test="${lastYear.lastYear == 0 }">
										<td class="text-left" style="font-size:17px">0원</td>
									</c:when>
							        <c:otherwise>
										<td class="text-left" style="font-size:17px"><fmt:formatNumber value="-${lastYear.lastYear }" pattern="#,###"/>원</td>
										<td class="text-right" style="font-size:17px"><fmt:formatNumber value="+${co2Payoff }" pattern="#,###"/>원</td>
									</c:otherwise>
									</c:choose>
								</tr>
							</tbody>
							
						</table>

					</div>
				</div>
			</div>
			<div class="col-md-6">
			<br/><br/>
				<div class="row">
					<div class="col-lg-6 col-12">
						<div class="small-box bg-secondary">
							<div class="inner">
								<h3 class="text-center"><fmt:formatNumber value="${costChange.contractedPower }" pattern="#,###"/><sup style="font-size: 20px">원</sup></h3>
								<p class="text-center">계약 전력</p>
							</div>
								<div class="icon">
									<i class="ion ion-stats-bars"></i>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-12">
							<div class="small-box bg-secondary">
								<div class="inner">
									<h3 class="text-center"><fmt:formatNumber value="${costChange.baseFee }" pattern="#,###"/><sup style="font-size: 20px">원</sup></h3>
									<p class="text-center">기본 요금</p>
								</div>
							<div class="icon">
								<i class="ion ion-stats-bars"></i>
							</div>
						</div>
					</div>
				</div>
				<br/><br/>				
				<div class="card card-success">
					<div class="card-header" style="height:46.11px;">
						<i class="fas fa-wrench"></i><label>&nbsp;&nbsp;단가 설정</label>
					</div>
					<div class="card-body">
						<form role="form" method="post" action="modify.do" name="modifyForm">
							<div class="form-group">
								<label>기본 전기 요금</label>
								<div class="row">
									<div class="col-sm-6">
										<label for="inputEmail3" class="col-sm-6 col-form-label">계약전력</label>
										<input name="contractedPower" type="text" class="form-control" disabled style="width:95%;" value="${costChange.contractedPower }">
									</div>
									<div class="col-sm-6">
										<label for="inputEmail3" class="col-sm-6 col-form-label">기본요금</label>
										<input name="baseFee" type="text" class="form-control" disabled style="width:95%;" value="${costChange.baseFee }">
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<label for="inputEmail3" class="col-sm-6 col-form-label">부가세</label>
										<input name="tax" type="text" class="form-control" disabled style="width:95%;" value="${costChange.tax }">
									</div>
									<div class="col-sm-6">
										<label for="inputEmail3" class="col-sm-6 col-form-label">전력기금</label>
										<input name="fund" type="text" class="form-control" disabled style="width:95%;" value="${costChange.fund }">
									</div>
								</div>
							</div>
							<br/>
							<div class="form-group">
								<label>부하별 요금</label>
								<div class="row">
									<div class="col-sm-6">
										<label for="inputEmail3" class="col-sm-6 col-form-label">전력공급유형</label>
										<select class="custom-select" disabled style="width:95%;">
											<option id="industrialPower3">산업용(을)</option>
										</select>
									</div>
									<div class="col-sm-6">
										<label for="inputEmail3" class="col-sm-6 col-form-label">옵션 분류</label>
										<select class="custom-select" disabled style="width:95%;">
											<option id="highPowerC3">고압C-전력Ⅲ</option>
										</select>
									</div>
								</div>
							</div>
						</form>
						<button id="modify" class="btn btn-info btn-sm" onclick="modifyBtnHandler(self)" style="float: right;" >수 정</button>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<%@ include file="/WEB-INF/views/module/footer_js.jsp" %>


<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bootstrap-switch/js/bootstrap-switch.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- datepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="<%=request.getContextPath() %>/resources/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath() %>/resources/datetimepicker/build/jquery.datetimepicker.full.min.js"></script>

<script>
//수정-적용 버튼
var inputs = document.getElementsByClassName("form-control");

function modifyBtnHandler(self) {
	const subs = document.getElementById("modify");
	
	if(subs.innerText === '수 정') {
		subs.innerText = '적 용';
		for (var i=0; i<inputs.length; i++) {
			inputs[i].disabled = false;
		}
		
	} else {
		update();
		//document.querySelector("form[role='form']")onm.submit();
		//subs.innerText = '수 정';
		//for (var i=0; i<inputs.length; i++) {
		//	inputs[i].disabled = true;
		//}
	}
		/* for (var i=0; i<inputs.length; i++) {
			selects[i].disabled = true;
		} */
}
</script>

<script>
function update() {
	document.forms["modifyForm"].submit();
}
</script>

<script>
<!-- datetimepicker -->
$('document').ready(function(){
	$('.datetimepicker').datetimepicker({
		format:'Y-m-d',
		lang:'ko',
		step:60
	});
	$.datetimepicker.setLocale('kr');
});
</script>

<script>
function checkNumNew(obj, obj2) {
	for (var i = 0; i < obj.value.length; i++) {
		if (obj.value.charCodeAt(i) >= 48 && obj.value.charCodeAt(i) <= 57) {
		} else {
			alert("이 입력란에는 숫자만 입력 가능합니다.");
			return false;
		}
	}
}
</script>

<script>
  // Create a new Date object
  var today = new Date();

  // 현재 월과 일을 가져옴
  var monthNames = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
  var month = monthNames[today.getMonth()];
  var day = today.getDate();

  // h3 요소의 내용을 업데이트
  var dateElement = document.getElementById("today");
  dateElement.textContent = "오늘(" + month + " " + (day < 10 ? '0' : '') + day + "일"+")기준 에너지 비용";

  var dateElement = document.getElementById("todayCo2");
  dateElement.textContent = "오늘(" + month + " " + (day < 10 ? '0' : '') + day + "일"+")기준 탄소배출량";

</script>

</body>
