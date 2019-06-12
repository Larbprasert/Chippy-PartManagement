 <!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>

  
<form action="${cPath}/request/request_save.htm" method="post" id="myForm" data-toggle="validator" >

<input name ="rAction" type="hidden" value="Create">

	    <div id="wrapper">
	        <div id="page-wrapper">
	        
<!-- 	            <div class="row"> -->
<!-- 	                <div class="col-lg-12"> -->
<!-- 	                    <h1 class="page-header">Repair and Rebuild Request Sheet</h1> -->
<!-- 	                </div> -->
<!-- <!-- 	                /.col-lg-12 --> -->
<!-- 	            </div> -->
	
<!-- 				<p id="demo"></p> -->
	
	            <div class="row">
	            	<div class="col-lg-2">
	            	
	            	</div>
	                
	                <!-- /.col-lg-8 -->
	                <div class="col-lg-10">
	                    <div class="panel panel-default">
	                    
<!-- ###########################################################################       header	                     -->
	                        <div class="panel-heading">
	                        	<!-- /.row -->
								<div class="row">
									<div class="col-lg-4">
		                                <div class="form-group">
		                                	<div class="col-lg-5">
		                                		<p class="help-block"><b>Request no</b></p>
		                                	</div>
		                                	<div class="col-lg-7">		                                		
							                    <input type="text" class="form-control" placeholder="" name="request_ID" id="request_ID" value="" readonly>
		                                	</div>                          			
	                            		</div>
	                            	</div>
	                            	
	                            	<div class="col-lg-4">
		                                <div class="form-group">
	                            			<div class="col-lg-5">
		                                		<p class="help-block"><b>Request date</b></p>
		                                	</div>
		                                	<div class="col-lg-7">		                                		
							                    <input type="text" class="form-control" placeholder="" name="informDate" id="informDate" value="" readonly>
		                                	</div>
	                            		</div>
	                            	</div>
	                            	
	                            	<div class="col-lg-4">
	                            		<div class="col-lg-5">
	                                		<p class="help-block"><b>Request time</b></p>
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
		                                		<p class="help-block"><b>Request by</b></p>
		                                	</div>
		                                	<div class="col-lg-7">		                                		
							                    <input type="text" class="form-control" placeholder="" name="createBy" id="createBy" value="" readonly>
		                                	</div>                            			
	                            		</div>
	                            	</div>
	                            	
	                            	<div class="col-lg-4">
	                            		<div class="col-lg-5">
	                                		<p class="help-block"><b>Section</b></p>
	                                	</div>
	                                	<div class="col-lg-7">		                                		
						                    <input type="text" class="form-control" placeholder="" name="section_name" id="section_name" value="" readonly>
						                    <input type="hidden" name="section_ID" value="">
	                                	</div>
	                            	</div>
	                            	
	                            	<div class="col-lg-4">
	                            		<div class="col-lg-5">
	                                		<p class="help-block"><b>Request Status</b></p>
	                                	</div>
	                                	<div class="col-lg-7">		                                		
						                    <input type="text" class="form-control" placeholder="" name="status" id="status" value="" readonly>
	                                		<input type="hidden" name="status" value="">
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
	                                <li>
	                                	<a href="#repairDeatil-pills" data-toggle="tab">Repair Detail</a>
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
					                                <p class="help-block"><b>Request Type</b></p>
					                                <select class="form-control" name="requestType.requestType_ID" required>
														 <c:forEach var="item" items="${LOV_REQUESTTYPE}">
													     	<option value="${item.code}" ${item.code == requestBean.requestType.requestType_ID ? 'selected="selected"' : ''}  >${item.descTH}</option>
													    </c:forEach>			
				                                	</select>
				                                </div> 
				                            </div>

		                                    <div class="col-lg-6">
		                                                                    
				                                <div class="form-group">
					                                <p class="help-block"><b>Location / Process</b></p>
														<select class="form-control" name="location.location_ID" required>
															<c:forEach var="item" items="${LOV_LOCATION}">
																<option value="${item.code}" ${item.code == requestBean.location.location_ID ? 'selected="selected"' : ''}  >${item.descTH}</option>
															</c:forEach>				
														</select>
				                                </div>
				                                
			                                </div>					                            
				                            
			                            </div>
			                            <!-- /.row -->                                   
	                                    
	                                    <div class="row">
		                                    <div class="col-lg-6">
		                                                
				                                
			                                </div>
		
		                                    <div class="col-lg-6">
		                                             
				                                
			                                </div>	
		                                </div>
		                                <!-- /.row -->
		                                
		                                <!-- /.row -->
		                                <div class="row">
		                                	<div class="col-lg-12">
				                                <div class="form-group">
				                                    <p class="help-block"><b> Befor Problem Description (รายละเอียดปัญหาก่อนแก้ไข) </b></p>
				                                    <textarea class="form-control" rows="3" name="beforeDetail"></textarea>
				                                </div>
			                                </div>
		                                </div>  
		                                <!-- /.row -->  
		                                
		                                <!-- /.row -->
		                                <div class="row">
		                                	<div class="col-lg-6">
				                                <div class="form-group">
				                                    <p class="help-block"><b> Before Picture Problem (รูปภาพปัญหาก่อนการแก้ไข) </b></p>
				                                    <input type="file" class="form-control-file" id="beforePicture">
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
										<!-- /.row -->
										<div class="row">
											<div class="col-lg-9">
				                                <div class="form-group">
					                                <p class="help-block"><b>ตรวจสอบเครื่องมือและเครื่องจักรก่อนการซ่อม  (Check Tooling and Machine before  Repaired)</b></p>		
<%-- 														<% --%>
<!-- 															Vector<CheckToolBean> checkToolBeforeList = listCheckToolBefore.getCheckToolBefore(); -->
<!-- 																										for (int i=0;i <checkToolBeforeList.size();i++){ -->
<!-- 																											CheckToolBean checkToolBefore =(CheckToolBean)checkToolBeforeList.elementAt(i); -->
<!-- 														%> -->
				                                            <div class="checkbox">
				                                                <label>
<%-- 				                                                    <input type="checkbox" value="<%=checkToolBefore.getCheckTool_ID()%>"><%=checkToolBefore.getCheckTool_name()%> --%>
				                                                </label>
				                                            </div>	

<%-- 														<% --%>
<!-- 																} -->
<!-- 															%>	 -->
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
		                                	
		                                	Data Table CRUD
<%-- 		                                		<jsp:include page="../pages/CRUDwithDataTable.jsp"></jsp:include> --%>
		                                	</div>
		                                </div>

										<!-- /.row -->
		                                										
										<hr>		                                
		                                <!-- /.row -->
		                                <div class="row">
		                                
											<div class="col-lg-4">
		                                		<div class="form-group">
				                                	<p class="help-block"><b> ประเภทการซ่อม  </b></p>	
<%-- 														<% --%>
<!--  																Vector<maintenanceTypeBean> maintenanceTypeList = listmaintenanceType.getmaintenanceType(); -->
<!--  																											for (int i=0;i <maintenanceTypeList.size();i++){ -->
<!--  																												maintenanceTypeBean maintenanceType =(maintenanceTypeBean)maintenanceTypeList.elementAt(i); -->
<%-- 															%> --%>
				                                        <div class="radio">    
				                                                <label>
<%-- 				                                                    <input type="radio" name="maintenanceType" value="<%=maintenanceType.getmaintenanceType_code()%>"><%=maintenanceType.getmaintenanceType_name()%> --%>
				                                                </label>
				                                        </div>   

<%-- 														<% --%>
<!--     															} -->
<%--    														%> --%>
				                                </div>
			                                </div>

											<div class="col-lg-8">
				                                <div class="form-group">
					                                <p class="help-block"><b> การตรวจสอบเครื่องมือและเครื่องจักรหลังการซ่อม  (Check Tooling and Machine after  Repaired) </b></p>
<%-- 														<% --%>
<!--  															Vector<CheckToolBean> checkToolAfterList = listCheckToolAfter.getCheckToolAfter(); -->
<!--  																										for (int i=0;i <checkToolAfterList.size();i++){ -->
<!--  																											CheckToolBean checkToolAfter =(CheckToolBean)checkToolAfterList.elementAt(i); -->
<!-- 														%> -->
				                                            <div class="checkbox">
				                                                <label>
<%-- 				                                                    <input type="checkbox" value="<%=checkToolAfter.getCheckTool_ID() %>"><%=checkToolAfter.getCheckTool_name() %> --%>
				                                                </label>
				                                            </div>	

<%-- 														<% --%>
<!-- 														}  -->
<!-- 														%>	 -->
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
		                                				<p class="help-block"><b> ※กรณีที่มีความเกี่ยวข้องด้านคุณภาพให้แผนก QA ร่วมตรวจเช็คด้วย </b></p>
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
<%-- 								                           <%  --%>
<!-- 															Vector<judgementBean> judgementList = listjudgement.getjudgement(); -->
<!-- 															for (int i=0;i <judgementList.size();i++){ -->
<!-- 																judgementBean judgement =(judgementBean)judgementList.elementAt(i); -->
<!-- 															%> -->
					                                            
					                                                <label class="radio-inline">
<%-- 					                                                    <input type="radio" name="confirmJudgment" id="confirmJudgment" value="<%=judgement.getjudgement_code() %>"><%=judgement.getjudgement_name() %> --%>
					                                                </label>
<%-- 															<% --%>
<!-- 															}  -->
<!-- 															%> -->
					                                </div>
					                        	</div>
			                                </div>	   		                                
			                                
		                                </div>  
		                                <!-- /.row --> 

										<hr>		                                
		                                <!-- /.row -->
		                                <div class="row" >
		                                	<div class="col-lg-12">
<%-- 		                                		<jsp:include page="../pages/CRUDwithDataTable.jsp"></jsp:include> --%>
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
	                            </div>
	                        </div>
	                        <!-- /.panel-body -->
	                        
	                        <!-- /.panel-Footer -->
	                        <div class="panel-footer">
                                <div class="row">
                                	<div class="col-lg-4">
                                		<p class="help-block"><b>ระยะเวลาในการจัดเก็บเอกสาร 20+1 ปี</b></p>
                                	</div>
                                	<div class="col-lg-5">
                                	</div>
                                	<div class="col-lg-3">
                                		<p class="help-block" align="right"><b>FP-PE-01-04 REV.02 </b></p>
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
	        </div>
	        <!-- /#page-wrapper -->
	
	    </div>
	    <!-- /#wrapper -->
	
<!-- 	    jQuery -->
<!-- 	    <script src="../vendor/jquery/jquery.min.js"></script> -->
	
<!-- 	    Bootstrap Core JavaScript -->
<!-- 	    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script> -->
<!-- 		<script src="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"></script> -->
	
<!-- 	    Metis Menu Plugin JavaScript -->
<!-- 	    <script src="../vendor/metisMenu/metisMenu.min.js"></script> -->
	
<!-- 	    Custom Theme JavaScript -->
<!-- 	    <script src="../dist/js/sb-admin-2.js"></script> -->
	    
	    <!-- Data Table JavaScript -->
<!--     	<script src="../js/jquery.dataTables.min.js"></script> -->
<!-- 	    <script src="../js/jquery-3.3.1.js"></script> -->


<!-- <link href="css/bootstrap-datetimepicker.css" rel="stylesheet"> -->
<!-- <script src="js/bootstrap-datetimepicker.min.js"></script> -->




	</form>	
</body>
