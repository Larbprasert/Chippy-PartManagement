
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">


		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu" data-widget="tree">

			<li class="header text-center">
<%-- 			<img src="${cPath}/resources/images/logo_mg_sm.png" height="45px" /> --%>
				</li>


			<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP','ROLE_MT_STAFF')">
				<li><a href="${cPath}/home.htm"> <i
						class="fa fa-dashboard"></i> <span>Dashboard</span>
				</a></li>

				<li class="header">Master Data Maintenance</li>

				<li class="treeview"><a href="#"> <i class="fa fa-wrench"></i>
						<span>Master Maintenance</span> <span class="pull-right-container"> <i
							class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
					<ul class="treeview-menu">
						<security:authorize access="hasAnyRole('ADMIN')">
							<li class="treeview"><a href="#"><i
									class="fa fa-chevron-circle-right"></i>User Type<span
									class="pull-right-container"> <i
										class="fa fa-angle-left pull-right"></i>
								</span> </a>
								<ul class="treeview-menu">
									
									<li><a href="${cPath}/userType/userType_list.htm"><i
											class="fa fa-chevron-circle-right"></i> Search & Modify </a>
									</li>
									
								</ul>
							</li>
						</security:authorize>

						<li class="treeview"><a href="#"><i
								class="fa fa-chevron-circle-right"></i>Check Tool<span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span> </a>
							<ul class="treeview-menu">
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP','ROLE_MT_STAFF')">
									<li><a href="${cPath}/checkTool/checkTool_list.htm"><i
											class="fa fa-chevron-circle-right"></i> Search & Modify </a></li>
								</security:authorize>
							</ul>
						</li>

						<li class="treeview"><a href="#"><i
								class="fa fa-chevron-circle-right"></i>Department<span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span> </a>
							<ul class="treeview-menu">
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP','ROLE_MT_STAFF')">
									<li><a href="${cPath}/department/department_list.htm"><i
											class="fa fa-chevron-circle-right"></i> Search & Modify </a></li>
								</security:authorize>
							</ul>
						</li>

						<li class="treeview"><a href="#"><i
								class="fa fa-chevron-circle-right"></i>Factory<span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span> </a>
							<ul class="treeview-menu">
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP','ROLE_MT_STAFF')">
									<li><a href="${cPath}/factory/factory_list.htm"><i
											class="fa fa-chevron-circle-right"></i> Search & Modify </a></li>
								</security:authorize>
							</ul>
						</li>

						<li class="treeview"><a href="#"><i
								class="fa fa-chevron-circle-right"></i>Location<span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span> </a>
							<ul class="treeview-menu">
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP','ROLE_MT_STAFF')">
									<li><a href="${cPath}/location/location_list.htm"><i
											class="fa fa-chevron-circle-right"></i> Search & Modify </a></li>
								</security:authorize>
							</ul>
						</li>


						<li class="treeview"><a href="#"><i
								class="fa fa-chevron-circle-right"></i>Machine<span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span> </a>
							<ul class="treeview-menu">
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP','ROLE_MT_STAFF')">
									<li><a href="${cPath}/machine/machine_list.htm"><i
											class="fa fa-chevron-circle-right"></i> Search & Modify </a></li>
								</security:authorize>
							</ul>
						</li>
						
						<li class="treeview"><a href="#"><i
								class="fa fa-chevron-circle-right"></i>Maker<span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span> </a>
							<ul class="treeview-menu">
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP','ROLE_MT_STAFF')">
									<li><a href="${cPath}/maker/maker_list.htm"><i
											class="fa fa-chevron-circle-right"></i> Search & Modify </a></li>
								</security:authorize>
							</ul>
						</li>

						<li class="treeview"><a href="#"><i
								class="fa fa-chevron-circle-right"></i>Model / Type<span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span> </a>
							<ul class="treeview-menu">
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP','ROLE_MT_STAFF')">
									<li><a href="${cPath}/moldType/moldType_list.htm"><i
											class="fa fa-chevron-circle-right"></i> Search & Modify </a></li>
								</security:authorize>
							</ul>
						</li>
						
						<li class="treeview"><a href="#"><i
								class="fa fa-chevron-circle-right"></i>Production Line<span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span> </a>
							<ul class="treeview-menu">
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP','ROLE_MT_STAFF')">
									<li><a href="${cPath}/productionLine/productionLine_list.htm"><i
											class="fa fa-chevron-circle-right"></i> Search & Modify </a></li>
								</security:authorize>
							</ul>
						</li>
						
						<li class="treeview"><a href="#"><i
								class="fa fa-chevron-circle-right"></i>Section<span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span> </a>
							<ul class="treeview-menu">
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP','ROLE_MT_STAFF')">
									<li><a href="${cPath}/section/section_list.htm"><i
											class="fa fa-chevron-circle-right"></i> Search & Modify </a></li>
								</security:authorize>
							</ul>
						</li>
						
						<li class="treeview"><a href="#"><i
								class="fa fa-chevron-circle-right"></i>Unit Type<span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span> </a>
							<ul class="treeview-menu">
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP','ROLE_MT_STAFF')">
									<li><a href="${cPath}/unitType/unitType_list.htm"><i
											class="fa fa-chevron-circle-right"></i> Search & Modify </a></li>
								</security:authorize>
							</ul>
						</li>
						
						<li class="treeview"><a href="#"><i
								class="fa fa-chevron-circle-right"></i>Request Type<span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span> </a>
							<ul class="treeview-menu">
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP','ROLE_MT_STAFF')">
									<li><a href="${cPath}/requestType/requestType_list.htm"><i
											class="fa fa-chevron-circle-right"></i> Search & Modify </a></li>
								</security:authorize>
							</ul>
						</li>
					</ul></li>
					
			</security:authorize>

			<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP','ROLE_MT_STAFF')">
				<li class="treeview"><a href="#"> <i class="fa fa-database"></i>
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
								
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP','ROLE_MT_STAFF' )">
									<li><a href="${cPath}/partMaster/sparepart_report.htm"><i
											class="fa fa-chevron-circle-right"></i>Report </a></li>
								</security:authorize>										
							</ul>
						</li>
						
						<li class="treeview"><a href="#"><i
								class="fa fa-chevron-circle-right"></i>Inventory Control <span
								class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
							</span> </a>
							
							<ul class="treeview-menu">
								<security:authorize access="hasAnyRole('ADMIN')">
									<li><a href="${cPath}/inventoryCtrl/inventoryCtrl_list.htm"><i
											class="fa fa-chevron-circle-right"></i>Search & Modify </a></li>
								</security:authorize>				
							</ul>
						</li>
					</ul>
				</li>
			</security:authorize>


			<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP','ROLE_MT_STAFF','ROLE_REQ_MNG', 'ROLE_REQ_SUP', 'ROLE_REQ_USER','ROLE_QA')">
				<li class="header">Request Maintenance Data</li>
				<li class="treeview"><a href="#"> <i class="fa fa-pencil-square-o"></i>
					<span>Request Maintenance Data</span> <span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
					</span>
					</a>
					<ul class="treeview-menu">
						<li class="treeview"><a href="#"> <i class="fa fa-chevron-circle-right"></i> 
								<span>Maintenance Service</span> 
								<span class="pull-right-container"> 
									<i class="fa fa-angle-left pull-right"></i>
								</span>
							</a>
							<ul class="treeview-menu">								
								<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG','ROLE_MT_SUP','ROLE_MT_STAFF','ROLE_REQ_MNG', 'ROLE_REQ_SUP', 'ROLE_REQ_USER','ROLE_QA')">
									<li><a href="${cPath}/request/requested_list.htm"> <i
											class="fa fa-chevron-circle-right"></i> Requested list
									</a></li>
									<li><a href="${cPath}/request/requested_new.htm"> <i
											class="fa fa-chevron-circle-right"></i> New Request
									</a></li>
								</security:authorize>								
							</ul>
						</li>
						
					</ul>
				</li>
			</security:authorize>

			<security:authorize access="hasAnyRole('ADMIN','ROLE_MT_MNG')">

				<li class="header">System Configuration</li>

				<li><a href="${cPath}/admin/user/viewUser.htm"> <i
						class="fa fa-users"></i> <span>User Management</span>
				</a></li>
				

				<security:authorize access="hasAnyRole('ADMIN')">
					<li><a href="${cPath}/maintain/parameter.htm"> <i
							class="fa  fa-hashtag"></i> <span>Parameter Config</span>
					</a></li>
	
					<li><a href="${cPath}/reloadCache" target="_blank"> <i
							class="fa  fa-refresh"></i> <span>Reload Cache</span>
					</a></li>
				</security:authorize>

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
	
// 	console.log(url);
	
</script>
