<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="locationByID" class="com.service.locationService"></jsp:useBean> 
<jsp:useBean id="listlocation" class="com.service.locationService"></jsp:useBean>    
<jsp:useBean id="listfactory" class="com.service.factoryService"></jsp:useBean>  

<jsp:useBean id="listActiveFlag" class="com.service.activeFlagService"></jsp:useBean>
<%@page import="com.entity.activeFlagBean" %>

<%@page import="com.entity.userBean" %>
<%@page import="com.entity.locationBean" %>
<%@page import="com.entity.factoryBean" %>

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
	 
	 userBean currentUser = (userBean)session.getAttribute("user_name");	
	 
 %> 
 
  
<jsp:include page="../pages/header.jsp"></jsp:include>
 
 <jsp:include page="../pages/rSide.jsp"></jsp:include>

<form action="/PartManagement/locationServlet" method="post">

<input class="form-control" id="user_ID" name ="user_ID" type="hidden" value="<%=currentUser.getUser_ID()%>">
            
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Location - Edit</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <div class="row">
             	<div class="col-lg-3">
				
				</div>   
				           
            	<div class="col-lg-6">
                    <div class="panel panel-warning">
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
                       					<input type="text" class="form-control" placeholder="location Name" name="location_name" value="<%=locationBean.getLocation_name() %> " >
                       				</div>	
                       			</div>                       			
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Factory : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<select class="form-control" name="factory_ID" required>
	                                	<% 
										Vector<factoryBean> factoryList = listfactory.getAll();
										%>
										
										<option value="<%=locationBean.getFactory_ID()%>"><%=locationBean.getFactory_name() %></option>
										
										<%
										for (int i=0;i <factoryList.size();i++){
											factoryBean factory =(factoryBean)factoryList.elementAt(i);
											if (!factory.getFactory_ID().equals(locationBean.getFactory_ID())){
											
										%>
										<option value="<%=factory.getFactory_ID()%>"><%=factory.getFactory_name() %></option>
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
										
										<option value="<%=locationBean.getActiveFlag() %>"><%=locationBean.getActiveFlag_name() %></option>
										
										<%
										for (int i=0;i <activeFlagList.size();i++){											
											activeFlagBean activeFlag =(activeFlagBean)activeFlagList.elementAt(i);
 											if (!activeFlag.getactiveFlag_name().equals(locationBean.getActiveFlag_name())){
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