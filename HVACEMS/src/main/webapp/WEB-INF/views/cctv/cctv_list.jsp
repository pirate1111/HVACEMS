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

	<section class="content">
		<div class="card-body">
			<div class="row">
				<div class="col-lg-3 col-6">
					<div class="small-box">
						<div class="inner">
							<h4>A 구역</h4>
							<video id="webcam" controls autoplay width="380px" height="285px">
							</video>
						</div>
						<a href="javascript:OpenWindow('<%=request.getContextPath() %>/monitor/cctv/detail.do?cctv=A','CCTV',1000,900);" class="small-box-footer">자세히 보기<i class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<div class="col-lg-3 col-6">
					<div class="small-box">
						<div class="inner">
							<h4>B 구역</h4>
							<video id="clone1" controls autoplay width="380px" height="285px">
							</video>
						</div>
						<a href="javascript:OpenWindow('<%=request.getContextPath() %>/monitor/cctv/detail.do?cctv=B','CCTV',1000,900);" class="small-box-footer">자세히 보기<i class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<div class="col-lg-3 col-6">
					<div class="small-box">
						<div class="inner">
							<h4>C 구역</h4>
							<video id="clone2" controls autoplay width="380px" height="285px">
							</video>
						</div>
						<a href="javascript:OpenWindow('<%=request.getContextPath() %>/monitor/cctv/detail.do?cctv=C','CCTV',1000,900);" class="small-box-footer">자세히 보기<i class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<div class="col-lg-3 col-6">
					<div class="small-box">
						<div class="inner">
							<h4>D 구역</h4>
							<video id="clone3" controls autoplay width="380px" height="285px">
							</video>
						</div>
						<a href="javascript:OpenWindow('<%=request.getContextPath() %>/monitor/cctv/detail.do?cctv=D','CCTV',1000,900);" class="small-box-footer">자세히 보기<i class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-6">
					<div class="small-box">
						<div class="inner">
							<h4>E 구역</h4>
							<video id="clone4" controls autoplay width="380px" height="285px">
							</video>
						</div>
						<a href="javascript:OpenWindow('<%=request.getContextPath() %>/monitor/cctv/detail.do?cctv=E','CCTV',1000,900);" class="small-box-footer">자세히 보기<i class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<div class="col-lg-3 col-6">
					<div class="small-box">
						<div class="inner">
							<h4>F 구역</h4>
							<video id="clone5" controls autoplay width="380px" height="285px">
							</video>
						</div>
						<a href="javascript:OpenWindow('<%=request.getContextPath() %>/monitor/cctv/detail.do?cctv=F','CCTV',1000,900);" class="small-box-footer">자세히 보기<i class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<div class="col-lg-3 col-6">
					<div class="small-box">
						<div class="inner">
							<h4>G 구역</h4>
							<video id="clone6" controls autoplay width="380px" height="285px">
							</video>
						</div>
						<a href="javascript:OpenWindow('<%=request.getContextPath() %>/monitor/cctv/detail.do?cctv=G','CCTV',1000,900);" class="small-box-footer">자세히 보기<i class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<div class="col-lg-3 col-6">
					<div class="small-box">
						<div class="inner">
							<h4>H 구역</h4>
							<video id="clone7" controls autoplay width="380px" height="285px">
							</video>
						</div>
						<a href="javascript:OpenWindow('<%=request.getContextPath() %>/monitor/cctv/detail.do?cctv=H','CCTV',1000,900);" class="small-box-footer">자세히 보기<i class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-6">
					<div class="small-box">
						<div class="inner">
							<h4>I 구역</h4>
							<video id="clone8" controls autoplay width="380px" height="285px">
								<source src="<%=request.getContextPath()%>/resources/cctv/I.mp4" type="video/mp4" />
							</video>
						</div>
						<a href="javascript:OpenWindow('<%=request.getContextPath() %>/monitor/cctv/detail.do?cctv=I','CCTV',1000,900);" class="small-box-footer">자세히 보기<i class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<div class="col-lg-3 col-6">
					<div class="small-box">
						<div class="inner">
							<h4>J 구역</h4>
							<video id="clone9" controls autoplay width="380px" height="285px">
								<source src="<%=request.getContextPath()%>/resources/cctv/J.mp4" type="video/mp4" />
							</video>
						</div>
						<a href="javascript:OpenWindow('<%=request.getContextPath() %>/monitor/cctv/detail.do?cctv=J','CCTV',1000,900);" class="small-box-footer">자세히 보기<i class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/module/footer_js.jsp" %>
	</section>
	
	<script>
	
	 const originalVideo = document.getElementById('webcam');
     const clones = [
         document.getElementById('clone1'),
         document.getElementById('clone2'),
         document.getElementById('clone3'),
         document.getElementById('clone4'),
         document.getElementById('clone5'),
         document.getElementById('clone6'),
         document.getElementById('clone7'),
         document.getElementById('clone8'),
         document.getElementById('clone9')
     ];

     // 웹캠 가져오기
     navigator.mediaDevices.getUserMedia({ video: true })
         .then(function (stream) {
             originalVideo.srcObject = stream;

             // 웹캠 복제
             clones.forEach((clone, index) => {
                 clone.srcObject = originalVideo.srcObject;
             });
         })
         .catch(function (error) {
             console.log('웹캠을 가져올 수 없음: ' + error);
         });

    </script>
</body>
</html>
