<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
	<title>Safety Training Record</title>

	<%@include file="/resources/adminLTE/common.jsp" %>

</head>

<style>		
	.signin{ 
		background-color: #fff;
		background-image: url('${cPath}/resources/images/mg6-bg.png');
		background-repeat: no-repeat;
		background-attachment: fixed;
		background-position: center; 

	}
	
	.panel-default {
	    padding: 15px;
	}
		
 </style>
	
	
<body class="signin">
<br>
<br>
<br>
	<div class="row">
		<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default">
				<div class="panel-body ">
					<div class="text-center sign-box">
						<img class="sign-img" src="${cPath}/resources/images/tp/TPCC_TPAC.png" alt="">
					</div>
					<h2 class="text-center">ACCESS DENIED</h2>
					<h4 class="text-center"><a href="${cPath}/logout.htm?logout" class="btn btn-primary">Logout</a></h4> 
					
				</div>
			</div>
		</div><!-- /.col-->
	</div>
	
	
</body>

</html>