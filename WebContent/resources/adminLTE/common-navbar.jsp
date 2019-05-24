<%-- <%@ page import="com.infoservice.lsp.common.bean.UserInfo"%> --%>
<%
// 	JspHelper helper = new JspHelper(request);
// 	UserInfo subject = (UserInfo) request.getSession().getAttribute("user_info");
	String name = "Annonymous";
	String showDashboard = ""; 
	String showCompare = ""; 
	String showCompareData = ""; 
	String func = ""; 
	/* if(null!=subject){
		name = subject.getUserName();
		func = subject.getMyFuctionStr();
		showDashboard = func.indexOf("SF0790")>=0? "" : showDashboard;
		showCompare = func.indexOf("SF0791")>=0? "" : showCompare;
		showCompareData = func.indexOf("SF0792")>=0? "" : showCompareData;
	} */
%>
<header class="main-header" th:fragment="common-navbar">

       <a th:href="@{/home}" class="logo">
<!--           DMS Web Portal -->
             <span class="logo-mini"><b>SHE</b></span>
      		<span class="logo-lg">SAFETY RECORD</span>
      
      </a>
      
      <!-- Header Navbar: style can be found in header.less -->
      <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="<%=request.getContextPath()%>/resources/images/tp/avatar.png" class="user-image"  />
              <span class="hidden-xs">${fullName}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="<%=request.getContextPath()%>/resources/images/tp/avatar.png" class="img-circle" alt="User Image"/>

                <p>
                 ${fullName} 
<%--                   <small> <%=showCompareData %></small> --%>
                </p>
              </li>
              <!-- Menu Body -->
             <!--  <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">Followers</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Sales</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Friends</a>
                  </div>
                </div>
                /.row
              </li> -->
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a  href="${cPath}/profile/viewProfile.htm?userId=${_userProfile.userId}" class="btn btn-default btn-flat"  ><i class="fa fa-user"></i> Profile</a>
                </div>
                <div class="pull-right">
                  <a href="${cPath}/logout.htm" class="btn btn-default btn-flat"  ><i class="fa fa-sign-out"></i> Logout  </a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
<!--           <li> -->
<!--             <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a> -->
<!--           </li> -->
        </ul>
      </div>
    </nav>
    
  </header>
  
  