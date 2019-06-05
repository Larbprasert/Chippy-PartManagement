<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="listpartMaster" class="com.service.partMasterService"></jsp:useBean>  

<%@ page import="com.entity.partMasterBean" %>
<%@page import="com.entity.userBean"%>

<%@page import="java.util.Vector" %>
  
<jsp:include page="../pages/header.jsp"></jsp:include>
 
 <jsp:include page="../pages/rSide.jsp"></jsp:include>
<%

HttpServletRequest req=(HttpServletRequest)request;
if(req.getSession().getAttribute("user_name")==null){
	response.sendRedirect("/login.jsp");
}else{
		
}

userBean currentUser = (userBean)session.getAttribute("user_name");	
			
%> 

<form action="/PartManagement/partMasterServlet" method="post">

<input class="form-control" id="user_ID" name ="user_ID" type="hidden" value="<%=currentUser.getUser_ID()%>">

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Part Master List</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <div class="row">
	            <div class="col-lg-12">
		            <div class="panel panel-default">
		                <div class="panel-heading">
		                    <a href="../partMaster/create.jsp" name="rAction" value="Create"><i class="fa fa-plus fa-fw"></i> Register new part master</a>
		                </div>
		                <!-- /.panel-heading -->
		                
		                <div class="panel-body">
<!-- 		                    <div class="table-responsive"> -->
	<!-- 	                        <table class="table table-striped"> -->
	
	                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
		                            <thead>
		                                <tr>
		                                    <th>#</th>
		                                    <th>Part ID</th>
		                                    <th>Part Name</th>
		                                    <th>Maker/Brand</th>
		                                    <th>Mold/Type</th>
		                                    <th>Qty</th>
		                                    <th>Status</th>
		                                </tr>
		                            </thead>
		                            
		                            <tbody>
	<%
		Vector<PartMasterBean> vList = listpartMaster.getAll();
		    for (int i=0;i <vList.size();i++){
		    	PartMasterBean partMasterBean =(PartMasterBean)vList.elementAt(i);
	%>
<%-- 		                            <% System.out.println(partMasterBean.getPartMaster_ID()); %> --%>
		                                <tr>
		                                    <td><%=i+1 %></td>
		                                    <td><a href="../partMaster/view.jsp?part_ID=<%=partMasterBean.getPart_ID() %>"><%=partMasterBean.getPart_ID() %></a></td>
		                                    <td><%=partMasterBean.getPart_name() %></td>
		                                    <td><%=partMasterBean.getMaker_name() %></td>
		                                    <td><%=partMasterBean.getMoldType_name() %></td>
		                                    <td><%=partMasterBean.getQty() %></td>
		                                    <td><%=partMasterBean.getActiveFlag_name() %></td>
		                                </tr>
	<%
	} 
	%>	                               
		                            </tbody>
		                        </table>

		                    <!-- /.table-responsive -->
		                    
		                </div>
		                <!-- /.panel-body -->
		            </div>
		            <!-- /.panel -->
		        </div>
			</div>
	</div>
</form>

<jsp:include page="../pages/footer.jsp"></jsp:include>