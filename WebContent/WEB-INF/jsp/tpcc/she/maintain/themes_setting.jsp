<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

	<%@include file="/resources/adminLTE/common.jsp" %>
 
     <link rel="stylesheet" href="${cPath}/resources/css/datepicker.css">
	<script src="${cPath}/resources/js/bootstrap-datepicker.js"></script>
	<script src="${cPath}/resources/js/bootstrap-table.js"></script>
	
</head>

<body>

	<!--  --- MENU --- -->
	<%@include file="/WEB-INF/jsp/tpcc/she/menu.jsp" %>



	<div class="container">

		<div class="page-header">
			<div class="row">
				<br>
				<div class="col-lg-8 col-md-7 col-sm-6">
					<h2>Themes Setting </h2>
				</div>
			</div>
		</div>
		
		<div class="section-preview">
	      <div class="container">
	        <div class="row" id="pre-themes"> 
	
	        </div>
	      </div>
	    </div>

	</div>
	

	<!-- Modal -->
	<div class="modal fade" id="saveModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="confirm-hdr">Confirm</h4>
	      </div>
	      <div class="modal-body" id="confirm-txt">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" onclick="confirmSave();">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
 
	<script>
   
		var pret = '  <div class="col-lg-4 col-sm-6"><div class="preview">  '
        +'  <div class="image text-center"><a href="#">               '
		+'  <img src="'+cPath+'/resources/themes/{{img}}"  class="img-responsive" >    '
		//+'<h2 class="hid-txt center">A Movie in the Park:</h2>  '
		+'</a></div>            '
        +'  <div class="options text-center">'
//         +'  <h3>{{name}}</h3>          '
        +'  <h4>{{desc}}</h4> '
		+' <div class="btn-group" id="btn-{{id}}" > '
// 		+' <a   class="btn btn-info" href="#" onclick="loadTheme(\'{{theme}}\');" > Preview </a>  '
		+'  <a  class="btn btn-danger" href="#" onclick="saveTheme(\'{{theme}}\');" >Used This Theme</a>  '
		+'  </div></div></div> 	';
		
		
		function loadTheme(theme){
		   
		   $("#link-theme").attr("href", cPath+'/resources/themes/'+theme+"/bootstrap.min.css");

		   console.log("Theme : ",cTheme,theme);
		   
		   $('#btn-'+cTheme).show();
		   $('#btn-'+theme).hide();
		   cTheme = theme;
		   
		};		
		
		function saveTheme(theme){
		   console.log("Theme : ",cTheme,theme);
		   cTheme = theme;
		   $('#saveModal').modal('toggle');
		   $('#confirm-txt').html('Do you want to used this ['+theme+'] theme ? ');
// 		   $('#confirm-txt').html('Please logout and login again to see the change !');
		   
		};		
		
		function confirmSave(){
		   console.log("confirmSave Theme : ",cTheme);
		   $.getJSON(cPath+"/maintain/updateTheme?theme="+cTheme, function (data) {
		   		window.location.reload(true);
		   });
		};		
		
		$.getJSON(cPath+"/resources/json/themes.json", function (data) {
		  var themes = data.themes; 
		  
// 		  var select = $("#select-themes"); 
		  var preTheme = $("#pre-themes"); 
		  themes.forEach(function(value, index){
			
			var tx = pret.replace("{{url}}",value.css).replace("{{id}}", value.css);
			tx = tx.replace("{{img}}",value.thumbnail).replace("{{theme}}", value.css);
			tx = tx.replace("{{desc}}",value.description);
			preTheme.append(tx);
			
		  });
		  
		  
		  $('#btn-'+cTheme).hide();
		   
// 		   pleaseWaitDiv.modal('hide');
//
		}, "json").fail(function(){
			$(".alert").toggleClass("alert-info alert-danger");
			$(".alert h4").text("Failure!");
// 			pleaseWaitDiv.modal('hide');
		});

   </script>

</body>

</html>