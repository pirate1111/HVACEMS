<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
				</div>
				<div class="col-sm-6" style="text-align: right;">
					<button class="btn btn-primary" type="button" onclick="submit_go('registFormgear.do', '${check.checkNum}');" style="height:40px">
						점검표 등록
					</button>
					<button class="btn btn-warning" type="button" onclick="CloseWindow();" style="height:40px">
						취 소
					</button>
				</div>
			</div>
			<div class="row mb-2">
				<div class="col-sm-12">
					<form enctype="multipart/form-data" role="form" method="post" action="registgear.do" name="registFormgear">
						<div class="form-group" style= "position:absolute; left:-9999px; top:-9999px;">
							<div class="row mb-2">
								<div class="form-group">
									<div style= "height:32px; width:83px; margin-left:8px; margin-top:1px;">
										<label for="adminId" style="font-size:22px;">점검자 : </label>
									</div>
									<div style= "height:32px; width:180px;">
										<input style= "height:32px; width:180px;" type="text" id="adminId" readonly name="writer" class="form-control" value="${loginUser}">
									</div>
									<div class="form-group">
										<input type="hidden" name="checkcheckNum" value="2"/>
									</div>
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
											<input class="checkbox" type="checkbox" name="item_${index}" value="${index}${status.index}"/>
										</td>									
									</c:forEach>
								</tr>
									</c:forEach>
							</table>
						</div>
						<div class="form-group">
							<div class="card card-outline card-success">
								<div class="card-header">
										<h3 style="display: inline; line-height: 40px;">사진첨부 :</h3>
										&nbsp;&nbsp;
										<button class="btn btn-primary" onclick="addFile_go()"
											type="button" id="addFileBtn">사진 추가</button>
									</div>
									<div class="card-footer fileInput">
										<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
											<!-- 첨부파일 썸네일 -->
											<c:forEach items="${check.attachList}" var="attach">
												<li class="attach-item thumb${attach.attachNum}" file-name="${attach.attachFileName}" target-ano="${attach.attachNum}">
													<div class="mailbox-attachment-info ">
														<a class="mailbox-attachment-name" name="attachedFile" href="<%=request.getContextPath()%>/check/getFile.do?attachNum=${attach.attachNum}">
															<i class="fas fa-paperclip">
															</i> ${attach.attachFileName}&nbsp;&nbsp;
															<button type="button" onclick="removeFile_go('thumb${attach.attachNum}');return false;" style="border: 0; outline: 0;" class="badge bg-red">
															X
															</button>
														</a>
													</div>
												</li>
											</c:forEach>
										</ul>
									<br/>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="card-footer">	
	</div>
</section>
<%@ include file="/WEB-INF/views/module/footer_js.jsp"%>
<script>
var dataNum = 0;
function addFile_go(){
	if($('input[name="uploadFile"]').length >=5){
	alert("사진 추가는 5개까지만 가능합니다.");
	return;
	}
    var div=$('<div>').addClass("inputRow").attr("data-no",dataNum);      
    var input=$('<input>').attr({"type":"file","name":"uploadFile","onchange":"fileChange_go("+dataNum+");"}).css("display","inline");
    div.append(input).append("<button onclick='remove_go("+dataNum+");' style='border:0;outline:0;' class='badge bg-red' type='button'>X</button>");
    $('.fileInput').append(div);
      
    dataNum++;   
}

function fileChange_go(dataNum){
    let input = $('div[data-no="'+dataNum+'"] input[type="file"]')[0];
    let file = input.files[0];
    if(file.name.substring(file.name.lastIndexOf(".")+1).toUpperCase() != "JPG"){
        alert("JPG 이미지형식만 가능합니다.");
        input.value="";
     }
	if(file.size > 1024*1024*1){
		alert("사진크기는 1MB 이하만 가능합니다.");
    	input.value="";
	}
}

function remove_go(dataNum){
	$('div[data-no="'+dataNum+'"]').remove();
}

function removeFile_go(className){
	var li = $('li.'+className);
	if(!confirm(li.attr("file-name")+"을 정말 삭제하시겠습니까?")){
		return;
	}
	li.remove();
	var input=$('<input>').attr({"type":"hidden", "name":"deleteFile", "value":li.attr("target-ano")});
	$('form[role="form"]').prepend(input);
}

function submit_go(url, checkNum) {
	if (url == "registFormgear.do" && !confirm("점검표 작성을 마치시겠습니까?")) {
		return;
	}
	let form = $("form[role='form']");	
	form.submit();
}
</script>