var _itemLength = 10;
var _isOnline = false;
var _offlineTxt = 'ระบบออฟไลน์ : ใช้ประวัติการค้นหาข้อมูลล่าสุด';

var _confirmSaveTxt = 'Do you want to save?';
var _confirmDelTxt = 'Do you want to delete?';
var _successSaveTxt = 'Save Success!';
var _successDelTxt = 'Delete Success!';

var d = new Date();
var currMonth = d.getMonth();
var currYear = d.getFullYear();



function _loader(x) {
//	console.log('loader !!', x);
	if(x){
		 $.blockUI({ css: { 
	            border: 'none', 
	            padding: '10px', 
	            backgroundColor: '#000', 
	            '-webkit-border-radius': '10px', 
	            '-moz-border-radius': '10px', 
	            opacity: .5, 
	            color: '#fff' 
	        } }); 
			
	}else{
		
		$.unblockUI();
	}
	
//	setTimeout(function(){ // Wait 10 secound
//		$('#loader').modal('hide');
//	}, 500);
}

function _alert(txt) {
	bootbox.alert({
	    message: txt,
	    size: 'small'
    });
}

function _NotNullOrEmty(x) {
	return (!isNaN(x) && x!=null && x!='null' && x!='' );
}

function _NumberFormat(x) {
	return (!isNaN(x)&&x!=null)?  x.replace(/\B(?=(\d{3})+(?!\d))/g, ","): "0.00";
}

function _renderNumber(x) {
	return $.fn.dataTable.render.number( ',', '.', x );
}

function _checkOnline() {
	_isOnline = false;
	var url = cPath+'/resources/json/online_service.json?'+new Date().getTime();
	$.ajax({
	  type: "GET",
	  url: url,
	  async:false,
	  success: function(data){
		  _isOnline = data['status']==0? true:false;
	  },
	  error: function(XMLHttpRequest, textStatus, errorThrown) {
	  }
	});
	console.log(_isOnline? 'Online -->>': '<<-- Offline');
	if(_isOnline){
		$('#offline-status').hide();
    }else{
    	$('#offline-status').show();
    }
	return _isOnline;
}


function _getStatus(s) {
	var st = "<i class='fa fa-lg fa-hourglass-1 text-primary'></i>";
	if('1'==s){
		st = "<i class='fa fa-lg fa-check-square-o text-success'></i>";
	}else if('0'==s){
		st = "<i class='fa fa-lg fa-ban text-danger'></i>";
	}else if('Success'==s){
		st = "<i class='fa fa-check-square-o text-success'> Success</i> ";
	}else if('Error'==s){
		st = "<i class='fa fa-warning text-danger'> Error</i>";
	}else if('Waiting'==s){
		st = "<i class='fa fa-hourglass-1 text-primary'> Waiting</i>";
	}
	return st;
};


function JSONToCSVConvertor(JSONData, ReportTitle, ShowLabel) {
    //If JSONData is not an object then JSON.parse will parse the JSON string in an Object
    var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData) : JSONData;
    
    var CSV = '';    
    //Set Report title in first row or line
    
    CSV += ReportTitle + '\r\n\n';

    //This condition will generate the Label/Header
    if (ShowLabel) {
        var row = "";
        
        //This loop will extract the label from 1st index of on array
        for (var index in arrData[0]) {
            
            //Now convert each value to string and comma-seprated
            row += index + ',';
        }

        row = row.slice(0, -1);
        
        //append Label row with line break
        CSV += row + '\r\n';
    }
    
    //1st loop is to extract each row
    for (var i = 0; i < arrData.length; i++) {
        var row = "";
        
        //2nd loop will extract each column and convert it in string comma-seprated
        for (var index in arrData[i]) {
            row += '"' + arrData[i][index] + '",';
        }

        row.slice(0, row.length - 1);
        
        //add a line break after each row
        CSV += row + '\r\n';
    }

    if (CSV == '') {        
        alert("Invalid data");
        return;
    }   
    
    //Generate a file name
    var fileName = "";
//    var fileName = "MyReport_";
//    this will remove the blank-spaces from the title and replace it with an underscore
    fileName += ReportTitle.replace(/ /g,"_");   
    
    //Initialize file format you want csv or xls
    var uri = 'data:text/csv;charset=utf-8,' + escape(CSV);
    
    // Now the little tricky part.
    // you can use either>> window.open(uri);
    // but this will not work in some browsers
    // or you will not get the correct file extension    
    
    //this trick will generate a temp <a /> tag
    var link = document.createElement("a");    
    link.href = uri;
    
    //set the visibility hidden so it will not effect on your web-layout
    link.style = "visibility:hidden";
    link.download = fileName + ".csv";
    
    //this part will append the anchor tag and remove it after automatic click
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}


function removeLastComma(strng){        
    var n=strng.lastIndexOf(",");
    var a=strng.substring(0,n) 
    return a;
}



$(document).ready(function(){
	console.log('#### Application Start !!! ####');
	
    $(document).ajaxStart(function () {
    	_loader(true);
    });

    $(document).ajaxStop(function () {
    	_loader(false);
    });
	
    $(document).ajaxComplete(function(e, xhr, settings){
    	  if (xhr.getResponseHeader('REQUIRES_AUTH') == '1') {
    		  window.location = cPath+'/login.htm?sout=Session Time Out !';
    	  } 
    });
    
    $(".number").on("keypress keyup blur",function (event) {
        //this.value = this.value.replace(/[^0-9\.]/g,'');
    	$(this).val($(this).val().replace(/[^0-9\.]/g,''));
        if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
            event.preventDefault();
        }
    });
    
    
//    $(".readonly").on('keydown paste', function(e){
//        e.preventDefault();
//    });
    
//	localStorage.clear();
	
//	_checkOnline();
//    var refreshId = setInterval( function(){
//    	_checkOnline();
//    }, 10000);
});