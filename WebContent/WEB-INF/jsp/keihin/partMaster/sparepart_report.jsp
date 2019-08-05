<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@include file="/resources/adminLTE/common.jsp" %>

<body class="${bodySkin}">

<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>

<div class="content-wrapper">


	<section class="content-header">
		<h1>
<!-- 			<i class='fa fa-file-excel-o'></i> Spare Part Movement Report -->
			<i class='fa fa-file'></i> Spare Part Movement Report
		</h1>
	</section>
	
	<section class="content">

		<div class="row"> <div class="col-lg-12">	
		
		

<!-- 	#####  SEARCH >>>>> ####------------------- -->
	
		
		<div class="box box-primary"> 
			<div class="box-header">
              <h3 class="box-title"><b>Criteria</b></h3>
            </div>
		 
		 
		 <div class="box-body">
		 
<!-- 		  <fieldset><div class="well"> -->
		   <form class="form-horizontal" id="myForm" commandName="sparepart_report" method="post"> 
			 <div class="row">
				 <div class="col-lg-6">
					<div class="form-group">
						<label for="" class="col-lg-4 control-label">Machine</label>
						<div class="col-lg-6">
							<select  class="form-control" name="machine_ID"   >
								<option value="">${_ALL}</option>
									<c:forEach var="item" items="${LOV_MACHINE}">
								<option value="${item.code}" ${item.code == machine.machine_ID ? 'selected="selected"' : ''}>${item.descTH}</option>
							</c:forEach>
							</select>
						</div>
					</div>
				 </div>
			 </div>
			 
			<div class="row">
				<div class="col-lg-6">
					<div class="form-group "> 
						<div class="col-lg-12 text-center">
							<button type="reset" class="btn btn-default"> &nbsp;<spring:message code="common.clearBtn"/> <i class="fa fa-refresh"></i></button>&nbsp;&nbsp;
							<button type="button" id="searchBtn" class="btn btn-primary"><spring:message code="common.searchBtn"/> <i class="fa fa-search"></i></button>&nbsp;&nbsp;
<!-- 								<button type="button" class="btn btn-warning" disabled>Export <i class="fa fa-file-excel-o"></i></button> -->
						</div>
					</div>
				</div>
			</div>

		</form>
<!-- 				</div> -->
<!--             </fieldset> -->
		</div>
	  </div>  <!-- ---BOX -->
     </div>
	</div>
<!-- 	##### <<<<<  SEARCH ####------------------- -->

	 </section> 

</div>	

	
	
<!-- 	##### <<<<< JAVASCRIPT ####------------------- -->
 <script>
 	
 		function doSearch(){
			
	 	};
 		
		$("#searchBtn").click(function(){
			  doSearch();
        });

			  doSearch();
	
</script>
	

</body>

