<!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>


<form action="${cPath}/maker/maker_save.htm" method="post" id="myForm" data-toggle="validator" novalidate="true">

<input name ="rAction" type="hidden" value="Delete">


        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Maker View</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
			<div class="row">
				<div class="col-lg-3">
				
				</div>   
				           
            	<div class="col-lg-8">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <b>Maker :</b> ${makerBean.maker_name}
                        </div>
                        

                       		<div class="panel-body">
                       			<div class="row">
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Maker ID: </b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="text" class="form-control" placeholder="Maker ID" name="maker_ID" value="${makerBean.maker_ID}" readonly>
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
                       					<input type="text" class="form-control" placeholder="Maker Name" name="maker_name" value="${makerBean.maker_name}"  readonly>
                       				</div>
                       			</div>
                       			
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Contact Name:</b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="text" class="form-control" placeholder="Name" name="maker_contactName" value="${makerBean.maker_contactName}" readonly>
                       				</div>
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Lastname: </b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="text" class="form-control" placeholder="Surname" name="maker_contactLastName" value="${makerBean.maker_contactLastName}" readonly>
                       				</div>
                       			</div>

                       			<br>
                       			<div class="row">
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Tel:</b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="text" class="form-control" placeholder="Tel." name="maker_tel" value="${makerBean.maker_tel}" readonly>
                       				</div>
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Email: </b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="email" class="form-control" name="maker_email" placeholder="Email" value="${makerBean.maker_email}" readonly>
                       				</div>
                       			</div>

                       			<br>
                       			<div class="row">
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Address:</b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<textarea class="form-control" rows="3" name="maker_address1" readonly>${makerBean.maker_address1}</textarea>
                       				</div>
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Province: </b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="text" class="form-control" placeholder="Province" name="province_name_tha" value="${makerBean.province_name_tha}" readonly>
                       				</div>
                       			</div>
 
 								<br>
                        		<div class="row">
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Status</b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="text" class="form-control" placeholder="Status" name="activeFlag_name" value="${makerBean.activeFlag_name}" readonly>
                       				</div>
                       				<div class="col-lg-6">
                       					
                       				</div>
                       			</div>
                       			
	                        </div>
	                        
	                        
	                       <div class="panel-footer">
		                        <input type ="button" value="Delete" name="rAction" role="button" class="btn btn-info" onclick="doDel('${makerBean.maker_ID}')">
						 	  	<a href="${cPath}/maker/maker_edit.htm?maker_ID=${makerBean.maker_ID}" class="btn btn-warning" role="button" aria-pressed="true" value="edit" name="rAction">Edit</a>
						 	  	<a href="${cPath}/maker/maker_list.htm" class="btn btn-secondary" role="button" aria-pressed="true">Back to List</a>                                  
	                        </div>		                        

					</div>  
                </div>
                <div class="col-lg-1">
				
				</div> 
           	</div>
</div>

</form> 

<script type="text/javascript">
 	function doDel(maker_ID){
			bootbox.confirm({
			    title: "Confirm",
			    size: 'small',
			    message: _confirmDelTxt,
			    buttons: {
			        cancel: {
			            label: '<i class="fa fa-times"></i> Cancel'
			        },
			        confirm: {
			            label: '<i class="fa fa-check"></i> Confirm',
			            className: 'btn-success'
			        }
			    },
			    callback : function(result) {
					if (result) {
						 $("#myForm").submit();
					}
				}
			});
		};
		
</script> 