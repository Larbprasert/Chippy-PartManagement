<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="listpartMaster" class="com.service.partMasterService"></jsp:useBean> 
<jsp:useBean id="partMasterByID" class="com.service.partMasterService"></jsp:useBean> 

<%@page import="com.entity.partMasterBean" %>
<%@page import="java.util.Vector" %>

 <%
 	PartMasterBean partMasterBean  = new PartMasterBean();
  
  	System.out.println(request.getParameter("part_ID"));
 	
 	 if(request.getParameter("part_ID") !=null){
 		 partMasterBean = partMasterByID.getpartMasterBeanByID(request.getParameter("part_ID"));	 	
 	 }
 	 else
 	 {
 		response.sendRedirect("#"); 
 	 }
 	 
 	 String activeFlag = null;	 
 	 if( partMasterBean.getActiveFlag() == 1) { 
 		activeFlag = "Active"; 
 		} else {
 		activeFlag = "inActive";
 		}
 %> 
 
  
<jsp:include page="../pages/header.jsp"></jsp:include>
 
<jsp:include page="../pages/rSide.jsp"></jsp:include>

<form action="/PartManagement/partMasterServlet" method="post">

<input class="form-control" id="sysPart_ID" name ="sysPart_ID" type="hidden" value="<%=partMasterBean.getSysPart_ID() %>">

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Part Master View</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            
            <div class="row">
             	<div class="col-lg-2">
				
				</div>   
				           
            	<div class="col-lg-8">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <b>Part Master :</b> <%=partMasterBean.getPart_name() %>
                        </div>                        
                        		
<div class="panel-body">

	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Part ID:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Part ID" name="part_ID" value="<%=partMasterBean.getPart_ID() %>" readonly>
		</div>
		<div class="col-lg-2">
			<p class="help-block"><b>Part Name:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Part Name" name="part_name" value="<%=partMasterBean.getPart_name() %>" readonly>
		</div>		
	</div>
	<br>
	
	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Qty:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Qty" name="qty" value="<%=partMasterBean.getQty() %>" readonly >
		</div>
		<div class="col-lg-2">
			<p class="help-block"><b>Price:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Price" name="price" value="<%=partMasterBean.getPrice() %>" readonly>
		</div>		
	</div>
	<br>

	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Min Stock:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Min Stock" name="min_stock" value="<%=partMasterBean.getMin_stock() %>" readonly>
		</div>
		<div class="col-lg-2">
			<p class="help-block"><b>Max Stock:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Max Stock" name="max_stock" value="<%=partMasterBean.getMax_stock() %>" readonly>
		</div>		
	</div>
	<br>
                    		
	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Unit Type:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Status" name="unitType_ID" value="<%=partMasterBean.getUnitType_name() %>" readonly>
		</div>
		<div class="col-lg-2">
			<p class="help-block"><b>Location:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Status" name="location_ID" value="<%=partMasterBean.getLocation_name() %>" readonly>
		</div>		
	</div>
	<br>
		                        
	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Maker/Brand:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Status" name="maker_ID" value="<%=partMasterBean.getMaker_name() %>" readonly>
		</div>
		<div class="col-lg-2">
			<p class="help-block"><b>Mold/Type:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Status" name="moldType_ID" value="<%=partMasterBean.getMoldType_name() %>" readonly>
		</div>		
	</div>
	<br>

	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Status:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Status" name="activeFlag" value="<%=activeFlag %>" readonly>
		</div>
		<div class="col-lg-6">
			
		</div>				
	</div>
</div>
	                        
	                        
	                        <div class="panel-footer">
		                        <a href="delete.jsp?part_ID=<%=partMasterBean.getPart_ID() %>" class="btn btn-danger" role="button" aria-pressed="true" value="delete" name="rAction">Delete</a>		                        
						 	  	<a href="edit.jsp?part_ID=<%=partMasterBean.getPart_ID() %>" class="btn btn-warning" role="button" aria-pressed="true" value="edit" name="rAction">Edit</a>
						 	  	<a href="list.jsp" class="btn btn-secondary" role="button" aria-pressed="true">Back to List</a>  
	                        </div> 	 	                        

					</div>     
                    </div>
             	<div class="col-lg-2">
				
				</div>                      
                </div>
                <!-- /.col-lg-4 -->
           	</div>

            
</form>            

<jsp:include page="../pages/footer.jsp"></jsp:include>