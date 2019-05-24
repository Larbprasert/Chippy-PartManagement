<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title plant-title"></h3>
	</div>
	<div class="box-body">
		<div class="nav-tabs-custom">
			<ul class="nav nav-tabs" id="TPAC_tab_button">
				<li class="active">
					<a href="#tab_1" data-toggle="tab" onclick="renderCanvas('TPAC', 'TSP')">TSP</a>
				</li>
				<li>
					<a href="#tab_2" data-toggle="tab" onclick="renderCanvas('TPAC', 'BENZENE')">Benzene</a>
				</li>
				<li>
					<a href="#tab_3" data-toggle="tab" onclick="renderCanvas('TPAC', 'FORMALDEHYDE')">Formaldehyde</a>
				</li>

			</ul>
			<div class="tab-content" id="TPAC_tab_content">
				<div class="tab-pane active" id="tab_1">
					<h4 class="border-bottom">Packing Unit</h4>
					<div class="row">
						<div class="col-md-6">
							<h5>K2T</h5>
							
							<div id="tsp_packing_1"></div>
						</div>
						<div class="col-md-6">
							<h5>K2U</h5>
							<div id="tsp_packing_2"></div>
						</div>
					</div>
				</div>
				<!-- /.tab-pane -->
				<div class="tab-pane" id="tab_2">
					<% 	String[] name2 = {"Formalin Plant", "Monomer Plant", "Polymer Plant"};
						String[] code2 = {"Formalin_Plant", "Monomer_Plant", "Polymer_Plant"};
						for (int j=0; j < name2.length ; j++){
					%>
					
					<h4 class="border-bottom"><%=name2[j] %></h4>
					<div class="row">
						<div class="col-md-6">
							<h5>K2T</h5>
							<div id="benzenetable_<%=code2[j] %>_1"></div>
						</div>
						<div class="col-md-6">
							<h5>K2U</h5>
							<div id="benzenetable_<%=code2[j] %>_2"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<h5>K2W</h5>
							<div id="benzenetable_<%=code2[j] %>_3"></div>
						</div>
						
					</div>
					
					<% } // for name2%>
				</div>

				<div class="tab-pane" id="tab_3">

					<% 	String[] name3 = {"Formalin Plant", "Monomer Plant", "Polymer Plant", "Wast water treatment (WWT)"};
						String[] code3 = {"Formalin_Plant", "Monomer_Plant", "Polymer_Plant", "Wast_water"};
						for (int j=0; j < name3.length ; j++){
					%>
					<h4 class="border-bottom"><%=name3[j] %></h4>
					
					<div class="row">
						<div class="col-md-6">
							<h5>K2T</h5>
							<div id="Formaldehyde_<%=code3[j] %>_1"></div>
						</div>
						<div class="col-md-6">
							<h5>K2U</h5>
							<div id="Formaldehyde_<%=code3[j] %>_2"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<h5>K2W</h5>
							<div id="Formaldehyde_<%=code3[j] %>_3"></div>
						</div>
						
					</div>
					
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