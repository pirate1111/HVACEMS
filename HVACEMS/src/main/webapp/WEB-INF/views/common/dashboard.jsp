<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<head>
<style>
#car{
   width:15%;
   background-color:#94ADD7;
}
#path{
	width:8%;
}
.light{
	padding-right:23px;
	padding-left:23px;
}
.air{
	padding-top:12px;
	padding-bottom:12px;
	padding-right:43px;
	padding-left:43px;
}
.fan{
	padding-top:12px;
	padding-bottom:12px;
	padding-right:31px;
	padding-left:31px;
}
.breaker{
	padding-top:12px;
	padding-bottom:12px;
}
</style>
</head>
<body>
    <!-- Content Header (Page header) -->
    <section class="content-header">
    	<div class="container-fluid">
    		<div class="row mb-2">
    			<div class="col-sm-6">
	      			<h1>HOME</h1>
	      		</div>	      		
	       		<div class="col-sm-6">
			      <ol class="breadcrumb float-sm-right">
			      </ol>
		      	</div>
	     	</div>	     	
      	</div>
    </section>

    <!-- Main content -->
    <section class="content">
		<div class="card">
			<div class="card-body">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">주차장 대기환경 현황</h3><a class="float-sm-right" style="font-size: 8pt;">자세히보기+</a>
							</div>
							<div class="card-body">
								<table class="table table-bordered text-center">
									<tr>
										<td style="width:10%; background-color:#6c757d1a;"><b>미세먼지</b></td>
										<td style="width:10%;">180/200</td>
										<td style="width:10%; background-color:#6c757d1a;"><b>포알데하이드</b></td>
										<td style="width:10%;">68/100</td>
										<td style="width:10%; background-color:#6c757d1a;"><b>일산화탄소</b></td>
										<td style="width:10%;">13/25</td>
										<td style="width:10%; background-color:#6c757d1a;"><b>이산화탄소</b></td>
										<td style="width:10%;">502/1000</td>
										<td style="width:10%; background-color:#6c757d1a;"><b>온도</b></td>
										<td style="width:10%;">30℃</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-6">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">에어컨작동 현황</h3><a class="float-sm-right" style="font-size: 8pt;">자세히보기+</a>
							</div>
							<div class="card-body">
								<table class="table table-bordered dataTable dtr-inline" >
									<tr>
										<td id="path" style="border-right:hidden; background-color:#94ADD7;"></td>
										<td class="car" colspan="7" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-bottom:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-right:hidden; border-top:hidden; background-color:#94ADD7;"></td>
										<td class="car" colspan="7" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-bottom:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-right:hidden; "></td>
										<td colspan="7" style="padding:0px;">
											<div class="row">
												<div class="col-12">
													<i class="fas fa-square air"></i>
													<i class="fas fa-square air"></i>
													<i class="fas fa-square air"></i>
													<i class="fas fa-square air"></i>
													<i class="fas fa-square air"></i>
													<i class="fas fa-square air"></i>
												</div>
											</div>
										</td>
										<td style="border-left:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-top:hidden; border-bottom:hidden; "></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car"style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-right:hidden;"></td>
										<td colspan="7" style="padding:0px;">
											<div class="row">
												<div class="col-12">
													<i class="fas fa-square air"></i>
													<i class="fas fa-square air"></i>
													<i class="fas fa-square air"></i>
													<i class="fas fa-square air"></i>
													<i class="fas fa-square air"></i>
													<i class="fas fa-square air"></i>
												</div>
											</div>
										</td>
										<td style="border-left:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car"style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-right:hidden;"></td>
										<td colspan="7" style="padding:0px;">
											<div class="row" >
												<div class="col-12">
													<i class="fas fa-square air"></i>
													<i class="fas fa-square air"></i>
													<i class="fas fa-square air"></i>
													<i class="fas fa-square air"></i>
													<i class="fas fa-square air"></i>
													<i class="fas fa-square air"></i>
												</div>
											</div>
										</td>
										<td style="border-left:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" colspan="3" style="background-color:#94ADD7;"></td>
										<td id="path">E/V</td>
										<td class="car" colspan="3" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<div class="col-6">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">유인팬작동 현황</h3><a class="float-sm-right" style="font-size: 8pt;">자세히보기+</a>
							</div>
							<div class="card-body">
								<table class="table table-bordered dataTable dtr-inline" >
									<tr>
										<td id="path" style="border-right:hidden; background-color:#94ADD7;"></td>
										<td class="car" colspan="7" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-bottom:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-right:hidden; border-top:hidden; background-color:#94ADD7;"></td>
										<td class="car" colspan="7" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-bottom:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-right:hidden; "></td>
										<td colspan="7" style="padding:0px;">
											<div class="row">
												<div class="col-12">
													<i class="fas fa-square fan"></i>
													<i class="fas fa-square fan"></i>
													<i class="fas fa-square fan"></i>
													<i class="fas fa-square fan"></i>
													<i class="fas fa-square fan"></i>
													<i class="fas fa-square fan"></i>
													<i class="fas fa-square fan"></i>
													<i class="fas fa-square fan"></i>
												</div>
											</div>
										</td>
										<td style="border-left:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-top:hidden; border-bottom:hidden; "></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car"style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-right:hidden;"></td>
										<td colspan="7" style="padding:0px;">
											<div class="row">
												<div class="col-12">
													<i class="fas fa-square fan"></i>
													<i class="fas fa-square fan"></i>
													<i class="fas fa-square fan"></i>
													<i class="fas fa-square fan"></i>
													<i class="fas fa-square fan"></i>
													<i class="fas fa-square fan"></i>
													<i class="fas fa-square fan"></i>
													<i class="fas fa-square fan"></i>
												</div>
											</div>
										</td>
										<td style="border-left:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car"style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-right:hidden;"></td>
										<td colspan="7" style="padding:0px;">
											<div class="row" >
												<div class="col-12">
													<i class="fas fa-square fan"></i>
													<i class="fas fa-square fan"></i>
													<i class="fas fa-square fan"></i>
													<i class="fas fa-square fan"></i>
													<i class="fas fa-square fan"></i>
													<i class="fas fa-square fan"></i>
													<i class="fas fa-square fan"></i>
													<i class="fas fa-square fan"></i>
												</div>
											</div>
										</td>
										<td style="border-left:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" colspan="3" style="background-color:#94ADD7;"></td>
										<td id="path">E/V</td>
										<td class="car" colspan="3" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-6">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">차단기작동 현황</h3><a class="float-sm-right" style="font-size: 8pt;">자세히보기+</a>
							</div>
							<div class="card-body">
								<table class="table table-bordered dataTable dtr-inline" >
									<tr>
										<td id="path" style="border-right:hidden; background-color:#94ADD7;"></td>
										<td class="car" colspan="7" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-bottom:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-right:hidden; border-top:hidden; background-color:#94ADD7;"></td>
										<td class="car" colspan="7" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-bottom:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-right:hidden;">
										<i class="fas fa-square breaker"></i>
										</td>
										<td colspan="7" style="padding:0px;">
											<div class="row">
											</div>
										</td>
										<td style="border-left:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-top:hidden; border-bottom:hidden; "></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car"style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-right:hidden;"></td>
										<td colspan="7" style="padding:0px;">
											<div class="row">
											</div>
										</td>
										<td style="border-left:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car"style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-right:hidden;"></td>
										<td colspan="7" style="padding:0px;">
											<div class="row" >
											</div>
										</td>
										<td style="border-left:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" colspan="3" style="background-color:#94ADD7;"></td>
										<td id="path">E/V</td>
										<td class="car" colspan="3" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<div class="col-6">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">조명작동 현황</h3><a class="float-sm-right" style="font-size: 8pt;">자세히보기+</a>
							</div>
							<div class="card-body">
								<table class="table table-bordered dataTable dtr-inline" >
									<tr>
										<td id="path" style="border-right:hidden; background-color:#94ADD7;"></td>
										<td class="car" colspan="7" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-bottom:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-right:hidden; border-top:hidden; background-color:#94ADD7;"></td>
										<td class="car" colspan="7" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-bottom:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-right:hidden; "></td>
										<td colspan="7" style="padding:0px;">
											<div class="row">
												<div class="col-12">
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<br/>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
												</div>
											</div>
										</td>
										<td style="border-left:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-top:hidden; border-bottom:hidden; "></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car"style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-right:hidden;"></td>
										<td colspan="7" style="padding:0px;">
											<div class="row">
												<div class="col-12">
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<br/>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
												</div>
											</div>
										</td>
										<td style="border-left:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car"style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
										<td class="car" style="border-top:hidden; background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden; border-bottom:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-right:hidden;"></td>
										<td colspan="7" style="padding:0px;">
											<div class="row" >
												<div class="col-12">
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<br/>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
													<i class="fas fa-square light"></i>
												</div>
											</div>
										</td>
										<td style="border-left:hidden;"></td>
									</tr>
									<tr>
										<td id="path" style="border-top:hidden;"></td>
										<td class="car" colspan="3" style="background-color:#94ADD7;"></td>
										<td id="path">E/V</td>
										<td class="car" colspan="3" style="background-color:#94ADD7;"></td>
										<td id="path" style="border-top:hidden;"></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
