<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="listlocation" class="com.service.locationService"></jsp:useBean> 
<jsp:useBean id="locationByID" class="com.service.locationService"></jsp:useBean> 

<%@page import="com.entity.locationBean" %>
<%@page import="java.util.Vector" %>

 <% 
 	locationBean locationBean  = new locationBean();
 
 	System.out.println(request.getParameter("location_ID"));
	
	 if(request.getParameter("location_ID") !=null){
		 locationBean = locationByID.getLocationBeanByID(request.getParameter("location_ID"));	 	
	 }
	 else
	 {
		response.sendRedirect("#"); 
	 }
	 
	 String activeFlag = null;	 
	 if( locationBean.getActiveFlag() == 1) { 
		activeFlag = "Active"; 
		} else {
		activeFlag = "inActive";
		} 

	 
 %> 
 
  
<jsp:include page="../pages/header.jsp"></jsp:include>
 
<jsp:include page="../pages/rSide.jsp"></jsp:include>

<form action="/PartManagement/locationServlet" method="post">

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
                            <b>Location :</b> <%=locationBean.getLocation_name() %>
                        </div>                        
                        

                       		<div class="panel-body">
		                        <div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Location ID : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="location ID" name="location_ID" value="<%=locationBean.getLocation_ID() %>" readonly>
                       				</div>	
                       			</div>
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Location Name : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="location Name" name="location_name" value="<%=locationBean.getLocation_name() %> " readonly >
                       				</div>	
                       			</div>                       			
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Factory : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="Factory" name="factory_name" value="<%=locationBean.getFactory_name() %>" readonly>
                       				</div>	
                       			</div>                       			
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Status : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="Status" name="activeFlag" value="<%=locationBean.getActiveFlag_name() %>" readonly>
                       				</div>	
                       			</div>
		                        
		                        				 	       
	                        </div>
	                        <div class="panel-footer">
		                        <a href="delete.jsp?location_ID=<%=locationBean.getLocation_ID() %>" class="btn btn-danger" role="button" aria-pressed="true" value="delete" name="rAction">Delete</a>		                        
						 	  	<a href="edit.jsp?location_ID=<%=locationBean.getLocation_ID() %>" class="btn btn-warning" role="button" aria-pressed="true" value="edit" name="rAction">Edit</a>
						 	  	<a href="list.jsp" class="btn btn-secondary" role="button" aria-pressed="true">Back to List</a>  
	                        </div> 	 	                        

					</div>     
                    </div>
             	<div class="col-lg-3">
				
				</div>                      
                </div>
                <!-- /.col-lg-4 -->
           	</div>

            
</form>            

<jsp:include page="../pages/footer.jsp"></jsp:include>