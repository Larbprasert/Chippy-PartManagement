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
					<h3><i class='fa fa-graduation-cap'></i>  Personal / Course Training  </h3>
				</div>
			</div>
		</div>



	<div class="row">
			<div class="col-lg-12">
		
		  <fieldset><div class="well">
		   <form class="form-horizontal" id="myForm" commandName="course" method="post"  data-toggle="validator"> 
		    
		      <div class="col-lg-6">
	          <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Course Code</label>
                    <div class="col-lg-6">
                          <select class="form-control" id="courseCode" name="courseCode"  required >
	                       	<option value="">${_PLEASE_SELECT}</option>
	                       	<c:forEach var="item" items="${LOV_COURSE_LIST}"> 
						        <option value="${item.courseCode}" ${item.courseCode == course.courseCode ? 'selected="selected"' : ''} >${item.courseCode} - ${item.courseNameTh}</option>
						    </c:forEach>
	                      </select>
<%--                         <input type="text" class="form-control" id="courseCode" name="courseCode" value="${param.courseCode}"> --%>
                    </div>
                  </div>
             </div>
	          
	          
<!-- 	           <div class="col-lg-6"> -->
<!-- 	          <div class="form-group"> -->
<!--                     <label for="" class="col-lg-4 control-label">Course Name TH/EN</label> -->
<!--                     <div class="col-lg-6"> -->
<!--                     	<input type="text" class="form-control" name="courseNameTh" > -->
<!--                     </div> -->
<!--                   </div> -->
<!--              </div> -->
	          
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
             
             <div class="col-lg-6">
                    <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Company</label>
	                    <div class="col-lg-6">
	                     	<select  class="form-control" id="companyCode" name="companyCode"  >
								<option value="">${_ALL}</option>
							    <c:forEach var="item" items="${LOV_COMPANY}">
							     	<option value="${item.code}" ${item.code == owner.companyCode ? 'selected="selected"' : ''}>${item.descTH}</option>
							    </c:forEach>
							</select>
	                    </div>
	                  </div>
             </div>
             
               <div class="col-lg-6">
	          <div class="form-group">
                    <label for="paramStatus" class="col-lg-4 control-label">Section/Dept.</label>
                    <div class="col-lg-6">
                       <select class="form-control" name="deptCode">
                       	<option value="">${_ALL}</option>
                       	<c:forEach var="item" items="${LOV_SECTION}"> 
					        <option value="${item.code}" ${item.descTH == invOwner.deptCode ? 'selected="selected"' : ''}>${item.descTH}</option>
					    </c:forEach>
                      </select>
                      
                    </div>
                  </div>
             </div>
	          
             
             
               <div class="col-lg-6">
	          <div class="form-group">
                    <label for="" class="col-lg-4 control-label">From Date </label>
                    <div class="col-lg-6">
			                <div class='input-group date'>
			                    <input type='text' class="form-control" pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}" id='courseDate' name='courseDateStr' value="${course.courseDateStr}" />
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
                    </div>
                  </div> 
                  </div> 
	                  
	                <div class="col-lg-6">
	          <div class="form-group">
                    <label for="" class="col-lg-4 control-label">To Date </label>
                    <div class="col-lg-6">
			                <div class='input-group date'>
			                    <input type='text' class="form-control" pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}" id='courseDateEnd' name='courseDateEndStr' value="${course.courseDateEndStr}" />
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
                    </div>
                  </div> 
                  </div> 
	                  
             
		      
		<%--       <div class="col-lg-6">
	          <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Course Lecturer</label>
                    <div class="col-lg-6">
                       <input type="text" class="form-control" name="courseOwner" >
                    </div>
                  </div>
             </div>
		      
		      <div class="col-lg-6">
	           <div class="form-group ">
					                    <label for="" class="col-lg-4 control-label">Course Price</label>
					                    <div class="col-lg-6">
					                       <input type="number" class="form-control" name="coursePrice" value="${course.coursePrice}" required>
					                    </div>
					             </div>
             </div>
              --%>
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
	              
<!-- 	              <div class="box-tools pull-right"> -->
<!-- 	                <button type="button" class="btn btn-box-tool btn-success"   onclick="doAddCourse()"><i class="fa fa-plus"></i> Add Course Training -->
<!-- 	                </button> -->
<!-- 	              </div> -->
	              
	              
	             <!--  <div class="box-tools pull-right">
	                <button type="button" class="btn btn-box-tool"   onclick="doAdd()"><i class="fa fa-plus"></i> Add
	                </button>
	              </div> -->
	            </div>
		 
		 <div class="box-body">  
<!-- 		<div class="bs-docs-section"> -->
<!-- 			<div class="bs-component"> -->
				<table class="table table-striped table-bordered" id="result-table"
					cellspacing="0" width="100%">
					<thead class="bg-green color-palette">
						<tr>
<!-- 							<th class="text-center col-action">Action</th> -->
<!-- 							<th class="text-center">Course Start</th> -->
							<th class="text-center">Contractor No.</th>
							<th class="text-center">Contractor Name</th>
							<th class="text-center">Contractor Type</th>
							<th class="text-center">Company</th>
							<th class="text-center">Section/Dept.</th>
							<th class="text-center">Position</th>
							<th class="text-center">Course Code</th>
							<th class="text-center">Course Group</th>
							<th class="text-center">Course Type</th>
							<th class="text-center">Course Name</th>
							<th class="text-center">Course Date</th>
<!-- 							<th class="text-center">Course Lecturer</th> -->
<!-- 							<th class="text-center">Course Price</th> -->
 
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
 	
//  	function doAddCourse(){
// 		location = cPath+"/manage/job_course_add.htm";
//  	};
 	
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
			            url: cPath+"/course_manage/courseDelete?courseId="+courseId
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
            url: cPath+"/training_manage/getDataTablePersonCourse.json",
            data: $('#myForm').serialize()
        }).done(function (result) {
            rsTable.clear().draw();
            if(result.recordsTotal>0){
            	$('#exportBtn').attr('disabled',false);
            	_exportData = result.data;
	            rsTable.rows.add(result.data).draw();
//             }else{
// 				$('#exportBtn').attr('disabled',true);
//             	bootbox.confirm({
// 				    message: "No Data Found !! </br>  Do you want to create New Contractor ? ",
// 				    size: 'small',
// 				    buttons: {
// 				        confirm: {
// 				            label: 'Yes',
// 				            className: 'btn-success'
// 				        },
// 				        cancel: {
// 				            label: 'No',
// 				            className: 'btn-default'
// 				        }
// 				    },
// 				    callback: function (result) {
// 				        console.log('This was logged in the callback: ' + result);
// 				        if(result){
// 				        	location = cPath+"/owner/ownerEdit.htm?add=Y&next=Y";
// 				        }
// 				    }
// 				});
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
				"data": "OWNER_CODE"
            },
			{ 
	     		"data": "OWNER_CODE"
		       , "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
		       		var tn =  oData.TITLE_NAME+' '+oData.FIRST_NAME+' '+oData.LAST_NAME;
// 		       		if($roleEdit){
// 		       			tn = "<a href='${cPath}/training_manage/trainingEdit.htm?edit=Y&ownerId="+oData.ownerId+"'>"+tn+"</a>";
// 			        }
		            $(nTd).html(tn);
		        } 
            },
			{ "data": "OWNER_TYPE_TH" }, 
			{ "data": "COMPANY_NAME" }, 
			{ "data": "DEPT_NAME_TH" }, 
			{ "data": "POSITION_NAME" }, 
			{ "data": "course_CODE" },
			{ "data": "course_group" },
			{ "data": "course_Type" },
			{ "data": "course_NAME_TH" },
			{ 
	     		"data": "COURSE_DATE_STR"
		       , "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
		       		var tn =   oData.COURSE_DATE_STR+'-'+oData.COURSE_DATE_END_STR;
		            $(nTd).html(tn);
		        } 
            },
            
			{ "data": "FIRST_NAME" },
			{ "data": "LAST_NAME" }
		    ],
		    
		    "aoColumnDefs": [
		      { "sClass": "text-center", "aTargets": [0,2,3,4,5,6,7,8,10]
		      
		       },{
	                "targets": [ 11, 12  ],
	                "visible": false
	            }
		    ], 
		  rowCallback: function (row, data) {},
// 		    filter: false,
// 		    info: false,
		    ordering: false,
// 		    processing: true,
	   	   	destroy: true
// 		    retrieve: true      
	//    		searching: false
		 });
		 
		$("#searchBtn").click(function(){
			var _f = $('#myForm').validator('validate');
			if (_f.has('.has-error').length==0) {
				 doSearch();
			} 
        });
	    
			
			
			
			
			
	 $(function() {
           
           var startDate = new Date(currYear, currMonth, 1);
           
           $("#courseDateEnd").datepicker({  format: 'dd/mm/yyyy' });
//            .datepicker("setDate", "-0d"); 
           
           $("#courseDate").datepicker({  format: 'dd/mm/yyyy' });
//              .datepicker("setDate", startDate); 
             
// 	 	var courseCode = $('#courseCode').val();
// 	 	var courseCode = '${param["courseCode"]}';
// 	 	if(''!=courseCode) {
// 	 		$('#courseCode').val(courseCode);
// 	 		doSearch();
// 	 	 }
	 });	
			
				
	
</script>
	

</body>

</html>