 <!DOCTYPE HTML>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>

<script src="${cPath}/resources/js/moment.min.js"></script>

<!-- blueimp Gallery styles -->
<link rel="stylesheet" href="${cPath}/resources/jFileupload/css/blueimp-gallery.min.css">
<link rel="stylesheet" href="${cPath}/resources/jFileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="${cPath}/resources/jFileupload/css/jquery.fileupload-ui.css">
<!-- CSS adjustments for browsers with JavaScript disabled -->
<noscript><link rel="stylesheet" href="${cPath}/resources/jFileupload/css/jquery.fileupload-noscript.css"></noscript>
<noscript><link rel="stylesheet" href="${cPath}/resources/jFileupload/css/jquery.fileupload-ui-noscript.css"></noscript>

 
<div class="content-wrapper">
		<section class="content-header">
			<h1 class="page-header">Repair/Rebuild Request</h1>
		</section> 
		
  <section class="content">
		 
	<form action="${cPath}/request/requested_save" method="post"   id="myForm" data-toggle="validator" >

<!-- 			<input name ="rAction" type="hidden" value="Create"> -->
 
	            <div class="row">
	             
	                <div class="col-lg-12">
	                    <div class="panel panel-default">
	                    
	                    
<!-- ###########################################################################       header	                     -->
	                        <div class="panel-heading">
	                        	<!-- /.row -->
								<div class="row">
									<div class="col-lg-4">
		                                <div class="form-group">
		                                	<div class="col-lg-5">
		                                		<p class="help-block"><b>Request No.</b></p>
		                                	</div>
		                                	<div class="col-lg-7">		                                		
							                    <input type="text" class="form-control" placeholder="" id="request_ID" value="PE${_CURR_YEAR}******" readonly>
		                                	</div>                          			
	                            		</div>
	                            	</div>
	                            	
	                            	<div class="col-lg-4">
		                                <div class="form-group">
	                            			<div class="col-lg-5">
		                                		<p class="help-block"><b>Request Date</b></p>
		                                	</div>
		                                	<div class="col-lg-7">		                                		
							                    <input type="text" class="form-control" placeholder="" name="informDate" id="informDate" value="" readonly>
		                                	</div>
	                            		</div>
	                            	</div>
	                            	
	                            	<div class="col-lg-4">
	                            		<div class="col-lg-5">
	                                		<p class="help-block"><b>Request Time</b></p>
	                                	</div>
	                                	<div class="col-lg-7">		                                		
						                    <input type="text" class="form-control" placeholder="" name="informTime" id="informTime" value="" readonly>
	                                	</div>
	                            	</div>
	                            </div>
	                            <!-- /.row -->
	                            
	                            <br>
	                            <!-- /.row -->
	                            <div class="row">
									<div class="col-lg-4">
		                                <div class="form-group">
		                                	<div class="col-lg-5">
		                                		<p class="help-block"><b>Request By</b></p>
		                                	</div>
		                                	<div class="col-lg-7">		                                		
							                    <input type="text" class="form-control" placeholder=""  id="createBy" value="${_userProfile.firstNameTh} ${_userProfile.lastNameTh}" readonly>
		                                	</div>                            			
	                            		</div>
	                            	</div>
	                            	
	                            	<div class="col-lg-4">
	                            		<div class="col-lg-5">
	                                		<p class="help-block"><b>Section</b></p>
	                                	</div>
	                                	<div class="col-lg-7">		                                		
						                    <input type="text" class="form-control" placeholder="" id="section_name" value="${_userProfile.section.section_name}" readonly>
	                                	</div>
	                            	</div>
	                            	
	                            	<div class="col-lg-4">
	                            		<div class="col-lg-5">
	                                		<p class="help-block"><b>Request Status</b></p>
	                                	</div>
	                                	<div class="col-lg-7">		                                		
						                    <input type="text" class="form-control" placeholder=""  value="Create Request" readonly>
	                                	</div>	                                	
	                            	</div>
	                            </div>
	                            <!-- /.row -->
	                        </div>
	                        <!-- /.panel-heading -->

<!-- ###########################################################################       body	                     -->	                        
	                        <div class="panel-body">
	                            <!-- Nav tabs -->
	                            <ul class="nav nav-tabs">
	<!--                             <ul class="nav nav-pills"> -->
	                                <li class="active">
	                                	<a href="#requestDeatil-pills" data-toggle="tab">Request Detail</a>
	                                </li>
<!-- 	                                <li> -->
<!-- 	                                	<a href="#repairDeatil-pills" data-toggle="tab">Repair Detail</a> -->
<!-- 	                                </li>                                 -->
	                            </ul>

<!-- ###########################################################################       body request detail	                     -->	
	                            <!-- Tab panes -->
	                            <div class="tab-content">
	                                <div class="tab-pane fade in active" id="requestDeatil-pills">
									 
										
										<!-- /.row -->
										<div class="row">
											<div class="col-lg-6">
				                                <div class="form-group">
					                                <p class="help-block"><b>Request Type</b> <i class="fa  fa-asterisk text-red"></i></p>
					                                <select class="form-control" name="requestType.requestType_ID" required>
														 <c:forEach var="item" items="${LOV_REQUESTTYPE}">
													     	<option value="${item.code}" ${item.code == requestBean.requestType.requestType_ID ? 'selected="selected"' : ''}  >${item.descTH}</option>
													    </c:forEach>			
				                                	</select>
				                                </div> 
				                            </div>

		                                    <div class="col-lg-6">
		                                                                    
				                                <div class="form-group">
					                                <p class="help-block"><b>Location / Process</b> <i class="fa  fa-asterisk text-red"></i></p>
														<select class="form-control" name="location.location_ID" required>
															<c:forEach var="item" items="${LOV_LOCATION}">
																<option value="${item.code}" ${item.code == requestBean.location.location_ID ? 'selected="selected"' : ''}  >${item.descTH}</option>
															</c:forEach>				
														</select>
				                                </div>
				                                
			                                </div>					                            
				                            
			                            </div>
			                            <!-- /.row -->                                   
	                            
		                                
		                                <!-- /.row -->
		                                <div class="row">
		                                	<div class="col-lg-12">
				                                <div class="form-group">
				                                    <p class="help-block"><b> Problem Description Before (รายละเอียดปัญหาก่อนแก้ไข) </b> <i class="fa  fa-asterisk text-red"></i></p>
				                                    <textarea class="form-control" rows="4"  id="beforeDetail" name="beforeDetail"></textarea>
				                                </div>
			                                </div>
		                                </div>  
		                                <!-- /.row -->  
		                                
		                                <!-- /.row -->
		                                <div class="row">
		                                	<div class="col-md-12">
		                                	
<!-- 		                                	<fieldset > -->
				                                <div class="form-group">
				                                    <p class="help-block"><b> Problem Picture Before (รูปภาพปัญหาก่อนการแก้ไข) </b></p>
<!-- 				                                    <input type="file"  name="beforePicture[]" class="form-control-file" id="beforePicture" class="file"   multiple> -->
				                                  	<button type="button" class="btn btn-warning" id="beforePicture" onclick="popupUpload('1')" > 
				                                			<i class="fa fa-upload"></i> Upload File </button>
				                               
				                                </div>
		                                
												
												<!-- <table id="upload-request"class="table table-striped table-bordered" style="width: 100%">
													<thead class="bg-green color-palette">
															<tr>
																<th class="text-center"  width="6%">No</th>
																<th class="text-center">File Name</th>
																<th class="text-center">Date</th>
																<th class="text-center" swidth="10%">Size</th>
																<th class="text-center" width="10%">Download</th>
															</tr>
														</thead>
														 <tbody>
														 
														 
														 </tbody>
													</table> -->
													
													
<!-- 													</fieldset> -->
													
												</div>
					
											</div>

 
		                                <hr>
		                                
		                                
		                                <!-- /.row -->
		                                <div class="row">
		                                	<div class="col-lg-4">

							                    <div class="panel panel-default">
							                        <div class="panel-heading">
							                            <b>Request person</b>
							                        </div>
							                        <div class="panel-body">
							                            <p id="request">${_userProfile.firstNameTh} ${_userProfile.lastNameTh} </p>
							                        </div>
							                        <div class="panel-footer text-right">
<!-- 							                        	<input type="hidden" name="status" value="1"> -->
						                                <button type="button" class="btn btn-success" name="rAction" value="Create" id="" onClick="saveReq();"><i class="fa fa-save"></i> Create Request</button>
<!-- 						                                <a type="reset" class="btn btn-default" href="../pages/index.jsp" role="button" >Cancel</a>  -->
						                                
							                        </div>
							                    </div>

			                                </div>  
			                                
			                                <div class="col-lg-4">
							                    <div class="panel panel-info">
							                        <div class="panel-heading">
							                            <b>Section Approve  (LD Up)</b>
							                        </div>
							                        <div class="panel-body">
							                        	<c:forEach var="ld_user" items="${APPROVE_LD}">
													     	<p  >${ld_user.firstNameTh} ${ld_user.lastNameTh}</p> 
													    </c:forEach>	
							                            
							                        </div>
<!-- 							                        <div class="panel-footer text-right"> -->
<!-- 						                                <button type="button" class="btn btn-default" disabled name="rAction" value=""  ><i class="fa fa-hourglass-half"></i> Wait Approve</button> -->
<!-- 						                                <a type="reset" class="btn btn-default" href="../pages/index.jsp" role="button" >Cancel</a>  -->
<!-- 							                        </div> -->
							                    </div>
			                                </div>

		                                	<div class="col-lg-4">
							                    <div class="panel panel-success">
							                        <div class="panel-heading">
							                            <b>Repair section Approve (ACH  Up)</b>
							                        </div>
							                        <div class="panel-body">
							                           <c:forEach var="ach_user" items="${APPROVE_ACH}">
													     	<p  >${ach_user.firstNameTh} ${ach_user.lastNameTh}</p> 
													    </c:forEach>	
							                        </div>
<!-- 							                        <div class="panel-footer text-right"> -->
<!-- 						                                <button type="button" class="btn btn-default" disabled name="rAction" value=""  ><i class="fa fa-hourglass-half"></i> Wait Approve</button> -->
<!-- 							                        </div> -->
							                    </div>
			                                </div>		
			                                
		                                	 		                                			                                  	                                
		                                </div> 		
		                                
		                                
		                              <div class="row">
									<div class="col-lg-6 text-left">
										<button type="reset"
											onclick="location='${cPath}/request/requested_list.htm'"
											class="btn btn-default" style=" width: 100px; "><i class="fa fa-arrow-circle-left"></i> &nbsp; Back </button>
									</div>
								</div>                      
		                                <!-- /.row -->	
	                                </div>

<!-- ###########################################################################       body repair detail	                     -->	                                
									<!-- /.repairDetail	-->
	                            </div>
	                        </div>
	                        <!-- /.panel-body -->
	                        
	                        <!-- /.panel-Footer -->
	                         <div class="panel-footer">
                                <div class="row">
                                	<div class="col-lg-4">
                                		<p class="help-block"><b><spring:message code="repair.footer.detail"/></b></p>
                                	</div>
                                	<div class="col-lg-5">
                                	</div>
                                	<div class="col-lg-3">
                                		<p class="help-block" align="right"><b><spring:message code="repair.footer.version"/></b></p>
                                	</div>
                                </div>
	                        </div>
	                        <!-- /.panel-Footer -->
	                        
	                    </div>
	                    <!-- /.panel -->
	                </div>
	                <!-- /.col-lg-8 -->
	                
<!-- 	                <div class="col-lg-1"> -->
	            	
<!-- 	            	</div>    -->
	                             
	            </div>
	        
			<input type="hidden" id="tempFileId" name="fileId">

	</form>	

</section>
</div>	

<script type="text/javascript">

	function updateTime() {
		  $('#request_ID').val("PE"+moment().format('YYYYMM')+"****");
		  $('#informDate').val(moment().format('YYYY-MM-DD'));
		  $('#informTime').val(moment().format('H:mm:ss'));
	}
	
$(function() {
//		getDataUser();
	
    updateTime();
	setInterval(updateTime, 1000);
	
	
});


function saveReq(){
	 
	
	var beforeDetail = $('#beforeDetail').val();
	if(beforeDetail.trim() == "" ){
		alert("กรุณาระบุรายละเอียดปัญหาก่อนแก้ไข");
		$('#beforeDetail').focus();
		return false;
	}
	
	
//		console.log(jsonObj);

	 bootbox.confirm({
		    title: "Confirm",
		    size: 'small',
		    message: "Confirm create new request?",
		    buttons: {
		        cancel: {
		            label: '<i class="fa fa-times"></i> Cancel',
		            className: 'btn-danger'
		        },
		        confirm: {
		            label: '<i class="fa fa-check"></i> Confirm',
		            className: 'btn-success'
		        }
		    },
		    callback: function (result) {
		        if(result){
		        	
		        	$("#tempFileId").val(_UPLOAD_FILE.uploadTempId.join());
		        	
		        	 _loader(true);
		        	 
		        	$("#myForm").submit();
				 
		        }
		    }
		}); 
//		alert(ItemForm);
};



function popupUpload(type) {
	
	_UPLOAD_FILE.uploadNew(null,1);
	
}


var fileTable = $('#upload-request').DataTable({
	autoWidth: false,
	"searching": false,
	"paging":   false,
	"info":   false,
	data:[],
    columns: [
		{
			"data" : "id",
			"fnCreatedCell" : function(nTd, sData,
					oData, iRow, iCol) {
				var txt = iRow;
				$(nTd).html(txt + 1);
			}
		},    	
		{ "data": "fileName" }, 
		{ "data": "createDateStr" }, 
		{ "data": "fileSize" }, 
		{ 
     		"data": "id"
	        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
	        	 var txt = '<button type="button" class="btn btn-info btn-sm" data-toggle="modal" '
	        	 	+' onclick="downloadFile('+ oData.id +')"> <i class="fa fa-download"></i> Download </button>';
	            $(nTd).html(txt);
	        } 
        } 
//			,{ 
//	     		"data": "id"
//		        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
//		        	 var txt = '<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" '
//		        		 + 'onclick="deleteFile('+ oData.id+')"> <i class="fa fa-trash"></i> Delete </button>';
//		            $(nTd).html(txt);
//		        } 
//         }
    ],
      "aoColumnDefs": [
      { "sClass": "text-center", "aTargets": [0,2,3,4,5] },
    ],
    rowCallback: function (row, data) {}, 
    ordering: false, 
	 destroy: true 
 });
  
  

</script>
</body>

<%@ include file="requested_upload_new.jsp"%>