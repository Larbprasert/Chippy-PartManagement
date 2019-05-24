<%@page import="java.util.Random"%>
<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title plant-title"></h3>
	</div>
	<div class="box-body">
		<div class="nav-tabs-custom">
			<ul class="nav nav-tabs" id="tab_tpac">
				<li class="active">
					<a href="#tab_1" data-toggle="tab"  onClick="callDataTable('TPAC', 'NOISE_POINT_TPAC_PACKING' , 2)" >Packing unit</a>
				</li>
				<li>
					<a href="#tab_2" data-toggle="tab" onClick="callDataTable('TPAC', 'NOISE_POINT_TPAC_PALLETZING', 3)" >Pellitizing</a>
				</li>

			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="tab_1">
					<table class="table table-striped table-bordered " id="noise_point_tpac_packing">
						<thead class="bg-green color-palette">
							<tr>
								<th class="text-center" width="10%" rowspan="2">Year</th>
								<th class="text-center" width="40%" colspan="4">TPAC1 (K2T)</th>
								<th class="text-center" width="40%" colspan="4">TPAC2 (K2U)</th>
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
					<table class="table table-striped table-bordered " id="noise_point_tpac_palletzing">
						<thead class="bg-green color-palette">
							<tr>
								<th class="text-center" width="8%" rowspan="2">Year</th>
								<th class="text-center" width="28%" colspan="4">TPAC1 (K2T)</th>
								<th class="text-center" width="28%" colspan="4">TPAC2 (K2U)</th>
								<th class="text-center" width="28%" colspan="4">TPAC3 (K2W)</th>
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
				</div>
				<!-- /.tab-pane -->
			</div>
			<!-- /.tab-content -->
		</div>
	</div>
	<!-- /.box-body -->
</div>
<!-- /.box -->