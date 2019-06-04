<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="machineByID" class="com.service.machineService"></jsp:useBean> 
<jsp:useBean id="listmachine" class="com.service.machineService"></jsp:useBean>  
<jsp:useBean id="listproductionLine" class="com.service.productionLineService"></jsp:useBean>    

<jsp:useBean id="listActiveFlag" class="com.service.activeFlagService"></jsp:useBean>
<%@page import="com.entity.activeFlagBean" %>  

<%@page import="com.entity.userBean" %>
<%@page import="com.entity.machineBean" %>
<%@page import="com.entity.productionLineBean" %>

<%@page import="java.util.Vector" %>


 <%
 	MachineBean machineBean  = new MachineBean();
  
  	System.out.println(request.getParameter("machine_ID"));
 	
 	 if(request.getParameter("machine_ID") !=null){
 		 machineBean = machineByID.getMachineBeanByID(request.getParameter("machine_ID"));	 	
 	 }
 	 else
 	 {
 		response.sendRedirect("#"); 
 	 }
 	 
 	 userBean currentUser = (userBean)session.getAttribute("user_name");
 %> 
 
  
<jsp:include page="../pages/header.jsp"></jsp:include>
 
 <jsp:include page="../pages/rSide.jsp"></jsp:include>

<form action="/PartManagement/machineServlet" method="post">

<input class="form-control" id="user_ID" name ="user_ID" type="hidden" value="<%=currentUser.getUser_ID()%>">
            
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Machine - Edit</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <div class="row">
             	<div class="col-lg-3">
				
				</div>   
				           
            	<div class="col-lg-6">
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                            <b>Machine :</b> <%=machineBean.getMachine_name() %>
                        </div>

                       		<div class="panel-body">
		       					
                                <div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Machine ID : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="User Type ID" name="machine_ID" value="<%=machineBean.getMachine_ID() %>" readonly>
                       				</div>	
                       			</div>
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Machine Name : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="machine Name" name="machine_name" value="<%=machineBean.getMachine_name() %>" >
                       				</div>	
                       			</div>                       			
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Production Line : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<select class="form-control" name="productionLine_ID" required>
	                                	
										<% 
										Vector<productionLineBean> productionLineList = listproductionLine.getAll();
										%>
										
										<option value="<%=machineBean.getProductionLine_ID()%>"><%=machineBean.getProductionLine_name() %></option>
										
										<%
										for (int i=0;i <productionLineList.size();i++){
											productionLineBean ProductionLine =(productionLineBean)productionLineList.elementAt(i);
											if (!ProductionLine.getProductionLine_ID().equals(machineBean.getProductionLine_ID())){
											
										%>
												<option value="<%=ProductionLine.getProductionLine_ID()%>"><%=ProductionLine.getProductionLine_name() %></option>
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
										
										<option value="<%=machineBean.getActiveFlag() %>"><%=machineBean.getActiveFlag_name() %></option>
										
										<%
										for (int i=0;i <activeFlagList.size();i++){											
											activeFlagBean activeFlag =(activeFlagBean)activeFlagList.elementAt(i);
 											if (!activeFlag.getactiveFlag_name().equals(machineBean.getActiveFlag_name())){
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