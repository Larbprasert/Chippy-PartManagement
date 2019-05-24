<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

	<%@include file="/resources/adminLTE/common.jsp" %>
 
 	<style type="text/css">
 	
 	tfoot input {
        width: 100%;
        box-sizing: border-box;
    }
    </style>
</head>
<body>

	<!--  --- MENU --- -->
	<%@include file="/WEB-INF/jsp/tpcc/she/menu.jsp" %>



	<div class="container">

		<div class="page-header">
			<div class="row">
				<br>
				<div class="col-lg-8 col-md-7 col-sm-6">
					<h3><i class='fa fa-id-card'></i> Add Contractor Training Course</h3>
				</div>
			</div>
		</div>
		
		
<!-- 	#####  SEARCH >>>>> ####------------------- -->
	<div class="row"><div class="col-lg-12">
		
<!-- 		 <div class="box box-primary">  -->
<!-- 		 	<div class="box-header with-border"> -->
<!--               <h3 class="box-title">Criteria</h3> -->
<!--             </div> -->
		 
		 
<!-- 		 <div class="box-body"> -->
		 
		 <fieldset><div class="well">
		 
		    <form class="form-horizontal" id="form" action="courseSave.htm"
							method="post" command="course"  >  

							<div class="row">
								<div class="col-lg-12">
								
							<div class="col-lg-6">
							
								<!-- 	 <------- Don't forget this Haha -->
<%-- 								<input type="hidden" class="form-control" name="courseId" value="${course.courseId}"> --%>
								<input type="hidden" class="form-control" id="courseTrainId" name="courseTrainId" value="${course.courseTrainId}">
								
				                  
			 					<div class="form-group">
					                    <label for="courseCode" class="col-lg-4 control-label">Course Code/Group</label>
					                    <div class="col-lg-3">
					                      <input type="text" class="form-control" id="courseCode"  name="courseCode" 
											 value="${course.courseCode}" disabled>
					                    </div>
					                    <div class="col-lg-3">
					                      <input type="text" class="form-control" id="courseGenNo"  name="courseGenNo" 
											 value="${course.courseGenNo}" disabled>
					                    </div>
					             </div>
					             
			 				
						         
					           
					             
						          <div class="form-group ">
					                    <label for="" class="col-lg-4 control-label">Course Name TH</label>
					                    <div class="col-lg-6">
					                       <input  type="text" class="form-control" name="courseNameTh" value="${course.courseNameTh}"   disabled>
					                    </div>
					             </div>
					             
					             
					               <div class="form-group">
			                    <label for="" class="col-lg-4 control-label">Course Start Date</label>
			                    <div class="col-lg-6">
						                <div class='input-group date'>
						                    <input type='text' class="form-control"  pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}"  id='courseDate' name='courseDateStr' value="${course.courseDateStr}"  disabled/>
						                    <span class="input-group-addon">
						                        <span class="glyphicon glyphicon-calendar"></span>
						                    </span>
						                </div>
			                    </div>
			                  </div> 
			                  
			                  
					               <div class="form-group ">
					                    <label for="" class="col-lg-4 control-label">Lecturer</label>
					                    <div class="col-lg-6">
					                       <input type="text" class="form-control" name="courseOwner" value="${course.courseOwner}"  disabled>
					                    </div>
					             </div>
					                  
					                  <div class="form-group ">
					                    <label for="" class="col-lg-4 control-label">Location</label>
					                    <div class="col-lg-6">
					                       <input type="text" class="form-control" name="coursePlace" value="${course.coursePlace}"   disabled>
					                    </div>
					             </div>
					             
					           
					             
							</div>
							
							<div class="col-lg-6">
							 
						       
					              
					              <%-- 	<div class="form-group">
					                    <label for="courseCode" class="col-lg-4 control-label">Course Group</label>
					                    <div class="col-lg-6">
					                      <input type="text" class="form-control" id="courseGenNo"  name="courseGenNo" 
											 value="${course.courseGenNo}" readonly>
					                    </div>
					             </div> --%>
					             
				                    <div class="form-group">
				                    <label for="" class="col-lg-4 control-label">Course Type</label>
				                    <div class="col-lg-6">
				                             <select class="form-control" name="courseType"  disabled="disabled">
						                       	<option value="">${_ALL}</option>
						                       	<c:forEach var="item" items="${LOV_COURSE_TYPE}"> 
											        <option value="${item.code}" ${item.code == course.courseType ? 'selected="selected"' : ''}>${item.descTH}</option>
											    </c:forEach>
						                      </select>
				                    </div>
				                  </div>
					             
						         
						          <div class="form-group ">
					                    <label for="" class="col-lg-4 control-label">Course Name EN</label>
					                    <div class="col-lg-6">
					                       <input type="text" class="form-control" name="courseNameEn" value="${course.courseNameEn}"  disabled>
					                    </div>
					             </div>
					          
					             
						        
			                   <div class="form-group">
				                    <label for="" class="col-lg-4 control-label">Course End Date</label>
				                    <div class="col-lg-6">
							                <div class='input-group date'>
							                    <input type='text' class="form-control"  pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}"  id='courseDateEnd' name='courseDateEndStr' value="${course.courseDateEndStr}"  disabled/>
							                    <span class="input-group-addon">
							                        <span class="glyphicon glyphicon-calendar"></span>
							                    </span>
							                </div>
				                    </div>
				                  </div> 
			                
			                  
			                   <div class="form-group ">
					                    <label for="" class="col-lg-4 control-label">Course Price</label>
					                    <div class="col-lg-6">
					                       <input type="text" class="form-control" name="coursePrice" value="${course.coursePrice}"  disabled>
					                    </div>
					             </div>
					             
					             

							</div>
</div>
							</div>




						<div class="row">
								<div class="col-lg-12">
									<div class="form-group ">
										<div class="col-lg-12 text-center">
											<button type="button" id="cancelBtn" class="btn btn-default">
												<i class="fa fa-times-circle"></i> Cancel
											</button>
											&nbsp;
<!-- 											<button type="button" class="btn btn-success" onclick="doAdd()"> -->
<!-- 												<i class="fa fa-plus"></i> Add Contractor  -->
<!-- 											</button>&nbsp; -->
											<button disabled type="button" id="saveBtn" class="btn btn-primary">
												<i class="fa fa-check-square-o"></i> Save
											</button>
										</div>
									</div>
								</div>
							</div>
				
				
 
						</form>
				
				</div>   </fieldset>
<!--               </div>  </div> -->
        </div>
		 </div>	
<!-- 	##### <<<<<  SEARCH ####------------------- -->


<!-- 	##### <<<<<  TABLE RESULT ####------------------- -->
<div class="row"><div class="col-lg-12">	
		   <div class="box box-primary"> 
<!-- 		    <div class="box-header with-border"> -->
<!--               <h3 class="box-title"> Contractor</h3> -->
              
<!--             </div> -->
		 
		  <div class="box-header with-border">

					 <form class="form-horizontal" id="srcForm"   method="post"  data-toggle="validator"> 
					 	
					 	 <input type="hidden"  name="courseTrainId" value="${course.courseTrainId}">
					 	
					 	
					 	<div class="col-lg-12">
					 	
					 	<div class="col-lg-5">
		                   <div class="form-group">
			                    <label for="" class="col-lg-4 control-label">Company</label>
			                    <div class="col-lg-8">
			                     	<select  class="form-control" name="companyCode" id="companyCodeFill" >
										<option value="">${_ALL}</option>
									    <c:forEach var="item" items="${LOV_COMPANY}">
									     	<option value="${item.code}" ${item.code == owner.companyCode ? 'selected="selected"' : ''}>${item.descTH}</option>
									    </c:forEach>
									</select>
			                    </div>
			                 </div>
			              </div>
		                 
			          <div class="col-lg-5">
				          <div class="form-group">
			                    <label for="paramStatus" class="col-lg-4 control-label">Section/Dept.</label>
			                    <div class="col-lg-8">
			                       <select class="form-control" id="deptCodeFill"  name="deptCode" >
			                       	<option value="">${_ALL}</option>
			                       	<c:forEach var="item" items="${LOV_SECTION}"> 
								        <option value="${item.code}" ${item.code == owner.deptCode ? 'selected="selected"' : ''}>${item.descTH}</option>
								    </c:forEach>
			                      </select>
			                      
			                    </div>
			                 </div>    
			            </div>
			                    
		                    <div class="col-lg-2">
		                       	 <button type="button" id="searchBtn" class="btn btn-primary"><spring:message code="common.searchBtn"/> <i class="fa fa-search"></i></button>&nbsp;&nbsp;
		                    </div>
		                    
		                  </div>
			                  
					 </form>
					   </div>	
					   
		 <div class="box-body">
		 
<!-- <div class="bs-docs-section"> -->

<!--         <div class="row"> -->
<!--           <div class="col-lg-12"> -->
<!-- 				<button type="button" class="btn btn-primary" onclick="doAdd()"><i class="fa fa-plus"></i>&nbsp;New Training</button> -->
<!-- 		  <br> -->
           
            <div class="bs-component">
              <table class="table table-stripe" id="result-table" cellspacing="0" width="100%">
                <thead class="bg-green color-palette">
                  <tr>
					<th class="text-center col-action"></th>
<!--          				<th class="text-center col-action"><input type="checkbox" name="select_all" value="1" id="example-select-all"></th> -->

							<th class="text-center">Contractor No.</th>
							<th class="text-center">Contractor Name</th>
							<th class="text-center">Contractor Type</th>
							<th class="text-center">Company</th>
							<th class="text-center">Section/Department</th>
							<th class="text-center">Position</th>
							<th class="text-center">Mobile</th>
							<th class="text-center">Status</th>
                  </tr>
                </thead>
                <tbody>
                </tbody>
             
              </table> 
            </div><!-- /example -->
          </div>
        </div>
      </div>
      </div>
		<!-- 	##### <<<<<  TABLE RESULT ####------------------- -->


	</div>

 
 
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
        <div class="modal-body">
            <div class="te"></div></div>
        </div>
    </div>
</div>


	<!-- 	##### <<<<< JAVASCRIPT ####------------------- -->
 <script>
 	
 	 $(function() {
 	 
		$('.date').datepicker({
			   format : 'dd/mm/yyyy'
		});
		
		
 	function doAdd(){
		location = cPath+"/training_manage/trainingEdit.htm?add=Y";
 	}
 	
 	function doDel(assetOwnerId, name){
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
			            url: cPath+"/training_manage/assetDelete?assetOwnerId="+assetOwnerId
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
	
	var _exportData = {};
	
	function doSearch(){
		$.ajax({
            url: cPath+"/course_manage/getTrainAddList.json",
            data: $('#srcForm').serialize()
        }).done(function (result) {
            rsTable.clear().draw();
            if(result.recordsTotal>0){
//             	$('#exportBtn').attr('disabled',false);
//             	_exportData = result.data;
	            rsTable.rows.add(result.data).draw();
	            
	            	$("#saveBtn").prop('disabled', false);
            }else{
            		$("#saveBtn").prop('disabled', true);
            }
           }).fail(function (jqXHR, textStatus, errorThrown) { 
                 // needs to implement if it fails
           });
 	};
 	
 	function doPopup(){
		$('#myModal').removeData('bs.modal');
 	};
 	
 	
 		$("#searchBtn").click(function(){
           	var _f = $('#srcForm').validator('validate');
			if (_f.has('.has-error').length==0) {
				 doSearch();
			} 
        });
 	
		
		var rsTable = $('#result-table').DataTable({
			autoWidth: false,
// 			stateSave: true,
			data:[],
		    columns: [
				{ 
	     		"data": "ownerId"
// 		        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
// 		            var txt = $roleEdit? "<a href='${cPath}/training_manage/trainingEdit.htm?edit=Y&ownerId="+oData.ownerId+"'><i class='fa fa-edit fa-lg'></i></a>" : "";
// 		        	if($roleEdit&&$roleDel){ txt +=	"&nbsp;|&nbsp;" };
// 		        	if($roleDel){ txt += "<a href='javascript:void(0)' onclick=\"doDel('"+oData.ownerId+"','"+oData.ownerCode+"')\"><i class='fa fa-trash-o fa-lg'></i></a>" };
// 		            $(nTd).html(txt);
// 		        } 
	 			,"render": function (data, type, full, meta){
	            	 return '<input type="checkbox" name="ownerId" value="' + $('<div/>').text(data).html() + '">';
         		}
            },
			{  
				"data": "ownerCode"
            },
//             { 
// 		     		"data": "ownerCode"
// 		     		,"sWidth": "200px"
// 			       , "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
// 			            $(nTd).html('<a data-toggle="modal" onclick="doPopup()" href="${cPath}/owner/ownerPopup.htm?ownerId='+oData.ownerId+'" data-target="#myModal">'+oData.firstName+" "+oData.lastName+'</a>');
// 			        } 
// 	            },
			{ 
	     		"data": "firstName"
		       , "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
		       		var tn =  oData.title+' '+oData.firstName+' '+oData.lastName;
// 		       		if($roleEdit){
// 		       			tn = "<a href='${cPath}/training_manage/trainingEdit.htm?edit=Y&ownerId="+oData.ownerId+"'>"+tn+"</a>";
// 			        }
		            $(nTd).html(tn);
		        } 
            },
			{ "data": "ownerType" }, 
			{ "data": "companyName" }, 
			{ "data": "deptName" }, 
// 			{ "data": "email" ,"sWidth": "220px"}, 
			{ "data": "position" },
			{ "data": "mobile","sWidth": "120px" },
			{ "data": "activeFlg" }
		    ],
		    
		    "aoColumnDefs": [
	      { "sClass": "text-center", "aTargets": [0,1,3,4,5,6,7] }
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
 

			$("#cancelBtn")
					.click(
							function() {
								var courseTrainId = $('#courseTrainId').val();
								location = cPath
										+ "/course_manage/courseEdit.htm?edit=Y&courseTrainId="
										+ courseTrainId;
							});

			$("#saveBtn")
					.click(
							function(e) {
								var data = rsTable.$('input[type="checkbox"]')
										.serialize();
								var courseTrainId = $('#courseTrainId').val();
								console.log(data);
								if ("" == data.trim()) {
									bootbox.alert({
										message : "Please Select Contractor !",
										size : 'small'
									});
									return;
								}

								bootbox
										.confirm({
											title : "Confirm",
											message : 'Do you want to add Contractor ? ',
											size : 'small',
											buttons : {
												cancel : {
													label : '<i class="fa fa-times"></i> Cancel'
												},
												confirm : {
													label : '<i class="fa fa-check"></i> Confirm',
													className : 'btn-success'
												}
											},
											callback : function(result) {
												if (result) {
													$
															.ajax(
																	{
																		url : cPath
																				+ "/course_manage/addContractSave?courseTrainId="
																				+ courseTrainId,
																		data : data
																	})
															.done(
																	function(
																			result) {

																		if ("SUCCESS" == result) {
																			bootbox
																					.alert({
																						message : "Add Contractor Success!",
																						size : 'small',
																						callback : function(
																								result) {
																							location = cPath
																									+ "/course_manage/courseEdit.htm?edit=Y&courseTrainId="
																									+ courseTrainId;
																						}
																					});
																		}
																	})
															.fail(
																	function(
																			jqXHR,
																			textStatus,
																			errorThrown) {
																		bootbox
																				.alert({
																					message : "Error !",
																					size : 'small'
																				});
																	});

												}
											}
										});

								/** $.ajax({
								    url: cPath+"/training_manage/getExportData.json",
								    data: $('#myForm').serialize()
								}).done(function (result) {
								    if(result.recordsTotal>0){
								    	_exportData = result.data;
								        JSONToCSVConvertor(_exportData, "Asset_Management_Report", true);
								    	$('#exportBtn').attr('disabled',false);
								    }else{
										$('#exportBtn').attr('disabled',true);
								    	bootbox.alert({
										    message: "No Data Found!",
										    size: 'small'
										});
								    }
								}).fail(function (jqXHR, textStatus, errorThrown) { 
								     bootbox.alert({ message: "Error !", size: 'small' });
								});  
								 */

							});

// 		$('#companyCodeFill').on( 'change', function () {
// 			    rsTable
// 			        .columns(4)
// 			        .search( this.value)
// 			        .draw();
// 			});
			
// 			$('#deptCodeFill').on( 'change', function () {
// 			    rsTable
// 			        .columns(5)
// 			        .search( this.value)
// 			        .draw();
// 			});
			
			
					
	
        
 
		});
	</script>
	

</body>

</html>