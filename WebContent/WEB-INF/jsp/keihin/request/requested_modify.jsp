 <!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>

<!-- blueimp Gallery styles -->
<link rel="stylesheet" href="${cPath}/resources/jFileupload/css/blueimp-gallery.min.css">
<link rel="stylesheet" href="${cPath}/resources/jFileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="${cPath}/resources/jFileupload/css/jquery.fileupload-ui.css">
<!-- CSS adjustments for browsers with JavaScript disabled -->
<noscript><link rel="stylesheet" href="${cPath}/resources/jFileupload/css/jquery.fileupload-noscript.css"></noscript>
<noscript><link rel="stylesheet" href="${cPath}/resources/jFileupload/css/jquery.fileupload-ui-noscript.css"></noscript>
    
    <link href="${cPath}/resources/css/dataTables.checkboxes.css" rel="stylesheet" />


<%--     <script src="${cPath}/resources/js/dataTables.bootstrap.min.js"></script> --%>
    <script src="${cPath}/resources/js/dataTables.checkboxes.min.js"></script>
    
    
<style>
.question{
 	text-decoration: underline; 
 }
</style>

<div class="content-wrapper">
		
		<section class="content-header">
			<h1 class="page-header">Repair/Rebuild Request</h1>
		</section> 
		
  <section class="content">
		 
	<form action="${cPath}/request/request_save.htm" method="post" id="myForm" data-toggle="validator" >

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
							                    <input type="text" class="form-control" placeholder="" name="request_ID" id="request_ID" value="${requestObj.request_ID}" readonly>
		                                	</div>                          			
	                            		</div>
	                            	</div>
	                            	
	                            	<div class="col-lg-4">
		                                <div class="form-group">
	                            			<div class="col-lg-5">
		                                		<p class="help-block"><b>Request Date</b></p>
		                                	</div>
		                                	<div class="col-lg-7">		                                		
							                    <input type="text" class="form-control" placeholder="" name="informDate" id="informDate" value="${requestObj.informDate}" readonly>
		                                	</div>
	                            		</div>
	                            	</div>
	                            	
	                            	<div class="col-lg-4">
	                            		<div class="col-lg-5">
	                                		<p class="help-block"><b>Request Time</b></p>
	                                	</div>
	                                	<div class="col-lg-7">		                                		
						                    <input type="text" class="form-control" placeholder="" name="informTime" id="informTime" value="${requestObj.informTime}" readonly>
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
		                                		<p class="help-block"><b>Request by</b></p>
		                                	</div>
		                                	<div class="col-lg-7">		                                		
							                    <input type="text" class="form-control" placeholder="" name="createBy" id="requestBy" value="${requestObj.requestBy}" readonly>
		                                	</div>                            			
	                            		</div>
	                            	</div>
	                            	
	                            	<div class="col-lg-4">
	                            		<div class="col-lg-5">
	                                		<p class="help-block"><b>Section</b></p>
	                                	</div>
	                                	<div class="col-lg-7">		                                		
						                    <input type="text" class="form-control" placeholder="" name="section_name" id="section_name" value="${requestObj.section.section_name}" readonly>
<!-- 						                    <input type="hidden" name="section_ID" value=""> -->
	                                	</div>
	                            	</div>
	                            	
	                            	<div class="col-lg-4">
	                            		<div class="col-lg-5">
	                                		<p class="help-block"><b>Request Status</b></p>
	                                	</div>
	                                	<div class="col-lg-7">		                                		
						                    <input type="text" class="form-control" placeholder="" name="status" id="status" value="${requestObj.status_name}" readonly>
<!-- 	                                		<input type="hidden" name="status" value=""> -->
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
	                                <li  id="tab1" class="active">
	                                	<a href="#requestDeatil-pills" data-toggle="tab" id="tab1_l">Request Detail</a>
	                                </li>
	                                <li  id="tab2"  style="display:none" >
	                                	<a href="#repairDeatil-pills"  data-toggle="tab" id="tab2_l" >Repair Detail</a>
	                                </li>                                
	                            </ul>

<!-- ###########################################################################       body request detail	                     -->	
	                            <!-- Tab panes -->
	                            <div class="tab-content">
	                            
	                                <div class="tab-pane fade in active" id="requestDeatil-pills">
									 
										
										<!-- /.row -->
										<div class="row">
											<div class="col-lg-6">
				                                <div class="form-group">
					                                <p class="help-block question"><b>Request Type</b></p>
					                                <select class="form-control" name="requestType.requestType_ID" disabled>
														 <c:forEach var="item" items="${LOV_REQUESTTYPE}">
													     	<option value="${item.code}" ${item.code == requestObj.requestType.requestType_ID ? 'selected="selected"' : ''}  >${item.descTH}</option>
													    </c:forEach>			
				                                	</select>
				                                </div> 
				                            </div>

		                                    <div class="col-lg-6">
		                                                                    
				                                <div class="form-group">
					                                <p class="help-block question"><b>Location / Process</b></p>
														<select class="form-control" name="location.location_ID" disabled>
															<c:forEach var="item" items="${LOV_LOCATION}">
																<option value="${item.code}" ${item.code == requestObj.location.location_ID ? 'selected="selected"' : ''}  >${item.descTH}</option>
															</c:forEach>				
														</select>
				                                </div>
				                                
			                                </div>					                            
				                            
			                            </div>
			                         
		                                <!-- /.row -->
		                                <div class="row">
		                                	<div class="col-lg-12">
				                                <div class="form-group">
				                                    <p class="help-block question"><b> Before Problem Description (รายละเอียดปัญหาก่อนแก้ไข) </b></p>
				                                    <textarea   class="form-control" rows="3" name="beforeDetail" disabled>${requestObj.beforeDetail}</textarea>
				                                </div>
			                                </div>
		                                </div>  
		                                <!-- /.row -->  
		                                
		                                <!-- /.row -->
		                               <!--  <div class="row">
		                                	<div class="col-lg-6">
				                                <div class="form-group">
				                                    <p class="help-block question"><b> Before Picture Problem (รูปภาพปัญหาก่อนการแก้ไข) </b></p>
				                                <button type="button" class="btn btn-warning"  onclick="popupUpload('1')" > 
				                                <i class="fa fa-upload"></i> Upload File </button>
				                                </div>
			                                </div>    	                                
		                                </div>   -->
		                                <!-- /.row --> 
		                                
		                                
						<div class="row">
							<div class="col-md-12">
								 <div class="form-group">
								 	<p class="help-block question"><b> Before Picture Problem (รูปภาพปัญหาก่อนการแก้ไข) </b></p>
								 	 	<button type="button" class="btn btn-info" id="beforePicture" onclick="popupUpload('1')" > 
					                	<i class="fa fa-upload"></i> View Upload File </button>
								 </div>
							<!-- <table id="upload-request-view"class="table table-striped table-bordered" style="width: 100%">
								<thead class="bg-green color-palette">
										<tr>
											<th class="text-center"  width="6%">No</th>
											<th class="text-center">File Name</th>
											<th class="text-center">Date</th>
											<th class="text-center" swidth="10%">Size</th>
											<th class="text-center" width="10%">Download</th>
										</tr>
									</thead>
									  
								</table> -->
							</div>

						</div>
		                                
<!-- 		                                <hr> -->
		                                
		                                <!-- /.row -->
		                              <div class="row">
		                                   <div class="col-lg-4">

							                    <div class="panel panel-info">
							                        <div class="panel-heading">
							                            <b>Request Person</b>
							                        </div>
							                        <div class="panel-body">
							                            <span id="request">${_userProfile.firstNameTh} ${_userProfile.lastNameTh} </span>
<!-- 							                        	<span class="label label-success pull-right">Create</span> -->
							                        </div>
							                        <div class="panel-footer text-right">
<!-- 							                        	<input type="hidden" name="status" value="1"> -->
						                                <button type="button" class="btn btn-success" disabled  value="Create"  onClick="saveReq();"><i class="fa fa-save"></i> Create Request</button>
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
													     	<span title="${ld_user.email}"  >${ld_user.firstNameTh} ${ld_user.lastNameTh}</span> 
													     	 
<%-- 													     	 ${requestObj.requestStatus} ${requestObj.requestSectionBy} --%>
													     	 
<!-- 													    	<span class="label label-danger pull-right">Cancel</span>  -->

<!-- 													    	<span class="label label-success pull-right">Approve</span> -->

													    </c:forEach>	
							                            
							                        </div>
							                        <div class="panel-footer text-right">
							  		                      <button type="button" class="btn btn-danger"  disabled id="cn_ld_btn" onclick="actionApprove(99);"><i class="fa fa-ban"></i>&nbsp; Cancel </button>
														&nbsp;&nbsp;
						                                <button type="button" class="btn btn-success"  disabled  id="approve_ld_btn"  onclick="actionApprove(2);"><i class="fa fa-check-square-o"></i> Approve</button>
<!-- 						                                <a type="reset" class="btn btn-default" href="../pages/index.jsp" role="button" >Cancel</a>  -->
							                        </div>
							                    </div>
			                                </div>

		                                	<div class="col-lg-4">
							                    <div class="panel panel-info">
							                        <div class="panel-heading">
							                            <b>Repair Section Approve (ACH  Up)</b>
							                        </div>
							                        <div class="panel-body">
							                           <c:forEach var="ach_user" items="${APPROVE_ACH}">
													     	<span title="${ach_user.email}" >${ach_user.firstNameTh} ${ach_user.lastNameTh}</span> 
													    </c:forEach>	
							                        </div>
							                        <div class="panel-footer text-right">
									                     <button type="button" class="btn btn-danger"  disabled id="cn_ach_btn"  onclick="actionApprove(99);"><i class="fa fa-ban"></i>&nbsp; Cancel </button>
														&nbsp;&nbsp;
						                                <button type="button" class="btn btn-success" disabled  id="approve_ach_btn"  onclick="actionApprove(3);" ><i class="fa  fa-check-square-o"></i> Approve</button>
							                       
							                       
							                        </div>
							                    </div>
			                                </div>		
			                                
		                                	 		                                			                                  	                                
		                                </div> 		
		                                
		                                	                                
		                                <!-- /.row -->	
	                                </div>

<!-- ###########################################################################       body repair detail	  -->	                                
									<!-- /.repairDetail	-->
	                                <div class="tab-pane fade" id="repairDeatil-pills">
	                                	
	                                	<!-- /.row -->
<!-- 										<div class="row"> -->
<!-- 											<div class="col-lg-12"> -->
<!-- 											<br> -->
<!-- 											</div> -->
<!-- 										</div> -->
										
										<!-- /.row -->
										<div class="row">
											<div class="col-lg-9">
				                                <div class="form-group">
					                                <p class="help-block question"><b>ตรวจสอบเครื่องมือและเครื่องจักรก่อนการซ่อม  (Check Tooling and Machine before  Repaired)</b> 
					                                 <i class="fa  fa-asterisk text-red"></i></p>		
													<c:forEach var="item" items="${LOV_CHECKTOOLBEFORE}">
														<input type="checkbox" name="checkToolBefore_IDChk" value="${item.code}" ${ fn:indexOf(requestObj.checkToolBefore_ID,item.code)>=0 ? 'checked' : ''} >&nbsp; ${item.descTH}  &nbsp; 
													</c:forEach>	
				                                </div> 
				                            </div>
			                            </div>
			                            <!-- /.row -->  
			                            
		                                <!-- /.row -->
		                                <div class="row">
		                                	<div class="col-lg-9">
				                                <div class="form-group">
				                                    <p class="help-block question"><b> After  Description Correction (รายละเอียดการแก้ไข) </b></p>
				                                    <textarea class="form-control" rows="3" name="afterDescription">${requestObj.afterDescription}</textarea>
				                                </div>
			                                </div>

											<div class="col-lg-3">
				                                <div class="form-group">
				                                    <p class="help-block question"><b> Attach Files (เอกสารแนบ) </b></p>
				                                     <label class="radio-inline">
		                                                <input type="radio" name="attachFile" id="attachfileYes"
		                                                 value="1"  ${'1'== requestObj.attachFile ? 'checked' : ''} >มี (Yes)
		                                            </label>
		                                            <label class="radio-inline">
		                                                <input type="radio" name="attachFile" id="attachfileNo"  
		                                                 value="0"  ${null== requestObj.attachFile||'0'== requestObj.attachFile ? 'checked' : ''} >ไม่มี (No)
		                                            </label>		                                            
				                                </div>
			                                </div>
			                                
		                                </div>  
		                                <!-- /.row --> 
		                                
		                                <!-- /.row -->
		                                <div class="row">
		                                	<div class="col-lg-6">
				                                <div class="form-group">
				                                    <p class="help-block question"><b> After  Picture Problem (รูปภาพปัญหาหลังการแก้ไข) </b></p>
<!-- 				                                    <input type="file" class="form-control-file" id="afterPicture"> -->
				                                     <button  type="button" class="btn btn-warning" id="afterPicture" onclick="popupUpload('2')" > 
				                                			<i class="fa fa-upload"></i> Upload File</button>
				                                	 
				                                     <button  type="button" class="btn btn-info" id="afterPictureViewBtn" onclick="popupUpload('2')" > 
				                                			<i class="fa fa-upload"></i> View Upload File </button>
				                                	 
				                               
				                                </div>
			                                </div>    	                                
		                                </div>  
		                                <!-- /.row --> 	

		                                <!-- /.row -->
		                                <div class="row">
		                                	<div class="col-lg-12">
		                                		<div class="form-group">
			                                		<p class="help-block question"><b> เวลาที่ใช้ในการซ่อม  </b> <i class="fa  fa-asterisk text-red"></i></p>
			                                        <div class="col-md-4">
								                        <div class="form-group input-group">
								                            <span class="input-group-addon">Start(เริ่ม)</span>
								                            <input type="time" class="form-control text-right" required value="${requestObj.startTime}"
								                            placeholder="Start(เริ่ม)" name="startTime" id="timeStart" onchange="calTime()" >										                        		                        
								                        </div>		                                            
			                                        </div>
			                                        
			                                        <div class="col-md-4">
								                        <div class="form-group input-group">
								                            <span class="input-group-addon bg-danger">Complete(เสร็จสิ้น)</span>
								                            <input type="time" class="form-control text-right" required value="${requestObj.finishTime}"
								                            placeholder="Complete(เสร็จสิ้น)" name="finishTime" id="timeFinish"   onchange="calTime()" >										                        		                        
								                        </div>
			                                        </div>
			                                        
					                                <div class="col-md-4">
								                        <div class="form-group input-group">
								                            <span class="input-group-addon">Total(รวม)</span>
								                            <input type="text" class="form-control text-right" placeholder="Total(รวม)" name="totalTime" id="totalTime" value="" readonly>										                        		                        
								                        	<span class="input-group-addon">Minutes</span>
								                        </div>	
			                                        </div>
		                                        
		                                        </div>
		                                         
			                                </div>			                                    	                                
		                                </div>  
		                                <!-- /.row --> 
		                
	<script>
	
	function calTime() {
		
	  //alert("Input field lost focus.");
	  var tim1 = $('#timeStart').val();
	  var tim2 = $('#timeFinish').val();
	  
	// parse time using 24-hour clock and use UTC to prevent DST issues
	  var start = moment.utc(tim1, "HH:mm");
	  var end = moment.utc(tim2, "HH:mm");
	 var minutes = end.diff(start, 'minutes');
	  if(minutes>=0){
		  var duration = moment.duration(minutes, 'minutes');
		  if(minutes>60){
			    $('#totalTime').val(duration.format("H:mm"));
		  }else{
			  $('#totalTime').val(minutes);
		  }
	  }
	     
	}
	
// 	calTime();
	
	</script>		
			                                       
		                                <!-- /.row -->
		                                <div class="row">
		                                	<div class="col-lg-12">
		                                		<p class="help-block question"><b> รายละเอียดการใช้อะไหล่  </b> </p>	
		                                	</div>
		                                </div>
		                                <!-- /.row --> 


		                                <!-- /.row -->
		                                <div class="row" >
		                                	<div class="col-lg-12">
		                                	
										<div class="table-title">
							                <div class="row">
							                    <div class="col-sm-12"  >
							                    	<button type="button" class="btn btn-info add-new" id="btnnewPart" onclick="popupAddpart()"><i class="fa fa-plus"></i> Add Part</button>                     	 
							                    	&nbsp;<button type="button" class="btn btn-danger" id="btnDelPart" onclick="popupDelpart()"><i class="fa fa-trash-o"></i> Delete Part</button>                     	 
							                    </div>                    
							                </div>
							            </div>
						 
						 
						 
								<%@ include file="requested_add_part.jsp"%> 
	
					
						 
									<table id="part-table" class="table table-striped table-hover table-bordered">
						                <thead class="bg-green color-palette">
						                    <tr>
						                        <th>#</th>
						                        <th>Part ID</th>
						                        <th>Part Name</th>
												<th>Qty</th>
						                        <th>Price</th>
						                        <th>Other Cost</th>
						                        <th>Total Cost</th>
						                        <th>Actions</th>
						                    </tr>
						                </thead>
						             </table>
						             
						             
                               		</div>
                               </div>

										<!-- /.row -->
		                                										
										<hr>		                                
		                                <!-- /.row -->
		                                <div class="row">
		                                
											<div class="col-lg-6">
		                                		<div class="form-group">
				                                	<p class="help-block question"><b> ประเภทการซ่อม  </b>  <i class="fa  fa-asterisk text-red"></i></p>
				                                	
				                                			<c:forEach var="item" items="${LOV_MAINTENANCETYPE}">
																<input type="radio" name="maintenanceType" value="${item.code}" ${item.code == requestObj.maintenanceType ? 'checked' : ''} >&nbsp; ${item.descTH} &nbsp;  
															</c:forEach>

				                                </div>
			                                </div>

											<div class="col-lg-6">
				                                <div class="form-group ">
					                                <p class="help-block question"><b> การตรวจสอบเครื่องมือและเครื่องจักรหลังการซ่อม  (Check Tooling and Machine after  Repaired) </b></p>
															<c:forEach var="item" items="${LOV_CHECKTOOLAFTER}">
																<input type="checkbox" name="checkToolAfter_IDChk" value="${item.code}" ${ fn:indexOf(requestObj.checkToolAfter_ID,item.code)>=0 ? 'checked' : ''} >&nbsp; ${item.descTH}  &nbsp; 
															</c:forEach>
				                                </div> 
				                            </div>
		                                </div>  
		                                <!-- /.row --> 
		                                
		                                <!-- /.row -->
		                                <div class="row">
		                                	<div class="col-lg-6">
				                                <div class="form-group">
				                                    <p class="help-block question"><b> Comment After Repair/Rebuild </b></p>
				                                    <textarea class="form-control" rows="4" name="afterComment">${requestObj.afterComment}</textarea>
				                                </div>
			                                </div>

		                                	<div class="col-lg-6">
		                                			<div class="form-group">
		                                				<p class="help-block question"><b> กรณีที่มีความเกี่ยวข้องด้านคุณภาพให้แผนก QA ร่วมตรวจเช็คด้วย </b></p>
		                                				<label class="radio-inline">
		                                                    <input type="radio" name="concernQA" id="concernQA" value="1"  ${'1'== requestObj.concernQA ? 'checked' : ''}>เกี่ยวข้อง
		                                                </label>
		                                                <label class="radio-inline">
		                                                    <input type="radio" name="concernQA" id="concernQA" value="0" ${(null== requestObj.concernQA ||'0'== requestObj.concernQA) ? 'checked' : ''} >ไม่เกี่ยวข้อง
		                                                </label>
		                                			</div>
		                                		
		                                		
					                                <div  class="form-group" id="concernQA-form" style="display: none;" >
					                                    <p class="help-block question"><b> ความเห็นสำหรับ QA </b></p>
															<c:forEach var="item" items="${LOV_JUDMENT}">
																<input disabled type="radio" name="confirmJudment" value="${item.code}" ${item.code== requestObj.confirmJudment ? 'checked' : ''}>&nbsp; ${item.descTH}  &nbsp; 
															</c:forEach>
					                                </div>
					                                
					                                
					                                
			                                </div>	   		                                
			                                
		                                </div>  
		                                <!-- /.row --> 

										<hr>	
											                             
		                                <!-- /.row -->
		                                <div class="row" >
		                                	<div class="col-lg-12">
 
 		                                	</div>
		                                </div>
		                                
		                               
		                            
<!-- ###########################################################################       approve	                     -->			                                
		                                <!-- /.row -->
		                                <div class="row">
		                                	<div class="col-lg-3">
							                    <div class="panel panel-info">
							                        <div class="panel-heading">
							                            <b>Repair Person</b>
							                        </div>
							                        <div class="panel-body">
							                            <c:forEach var="ld_user" items="${ROLE_MT_STAFF}">
													     	<p  title="${ld_user.email}"  >${ld_user.firstNameTh} ${ld_user.lastNameTh}</p> 
													    </c:forEach>	
							                        </div>
							                        <div class="panel-footer text-right">
						                                <button type="button" disabled class="btn btn-success" id="approve_btn_4"  onclick="actionApprove(4);"><i class="fa  fa-check-square-o"></i> Approve</button>
<!-- 						                                <a type="reset" class="btn btn-default" href="../pages/index.jsp" role="button" >Cancel</a>  -->
							                        </div>
							                    </div>	
			                                </div> 
			                                
		                                	<div class="col-lg-3">
							                    <div class="panel panel-info">
							                        <div class="panel-heading">
							                            <b>Request Section (LD up)</b>
							                        </div>
							                        <div class="panel-body">
							                           <c:forEach var="ld_user" items="${APPROVE_LD}">
													     	<p   title="${ld_user.email}" >${ld_user.firstNameTh} ${ld_user.lastNameTh}</p> 
													    </c:forEach>	
							                        </div>
							                        <div class="panel-footer text-right">
							                       	 <button type="button" disabled class="btn btn-danger"  id="cn_btn_5"  onclick="actionApprove(99);"><i class="fa fa-ban"></i>&nbsp; Cancel </button>
														&nbsp;&nbsp;
						                                <button type="button" disabled class="btn btn-success" id="approve_btn_5" value="" onclick="actionApprove(5);"><i class="fa  fa-check-square-o"></i> Approve</button>
<!-- 						                                <a type="reset" class="btn btn-default" href="../pages/index.jsp" role="button" >Cancel</a>  -->
							                        </div>
							                    </div>
			                                </div>			                                

		                                	<div class="col-lg-3" id="appQA-form" style="display: none;">
							                    <div class="panel panel-info">
							                        <div class="panel-heading">
							                            <b>QA Approve</b>
							                        </div>
							                        <div class="panel-body">
							                            <c:forEach var="ld_user" items="${ROLE_QA}">
													     	<p   title="${ld_user.email}" >${ld_user.firstNameTh} ${ld_user.lastNameTh}</p> 
													    </c:forEach>	
							                        </div>
							                        <div class="panel-footer text-right">
							                        	<button type="button" disabled class="btn btn-danger"  id="cn_btn_6"  onclick="actionApprove(99);"><i class="fa fa-ban"></i>&nbsp; Cancel </button>
														&nbsp;&nbsp;
						                                <button type="button" disabled class="btn btn-success" name="" id="approve_btn_6" onclick="actionApprove(6);"><i class="fa  fa-check-square-o"></i> Approve</button>
<!-- 						                                <a type="reset" class="btn btn-default" href="../pages/index.jsp" role="button" >Cancel</a>  -->
							                        </div>
							                    </div>
			                                </div>

		                                	<div class="col-lg-3">
							                    <div class="panel panel-info">
							                        <div class="panel-heading">
							                            <b>Repair Section (ACH up)</b>
							                        </div>
							                        <div class="panel-body">
							                           <c:forEach var="ach_user" items="${APPROVE_ACH}">
													     	<p   title="${ach_user.email}" >${ach_user.firstNameTh} ${ach_user.lastNameTh}</p> 
													    </c:forEach>	
							                        </div>							                        
							                        <div class="panel-footer text-right">
							                        	<button type="button" disabled class="btn btn-danger"  id="cn_btn_7"   onclick="actionApprove(99);"><i class="fa fa-ban"></i>&nbsp; Cancel </button>
														&nbsp;&nbsp;
						                                <button type="button" disabled class="btn btn-success"  id="approve_btn_7" value="" onClick="actionApprove(7);"><i class="fa  fa-check-square-o"></i> Approve</button>
							                        </div>
							                    </div> 
			                                </div>	
			                                
			                             </div>	
			                             <!-- /.row -->	  		                                			                             	                                    
	                                </div>                                
	                                
	                                </div>
	                                
	                                
	                                 <div class="row">
									<div class="col-lg-6 text-left">
										<button type="reset"
											onclick="location='${cPath}/request/requested_list.htm'"
											class="btn btn-default" style=" width: 100px; "><i class="fa fa-arrow-circle-left"></i> &nbsp; Back </button>
									</div>
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
	                             
<!-- 	            </div> -->
<!-- 	        </div> -->
	        <!-- /#page-wrapper -->
	       
	    </div>
	    <!-- /#wrapper -->
	 

		<input type="hidden" name="requestStatus" id="requestStatus"  >
		<input type="hidden" name="checkToolBefore_ID" id="checkToolBefore_ID"  >
		<input type="hidden" name="checkToolAfter_ID" id="checkToolAfter_ID"  >
<%-- 		<input type="hidden" name="requestStatus" value="${requestObj.requestStatus}"> --%>
		
	</form>	

</section>

</div>	


</body>



<script type="text/javascript">
 
var reqStatus = "${requestObj.requestStatus}";
var reqId = "${requestObj.request_ID}";
var jsonObj = { "request_ID" : reqId };
var appVrole = "";

$(function() {

	var isQA = $("input[name='concernQA']:checked").val();
	
// 	console.log("isQA :"+isQA);
	
	if(reqStatus>=3){
		$('#tab2').show();
		$('#tab2_l').tab('show');
	}
	
	if(reqStatus>3){
		$("input,textarea").prop('readonly', true);
		$("input[type='radio'],input[type='checkbox']").prop('disabled', true);
		$("#btnnewPart,#afterPicture").hide();
	}else{
		$("#afterPictureViewBtn").hide();
	}

	if("1"==reqStatus){
		$('#approve_ld_btn,#cn_ld_btn').prop('disabled', false);
// 		$('#tab1_l').tab('show');
	}else if("2"==reqStatus){
		$('#approve_ach_btn,#cn_ach_btn').prop('disabled', false);
// 		$('#tab1_l').tab('show');
	}else if("3"==reqStatus){
		$('#approve_btn_4,#cn_btn_4').prop('disabled', false);
// 		$('#tab2').show();
// 		$('#tab2_l').tab('show');
	}else if("4"==reqStatus){
		$('#approve_btn_5,#cn_btn_5').prop('disabled', false);
// 		$('#tab2').show();
	}else if("5"==reqStatus){
// 		$('#tab2').show();
		if(isQA=="1"){
			$("input[name='confirmJudment']").prop('disabled', false);
			$('#approve_btn_6,#cn_btn_6').prop('disabled', false);
		}else{
			$('#approve_btn_7,#cn_btn_7').prop('disabled', false);
		}
	}else if("6"==reqStatus){
	
		$('#approve_btn_7,#cn_btn_7').prop('disabled', false);
	}
	
	if(isQA=="1"){
		if(reqStatus>=5){
			$('#concernQA-form').show();
		}
		$('#appQA-form').show();
	}
	
	
	$("input[name='concernQA']") .change(function(){ 
    	 if($(this).is(":checked") ){  
             var val = $(this).val(); // retrieve the value
             if(val=="1"){
//          		$('#concernQA-form').show();
         		$('#appQA-form').show();
         	 }else{
//          		$('#concernQA-form').hide();
         		$('#appQA-form').hide();
         	 }
         }
    });

	
	calTime();
	loadPart();
	
});

function getActionColumn(oData,iRow) {
 	var htm = '<button type="button" onclick="openModaledituser(\''+ iRow +'\')" class="btn btn-warning btn-action">Edit</button>  ' ;
 	 htm += ' <button type="button" onclick="doDelete(\''+ oData.emp_id  +'\', \''+ oData.emp_no  +'\')" class="btn btn-danger btn-action">Delete</button>  ' ;
		return htm;
}

 

var PART_TABLE = $('#part-table').DataTable({
	autoWidth: false,
	data:[],
    columns: [
		{ "data": "part_ID" }, 
		{ "data": "part_ID" }, 
		{ "data": "part_Name" }, 
		{ "data": "part_qty" }, 
		{ "data": "part_price"
			,"render": function ( data, type, row ) {
	            return data.toFixed(2);
	        }
		 }, 
		{ "data": "other_cost" 
			,"render": function ( data, type, row ) {
	            return data.toFixed(2);
	        }
		}, 
		{ "data": "total_cost" 
			,"render": function ( data, type, row ) {
                return data.toFixed(2);
            }
		}, 
		{ 
     		"data": "part_ID","sWidth": "100px"
	        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
	        	$(nTd).html(getActionColumn(oData,iRow));
// 	        	 var txt = '<button type="button" class="btn btn-info btn-sm" data-toggle="modal" '
// 	        	 	+' onclick="downloadFile('+ oData.id +')"> <i class="fa fa-download"></i> Download </button>';
// 	            $(nTd).html(txt);
	        } 
        }
    ],
      "aoColumnDefs": [
      { "sClass": "text-center", "aTargets": [0,1,3,4,5,6,7] }
      ,{
          'targets': 0,
          'checkboxes': true
       }
    ],
    rowCallback: function (row, data) {}, 
    ordering: false, 
	destroy: true,
	autoWidth: false,
	"searching": false,
	"paging":   false
// 	"info":   false
 });

function loadPart(){
	$.ajax({
        url: cPath+"/request/getRepairPart.json",
        data: {request_ID : reqId}
    }).done(function (result) {
    	PART_TABLE.clear().draw();
        if(result.recordsTotal>0){
            PART_TABLE.rows.add(result.data).draw();
        }
      }).fail(function (jqXHR, textStatus, errorThrown) { 
            // needs to implement if it fails
      });
	
}


	
function popupUpload(type) {
	
// 	$('#uploadViewModal').modal('show');

// 	console.log(reqId,type);
	
	/**call method in modal*/
	if(reqStatus==3){
		_UPLOAD_FILE.uploadNew(reqId,type);
	}else{
		_UPLOAD_FILE_VIEW.loadFile(reqId,type);
	}
	
	
	 
}


function downloadFile (id){
	window.open( cPath+"/fileUpload/get/"+id , "_blank");
}

function actionApprove(level){
	 
	
	if("3"==reqStatus ){
		
		if ($('input[name=checkToolBefore_IDChk]:checked').length == 0) {
			alert("กรุณาระบุ ตรวจสอบเครื่องมือและเครื่องจักรก่อนการซ่อม");
			$('input[name=checkToolBefore_IDChk]').focus();
			return false;
		}
		
		  //alert("Input field lost focus.");
		  var tim1 = $('#timeStart').val();
		  var tim2 = $('#timeFinish').val();
		if (tim1.trim()=='' || tim2.trim()=='') {
			alert("กรุณาระบุ เวลาที่ใช้ในการซ่อม");
			if(tim1.trim()=='')
			$('#timeStart').focus();
			$('#timeFinish').focus();
			return false;
		}
		
		if ($('input[name=maintenanceType]:checked').length == 0) {
			alert("กรุณาระบุ ประเภทการซ่อม ");
			$('input[name=maintenanceType]').focus();
			return false;
		}
		
		var checkToolBefore_IDarr = [];
		var checkToolAfter_IDarr = [];
		
	
		$. each($("input[name='checkToolBefore_IDChk']:checked"), function(){
			checkToolBefore_IDarr.push($(this).val());
		});
		
		$. each($("input[name='checkToolAfter_IDChk']:checked"), function(){
			checkToolAfter_IDarr.push($(this). val());
		});
	 
		$('#checkToolBefore_ID').val(checkToolBefore_IDarr.join());
		$('#checkToolAfter_ID').val(checkToolAfter_IDarr.join());
		
		
// 		console.log(checkToolAfter_IDarr);
// 		console.log(checkToolAfter_IDarr);
	}
	
	var isQA = $("input[name='concernQA']:checked").val();
	if("5"==reqStatus&&isQA=="1"){
		if ($('input[name=confirmJudment]:checked').length == 0) {
			alert("กรุณาระบุ ความเห็นสำหรับ QA ");
			$('input[name=confirmJudment]').focus();
			return false;
		}
	}
		
		
	
		var statustxt =  (level=="99")? "Cancel" : "Approve" ;
		
		$('#requestStatus').val(level);
		
		
		bootbox.confirm({
 		    title: "Confirm",
 		    size: 'small',
 		    message: "Confirm <b>"+statustxt+"</b> this request?",
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
		        	 
 		        $.ajax({
					method : "POST",
					data : $('#myForm').serialize(),
					url : cPath + "/request/requestUpdate"

				}).done(function(result) {
					
					alert("Save successfully !");
					location = cPath + "/request/requested_edit/"+reqId;


				}).fail(function(jqXHR, textStatus, errorThrown) {
					alert('ERROR');

				});
				 
 		        }
 		    }
 		}); 
		
		
		 
};



	function popupAddpart() {
		$('#addPartModal').modal('show');	
		$('#price,#other_cost,#total_cost').val(0);	
		$('#qty,#part_ID').val('');	
		$('#part_ID').selectpicker("refresh");
		
	}
// 	popupAddpart();


</script>

	<%@ include file="requested_upload_view.jsp"%> 
	
	<%@ include file="requested_upload_new.jsp"%>
	
