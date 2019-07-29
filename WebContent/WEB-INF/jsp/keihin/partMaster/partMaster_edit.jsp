<!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>


<form action="${cPath}/partMaster/partMaster_save.htm" method="post" id="myForm" data-toggle="validator" novalidate="true">

<input name ="rAction" type="hidden" value="Edit">

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Part Master View</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            
            <div class="row">
             	<div class="col-lg-3">
				
				</div>   
				           
            	<div class="col-lg-8">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <b>Part Master :</b>  ${partMasterBean.part_name}
                        </div>                        
                        		
<div class="panel-body">

	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Part ID:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Part ID" name="part_ID" value="${partMasterBean.part_ID}" readonly>
		</div>
		<div class="col-lg-2">
			<p class="help-block"><b>Part Name:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Part Name" name="part_name" value="${partMasterBean.part_name}" >
		</div>		
	</div>
	<br>
	
	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Action:</b></p>
		</div>
		<div class="col-lg-4">
			<select class="form-control" name="movementCode" required>
				<c:forEach var="item" items="${LOV_MOVEMENT}">
					<option value="${item.code}">${item.descTH}</option>
				</c:forEach>				
			</select>
		</div>		
	</div>
	<br>
	
	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Current Qty:</b></p>
		</div>
		<div class="col-lg-2">
			<input type="text" class="form-control" placeholder="Qty" name="qty_before" value="${partMasterBean.qty}" readonly >
		</div>
		
		<div class="col-lg-2">
			<p class="help-block" align="right"><b>Qty:</b></p>
		</div>
		<div class="col-lg-2">
			<input type="text" class="form-control" placeholder="Qty" name="qty" value="${partMasterBean.qty}" >
		</div>
		
		<div class="col-lg-2">
			<p class="help-block" align="right"><b>Price:</b></p>
		</div>
		<div class="col-lg-2">
			<input type="text" class="form-control" placeholder="Price" name="price" value="${partMasterBean.price}" >
		</div>	
	</div>
	<br>

	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Min Stock:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Min Stock" name="min_stock" value="${partMasterBean.min_stock}" >
		</div>
		<div class="col-lg-2">
			<p class="help-block"><b>Max Stock:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Max Stock" name="max_stock" value="${partMasterBean.max_stock}" >
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
					<option value="${item.code}" ${item.code == partMasterBean.unitType.unitType_ID ? 'selected="selected"' : ''}  >${item.descTH}</option>
				</c:forEach>				
			</select>
		</div>	
		
		<div class="col-lg-2">
			<p class="help-block"><b>Location:</b></p>
		</div>
		<div class="col-lg-4">			
			<select class="form-control" name="location.location_ID" required>
				<c:forEach var="item" items="${LOV_LOCATION}">
					<option value="${item.code}" ${item.code == partMasterBean.location.location_ID ? 'selected="selected"' : ''}  >${item.descTH}</option>
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
					<option value="${item.code}" ${item.code == partMasterBean.maker.maker_ID ? 'selected="selected"' : ''}  >${item.descTH}</option>
				</c:forEach>				
			</select>
		</div>	
		
		<div class="col-lg-2">
			<p class="help-block"><b>Mold/Type:</b></p>
		</div>
		<div class="col-lg-4">
			<select class="form-control" name="moldType.moldType_ID" required>
				<c:forEach var="item" items="${LOV_MOLDTYPE}">
					<option value="${item.code}" ${item.code == partMasterBean.moldType.moldType_ID ? 'selected="selected"' : ''}  >${item.descTH}</option>
				</c:forEach>				
			</select>
		</div>					
	</div>
	<br>

	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Ranking:</b></p>
		</div>
		<div class="col-lg-4">
			<select class="form-control" name="rank" required>
				<c:forEach var="item" items="${LOV_RANKING}">
					<option value="${item.code}" ${item.code == partMasterBean.rank ? 'selected="selected"' : ''}  >${item.descTH}</option>
				</c:forEach>				
			</select>
		</div>				
		<div class="col-lg-2">
			<p class="help-block"><b>Status:</b></p>
		</div>
		<div class="col-lg-4">
			<select class="form-control" name="activeFlag" required>
				<c:forEach var="item" items="${LOV_ACTIVE_FLG}">
					<option value="${item.code}" ${item.code == partMasterBean.activeFlag ? 'selected="selected"' : ''}  >${item.descTH}</option>
				</c:forEach>				
			</select>
		</div>				
	</div>
</div>
	                        
	                        
	                        <div class="panel-footer">
		                        <input type ="button" value="Save" name="rAction" role="button" class="btn btn-info" onclick="doSavePartMaster()">
                        		<a type="reset" class="btn btn-default" href="${cPath}/partMaster/partMaster_list.htm"  role="button" >Cancel</a> 
	                        </div> 	 	                        

					</div>     
                    </div>
             	<div class="col-lg-1">
				
				</div>                      
                </div>
                <!-- /.col-lg-4 -->
           	</div>

            
</form>            

<script type="text/javascript">

function doSavePartMaster() {

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