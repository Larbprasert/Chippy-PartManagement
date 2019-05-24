<%@page import="java.util.Random"%>
<div class="box box-primary">
    <div class="box-header with-border">
		<h3 class="box-title plant-title"></h3>
	</div>
    <div class="box-body">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs" id="tab_tpac">
                <li class="active">
                    <a href="#tab_tpcc_1" data-toggle="tab" onclick="callData('TPCC', 'NOISE_POINT_TPCC_CCR_VP1' , [1, 0, 0] )" >CCR VP1</a>
                </li>
                <li>
                    <a href="#tab_tpcc_2" data-toggle="tab" onclick="callData('TPCC', 'NOISE_POINT_TPCC_CCR_PT1', [1, 0, 0])" >CCR PT1</a>
                </li>
                <li>
                    <a href="#tab_tpcc_3" data-toggle="tab" onclick="callData('TPCC', 'NOISE_POINT_TPCC_ANALYSIS', [1, 0, 0])" >Analysis Room</a>
                </li>
                <li>
                    <a href="#tab_tpcc_4" data-toggle="tab" onclick="callData('TPCC', 'NOISE_POINT_TPCC_INSPECTION', [1, 0, 0])" >Inspection Room</a>
                </li>
                <li>
                    <a href="#tab_tpcc_5" data-toggle="tab" onclick="callData('TPCC', 'NOISE_POINT_TPCC_CCR_VP2', [0, 1, 0])" >CCR VP2</a>
                </li>
                <li>
                    <a href="#tab_tpcc_6" data-toggle="tab" onclick="callData('TPCC', 'NOISE_POINT_TPCC_CCR_PT2', [0, 1, 0])" >CCR PT2</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class='tab-pane active' id="tab_tpcc_1">
                	<div class="row">
						<div class="col-md-6">
							<div id="noise_point_tpcc_ccr_vp1_1"></div>
						</div>
                	</div>
                </div>
                
                <div class='tab-pane ' id="tab_tpcc_2">
                	<div class="row">
						<div class="col-md-6">
							<div id="noise_point_tpcc_ccr_pt1_1" ></div>
						</div>
                	</div>
                </div>
                
                <div class='tab-pane ' id="tab_tpcc_3">
                	<div class="row">
						<div class="col-md-6">
							<div id="noise_point_tpcc_analysis_1"></div>
						</div>
                	</div>
                </div>
                
                <div class='tab-pane ' id="tab_tpcc_4">
                	<div class="row">
						<div class="col-md-6">
							<div id="noise_point_tpcc_inspection_1"></div>
						</div>
                	</div>
                </div>
                
                <div class='tab-pane ' id="tab_tpcc_5">
                	<div class="row">
						<div class="col-md-6">
							<div id="noise_point_tpcc_ccr_vp2_2"></div>
						</div>
                	</div>
                </div>
                
                <div class='tab-pane ' id="tab_tpcc_6">
                	<div class="row">
						<div class="col-md-6">
							<div id="noise_point_tpcc_ccr_pt2_2"></div>
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