<!DOCTYPE HTML>
<%@page import="java.util.Date"%>
<head th:fragment="common-include">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<title>LSP Dashboard</title>

<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>

<meta name="context-path" content="<%=request.getContextPath()%>/"/>
<% String ver = "?v=2.0"; %>

  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/dashboard/common/css/bootstrap.min.css"/>
  <!-- Ionicons -->
<%--   <link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/dashboard/common/theme/AdminLTE-2.4.2/bower_components/Ionicons/css/ionicons.min.css"/> --%>

 <!-- Morris chart -->
<%--   <link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/dashboard/common/theme/AdminLTE-2.4.2/bower_components/morris.js/morris.css"/> --%>
  <!-- Daterange picker -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/dashboard/common/css/daterangepicker.css"/>
  <!-- Select2 -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/dashboard/common/css/bootstrap-select.min.css"/>
  
   <!-- DataTables -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/dashboard/common/css/dataTables.bootstrap.min.css"/>
  
  <!-- Theme style -->
    <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/dashboard/common/css/skin-red.min.css"/>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/dashboard/common/css/AdminLTE.min.css"/>
  
  <link rel="stylesheet" type="text/css"  href="<%=request.getContextPath()%>/jsp/dashboard/common/css/dms-custom.css<%=ver%>"/>

  <link rel="stylesheet" type="text/css"  href="<%=request.getContextPath()%>/jsp/dashboard/common/css/font-awesome.min.css"/> 


<!-- jQuery 3 -->
<script src="<%=request.getContextPath()%>/jsp/dashboard/common/js/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="<%=request.getContextPath()%>/jsp/dashboard/common/js/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.7 -->
<script  src="<%=request.getContextPath()%>/jsp/dashboard/common/js/bootstrap.min.js"></script>
<script  src="<%=request.getContextPath()%>/jsp/dashboard/common/js/moment.min.js"></script>
<script  src="<%=request.getContextPath()%>/jsp/dashboard/common/js/daterangepicker.js"></script>
<script  src="<%=request.getContextPath()%>/jsp/dashboard/common/js/jquery.dataTables.min.js"></script>
<script  src="<%=request.getContextPath()%>/jsp/dashboard/common/js/dataTables.bootstrap.min.js"></script>
<!-- Select2 -->
<script src="<%=request.getContextPath()%>/jsp/dashboard/common/js/bootstrap-select.min.js"></script>

<script src="<%=request.getContextPath()%>/jsp/dashboard/common/js/loadingoverlay.min.js"></script>

<!-- ChartJS -->
<script src="<%=request.getContextPath()%>/jsp/dashboard/common/js/Chart.min.js"></script>

<!-- AdminLTE App -->
<script  src="<%=request.getContextPath()%>/jsp/dashboard/common/js/adminlte.min.js"></script>

<script src="<%=request.getContextPath()%>/jsp/dashboard/common/js/jquery.animateNumber.min.js"></script>
<script src="<%=request.getContextPath()%>/jsp/dashboard/common/js/Chart.PieceLabel.min.js"></script>
<script src="<%=request.getContextPath()%>/jsp/dashboard/common/js/date-time.js"></script>


<script th:inline="javascript">
//<![CDATA[
    var cPath = $('meta[name=context-path]').attr("content");
	var $roleEdit = true;
	var $roleDel = true;
	var _PageObj = {};
	var _TodayDate = new Date();
	
	_PageObj.blocker = function(){
		 $.blockUI({ css: { 
	            border: 'none', 
	            padding: '15px', 
	            backgroundColor: '#000', 
	            '-webkit-border-radius': '10px', 
	            '-moz-border-radius': '10px', 
	            opacity: .5, 
	            color: '#fff' 
	        } }); 
	};
	
	_PageObj.unblocker = function(){
		$.unblockUI();
	};
	
	_PageObj.sessionValid = function(){
		$.ajax({
//             url: cPath+"sessionValid?t="+_TodayDate.getTime()
		type: "POST",
	    	dataType: "json",
    		url: cPath+"JsonChannel?action=DashboardCommon&t="+_TodayDate.getTime(),
        }).done(function (result) {
//         	console.log(result);
            if(result['SUCCESS']=='1'){
            	$("#online-status").html('Online');
            	$("#online-status").addClass('bg-green');
            }else{
            	$("#online-status").html('Offline');
            	$("#online-status").removeClass('bg-green');
            	alert('Session time out !');
            	closeWindowNoPrompt();
            }
        }).fail(function (jqXHR, textStatus, errorThrown) { 
        	$("#online-status").html('Offline');
        	$("#online-status").removeClass('bg-green');
        	alert('Session time out !');
        	closeWindowNoPrompt();
		});
	    var time = setTimeout(function(){ _PageObj.sessionValid() }, 30000);
	    
 	};
	
 	
 	/* function toggleFullScreen(elem) {
 	    // ## The below if statement seems to work better ## if ((document.fullScreenElement && document.fullScreenElement !== null) || (document.msfullscreenElement && document.msfullscreenElement !== null) || (!document.mozFullScreen && !document.webkitIsFullScreen)) {
 	    if ((document.fullScreenElement !== undefined && document.fullScreenElement === null) || (document.msFullscreenElement !== undefined && document.msFullscreenElement === null) || (document.mozFullScreen !== undefined && !document.mozFullScreen) || (document.webkitIsFullScreen !== undefined && !document.webkitIsFullScreen)) {
 	        if (elem.requestFullScreen) {
 	            elem.requestFullScreen();
 	        } else if (elem.mozRequestFullScreen) {
 	            elem.mozRequestFullScreen();
 	        } else if (elem.webkitRequestFullScreen) {
 	            elem.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
 	        } else if (elem.msRequestFullscreen) {
 	            elem.msRequestFullscreen();
 	        }
 	    } else {
 	        if (document.cancelFullScreen) {
 	            document.cancelFullScreen();
 	        } else if (document.mozCancelFullScreen) {
 	            document.mozCancelFullScreen();
 	        } else if (document.webkitCancelFullScreen) {
 	            document.webkitCancelFullScreen();
 	        } else if (document.msExitFullscreen) {
 	            document.msExitFullscreen();
 	        }
 	    }
 	}
 	    
 	function maxWindow() {
 	    window.moveTo(0, 0);


 	    if (document.all) {
 	        top.window.resizeTo(screen.availWidth, screen.availHeight);
 	    }

 	    else if (document.layers || document.getElementById) {
 	        if (top.window.outerHeight < screen.availHeight || top.window.outerWidth < screen.availWidth) {
 	            top.window.outerHeight = screen.availHeight;
 	            top.window.outerWidth = screen.availWidth;
 	        }
 	    }
 	} */
 	function closeWindowNoPrompt()
 	{
	 	window.open('', '_parent', '');
	 	window.close();
 	}
	$(function () {
	      
		_StartDateTime();
		
		$("#online-status").html('Online');
    	$("#online-status").addClass('bg-green');
    	
		_PageObj.sessionValid();

	      
	});
	
	
//]]>		
</script>
 
</head>

<!-- <div th:with="skin_theme='skin-red'"/> -->
