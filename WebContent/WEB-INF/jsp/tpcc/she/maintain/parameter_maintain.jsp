<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@include file="/resources/adminLTE/common.jsp" %>

<body class="${bodySkin}">

<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>

<div class="content-wrapper">

	<section class="content-header">
		 <h1><i class='fa fa-hashtag'></i> Parameter Maintenance</h1>
	</section>
<section class="content">

		<div class="row"><div class="col-lg-12">
		
		

<!-- 	#####  SEARCH >>>>> ####------------------- -->
		
		
		  <fieldset><div class="well">
		   <form class="form-horizontal" id="myForm" commandName="sysParam" method="post"> 
		    
		      <div class="col-lg-6">
	          <div class="form-group">
                    <label for="paramType" class="col-lg-4 control-label">Parameter Type</label>
                    <div class="col-lg-6">
                       <select class="form-control" name="paramType">
                       	<option value="">${_ALL}</option>
                       	 <c:forEach var="item" items="${LOV_PARAM_TYPE}">
                       	 	<option value="${item.code}" ${item.descTH == sysParam.paramType ? 'selected="selected"' : ''}>${item.descTH}</option>
					    </c:forEach>
                      </select>
                    </div>
                  </div>
             </div>
	          
	          
	           <div class="col-lg-6">
	          <div class="form-group">
                    <label for="paramCode" class="col-lg-4 control-label">Parameter Code</label>
                    <div class="col-lg-6">
                       <input type="text" class="form-control" name="paramCode" >
                    </div>
                  </div>
             </div>
	          
             
		      <div class="col-lg-6">
	          <div class="form-group">
                    <label for="paramDesc" class="col-lg-4 control-label">Description TH/EN</label>
                    <div class="col-lg-6">
                       <input type="text" class="form-control" name="descTh" >
                    </div>
                  </div>
             </div>
	          
	          
	          <div class="col-lg-6">
	          <div class="form-group">
                    <label for="paramStatus" class="col-lg-4 control-label">Status</label>
                    <div class="col-lg-6">
                       <select class="form-control" name="active">
                       	<option value="">${_ALL}</option>
                       	<c:forEach var="item" items="${LOV_ACTIVE_TYPE}"> 
					        <option value="${item.code}" ${item.descTH == sysParam.active ? 'selected="selected"' : ''}>${item.descTH}</option>
					    </c:forEach>
                      </select>
                      
                    </div>
                  </div>
             </div>
	          

				<div class="row">
					<div class="col-lg-12">
						<div class="form-group "> 
							<div class="col-lg-12 text-center">
								<button type="reset" class="btn btn-default"> &nbsp;<spring:message code="common.clearBtn"/> <i class="fa fa-refresh"></i></button>&nbsp;&nbsp;
								<button type="button" id="searchBtn" class="btn btn-primary"><spring:message code="common.searchBtn"/> <i class="fa fa-search"></i></button>&nbsp;&nbsp;
<!-- 								<button type="button" class="btn btn-warning" disabled>Export <i class="fa fa-file-excel-o"></i></button> -->
							</div>
						</div>
					</div>
				</div>

				</form></div>
            </fieldset>
            
        </div>
        </div>
<!-- 	##### <<<<<  SEARCH ####------------------- -->
	
		<!-- 	##### <<<<<  TABLE RESULT ####------------------- -->
<!-- 		<button type="button" class="btn btn-primary" onclick="doAdd()"><i class="fa fa-plus"></i>&nbsp;Add Parameter</button> -->
<!-- 		  <br> -->
<!-- 		  <br> -->
		  <div class="box box-primary"> 
			 <div class="box-header with-border">
	              <h3 class="box-title">Result</h3>
	              <div class="box-tools pull-right">
	                <button type="button" class="btn btn-box-tool btn-success btn-table"   onclick="doAdd()"><i class="fa fa-plus"></i> Add
	                </button>
	              </div>
	            </div>
		 
		 <div class="box-body"> 
<!-- 		<div class="bs-docs-section"> -->
<!-- 			<div class="bs-component"> -->
				<table class="table table-striped table-bordered " id="result-table"
					  width="100%">
					<thead class="bg-green color-palette">
						<tr>
							<th class="text-center">Action</th> 
							<th class="text-center">Param Code</th>
							<th class="text-center">Param Type</th>
							<th class="text-center">Desc TH</th>
							<th class="text-center">Desc EN</th>
							<th class="text-center">Value 1</th>
							<th class="text-center">Value 2</th>
							<th class="text-center">Status</th>
							<th class="text-center">Sort No.</th>
							<th class="text-center">Create Date     </th> 
						</tr>
					</thead>
				</table>
			</div>
<!-- 		</div> -->
		
	<!-- 	##### <<<<<  TABLE RESULT ####------------------- -->

</div>
	</div>
		</section>
<!-- 	<hr> -->
	
<%-- 	<%@include file="/WEB-INF/jsp/tpcc/she/maintain/parameter_edit.jsp" %> --%>
	
	
	
		<!-- 	##### <<<<< JAVASCRIPT ####------------------- -->
 <script>
 	
	 	function doAdd(){
			location = cPath+"/param/paramEdit.htm";
	 	}
	 	
	 	function doDel(paramId, name){
			bootbox.confirm({
			    title: "Confirm",
			    size: 'small',
			    message: _confirmDelTxt+" : "+name,
			    buttons: {
			        cancel: {
			            label: '<i class="fa fa-times"></i> Cancel'
			        },
			        confirm: {
			            label: '<i class="fa fa-check"></i> Confirm',
			            className: 'btn-success'
			        }
			    },
			    callback: function (result) {
			        if(result){
			        	$.ajax({
				            url: cPath+"/param/paramDelete?paramId="+paramId
				        }).done(function (result) {
					        bootbox.alert({
							    message: _successDelTxt,
							    size: 'small',
							    callback: function(){doSearch();}
							});
			            }).fail(function (jqXHR, textStatus, errorThrown) { 
			            });
			        }
			    }
			});
		};
		
		function doSearch(){
			$.ajax({
	            url: cPath+"/param/getSysParamTable.json",
	            data: $('#myForm').serialize()
	        }).done(function (result) {
	            rsTable.clear().draw();
	            if(result.recordsTotal>0){
		            rsTable.rows.add(result.data).draw();
	            }else{
	            	bootbox.alert({
					    message: "No Data Found!",
					    size: 'small'
					});
	            }
            }).fail(function (jqXHR, textStatus, errorThrown) { 
                  // needs to implement if it fails
            });
	 	};
		
		var rsTable = $('#result-table').DataTable({
// 			autoWidth: false,
			data:[],
		    columns: [
		     	{ 
		     		"data": "paramCode"
		     		,"sWidth": "3%"
			        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
			            var txt = $roleEdit? "<a href='${cPath}/param/paramEdit.htm?paramId="+oData.paramId+"'><i class='fa fa-edit fa-lg'></i></a>" : "";
			        	if($roleEdit&&$roleDel){ txt +=	"&nbsp;|&nbsp;" };
			        	if($roleDel){ txt += "<a href='javascript:void(0)' onclick=\"doDel('"+oData.paramId+"','"+oData.paramCode+"')\"><i class='fa fa-trash-o fa-lg'></i></a>" };
			            if(oData.paramCode=='PARAM_TYPE') txt = "";
			        	
			        	$(nTd).html(txt);
			        } 
	            },
		     	{ "data": "paramCode","sWidth": "10%" },
				{ "data": "paramType","sWidth": "10%" },
				{ "data": "descTh","sWidth": "10%" },
				{ "data": "descEn","sWidth": "10%" }, 
				{ "data": "value_1","sWidth": "10%" }, 
				{ "data": "value_2","sWidth": "10%" }, 
				{ "data": "active" ,"sWidth": "5%"},
				{ "data": "sortNo" ,"sWidth": "5%"},
				{ "data": "createDateStr" ,"sWidth": "5%"}
		    ],
		    "aoColumnDefs": [
		      { "sClass": "text-center", "aTargets": [0,1,2,5,6,7,8,9] }
		    ],
		    ordering: false,
	   	   	destroy: true
		 });
		
		$("#searchBtn").click(function(){
		  	doSearch();
        });
		
	
</script>
	

</body>

</html>