<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<!-- board style by oceanny -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/style/board.css">
</head>
<style>
.checkbox {
	width: 20px;
	height: 20px;
}

.explanation {
	background: #f0f0f0;
	text-align: center;
}
</style>
<section class="content">
	<div class="card">
		<div class="card-body">
			<div class="row mb-1">
				<div class="col-sm-6">
					<button class="btn btn-block btn-dark" type="button" onclick="OpenWindow('form.do','고장사항 문의메일 보내기',600,750);" style="height:40px; width:210px;">
						고장사항 문의메일 보내기
					</button>
				</div>
				<div class="col-sm-6" style="text-align: right;">
					<button class="btn btn-primary" type="button" onclick="submit_go('modifyFormgear.do','${check.checkNum}');" style="height:40px">
						점검표 수정하기
					</button>
					<button class="btn btn-warning" type="button" onclick="CloseWindow();" style="height:40px">
						창닫기
					</button>
					<button class="btn btn-danger" type="button" onclick="submit_go('removegear.do','${check.checkNum}');" style="height:40px">
						점검표 삭제하기
					</button>
				</div>
			</div>
			<div class="row mb-2">
				<div class="col-sm-12">
					<div class="form-group">
						<div class="row mb-2">
							<div style= "height:32px; width:83px; margin-left:8px; margin-top:1px;">
								<label for="adminId" style="font-size:22px;">점검자 : </label>
							</div>
							<div style= "height:32px; width:180px;">
								<input style= "height:32px; width:180px;" type="text" id="adminId" readonly name="adminId" class="form-control" value="${check.adminId}">
							</div>
							<div style= "height:32px; width:150px; margin-left:8px; margin-top:1px;">
								<label for="checkDate" style="font-size:22px;">최초점검날짜 : </label>
							</div>
							<div style= "height:32px; width:180px;">
								<input style= "height:32px; width:180px;" type="text" id="checkDate" readonly name="checkDate" class="form-control" value="<fmt:formatDate value="${check.checkDate}" pattern="yyyy-MM-dd" />">
							</div>
							<div style= "height:32px; width:150px; margin-left:8px; margin-top:1px;">
								<label for="checkUpdateDate" style="font-size:22px;">최근점검날짜 : </label>
							</div>
							<div style= "height:32px; width:180px;">
								<input style= "height:32px; width:180px;" type="text" id="checkUpdateDate" readonly name="checkUpdateDate" class="form-control" value="<fmt:formatDate value="${check.checkUpdateDate}" pattern="yyyy-MM-dd" />">
							</div>
							<div style= "height:32px; width:83px; margin-left:8px; margin-top:1px;">
								<label for="checkCnt" style="font-size:22px;">조회수 : </label>
							</div>
							<div style= "height:32px; width:180px;">
								<input style= "height:32px; width:180px;" type="text" id="checkCnt" readonly name="checkCnt" class="form-control" value="${check.checkCnt}">
							</div>
						</div>
					</div>
					<div class="form-group">
						<table class="table table-bordered text-center">
							<tr style="font-size: 0.95em;">
								<th class="explanation" style="width:300px">업무 구분</th>
								<c:forEach var="index" items="a,b,c,d,e,f,g,h,i,j">
									<th class="explanation">${index} 구역</th>									
								</c:forEach>
							</tr>
								<c:set var="dist" value="전원 상태 확인, 제어 패널 상태 확인, 작동 모드 확인, 온도 설정 및 조절 확인, 습도 설정 및 조절 확인, 입력 및 흐름 확인, 필터 상태 확인 및 교체 확인, 부품 상태 점검 확인, 유지 보수 계획 확인, 알람 및 경고 확인"/>
								<c:forEach var="title" items="${dist}" varStatus="status" >
							<tr>
								<th class="explanation">${title}</th>
								<c:forEach var="index" items="a,b,c,d,e,f,g,h,i,j">
									<c:set var="combinedIndex" value="${index}${status.index}" />
									<td>
										<input class="checkbox" type="checkbox" ${check.checkBox.contains(combinedIndex) ? 'checked':'' } name="item_${index}" value="${index}${status.index}"disabled="disabled"/>
									</td>									
								</c:forEach>
							</tr>
								</c:forEach>
						</table>
					</div>
					<div class="form-group">
						<div class="card card-outline card-success">
							<div class="card-header">
								<h3>사진파일</h3>
							</div>
							<div class="card-footer">
								<div class="row">
									<!-- attaches -->
									<c:forEach items="${check.attachList}" var="attach">
										<div class="col-md-4 col-sm-4 col-xs-12" style="cursor: pointer;" onclick="location.href='<%=request.getContextPath()%>/check/getFile.do?attachNum=${attach.attachNum}';">
											<div class="info-box">
												<span class="info-box-icon bg-yellow">
													<i class="fa fa-copy"></i>
												</span>
												<div class="info-box-content">
													<span class="info-box-text"> 
														<fmt:formatDate value="${attach.attachDate}" pattern="yyyy-MM-dd" />
													</span> 
													<span class="info-box-number">${attach.attachFileName}</span>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="card-footer">	
	</div>
</section>
<%@ include file="/WEB-INF/views/module/footer_js.jsp"%>
<script>
function submit_go(url, checkNum) {
	if (url == "modifyFormgear.do" && !confirm("점검표를 수정하시겠습니까?")) {
		return;
	}
	if (url == "removegear.do" && !confirm("정말로 삭제하시겠습니까?")) {
		return;
	}
	location.href = url + "?checkNum=" + checkNum;
}
</script>