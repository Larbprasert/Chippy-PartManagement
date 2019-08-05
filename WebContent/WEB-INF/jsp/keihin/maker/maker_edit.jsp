<!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>


<form action="${cPath}/maker/maker_save.htm" method="post" id="myForm" data-toggle="validator" novalidate="true">

<input name ="rAction" type="hidden" value="Edit">

<style>
	hr.style {
	/*   border: 1px solid grey; */
	  display: block;
	  margin-top: 0.5em;
	  margin-bottom: 0.5em;
	  margin-left: auto;
	  margin-right: auto;
	  border-style: inset;
	  border-width: 1px;
	}
</style>

<div class="content-wrapper">
		<section class="content-header">
			<h1 class="page-header">Maker - Edit</h1>
		</section> 
		<hr class="style">
		
		<section class="content">
		
            
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
                       					<input type="text" class="form-control" placeholder="Maker Name" name="maker_name" value="${makerBean.maker_name}" required>
                       				</div>
                       			</div>
                       			
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Contact Name:</b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="text" class="form-control" placeholder="Name" name="maker_contactName" value="${makerBean.maker_contactName}" required>
                       				</div>
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Lastname: </b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="text" class="form-control" placeholder="Surname" name="maker_contactLastName" value="${makerBean.maker_contactLastName}" >
                       				</div>
                       			</div>

                       			<br>
                       			<div class="row">
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Tel:</b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="text" class="form-control" placeholder="Tel." name="maker_tel" value="${makerBean.maker_tel}" required>
                       				</div>
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Email: </b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="email" class="form-control" name="maker_email" placeholder="Email" value="${makerBean.maker_email}" required>
                       				</div>
                       			</div>

                       			<br>
                       			<div class="row">
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Address:</b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<textarea class="form-control" rows="3" name="maker_address1" >${makerBean.maker_address1}</textarea>
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
		                        <input type ="button" value="Save" name="rAction" role="button" class="btn btn-info" onclick="doSaveMaker()">
                        		<a type="reset" class="btn btn-default" href="${cPath}/maker/maker_list.htm"  role="button" >Cancel</a>                               
	                        </div>		                        

					</div>  
                </div>
                <div class="col-lg-1">
				
				</div> 
           	</div>
           	</section>
</div>

</form> 


<script type="text/javascript">

function doSaveMaker() {
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
</script> 