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
											<div class="col-lg-12">
											<br>
											</div>
										</div>
										
										<!-- /.row -->
										<div class="row">
											<div class="col-lg-6">
				                                <div class="form-group">
					                                <p class="help-block"><b>Request Type</b></p>
					                                <select class="form-control" name="requestType.requestType_ID" disabled>
														 <c:forEach var="item" items="${LOV_REQUESTTYPE}">
													     	<option value="${item.code}" ${item.code == requestObj.requestType.requestType_ID ? 'selected="selected"' : ''}  >${item.descTH}</option>
													    </c:forEach>			
				                                	</select>
				                                </div> 
				                            </div>

		                                    <div class="col-lg-6">
		                                                                    
				                                <div class="form-group">
					                                <p class="help-block"><b>Location / Process</b></p>
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
				                                    <p class="help-block"><b> Before Problem Description (รายละเอียดปัญหาก่อนแก้ไข) </b></p>
				                                    <textarea   class="form-control" rows="3" name="beforeDetail" disabled>${requestObj.beforeDetail}</textarea>
				                                </div>
			                                </div>
		                                </div>  
		                                <!-- /.row -->  
		                                
		                                <!-- /.row -->
		                                <div class="row">
		                                	<div class="col-lg-6">
				                                <div class="form-group">
				                                    <p class="help-block"><b> Before Picture Problem (รูปภาพปัญหาก่อนการแก้ไข) </b></p>
<!-- 				                                    <input type="file" class="form-control-file" id="beforePicture" > -->
				                                <button type="button" class="btn btn-warning"  onclick="popupUpload('1')" > 
				                                <i class="fa fa-upload"></i> Upload File (Before) </button>
				                                </div>
			                                </div>    	                                
		                                </div>  
		                                <!-- /.row --> 
		                                
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
													     	<p  >${ld_user.firstNameTh} ${ld_user.lastNameTh}</p> 
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
							                    <div class="panel panel-success">
							                        <div class="panel-heading">
							                            <b>Repair section Approve (ACH  Up)</b>
							                        </div>
							                        <div class="panel-body">
							                           <c:forEach var="ach_user" items="${APPROVE_ACH}">
													     	<p  >${ach_user.firstNameTh} ${ach_user.lastNameTh}</p> 
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
										<div class="row">
											<div class="col-lg-12">
											<br>
											</div>
										</div>
										
										<!-- /.row -->
										<div class="row">
											<div class="col-lg-9">
				                                <div class="form-group">
					                                <p class="help-block"><b>ตรวจสอบเครื่องมือและเครื่องจักรก่อนการซ่อม  (Check Tooling and Machine before  Repaired)</b></p>		
 														
															<c:forEach var="item" items="${LOV_CHECKTOOLBEFORE}">
																<input type="radio" name="checkToolBefore_ID" value="${item.code}" ${item.code == requestBean.checkTool.checkTool_ID ? 'selected="selected"' : ''} >&nbsp; ${item.descTH}  &nbsp; 
															</c:forEach>	
															
				                                </div> 
				                            </div>
			                            </div>
			                            <!-- /.row --> 
			                            
		                                <!-- /.row -->
		                                <div class="row">
		                                	<div class="col-lg-9">
				                                <div class="form-group">
				                                    <p class="help-block"><b> After  Description Correction (รายละเอียดการแก้ไข) </b></p>
				                                    <textarea class="form-control" rows="3" name="afterDetail"></textarea>
				                                </div>
			                                </div>

											<div class="col-lg-3">
				                                <div class="form-group">
				                                    <p class="help-block"><b> Attach files (เอกสารแนบ) </b></p>
				                                     <label class="radio-inline">
		                                                <input type="radio" name="attachfile" id="attachfileYes" value="1">มี (Yes)
		                                            </label>
		                                            <label class="radio-inline">
		                                                <input type="radio" name="attachfile" id="attachfileNo" value="0">ไม่มี (No)
		                                            </label>		                                            
				                                </div>
			                                </div>
			                                
		                                </div>  
		                                <!-- /.row --> 
		                                
		                                <!-- /.row -->
		                                <div class="row">
		                                	<div class="col-lg-6">
				                                <div class="form-group">
				                                    <p class="help-block"><b> After  Picture Problem (รูปภาพปัญหาหลังการแก้ไข) </b></p>
<!-- 				                                    <input type="file" class="form-control-file" id="afterPicture"> -->
				                                     <button type="button" class="btn btn-warning" id="afterPicture" onclick="popupUpload('2')" > 
				                                			<i class="fa fa-upload"></i> Upload File (After) </button>
				                                </div>
			                                </div>    	                                
		                                </div>  
		                                <!-- /.row --> 	

		                                <!-- /.row -->
		                                <div class="row">
		                                	<div class="col-lg-12">
		                                		<div class="form-group">
		                                		<p class="help-block"><b> เวลาที่ใช้ในการซ่อม  </b></p>
		                                        <div class="col-md-4">
		                                            
							                        <div class="form-group input-group">
							                            <span class="input-group-addon">Start(เริ่ม)</span>
							                            <input type="text" class="form-control" placeholder="Start(เริ่ม)" name="timeStart" id="timeStart" value="">										                        		                        
							                        </div>		                                            
		                                            
		                                            
		                                        </div>
		                                        
		                                        <div class="col-md-4">
		                                            
							                        <div class="form-group input-group">
							                            <span class="input-group-addon">Complete(เสร็จสิ้น)</span>
							                            <input type="text" class="form-control" placeholder="Complete(เสร็จสิ้น)" name="timeFinish" id="timeFinish" value="" onblur="calTime()" >										                        		                        
							                        </div>
		                                        </div>
		                                        
				                                <div class="col-md-4">
		                                             
							                        <div class="form-group input-group">
							                            <span class="input-group-addon">Total(รวม)</span>
							                            <input type="text" class="form-control" placeholder="Total(รวม)" name="totalTime" id="totalTime" value="" readonly>										                        		                        
							                        	<span class="input-group-addon">Minutes</span>
							                        </div>	
							                        		                                             
		                                        </div>
<script>
function calTime() {
  //alert("Input field lost focus.");
  var tim1 = $('#timeStart').val();
  var tim2 = $('#timeFinish').val();
  var ary1 = tim1.split(':');
  var ary2 = tim2.split(':');
  var minsdiff = parseInt(ary2[0],10)*60+parseInt(ary2[1],10)-parseInt(ary1[0],10)*60-parseInt(ary1[1],10);
  
  var timediff = minsdiff;
	$('#totalTime').val(timediff);
	
  //Convert to Hour
  //alert(String(100+Math.floor(minsdiff/60)).substr(1)+':'+String(100+minsdiff%60).substr(1));
  //var timediff = String(100+Math.floor(minsdiff/60)).substr(1)+':'+String(100+minsdiff%60).substr(1);
	
}
</script>		
		                                        
		                                        </div>
			                                </div>			                                    	                                
		                                </div>  
		                                <!-- /.row --> 

										<hr>
		                                <!-- /.row -->
		                                <div class="row">
		                                	<div class="col-lg-12">
		                                		<p class="help-block"><b> รายละเอียดการใช้อะไหล่  </b></p>	
		                                	</div>
		                                </div>
		                                <!-- /.row --> 


		                                <!-- /.row -->
		                                <div class="row" >
		                                	<div class="col-lg-12">
		                                	
<!-- 		                                	Data Table CRUD -->
<%-- 		                                		<jsp:include page="${cPath}/request/requestWithDataTable.jsp"></jsp:include> --%>
			<div class="table-title">
                <div class="row">
                    <div class="col-sm-12">
                    	<button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i> Add New</button>
                    </div>                    
                </div>
            </div>
			<table class="table table-striped table-hover">
                <thead>
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
                <tbody>
                	<tr>
						<td>
							<span class="custom-checkbox">
								<input type="checkbox" id="checkbox1" name="options[]" value="1">
								<label for="checkbox1"></label>
							</span>
						</td>
                        <td>Part ID</td>
                        <td>Part Name</td>
						<td>Qty</td>
                        <td>Price</td>
                        <td>Other Cost</td>
                        <td>Total Cost</td>
                        <td>
                            <a href="#editPartModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
							<a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                        </td>
                    </tr>
                </tbody>
             </table>
		                                	</div>
		                                </div>

										<!-- /.row -->
		                                										
										<hr>		                                
		                                <!-- /.row -->
		                                <div class="row">
		                                
											<div class="col-lg-4">
		                                		<div class="form-group">
				                                	<p class="help-block"><b> ประเภทการซ่อม  </b></p>
				                                	
				                                			<c:forEach var="item" items="${LOV_MAINTENANCETYPE}">
																<input type="radio" name="maintenanceType" value="${item.code}">&nbsp; ${item.descTH} &nbsp;  
															</c:forEach>
				                                		

				                                </div>
			                                </div>

											<div class="col-lg-8">
				                                <div class="form-group">
					                                <p class="help-block"><b> การตรวจสอบเครื่องมือและเครื่องจักรหลังการซ่อม  (Check Tooling and Machine after  Repaired) </b></p>
															<c:forEach var="item" items="${LOV_CHECKTOOLAFTER}">
																<input type="radio" name="checkToolAfter_ID" value="${item.code}" ${item.code == requestBean.checkTool.checkTool_ID ? 'selected="selected"' : ''} >&nbsp; ${item.descTH}  &nbsp; 
															</c:forEach>
				                                </div> 
				                            </div>
		                                </div>  
		                                <!-- /.row --> 
		                                
		                                <!-- /.row -->
		                                <div class="row">
		                                	<div class="col-lg-6">
				                                <div class="form-group">
				                                    <p class="help-block"><b> Comment After Repair/Rebuild </b></p>
				                                    <textarea class="form-control" rows="4" name="afterComment"></textarea>
				                                </div>
			                                </div>

		                                	<div class="col-lg-6">
		                                		<div class="row">
		                                			<div class="form-group">
		                                				<p class="help-block"><b> ※ กรณีที่มีความเกี่ยวข้องด้านคุณภาพให้แผนก QA ร่วมตรวจเช็คด้วย </b></p>
		                                				<label class="radio-inline">
		                                                    <input type="radio" name="concernQA" id="concernQA" value="1">เกี่ยวข้อง
		                                                </label>
		                                                <label class="radio-inline">
		                                                    <input type="radio" name="concernQA" id="concernQA" value="0">ไม่เกี่ยวข้อง
		                                                </label>
		                                			</div>
		                                		</div>
		                                		
		                                		
				                                <div class="row">
					                                <div class="form-group">
					                                    <p class="help-block"><b> ความเห็นสำหรับ QA </b></p>
															<c:forEach var="item" items="${LOV_JUDMENT}">
																<input type="radio" name="confirmJudment" value="${item.code}" >&nbsp; ${item.descTH}  &nbsp; 
															</c:forEach>
					                                </div>
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
							                    <div class="panel panel-default">
							                        <div class="panel-heading">
							                            <b>Repair person</b>
							                        </div>
							                        <div class="panel-body">
							                            <c:forEach var="ld_user" items="${ROLE_MT_STAFF}">
													     	<p  >${ld_user.firstNameTh} ${ld_user.lastNameTh}</p> 
													    </c:forEach>	
							                        </div>
							                        <div class="panel-footer text-right">
						                                <button type="button" disabled class="btn btn-success" id="approve_btn_4"  onclick="actionApprove(4);"><i class="fa  fa-check-square-o"></i> Approve</button>
<!-- 						                                <a type="reset" class="btn btn-default" href="../pages/index.jsp" role="button" >Cancel</a>  -->
							                        </div>
							                    </div>	
			                                </div> 
			                                
		                                	<div class="col-lg-3">
							                    <div class="panel panel-default">
							                        <div class="panel-heading">
							                            <b>Request section (LD up)</b>
							                        </div>
							                        <div class="panel-body">
							                           <c:forEach var="ld_user" items="${APPROVE_LD}">
													     	<p  >${ld_user.firstNameTh} ${ld_user.lastNameTh}</p> 
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

		                                	<div class="col-lg-3">
							                    <div class="panel panel-default">
							                        <div class="panel-heading">
							                            <b>QA Approve</b>
							                        </div>
							                        <div class="panel-body">
							                            <c:forEach var="ld_user" items="${ROLE_QA}">
													     	<p  >${ld_user.firstNameTh} ${ld_user.lastNameTh}</p> 
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
							                    <div class="panel panel-default">
							                        <div class="panel-heading">
							                            <b>Repair section (ACH up)</b>
							                        </div>
							                        <div class="panel-body">
							                           <c:forEach var="ach_user" items="${APPROVE_ACH}">
													     	<p  >${ach_user.firstNameTh} ${ach_user.lastNameTh}</p> 
													    </c:forEach>	
							                        </div>							                        
							                        <div class="panel-footer text-right">
							                        	<button type="button" disabled class="btn btn-danger"  id="cn_btn_7"   onclick="actionApprove(99);"><i class="fa fa-ban"></i>&nbsp; Cancel </button>
														&nbsp;&nbsp;
						                                <button type="button" disabled class="btn btn-success"  id="approve_btn_7" value="" onClick="actionApprove(7);"><i class="fa  fa-check-square-o"></i> Approve</button>
<!-- 						                                <a type="reset" class="btn btn-default" href="../pages/index.jsp" role="button" >Cancel</a>  -->
							                        </div>
							                    </div>
			                                </div>	
			                             </div>	
			                             <!-- /.row -->	  		                                			                             	                                    
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
	 

	</form>	

</section>

</div>	


</body>



<script type="text/javascript">
 
var reqStatus = "${requestObj.requestStatus}";
var reqId = "${requestObj.request_ID}";
var jsonObj = { "request_ID" : reqId };

$(function() {

	if("1"==reqStatus){
		$('#approve_ld_btn,#cn_ld_btn').prop('disabled', false);
	}else if("2"==reqStatus){
		$('#approve_ach_btn,#cn_ach_btn').prop('disabled', false);
		
	}else if("3"==reqStatus){
		$('#approve_btn_4,#cn_btn_4').prop('disabled', false);
		$('#tab2').show();
		$('#tab2_l').tab('show');
		
	}else if("4"==reqStatus){
		$('#approve_btn_5,#cn_btn_5').prop('disabled', false);
		$('#tab2').show();
		
	}else if("5"==reqStatus){
		$('#approve_btn_6,#cn_btn_6').prop('disabled', false);
		$('#tab2').show();
		
	}else if("6"==reqStatus){
		$('#approve_btn_7,#cn_btn_7').prop('disabled', false);
		$('#tab2').show();
	}

});

function popupUpload(type) {
	
	
// 	$('#uploadModal').modal('show');

	console.log("id:"+reqId);
	/**call method in modal*/
	_UPLOAD_FILE.loadFileList(reqId,type);
	
//		/**test upload*/
//		_UPLOAD_FILE.uploadUpload(id)
}


function actionApprove(level){
	 
	
// 	var beforeDetail = $('#beforeDetail').val();
// 	if(beforeDetail.trim() == "" ){
// 		alert("กรุณาระบุรายละเอียดปัญหาก่อนแก้ไข");
// 		$('#beforeDetail').focus();
// 		return false;
// 	}
// 	$('#uploadModal').modal('show');
	
		var statustxt =  (level=="99")? "Cancel" : "Approve" ;
		
		jsonObj['requestStatus'] = level ;
			
// 		console.log(jsonObj);
	
		if("1"==reqStatus || "2"==reqStatus){
			
			
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
						data : jsonObj,
						url : cPath + "/request/requestUpdate"

					}).done(function(result) {
						
						alert("Save successfully !");
						
// 							swal({
// 							  title: "Success",
// 							  text: " Save successfully !",
// 							  icon: "success"
// 							})
							
//							.then((s) => {
							location = cPath + "/request/requested_edit/"+reqId;
//							});

//							swal({s
//									title: "Success",
//	 							  text: " Save successfully !",
//	 							 type: "success"
//								},
//								function(inputValue){
//// 									location = cPath + "/GasRequest/gas_requested_modify/"+jsonObj.id;
//								});
						

					}).fail(function(jqXHR, textStatus, errorThrown) {
						alert('ERROR');

					});
					 
	 		        }
	 		    }
	 		}); 
		}

// 	 bootbox.confirm({
// 		    title: "Confirm",
// 		    size: 'small',
// 		    message: "Confirm create new request?",
// 		    buttons: {
// 		        cancel: {
// 		            label: '<i class="fa fa-times"></i> Cancel',
// 		            className: 'btn-danger'
// 		        },
// 		        confirm: {
// 		            label: '<i class="fa fa-check"></i> Confirm',
// 		            className: 'btn-success'
// 		        }
// 		    },
// 		    callback: function (result) {
// 		        if(result){
		        	 
// 		        	// Submit form
		        	
// 		        	$("#myForm").submit();
				 
// 		        }
// 		    }
// 		}); 
//		alert(ItemForm);
};


</script>

	<%@ include file="requested_upload.jsp"%>
