<%@page import="java.util.Random"%>
<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title plant-title"></h3>
	</div>
	<div class="box-body">
		<div class="nav-tabs-custom">
			<ul class="nav nav-tabs" id="TPCC_tab_button">
				<li class="active">
					<a href="#tpcc_tab_1" data-toggle="tab" onclick="callDataTable('TPCC', 'TSP')">TSP</a>
				</li>
				<li>
					<a href="#tpcc_tab_2" data-toggle="tab" onclick="callDataTable('TPCC', 'MC')">MC</a>
				</li>
				<li>
					<a href="#tpcc_tab_3" data-toggle="tab" onclick="callDataTable('TPCC', 'HE')">HE</a>
				</li>
				<li>
					<a href="#tpcc_tab_4" data-toggle="tab" onclick="callDataTable('TPCC', 'CO')">CO</a>
				</li>
				<li>
					<a href="#tpcc_tab_5" data-toggle="tab" onclick="callDataTable('TPCC', 'Cl2')">Cl2</a>
				</li>
				
			</ul>
			<div class="tab-content" id="TPCC_tab_content">
				<div class="tab-pane active" id="tpcc_tab_1">
					<h4 class="border-bottom">Packing unit & Pelletizing</h4>
					<table class="table table-striped table-bordered " id="TSP_Packing_and_Pelletizing">
						<thead class="bg-green color-palette">
							<tr>
								<th class="text-center" width="10%" rowspan="2">Year</th>
								<th class="text-center" width="40%" colspan="4">VP1</th>
								<th class="text-center" width="40%" colspan="4">VP2</th>
								<th class="text-center" width="10%" rowspan="2">Action</th>
							</tr>
							<tr>
								<th class="text-center">1st</th>
								<th class="text-center">2nd</th>
								<th class="text-center">3st</th>
								<th class="text-center">4st</th>

								<th class="text-center">1st</th>
								<th class="text-center">2nd</th>
								<th class="text-center">3st</th>
								<th class="text-center">4st</th>
							</tr>

						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div class="tab-pane " id="tpcc_tab_2">
					<% 	String[] nameMC = {"P-Stucture", "G-Stucture", "Polymerization"};
						String[] codeMC = {"P_Stucture", "G_Stucture", "Polymerization"};
						for (int j=0; j < nameMC.length ; j++){
					%>
					
					<h4 class="border-bottom"><%=nameMC[j] %></h4>
					<table class="table table-striped table-bordered " id="MC_<%=codeMC[j] %>">
						<thead class="bg-green color-palette">
							<tr>
								<th class="text-center" width="10%" rowspan="2">Year</th>
								<th class="text-center" width="40%" colspan="4">VP1</th>
								<th class="text-center" width="40%" colspan="4">VP2</th>
								<th class="text-center" width="10%" rowspan="2">Action</th>
							</tr>
							<tr>
								<th class="text-center">1st</th>
								<th class="text-center">2nd</th>
								<th class="text-center">3st</th>
								<th class="text-center">4st</th>

								<th class="text-center">1st</th>
								<th class="text-center">2nd</th>
								<th class="text-center">3st</th>
								<th class="text-center">4st</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<% 
						} // for name2%>
				</div>
				<div class="tab-pane " id="tpcc_tab_3">
					<% 	String[] nameHE = { "G-Stucture", "Polymerization"};
						String[] codeHE = { "G_Stucture", "Polymerization"};
						for (int j=0; j < nameHE.length ; j++){
					%>
					
					<h4 class="border-bottom"><%=nameHE[j] %></h4>
					<table class="table table-striped table-bordered " id="HE_<%=codeHE[j] %>">
						<thead class="bg-green color-palette">
							<tr>
								<th class="text-center" width="10%" rowspan="2">Year</th>
								<th class="text-center" width="40%" colspan="4">VP1</th>
								<th class="text-center" width="40%" colspan="4">VP2</th>
								<th class="text-center" width="10%" rowspan="2">Action</th>
							</tr>
							<tr>
								<th class="text-center">1st</th>
								<th class="text-center">2nd</th>
								<th class="text-center">3st</th>
								<th class="text-center">4st</th>

								<th class="text-center">1st</th>
								<th class="text-center">2nd</th>
								<th class="text-center">3st</th>
								<th class="text-center">4st</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<% 
						} // for nameHE%>
				</div>
				<div class="tab-pane " id="tpcc_tab_4">
					<h4 class="border-bottom">CG Process</h4>
					<table class="table table-striped table-bordered " id="CO_CG_Process">
						<thead class="bg-green color-palette">
							<tr>
								<th class="text-center" width="10%" rowspan="2">Year</th>
								<th class="text-center" width="40%" colspan="4">VP1</th>
								<th class="text-center" width="40%" colspan="4">VP2</th>
								<th class="text-center" width="10%" rowspan="2">Action</th>
							</tr>
							<tr>
								<th class="text-center">1st</th>
								<th class="text-center">2nd</th>
								<th class="text-center">3st</th>
								<th class="text-center">4st</th>

								<th class="text-center">1st</th>
								<th class="text-center">2nd</th>
								<th class="text-center">3st</th>
								<th class="text-center">4st</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div class="tab-pane " id="tpcc_tab_5">
					<h4 class="border-bottom">CG Process</h4>
					<table class="table table-striped table-bordered " id="Cl2_CG_Process">
						<thead class="bg-green color-palette">
							<tr>
								<th class="text-center" width="10%" rowspan="2">Year</th>
								<th class="text-center" width="40%" colspan="4">VP1</th>
								<th class="text-center" width="40%" colspan="4">VP2</th>
								<th class="text-center" width="10%" rowspan="2">Action</th>
							</tr>
							<tr>
								<th class="text-center">1st</th>
								<th class="text-center">2nd</th>
								<th class="text-center">3st</th>
								<th class="text-center">4st</th>

								<th class="text-center">1st</th>
								<th class="text-center">2nd</th>
								<th class="text-center">3st</th>
								<th class="text-center">4st</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
			<!-- /.tab-content -->
		</div>
	</div>
	<!-- /.box-body -->
</div>
<!-- /.box -->