<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

	<%@include file="/resources/adminLTE/common.jsp" %>

</head>

<style>		
	.signin{ 
		background-color: #444444;
		background-image: url('${cPath}/resources/images/tp/smart-industry-1024x267.png');
		background-repeat: no-repeat;
		background-attachment: fixed;
		background-position-x: center; 
		background-position-y: bottom; 
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
<%-- 						<img class="sign-img" src="${cPath}/resources/images/tp/TPCC_TPAC.png" alt=""> --%>
						<img class="sign-img" src="${cPath}/resources/images/tp/KEIHIN.png" alt="">
					</div>
<%-- 					<h2 class="text-center">${projectName}</h2>  --%>
<!-- 					<hr> -->
					<form role="form" class="sign-box" action="login.htm" method="post">
						<fieldset>
							<c:if test="${not empty error}">
								<div class="alert alert-danger text-center" role="alert">
									${error}
								</div>
							</c:if>
							<c:if test="${not empty warning}">
								<div class="alert alert-warning text-center" role="alert">
									${warning}
								</div>
							</c:if>
							<c:if test="${not empty msg}">
								<div class="alert alert-success text-center" role="alert">
									${msg}
								</div>
							</c:if>
							
							<c:if test="${not empty param.sout}">
								<div class="alert alert-danger text-center" role="alert">
									${param.sout}
								</div>
							</c:if>
								
							<div class="form-group has-feedback">
								<input class="form-control" placeholder="<spring:message code="signin.username"/>" name="username" type="text" autofocus="" value="" maxlength="20" required>
								<span class="glyphicon glyphicon-user form-control-feedback"></span>
							</div>
							<div class="form-group has-feedback">
								<input class="form-control" placeholder="<spring:message code="signin.password"/>" name="password" type="password" value="123456" required>
								<span class="glyphicon glyphicon-lock form-control-feedback"></span>
							</div>
<!-- 							<div class="checkbox"> -->
<!-- 								<label> -->
<!-- 									<input name="remember" type="checkbox" value="Remember Me">Remember Me -->
<!-- 								</label> -->
<!-- 							</div> -->
<!-- 							<a href="welcome.htm" class="btn btn-primary">Login</a> -->
							
							<div class="form-group text-center">
							<button type="submit" class="btn btn-primary"  > &nbsp;&nbsp;<spring:message code="signin.signinBtn"/> <i class='fa fa-sign-in'></i>&nbsp;&nbsp; </button>
							</div>
								<small>
								SHE Admin  : admin/123456 <br>
								Envi User  : enviuser/123456 <br>
								Envi Admin  : enviadmin/123456 <br>
								Area Rep.  : rep1/123456 ,  rep2/123456 <br>
								Area Sup.  : sup1/123456 <br>
								Area Sec.  : sec1/123456 <br>
								SHE Staff  : shestaff/123456
<!-- 								Area Dept.  : enviuser/enviuser   -->
 								</small>		 			
							<spring:eval expression="@environment.getProperty('project.lastupdate')" var="lastupdate" />
							<spring:eval expression="@environment.getProperty('project.version')" var="version" />
							<div class="text-right"><spring:message code="project.version"/>: ${version} </div>
						</fieldset>
					</form>
				</div>
			</div>
		</div><!-- /.col-->
	</div>
	
	
</body>

</html>
