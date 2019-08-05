<!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>


<form action="${cPath}/productionLine/productionLine_save.htm" method="post" id="myForm" data-toggle="validator" novalidate="true">

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
			<h1 class="page-header">Production Line - Edit</h1>
		</section> 
		<hr class="style">
		
		<section class="content">
		
            
            <div class="row">
             	<div class="col-lg-4">
				
				</div>   
				           
            	<div class="col-lg-6">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <b>Production Line :</b> ${productionLineBean.productionLine_name}
                        </div>                        
                        
                        

                       		<div class="panel-body">
		       					
		                        <div class="row">
                       				<div class="col-lg-5">
                       					<p class="help-block"><b>Production Line ID: </b></p>
                       				</div>
                       				<div class="col-lg-7">
                       					<input type="text" class="form-control" placeholder="Production Line ID" name="productionLine_ID" value="${productionLineBean.productionLine_ID}" readonly>
                       				</div>	
                       			</div>
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-5">
                       					<p class="help-block"><b>Production Line Name: </b></p>
                       				</div>
                       				<div class="col-lg-7">
                       					<input type="text" class="form-control" placeholder="Production Line Name" name="productionLine_name" value="${productionLineBean.productionLine_name}" >
                       				</div>	
                       			</div>                       			
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-5">
                       					<p class="help-block"><b>Factory: </b></p>
                       				</div>
                       				<div class="col-lg-7">
                       					<select class="form-control" name="factory.factory_ID" required>
											  <c:forEach var="item" items="${LOV_FACTORY}">
										     	<option value="${item.code}" ${item.code == productionLineBean.factory.factory_ID ? 'selected="selected"' : ''}  >${item.descTH}</option>
										    </c:forEach>			
	                                	</select>
                       				</div>	
                       			</div>                       			
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-5">
                       					<p class="help-block"><b>Status : </b></p>
                       				</div>
                       				<div class="col-lg-7">
                       					<select class="form-control" name="activeFlag" required>
											 <c:forEach var="item" items="${LOV_ACTIVE_FLG}">
										     	<option value="${item.code}" ${item.code == productionLineBean.activeFlag ? 'selected="selected"' : ''}  >${item.descTH}</option>
										    </c:forEach>				
	                                	</select>
                       				</div>	
                       			</div>
		                        			 	       
	                        </div>
	                        <div class="panel-footer">
		                        <input type ="button" value="Save" name="rAction" role="button" class="btn btn-info" onclick="doSaveProductionLine()">
                        		<a type="reset" class="btn btn-default" href="${cPath}/productionLine/productionLine_list.htm"  role="button" >Cancel</a> 
	                        </div> 	 	                        

					</div>     
                </div>
             	<div class="col-lg-2">
				
				</div>                     
             </div>
                <!-- /.col-lg-4 -->
                </section>
           	</div>

            
</form>            

<script type="text/javascript">

function doSaveProductionLine() {

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