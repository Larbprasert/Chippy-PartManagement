<!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
	<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
	<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>
<div class="content-wrapper yung">
	<!-- หัวข้อ         -->
	<section class="content-header">
		<h1>
			<i class="fa fa-fire-extinguisher"></i>&nbsp;&nbsp;Fire Fighting Equipment New Request
		</h1>
	</section>
	<!--ค้นหา  -->
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">SHE EQUIPMENT SERVICE REQUEST</h3>
					</div>
					<div class="box-body">

						<fieldset>

							<!-- 							<legend>Emission Total</legend> -->
							<form class="form-horizontal" id="myForm" commandname="sysParam"
								method="post">
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label for="paramType" class="col-lg-4 control-label">Company</label>
											<div class="col-lg-6">
												<select class="form-control" name="companyname"
													id="companyname">
													<option value="TPAC" selected>TPAC</option>
													<option value="TPCC">TPCC</option>
												</select>
											</div>
										</div>
									</div>
									<div class="col-lg-6">
											<div class="form-group">
											<label for="paramCode" class="col-lg-4 control-label">แผนก/ผ่าย:</label>
											<div class="col-lg-6">
												<input type='text' class="form-control" /> </span>
											</div>
										</div>
									</div>
								</div>


								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label for="paramCode" class="col-lg-4 control-label">ชื่อผู้ร้องขอ:
											</label>
											<div class="col-lg-6">
												<input type='text' class="form-control" />
											</div>
										</div>
									</div>

									<div class="col-lg-6">
									<div class="form-group">
											<label for="paramCode" class="col-lg-4 control-label">ชื่อตัวแทน:
											</label>
											<div class="col-lg-6">
												<input type='text' class="form-control" />
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label for="paramCode" class="col-lg-4 control-label">โทร: </label>
											<div class="col-lg-6">
												<input type='text' class="form-control" />
											</div>
										</div>
									</div>

									<div class="col-lg-6">
										<!-- 										<div class="form-group"> -->
										<!-- 											<label for="paramCode" class="col-lg-4 control-label">แผนก/ผ่าย:</label> -->
										<!-- 											<div class="col-lg-6"> -->
										<!-- 													<input type='text' class="form-control"  />  -->
										<!-- 													</span> -->
										<!-- 												</div> -->
										<!-- 										</div> -->
									</div>
								</div>

								<div class="row"
									style="padding-left: 65px; padding-right: 65px;">
									<div class="col-lg-12">
										<div class="form-group">

											<legend>วัตถุประสงค์</legend>

											<label class="control-label radio-inline"> <input
												type="radio" name="inlineRadioOptions" id="inlineRadio1"
												value="option1"> อัดบรรจุ
											</label> <label class=" control-label radio-inline"> <input
												type="radio" name="inlineRadioOptions" id="inlineRadio2"
												value="option2"> สอบเทียบ
											</label> <label class=" control-label radio-inline"> <input
												type="radio" name="inlineRadioOptions" id="inlineRadio3"
												value="option3"> ซ่อม
											</label> <label class=" control-label radio-inline"> <input
												type="radio" name="inlineRadioOptions" id="inlineRadio4"
												value="option4"> ตรวจเช็ค
											</label> <label class=" control-label radio-inline"> <input
												type="radio" name="inlineRadioOptions" id="inlineRadio4"
												value="option4"> อื่นๆ <input type="text"
												name="inlineRadioOptions" id="inlineRadio4" value=""
												placeholder="โปรดระบุ">
											</label>


										</div>
									</div>
								</div>
								<div class="row" style="padding-left: 65px; padding-right: 65px;">
<!-- 									<div class="col-lg-12"> -->
<!-- 										<div class="form-group"> -->

<!-- 											<legend>ชนิดของอุปกรณ์</legend> -->

<!-- 											<label class="control-label radio-inline"> <input -->
<!-- 												type="radio" name="inlineRadioOptionsType" -->
<!-- 												id="inlineRadioOptionsType1" value="option1"> ถัง SCBA -->
<!-- 											</label> <label class=" control-label radio-inline"> <input -->
<!-- 												type="radio" name="inlineRadioOptionsType" -->
<!-- 												id="inlineRadioOptionsType2" value="option2"> หน้ากาก -->
<!-- 											</label> <label class=" control-label radio-inline"> <input -->
<!-- 												type="radio" name="inlineRadioOptionsType" -->
<!-- 												id="inlineRadioOptionsType3" value="option3"> ถังดับเพลิง -->
<!-- 											</label> <label class=" control-label radio-inline"> <input -->
<!-- 												type="radio" name="inlineRadioOptionsType" -->
<!-- 												id="inlineRadioOptionsType4" value="option4"> เครื่องแก๊ส -->
<!-- 											</label> <label class=" control-label radio-inline"> <input -->
<!-- 												type="radio" name="inlineRadioOptionsType" -->
<!-- 												id="inlineRadioOptionsType5" value="option4"> อื่นๆ <input -->
<!-- 												type="text" name="inlineRadioOptionsType" -->
<!-- 												id="inlineRadioOptionsType6" value="" placeholder="โปรดระบุ"> -->
<!-- 											</label> -->
<!-- 										</div> -->
<!-- 									</div> -->


<!-- 								</div> -->

								<div class="row"
									style="padding-left: 65px; padding-right: 65px;">
									<div class="col-lg-12">
										<div class="form-group">
											
<!-- 												<button type="button" -->
<!-- 													class="btn btn-box-tool btn-success btn-table" -->
<!-- 													data-toggle="modal" data-target="#myModal"> -->
<!-- 													<i class="fa fa-plus"></i> Add -->
<!-- 												</button> -->
                                        <div class="row">
                                        
                                        	<label for="paramCode" class="col-lg-2">เลือกอุปกรณ์ </label>
											<div class="col-lg-6">
												<select class="form-control" >
                                            		<option> 0252416246546546 </option>
                                            		<option> 0252416246546546 </option>
                                           		</select>
											</div>
                                          
                                            
                                        </div>	
                                        
                                        										
											<table class="table table-striped table-bordered">
												<thead>
													<tr>
														
														<th>หมายเลขอุปกณ์</th>
														<th>ซีรีนันเบอร์</th>
														<th>ประเภท</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														
														<td>0252416246546546</td>
														<td>AB556512</td>
														<td>xxx</td>
													</tr>
<!-- 													<tr> -->
<!-- 														<td>2.</td> -->
<!-- 														<td>546515951925</td> -->
<!-- 														<td>AS556512</td> -->
<!-- 														<td> -->
<!-- 															<button type="button" -->
<!-- 																class="btn btn-box-tool btn-warning btn-table" -->
<!-- 																data-toggle="modal" data-target="#myModal">Edit</button> -->
<!-- 															<button type="button" -->
<!-- 																class="btn btn-box-tool btn-danger btn-table">Delete</button> -->
<!-- 														</td> -->
<!-- 													</tr> -->
<!-- 													<tr> -->
<!-- 														<td>3.</td> -->
<!-- 														<td>54645645654</td> -->
<!-- 														<td>SSA4565</td> -->
<!-- 														<td> -->
<!-- 															<button type="button" -->
<!-- 																class="btn btn-box-tool btn-warning btn-table" -->
<!-- 																data-toggle="modal" data-target="#myModal">Edit</button> -->
<!-- 															<button type="button" -->
<!-- 																class="btn btn-box-tool btn-danger btn-table">Delete</button> -->
<!-- 														</td> -->
<!-- 														</td> -->
<!-- 													</tr> -->
												</tbody>
											</table>
										</div>
									</div>
								</div>


								<div class="row">
									
										
											<div class="col-lg-6 text-left">
												<button type="reset" onclick="window.location.href='ffe_requested_list.htm'" class="btn btn-default">&nbsp;กลับ</button>
												

												
											</div>
											
											<div class="col-lg-6 text-right">
												

												<button type="reset" class="btn btn-danger">ส่ง</button>

												&nbsp;&nbsp;
											</div>
											
										
								
								</div>
							</form>
						</fieldset>
					</div>
				</div>
			</div>
		</div>

	</section>
</div>



<script type="text/javascript">
$(function () {
  $('input[name="daterange"]').daterangepicker({
    opens: 'left',
    locale: {
          format: 'YYYY'
      }
  }, function (start, end, label) {
    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
  });
  $('input[name="monthinput"]').datepicker({
  autoclose: true,
  minViewMode: 1,
  format: 'MM/yyyy'
}).on('changeDate', function(selected){
      // startDate = new Date(selected.date.valueOf());
      // startDate.setDate(startDate.getDate(new Date(selected.date.valueOf())));
      // $('.to').datepicker('setStartDate', startDate);
  }); 
});
function clickSearch() {
  
  //document.getElementById("tabSarchResult").style.visibility = "visible"
  var companyName = $('select[name=companyname]').val();
  if (companyName=="TPAC"){
    $( "#tab_tpcc" ).addClass( "hidden" );
    $( "#tab_tpac" ).removeClass( "hidden" );

  }else{
    $( "#tab_tpac" ).addClass( "hidden" );
    $( "#tab_tpcc" ).removeClass( "hidden" );
  }
};

// $("#datepicker").datepicker({
//     format: "yyyy",
//     viewMode: "years", 
//     minViewMode: "years"
// });

$('#datetimepicker6').datepicker({
    format: "yyyy",
    viewMode: "years", 
    minViewMode: "years"
});
$('#datetimepicker7').datepicker({
    useCurrent: false, //Important! See issue #1075
    format: "yyyy",
    viewMode: "years", 
    minViewMode: "years"
});
$('#datetimepicker8').datepicker({
    format: "yyyy",
    viewMode: "years", 
    minViewMode: "years"
});
$("#datetimepicker6").on("dp.change", function (e) {
    $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
});
$("#datetimepicker7").on("dp.change", function (e) {
    $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
});


</script>
