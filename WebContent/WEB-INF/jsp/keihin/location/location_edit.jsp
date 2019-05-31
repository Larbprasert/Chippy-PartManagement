<!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>

<form action="${cPath}/location/location_save.htm" method="post" id="myForm" data-toggle="validator" novalidate="true">

<input name ="rAction" type="hidden" value="Edit">

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Location View</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <div class="row">
             	<div class="col-lg-3">
				
				</div>   
				           
            	<div class="col-lg-6">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <b>Location :</b> ${locationBean.location_name}
                        </div>                        
                        

                       		<div class="panel-body">
		                        <div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Location ID : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="location ID" name="location_ID" value="${locationBean.location_ID}" readonly>
                       				</div>	
                       			</div>
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Location Name : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="location Name" name="location_name" value="${locationBean.location_name}" >
                       				</div>	
                       			</div>                       			
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Factory : </b></p>
                       				</div>
                       				<div class="col-lg-8">                       					
                       					<select class="form-control" name="factory.factory_ID" required>
											  <c:forEach var="item" items="${LOV_FACTORY}">
										     	<option value="${item.code}" ${item.code == locationBean.factory.factory_ID ? 'selected="selected"' : ''}  >${item.descTH}</option>
										    </c:forEach>			
	                                	</select>
                       				</div>	
                       			</div>                       			
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Status : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<select class="form-control" name="activeFlag" required>
											 <c:forEach var="item" items="${LOV_ACTIVE_FLG}">
										     	<option value="${item.code}" ${item.code == locationBean.activeFlag ? 'selected="selected"' : ''}  >${item.descTH}</option>
										    </c:forEach>				
	                                	</select>
                       				</div>	
                       			</div>
		                        
		                        				 	       
	                        </div>
	                        <div class="panel-footer">
		                        <input type ="button" value="Save" name="rAction" role="button" class="btn btn-info" onclick="doSaveLocation()">
                        		<a type="reset" class="btn btn-default" href="${cPath}/location/location_list.htm"  role="button" >Cancel</a>  
	                        </div> 	 	                        

					</div>     
                    </div>
             	<div class="col-lg-3">
				
				</div>                      
                </div>
                <!-- /.col-lg-4 -->
           	</div>

            
</form>            

<script type="text/javascript">

function doSaveLocation() {

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