<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="checkList" value="${dataMap.checkList}"/>
<c:set var="pageMaker" value="${dataMap.pageMaker}"/>
<c:set var="command" value="${dataMap.pageMaker.command}"/>

<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/style/board.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/datetimepicker/jquery.datetimepicker.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<style>
</style>

<section class="content">
	<div class="card">
		<div class="card-header">
			<div id="keyword" class="card-tools" style="width: 830px;">
				<div class="input-group row" id="teg">
					<select class="form-control" name="perPageNum" id="perPageNum" style="width:90px;" onchange="searchList_go(1);">
						<option value="20" ${command.perPageNum == 20 ? 'selected':''}>양쪽 10개씩 출력</option>
						<option value="40" ${command.perPageNum == 40 ? 'selected':''}>양쪽 20개씩 출력</option>
						<option value="60" ${command.perPageNum == 60 ? 'selected':''}>양쪽 30개씩 출력</option>
						<option value="80" ${command.perPageNum == 80 ? 'selected':''}>양쪽 40개씩 출력</option>
						<option value="100" ${command.perPageNum == 100 ? 'selected':''}>양쪽 50개씩 출력</option>
					</select>
					<select class="form-control" name="searchType" id="searchType" style="width: 70px;">
						<option>전체날짜검색</option>
						<option value="c" ${command.searchType eq 'c' ? 'selected':''}>점검날짜</option>
						<option value="u" ${command.searchType eq 'u' ? 'selected':''}>수정날짜</option>
					</select>
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
					</div>
					<input class="form-control datetimepicker" style="width:120px" type="text" id="startTargetDate" name="startTargetDate"value="<fmt:formatDate value="${checkCommand.startTargetDate}" pattern="yyyy-MM-dd" />" placeholder="시작날짜를 선택하세요." />
					<div class="input-group-prepend">
						<span class="input-group-text">~</span>
					</div>
					<input class="form-control datetimepicker" style="width:120px" type="text" id="endTargetDate" name="endTargetDate"value="<fmt:formatDate value="${checkCommand.endTargetDate}" pattern="yyyy-MM-dd" />" placeholder="종료날짜를 선택하세요." />
					<span class="input-group-append">
					<button class="btn btn-block btn-dark" type="button" onclick="searchList_go(1);" data-card-widget="search">
						<i class="fa fa-fw fa-search"></i>
					</button>
					</span>
				</div>
			</div>
		</div>
		<div class="card-body">
			<div class="row mb-2">
				<div class="col-sm-6" style="padding:5px">
					<button style="margin-bottom:10px; width:220px;" type="button" class="btn btn-block btn-dark" id="registBtnnatural" onclick="OpenWindow('registFormnatural.do','환경 관리 점검 기록표 작성',1400,690);">
						환경 관리 점검 기록표 작성
					</button>
					<table class="table table-bordered text-center">
					    <tr style="font-size: 0.95em;">
					        <th style="width: 12%;">점검번호</th>
					        <th style="width: 10%;">점검자</th>
					        <th style="width: 18%;">점검날짜</th>
					        <th style="width: 18%;">수정날짜</th>
					        <th style="width: 20%;">점검유형</th>
					        <th style="width: 10%;">조회수</th>
					    </tr>
					    <c:choose>
					        <c:when test="${empty checkList}">
					            <tr>
					                <td colspan="6">
					                    <strong>
					                        해당 내용이 없습니다.
					                    </strong>
					                </td>
					            </tr>
					        </c:when>
					        <c:otherwise>
					            <c:forEach items="${checkList}" var="check">
					                <c:if test="${check.checkClass eq '환경 관리 점검 기록표'}">
					                    <tr style='font-size: 0.85em; cursor: pointer;' onclick="javascript:OpenWindow('detailnatural.do?from=list&checkNum='+${check.checkNum},'환경 관리 점검 기록표 상세보기',1400,790);">
					                        <td>${check.checkNum}</td>
					                        <td>${check.adminId}</td>
					                        <td><fmt:formatDate value="${check.checkDate}" pattern="yyyy-MM-dd"/></td>
					                        <td><fmt:formatDate value="${check.checkUpdateDate}" pattern="yyyy-MM-dd"/></td>
					                        <td>${check.checkClass}</td>
					                        <td>${check.checkCnt}</td>
					                    </tr>
					                </c:if>
					            </c:forEach>
					        </c:otherwise>
					    </c:choose>
					</table>
				</div>
				<div class="col-sm-6" style="padding:5px">
					<button style="margin-bottom:10px; width:220px;" type="button" class="btn btn-block btn-dark" id="registFormgear" onclick="OpenWindow('registFormgear.do','장비 관리 점검 기록표 작성',1400,790);">
						장비 관리 점검 기록표 작성
					</button>
					<table class="table table-bordered text-center">
					    <tr style="font-size: 0.95em;">
					        <th style="width: 12%;">점검번호</th>
					        <th style="width: 10%;">점검자</th>
					        <th style="width: 18%;">점검날짜</th>
					        <th style="width: 18%;">수정날짜</th>
					        <th style="width: 20%;">점검유형</th>
					        <th style="width: 10%;">조회수</th>
					    </tr>
					    <c:choose>
					        <c:when test="${empty checkList}">
					            <tr>
					                <td colspan="6">
					                    <strong>
					                        해당 내용이 없습니다.
					                    </strong>
					                </td>
					            </tr>
					        </c:when>
					        <c:otherwise>
					            <c:forEach items="${checkList}" var="check">
					                <c:if test="${check.checkClass eq '장비 관리 점검 기록표'}">
					                    <tr style='font-size: 0.85em; cursor: pointer;' onclick="javascript:OpenWindow('detailgear.do?from=list&checkNum='+${check.checkNum},'장비 관리 점검 기록표 상세보기',1400,890);">
					                        <td>${check.checkNum}</td>
					                        <td>${check.adminId}</td>
					                        <td><fmt:formatDate value="${check.checkDate}" pattern="yyyy-MM-dd"/></td>
					                        <td><fmt:formatDate value="${check.checkUpdateDate}" pattern="yyyy-MM-dd"/></td>
					                        <td>${check.checkClass}</td>
					                        <td>${check.checkCnt}</td>
					                    </tr>
					                </c:if>
					            </c:forEach>
					        </c:otherwise>
					    </c:choose>
					</table>
				</div>
			</div>
		</div>
		<div class="card-footer">
			<div style="display:${!empty checkList ? 'visible':'none' };">
				<form id="jobForm">
					<input type='hidden' name="page" value="" /> 
					<input type='hidden' name="perPageNum" value="" /> 
					<input type='hidden' name="searchType" value="" /> 
					<input type='hidden' name="startTargetDate" value="" />
					<input type='hidden' name="endTargetDate" value="" />
				</form>
					<nav aria-label="Navigation">
						<ul class="pagination justify-content-center m-0">
							<li class="page-item">
								<a class="page-link" href="javascript:searchList_go(1);"> 
									<i class="fas fa-angle-double-left"></i>
								</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="javascript:searchList_go(${pageMaker.prev ? pageMaker.startPage-1 : command.page});">
									<i class="fas fa-angle-left"></i>
								</a>
							</li>
								<c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
							<li class="page-item ${command.page == pageNum?'active':''}">
								<a class="page-link" href="javascript:searchList_go(${pageNum});">
									${pageNum} 
								</a>
							</li>
								</c:forEach>
							<li class="page-item">
								<a class="page-link" href="javascript:searchList_go(${pageMaker.next ? pageMaker.endPage+1 :command.page});">
									<i class="fas fa-angle-right"></i>
								</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="javascript:searchList_go(${pageMaker.realEndPage});"> 
									<i class="fas fa-angle-double-right"></i>
								</a>
							</li>
						</ul>
					</nav>
				<script>
				function searchList_go(page, url) {
					if (!url)
						url = "list.do";
						
					var jobFormn = document.querySelector("form#jobForm");
					jobForm.page.value = page;
					jobForm.perPageNum.value = document.querySelector("select[name='perPageNum']").value;
					jobForm.searchType.value = document.querySelector("select[name='searchType']").value;
					jobForm.startTargetDate.value = document.querySelector("input[name='startTargetDate']").value;
					jobForm.endTargetDate.value = document.querySelector("input[name='endTargetDate']").value;
					jobForm.action = url;
					jobForm.submit();
				}
				</script>
			</div>
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/module/footer_js.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="<%=request.getContextPath() %>/resources/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath() %>/resources/datetimepicker/build/jquery.datetimepicker.full.min.js"></script>
<script>
var today = new Date();
var year = today.getFullYear();
var month = ('0' + (today.getMonth() + 1)).slice(-2);
var day = ('0' + today.getDate()).slice(-2);
var fromday = ('0' + (today.getDate()-1)).slice(-2);
var fromdate =  year + '-' + month  + '-' + fromday + ' ' + ':' + '00'
var todate = year + '-' + month  + '-' + day + ' '  + ':' + '00';

$('document').ready(function(){
	$('.datetimepicker').datetimepicker({
		format:'Y-m-d',
		lang:'ko',
		step:60
	});
	$.datetimepicker.setLocale('kr');
});
</script>