<!DOCTYPE html>
<%@page import="th.co.baiwa.admin.entity.UserProfile"%>
<%@page import="th.co.baiwa.common.util.UserLoginUtils"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
<c:set var="projectName" scope="session" value="Part Management"/>

<title>${projectName}</title>

 <%
		String username = UserLoginUtils.getCurrentUser().getUsername();
		UserProfile userProfile = null;
		if(null!=UserLoginUtils.getCurrentUser() &&
			null!=UserLoginUtils.getCurrentUser().getUserProfile()){
			userProfile = UserLoginUtils.getCurrentUser().getUserProfile().getProfile();
 			session.setAttribute("fullName", userProfile.getFirstNameTh()+" "+userProfile.getLastNameTh());
	 		session.setAttribute("_userProfile",userProfile);
	 		session.setAttribute("username", username);
	 		session.setAttribute("authorities",  UserLoginUtils.getCurrentUser().getAuthorities());
		}
//  		System.out.print("USER : "+authorities);

		int start_year = 2012;
		int curr_year = Calendar.getInstance().get(Calendar.YEAR);

  %>

<head>

<c:set var="ver" scope="session" value="?v=1.2.0"/>
<c:set var="cTheme" scope="session" value="cerulean"/>
<c:set var="bodySkin" scope="session" value="skin-blue"/>
<c:set var="cPath" scope="session" value="<%=request.getContextPath()%>"/>

<link href="${cPath}/resources/images/tp/safety.png?ver=${ver}" type="image/png"  rel="shortcut icon">


<link rel="stylesheet" href="${cPath}/resources/adminLTE/css/bootstrap.min.css"/>
<link rel="stylesheet" href="${cPath}/resources/adminLTE/css/bootstrap-select.min.css">
<link rel="stylesheet" href="${cPath}/resources/adminLTE/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="${cPath}/resources/css/jasny-bootstrap.min.css">
<%-- <link rel="stylesheet" href="${cPath}/resources/c3_chart/c3.css${ver}"> --%>

<link rel="stylesheet" href="${cPath}/resources/css/datepicker.css">
<link rel="stylesheet" href="${cPath}/resources/css/daterangepicker.css">
<link rel="stylesheet" href="${cPath}/resources/css/font-awesome.min.css"> 

<link rel="stylesheet" href="${cPath}/resources/adminLTE/css/AdminLTE.min.css"/>

<link rel="stylesheet" href="${cPath}/resources/adminLTE/skins/${bodySkin}.min.css"/>
 
<link rel="stylesheet" href="${cPath}/resources/css/loading.css${ver}">

<link rel="stylesheet" href="${cPath}/resources/css/custom.css${ver}"/>

<!--Icons-->
<%-- <script src="${cPath}/resources/js/lumino.glyphs.js"></script> --%>
<script src="${cPath}/resources/js/jquery-1.11.1.min.js"></script>
<script src="${cPath}/resources/js/bootstrap.min.js"></script> 
<script src="${cPath}/resources/js/validator.min.js"></script> 
<script src="${cPath}/resources/js/bootstrap-datepicker.js"></script>
<script src="${cPath}/resources/js/daterangepicker.js"></script>
<script src="${cPath}/resources/js/jquery.dataTables.min.js"></script>
<script src="${cPath}/resources/js/dataTables.bootstrap.min.js"></script>
<script src="${cPath}/resources/js/bootstrap-select.min.js"></script> 
<script src="${cPath}/resources/js/jasny-bootstrap.min.js"></script> 
<script src="${cPath}/resources/bootstrap-notify-3.1.3/bootstrap-notify.min.js"></script> 
<script src="${cPath}/resources/js/bootbox.min.js"></script> 
<script src="${cPath}/resources/js/jquery.blockUI.js"></script>

<script src="${cPath}/resources/adminLTE/js/adminlte.min.js"></script>
        
<script src="${cPath}/resources/js/demo.js"></script> 

<script src="${cPath}/resources/ChartJS/Chart.min.js"></script> 
<script src="${cPath}/resources/ChartJS/Chart.PieceLabel.min.js"></script> 
<script src="${cPath}/resources/ChartJS/chartjs-plugin-annotation.min.js"></script> 


<script src="${cPath}/resources/js/common.js${ver}"></script> 


<!-- ################ ------- Static Value ----- #############-->

<c:set var="_ALL" scope="session" value="--- ALL ---"/>
<c:set var="_PLEASE_SELECT" scope="session" value="--- Please Select ---"/>

<c:set var="_CURR_YEAR" scope="session" value="<%=curr_year%>"/>

<security:authorize access="hasAnyRole('ADMIN','GAS_STAFF','GAS_SUP','GAS_SEC_MNG')" var="roleApprove" />
<%-- <security:authorize access="hasRole('ROLE_VIEW')" var="roleView" /> --%>
<%-- <security:authorize access="hasRole('ROLE_DELETE')" var="roleDel" /> --%>
<%-- <security:authorize access="hasRole('ROLE_ADMIN')" var="roleAdmin" /> --%>
<%-- <security:authorize access="hasRole('ROLE_SADMIN')" var="roleSuperUser" /> --%>

<script>
	var cPath = "${cPath}"; 
	var $roleApprove = ${roleApprove}; 
// 	var $roleView = ${roleView}; 
// 	var $roleAdmin = ${roleAdmin}; 

	var $roleAdmin = true; 
	var $roleEdit =  true; 
	var $roleView = true; 
	var $roleDel = false; 
	
	$.notifyDefaults({
		type: 'success',
		allow_dismiss: false,
		delay: 1000
// 		showProgressbar: true
	});
	
 
	

</script>

 </head>
 
<!--  <div class="loader"></div> -->