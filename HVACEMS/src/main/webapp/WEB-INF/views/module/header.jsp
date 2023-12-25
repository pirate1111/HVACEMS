<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><decorator:title default="HVACEMS" /></title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Flaticon -->
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
<!-- Font Awesome Icons -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">
<!-- Alarm style -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/style/alarm.css">
<!-- Logout style -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/style/logout.css">
<decorator:head />
</head>
<body class="hold-transition sidebar-mini">
   <div class="wrapper">

      <!-- Content Header (Page header) -->
      <!-- Navbar -->
      <nav class="main-header navbar navbar-expand navbar-white navbar-light">
         <!-- Left navbar links -->
         <div class="col-sm-2" id="head-banner">
         <ul class="navbar-nav pageNames" style="font-size: 25px; font-weight: bold;">
         </ul></div>
         <div class="col-sm-8" id="alarm-banner"></div>
         <!-- Right navbar links -->
         <ul class="navbar-nav ml-auto">
            <!-- Notifications Dropdown Menu -->
			<li class="nav-item dropdown">
			<a class="nav-link" data-toggle="dropdown" href="#">
				<i class="far fa-bell"></i> 
				<span id="alarmCount" class="badge badge-danger navbar-badge">${alarmCount }</span>
			</a>
			<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right" style="max-height: 200px; overflow: auto">
				<div style="display: flex; align-items: center;"><span class="dropdown-header">읽지 않은 알림 ${alarmCount }개</span>
				<div style="border-left: solid #B4B4B3; height: 20px;"></div>
				<button onclick="removeAlarms();" class="dropdown-item dropdown-footer" style="text-align: right;">전체삭제</button></div>
				<div class="dropdown-divider"></div>
				<c:if test="${empty checkList }" >
					<div class="dropdown-divider"></div>
					<strong style="text-align: center;">알림이 없습니다.</strong>
				</c:if>
				<div id="alarm-bell"></div>
			</div></li>
			<li class="nav-item">
				<button class="btn fullscreenBtn" data-widget="fullscreen" data-auto-collapse-size="768" >
				<i class="fas fa-expand-arrows-alt" ></i></button>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-widget="pushmenu" href="#" role="button">
					<i class="fas fa-bars"></i>
				</a>
			</li>
		</ul>
	</nav>
      <!-- /.navbar -->

      <!-- Main Sidebar Container -->
      <aside class="main-sidebar sidebar-dark-primary" style="background-color: #3C6562; font-color: white;">
         <!-- Brand Logo -->
         <a href="home.do" class="brand-link "> 
            <img src="<%=request.getContextPath()%>/resources/img/HVACEMSLogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .9">
            <span class="font-weight-light">&nbsp;&nbsp;&nbsp;HVACEMS</span>
         </a>

         <!-- Sidebar -->
         <div class="sidebar">

            <!-- SidebarSearch Form -->

            <!-- Sidebar Menu -->
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="true">
               <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
               <c:forEach items="${dataMap.menuList }" var="menu">
                  <li class="nav-item">
                     <a class="nav-link mainMenu" href="#" onclick="pageName('${menu.menuName}');goPage('<%=request.getContextPath()%>${menu.menuUrl}','${menu.menuCode}');" style="font-size: 20px;" >
                        &nbsp;<i class="${menu.menuIcon }"></i>&nbsp;&nbsp;<p>${menu.menuName}</p>
                     </a>
                     <ul class="nav nav-treeview">
                        <c:forEach items="${menu.submenuList }" var="sub">
                           <li class="nav-item">
                              <a class="nav-link" href="javascript:pageName('${sub.menuName }');goPage('<%=request.getContextPath()%>${sub.menuUrl}','${sub.menuCode}');">
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<p>${sub.menuName }</p>
                              </a>
                           </li>
                        </c:forEach>
                     </ul>
                  </li>
               </c:forEach>
            </ul>
            <!-- Sidebar user panel (optional) -->
            <div class="logout-box user-panel mt-3 pb-3 mb-3 d-flex">
				<div class="image">
					&nbsp;
					<a href="<%=request.getContextPath() %>/common/logout.do;"><img src="<%=request.getContextPath() %>/resources/img/logout-gray.png" style="width: 25px;"></a>
				</div>
				<div class="info info-box">
					<div class="row" style="padding: 5px;">&nbsp;&nbsp;${loginUser.adminName }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button onclick="location.href='<%=request.getContextPath() %>/common/logout.do';" class="btn btn-xs btn-primary col-xs-3" type="button">로그아웃</button>
					</div>
					<a href="mailto:${loginUser.adminEmail }" style="color: blue;">${loginUser.adminEmail }</a>
				</div>
			</div>
            <!-- /.sidebar-menu -->
         </div>
         <!-- /.sidebar -->
      </aside>