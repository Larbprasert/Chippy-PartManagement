 <!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>

  
<form action="${cPath}/machine/machine_save.htm" method="post" id="myForm" data-toggle="validator" >

<input name ="rAction" type="hidden" value="Create">

<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Machine - Create</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <div class="row">
             	<div class="col-lg-3">
				
				</div>   
				           
            	<div class="col-lg-6">
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                            <b>Machine :</b> Create New 
                        </div>

                       		<div class="panel-body">
                       		    <div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Machine ID : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="Machine ID" name="machine_ID" value="" >
                       				</div>	
                       			</div>
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Machine Name : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="Machine Name" name="machine_name" value="" >
                       				</div>	
                       			</div>                       			
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Production Line : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<select class="form-control" name="productionLine.productionLine_ID" required>
											  <c:forEach var="item" items="${LOV_PRODUCTIONLINE}">
										     	<option value="${item.code}" ${item.code == machineBean.productionLine.productionLine_ID ? 'selected="selected"' : ''}  >${item.descTH}</option>
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
										     	<option value="${item.code}" ${item.code == machineBean.activeFlag ? 'selected="selected"' : ''}  >${item.descTH}</option>
										    </c:forEach>				
	                                	</select>
                       				</div>	
                       			</div>
                                
                                <br>
								<!-- /.row -->
<!--                                 <div class="row"> -->
<!--                                 	<div class="col-lg-12"> -->
<!--                                 		<p class="help-block question"><b> รายละเอียดการใช้อะไหล่  </b> </p>	 -->
<!--                                 	</div> -->
<!--                                 </div> -->
                                <!-- /.row --> 


                                <!-- /.row -->
                                <div class="row" >
                                	<div class="col-lg-12">
                                	
										<div class="table-title">
							                <div class="row">
							                    <div class="col-sm-12"  >
							                    	<button type="button" class="btn btn-info add-new" id="btnnewPart" onclick="popupAddpart()"><i class="fa fa-plus"></i> Add Part</button>                     	 
							                    	&nbsp;<button type="button" class="btn btn-danger" id="btnDelPart" onclick="selectDelete()"><i class="fa fa-trash-o"></i> Delete Part</button>                     	 
							                    </div>                    
							                </div>
							            </div>
						 
										<%@ include file="machine_add_part.jsp"%> 
						 
										<table id="part-table" class="table table-striped table-hover table-bordered">
							                <thead class="bg-green color-palette">
							                    <tr>
							                        <th>#</th>
							                        <th>Part ID</th>
							                        <th>Part Name</th>
													<th>Qty</th>
							                        <th>Actions</th>
							                    </tr>
							                </thead>
							             </table>
									</div>
                               </div>

										<!-- /.row -->

                                
                                  					 	       
	                        </div>
	                        <div class="panel-footer">
                                <input type ="button" value="Save"   role="button" class="btn btn-info" onclick="doSaveMachine()" >
                                <a type="reset" class="btn btn-default" href="${cPath}/machine/machine_list.htm"  role="button" >Cancel</a> 
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
 
function doSaveMachine() {
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