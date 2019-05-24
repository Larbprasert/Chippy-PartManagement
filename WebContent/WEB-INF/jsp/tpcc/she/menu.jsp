<!DOCTYPE html>
<%@page import="th.co.baiwa.common.bean.UserBean"%>
<%@page import="th.co.baiwa.common.util.UserLoginUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<script src="${cPath}/resources/js/common.js"></script> 
 
 <style>

.navbar-brand>img {
	display: inline;
	margin: 0 10px;
	height: 100%;
}

.navbar-brand {
    padding: 0;
/*     margin-left: -85px !important; */
}

.navbar-brand {
    padding-right:5px;
}

.navbar-header {
/*     padding-right: 20px; */
/*     color: rgba(0,0,0,0.5); */
    font-weight: 500;
}

.container-responsive {
    max-width: 100%;
    margin: 0 auto;
    padding-left: 20px;
    padding-right: 20px;
    
}

</style>
 
 
  	<div id="navbar-main">
      <!-- Fixed navbar -->
		<div class="navbar navbar-default navbar-fixed-top ">
<!-- 		<div class="banner navbar navbar-default navbar-static-top"> -->
		  <div class="container-responsive">
		  
			<div class="navbar-brand"> 
			 <a href="${cPath}/she/home.htm" class="navbar-brand">
			 <img src="${cPath}/resources/images/tp/TPAC-TPCC.png" >
<%-- 			 <img src="${cPath}/resources/images/logo_mg_sm.png" > --%>
			 <font><spring:message code="project.name"/></font>
			 </a>
			</div>
			
			<div class="navbar-collapse collapse">
			
			  <ul class="nav navbar-nav" id="nav-menu">
			  
		          <li class="dropdown">
		            <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="themes"><i class="fa fa-history"></i> <spring:message code="menu.history"/> <span class="caret"></span></a>
		            <ul class="dropdown-menu" aria-labelledby="themes" id="select-themes">
						<li><a href="${cPath}/history/reportSum.htm" class="smoothScroll"><i class='fa fa-bar-chart'></i> Training Summary Report</a></li>
		            </ul>
		          </li>
		          
		          <security:authorize access="hasAnyRole('EDIT','DELETE')">
		          <li class="dropdown">
		            <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="themes"><i class="fa fa-calendar-check-o"></i> Management <span class="caret"></span></a>
		            <ul class="dropdown-menu" aria-labelledby="themes" id="select-themes">
			             <li><a href="${cPath}/manage/training_manage.htm" class="smoothScroll"><i class='fa fa-id-card'></i> Personal Training</a></li>
			             <li class="divider"></li>
			             <li><a href="${cPath}/manage/job_course_manage.htm" class="smoothScroll"> <i class='fa fa-sitemap'></i> Course Training</a></li>
			             <li class="divider"></li>
			             <li><a href="${cPath}/manage/job_course_search.htm" class="smoothScroll"><i class='fa fa-graduation-cap'></i> Personal / Course Training</a></li>
			             <li class="divider"></li>
			             <li><a href="${cPath}/manage/job_course_add.htm" class="smoothScroll">&nbsp;<i class='fa fa-plus-circle'></i> Create Course Training  </a></li>
<!-- 			             <li class="divider"></li> -->
<%-- 						 <li><a href="${cPath}/file/upload.htm" class="smoothScroll"><i class='fa fa-upload'></i> Upload File </a></li> --%>
		            </ul>
		          </li>
		          
		          <li class="dropdown">
		            <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="themes"><i class="fa fa-gears"></i> Maintenance <span class="caret"></span></a>
		            <ul class="dropdown-menu" aria-labelledby="themes" id="select-themes">
<%-- 			             <li><a href="${cPath}/maintain/asset.htm" class="smoothScroll"><i class='fa fa-laptop'></i> Asset Maintenance</a></li> --%>
<!-- 			             <li class="divider"></li> -->
			             <li><a href="${cPath}/maintain/owner.htm" class="smoothScroll"><i class='fa fa-id-card'></i> Contractor Maintenance</a></li>
			             <li class="divider"></li>
			             <li><a href="${cPath}/maintain/course.htm" class="smoothScroll"><i class='fa fa-briefcase'></i> Course Maintenance</a></li>
			             <li class="divider"></li>
			             <li><a href="${cPath}/maintain/positionCourse.htm" class="smoothScroll"><i class='fa fa-graduation-cap'></i> Training Need by Job Position</a></li>
			             <li class="divider"></li>
			             <li><a href="${cPath}/maintain/parameter.htm" class="smoothScroll"><i class='fa fa-hashtag'></i> Parameter Maintenance</a></li>
			             
		            </ul>
		          </li>
				  </security:authorize>
		           
		          <security:authorize access="hasAnyRole('ROLE_ADMIN')">
			          <li class="dropdown">
			            <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="themes"><i class="fa fa-microchip"></i> System Manage <span class="caret"></span></a>
			            <ul class="dropdown-menu" aria-labelledby="themes" id="select-themes">
				             <li><a href="${cPath}/admin/user/viewUser.htm" class="smoothScroll"><i class='fa fa-users'></i> User Management</a></li>
								<li class="divider"></li>
				             <li><a href="${cPath}/reloadCache" target="_blank"><i class='fa fa-refresh'></i> Reload Cache</a></li>
<!-- 				             <li class="divider"></li> -->
<%-- 				             <li><a href="${cPath}/admin/user/viewRole.htm" class="smoothScroll"> Role Management</a></li> --%>
			            </ul>
			          </li>
		          </security:authorize>
		          
		        </ul>


				<ul class="nav navbar-nav navbar-right">

					<li class="dropdown user-dropdown"><a
						href="javascript:void(0);" class="dropdown-toggle ng-binding"
						data-toggle="dropdown"><i class="fa fa-user-circle"></i>
							${fullName} <b class="caret"></b></a>
						<ul class="dropdown-menu">
								<li><a href="${cPath}/profile/viewProfile.htm?userId=${_userProfile.userId}"><i class="fa fa-id-card-o"></i> View Profile </a></li>
								<li class="divider"></li>
			             		<li><a href="${cPath}/maintain/themes_setting.htm"  ><i class='fa fa-magic'></i> Themes Setting </a></li>
								<li class="divider"></li>
<%-- 			             		<li><a href="${cPath}/maintain/themes_setting.htm"  ><i class='fa fa-magic'></i> Language   </a></li> --%>
<!-- 								<li class="divider"></li> -->
							<li><a href="${cPath}/logout.htm"><i class="fa fa-sign-out"></i> Sign Out</a></li>
						</ul></li>
				</ul>

			</div><!--/.nav-collapse -->	
			
			
		  </div>
		</div>
    </div>
