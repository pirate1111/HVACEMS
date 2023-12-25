<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<head>
</head>
<style>
th {
	font-size : 18px;
}
</style>
<section class="content-header">
	<div class="container-fluid">
		<div class="col-mb-2">
			<div class="col-sm-12">
				<h1>고장사항 문의메일 작성</h1>
				<p>담당자 이메일 : box6937510@naver.com<br/>※주의사항 : 첨부파일은 필히 선택해주세요.※</p>
			</div>
		</div>
	</div>
</section>
<section class="content">
	<div class="crad">
		<div class="card-body">
			<form action="sendMail" method="post" enctype="multipart/form-data">
				<table class="table table-bordered text-center">
					<tr>
						<th>받는 사람 : <br/> (담당자)</th>
						<td><input style="width:380px; height:55px;" type="email" name="receiver" value="box6937510@naver.com"/></td>
					</tr>
					<tr>
						<th>보내는 사람 : </th>
						<td><input style="width:380px;" type="email" name="sender"/></td>
					</tr>
					<tr>
						<th>제목 : </th>
						<td><input style="width:380px;" type="text" name="title"/></td>
					</tr>
					<tr>
						<th>내용 : </th>
						<td><textArea name="content" rows="10" cols="50"></textArea></td>
					</tr>
					<tr>
						<th>첨부파일 : </th>
						<td><input type="file" name="file"/></td>
					</tr>
				</table>
				<div class="col-mb-2">
					<div class="col-sm-12" style="text-align:right;">
						<button type="submit" class="btn btn-block btn-dark">메일 발송</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>