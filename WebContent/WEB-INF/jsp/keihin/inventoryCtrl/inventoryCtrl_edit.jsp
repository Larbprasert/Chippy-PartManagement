<!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>


<form action="${cPath}/inventoryCtrl/inventoryCtrl_save.htm" method="post" id="myForm" data-toggle="validator" novalidate="true">

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
			<h1 class="page-header">Inventory - Edit</h1>
		</section> 
		<hr class="style">
		
		<section class="content">
		    
            <div class="row">
             	<div class="col-lg-1">
				
				</div>   
				           
            	<div class="col-lg-10">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <b>Inventory :</b> ${inventoryCtrlBean.inventory_name}
                        </div>                        
                        		
<div class="panel-body">

	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Inventory ID:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Inventory ID" name="inventory_ID" value="${inventoryCtrlBean.inventory_ID}" readonly>
		</div>
		<div class="col-lg-2">
			<p class="help-block"><b>Inventory Name:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Inventory Name" name="inventory_name" value="${inventoryCtrlBean.inventory_name}" >
		</div>		
	</div>
	<br>
	
	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Action:</b></p>
		</div>
		<div class="col-lg-4">
			<select class="form-control" name="movementCode" id="movementCode" required>
				<c:forEach var="item" items="${LOV_MOVEMENT}">
					<option value="${item.code}">${item.descTH}</option>
				</c:forEach>				
			</select>
		</div>		
	</div>
	<br>
	
	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Invoice Number:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Invoice Number" name="invoice_number" id="invoice_number" value="">
		</div>		
	</div>
	<br>
	
	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Current Qty:</b></p>
		</div>
		<div class="col-lg-2">
			<input type="text" class="form-control" placeholder="Qty" name="qty_before" value="${inventoryCtrlBean.qty}" readonly >
		</div>
		
		<div class="col-lg-2">
			<p class="help-block" align="right"><b>Qty:</b></p>
		</div>
		<div class="col-lg-2">
			<input type="text" class="form-control" placeholder="Qty" name="qty" value="${inventoryCtrlBean.qty}" >
		</div>
		
		<div class="col-lg-2">
			<p class="help-block" align="right"><b>Price:</b></p>
		</div>
		<div class="col-lg-2">
			<input type="text" class="form-control" placeholder="Price" name="price" value="${inventoryCtrlBean.price}" >
		</div>	
	</div>
	<br>

	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Min Stock:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Min Stock" name="min_stock" value="${inventoryCtrlBean.min_stock}" >
		</div>
		<div class="col-lg-2">
			<p class="help-block"><b>Max Stock:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Max Stock" name="max_stock" value="${inventoryCtrlBean.max_stock}" >
		</div>		
	</div>
	<br>
                    		
	<div class="row">
		
		<div class="col-lg-2">
			<p class="help-block"><b>Unit Type:</b></p>
		</div>
		<div class="col-lg-4">			
			<select class="form-control" name="unitType.unitType_ID" required>
				<c:forEach var="item" items="${LOV_UNITTYPE}">
					<option value="${item.code}" ${item.code == inventoryCtrlBean.unitType.unitType_ID ? 'selected="selected"' : ''}  >${item.descTH}</option>
				</c:forEach>				
			</select>
		</div>	
		
		<div class="col-lg-2">
			<p class="help-block"><b>Location:</b></p>
		</div>
		<div class="col-lg-4">			
			<select class="form-control" name="location.location_ID" required>
				<c:forEach var="item" items="${LOV_LOCATION}">
					<option value="${item.code}" ${item.code == inventoryCtrlBean.location.location_ID ? 'selected="selected"' : ''}  >${item.descTH}</option>
				</c:forEach>				
			</select>
		</div>					
	</div>
	<br>
		                        
	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Maker/Brand:</b></p>
		</div>
		<div class="col-lg-4">			
			<select class="form-control" name="maker.maker_ID" required>
				<c:forEach var="item" items="${LOV_MAKER}">
					<option value="${item.code}" ${item.code == inventoryCtrlBean.maker.maker_ID ? 'selected="selected"' : ''}  >${item.descTH}</option>
				</c:forEach>				
			</select>
		</div>	
		
		<div class="col-lg-2">
			
				<p class="help-block"><b>Ranking:</b></p>
			
		</div>
		<div class="col-lg-4">
			<select class="form-control" name="rank" required>
				<c:forEach var="item" items="${LOV_RANKING}">
						<option value="${item.code}" ${item.code == inventoryCtrlBean.rank ? 'selected="selected"' : ''}  >${item.descTH}</option>
				</c:forEach>
			</select>
		</div>					
	</div>
	<br>

	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Status:</b></p>
		</div>
		<div class="col-lg-4">
			<select class="form-control" name="activeFlag" required>
				<c:forEach var="item" items="${LOV_ACTIVE_FLG}">
					<option value="${item.code}" ${item.code == inventoryCtrlBean.activeFlag ? 'selected="selected"' : ''}  >${item.descTH}</option>
				</c:forEach>				
			</select>
		</div>		
				
		<div class="col-lg-2">
			
		</div>
		<div class="col-lg-4">
			
		</div>				
	</div>
</div>
	                        
	                        
	                        <div class="panel-footer">
		                        <input type ="button" value="Save" name="rAction" role="button" class="btn btn-info" onclick="doSaveInventoryCtrl()">
                        		<a type="reset" class="btn btn-default" href="${cPath}/inventoryCtrl/inventoryCtrl_list.htm"  role="button" >Cancel</a> 
	                        </div> 	 	                        

					</div>     
                    </div>
             	<div class="col-lg-1">
				
				</div>                      
                </div>
                <!-- /.col-lg-4 -->
                </section>
           	</div>

            
</form>            

<script type="text/javascript">

function doSaveInventoryCtrl() {
	
	if ( $('#movementCode').val()==1 && $('#invoice_number').val().trim()==''  ) {
		alert("Please input Invoice Number !");
		$('#invoice_number').focus();
		return false;
	}

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