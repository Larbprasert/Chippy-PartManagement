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
					<h3><i class='fa fa-plus-circle'></i> Add Course Training </h3>
				</div>
			</div>
		</div>


				<fieldset> 
					<div class="well">
						<form class="form-horizontal" id="form" action="${cPath}/course_manage/courseSave.htm"
							method="post" command="course" data-toggle="validator">  

							<div class="row">
								<div class="col-lg-12">
								
							<div class="col-lg-6">
							
								<!-- 	 <------- Don't forget this Haha -->
								<input type="hidden" class="form-control" name="courseId" value="${course.courseId}">
								
				                  
			 					<div class="form-group">
					                    <label for="courseCode" class="col-lg-4 control-label">Course Code</label>
					                    <div class="col-lg-6">
					                    
					                       <select class="form-control" id="courseCode" name="courseCode"  required onchange="getNextGenNo()">
						                       	<option value="">${_PLEASE_SELECT}</option>
						                       	<c:forEach var="item" items="${LOV_COURSE_LIST}"> 
											        <option value="${item.courseCode}" ${item.courseCode == course.courseCode ? 'selected="selected"' : ''}>${item.courseCode} - ${item.courseNameTh}</option>
											    </c:forEach>
						                      </select>
						                      
<%-- 					                       <input type="text" class="form-control" name="courseCode" value="${course.courseCode}" ${empty param['courseId']? '':'readonly'} required > --%>
<!-- 					                      <input type="text" class="form-control" id="courseCode"  name="courseCode"  -->
<%-- 											 value="${course.courseCode}" readonly> --%>
<!-- 					                    <div class="help-block with-errors"></div> -->
					                    </div>
					             </div>
					             
					              
						         <div class="form-group">
			                    <label for="" class="col-lg-4 control-label">Course Start Date</label>
			                    <div class="col-lg-6">
						                <div class='input-group date'>
						                    <input type='text' class="form-control"   pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}" id='courseDate' name='courseDateStr' value="${course.courseDateStr}" required />
						                    <span class="input-group-addon">
						                        <span class="glyphicon glyphicon-calendar"></span>
						                    </span>
						                </div>
			                    </div>
			                  </div> 
			                  
					             
					               <div class="form-group ">
					                    <label for="" class="col-lg-4 control-label">Lecturer</label>
					                    <div class="col-lg-6">
					                       <input type="text" class="form-control" name="courseOwner" value="${course.courseOwner}" required>
					                    </div>
					             </div>
					                  
					                  <div class="form-group ">
					                    <label for="" class="col-lg-4 control-label">Location</label>
					                    <div class="col-lg-6">
					                       <input type="text" class="form-control" name="coursePlace" value="${course.coursePlace}"  required>
					                    </div>
					             </div>
					             
					             
					     
					             
					             
					          
							</div>
							
							
							
							
							<div class="col-lg-6">
							
							      
			 					<div class="form-group">
					                    <label for="courseCode" class="col-lg-4 control-label">Course Group</label>
					                    <div class="col-lg-6">
					                      <input type="text" class="form-control readonly" id="courseGenNo"  name="courseGenNo" 
											 value="${course.courseGenNo}" required  readonly>
					                    </div>
					             </div>
					             
							    
					        
			                
			                    <div class="form-group">
			                    <label for="" class="col-lg-4 control-label">Course End Date</label>
			                    <div class="col-lg-6">
						                <div class='input-group date'>
						                    <input type='text' class="form-control"  pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}"  id='courseDateEnd' name='courseDateEndStr' value="${course.courseDateEndStr}" required />
						                    <span class="input-group-addon">
						                        <span class="glyphicon glyphicon-calendar"></span>
						                    </span>
						                </div>
			                    </div>
			                  </div> 
			                  
			                  
			                          
			                   <div class="form-group ">
					                    <label for="" class="col-lg-4 control-label">Course Price</label>
					                    <div class="col-lg-6">
					                       <input type="number" step="any" class="form-control" name="coursePrice" value="${course.coursePrice}" required>
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
											<button type="button" id="saveBtn" class="btn btn-primary">
												<i class="fa fa-check-square-o"></i> Save
											</button>
											&nbsp;&nbsp;
										</div>
									</div>
								</div>
							</div>
				
				
 
						</form>
					</div>
					
				</fieldset>
				
				<!-- 	##### <<<<<  TABLE RESULT ####------------------- -->
<!-- <div class="row"><div class="col-lg-12">	
		   <div class="box box-primary"> 
		    <div class="box-header with-border">
              <h3 class="box-title">Contractor</h3>
              
            </div>
		 
		 <div class="box-body">
		 
<div class="bs-docs-section">

        <div class="row">
          <div class="col-lg-12">
				<button type="button" class="btn btn-primary" onclick="doAdd()"><i class="fa fa-plus"></i>&nbsp;New Training</button>
		  <br>
           
            <div class="bs-component">
              <table class="table table-striped table-bordered" id="result-table-contract" cellspacing="0" width="100%">
                <thead class="bg-green color-palette">
                  <tr>
					<th class="text-center col-action">No.</th>
							<th class="text-center">Contractor No.</th>
							<th class="text-center">Contractor Name</th>
							<th class="text-center">Contractor Type</th>
							<th class="text-center">Company</th>
							<th class="text-center">Section/Department</th>
							<th class="text-center">Email</th>
							<th class="text-center">Mobile</th>
							<th class="text-center">Status</th>
                  </tr>
                </thead>
                <tbody>
                </tbody>
              </table> 
            </div>/example
            
            
             <div class="box-footer clearfix no-border">
				              <button type="button" class="btn btn-default pull-right"><i class="fa fa-plus"></i> Add Contractor</button>
				            </div>		
          </div>
        </div>
      </div>
      </div> -->
		<!-- 	##### <<<<<  TABLE RESULT ####------------------- -->
				
			
 
 </div> 
	
	 	 <script>
	  
		var saveStatus = '${param["status"]}';
		
		function doSave(e){
			bootbox.confirm({
			    title: "Confirm",
			    message: _confirmSaveTxt,
			    size: 'small',
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
			        	$('#form').submit();
			        }
			    }
			});
 		};
 	
 	
 	
		function getNextGenNo(e){
			var courseCode = $('#courseCode').val();
			if(courseCode!=''){
				$.ajax({
		            url: cPath+"/course_manage/findNextGroupNo.json?courseCode="+courseCode
		        }).done(function (result) {
// 		        	console.log(result);
		        	$('#courseGenNo').val(result);
	            }).fail(function (jqXHR, textStatus, errorThrown) { 
	            });
            }else{
            	$('#courseGenNo').val('');
            }
 		};
 	
 	
 	
		$(document).ready(function() {
		
		
				$(".date").datepicker({
					   format: 'dd/mm/yyyy'
				});
				
		
			if(saveStatus=="S"){
				/* bootbox.alert({
				    message: "Save Success !",
				    size: 'small'
				}); */
				$.notify({
						title: "<strong>Success!</strong> ",
						message: " Save successfully"
					});
			}
		
			$("#saveBtn").click(function(e){
				var _f = $('#form').validator('validate');
				if (_f.has('.has-error').length==0) {
			    	doSave();
				} 
			});
			
			$("#cancelBtn").click(function(){
				location = cPath+"/manage/job_course_manage.htm";				
			});
			
		});
 	
 	
 	
 	
 	function doSearchCon(){
		$.ajax({
           url: cPath+"/course_manage/getTrainList.json",
            data: $('#form').serialize()
        }).done(function (result) {
            rsTable.clear().draw();
            if(result.recordsTotal>0){
	            rsTable.rows.add(result.data).draw();
            }else{
            	bootbox.confirm({
				    message: "No Data Found !! </br>  Do you want to add New Contractor ? ",
				    size: 'small',
				    buttons: {
				        confirm: {
				            label: 'Yes',
				            className: 'btn-success'
				        },
				        cancel: {
				            label: 'No',
				            className: 'btn-default'
				        }
				    },
				    callback: function (result) {
				        console.log('This was logged in the callback: ' + result);
				        if(result){
// 				        	location = cPath+"/owner/ownerEdit.htm?add=Y&next=Y";
				        }
				    }
				});
            }
           }).fail(function (jqXHR, textStatus, errorThrown) { 
                 // needs to implement if it fails
           });
 	};
 	
 	var ruu = 1;
	var rsTable = $('#result-table-contract').DataTable({
		autoWidth: false,
		data:[],
	    columns: [
	     	{ 
	     		"data": "ownerId"
		        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
// 		            var txt = $roleEdit? "<a href='${cPath}/owner/ownerEdit.htm?edit=Y&ownerId="+oData.ownerId+"'><i class='fa fa-edit fa-lg'></i></a>" : "";
// 		        	if($roleEdit&&$roleDel){ txt +=	"&nbsp;|&nbsp;" };
// 		        	if($roleDel){ txt += "<a href='javascript:void(0)' onclick=\"doDel('"+oData.ownerId+"','"+oData.ownerCode+"')\"><i class='fa fa-trash-o fa-lg'></i></a>" };
		            $(nTd).html(ruu++);
		        } 
            },
			{ "data": "ownerCode" ,"sWidth": "120px"}, 
			{ 
	     		"data": "ownerId"
		       , "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
		       		var tn =  oData.firstName+' '+oData.lastName;
// 		       		if($roleEdit){
// 			       		tn = "<a href='${cPath}/training_manage/trainingEdit.htm?edit=Y&ownerId="+oData.ownerId+"'>"+tn+"</a>";
// 			        }
		            $(nTd).html(tn);
		        } 
            },
			{ "data": "ownerType" }, 
			{ "data": "companyName" }, 
			{ "data": "deptName" }, 
			{ "data": "mobile","sWidth": "120px" },
			{ "data": "activeFlg" }
// 			{ "data": "officePhone" }
// 			{ "data": "createDateStr" }, 
// 				{ "data": "updateDateStr" }
	    ],
	       "aoColumnDefs": [
	      { "sClass": "text-center", "aTargets": [0,1,3,4,5,6,7] }
	    ],
	    rowCallback: function (row, data) {}, 
	    ordering: false, 
   	   	destroy: true 
	 });
	 
	 
// 	 doSearchCon();
	 
	 </script>
	 
	 
	 <c:remove var="SAVE_STATUS" scope="session"/>
	 
</body>

</html>