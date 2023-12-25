<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="command" value="${dataMap.pageCommand }" />

<head>
  <!-- board style by oceanny -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/style/board.css">
</head>
<body>
 <!-- Main content -->
<div class="card-body">
	<div class="row mb-2">
 			<div class="col-sm-3">
 				<button id="download" type="button" onclick="downloadCSV()" class="btn bg-gradient-success" style="margin-left: 15px">CSV</button>
 			</div>
 			<div class="col-sm-6"></div>
 			<div class="col-sm-3">
			<div class="input-group float-sm-right">
				<select class="form-control" id="areaType">
					<option value="allArea">구역선택</option>
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
				<select class="form-control" name="alarmType" id="alarmType">
					<option value="allType">알림유형</option>
					<option value="비정상작동">비정상작동</option>
					<option value="적정값이상(온도)">적정값이상(온도)</option>
					<option value="적정값이상(습도)">적정값이상(습도)</option>
					<option value="적정값이상(기압)">적정값이상(기압)</option>
					<option value="적정값이상(청정도)">적정값이상(청정도)</option>
				</select>					
				<span class="input-group-append">
					<button class="btn btn-primary" type="button" onclick="filterItems()" data-card-widget="search">
						<i class="fa fa-fw fa-search"></i>
					</button>
				</span>
			</div>
		</div>			
	</div>
	<table id="alarmLog" class="table table-bordered text-center" >					
		<tr style="font-size:0.95em;">
			<th style="width:10%;">읽음여부</th>
			<th style="width:15%;">알림번호</th>
			<th style="width:15%;">공조기구역</th>
			<th style="width:25%;">알림유형</th>
			<th style="width:25%;">알림날짜</th>
			<th style="width:10%;">표시여부</th>
		</tr>
		<c:if test="${empty dataMap.alarmList }" >
			<tr>
				<td colspan="6">
					<strong>알림 로그가 비었습니다.</strong>
				</td>
			</tr>
		</c:if>			
		<c:forEach items="${dataMap.alarmList }" var="alarm">
			<tr class="alarmContent" data-alarm-type="${alarm.breakName }" data-area-type="${alarm.hvacNum }">
				<td><c:choose>
					<c:when test="${alarm.alarmRead == 0 }">○</c:when>
					<c:otherwise>-</c:otherwise></c:choose></td>
				<td>${alarm.alarmNum }</td>
				<td>${alarm.hvacNum }</td>
				<td>${alarm.breakName }</td>
				<td><fmt:formatDate value="${alarm.alarmDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><c:choose>
					<c:when test="${alarm.alarmCheck == 1 }">○</c:when>
					<c:otherwise>-</c:otherwise></c:choose></td>
			</tr>
		</c:forEach>			
	</table>
</div>
<div class="card-footer">
<%@ include file="/WEB-INF/views/alarm/alarm_page.jsp" %>
</div>

	<script>
	function filterItems() {
		// "알림유형" 및 "구역선택" 선택 상자의 현재 선택값을 가져옵니다.
		const alarmType = document.getElementById("alarmType").value;
		const areaType = document.getElementById("areaType").value;
		
		// 아이템 목록
		const itemList = document.querySelectorAll(".alarmContent");
		
		for (const item of itemList) {
			const alarmTypeFilter = item.getAttribute("data-alarm-type");
			const areaTypeFilter = item.getAttribute("data-area-type");
			
			// 선택한 "알림유형" 및 "구역선택" 값과 일치하는 아이템만 표시합니다.
			if ((alarmType === "allType" || alarmType === alarmTypeFilter) &&
				(areaType === "allArea" || areaType === areaTypeFilter)) {
				item.style.display = "table-row";
			} else {
				item.style.display = "none";
			}
		}
	}
	</script>
	
	<script>
	function downloadCSV() {
		const table = document.getElementById("alarmLog"); // 테이블 설정
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
	    link.setAttribute("download", "alarmLog.csv"); // alarmLog.csv 다운로드하는 링크
	    document.body.appendChild(link);
	    link.click(); // <a> 클릭해서 다운로드 시작
	}

	</script>

</body>