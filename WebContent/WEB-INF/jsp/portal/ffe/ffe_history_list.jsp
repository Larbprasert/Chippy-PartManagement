<!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
	<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
	<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>
	<div class="content-wrapper">
		<section class="content-header">
			<h3>
				<i class="fa fa-fire"></i> Fire Fighting Equipment History
			</h3>
		</section>
		<section class="content">
			<div class="row">
				<div class="col-lg-12">
					<!-- 	#####  SEARCH >>>>> ####------------------- -->
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">Search Criteria</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
							</div>
						</div>
						<div class="box-body">

							<form class="form-horizontal" id="myForm" commandname="sysParam"
								method="post">

								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="paramType" class="col-lg-4 control-label">Department</label>
											<div class="col-lg-6">
												<select class="form-control" name="department">
													<option value="">--- ALL ---</option>
													<option value="TPCC">TPCC</option>
													<option value="TPAC">TPAC</option>
												</select>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="paramDesc" class="col-lg-4 control-label">Serial
												No.</label>
											<div class="col-lg-6">
												<input type="text" class="form-control" name="">
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label for="paramCode" class="col-lg-4 control-label">Equipment
												Code</label>
											<div class="col-lg-6">
												<input type="text" class="form-control" name="">
											</div>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label for="paramDesc" class="col-lg-4 control-label">Equipment
												Type</label>
											<div class="col-lg-6">
												<input type="text" class="form-control" name="">
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label for="paramCode" class="col-lg-4 control-label">Status</label>
											<div class="col-lg-6">
												<input type="text" class="form-control" name="">
											</div>
										</div>
									</div>
									<div class="col-lg-6"></div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="form-group ">
											<div class="col-lg-12 text-center">
												<button type="reset" class="btn btn-default"
													onclick="doClear()">
													&nbsp;<i class="fa fa-refresh"></i> Clear
												</button>
												&nbsp;&nbsp;
												<button type="button" id="searchBtn" class="btn btn-primary"
													onclick="doSearch()">
													<i class="fa fa-search"></i> Search
												</button>
												&nbsp;&nbsp;
												<!-- 								<button type="button" class="btn btn-warning" disabled>Export <i class="fa fa-file-excel-o"></i></button> -->
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 	##### <<<<<  SEARCH ####------------------- -->
			<div class="box box-primary" style="display: none;" id="rs_table">
				<div class="box-header with-border">
					<h3 class="box-title">Result</h3>
					<div class="box-tools pull-right">
						<!-- 						<button type="button" -->
						<!-- 							class="btn btn-box-tool btn-success btn-table" onclick="doAdd()"> -->
						<!-- 							<i class="fa fa-plus"></i> Add -->
						<!-- 						</button> -->
					</div>
				</div>

				<div class="box-body">


					<table id="result-table"
						class="table table-striped  dataTable no-footer"
						style="width: 100%">
						<thead>
							<tr>

								<th class="text-center">Department</th>
								<th class="text-center">Eq Code</th>
								<th class="text-center">Eq Type</th>
								<th class="text-center">Serial No.</th>
								<th class="text-center">Brand</th>
								<th align="center">Model</th>
								<!-- 								<th class="text-center">Last Cal. Date</th> -->
								<th class="text-center">Serviced By</th>
								<!-- 								<th class="text-center">Cal. Time Std.</th> -->
								<th class="text-center">History</th>
								<!-- 								<th class="text-center">Edit</th> -->
							</tr>
						</thead>
						<tbody>
							<tr>

								<td align="center">SHE</td>
								<td align="left">3SE-507</td>
								<td align="left">-</td>
								<td align="left">0301311-047</td>
								<td align="left">Industrial Scientific</td>
								<td align="left">Multigas Detector, ITX</td>
								<!-- 								<td align="right">10/06/2018</td> -->
								<td align="left">Linde</td>
								<!-- 								<td align="left">1 Months</td> -->
								<td align="center">
									<button type="button" onclick="window.location.href='ffe_history_detail.htm'"
										class="btn btn-box-tool btn-warning btn-table">
										<i class="fa fa-edit fa-lg"></i>History
									</button>

								</td>


							</tr>
							<tr>

								<td align="center">SHE</td>
								<td align="left">3SE-512</td>
								<td align="left">-</td>
								<td align="left">0504000-368</td>
								<td align="left">Industrial Scientific</td>
								<td align="left">Multigas Detector, ITX</td>
								<!-- 								<td align="right">10/07/2018</td> -->
								<td align="left">Brave</td>
								<!-- 								<td align="left">1 Months</td> -->
								<td align="center">
									<button type="button" onclick="window.location.href='ffe_history_detail.htm'"
										class="btn btn-box-tool btn-warning btn-table">
										<i class="fa fa-edit fa-lg"></i>History
									</button>

								</td>

							</tr>
							<tr>

								<td align="center">SHE</td>
								<td align="left">3SE-514</td>
								<td align="left">-</td>
								<td align="left">12071WC-001</td>
								<td align="left">Industrial Scientific</td>
								<td align="left">Multigas Detector. MX6</td>
								<!-- 								<td align="right">10/08/2018</td> -->
								<td align="left">Brave</td>
								<!-- 								<td align="left">6 Months</td> -->
								<td align="center">
									<button type="button" onclick="window.location.href='ffe_history_detail.htm'"
										class="btn btn-box-tool btn-warning btn-table">
										<i class="fa fa-edit fa-lg"></i>History
									</button>

								</td>

							</tr>
							<tr>

								<td align="center">SHE</td>
								<td align="left">3SE-515</td>
								<td align="left">-</td>
								<td align="left">12071WD-001</td>
								<td align="left">Industrial Scientific</td>
								<td align="left">Multigas Detector, MX6</td>
								<!-- 								<td align="right">10/09/2018</td> -->
								<td align="left">Linde</td>
								<!-- 								<td align="left">6 Months</td> -->
								<td align="center">
									<button type="button" onclick="window.location.href='ffe_history_detail.htm'"
										class="btn btn-box-tool btn-warning btn-table">
										<i class="fa fa-edit fa-lg"></i>History
									</button>

								</td>

							</tr>
							<tr>

								<td align="center">SHE</td>
								<td align="left">3SE-516</td>
								<td align="left">-</td>
								<td align="left">SE317-003397</td>
								<td align="left">BW</td>
								<td align="left">Multigas Detector, Micro5</td>
								<!-- 								<td align="right">10/10/2018</td> -->
								<td align="left">Brave</td>
								<!-- 								<td align="left">6 Months</td> -->
								<td align="center">
									<button type="button" onclick="window.location.href='ffe_history_detail.htm'"
										class="btn btn-box-tool btn-warning btn-table">
										<i class="fa fa-edit fa-lg"></i>History
									</button>
								</td>

							</tr>


						</tbody>
					</table>



				</div>

			</div>

			<!-- 	<hr> -->





			<!-- 	##### <<<<< JAVASCRIPT ####------------------- -->
			<script>
				function doAdd() {
					// 		location = "user_add_edit.php";

					$('#editModal').modal('show');

					$('input').val('');
					//  		$('option').attr('selected', false);
				}
				function popupDescription() {
					$('#DescModal').modal('show');

					$('input').val('');
				}
				function popupEdit() {
					$('#editModal').modal('show');

					$('input').val('');
				}

				function doSearch() {
					$("#rs_table").show();
				}

				function doClear() {
					$("#rs_table").hide();
				}

				$('#result-table').DataTable({
					ordering : false
				});
				$('#result-table-History').DataTable({
					ordering : false
				});

				$(document).ready(function() {

				});
			</script>


		</section>

	</div>

	<!-- Modal Desc -->
	<div id="DescModal" class="modal fade" role="dialog"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog  modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">
						<i class="fa fa-edit"></i>Gas Detector History
					</h4>
				</div>

				<form class="form-horizontal" id="form" action="userSave.htm"
					method="post" command="userProfile" data-toggle="validator"
					novalidate="true">

					<!-- 	           <fieldset class="well"><div class="w  "> -->

					<div class="box-body">
						<div class="row">
							<div class="col-md-12">
								<h4 class="border-bottom">Equipment</h4>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Department
									</label>
									<div class="col-lg-6">
										<label> XX</label>
									</div>
								</div>
							</div>
							<div class="col-md-6"></div>

						</div>
						<div class="row">

							<div class="col-md-6">
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Equipment
										Code</label>
									<div class="col-lg-6">
										<label> 3SE-507</label>

									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Equipment
										Type</label>
									<div class="col-lg-6">
										<label> Gas Detector</label>

									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Serial No.</label>
									<div class="col-lg-6">
										<label> 0301311-047</label>
									</div>
								</div>

							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Model</label>
									<div class="col-lg-6">
										<label> Multigas Detector, ITX</label>

									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<h4 class="border-bottom">History</h4>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-4">

										<div class="form-group">
											<label for="" class="col-lg-4 control-label">Job No.
											</label>
											<div class="col-lg-8">
												<input type="text" class="form-control">
											</div>
										</div>

									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label for="" class="col-lg-4 control-label">Date
												From </label>
											<div class="col-lg-8">
												<input type="date" class="form-control">
											</div>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label for="" class="col-lg-4 control-label">Date To
											</label>
											<div class="col-lg-8">
												<input type="date" class="form-control">
											</div>
										</div>
									</div>
									<!-- 									<div class="col-md-1"> -->
									<!-- 										<button type="button" class="btn btn-success">ค้นหา</button> -->
									<!-- 									</div> -->
								</div>

								<div class="row">

									<div class="col-md-12">

										<div class="box-tools pull-right">
											<button type="button" class="btn btn-success">ค้นหา</button>
										</div>


									</div>
								</div>

							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<table id="result-table-History" class="table table-striped ">
									<thead>
										<tr>
											<th>No</th>
											<th>Job No</th>
											<th>Type</th>
											<th>Status</th>
											<th>Date</th>
											<th>Update by</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>100021/22</td>
											<td>Calibrate</td>
											<td>New Request</td>

											<td>06/06/2018</td>
											<td>SHEADmin</td>
										</tr>
										<tr>
											<td>1</td>
											<td>100021/22</td>
											<td>Calibrate</td>
											<td>Approve</td>
											<td>28/06/2018</td>
											<td>Apisit</td>
										</tr>
										<tr>
											<td>1</td>
											<td>100021/22</td>
											<td>Calibrate</td>
											<td>New Request</td>

											<td>06/06/2018</td>
											<td>SHEADmin</td>
										</tr>
										<tr>
											<td>1</td>
											<td>100021/22</td>
											<td>Calibrate</td>
											<td>Approve</td>
											<td>28/06/2018</td>
											<td>Apisit</td>
										</tr>
										<tr>
											<td>1</td>
											<td>100021/22</td>
											<td>Calibrate</td>
											<td>New Request</td>

											<td>06/06/2018</td>
											<td>SHEADmin</td>
										</tr>
										<tr>
											<td>1</td>
											<td>100021/22</td>
											<td>Calibrate</td>
											<td>Approve</td>
											<td>28/06/2018</td>
											<td>Apisit</td>
										</tr>


									</tbody>
								</table>
							</div>

						</div>



					</div>


					<div class="modal-footer">
						<button type="button" class="btn btn-default "
							data-dismiss="modal">
							<i class="fa fa-times-circle"></i> Close
						</button>
						&nbsp;
						<button type="button" id="saveBtn" class="btn btn-primary"
							data-dismiss="modal">
							<i class="fa fa-check-square-o"></i> Save
						</button>

					</div>

				</form>
			</div>
		</div>
	</div>