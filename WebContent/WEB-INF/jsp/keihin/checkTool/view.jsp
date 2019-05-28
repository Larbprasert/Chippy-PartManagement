<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="listcheckTool" class="com.service.checkToolService"></jsp:useBean> 
<jsp:useBean id="checkToolByID" class="com.service.checkToolService"></jsp:useBean> 

<%@page import="com.entity.CheckToolBean" %>
<%@page import="java.util.Vector" %>

 <%
 	CheckToolBean checkToolBean  = new CheckToolBean();
    
    	System.out.println(request.getParameter("checkTool_ID"));
   	
   	 if(request.getParameter("checkTool_ID") !=null){
   		 checkToolBean = checkToolByID.getCheckToolBeanByID(request.getParameter("checkTool_ID"));	 	
   	 }
   	 else
   	 {
   		response.sendRedirect("#"); 
   	 }
 %> 
 
  
<jsp:include page="../pages/header.jsp"></jsp:include>
 
<jsp:include page="../pages/rSide.jsp"></jsp:include>

<form action="/PartManagement/checkToolServlet" method="post">

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">CheckTool View</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <div class="row">
              	<div class="col-lg-3">
				
				</div>   
				           
            	<div class="col-lg-6">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <b>CheckTool :</b> <%=checkToolBean.getCheckTool_name() %>
                        </div>                        
                        

                       		<div class="panel-body">
                       		
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Check Tool ID : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="User Type ID" name="checkTool_ID" value="<%=checkToolBean.getCheckTool_ID() %>" readonly>
                       				</div>	
                       			</div>
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Check Tool Name : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="checkTool Name" name="checkTool_name" value="<%=checkToolBean.getCheckTool_name() %>" readonly>
                       				</div>	
                       			</div>
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Timing : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="Timing" name="timing" value="<%=checkToolBean.getTiming_name() %>" readonly>
                       				</div>	
                       			</div>
                       			<br>                       		
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Status : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="Status" name="activeFlag" value="<%=checkToolBean.getActiveFlag_name() %>" readonly>
                       				</div>	
                       			</div>		       							 	       
	                        </div>
	                        
	                        <div class="panel-footer">
		                        <a href="delete.jsp?checkTool_ID=<%=checkToolBean.getCheckTool_ID() %>" class="btn btn-danger" role="button" aria-pressed="true" value="delete" name="rAction">Delete</a>		                        
						 	  	<a href="edit.jsp?checkTool_ID=<%=checkToolBean.getCheckTool_ID() %>" class="btn btn-warning" role="button" aria-pressed="true" value="edit" name="rAction">Edit</a>
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