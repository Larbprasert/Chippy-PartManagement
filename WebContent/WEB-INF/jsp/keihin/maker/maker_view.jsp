<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="listmaker" class="com.service.makerService"></jsp:useBean> 
<jsp:useBean id="makerByID" class="com.service.makerService"></jsp:useBean> 

<%@ page import="com.entity.makerBean" %>
<%@page import="java.util.Vector" %>

 <%
 	MakerBean makerBean  = new MakerBean();
  
  	System.out.println(request.getParameter("maker_ID"));
 	
 	 if(request.getParameter("maker_ID") !=null){
 	 	makerBean = makerByID.getMakerBeanByID(request.getParameter("maker_ID"));	 	
 	 }
 	 else
 	 {
 		response.sendRedirect("#"); 
 	 }
 	 
 	 String activeFlag = null;
 	 if( makerBean.getActiveFlag() == 1) { 
 		activeFlag = "Active"; 
 		} else {
 		activeFlag = "inActive";
 	 	}
 %> 
 

  
<jsp:include page="../pages/header.jsp"></jsp:include>
 
 <jsp:include page="../pages/rSide.jsp"></jsp:include>


        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Maker View</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
			<div class="row">
            	<div class="col-lg-12">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <b>Maker :</b> <%=makerBean.getMaker_name() %> 
                        </div>
                        

                       		<div class="panel-body">
                       			<div class="row">
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Maker ID: </b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="text" class="form-control" placeholder="Maker ID" name="maker_empID" value="<%=makerBean.getMaker_ID()%>" readonly>
                       				</div>
                       				<div class="col-lg-6">
                       					
                       				</div>
                       			</div>
                       			
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Maker Name: </b></p>
                       				</div>
                       				<div class="col-lg-10">
                       					<input type="text" class="form-control" placeholder="Maker Name" name="maker_name" value="<%=makerBean.getMaker_name()%>"  readonly>
                       				</div>
                       			</div>
                       			
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Contact Name:</b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="text" class="form-control" placeholder="Name" name="maker_contactName" value="<%=makerBean.getMaker_contactName()%>" readonly>
                       				</div>
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Lastname: </b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="text" class="form-control" placeholder="Surname" name="maker_contactLastName" value="<%=makerBean.getMaker_contactLastName()%>" readonly>
                       				</div>
                       			</div>

                       			<br>
                       			<div class="row">
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Tel:</b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="text" class="form-control" placeholder="Tel." name="maker_tel" value="<%=makerBean.getMaker_tel()%>" readonly>
                       				</div>
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Email: </b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="email" class="form-control" name="maker_email" placeholder="Email" value="<%=makerBean.getMaker_email()%>" readonly>
                       				</div>
                       			</div>

                       			<br>
                       			<div class="row">
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Address:</b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<textarea class="form-control" rows="3" name="maker_address1" readonly><%=makerBean.getMaker_address1()%></textarea>
                       				</div>
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Province: </b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="text" class="form-control" placeholder="Province" name="maker_province" value="<%=makerBean.getMaker_province() %>" readonly>
                       				</div>
                       			</div>
 
 								<br>
                        		<div class="row">
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Status</b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="text" class="form-control" placeholder="Status" name="activeFlag" value="<%=activeFlag %>" readonly>
                       				</div>
                       				<div class="col-lg-6">
                       					
                       				</div>
                       			</div>
                       			
	                        </div>
	                        
	                        
	                       <div class="panel-footer">
		                        <a href="delete.jsp?maker_ID=<%=makerBean.getMaker_ID() %>" class="btn btn-danger" role="button" aria-pressed="true" value="delete" name="rAction">Delete</a>		                        
						 	  	<a href="edit.jsp?maker_ID=<%=makerBean.getMaker_ID() %>" class="btn btn-warning" role="button" aria-pressed="true" value="edit" name="rAction">Edit</a>
						 	  	<a href="list.jsp" class="btn btn-secondary" role="button" aria-pressed="true">Back to List</a>                                   
	                        </div>		                        

					</div>  
                </div>
                
<!--                 <div class="col-lg-1"> -->
				
<!-- 				</div>   -->
           	</div>
</div>

       

<jsp:include page="../pages/footer.jsp"></jsp:include>