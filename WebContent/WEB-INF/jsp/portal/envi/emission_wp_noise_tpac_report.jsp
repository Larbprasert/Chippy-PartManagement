<%@page import="java.util.Random"%>
<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title plant-title"></h3>
	</div>
	<div class="box-body">
		<div class="nav-tabs-custom">
			<ul class="nav nav-tabs" id="tab_tpac">
				<li class="active">
					<a href="#tab_1" data-toggle="tab"  onClick="callData('TPAC', 'NOISE_POINT_TPAC_PACKING' , [1, 1, 0])" >Packing unit</a>
				</li>
				<li>
					<a href="#tab_2" data-toggle="tab" onClick="callData('TPAC', 'NOISE_POINT_TPAC_PALLETZING', [1, 1, 1] )" >Pellitizing</a>
				</li>

			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="tab_1">
					<div class="row">
						<div class="col-md-6">
							<div id="noise_point_tpac_packing_1"></div>
						</div>
						<div class="col-md-6">
							<div id="noise_point_tpac_packing_2"></div>
						</div>
					</div>
				</div>
				<!-- /.tab-pane -->
				<div class="tab-pane" id="tab_2">
					<div class="row">
						<div class="col-md-6">
							<div id="noise_point_tpac_palletzing_1"></div>
						</div>
						<div class="col-md-6">
							<div id="noise_point_tpac_palletzing_2"></div>
						</div>
						<div class="col-md-6">
							<div id="noise_point_tpac_palletzing_3"></div>
						</div>
					</div>
				</div>
				<!-- /.tab-pane -->
			</div>
			<!-- /.tab-content -->
		</div>
	</div>
	<!-- /.box-body -->
</div>
<!-- /.box -->