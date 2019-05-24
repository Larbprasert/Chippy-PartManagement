
//$(function() {
	

	$('.date').datepicker({
		   format : 'dd/mm/yyyy'
//		   update : new Date()
	});
	
//	$("#createDate").datepicker("update", new Date());
	
	_PageObj.searchTable = $("#searchResult").DataTable({
		ordering: false,
		autoWidth: false,
		data:[],
//		"searching" : false,
//		"scrollX": true,
		columns : [
		           {
//			"data" : "id",
//			orderable : false,
//			className : 'select-checkbox',
//			"render": function ( data, type, row ) {
//				return _getStatus;
//			}
//		}, {
			"data" : "status",
//			"width": "5px",
			"render": function ( data, type, row ) {
				return _getStatus(data);
			}
		}, {
			"data" : "htmlTitle",
//			"width": "50px"
		}, {
			"data" : "link",
//			"width": "20px",
			"render": function ( data, type, row ) {
				var len  = 40;
				if(data && data.length > len){
					data = data.substring(0,len) + "...";
				}
				return "<a href='javascript:void(0);' onclick=\"openModal('"+row.id+"','" +row.link+"')\"  >"+data+"</a>";
			}
		}, {
			"data" : "ipApi.countryCode",
			"width": "50px"
		}, {
			"data" : "ipApi.query",
			"width": "50px"
		}, {
			"data" : "createDateStr",
			"width": "50px"
		}, {
			"data" : "link",
//			"width": "20px",
			"render": function ( data, type, row ) {
                var btn = '<button  type="button" class="btn btn-primary" ' + 
                				' onclick="openActionModal(\'' + row.id  +'\', \'' + row.status  +'\',\'' + row.comment  +'\' )" ' + 
							' >  <i class="fa fa-flag"></i></button>';
                
                return btn;
            }
		}, {
			"data" : "link",
//			"width": "20px",
			"render": function ( data, type, row ) {
				
				var btn = '';
				
				if(_NotNullOrEmty(row.snapshotId)){
					 btn = '<button  type="button" class="btn btn-success" ' + 
//						' data-toggle="modal" data-target="#myModal" ' + 
						' onclick="openImage(\'' + row.snapshotId  +'\')" ' + 
						' >  <i class="fa fa-image"></i></button>';
//				}else{
//					btn = '<button  type="button" class="btn btn-info" ' + 
////					' data-toggle="modal" data-target="#myModal" ' + 
//					' onclick="_PageObj.snapScreen(\''+row.id+'\', \'' + data+'\' )" ' + 
//					' >  <i class="fa fa-camera"></i></button>';
				}
				
				return btn;
			}
		} 
		],
	    "aoColumnDefs": [
	      { "sClass": "text-center", "aTargets": [0,3,4,5,6,7] }
	    ]
//		select : {
//			style : 'os',
//			selector : 'td:first-child'
//		}
	});
	
	

	_PageObj.search = function() {
		_PageObj.blocker();
		

		var params = {
			categoryCode : $("#category").val(),
			subCatCode : $("#sub-category").val(),
			keywordCode : $("#keyword").val(),
			title : $("#title").val(),
			createDateStr : $("#createDate").val(),
			status : $("#status").val()

		};
		
		$.post(cPath+"search/searchData", params ).done(function(responeJson) {
			var json = JSON.parse(responeJson);
			_PageObj.responeJson = json;
			_PageObj.searchTable.clear().draw();
			if(json.recordsTotal>0){
	            _PageObj.searchTable.rows.add(json.data).draw();
            }else{
            	bootbox.alert({
				    message: "No Data Found!",
				    size: 'small'
				});
            }
		}).fail(function() {
			console.log("error");
			_PageObj.blocker();
		}).always(function() {
			console.log("finished");
			_PageObj.unblocker();
		});
	};
	
	_PageObj.snapScreen = function(rid,url) {
//		console.log(rid);
//		console.log(url);
		_PageObj.blocker();
		var params = {
			id: rid,
			url: url
		};
		
		$.post(cPath+"snapshot/saveSnapshot", params )
		.done(function(responeJson) {
	        bootbox.alert({
			    message: "Snap Success!!",
			    size: 'small'
	        });
	        
	        _PageObj.search();
		}).fail(function() {
			_PageObj.unblocker();
		}).always(function() {
			_PageObj.unblocker();
		});
		
	};
	
	_PageObj.snapScreen2 = function() {
		$("#myModal").modal('hide');
		_PageObj.blocker();
		var params = {
			id: _PageObj.rid,
			url: _PageObj.url
		};
		console.log(params);
		
		$.post(cPath+"snapshot/saveSnapshot", params )
		.done(function(responeJson) {
	        bootbox.alert({
			    message: "Snap Success!!",
			    size: 'small'
	        });
	        _PageObj.search();
		}).fail(function() {
			_PageObj.unblocker();
		}).always(function() {
			_PageObj.unblocker();
		});
		
	};
	
	// click
	$("#searchButton").click(_PageObj.search);
	
	$("#snapBtn").click(_PageObj.snapScreen2);
	
	$("#runButton").click(_PageObj.autoRun);
	
	$("#saveActionBtn").click(doSaveAction);
	
//	_PageObj.search();
//});

function openModal(rid, url) {
	_PageObj.url = url;
	_PageObj.rid = rid;
	
	if(url.indexOf('youtube')>0){
		var ifr ='<iframe id="existing-iframe-example" width="640" height="360" '+
			' src="'+url+'&enablejsapi=1&videoEmbeddable=true" '+
			'frameborder="0" style="border: solid 4px #37474F" sandbox="allow-same-origin allow-scripts" ></iframe> ';
//		var ifr = '<iframe src="'+url+'&enablejsapi=1" frameborder="0" width="100%" height="500" '+
//		' style="overflow:hidden" sandbox="allow-same-origin allow-scripts"></iframe>';
		$("#div-url").html(ifr);
	}else{
		var ifr = '<iframe src="'+url+'" frameborder="0" width="100%" height="500" '+
		' style="overflow:hidden" sandbox="allow-same-origin allow-scripts"></iframe>';
		$("#div-url").html(ifr);
	}
	$("#myModal").modal('show');
	return false;
}

function openNewPage() {
//	window.open(cPath+"snapshot/snapshot?url="+_PageObj.url);
	// window.open(_PageObj.url);
	
	var popup = window.open(_PageObj.url, "popup", "fullscreen");
	if (popup.outerWidth < screen.availWidth
			|| popup.outerHeight < screen.availHeight) {
		popup.moveTo(0, 0);
		popup.resizeTo(screen.availWidth, screen.availHeight);
	}
	  
}

function openImage(id) {
//	window.open(cPath+"snapshot/get/"+id);
//	 window.open(_PageObj.url);
	$("#img_u").attr("src",cPath+"snapshot/get/"+id);
	$("#lightbox").modal('show');
	
//	var popup = window.open(_PageObj.url, "popup", "fullscreen");
//	if (popup.outerWidth < screen.availWidth
//			|| popup.outerHeight < screen.availHeight) {
//		popup.moveTo(0, 0);
//		popup.resizeTo(screen.availWidth, screen.availHeight);
//	}
	
}

function openActionModal(rid, status, comment) {
	$("#actionModal").modal('show');
	$("#comment").val("");
	$("#rid").val(rid);
	if(_NotNullOrEmty(status)){
		$("#rstatus"+status).prop('checked', true);
	}else{
		$("#rstatusP").prop('checked', true);
	}
	
	if(_NotNullOrEmty(comment)){
		$("#comment").val(comment);
	}
}

function doSaveAction(){
	bootbox.confirm({
	    title: "Confirm",
	    size: 'small',
	    message: _confirmSaveTxt,
	    buttons: {
	        cancel: {
	            label: '<i class="fa fa-times"></i> Cancel'
	        },
	        confirm: {
	            label: '<i class="fa fa-check"></i> Confirm',
	            className: 'btn-success'
	        }
	    },
	    callback: function (result) {
	        if(result){
	        
	        	$.post(cPath+"search/updateStatus", {
	        		status : $("input[name=rstatus]:checked").val(),
	    			comment : $("#comment").val(),
	    			id : $("#rid").val()
	    		}).done(function(responeJson) {
//	    			 bootbox.alert({
//    				    message: _successSaveTxt,
//    				    size: 'small'
//    				});
	    			 
    				$("#actionModal").modal('hide');
    	        	_PageObj.search();
    	        	
	    		}).always(function() {
//	    			_PageObj.unblocker();
	    		});
	        	
//	        	$('#formAction').submit();
	        }
	    }
	});
};



