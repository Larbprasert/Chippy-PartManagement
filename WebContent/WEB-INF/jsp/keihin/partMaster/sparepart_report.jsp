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
		 
		   <form class="form-horizontal" id="myForm" commandName="sparepart_report" method="post"> 
			 <div class="row">
				 <div class="col-lg-6">
					<div class="form-group">
						<label for="" class="col-lg-4 control-label">Production Line</label>
						<div class="col-lg-6">
							<select class="form-control" name="productionLine_ID" id="productionLine_ID" onchange="update()">
								<option value="">${_ALL}</option>
								<c:forEach var="item" items="${LOV_PRODUCTIONLINE}">
									<option value="${item.code}"${item.code == productionLine.productionLine_ID ? 'selected="selected"' : ''}>${item.descTH}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				 </div>
				 <div class="col-lg-6">
					<div class="form-group">
						<label for="" class="col-lg-4 control-label">Machine</label>
						<div class="col-lg-6">
							<select  class="form-control" name="machine_ID" id="machine_ID" onchange="openBtn()" >

								
							</select>
						</div>
					</div>
				 </div>
			 </div>
			 
			<div class="row">
				<div class="col-lg-12">
					<div class="form-group "> 
						<div class="col-lg-12 text-center">
							<button type="reset" class="btn btn-default"> &nbsp;<spring:message code="common.clearBtn"/> <i class="fa fa-refresh"></i></button>&nbsp;&nbsp;

							<button type="button" class="btn btn-warning" id="exportBtn" onclick="doExport()">Export&nbsp;&nbsp;<i class="fa fa-file-excel-o"></i></button>
<%-- <spring:url value="/partMaster/report" var="xlsURL"></spring:url> --%>
<%-- <a href="${xlsURL}"><i class="fa fa-file-excel-o"></i> Export Excel Document</a> --%>


						</div>
					</div>
				</div>
			</div>
<!-- 			row -->
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
 
 closeBtn();
 
 function update(){
	 closeBtn();
	 loadMachine();
 };
 
 function openBtn(){
	 document.getElementById("exportBtn").disabled = false;
 };

 function closeBtn(){
	 document.getElementById("exportBtn").disabled = true;
 };
 
 
 function loadMachine() {
	 var productionLine_ID = $('#productionLine_ID').val();
	 
		$.ajax({
			url : cPath + "/partMaster/getMachineByProductionLine.json",
			data : {
				'productionLine.productionLine_ID' :  productionLine_ID
			}
		}).done(function(result) {
			//Clear before insert
			$('#machine_ID') .empty();
		 	//Insert data
		 	$('<option selected="selected">-- Select Machine --</option>').appendTo('#machine_ID');
			$.each(result, function(k, v) {
			    $('<option>').val(v.code).text(v.descTH).appendTo('#machine_ID');
			});
			//
		}).fail(function(jqXHR, textStatus, errorThrown) {
			// needs to implement if it fails
		});

	}
 	
 function doExport()
 {
	 
		var inputs = $("#myForm").serialize();
	    var url = cPath+'/partMaster/report'; 
	    location.href = url;
          
	 
// 	$.ajax({
//           	url: cPath+"/partMaster/report",
//           	data: $('#myForm').serialize()
			

// // 			url: cPath+"/partMaster/report"


//       }).done(function (result) {
      	
//       	alert("Export successfully !");

//          }).fail(function (jqXHR, textStatus, errorThrown) { 
              
//       	   alert('ERROR');
      	   
//          });

};

	
</script>
	

</body>

