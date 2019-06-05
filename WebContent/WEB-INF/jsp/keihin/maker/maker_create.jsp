<!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>


<form action="${cPath}/maker/maker_save.htm" method="post" id="myForm" data-toggle="validator" novalidate="true">

<input name ="rAction" type="hidden" value="Create">


        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Maker Create</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
			<div class="row">
				<div class="col-lg-3">
				
				</div>   
				           
            	<div class="col-lg-8">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <b>Maker :</b> 
                        </div>
                        

                       		<div class="panel-body">
                       			<div class="row">
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Maker ID: </b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="text" class="form-control" placeholder="Maker ID" name="maker_ID" value="" required>
                       				</div>
                       				<div class="col-lg-6">
                       					
                       				</div>
                       			</div>
                       			
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Maker Name: </b></p>
                       				</div>
                       				<div class="col-lg-10">
                       					<input type="text" class="form-control" placeholder="Maker Name" name="maker_name" value="" required>
                       				</div>
                       			</div>
                       			
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Contact Name:</b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="text" class="form-control" placeholder="Name" name="maker_contactName" value="" required>
                       				</div>
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Lastname: </b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="text" class="form-control" placeholder="Surname" name="maker_contactLastName" value="" >
                       				</div>
                       			</div>

                       			<br>
                       			<div class="row">
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Tel:</b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="text" class="form-control" placeholder="Tel." name="maker_tel" value="" required>
                       				</div>
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Email: </b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="email" class="form-control" name="maker_email" placeholder="Email" value="" required>
                       				</div>
                       			</div>

                       			<br>
                       			<div class="row">
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Address:</b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<textarea class="form-control" rows="3" name="maker_address1" ></textarea>
                       				</div>
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Province: </b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<select class="form-control" name="maker_province" required>
											  <c:forEach var="item" items="${LOV_PROVINCE}">
										     	<option value="${item.code}" ${item.code == makerBean.maker_province ? 'selected="selected"' : ''}  >${item.descTH}</option>
										    </c:forEach>			
	                                	</select>
                       				</div>
                       			</div>
 
 								<br>
                        		<div class="row">
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Status</b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<select class="form-control" name="activeFlag" required>
											 <c:forEach var="item" items="${LOV_ACTIVE_FLG}">
										     	<option value="${item.code}" ${item.code == makerBean.activeFlag ? 'selected="selected"' : ''}  >${item.descTH}</option>
										    </c:forEach>				
	                                	</select>
                       				</div>
                       				<div class="col-lg-6">
                       					
                       				</div>
                       			</div>
                       			
	                        </div>
	                        
	                        
	                       <div class="panel-footer">
		                        <input type ="button" value="Save"   role="button" class="btn btn-info" onclick="doSaveMaker()" >
                                <a type="reset" class="btn btn-default" href="${cPath}/maker/maker_list.htm"  role="button" >Cancel</a>                             
	                        </div>		                        

					</div>  
                </div>
                <div class="col-lg-1">
				
				</div> 
           	</div>
	</div>

</form> 

<script type="text/javascript">
 
function doSaveMaker() {
	var _f = $('#myForm').validator('validate');
	if (_f.has('.has-error').length == 0) {
		 
	bootbox.confirm({
		title : "Confirm",
		message : _confirmSaveTxt,
		buttons : {
			cancel : {
				label : '<i class="fa fa-times"></i> Cancel',
				className : 'btn-danger'
			},
			confirm : {
				label : '<i class="fa fa-check"></i> Confirm',
				className : 'btn-success'
			}
		},
		callback : function(result) {
			if (result) {
				 $("#myForm").submit();
			}
		}
	});
	}
}
</script> 