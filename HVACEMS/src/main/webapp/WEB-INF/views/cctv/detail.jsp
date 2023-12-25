<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-4" style="display: flex; align-items: center;">
					<a href="<%=request.getContextPath()%>/monitor/cctv.do"
						class="small-box-footer"><i class="fas fa-angle-double-left fa-2x" style="color: #005B41;"></i></a>
					&nbsp;&nbsp;
					<h1>CCTV</h1>
				</div>
				<div class="col-sm-4" style="text-align: center;"><h3 style="margin: 0; padding-top: 5px;">${cctv }구역</h3></div>
				<div class="col-sm-2"></div>
				<div class="col-sm-2">
					<select class="form-control custom-select"
						onchange="if(this.value) location.href=(this.value);">
						<option>구역선택</option>
						<option value="<%=request.getContextPath()%>/monitor/cctv/detail.do?cctv=A">A구역</option>
						<option value="<%=request.getContextPath()%>/monitor/cctv/detail.do?cctv=B">B구역</option>
						<option value="<%=request.getContextPath()%>/monitor/cctv/detail.do?cctv=C">C구역</option>
						<option value="<%=request.getContextPath()%>/monitor/cctv/detail.do?cctv=D">D구역</option>
						<option value="<%=request.getContextPath()%>/monitor/cctv/detail.do?cctv=E">E구역</option>
						<option value="<%=request.getContextPath()%>/monitor/cctv/detail.do?cctv=F">F구역</option>
						<option value="<%=request.getContextPath()%>/monitor/cctv/detail.do?cctv=G">G구역</option>
						<option value="<%=request.getContextPath()%>/monitor/cctv/detail.do?cctv=H">H구역</option>
						<option value="<%=request.getContextPath()%>/monitor/cctv/detail.do?cctv=I">I구역</option>
						<option value="<%=request.getContextPath()%>/monitor/cctv/detail.do?cctv=J">J구역</option>
					</select>
				</div>
			</div>
		</div>
	</section>

	<section class="content">
		<div class="card-body"
			style="display: flex; flex-direction: column; align-items: center;">
			<div class="row">
				<video id="webcam" controls autoplay width="950px">
				</video>
			</div>
		</div>
	</section>

	<script>
        // 웹캠을 가져와 비디오 요소에 출력
        navigator.mediaDevices.getUserMedia({ video: true })
            .then(function (stream) {
                var video = document.getElementById('webcam');
                video.srcObject = stream;
            })
            .catch(function (error) {
                console.log('웹캠을 가져올 수 없음: ' + error);
            });
    </script>

</body>
</html>