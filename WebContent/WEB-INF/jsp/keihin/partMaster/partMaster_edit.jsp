<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="partMasterByID" class="com.service.partMasterService"></jsp:useBean> 
<jsp:useBean id="listpartMaster" class="com.service.partMasterService"></jsp:useBean>    
<jsp:useBean id="uTypeService" class="com.service.partMasterService"></jsp:useBean>  
<jsp:useBean id="listmoldType" class="com.service.moldTypeService"></jsp:useBean> 
<jsp:useBean id="listmaker" class="com.service.makerService"></jsp:useBean> 
<jsp:useBean id="listunitType" class="com.service.unitTypeService"></jsp:useBean>
<jsp:useBean id="listlocation" class="com.service.locationService"></jsp:useBean>

<jsp:useBean id="listActiveFlag" class="com.service.activeFlagService"></jsp:useBean>
<%@page import="com.entity.activeFlagBean" %> 

<%@page import="com.entity.userBean" %>
<%@page import="com.entity.partMasterBean" %>
<%@page import="com.entity.userBean" %>
<%@page import="com.entity.moldTypeBean" %>
<%@page import="com.entity.makerBean" %>
<%@page import="com.entity.unitTypeBean" %>
<%@page import="com.entity.locationBean" %>


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
 	 
 	 userBean currentUser = (userBean)session.getAttribute("user_name");
 %> 
 
  
<jsp:include page="../pages/header.jsp"></jsp:include>
 
 <jsp:include page="../pages/rSide.jsp"></jsp:include>

<form action="/PartManagement/partMasterServlet" method="post">

<input class="form-control" id="user_ID" name ="user_ID" type="hidden" value="<%=currentUser.getUser_ID()%>">
<input class="form-control" id="sysPart_ID" name ="sysPart_ID" type="hidden" value="<%=partMasterBean.getSysPart_ID() %>">

<!-- <input class="form-control" id="userID" name ="userID" type="hidden" value="Admin"> -->
            
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Part Master - Edit</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <div class="row">
             	<div class="col-lg-2">
				
				</div>   
				           
            	<div class="col-lg-8">
                    <div class="panel panel-warning">
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
			<input type="text" class="form-control" placeholder="Min Stock" name="min_stock" value="<%=partMasterBean.getMin_stock() %>" >
		</div>
		<div class="col-lg-2">
			<p class="help-block"><b>Max Stock:</b></p>
		</div>
		<div class="col-lg-4">
			<input type="text" class="form-control" placeholder="Max Stock" name="max_stock" value="<%=partMasterBean.getMax_stock() %>" >
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
				%>
				
				<option value="<%=partMasterBean.getUnitType_ID() %>"><%=partMasterBean.getUnitType_name() %></option>
				
				<%										
				
				for (int i=0;i <unitTypeList.size();i++){
					unitTypeBean unitType =(unitTypeBean)unitTypeList.elementAt(i);
					
					if (!unitType.getUnitType_ID().equals(partMasterBean.getUnitType_ID())){
				%>
				<option value="<%=unitType.getUnitType_ID() %>"><%=unitType.getUnitType_name() %></option>
				<%
					}
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
				%>
				
				<option value="<%=partMasterBean.getLocation_ID() %>"><%=partMasterBean.getLocation_name() %></option>
				
				<%											
				
				for (int i=0;i <locationList.size();i++){
					locationBean location =(locationBean)locationList.elementAt(i);
					if (!location.getLocation_ID().equals(partMasterBean.getLocation_ID())){
					
				%>
				<option value="<%=location.getLocation_ID() %>"><%=location.getLocation_name() %></option>
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
			<p class="help-block"><b>Maker/Brand:</b></p>
		</div>
		<div class="col-lg-4">
			<select class="form-control" name="maker_ID" required>
				
				<% 
				Vector<makerBean> makerList = listmaker.getAll();
				%>
				
				<option value="<%=partMasterBean.getMaker_ID() %>"><%=partMasterBean.getMaker_name() %></option>
				
				<%										
				for (int i=0;i <makerList.size();i++){
					makerBean maker =(makerBean)makerList.elementAt(i);
					if (!maker.getMaker_ID().equals(partMasterBean.getMaker_ID())){
				%>
				<option value="<%=maker.getMaker_ID() %>"><%=maker.getMaker_name() %></option>
				<%
					}
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
				%>
				
				<option value="<%=partMasterBean.getMoldType_ID() %>"><%=partMasterBean.getMoldType_name() %></option>
				
				<%										
				
				for (int i=0;i <moldTypeList.size();i++){
					moldTypeBean moldType =(moldTypeBean)moldTypeList.elementAt(i);
					if (!moldType.getMoldType_ID().equals(partMasterBean.getMoldType_ID())){
				%>
				<option value="<%=moldType.getMoldType_ID() %>"><%=moldType.getMoldType_name() %></option>
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
			<p class="help-block"><b>Status:</b></p>
		</div>
		<div class="col-lg-4">
			<select class="form-control" name="activeFlag" required>
				<% 										
				
				Vector<activeFlagBean> activeFlagList = listActiveFlag.getActiveFlag() ;
				%>
				
				<option value="<%=partMasterBean.getActiveFlag() %>"><%=partMasterBean.getActiveFlag_name() %></option>
				
				<%
				for (int i=0;i <activeFlagList.size();i++){											
					activeFlagBean activeFlag =(activeFlagBean)activeFlagList.elementAt(i);
						if (!activeFlag.getactiveFlag_name().equals(partMasterBean.getActiveFlag_name())){
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
                                <a type="reset" class="btn btn-default" href="list.jsp" role="button" >Cancel</a>
                                
<%--                                 <%=partMasterBean.getSysPart_ID() %> --%>
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