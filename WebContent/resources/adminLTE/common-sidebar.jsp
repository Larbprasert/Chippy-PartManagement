<aside class="main-sidebar"  th:fragment="common-sidebar" >
    
     <section class="sidebar">


      <div class="user-panel" >
        <div class="pull-left image" style="width: 88px">
          <img  style="max-width: 85px"  src="<%=request.getContextPath()%>/resources/images/tp/TPAC-TPCC.png" class="img-circle" alt="User Image"/>
        </div>

 			<form action="#" method="get" class="sidebar-form clock">
               	<div  id="clockdate"> 
                     <div class="clockdate-wrapper">
						<div id="nav_clock"></div>
					   	 <div id="nav_date"></div>
					  	</div>
			  </div>
             </form> 
        
      </div>


      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header"><strong>Navigation Menu</strong> 
				<span id="online-status" class="pull-right badge">Offline</span>
         </li>
        
<!--         <li class="active treeview menu-open"> -->
		<%-- <li class="treeview" >
              <a href="#">
                  <i class="fa fa-dashboard"></i>
                  <span>LSP Dashboard</span>
                  <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
<!--                                 <li><a href="pages/charts/morris.html"><i class="fa fa-angle-double-right"></i> Morris</a></li> -->
<!--                                 <li><a href="pages/charts/flot.html"><i class="fa fa-angle-double-right"></i> Flot</a></li> -->
             	      <li class="<%=showDashboard%>"><a href="<%=request.getContextPath()%>/MainServlet?action=DashboardActionPre&page=dashboard" class="smoothScroll"><i class='fa fa-angle-double-right'></i>Summary all Dealer by Month</a></li>
				      <li class="<%=showCompare%>" ><a href="<%=request.getContextPath()%>/MainServlet?action=DashboardActionPre&page=compare" class="smoothScroll"><i class='fa fa-angle-double-right'></i>Compare by Dealer by Month</a></li>
              
              </ul>
          </li> --%>
          
        <!--   <li class="treeview" >
          
              <a href="#">
                  <i class="fa fa-microchip"></i> <span>System Manage</span>
                  <i class="fa fa-angle-left pull-right"></i>
              </a>
              
              <ul class="treeview-menu">
                                <li><a href="pages/examples/invoice.html"><i class="fa fa-angle-double-right"></i> Invoice</a></li>
                  <li><a href="/reloadCache" target="_blank"><i class="fa fa-angle-double-right"></i>Reload Cache</a></li>
              </ul>
          </li> -->
          
           <li class="treeview">
	            <a  href="#" ><i class="fa fa-history"></i> 
	             <span><spring:message code="menu.history"/> </span>
                  <i class="fa fa-angle-left pull-right"></i>
	            </a>
	             <ul class="treeview-menu">
		             <li><a href="${cPath}/history/person.htm" ><i class='fa fa-address-card-o'></i><span>Personal/Training  History</span></a></li>
		             <li class="divider"></li>
					<li><a href="${cPath}/history/course.htm" ><i class='fa fa-briefcase'></i><span>Course/Training History</span></a></li>
		             <li class="divider"></li>
					<li><a href="${cPath}/history/reportSum.htm"><i class='fa fa-bar-chart'></i><span>Training Summary Report</span></a></li>
	            </ul>
	          </li>
          
          <security:authorize access="hasAnyRole('EDIT','DELETE')">
		          <li class="treeview">
		            <a  href="#" ><i class="fa fa-calendar-check-o"></i><span> Management </span><i class="fa fa-angle-left pull-right"></i></a>
		            <ul class="treeview-menu"  >
			             <li><a href="${cPath}/manage/training_manage.htm" class="smoothScroll"><i class='fa fa-edit'></i> Personal/Training Manage</a></li>
			             <li class="divider"></li>
			             <li><a href="${cPath}/manage/job_course_manage.htm" class="smoothScroll"><i class='fa fa-graduation-cap'></i> Course/Training Manage</a></li>
<!-- 			             <li class="divider"></li> -->
<%-- 						 <li><a href="${cPath}/file/upload.htm" class="smoothScroll"><i class='fa fa-upload'></i> Upload File </a></li> --%>
<!-- 						 <li class="divider"></li> -->
		            </ul>
		          </li>
		          
		          <li class="treeview">
		            <a  href="#" ><i class="fa fa-gears"></i><span> Maintenance </span><i class="fa fa-angle-left pull-right"></i></a>
		            <ul class="treeview-menu"  >
<%-- 			             <li><a href="${cPath}/maintain/asset.htm" class="smoothScroll"><i class='fa fa-laptop'></i> Asset Maintenance</a></li> --%>
<!-- 			             <li class="divider"></li> -->
			             <li><a href="${cPath}/maintain/owner.htm" class="smoothScroll"><i class='fa fa-id-card'></i> Contractor Maintenance</a></li>
			             <li class="divider"></li>
			             <li><a href="${cPath}/maintain/course.htm" class="smoothScroll"><i class='fa fa-briefcase'></i> Course Maintenance</a></li>
			             <li class="divider"></li>
<%-- 			             <li><a href="${cPath}/maintain/dept.htm" class="smoothScroll"><i class='fa fa-building'></i> Department Maintenance</a></li> --%>
<!-- 			             <li class="divider"></li> -->
			             <li><a href="${cPath}/maintain/parameter.htm" class="smoothScroll"><i class='fa fa-hashtag'></i> Parameter Maintenance</a></li>
			             
		            </ul>
		          </li>
				  </security:authorize>
		           
		          <security:authorize access="hasAnyRole('ROLE_ADMIN')">
			          <li class="treeview">
			            <a  href="#" ><i class="fa fa-microchip"></i><span> System Manage </span><i class="fa fa-angle-left pull-right"></i></a>
			            <ul class="treeview-menu" >
				             <li><a href="${cPath}/admin/user/viewUser.htm" class="smoothScroll"><i class='fa fa-users'></i> User Management</a></li>
								<li class="divider"></li>
				             <li><a href="${cPath}/reloadCache" target="_blank"><i class='fa fa-refresh'></i> Reload Cache</a></li>
<!-- 				             <li class="divider"></li> -->
<%-- 				             <li><a href="${cPath}/admin/user/viewRole.htm" class="smoothScroll"> Role Management</a></li> --%>
			            </ul>
			          </li>
		          </security:authorize>
          
      </ul>
      
      
            <!-- Sidebar user panel -->

    </section>
    
 </aside>
 
 
<script>
$(function () {		
		function _StartDateTime() {
		    var today = new Date();
		    var hr = today.getHours();
		    var min = today.getMinutes();
		    var sec = today.getSeconds();
		    ap = (hr < 12) ? "<span>AM</span>" : "<span>PM</span>";
		    hr = (hr == 0) ? 12 : hr;
		    hr = (hr > 12) ? hr - 12 : hr;
		    //Add a zero in front of numbers<10
		    hr = checkTime(hr);
		    min = checkTime(min);
		    sec = checkTime(sec); 
		    var t_txt = hr + ":" + min + ":" + sec + " " + ap;
		//    document.getElementById("clock").innerHTML = hr + ":" + min + ":" + sec + " " + ap;
		    
		    var months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
		    var days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
		    var curWeekDay = days[today.getDay()];
		    var curDay = today.getDate();
		    var curMonth = months[today.getMonth()];
		    var curYear = today.getFullYear();
		    var date = curWeekDay+", "+curDay+" "+curMonth+" "+curYear;
		    
		    $("#nav_clock").html(t_txt);
		    $("#nav_date").html(date);
		//    document.getElementById("date").innerHTML = date;
		    
		    var time = setTimeout(function(){ _StartDateTime() }, 500);
		}
		
		function checkTime(i) {
		    if (i < 10) {
		        i = "0" + i;
		    }
		    return i;
		}
		
		 _StartDateTime();

});
</script>
 
 
 