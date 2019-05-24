<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

	<%@include file="/resources/adminLTE/common.jsp" %>
	
</head>


<body>

	
	<!--  --- MENU --- -->
<%-- 	<%@include file="/WEB-INF/jsp/tpcc/she/menu.jsp" %> --%>

  <div class="container">

		<div class="page-header">
			<div class="row">
				<br>
				<div class="col-lg-12">
					<h3><i class='fa fa-upload'></i> File Upload</h3>
				</div>
			</div>
		</div>
		
        <div class="row ">
			<div class="col-lg-12">
			<input type="file" name="files[]" id="filer_input2" multiple="multiple">
			</div> 
		</div> 
			
		<div class="clearfix"><br></div>
		
	</div>  
	
<!-- 	<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet"> -->

<link href="${cPath}/resources/jquery-filer/css/jquery.filer.css" type="text/css" rel="stylesheet" />
<link href="${cPath}/resources/jquery-filer/css/themes/jquery.filer-dragdropbox-theme.css" type="text/css" rel="stylesheet" />

<script src="${cPath}/resources/jquery-filer/js/jquery.filer.min.js"></script>
<script src="${cPath}/resources/jquery-filer/examples/dragdrop/js/custom.js" type="text/javascript"></script>

 
</body>

</html>