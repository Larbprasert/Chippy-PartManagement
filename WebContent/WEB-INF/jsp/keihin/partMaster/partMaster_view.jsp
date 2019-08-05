<!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>


<form action="${cPath}/partMaster/partMaster_save.htm" method="post" id="myForm" data-toggle="validator" novalidate="true">

<input name ="rAction" type="hidden" value="Delete">

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
			<h1 class="page-header">Part Master - View</h1>
		</section> 
		<hr class="style">
		
		<section class="content">
		
            
            
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
			<input type="text" class="form-control" placeholder="Part Name" name="part_name" value="${partMasterBean.part_name}" readonly>
		</div>		
	</div>
	<br>
	
	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Qty:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Qty" name="qty" value="${partMasterBean.qty}" readonly >
		</div>
		<div class="col-lg-2">
			<p class="help-block"><b>Price:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Price" name="price" value="${partMasterBean.price}" readonly>
		</div>		
	</div>
	<br>

	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Min Stock:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Min Stock" name="min_stock" value="${partMasterBean.min_stock}" readonly>
		</div>
		<div class="col-lg-2">
			<p class="help-block"><b>Max Stock:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Max Stock" name="max_stock" value="${partMasterBean.max_stock}" readonly>
		</div>		
	</div>
	<br>
                    		
	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Unit Type:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Status" name="unitType_name" value="${partMasterBean.unitType.unitType_name}" readonly>
		</div>
		<div class="col-lg-2">
			<p class="help-block"><b>Location:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Status" name="location_name" value="${partMasterBean.location.location_name}" readonly>
		</div>		
	</div>
	<br>
		                        
	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Maker/Brand:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Status" name="maker_name" value="${partMasterBean.maker.maker_name}" readonly>
		</div>
		<div class="col-lg-2">
			<p class="help-block"><b>Mold/Type:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Status" name="moldType_name" value="${partMasterBean.moldType.moldType_name}" readonly>
		</div>		
	</div>
	<br>

	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Rank:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Rank" name="rank_name" value="${partMasterBean.rank_name}" readonly>
		</div>
		<div class="col-lg-2">
			<p class="help-block"><b>Status:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Status" name="activeFlag_name" value="${partMasterBean.activeFlag_name}" readonly>
		</div>
						
	</div>
</div>
	                        
	                        
	                        <div class="panel-footer">
		                        <input type ="button" value="Delete" name="rAction" role="button" class="btn btn-info" onclick="doDel('${partMasterBean.part_ID}')">
						 	  	<a href="${cPath}/partMaster/partMaster_edit.htm?part_ID=${partMasterBean.part_ID}" class="btn btn-warning" role="button" aria-pressed="true" value="edit" name="rAction">Edit</a>
						 	  	<a href="${cPath}/partMaster/partMaster_list.htm" class="btn btn-secondary" role="button" aria-pressed="true">Back to List</a> 
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
 	function doDel(part_ID){
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