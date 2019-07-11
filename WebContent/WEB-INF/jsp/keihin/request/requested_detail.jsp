 <!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>

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
							                    <input type="text" class="form-control" placeholder="" name="request_ID" id="request_ID" value=" ${requestObj.request_ID}" readonly>
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
	                        <div class="panel-body nav-tabs-custom " >
	                            <!-- Nav tabs -->
	                            <ul class="nav nav-tabs ">
	<!--                             <ul class="nav nav-pills"> -->
	                                <li class="active">
	                                	<a href="#requestDeatil-pills" data-toggle="tab">Request Detail</a>
	                                </li>
	                                <li>
	                                	<a href="#repairDeatil-pills" data-toggle="tab">Repair Detail</a>
	                                </li>                                
	                            </ul>

<!-- ###########################################################################       body request detail	                     -->	
	                            <!-- Tab panes -->
	                            	 
								
									 
									 
	                            <div class="tab-content">
	                                <div class="tab-pane fade in active" id="requestDeatil-pills" >
									
										 <fieldset  class="fs-detail" disabled>
									 
										<!-- /.row -->
										<div class="row">
											<div class="col-lg-6">
				                                <div class="form-group">
					                                <p class="help-block"><b>Request Type</b></p>
					                                <input   type="text" class="form-control"   value="${requestObj.requestType.requestType_name}">
				                                </div> 
				                            </div>

		                                    <div class="col-lg-6">
		                                                                    
				                                <div class="form-group">
					                                <p class="help-block"><b>Location / Process</b></p>
					                                <input   type="text" class="form-control"   value="${requestObj.location.location_name}">
				                                </div>
				                                
			                                </div>					                            
				                            
			                            </div>
			                            <!-- /.row -->                                   
	                                    
	                                 
		                                
		                                <!-- /.row -->
		                                <div class="row">
		                                	<div class="col-lg-12">
				                                <div class="form-group">
				                                    <p class="help-block"><b> Before Problem Description (รายละเอียดปัญหาก่อนแก้ไข) </b></p>
				                                    <textarea   class="form-control" rows="3" name="beforeDetail">${requestObj.beforeDetail}</textarea>
				                                </div>
			                                </div>
		                                </div>  
		                                <!-- /.row -->  
		                                
		                                <!-- /.row -->
		                                <div class="row">
		                                	<div class="col-lg-6">
				                                <div class="form-group">
				                                    <p class="help-block"><b> Before Picture Problem (รูปภาพปัญหาก่อนการแก้ไข) </b></p>
<!-- 				                                    <input type="button" class="form-control-file" id="beforePicture"> -->
				                                </div>
			                                </div>    	                                
		                                </div>  
		                                <!-- /.row --> 
		                                
		                                
		                                </fieldset>
		                                
		                                  <hr>
		                                  
		                              
		                                <!-- /.row -->
		                                <div class="row hidden">
		                                	<div class="col-lg-4">

							                    <div class="panel panel-default">
							                        <div class="panel-heading">
							                            <b>Request person</b>
							                        </div>
							                        <div class="panel-body">
							                            <p id="request"></p>
							                        </div>
							                        <div class="panel-footer">
							                        	<input type="hidden" name="status" value="1">
						                                <button type="submit" class="btn btn-success" name="rAction" value="Create" id="" onClick="requestApprove();">Create</button>
						                                <a type="reset" class="btn btn-default" href="../pages/index.jsp" role="button" >Cancel</a> 
						                                
							                        </div>
							                    </div>

			                                </div>  
			                                
		                                	<div class="col-lg-4">
							                    <div class="panel panel-info">
							                        <div class="panel-heading">
							                            <b>Section Approve  (LD Up)</b>
							                        </div>
							                        <div class="panel-body">
							                            <p id="requestSectionBeforeApprove"></p>
							                        </div>
							                        <div class="panel-footer">
						                                <button type="submit" class="btn btn-success" name="rAction" value="" id="btnRequestSectionBeforeApprove" onClick="requestSectionBeforeApprove();">Approve</button>
						                                <a type="reset" class="btn btn-default" href="../pages/index.jsp" role="button" >Cancel</a> 
							                        </div>
							                    </div>
			                                </div>

		                                	<div class="col-lg-4">
							                    <div class="panel panel-success">
							                        <div class="panel-heading">
							                            <b>Repair section Approve (ACH  Up)</b>
							                        </div>
							                        <div class="panel-body">
							                            <p id="repairSectionBeforeApprove"></p>
							                        </div>
							                        <div class="panel-footer">
						                                <button type="submit" class="btn btn-success" name="rAction" value="" id="btnRepairSectionBeforeApprove" onClick="repairSectionBeforeApprove();">Approve</button>
						                                <a type="reset" class="btn btn-default" href="../pages/index.jsp" role="button" >Cancel</a> 
							                        </div>
							                    </div>
			                                </div>			                                			                                  	                                
		                                </div> 		                                
		                                <!-- /.row -->	
		                                
		                           
	                                </div>

<!-- ###########################################################################       body repair detail	                     -->	                                
									<!-- /.repairDetail	-->
	                                <div class="tab-pane fade" id="repairDeatil-pills">
	                                	
	                                 <fieldset  class="fs-detail" disabled>
										
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
				                                    <input type="file" class="form-control-file" id="afterPicture">
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
							                            <input type="text" class="form-control" placeholder="Complete(เสร็จสิ้น)" name="timeFinish" id="timeFinish" value="">										                        		                        
							                        </div>
		                                        </div>
		                                        
				                                <div class="col-md-4">
		                                             
							                        <div class="form-group input-group">
							                            <span class="input-group-addon">Total(รวม)</span>
							                            <input type="text" class="form-control" placeholder="Total(รวม)" name="totalTime" id="totalTime" value="" readonly>										                        		                        
							                        	<span class="input-group-addon">Minutes</span>
							                        </div>	
							                        		                                             
		                                        </div>
		                                        
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
							                    <div class="col-sm-12" align="right">
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
		                            
<!-- ###########################################################################       approve	                     -->			                                
		                                <!-- /.row -->
		                                <div class="row hidden" >
		                                	<div class="col-lg-3">
							                    <div class="panel panel-default">
							                        <div class="panel-heading">
							                            <b>Repair person</b>
							                        </div>
							                        <div class="panel-body">
							                            <p id="repairApprove"></p>
							                        </div>
							                        <div class="panel-footer">
						                                <button type="submit" class="btn btn-success" name="rAction" value="repairPerson" onclick="repairApprove();">Approve</button>
						                                <a type="reset" class="btn btn-default" href="../pages/index.jsp" role="button" >Cancel</a> 
							                        </div>
							                    </div>	
			                                </div> 
			                                
		                                	<div class="col-lg-3">
							                    <div class="panel panel-default">
							                        <div class="panel-heading">
							                            <b>Request section (LD up)</b>
							                        </div>
							                        <div class="panel-body">
							                            <p id="requestSectionAfterApprove"></p>
							                        </div>
							                        <div class="panel-footer">
						                                <button type="submit" class="btn btn-success" name="rAction" value="requestSection" onclick="requestSectionAfterApprove();">Approve</button>
						                                <a type="reset" class="btn btn-default" href="../pages/index.jsp" role="button" >Cancel</a> 
							                        </div>
							                    </div>
			                                </div>			                                

		                                	<div class="col-lg-3">
							                    <div class="panel panel-default">
							                        <div class="panel-heading">
							                            <b>QA Approve</b>
							                        </div>
							                        <div class="panel-body">
							                            <p id="QAApprove"></p>
							                        </div>
							                        <div class="panel-footer">
						                                <button type="submit" class="btn btn-success" name="rAction" value="qaPerson" onclick="QAApprove();">Approve</button>
						                                <a type="reset" class="btn btn-default" href="../pages/index.jsp" role="button" >Cancel</a> 
							                        </div>
							                    </div>
			                                </div>

		                                	<div class="col-lg-3">
							                    <div class="panel panel-default">
							                        <div class="panel-heading">
							                            <b>Repair section (ACH up)</b>
							                        </div>
							                        <div class="panel-body">
							                            <p id="repairSectionAfterApprove"></p>
							                        </div>							                        
							                        <div class="panel-footer">
						                                <button type="submit" class="btn btn-success" name="rAction" value="RepairSectionCheck" onClick="repairSectionAfterApprove();">Approve</button>
						                                <a type="reset" class="btn btn-default" href="../pages/index.jsp" role="button" >Cancel</a> 
							                        </div>
							                    </div>
			                                </div>	
			                             </div>	
			                             <!-- /.row -->	  		                                			                             	                                    
	                                </div>               
	                                
	                                
	                                   </fieldset>
	                                                    
	                            </div>
	                            
	                             
	                                <div class="row">
											 
											<div class="col-lg-6 text-left">
												<button type="reset"
													onclick="location='${cPath}/request/requested_list.htm'"
													class="btn btn-default" style=" width: 100px; "><i class="fa fa-arrow-circle-left"></i> &nbsp;กลับ/Back </button>
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
	                             
	            </div>
	        


	</form>	

</section>
</div>	
</body>
