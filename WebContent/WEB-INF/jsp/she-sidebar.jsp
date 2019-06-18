
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">


		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu" data-widget="tree">

			<li class="header text-center">
<%-- 			<img src="${cPath}/resources/images/tp/TPAC-TPCC.png" height="45px" /> --%>
<%-- 			<img src="${cPath}/resources/images/logo_mg_sm.png" height="45px" /> --%>
				</li>


			<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP')">
				<li><a href="${cPath}/she/home.htm"> <i
						class="fa fa-dashboard"></i> <span>Dashboard</span>
				</a></li>

				<li class="header">Master Data Maintenance</li>

				<li class="treeview"><a href="#"> <i class="fa fa-flask"></i>
						<span>Master Maintenance</span> <span class="pull-right-container"> <i
							class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
					<ul class="treeview-menu">
						<li class="treeview"><a href="#"><i
								class="fa fa-chevron-circle-right"></i>User Type Master<span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span> </a>
							<ul class="treeview-menu">
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP')">
									<li><a href="${cPath}/userType/userType_list.htm"><i
											class="fa fa-chevron-circle-right"></i> Search & Modify </a></li>
								</security:authorize>
							</ul>
						</li>

						<li class="treeview"><a href="#"><i
								class="fa fa-chevron-circle-right"></i>Check Tool Master<span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span> </a>
							<ul class="treeview-menu">
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP')">
									<li><a href="${cPath}/checkTool/checkTool_list.htm"><i
											class="fa fa-chevron-circle-right"></i> Search & Modify </a></li>
								</security:authorize>
							</ul>
						</li>

						<li class="treeview"><a href="#"><i
								class="fa fa-chevron-circle-right"></i>Department Master<span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span> </a>
							<ul class="treeview-menu">
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP')">
									<li><a href="${cPath}/department/department_list.htm"><i
											class="fa fa-chevron-circle-right"></i> Search & Modify </a></li>
								</security:authorize>
							</ul>
						</li>

						<li class="treeview"><a href="#"><i
								class="fa fa-chevron-circle-right"></i>Factory Master<span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span> </a>
							<ul class="treeview-menu">
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP')">
									<li><a href="${cPath}/factory/factory_list.htm"><i
											class="fa fa-chevron-circle-right"></i> Search & Modify </a></li>
								</security:authorize>
							</ul>
						</li>

						<li class="treeview"><a href="#"><i
								class="fa fa-chevron-circle-right"></i>Location Master<span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span> </a>
							<ul class="treeview-menu">
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP')">
									<li><a href="${cPath}/location/location_list.htm"><i
											class="fa fa-chevron-circle-right"></i> Search & Modify </a></li>
								</security:authorize>
							</ul>
						</li>


						<li class="treeview"><a href="#"><i
								class="fa fa-chevron-circle-right"></i>Machine Master<span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span> </a>
							<ul class="treeview-menu">
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP')">
									<li><a href="${cPath}/machine/machine_list.htm"><i
											class="fa fa-chevron-circle-right"></i> Search & Modify </a></li>
								</security:authorize>
							</ul>
						</li>
						
						<li class="treeview"><a href="#"><i
								class="fa fa-chevron-circle-right"></i>Maker Master<span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span> </a>
							<ul class="treeview-menu">
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP')">
									<li><a href="${cPath}/maker/maker_list.htm"><i
											class="fa fa-chevron-circle-right"></i> Search & Modify </a></li>
								</security:authorize>
							</ul>
						</li>

						<li class="treeview"><a href="#"><i
								class="fa fa-chevron-circle-right"></i>Mold Type Master<span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span> </a>
							<ul class="treeview-menu">
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP')">
									<li><a href="${cPath}/moldType/moldType_list.htm"><i
											class="fa fa-chevron-circle-right"></i> Search & Modify </a></li>
								</security:authorize>
							</ul>
						</li>
						
						<li class="treeview"><a href="#"><i
								class="fa fa-chevron-circle-right"></i>Production Line Master<span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span> </a>
							<ul class="treeview-menu">
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP')">
									<li><a href="${cPath}/productionLine/productionLine_list.htm"><i
											class="fa fa-chevron-circle-right"></i> Search & Modify </a></li>
								</security:authorize>
							</ul>
						</li>
						
						<li class="treeview"><a href="#"><i
								class="fa fa-chevron-circle-right"></i>Section Master<span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span> </a>
							<ul class="treeview-menu">
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP')">
									<li><a href="${cPath}/section/section_list.htm"><i
											class="fa fa-chevron-circle-right"></i> Search & Modify </a></li>
								</security:authorize>
							</ul>
						</li>
						
						<li class="treeview"><a href="#"><i
								class="fa fa-chevron-circle-right"></i>Unit Type Master<span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span> </a>
							<ul class="treeview-menu">
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP')">
									<li><a href="${cPath}/unitType/unitType_list.htm"><i
											class="fa fa-chevron-circle-right"></i> Search & Modify </a></li>
								</security:authorize>
							</ul>
						</li>
						
						<li class="treeview"><a href="#"><i
								class="fa fa-chevron-circle-right"></i>Request Type Master<span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span> </a>
							<ul class="treeview-menu">
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP')">
									<li><a href="${cPath}/requestType/requestType_list.htm"><i
											class="fa fa-chevron-circle-right"></i> Search & Modify </a></li>
								</security:authorize>
							</ul>
						</li>
					</ul></li>
					
			</security:authorize>

			<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP','ROLE_MT_STAFF')">
				<li class="treeview"><a href="#"> <i class="fa fa-cubes"></i>
						<span>Utility</span> <span class="pull-right-container"> <i
							class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
					<ul class="treeview-menu">
						<li class="treeview"><a href="#"><i
								class="fa fa-chevron-circle-right"></i> Part Inventory <span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span> </a>
							<ul class="treeview-menu">
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP','ROLE_MT_STAFF' )">
									<li><a href="${cPath}/partMaster/partMaster_list.htm"><i
											class="fa fa-chevron-circle-right"></i>Search & Modify </a></li>
								</security:authorize>
								<li><a href="#"><i
										class="fa fa-chevron-circle-right"></i>Report </a></li>
							</ul></li>
					</ul></li>
			</security:authorize>


			<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP','ROLE_MT_STAFF','ROLE_REQ_MNG', 'ROLE_REQ_SUP', 'ROLE_REQ_USER','ROLE_QA')">
				<li class="header">Request Maintenance Data</li>
				<li class="treeview"><a href="#"> <i class="fa fa-fire"></i>
					<span>Request Maintenance Data</span> <span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
					</span>
					</a>
					<ul class="treeview-menu">
<!-- 						Level #2 -->
						<li class="treeview"><a href="#"> <i class="fa fa-chevron-circle-right"></i> 
								<span>Maintenance Service</span> 
								<span class="pull-right-container"> 
									<i class="fa fa-angle-left pull-right"></i>
								</span>
							</a>
							<ul class="treeview-menu">								
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP','ROLE_MT_STAFF','ROLE_REQ_MNG', 'ROLE_REQ_SUP', 'ROLE_REQ_USER','ROLE_QA')">
<%-- 									<li><a href="${cPath}/gas/gas_requested_list.htm"> <i --%>
									<li><a href="${cPath}/request/requested_list.htm"> <i
											class="fa fa-chevron-circle-right"></i> Requested list
									</a></li>
<%-- 									<li><a href="${cPath}/gas/gas_requested_new.htm"> <i --%>
									<li><a href="${cPath}/request/requested_new.htm"> <i
											class="fa fa-chevron-circle-right"></i> New Request
									</a></li>
								</security:authorize>								
							</ul>
						</li>
						
					</ul>
				</li>
			</security:authorize>



<!-- 			<security:authorize access="hasAnyRole('TRAIN_VIEW','TRAIN_MODIFY')"> -->
<!-- 				<li class="header">Safety Training Record</li> -->


<!-- 				<li class="treeview"><a href="#"> <i class="fa fa-history"></i> -->
<!-- 						<span><spring:message code="menu.history" /></span> <span -->
<!-- 						class="pull-right-container"> <i -->
<!-- 							class="fa fa-angle-left pull-right"></i> -->
<!-- 					</span> -->
<!-- 				</a> -->
<!-- 					<ul class="treeview-menu"> -->
<%-- 						<li><a href="${cPath}/history/reportSum.htm"> <i --%>
<!-- 								class="fa fa-chevron-circle-right"></i> Training Summary Report -->
<!-- 						</a></li> -->
<!-- 					</ul></li> -->

<!-- 				<security:authorize access="hasAnyRole('TRAIN_MODIFY')"> -->
<!-- 					<li class="treeview"><a href="#"> <i -->
<!-- 							class="fa fa-calendar-check-o"></i> <span>Management</span> <span -->
<!-- 							class="pull-right-container"> <i -->
<!-- 								class="fa fa-angle-left pull-right"></i> -->
<!-- 						</span> -->
<!-- 					</a> -->
<!-- 						<ul class="treeview-menu"> -->
<%-- 							<li><a href="${cPath}/manage/training_manage.htm"> <i --%>
<!-- 									class="fa fa-chevron-circle-right"></i> Personal Training -->
<!-- 							</a></li> -->
<%-- 							<li><a href="${cPath}/manage/job_course_manage.htm"> <i --%>
<!-- 									class="fa fa-chevron-circle-right"></i> Course Training -->
<!-- 							</a></li> -->
<%-- 							<li><a href="${cPath}/manage/job_course_search.htm"> <i --%>
<!-- 									class="fa fa-chevron-circle-right"></i> Personal / Course -->
<!-- 									Training -->
<!-- 							</a></li> -->
<%-- 							<li><a href="${cPath}/manage/job_course_add.htm"> <i --%>
<!-- 									class="fa fa-chevron-circle-right"></i> Create Course Training -->
<!-- 							</a></li> -->
<!-- 						</ul></li> -->
<!-- 					<li class="treeview"><a href="#"> <i class="fa fa-wrench"></i> -->
<!-- 							<span>Maintenance</span> <span class="pull-right-container"> -->
<!-- 								<i class="fa fa-angle-left pull-right"></i> -->
<!-- 						</span> -->
<!-- 					</a> -->
<!-- 						<ul class="treeview-menu"> -->
<%-- 							<li><a href="${cPath}/maintain/owner.htm"> <i --%>
<!-- 									class="fa fa-chevron-circle-right"></i> Contractor Maintenance -->
<!-- 							</a></li> -->
<%-- 							<li><a href="${cPath}/maintain/course.htm"> <i --%>
<!-- 									class="fa fa-chevron-circle-right"></i> Course Maintenance -->
<!-- 							</a></li> -->
<%-- 							<li><a href="${cPath}/maintain/positionCourse.htm"> <i --%>
<!-- 									class="fa fa-chevron-circle-right"></i> Training Need by Job -->
<!-- 									Position -->
<!-- 							</a></li> -->
<!-- 						</ul></li> -->
<!-- 				</security:authorize> -->
<!-- 			</security:authorize> -->




			<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG')">

				<li class="header">System Configuration</li>

				<!-- 					<li class="header">Authorization</li> -->

				<li><a href="${cPath}/admin/user/viewUser.htm"> <i
						class="fa fa-users"></i> <span>User Management</span>
				</a></li>

				<li><a href="${cPath}/maintain/parameter.htm"> <i
						class="fa  fa-hashtag"></i> <span>Parameter Config</span>
				</a></li>

<%-- 				<li><a href="${cPath}/reloadCache" target="_blank"> <i --%>
<!-- 						class="fa  fa-refresh"></i> <span>Reload Cache</span> -->
<!-- 				</a></li> -->

			</security:authorize>

		</ul>
	</section>
	<!-- /.sidebar -->
</aside>



<script type="text/javascript">
	var url = window.location;

	$('.sidebar-menu ul li').find('a').each(function() {
		var link = new RegExp($(this).attr('href'));
		if (link.test(document.location.href)) {
			if (!$(this).parents().hasClass('active')) {
				$(this).parents('li').addClass('menu-open');
				$(this).parents().addClass("active");
				$(this).addClass("active");
			}
		}
	});

	// for sidebar menu entirely but not cover treeview
	$('ul.sidebar-menu a').filter(function() {
		return this.href == url;
	}).parent().addClass('active');
	//Top bar
	$('ul.navbar-nav a').filter(function() {
		return this.href == url;
	}).parent().addClass('active');

	// for treeview
	$('ul.treeview-menu a').filter(function() {
		return this.href == url;
	}).parentsUntil(".sidebar-menu > .treeview-menu").addClass('active');
	
	console.log(url);
	
</script>
