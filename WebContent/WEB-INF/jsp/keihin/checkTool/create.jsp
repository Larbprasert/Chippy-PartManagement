<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="uTypeService" class="com.service.checkToolService"></jsp:useBean>    

<%@page import="com.entity.CheckToolBean" %>
<%@page import="com.entity.userBean" %>
<%@page import="java.util.Vector" %>

<jsp:useBean id="listTiming" class="com.service.timingService"></jsp:useBean>
<%@page import="com.entity.timingBean" %>

<jsp:useBean id="listActiveFlag" class="com.service.activeFlagService"></jsp:useBean>
<%@page import="com.entity.activeFlagBean" %>

  
<jsp:include page="../pages/header.jsp"></jsp:include>
 
<jsp:include page="../pages/rSide.jsp"></jsp:include>

<% 
userBean currentUser = (userBean)session.getAttribute("user_name");	

System.out.println(currentUser.getUser_ID());

%>  

<form action="/PartManagement/checkToolServlet" method="post">

<input class="form-control" id="user_ID" name ="user_ID" type="hidden" value="<%=currentUser.getUser_ID()%>">

<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">CheckTool - Create</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <div class="row">
             	<div class="col-lg-3">
				
				</div>   
				           
            	<div class="col-lg-6">
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                            <b>CheckTool :</b> Create New 
                        </div>
                        

                       		<div class="panel-body">
                       		
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Check Tool ID : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="CheckTool ID" name="checkTool_ID" value="" >
                       				</div>	
                       			</div>
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Check Tool Name : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="checkTool Name" name="checkTool_name" value="" >
                       				</div>	
                       			</div>
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Timing</b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<select class="form-control" name="timing" required>
										<% 										

										Vector<timingBean> timingList = listTiming.getTiming();	
										
										for (int i=0;i <timingList.size();i++){											
											timingBean timing =(timingBean)timingList.elementAt(i);
											//System.out.println(province.getProvince_name_tha());
										%>
										<option value="<%=timing.getTiming_code() %>"><%=timing.getTiming_name() %></option>
										<%
										} 
										%>											
	                                </select>
                       				</div>	
                       			</div>
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Status</b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<select class="form-control" name="activeFlag" required>
										<% 										

										Vector<activeFlagBean> activeFlagList = listActiveFlag.getActiveFlag();	
										
										for (int i=0;i <activeFlagList.size();i++){											
											activeFlagBean activeFlag =(activeFlagBean)activeFlagList.elementAt(i);
											//System.out.println(province.getProvince_name_tha());
										%>
										<option value="<%=activeFlag.getactiveFlag_code() %>"><%=activeFlag.getactiveFlag_name() %></option>
										<%
										} 
										%>											
	                                </select>
                       				</div>	
                       			</div>                                 
	                        </div>
	                        <div class="panel-footer">
                                <input type ="submit" value="Create" name="rAction" role="button" class="btn btn-success">
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