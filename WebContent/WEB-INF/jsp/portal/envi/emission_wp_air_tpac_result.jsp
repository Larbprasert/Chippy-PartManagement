<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title plant-title"></h3>
	</div>
	<div class="box-body">
		<div class="nav-tabs-custom">
			<ul class="nav nav-tabs" id="TPAC_tab_button">
				<li class="active">
					<a href="#tab_1" data-toggle="tab" onclick="callDataTable('TPAC', 'TSP')">TSP</a>
				</li>
				<li>
					<a href="#tab_2" data-toggle="tab" onclick="callDataTable('TPAC', 'BENZENE')">Benzene</a>
				</li>
				<li>
					<a href="#tab_3" data-toggle="tab" onclick="callDataTable('TPAC', 'FORMALDEHYDE')">Formaldehyde</a>
				</li>

			</ul>
			<div class="tab-content" id="TPAC_tab_content">
				<div class="tab-pane active" id="tab_1">
					<h4 class="border-bottom">Packing Unit</h4>
					<table class="table table-striped table-bordered " id="tsp_packing">
						<thead class="bg-green color-palette">
							<tr>
								<th class="text-center" width="10%" rowspan="2">Year</th>
								<th class="text-center" width="40%" colspan="4">K2T</th>
								<th class="text-center" width="40%" colspan="4">K2U</th>
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
				<!-- /.tab-pane -->
				<div class="tab-pane" id="tab_2">
					<% 	String[] name2 = {"Formalin Plant", "Monomer Plant", "Polymer Plant"};
						String[] code2 = {"Formalin_Plant", "Monomer_Plant", "Polymer_Plant"};
						for (int j=0; j < name2.length ; j++){
					%>
					
					<h4 class="border-bottom"><%=name2[j] %></h4>
					<table class="table table-striped table-bordered " id="benzenetable_<%=code2[j] %>">
						<thead class="bg-green color-palette">
							<tr>
								<th class="text-center" width="8%" rowspan="2">Year</th>
								<th class="text-center" width="28%" colspan="4">K2T</th>
								<th class="text-center" width="28%" colspan="4">K2U</th>
								<th class="text-center" width="28%" colspan="4">K2W</th>
								<th class="text-center" width="8%" rowspan="2">Action</th>
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

								<th class="text-center">1st</th>
								<th class="text-center">2nd</th>
								<th class="text-center">3st</th>
								<th class="text-center">4st</th>
							</tr>

						</thead>
						<tbody>
						</tbody>
					</table>
					<% } // for name2%>
				</div>

				<div class="tab-pane" id="tab_3">

					<% 	String[] name3 = {"Formalin Plant", "Monomer Plant", "Polymer Plant", "Wast water treatment (WWT)"};
						String[] code3 = {"Formalin_Plant", "Monomer_Plant", "Polymer_Plant", "Wast_water"};
						for (int j=0; j < name3.length ; j++){
					%>
					<h4 class="border-bottom"><%=name3[j] %></h4>
					<table class="table table-striped table-bordered " id=Formaldehyde_<%=code3[j] %>>
						<thead class="bg-green color-palette">
							<tr>
								<th class="text-center" width="8%" rowspan="2">Year</th>
								<th class="text-center" width="28%" colspan="4">K2T</th>
								<th class="text-center" width="28%" colspan="4">K2U</th>
								<th class="text-center" width="28%" colspan="4">K2W</th>
								<th class="text-center" width="8%" rowspan="2">Action</th>
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

								<th class="text-center">1st</th>
								<th class="text-center">2nd</th>
								<th class="text-center">3st</th>
								<th class="text-center">4st</th>
							</tr>

						</thead>
						<tbody>
							
						</tbody>
					</table>
					<% } //end for name3 %>
				</div>
				<!-- /.tab-pane -->
			</div>
			<!-- /.tab-content -->
		</div>
	</div>
	<!-- /.box-body -->
</div>
<!-- /.box -->