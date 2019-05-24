<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

	<%@include file="/resources/adminLTE/common.jsp" %>
	
	<c:set var="_SAVE_MODE" scope="page" value="${param['edit']=='Y'||param['add']=='Y'}"/>
	<c:set var="_EDIT_MODE" scope="page" value="${param['edit']=='Y'||param['add']=='Y'? '' : 'disabled'}"/>
	
</head>


<body>

	
	<!--  --- MENU --- -->
	<%@include file="/WEB-INF/jsp/tpcc/she/menu.jsp" %>

  <div class="container">

		<div class="page-header">
			<div class="row">
				<br>
				<div class="col-lg-12">
					<h3><i class='fa fa-edit'></i> ${_SAVE_MODE? 'Manage': 'View'}  Claim</h3>
				</div>
			</div>
		</div>
		
		<div class="row"> <div class="col-lg-12">
		
		  <fieldset ${_EDIT_MODE}>
		  <div class="well">
		   <form class="form-horizontal" id="form" action="claimSave.htm" method="post" command="invClaimHistory" data-toggle="validator">  
	         <div class="row ">
	          <div class="col-lg-6">
	          
	          <!-- 	 <------- Don't forget this Haha -->
				<input type="hidden" class="form-control" name="claimId" value="${invClaimHistory.claimId}">
<%-- 				<input type="hidden" class="form-control" ${empty param['claimId']? '':'name="hostId"'} value="${invClaimHistory.hostId}"> --%>
	          
	          <div class="form-group">
                    <label for="name" class="col-lg-4 control-label">Case no</label>
                    <div class="col-lg-6">
                      <input type="text" class="form-control" name='claimNo' value="${invClaimHistory.claimNo}" required>
                    </div>
                  </div>
                  
                   <div class="form-group">
                    <label for="name" class="col-lg-4 control-label">Host ID</label>
                    <div class="col-lg-6">
                    
                            <select  class="form-control selectpicker show-tick" data-live-search="true"  name="hostId" required>
								<option value="">--- Please Select ---</option>
							    <c:forEach var="item" items="${LOV_ASSET}">
							     	<option value="${item.code}" ${item.code == invClaimHistory.hostId ? 'selected="selected"' : ''}>${item.descTH}</option>
							    </c:forEach>
							</select>
                    </div>
<!--                     <button type="button" class="btn btn-primary">Check <i class="fa fa-check-square-o"></i></button> -->
                  </div>
                  
                 <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Owner</label>
                    <div class="col-lg-6">
                      	<select  class="form-control selectpicker show-tick" data-live-search="true" name="ownerCode" required>
                      			<option value="">--- Please Select ---</option>
							    <c:forEach var="item" items="${LOV_OWNER}">
							     	<option value="${item.code}" ${item.code == invClaimHistory.ownerCode ? 'selected="selected"' : ''}>${item.descTH}</option>
							    </c:forEach>
							</select>
                    </div>
                  </div>
                  
<!--                   <div class="form-group"> -->
<!--                     <label for="name" class="col-lg-4 control-label">S/N Asset</label> -->
<!--                     <div class="col-lg-6"> -->
<!--                       <input type="text" class="form-control" name="sn"  required> -->
<!--                     </div> -->
<!--                   </div> -->

				<div class="form-group">
                    <label for="" class="col-lg-4 control-label">Assign To</label>
                    <div class="col-lg-6">
                      	<select  class="form-control selectpicker show-tick" data-live-search="true" id="assignTo"  name="assignTo" required>
                      			<option value="">--- Please Select ---</option>
							    <c:forEach var="item" items="${LOV_SYS_USERS}">
							     	<option value="${item.code}" ${item.code == invClaimHistory.assignTo ? 'selected="selected"' : ''}>${item.descTH}</option>
							    </c:forEach>
							</select>
                    </div>
                  </div>
                  
                   <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Detail</label>
                    <div class="col-lg-6">
		                <textarea class="form-control" rows="4"  name='claimDetail'>${invClaimHistory.claimDetail}</textarea>
                    </div>
                  </div>
              
              </div>
                  
	          <div class="col-lg-6">
	          
				  <div class="form-group">
                    <label for="name" class="col-lg-4 control-label">Ticket No</label>
                    <div class="col-lg-6">
                      <input type="text" class="form-control" name="claimCode"  value="${invClaimHistory.claimCode}"  >
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Submit date</label>
                     <div class="col-lg-6">
		                <div class='input-group date'>
		                    <input type='text' class="form-control"  pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}"   name='startDate' value="${invClaimHistory.startDate}" required/>
		                    <span class="input-group-addon">
		                        <span class="glyphicon glyphicon-calendar"></span>
		                    </span>
		                </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Onsite Date</label>
                    <div class="col-lg-6">
		                <div class='input-group date'>
		                    <input type='text' class="form-control"  pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}"   name='finishDate' value="${invClaimHistory.finishDate}" />
		                    <span class="input-group-addon">
		                        <span class="glyphicon glyphicon-calendar"></span>
		                    </span>
		                </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="name" class="col-lg-4 control-label">Status</label>
                    <div class="col-lg-6">
                      <select class="form-control" name="claimStatus" required>
<!--                        	<option value="">None</option> -->
                       	<c:forEach var="item" items="${LOV_CLAIM_STATUS}"> 
					        <option value="${item.code}" ${item.code == invClaimHistory.claimStatus ? 'selected="selected"' : ''}>${item.descTH}</option>
					    </c:forEach>
                      </select>
                    </div>
                  </div>
                  
	              <div class="form-group">
                    <label for="name" class="col-lg-4 control-label">Remark</label>
                       <div class="col-lg-6">
                          <textarea class="form-control" rows="4" name="remark">${invClaimHistory.remark}</textarea>
                       </div>
                    </div>
                      
	          </div> 
	          
	         <%--  <div class="col-lg-12">
	               <div class="form-group">
                    <label for="name" class="col-lg-2 control-label">Remark</label>
                       <div class="col-lg-9">
                          <textarea class="form-control" rows="4" name="remark">${invClaimHistory.remark}</textarea>
                       </div>
                    </div>
                    
             </div> --%>
             
            
             <div class="col-lg-12"> <br></hr></div>
             
	          <div class="col-lg-12">
	         	 <div class="panel panel-info">
            <div class="panel-heading"> <strong>List of Documents</strong> </div>
            <div class="tablecontainer">
	                   <table class="table table-hover">
	                    <thead class="bg-green color-palette">
	                        <tr>
	                            <th class="text-center">No.</th>
	                            <th class="text-center">File Name</th>
	                            <th class="text-center">Type</th>
	                            <th class="text-center">Description</th>
	                            <th class="text-center" width="100"></th>
	                            <th class="text-center" width="100"></th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    <c:forEach items="${invClaimHistory.documents}" var="doc" varStatus="counter">
	                        <tr>
	                            <td class="text-center">${counter.index + 1}</td>
	                            <td >${doc.fileName}</td>
	                            <td class="text-center">${doc.type}</td>
	                            <td>${doc.description}</td>
	                            <td class="text-center"><a href="${cPath}/file/get/${doc.id}" class="btn btn-success custom-width">Download</a></td>
	                            <td class="text-center"><a href="${cPath}/file/fileRemove?id=${doc.id}" class="btn btn-danger custom-width">Delete</a></td>
	                        </tr>
	                    </c:forEach>
	                   		<c:if test="${empty invClaimHistory.documents}">
								 <tr><td class="text-center" colspan="6"> Not found document</td> </tr>
							</c:if>
	                    </tbody>
	                </table>
                 </div></div>
             </div>
				
				<div class="col-lg-12 ${_SAVE_MODE? '':'hidden'}">
					<div class="form-group "> 
						<div class="col-lg-12 text-center">
							<button type="button" id="cancelBtn" class="btn btn-default"><i class="fa fa-times-circle"></i> Cancel </button>&nbsp;&nbsp;
							<a href="#" data-toggle="modal" data-target="#upload-avatar" class="btn btn-success" id="uploadBtn"><i class="fa fa-upload" ${_EDIT_MODE}></i> Upload Document </a>&nbsp;&nbsp;
							<button type="button" id="saveBtn" class="btn btn-primary"><i class="fa fa-save"></i> Save </button>&nbsp;
						</div>
					</div>
				</div>
			</div>

				</form></div>
           </div>
            </fieldset>
            
        </div>
		
        <div class="row ${_SAVE_MODE? 'hidden':''}">
			<div class="col-lg-12 text-center">
				<button type="button" id="backBtn" class="btn btn-primary" onclick="history.back()"> <i class="fa fa-reply"></i> Back </button>&nbsp;
			</div>
		</div> 
			
		<div class="clearfix"><br></div>
		
		
	</div>
	
	
	
  
<!--Modal for uploading photo-->
<div class="modal" id="upload-avatar" tabindex="-1" role="dialog" aria-labelledby="upload-avatar-title" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          <h4 class="modal-title" id="upload-avatar-title">Upload File</h4>
        </div>
        <div class="modal-body">
<!--           <p>Please choose a file to upload.</p> -->
          <form role="form">
          
			 	<input type="file" name="files" id="filer_input" multiple>

          </form>
        </div>
         <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
	
	
<link href="${cPath}/resources/jquery-filer/css/jquery.filer.css" type="text/css" rel="stylesheet" />
<link href="${cPath}/resources/jquery-filer/css/themes/jquery.filer-dragdropbox-theme.css" type="text/css" rel="stylesheet" />

<script src="${cPath}/resources/jquery-filer/js/jquery.filer.min.js"></script>
<script src="${cPath}/resources/jquery-filer/js/custom.js" type="text/javascript"></script>


<script>
		var saveStatus = '${param["status"]}';
		
		function doSave(e){
			bootbox.confirm({
			    title: "Confirm",
			    size: 'small',
			    message: _confirmSaveTxt,
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
	
			
		$(".date").datepicker({
			   format: 'dd/mm/yyyy'
		});
		
		
// 		var hostId = '${invClaimHistory.hostId}';
// 		if($.trim(hostId)!=""){
// 			$('.selectpicker').selectpicker('refresh'); 
// 			$('#hostId').selectpicker('val', hostId);
// 		}
	
// 		var ownerCode = '${invClaimHistory.ownerCode}';
// 		if($.trim(ownerCode)!=""){
// 			$('.selectpicker').selectpicker('refresh'); 
// 			$('#ownerCode').selectpicker('val', ownerCode);
// 		}
	
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
	
		$("#saveBtn,#uploadBtn").click(function(e){
			var _f = $('#form').validator('validate');
			if (_f.has('.has-error').length==0) {
// 		    	doSave();
			}else{
				return false;
			}
		});
			
			$("#cancelBtn").click(function(){
				location = cPath+"/manage/claimmanage.htm";				
			});
			
	
 	
 </script>
	 
	 
	 <c:remove var="SAVE_STATUS" scope="session"/>
	
	 <!-- 	##### <<<<<  TAB ####------------------- -->
</body>

</html>