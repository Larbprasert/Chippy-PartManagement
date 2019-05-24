<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

	<%@include file="/resources/adminLTE/common.jsp" %>
	
</head>

<body>

	<!--  --- MENU --- -->
	<%@include file="/WEB-INF/jsp/tpcc/she/menu.jsp" %>



	<div class="container">

		<div class="page-header">
			<div class="row">
				<br>
				<div class="col-lg-8 col-md-7 col-sm-6">
					<h3><i class='fa fa-briefcase'></i>  Course Maintenance</h3>
				</div>
			</div>
		</div>



	<div class="row">
			<div class="col-lg-12">
		
		  <fieldset><div class="well">
		   <form class="form-horizontal" id="myForm" commandName="course" method="post"> 
		    
		      <div class="col-lg-6">
	          <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Course Code</label>
                    <div class="col-lg-6">
                        <input type="text" class="form-control" name="courseCode" >
                    </div>
                  </div>
             </div>
	          
	          
	           <div class="col-lg-6">
	          <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Course Name TH/EN</label>
                    <div class="col-lg-6">
                    	<input type="text" class="form-control" name="courseNameTh" >
                    </div>
                  </div>
             </div>
	          
	          <div class="col-lg-6">
	          <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Course Type</label>
                    <div class="col-lg-6">
                       <select class="form-control" name="courseType">
                       	<option value="">${_ALL}</option>
                       	<c:forEach var="item" items="${LOV_COURSE_TYPE}"> 
					        <option value="${item.code}" ${item.descTH == course.courseType ? 'selected="selected"' : ''}>${item.descTH}</option>
					    </c:forEach>
                      </select>
                      
                    </div>
                  </div>
             </div>
             
        <%--        <div class="col-lg-6">
	          <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Course Date</label>
                    <div class="col-lg-6">
			                <div class='input-group date'>
			                    <input type='text' class="form-control"  id='courseDate' name='courseDateStr' value="${course.courseDateStr}" required/>
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
                    </div>
                  </div> 
                  </div> 
	                  
	          
             
		      <div class="col-lg-6">
	          <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Location</label>
                    <div class="col-lg-6">
                       <input type="text" class="form-control" name="coursePlace" >
                    </div>
                  </div>
             </div> --%>
             
		      <div class="col-lg-6">
	          <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Course Lecturer</label>
                    <div class="col-lg-6">
                       <input type="text" class="form-control" name="courseOwner" >
                    </div>
                  </div>
             </div>
             
             <div class="row">
					<div class="col-lg-12">
						<div class="form-group "> 
							<div class="col-lg-12 text-center">
								<button type="reset" class="btn btn-default"> &nbsp;<spring:message code="common.clearBtn"/> <i class="fa fa-refresh"></i></button>&nbsp;&nbsp;
								<button type="button" id="searchBtn" class="btn btn-primary"><spring:message code="common.searchBtn"/> <i class="fa fa-search"></i></button>&nbsp;&nbsp;
<!-- 								<button type="button" class="btn btn-warning" disabled>Export <i class="fa fa-file-excel-o"></i></button> -->
							</div>
						</div>
					</div>
				</div>

				</form></div>
            </fieldset>
            
        </div>
        </div>
<!-- 	##### <<<<<  SEARCH ####------------------- -->
	
		<!-- 	##### <<<<<  TABLE RESULT ####------------------- -->
<!-- 		<button type="button" class="btn btn-primary" onclick="doAdd()"><i class="fa fa-plus"></i>&nbsp;Add Course</button> -->
<!-- 		  <br> -->
<!-- 		  <br> -->
		<div class="box box-primary"> 
			 <div class="box-header with-border">
	              <h3 class="box-title">Result</h3>
	              <div class="box-tools pull-right">
	                <button type="button" class="btn btn-box-tool btn-success"   onclick="doAdd()"><i class="fa fa-plus"></i> Add
	                </button>
	              </div>
	            </div>
		 
		 <div class="box-body">  
<!-- 		<div class="bs-docs-section"> -->
<!-- 			<div class="bs-component"> -->
				<table class="table table-striped table-bordered" id="result-table"
					cellspacing="0" width="100%">
					<thead class="bg-green color-palette">
						<tr>
							<th class="text-center col-action">Action</th>
							<th class="text-center">Course Code</th>
							<th class="text-center">Course Type</th>
							<th class="text-center">Course Name TH</th>
							<th class="text-center">Course Name EN</th>
							<th class="text-center">Status</th>
							
<!-- 							<th class="text-center">Course Code</th> -->
<!-- 							<th class="text-center">Course Date</th> -->
<!-- 							<th class="text-center">Location</th> -->
<!-- 							<th class="text-center">Create By</th> -->
<!-- 							<th class="text-center">Update Date</th> -->
<!-- 							<th class="text-center">Update By</th>  -->
						</tr>
					</thead>
				</table>
			</div>
		</div>
		
	<!-- 	##### <<<<<  TABLE RESULT ####------------------- -->


	</div>
	
<!-- 	<hr> -->
	
<%-- 	<%@include file="/WEB-INF/jsp/tpcc/she/maintain/parameter_edit.jsp" %> --%>
	
	
	
		<!-- 	##### <<<<< JAVASCRIPT ####------------------- -->
 <script>
 	
 	function doAdd(){
		location = cPath+"/course/courseEdit.htm";
 	};
 	
 	function doDel(courseId, name){
		bootbox.confirm({
		    title: "Confirm",
		    size: 'small',
		    message: _confirmDelTxt+" : "+name,
		    buttons: {
		        cancel: {
		            label: '<i class="fa fa-times"></i> Cancel'
		        },
		        confirm: {
		            label: '<i class="fa fa-check"></i> Confirm',
		            className: 'btn-success'
		        }
		    },
		    callback: function (result) {
		        if(result){
		        	$.ajax({
			            url: cPath+"/course/courseDelete?courseId="+courseId
			        }).done(function (result) {
				        bootbox.alert({
						    message: _successDelTxt,
						    size: 'small',
						    callback: function(){doSearch();}
						});
		            }).fail(function (jqXHR, textStatus, errorThrown) { 
		            });
		        }
		    }
		});
	};
	
	function doSearch(){
		$.ajax({
            url: cPath+"/course/getDataTable.json",
            data: $('#myForm').serialize()
        }).done(function (result) {
            rsTable.clear().draw();
            if(result.recordsTotal>0){
	            rsTable.rows.add(result.data).draw();
            }else{
            	bootbox.alert({
				    message: "No Data Found!",
				    size: 'small'
				});
            }
           }).fail(function (jqXHR, textStatus, errorThrown) { 
                 // needs to implement if it fails
           });
 	};
		
		var rsTable = $('#result-table').DataTable({
			autoWidth: false,
			data:[],
		    columns: [
		     	{ 
		     		"data": "courseId"
			        ,"sWidth": "60px"
			        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
			            var txt = $roleEdit? "<a href='${cPath}/course/courseEdit.htm?courseId="+oData.courseId+"'><i class='fa fa-edit fa-lg'></i></a>" : "";
			        	if($roleEdit&&$roleDel){ txt +=	"&nbsp;|&nbsp;" };
			        	if($roleDel){ txt += "<a href='javascript:void(0)' onclick=\"doDel('"+oData.courseId+"','"+oData.courseCode+"')\"><i class='fa fa-trash-o fa-lg'></i></a>" };
			            $(nTd).html(txt);
			        } 
	            },
				{ "data": "courseCode" }, 
				{ "data": "courseType" }, 
				{ "data": "courseNameTh" }, 
				{ "data": "courseNameEn" },
				{ "data": "active" }
				
// 				{ "data": "courseCode" }
//  				{ "data": "courseDateStr" },
// 				{ "data": "coursePlace" }
		    ],
		      "aoColumnDefs": [
		      { "sClass": "text-center", "aTargets": [0,1,2,5] }
		    ],
		    rowCallback: function (row, data) {}, 
		    ordering: false, 
	   	   	destroy: true 
		 });
		 
		$("#searchBtn").click(function(){
		   doSearch();
        });
	    
	    
	    	$(".date").datepicker({
					   format: 'dd/mm/yyyy'
				});
				
	
</script>
	

</body>

</html>