<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="sectionByID" class="com.service.sectionService"></jsp:useBean> 
<jsp:useBean id="listsection" class="com.service.sectionService"></jsp:useBean>    
<jsp:useBean id="listDepartment" class="com.service.departmentService"></jsp:useBean>  

<jsp:useBean id="listActiveFlag" class="com.service.activeFlagService"></jsp:useBean>
<%@page import="com.entity.activeFlagBean" %> 

<%@page import="com.entity.userBean" %>
<%@page import="com.entity.sectionBean" %>
<%@page import="com.entity.departmentBean" %>

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
	 
	 userBean currentUser = (userBean)session.getAttribute("user_name");	
	 
 %> 
 
  
<jsp:include page="../pages/header.jsp"></jsp:include>
 
 <jsp:include page="../pages/rSide.jsp"></jsp:include>

<form action="/PartManagement/sectionServlet" method="post">

<input class="form-control" id="user_ID" name ="user_ID" type="hidden" value="<%=currentUser.getUser_ID()%>">
<!-- <input class="form-control" id="userID" name ="userID" type="hidden" value="Admin"> -->
            
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Section - Edit</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <div class="row">
            	<div class="col-lg-3">
				
				</div> 
				            
            	<div class="col-lg-6">
                    <div class="panel panel-warning">
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
                       					<input type="text" class="form-control" placeholder="section Name" name="section_name" value="<%=sectionBean.getSection_name() %>" >
                       				</div>	
                       			</div>                			
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Department:</b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<select class="form-control" name="dept_ID" required>
	                                	
										<% 
										Vector<departmentBean> departmentList = listDepartment.getAll();
										%>
										
										<option value="<%=sectionBean.getDept_ID()%>"><%=sectionBean.getDept_name() %></option>
										
										<%
										for (int i=0;i <departmentList.size();i++){
											departmentBean department =(departmentBean)departmentList.elementAt(i);
											if(!department.getDept_ID().equals(sectionBean.getDept_ID())){
											
										%>
										<option value="<%=department.getDept_ID()%>"><%=department.getDept_name() %></option>
										<%
											}
										} 
										%> 
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
										<% 										

										Vector<activeFlagBean> activeFlagList = listActiveFlag.getActiveFlag() ;
										%>
										
										<option value="<%=sectionBean.getActiveFlag() %>"><%=sectionBean.getActiveFlag_name() %></option>
										
										<%
										for (int i=0;i <activeFlagList.size();i++){											
											activeFlagBean activeFlag =(activeFlagBean)activeFlagList.elementAt(i);
 											if (!activeFlag.getactiveFlag_name().equals(sectionBean.getActiveFlag_name())){
												%>
												<option value="<%=activeFlag.getactiveFlag_code() %>"><%=activeFlag.getactiveFlag_name() %></option>
												<%												
											}										
										} 
										%>											
	                                	</select>
                       				</div>	
                       			</div>
                                
                                
                                		                        
	                        </div>
	                        
	                        <div class="panel-footer">
                                <input type ="submit" value="Edit" name="rAction" role="button" class="btn btn-warning">
                                <a type="reset" class="btn btn-default" href="list.jsp" role="button" >Cancel</a>
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