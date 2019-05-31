<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="listsection" class="com.service.sectionService"></jsp:useBean> 
<jsp:useBean id="sectionByID" class="com.service.sectionService"></jsp:useBean> 

<%@page import="com.entity.sectionBean" %>
<%@page import="java.util.Vector" %>

 <% 
 	sectionBean sectionBean  = new sectionBean();
 
 	System.out.println(request.getParameter("section_ID"));
	
	 if(request.getParameter("section_ID") !=null){
		 sectionBean = sectionByID.getSectionBeanByID(request.getParameter("section_ID"));	 	
	 }
	 else
	 {
		response.sendRedirect("#"); 
	 }
	 
	 String activeFlag = null;	 
	 if( sectionBean.getActiveFlag() == 1) { 
		activeFlag = "Active"; 
		} else {
		activeFlag = "inActive";
		} 

	 
 %> 
 
  
<jsp:include page="../pages/header.jsp"></jsp:include>
 
<jsp:include page="../pages/rSide.jsp"></jsp:include>

<form action="/PartManagement/sectionServlet" method="post">

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Section View</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <div class="row">
            	<div class="col-lg-3">
				
				</div> 
				            
            	<div class="col-lg-6">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <b>Section :</b> <%=sectionBean.getSection_name() %>
                        </div>                        
                        
                       		<div class="panel-body">
		       					
		                        <div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Section ID:</b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="User Type ID" name="section_ID" value="<%=sectionBean.getSection_ID() %>" readonly>
                       				</div>	
                       			</div>
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Section Name:</b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="section Name" name="section_name" value="<%=sectionBean.getSection_name() %>" readonly>
                       				</div>	
                       			</div>                			
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Department:</b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="Department" name="dept_name" value="<%=sectionBean.getDept_name() %>" readonly>
                       				</div>	
                       			</div>                			
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Status : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="Status" name="activeFlag" value="<%=sectionBean.getActiveFlag_name() %>" readonly>
                       				</div>	
                       			</div>
		                        
		                        			 	       
	                        </div>
	                        <div class="panel-footer">
		                        <a href="delete.jsp?section_ID=<%=sectionBean.getSection_ID() %>" class="btn btn-danger" role="button" aria-pressed="true" value="delete" name="rAction">Delete</a>		                        
						 	  	<a href="edit.jsp?section_ID=<%=sectionBean.getSection_ID() %>" class="btn btn-warning" role="button" aria-pressed="true" value="edit" name="rAction">Edit</a>
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