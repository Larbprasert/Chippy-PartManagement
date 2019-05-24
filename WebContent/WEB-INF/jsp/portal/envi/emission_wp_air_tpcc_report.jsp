<%@page import="java.util.Random"%>
<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title plant-title"></h3>
	</div>
	<div class="box-body">
		<div class="nav-tabs-custom">
			<ul class="nav nav-tabs" id="TPCC_tab_button">
				<li class="active">
					<a href="#tpcc_tab_1" data-toggle="tab" onclick="renderCanvas('TPCC', 'TSP')">TSP</a>
				</li>
				<li>
					<a href="#tpcc_tab_2" data-toggle="tab" onclick="renderCanvas('TPCC', 'MC')">MC</a>
				</li>
				<li>
					<a href="#tpcc_tab_3" data-toggle="tab" onclick="renderCanvas('TPCC', 'HE')">HE</a>
				</li>
				<li>
					<a href="#tpcc_tab_4" data-toggle="tab" onclick="renderCanvas('TPCC', 'CO')">CO</a>
				</li>
				<li>
					<a href="#tpcc_tab_5" data-toggle="tab" onclick="renderCanvas('TPCC', 'Cl2')">Cl2</a>
				</li>
				
			</ul>
			<div class="tab-content" id="TPCC_tab_content">
				<div class="tab-pane active" id="tpcc_tab_1">
					<h4 class="border-bottom">Packing unit & Pelletizing</h4>
					<div class="row">
						<div class="col-md-6">
							<h5>VP1</h5>
							<div id="TSP_Packing_and_Pelletizing_1"></div>
						</div>
						<div class="col-md-6">
							<h5>VP2</h5>
							<div id="TSP_Packing_and_Pelletizing_2"></div>
						</div>
					</div>
				</div>
				<div class="tab-pane " id="tpcc_tab_2">
					<% 	String[] nameMC = {"P-Stucture", "G-Stucture", "Polymerization"};
						String[] codeMC = {"P_Stucture", "G_Stucture", "Polymerization"};
						for (int j=0; j < nameMC.length ; j++){
					%>
					
					<h4 class="border-bottom"><%=nameMC[j] %></h4>
					<div class="row">
						<div class="col-md-6">
							<h5>VP1</h5>
							<div id="MC_<%=codeMC[j] %>_1"></div>
						</div>
						<div class="col-md-6">
							<h5>VP2</h5>
							<div id="MC_<%=codeMC[j] %>_2"></div>
						</div>
					</div>
					<% 
						} // for name2%>
				</div>
				<div class="tab-pane " id="tpcc_tab_3">
					<% 	String[] nameHE = { "G-Stucture", "Polymerization"};
						String[] codeHE = { "G_Stucture", "Polymerization"};
						for (int j=0; j < nameHE.length ; j++){
					%>
					
					<h4 class="border-bottom"><%=nameHE[j] %></h4>
					<div class="row">
						<div class="col-md-6">
							<h5>VP1</h5>
							<div id="HE_<%=codeHE[j] %>_1"></div>
						</div>
						<div class="col-md-6">
							<h5>VP2</h5>
							<div id="HE_<%=codeHE[j] %>_2"></div>
						</div>
					</div>
					
					<% 
						} // for nameHE%>
				</div>
				<div class="tab-pane " id="tpcc_tab_4">
					<h4 class="border-bottom">CG Process</h4>
					<div class="row">
						<div class="col-md-6">
							<h5>VP1</h5>
							<div id="CO_CG_Process_1"></div>
						</div>
						<div class="col-md-6">
							<h5>VP2</h5>
							<div id="CO_CG_Process_2"></div>
						</div>
					</div>
				</div>
				<div class="tab-pane " id="tpcc_tab_5">
					<h4 class="border-bottom">CG Process</h4>
					<div class="row">
						<div class="col-md-6">
							<h5>VP1</h5>
							<div id="Cl2_CG_Process_1"></div>
						</div>
						<div class="col-md-6">
							<h5>VP2</h5>
							<div id="Cl2_CG_Process_2"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.tab-content -->
		</div>
	</div>
	<!-- /.box-body -->
</div>
<!-- /.box -->