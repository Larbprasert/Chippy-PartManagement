<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="listmaker" class="com.service.makerService"></jsp:useBean> 
<jsp:useBean id="listDepartment" class="com.service.departmentService"></jsp:useBean>  
<jsp:useBean id="makerByID" class="com.service.makerService"></jsp:useBean> 
<jsp:useBean id="listProvince" class="com.service.provinceService"></jsp:useBean> 

<jsp:useBean id="listActiveFlag" class="com.service.activeFlagService"></jsp:useBean>
<%@page import="com.entity.activeFlagBean" %>  
   
<%@ page import="com.entity.makerBean" %>
<%@ page import="com.entity.userBean" %>
<%@page import="com.entity.departmentBean" %>
<%@page import="com.entity.provinceBean" %>
<%@page import="com.service.provinceService" %>

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
 	 
 	 userBean currentuser = (userBean)session.getAttribute("user_name");
 %> 
 
  
<jsp:include page="../pages/header.jsp"></jsp:include>
 
 <jsp:include page="../pages/rSide.jsp"></jsp:include>

<form action="/PartManagement/makerServlet" method="post">

<input class="form-control" id="user_ID" name ="user_ID" type="hidden" value="<%=currentuser.getUser_ID() %>">
            
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Maker - Edit</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <div class="row">
				            
            	<div class="col-lg-12">
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                            <b>Maker :</b> <%=makerBean.getMaker_name() %> 
                        </div>
                        
                      		<div class="panel-body">
                       			<div class="row">
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Maker ID: </b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="text" class="form-control" placeholder="Maker ID" name="maker_ID" value="<%=makerBean.getMaker_ID()%>" readonly>
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
                       					<input type="text" class="form-control" placeholder="Maker Name" name="maker_name" value="<%=makerBean.getMaker_name()%>"  required>
                       				</div>
                       			</div>
                       			
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Contact Name:</b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="text" class="form-control" placeholder="Name" name="maker_contactName" value="<%=makerBean.getMaker_contactName()%>" required>
                       				</div>
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Lastname: </b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="text" class="form-control" placeholder="Surname" name="maker_contactLastName" value="<%=makerBean.getMaker_contactLastName()%>" required>
                       				</div>
                       			</div>

                       			<br>
                       			<div class="row">
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Tel:</b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="text" class="form-control" placeholder="Tel." name="maker_tel" value="<%=makerBean.getMaker_tel()%>" required>
                       				</div>
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Email: </b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<input type="email" class="form-control" name="maker_email" placeholder="Email" value="<%=makerBean.getMaker_email()%>" required>
                       				</div>
                       			</div>

                       			<br>
                       			<div class="row">
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Address:</b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<textarea class="form-control" rows="3" name="maker_address1" ><%=makerBean.getMaker_address1()%></textarea>
                       				</div>
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Province: </b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<select class="form-control" name="maker_province" required>
										<% 										

										Vector<provinceBean> provinceList = listProvince.getProvince();
										%>
										
										<option value="<%=makerBean.getMaker_province()%>"><%=makerBean.getMaker_province() %></option>
										
										<%
										for (int i=0;i <provinceList.size();i++){											
											provinceBean province =(provinceBean)provinceList.elementAt(i);

											if (!province.getProvince_name_tha().equals(makerBean.getMaker_province())){
												%>
												<option value="<%=province.getProvince_code()%>"><%=province.getProvince_name_tha() %></option>
												<%												
											}										
										} 
										%>											
	                                	</select>
                       				</div>
                       			</div>
 
 								<br>
                        		<div class="row">
                       				<div class="col-lg-2">
                       					<p class="help-block"><b>Status</b></p>
                       				</div>
                       				<div class="col-lg-4">
                       					<select class="form-control" name="activeFlag" required>
										<% 										

										Vector<activeFlagBean> activeFlagList = listActiveFlag.getActiveFlag() ;
										%>
										
										<option value="<%=makerBean.getActiveFlag() %>"><%=makerBean.getActiveFlag_name() %></option>
										
										<%
										for (int i=0;i <activeFlagList.size();i++){											
											activeFlagBean activeFlag =(activeFlagBean)activeFlagList.elementAt(i);
 											if (!activeFlag.getactiveFlag_name().equals(makerBean.getActiveFlag_name())){
												%>
												<option value="<%=activeFlag.getactiveFlag_code() %>"><%=activeFlag.getactiveFlag_name() %></option>
												<%												
											}										
										} 
										%>											
	                                	</select>
                       				</div>
                       				<div class="col-lg-6">
                       					
                       				</div>
                       			</div>
                       			
	                        </div>
	                        	                        
	                       <div class="panel-footer">
                                <input type ="submit" value="Edit" name="rAction" role="button" class="btn btn-warning">
                                <a type="reset" class="btn btn-default" href="list.jsp" role="button">Cancel</a>                                  
	                        </div>		                        
	                        

					</div>  
                </div>
                
             
           	</div>
                <!-- /.col-lg-4 -->
           	</div>

</form>

<jsp:include page="../pages/footer.jsp"></jsp:include>