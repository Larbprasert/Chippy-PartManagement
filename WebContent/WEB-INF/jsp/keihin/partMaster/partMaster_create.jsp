<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="uTypeService" class="com.service.partMasterService"></jsp:useBean>  
<jsp:useBean id="listmoldType" class="com.service.moldTypeService"></jsp:useBean> 
<jsp:useBean id="listmaker" class="com.service.makerService"></jsp:useBean> 
<jsp:useBean id="listunitType" class="com.service.unitTypeService"></jsp:useBean>
<jsp:useBean id="listlocation" class="com.service.locationService"></jsp:useBean>

<jsp:useBean id="listActiveFlag" class="com.service.activeFlagService"></jsp:useBean>
<%@page import="com.entity.activeFlagBean" %> 

<%@page import="com.entity.partMasterBean" %>
<%@page import="com.entity.userBean" %>
<%@page import="com.entity.moldTypeBean" %>
<%@page import="com.entity.makerBean" %>
<%@page import="com.entity.unitTypeBean" %>
<%@page import="com.entity.locationBean" %>

<%@page import="java.util.Vector" %>

  
<jsp:include page="../pages/header.jsp"></jsp:include>
 
<jsp:include page="../pages/rSide.jsp"></jsp:include>

<% 
userBean currentUser = (userBean)session.getAttribute("user_name");	

System.out.println(currentUser.getUser_ID());

%>  

<form action="/PartManagement/partMasterServlet" method="post">

<input class="form-control" id="user_ID" name ="user_ID" type="hidden" value="<%=currentUser.getUser_ID()%>">

<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Part Master - Create</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <div class="row">
             	<div class="col-lg-2">
				
				</div>   
				           
            	<div class="col-lg-8">
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                            <b>Part Master :</b> Create New 
                        </div>


<div class="panel-body">

	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Part ID:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Part ID" name="part_ID" value="" >
		</div>
		<div class="col-lg-2">
			<p class="help-block"><b>Part Name:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Part Name" name="part_name" value="" >
		</div>		
	</div>
	<br>
	
	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Qty:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Qty" name="qty" value="" >
		</div>
		<div class="col-lg-2">
			<p class="help-block"><b>Price:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Price" name="price" value="" >
		</div>		
	</div>
	<br>

	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Min Stock:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Min Stock" name="min_stock" value="" >
		</div>
		<div class="col-lg-2">
			<p class="help-block"><b>Max Stock:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Max Stock" name="max_stock" value="" >
		</div>		
	</div>
	<br>
                    		
	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Unit Type:</b></p>
		</div>
		<div class="col-lg-4">
			<select class="form-control" name="unitType_ID" required>	                                	
				<% 
				Vector<unitTypeBean> unitTypeList = listunitType.getAll();
				for (int i=0;i <unitTypeList.size();i++){
					unitTypeBean unitType =(unitTypeBean)unitTypeList.elementAt(i);
				%>
				<option value="<%=unitType.getUnitType_ID() %>"><%=unitType.getUnitType_name() %></option>
				<%
				} 
				%> 
			</select>
		</div>
		<div class="col-lg-2">
			<p class="help-block"><b>Location:</b></p>
		</div>
		<div class="col-lg-4">
			<select class="form-control" name="location_ID" required>	                                	
				<% 
				Vector<locationBean> locationList = listlocation.getAll();
				for (int i=0;i <locationList.size();i++){
					locationBean location =(locationBean)locationList.elementAt(i);
				%>
				<option value="<%=location.getLocation_ID() %>"><%=location.getLocation_name() %></option>
				<%
				} 
				%> 
			</select>
		</div>		
	</div>
	<br>
		                        
	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Maker/Brand:</b></p>
		</div>
		<div class="col-lg-4">
			<select class="form-control" name="maker_ID" required>	                                	
				<% 
				Vector<makerBean> makerList = listmaker.getAll();
				for (int i=0;i <makerList.size();i++){
					makerBean maker =(makerBean)makerList.elementAt(i);
				%>
				<option value="<%=maker.getMaker_ID() %>"><%=maker.getMaker_name() %></option>
				<%
				} 
				%> 
			</select>
		</div>
		<div class="col-lg-2">
			<p class="help-block"><b>Mold/Type:</b></p>
		</div>
		<div class="col-lg-4">
			<select class="form-control" name="moldType_ID" required>	                                	
				<% 
				Vector<moldTypeBean> moldTypeList = listmoldType.getAll();
				for (int i=0;i <moldTypeList.size();i++){
					moldTypeBean moldType =(moldTypeBean)moldTypeList.elementAt(i);
				%>
				<option value="<%=moldType.getMoldType_ID() %>"><%=moldType.getMoldType_name() %></option>
				<%
				} 
				%> 
			</select>
		</div>		
	</div>
	<br>

	<div class="row">
		<div class="col-lg-2">
			<p class="help-block"><b>Status:</b></p>
		</div>
		<div class="col-lg-4">
			<select class="form-control" name="activeFlag" required>
				<% 										
				
				Vector<activeFlagBean> activeFlagList = listActiveFlag.getActiveFlag();	
				
				for (int i=0;i <activeFlagList.size();i++){											
					activeFlagBean activeFlag =(activeFlagBean)activeFlagList.elementAt(i);
				%>
				<option value="<%=activeFlag.getactiveFlag_code() %>"><%=activeFlag.getactiveFlag_name() %></option>
				<%
				} 
				%>											
			</select>
		</div>
		<div class="col-lg-6">
			
		</div>				
	</div>
</div>

                       		
	                        <div class="panel-footer">
                                <input type ="submit" value="Create" name="rAction" role="button" class="btn btn-success">
                                <a type="reset" class="btn btn-default" href="list.jsp" role="button" >Cancel</a>  
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