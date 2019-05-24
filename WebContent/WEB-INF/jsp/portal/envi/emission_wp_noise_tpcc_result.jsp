<%@page import="java.util.Random"%>
<div class="box box-primary">
    <div class="box-header with-border">
		<h3 class="box-title plant-title"></h3>
	</div>
    <div class="box-body">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs" id="tab_tpac">
                <li class="active">
                    <a href="#tab_tpcc_1" data-toggle="tab" onclick="callDataTable('TPCC', 'NOISE_POINT_TPCC_CCR_VP1' , 1 )" >CCR VP1</a>
                </li>
                <li>
                    <a href="#tab_tpcc_2" data-toggle="tab" onclick="callDataTable('TPCC', 'NOISE_POINT_TPCC_CCR_PT1', 1)" >CCR PT1</a>
                </li>
                <li>
                    <a href="#tab_tpcc_3" data-toggle="tab" onclick="callDataTable('TPCC', 'NOISE_POINT_TPCC_ANALYSIS', 1)" >Analysis Room</a>
                </li>
                <li>
                    <a href="#tab_tpcc_4" data-toggle="tab" onclick="callDataTable('TPCC', 'NOISE_POINT_TPCC_INSPECTION', 1)" >Inspection Room</a>
                </li>
                <li>
                    <a href="#tab_tpcc_5" data-toggle="tab" onclick="callDataTable('TPCC', 'NOISE_POINT_TPCC_CCR_VP2', 1)" >CCR VP2</a>
                </li>
                <li>
                    <a href="#tab_tpcc_6" data-toggle="tab" onclick="callDataTable('TPCC', 'NOISE_POINT_TPCC_CCR_PT2', 1)" >CCR PT2</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class='tab-pane active' id="tab_tpcc_1">
                    <table class="table table-striped table-bordered " id="noise_point_tpcc_ccr_vp1">
                        <thead class="bg-green color-palette">
                            <tr>
                                <th class="text-center" width="10%" rowspan="2">Year</th>
                                <th class="text-center" width="80%" colspan="4">TPCC1</th>
                                <th class="text-center" width="10%" rowspan="2">Action</th>
                            </tr>
                            <tr>
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
                
                <div class='tab-pane ' id="tab_tpcc_2">
                    <table class="table table-striped table-bordered " id="noise_point_tpcc_ccr_pt1">
                        <thead class="bg-green color-palette">
                            <tr>
                                <th class="text-center" width="10%" rowspan="2">Year</th>
                                <th class="text-center" width="80%" colspan="4">TPCC1</th>
                                <th class="text-center" width="10%" rowspan="2">Action</th>
                            </tr>
                            <tr>
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
                
                <div class='tab-pane ' id="tab_tpcc_3">
                    <table class="table table-striped table-bordered " id="noise_point_tpcc_analysis">
                        <thead class="bg-green color-palette">
                            <tr>
                                <th class="text-center" width="10%" rowspan="2">Year</th>
                                <th class="text-center" width="80%" colspan="4">TPCC1</th>
                                <th class="text-center" width="10%" rowspan="2">Action</th>
                            </tr>
                            <tr>
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
                
                <div class='tab-pane ' id="tab_tpcc_4">
                    <table class="table table-striped table-bordered " id="noise_point_tpcc_inspection">
                        <thead class="bg-green color-palette">
                            <tr>
                                <th class="text-center" width="10%" rowspan="2">Year</th>
                                <th class="text-center" width="80%" colspan="4">TPCC1</th>
                                <th class="text-center" width="10%" rowspan="2">Action</th>
                            </tr>
                            <tr>
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
                
                <div class='tab-pane ' id="tab_tpcc_5">
                    <table class="table table-striped table-bordered " id="noise_point_tpcc_ccr_vp2">
                        <thead class="bg-green color-palette">
                            <tr>
                                <th class="text-center" width="10%" rowspan="2">Year</th>
                                <th class="text-center" width="80%" colspan="4">TPCC2</th>
                                <th class="text-center" width="10%" rowspan="2">Action</th>
                            </tr>
                            <tr>
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
                
                <div class='tab-pane ' id="tab_tpcc_6">
                    <table class="table table-striped table-bordered " id="noise_point_tpcc_ccr_pt2">
                        <thead class="bg-green color-palette">
                            <tr>
                                <th class="text-center" width="10%" rowspan="2">Year</th>
                                <th class="text-center" width="80%" colspan="4">TPCC2</th>
                                <th class="text-center" width="10%" rowspan="2">Action</th>
                            </tr>
                            <tr>
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