 <!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
	<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
	<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>

  

<form action="${cPath}/checkTool/checkTool_save.htm" method="post" id="myForm" data-toggle="validator" novalidate="true">

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
			<h1 class="page-header">Check Tool - Edit</h1>
		</section> 
		<hr class="style">
		
		<section class="content">
		
            
            <div class="row">
              	<div class="col-lg-3">
				
				</div>   
				           
            	<div class="col-lg-6">
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                            <b>CheckTool :</b> ${checkToolBean.checkTool_name}
                        </div>
                        

                       		<div class="panel-body">
		       					<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Check Tool ID : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="User Type ID" name="checkTool_ID" value="${checkToolBean.checkTool_ID}" readonly>
                       				</div>	
                       			</div>
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Check Tool Name : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="checkTool Name" name="checkTool_name" value="${checkToolBean.checkTool_name}" >
                       				</div>	
                       			</div>
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Timing : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<select class="form-control" name="timing" required>
										 			 <c:forEach var="item" items="${LOV_TIMING}">
												     	<option value="${item.code}"    ${item.code == checkToolBean.timing ? 'selected="selected"' : ''} >${item.descTH}</option>
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
<%-- 										 			<option value="">${_ALL}</option>  --%>
													 <c:forEach var="item" items="${LOV_ACTIVE_FLG}">
												     	<option value="${item.code}" ${item.code == checkToolBean.activeFlag ? 'selected="selected"' : ''}  >${item.descTH}</option>
												    </c:forEach>				
	                                	</select>
                       				</div>	
                       			</div>	
	                        </div>
	                        <div class="panel-footer">
                                <input type ="button" value="Save" name="rAction" role="button" class="btn btn-info" onclick="doSaveCheckTool()">
                                <a type="reset" class="btn btn-default" href="${cPath}/checkTool/checkTool_list.htm"  role="button" >Cancel</a> 
                                
	                        </div> 		                        

					</div>                     
                             
                    </div>
              	<div class="col-lg-3">
				
				</div>                      
                </div>
                <!-- /.col-lg-4 -->
                </section>
           	</div>

</form>

<script type="text/javascript">

function doSaveCheckTool() {


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
            
            

<%-- <jsp:include page="../pages/footer.jsp"></jsp:include> --%>